class FragmentPdf < Prawn::Document
    def initialize (fragment)
        super(top_margin: 70)
        @fragment = fragment
        stile
        title
        introduction
        content
        likes_and_dislikes
        source
        photo
    end

    def stile
        move_up 40
        span(510, :position => :center) do
            text "LUCKYREAD"
        end
    end

    def title
        move_down 40
        span(200, :position => :center) do
            text "  #{@fragment.title}", size: 40, sytle: :bold
        end
        stroke do 
            rounded_rectangle [0, 800], 100, 100, 20
        end
    end

    def introduction
        move_down 40
        text "INTRODUCTION:"
        span(400, :position => :center) do
            text " #{@fragment.introduction}"
        end
    end

    def content
        move_down 20
        text "CONTENIDO:"
        span(400, :position => :center) do
            text " #{@fragment.content}"
        end
    end

    def source
        move_down 100
        span(160, :position => :right) do
            text "REFERENCIA:"
            text " #{@fragment.source}"
        end
    end
    
    def photo
        @link = Photo.find(@fragment.photos_id).path
        #image open(@link) #:width => 150
    end

    def likes_and_dislikes
        text "Likes:"
        @Likes = Reaction.likes(@fragment.id)
        text " #{@Likes}"
        text "Dislikes:"
        @Dislikes = Reaction.dislikes(@fragment.id)
        text " #{@Dislikes}"
    end

    def topics
        text
    end
end