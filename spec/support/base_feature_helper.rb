module BaseFeatureHelper
  def sign_in_as(email:, password:)
    visit(new_session_url(host: ENV["HOST"], subdomain: Tenant.current.subdomain))
    fill_in("email", with: email)
    fill_in("password", with: password)
    click_on("new_session_commit")
  end
end
