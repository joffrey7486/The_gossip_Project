class SessionsController < ApplicationController
    def new
        
    end

    def create
        puts "#"*80
        puts params
        # cherche s'il existe un utilisateur en base avec l’e-mail
        user = User.find_by(email: params[:email])
      
        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          # redirige où tu veux, avec un flash ou pas
            puts 'Tu as réussi'
            redirect_to root_path
        else
          flash.now[:danger] = 'Invalid email/password combination'
          puts "Tu es un caca"
          render 'new'
        end
      end
      
    def destroy
        puts "#"*80
        puts session
        session.delete(:user_id)
        redirect_to root_path
    end
end

