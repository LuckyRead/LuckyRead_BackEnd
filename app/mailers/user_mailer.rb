class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Bienvenido a LuckyRead')
    end

    def change_photo(user)
      @user = user
      mail(to: @user.email, subject: 'Su foto de perfil ha sido cambiada')
    end

    def change_password(user, URL)
      @user = user
      @URL = URL
      mail(to: @user.email, subject: 'Solicitud de cambiar su contraseña')
    end
end