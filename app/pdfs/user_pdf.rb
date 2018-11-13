class UserPdf < Prawn::Document
    def initialize (user)
        super(top_margin: 70)
        @user = user
        name
    end

    def name
        text "Nombre #{@user.name}", zise: 50, sytle: :bold
    end
end