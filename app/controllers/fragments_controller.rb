class FragmentsController < ApplicationController
  before_action :set_fragment, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:new, :create, :update, :destroy, :something]

  def by_topic 
    @array = []
    @query1 = SubTopicsTopic.where('topic_id = ?', params[:id]).pluck('sub_topic_id')
    @query1.each do |it|
      @query2 = RelFragmentSubTopic.where('sub_topics_id = ?', it).pluck('fragments_id')
      @query2.each do |jt|
        @fragment = Fragment.find(jt)
        if @fragment.photos_id.nil?
          @array.push({
            id: @fragment.id,
            title: @fragment.title,
            introduction: @fragment.introduction,
            content: @fragment.content,
            score: @fragment.score,
            source: @fragment.source,
            base64_image: Photo.find(24).base64_image
          })
        else
          @array.push({
            id: @fragment.id,
            title: @fragment.title,
            introduction: @fragment.introduction,
            content: @fragment.content,
            score: @fragment.score,
            source: @fragment.source,
            base64_image: Photo.find(@fragment.photos_id).base64_image
          })
        end
      end
    end
    render json: {topic: Topic.find(params[:id]).topic_name, fragments: @array}
  end

  def random_f
    @query1 = SubTopicsTopic.where('topic_id = ?', params[:id]).pluck('id')
    @array = []
    if @query1 == []
      render json: {error: 'There are not topic with this id'}, status: :conflict
    else
      @query1.each do |i|
        @query2 = RelFragmentSubTopic.where('sub_topics_id = ?', i).pluck('fragments_id')
        @query2.each do |j|
          @array.push(j)
        end
      end
      @fragment = Fragment.find(@array[Faker::Number.between(0, (@array.length - 1))])
      render json: {Fragment: {
        id: @fragment.id,
        title: @fragment.title,
        introduction: @fragment.introduction,
        content: @fragment.content,
        score: @fragment.score,
        source: @fragment.source,
        topics: Fragment.topicsUnderFragment(@fragment.id).uniq,
        base64_image: Photo.find(@fragment.photos_id).base64_image
      }}
    end
  end

  def new
    @user = current_user
    if !params.has_key?(:title)
      render json: {error: "Request hasn't title attribute"}, status: :bad_request
      return
    end
    if !params.has_key?(:introduction)
      render json: {error: "Request hasn't introduction attribute"}, status: :bad_request
      return
    end
    if !params.has_key?(:content)
      render json: {error: "Request hasn't content attribute"}, status: :bad_request
      return
    end
    if !params.has_key?(:source)
      render json: {error: "Request hasn't source attribute"}, status: :bad_request
      return
    end
    if !params.has_key?(:sub_topics_id)
      render json: {error: "Request hasn't sub_topics_id attribute"}, status: :bad_request
      return
    end
    if !params.has_key?(:image_id)
      render json: {error: "Request hasn't image_id attribute"}, status: :bad_request
      return
    end
    @f = Fragment.create!(
      title: params[:title],
      introduction: params[:introduction],
      content: params[:content],
      score: 0,
      source: params[:source],
      users_id: @user.id,
      photos_id: params[:image_id]
    )
    @array = []
    params[:sub_topics_id].each do |it|
      if SubTopic.where('id = ?', it) == []
        next
      end
      RelFragmentSubTopic.create!(
        fragments_id: @f.id,
        sub_topics_id: it
      )
      @array.push(SubTopic.find(it).sub_topic_name)
    end
    render json: {new_fragment_was_uploaded: @f, sub_topics: @array}, status: :created
  end

  def something
    @user = current_user
    @array = Fragment.Fragmentsubtopicwithprefecensuser(@user.id)
    if @array == []
      render json: {error: 'User does not have any preference'}, status: :precondition_failed
    else
      @to_show = @array[Faker::Number.between(0, (@array.length - 1))]
      @fragment = {
        :id => @to_show[0],
        :title => @to_show[1],
        :introduction => @to_show[2],
        :content => @to_show[3],
        :score => @to_show[4],
        :source => @to_show[5],
        :topics => Fragment.topicsUnderFragment(@to_show[0]).uniq,
        :base64_image => Photo.find(@to_show[6]).base64_image
      }
      render json: @fragment, status: :ok
    end
  end

  # GET /fragments
  def index
    @fragments = Fragment.all.paginate(page: params[:page], per_page: 10)
    @array = []
    @fragments.each do |f|
      @hash = {
        :tile => f.title,
        :introduction => f.introduction,
        :content => f.content,
        :score => f.score,
        :source => f.source,
        :users_id => f.users_id,
        :base64_image => Photo.find(f.photos_id).base64_image
      }
      @array.push(@hash)
    end
    render json: @array
  end

  # GET /fragments/1
  def show
    @fragment = Fragment.find(params[:id])
    @id = params[:id]
    @allreaction = Reaction.allreactionafragment(@id)
    @likesreaction = BigDecimal(Reaction.reactionlikesafragment(@id)*100/@allreaction)
    @dislikesallreaction = BigDecimal(Reaction.reactiondislikesafragment(@id)*100/@allreaction)
    @noureaction = BigDecimal(Reaction.reactionnoulikesafragment(@id)*100/@allreaction)
    arrayFragmentsreaction = []
    hash1 = {:percentagelikes => @likesreaction.round, :percentagedislikes => @dislikesallreaction.round, :percentagenoreaction => @noureaction.round}#:allreactions => @allreaction,
    hash2 = {
      :id => @fragment.id,
      :title => @fragment.title,
      :introduction => @fragment.introduction,
      :content => @fragment.content,
      :score => @fragment.score,
      :source => @fragment.source,
      :topics => Fragment.topicsUnderFragment(params[:id]).uniq,
      :base64_image => Photo.find(@fragment.photos_id).base64_image
    }
    arrayFragmentsreaction.push(hash1)
    arrayFragmentsreaction.push(hash2)
    render json: arrayFragmentsreaction, status: :ok
    #render json: , status: :ok
  end

  def showpdf
    @fragment = Fragment.find_by(id: params[:id])
    respond_to do |format|   
      format.html   
      format.pdf do
        pdf = FragmentPdf.new(@fragment)
        send_data pdf.render, filename: "export.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # POST /fragments
  def create
    @fragment = Fragment.new(fragment_params)

    if @fragment.save
      render json: @fragment, status: :created, location: @fragment
    else
      render json: @fragment.errors, status: :unprocessable_entity
    end
  end

  def new_fragments
    arrayFragments = []
    Fragment.fragmentold.each do |id|
      hash2 = {:fragment_id => Fragment.find_by(id: id).id}
      arrayFragments.push(hash2)
    end 
    render json: arrayFragments, status: :ok
  end

  def likes_fragments
    arrayFragmentslikes = []
    Reaction.fragmentslikes.each do |reactions_fragments_id, count_all|
      hash2 = {:fragment_id => reactions_fragments_id, :count_all => count_all}
      arrayFragmentslikes.push(hash2)
    end 
    render json: arrayFragmentslikes, status: :ok
  end

  def dislikes_fragments
    arrayFragmentsdislikes = []
    Reaction.fragmentsdisklikes.each do |reactions_fragments_id, count_all|
      hash2 = {:fragment_id => reactions_fragments_id, :count_all => count_all}
      arrayFragmentsdislikes.push(hash2)
    end 
    render json: arrayFragmentsdislikes, status: :ok
  end

  def percentage_reaction_fragments
    @id = params[:id]
    @allreaction = Reaction.allreactionafragment(@id)
    @likesreaction = BigDecimal(Reaction.reactionlikesafragment(@id)*100/@allreaction)
    @dislikesallreaction = BigDecimal(Reaction.reactiondislikesafragment(@id)*100/@allreaction)
    @noureaction = BigDecimal(Reaction.reactionnoulikesafragment(@id)*100/@allreaction)
    arrayFragmentsreaction = []
    hash1 = {:percentagelikes => @likesreaction.round, :percentagedislikes => @dislikesallreaction.round, :percentagenoreaction => @noureaction.round}#:allreactions => @allreaction,
    arrayFragmentsreaction.push(hash1)
    render json: arrayFragmentsreaction, status: :ok
  end

  def five_fragments_more_percentage_likes
    arrayFiveFragments = []
    Reaction.fragmentslikes.each do |reactions_fragments_id, count_all|
      Reaction.allfragmentslikes.each do |reactions_fragments_id2, count_all2|
        if reactions_fragments_id == reactions_fragments_id2
          @percentage = count_all*100/count_all2
          @fragment = Fragment.find(reactions_fragments_id)
          hash1 = {Fragment: {
            id: @fragment.id,
            title: @fragment.title,
            introduction: @fragment.introduction,
            content: @fragment.content,
            score: @fragment.score,
            source: @fragment.source,
            topics: Fragment.topicsUnderFragment(@fragment.id).uniq,
            base64_image: Photo.find(@fragment.photos_id).base64_image
            count_all => @percentage
          }}
          arrayFiveFragments.push(hash1)
        end
      end
    end
    arrayFiveFragmentsend = arrayFiveFragments.sort_by{|e| -e[:count_all]}.first(5)
    render json: arrayFiveFragmentsend, status: :ok
  end

  # PATCH/PUT /fragments/1
  def update
    if @fragment.update(fragment_params)
      render json: @fragment
    else
      render json: @fragment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fragments/1
  def destroy
    @fragment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fragment
      @fragment = Fragment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fragment_params
      params[:fragment].permit(:title, :introduction, :content, :source, :users_id)
    end
end
