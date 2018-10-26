class FragmentPdf < Prawn::Document
    def initialize (fragment)
        super(top_margin: 70)
        @fragment = fragment
        title
        introduction
        content
        source
        photo
    end

    def title
        move_down 40
        span(400, :position => :right) do
            text "  #{@fragment.title}", size: 40, sytle: :bold
        end
    end

    def introduction
        move_down 20
        span(400, :position => :center) do
            text " #{@fragment.introduction}"
        end
    end

    def content
        move_down 20
        span(400, :position => :center) do
            text " #{@fragment.content}"
        end
    end

    def source
        move_down 20
        span(400, :position => :center) do
            text " #{@fragment.source}"
        end
    end
    
    def photo
        @link = Photo.find(@fragment.photos_id).path
        text @link
        #image open(@link) :width => 150
    end

    def likes_and_dislikes
        text
    end

    def topics
        text
    end
end