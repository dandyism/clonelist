class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    oauthorize "Facebook"
  end

  def oauthorize(kind)
    @user = find_for_oauth(kind, ENV["omniauth.auth"], current_user)

    if @user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: kind
      session["devise.#{kind.downcase}_data"] = ENV["omniauth.auth"]
      sign_in_and_redirect @user, event: :authentication
    end
  end

  def find_for_oauth(kind, access_token, current_user)
    user, email, uid, auth_attr = nil, nil, nil, {}
    first_name, last_name = nil, nil

    case provider
    when "Facebook"
      uid = access_token[:uid]
      email = access_token[:info][:email]
      first_name = access_token[:info][:first_name]
      last_name = access_token[:info][:last_name]

      auth_attr = {
        uid: uid,
        token: access_token[:credentials][:token],
        link: access_token[:info][:urls][:Facebook],
        provider: "Facebook",
        secret: nil
      }
    end

    if resource.nil?
      user = find_for_oauth_by_uid(uid, provider)
      user ||= find_for_oauth_by_email(email)
      user ||= find_for_oauth_by_name(first_name, last_name)
      user ||= create_user_for_oauth(email, first_name, last_name)
    else
      user = resource
    end

    auth = user.authorizations.find_by(provider: provider)
    auth ||= user.authorizations.new
    auth.update(auth_attr)

    return user
  end

  def find_for_oauth_by_uid(uid, provider)
    auth = Authorizations.find_by(uid: uid, provider: provider)
    auth.try(:user)
  end

  def find_for_oauth_by_email(email)
    User.find_by(email: email)
  end

  def find_for_oauth_by_name(first_name, last_name)
    User.find_by(first_name: first_name, last_name: last_name)
  end

  def create_user_for_oauth(email, first_name, last_name)
    User.create!(
      email: email,
      first_name: first_name,
      last_name: last_name,
      password: Devise.friendly_token[0,20]
    )
  end
end
