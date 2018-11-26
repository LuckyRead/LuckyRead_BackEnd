class UserMailer < ActionMailer::Base
  default from: 'LuckyreadIS20182@gmail.com'

    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Bienvenido a LuckyRead',
      template_path: 'user_mailer',
      template_name: 'welcome_email')
    end

    def change_photo(user)
      @user = user
      mail(to: @user.email, subject: 'Su foto de perfil ha sido cambiada',
      template_path: 'user_mailer',
      template_name: 'change_photo')
    end

    def change_password(user, url)
      @user = user
      @URL = url
      mail(to: @user.email, subject: 'Solicitud de cambiar su contraseña',
      template_path: 'user_mailer',
      template_name: 'change_password')
    end

    def notificate(user, fragment)
      @user = user
      @fragment = fragment
      mail(to: @user.email, subject: 'Fragmento del día',
      template_path: 'user_mailer',
      template_name: 'notificate')
    end
end