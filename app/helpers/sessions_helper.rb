module SessionsHelper

  def remember(user)
    puts "#"*80
    puts "Je suis dans le module SessionHelper, fonction remember"
    puts "#"*80
    # ici je vais créer un remember_token qui est une suite aléatoire de caractères
    remember_token = SecureRandom.urlsafe_base64
  
    # j'ai mon token, je vais stocker son digest en base de données :    
    user.remember(remember_token)
  
    #  maintenant, je vais créer les cookies : un cookie qui va conserver l'user_id, et un autre qui va enregistrer le remember_token
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = remember_token
  end

  def forget(user)
    user.update(remember_digest: nil) # Remet le remember_digest de user à nil
    cookies.delete(:user_id) # on efface les cookies dans le navigateur de l'utilisateur
    cookies.delete(:remember_token)
  end
  
  def log_out(user)
    session.delete(:user_id)
    forget(user)
  end

end
