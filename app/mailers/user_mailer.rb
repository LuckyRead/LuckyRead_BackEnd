class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Bienvenido a LuckyRead')
    end

    def change_photo(user)
      @user = user
      mail(to: @user.email, subject: 'Su foto de perfil ha sido cambiada')
    end
end