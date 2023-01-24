class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_for_google_oauth(request.env["omniauth.auth"])
    # Если юзер есть, то логиним и редиректим на его страницу
    if @user.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", kind: "Vkontakte")
      sign_in_and_redirect @user, event: :authentication
    # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = I18n.t(
        "devise.omniauth_callbacks.failure",
        kind: "Vkontakte",
        reason: "authentication error"
      )

      redirect_to root_path
    end
  end

  def github
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_for_github_oauth(request.env["omniauth.auth"])

    # Если юзер есть, то логиним и редиректим на его страницу
    if @user.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", kind: "Github")
      sign_in_and_redirect @user, event: :authentication
    # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = I18n.t(
        "devise.omniauth_callbacks.failure",
        kind: "Github",
        reason: "authentication error"
      )

      redirect_to root_path
    end
  end
end
