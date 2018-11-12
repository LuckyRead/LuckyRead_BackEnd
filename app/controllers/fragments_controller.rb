class FragmentsController < ApplicationController
  before_action :set_fragment, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:create, :update, :destroy, :something]

  def something
    @user = current_user
    array = Fragment.Fragmentsubtopicwithprefecensuser(@user.id)
    if array.nil?
      render json: {error: 'User does not have any preference'}, status: :precondition_failed
    else
      @to_show = array[Faker::Number.between(0, (array.length - 1))]
      if @to_show.nil?
        @to_show = Fragment.find(Faker::Number.between(0, (Fragment.all.length - 1)))
        @h1 = {:id => @to_show.id, :title => @to_show.title, :introduction => @to_show.introduction, :content => @to_show.content, :score => @to_show.score, :source => @to_show.source, :image_path => Photo.find(@to_show.photos_id).path}
        render json: @h1, status: :ok
      else 
        @h1 = {:id => @to_show[0], :title => @to_show[1], :introduction => @to_show[2], :content => @to_show[3], :score => @to_show[4], :source => @to_show[5], :image_path => @to_show[6]}
        render json: @h1, status: :ok
      end
    end
  end

  # GET /fragments
  def index
    @fragments = Fragment.all.paginate(page: params[:page], per_page: 10)
    array = []
    @fragments.each do |f|
      h1 = {:tile => f.title, :introduction => f.introduction, :content => f.content, :score => f.score, :source => f.source, :users_id => f.users_id, :photo_url => Photo.find(f.photos_id).path}
      array.push(h1)
    end
    render json: array
  end

  # GET /fragments/1
  def show
    @h1 = {:id => @fragment.id, :title => @fragment.title, :introduction => @fragment.introduction, :content => @fragment.content, :score => @fragment.content, :source => @fragment.source, :image_path => Photo.find(@fragment.photos_id).path}
    render json: @h1, status: :ok
  end

  def showpdf
    @fragment = Fragment.find(params[:id])
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
    hash1 = {:percentagelikes => @likesreaction, :percentagedislikes => @dislikesallreaction, :percentagnoreaction => @noureaction}#:allreactions => @allreaction,
    arrayFragmentsreaction.push(hash1)
    render json: arrayFragmentsreaction, status: :ok
  end

  def five_fragments_more_percentage_likes
    arrayFiveFragments = []
    Reaction.fragmentslikes.each do |reactions_fragments_id, count_all|
      Reaction.allfragmentslikes.each do |reactions_fragments_id2, count_all2|
        if reactions_fragments_id == reactions_fragments_id2
          @percentage = count_all*100/count_all2
          hash1 = {:fragment_id => reactions_fragments_id, :count_all => @percentage}
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
