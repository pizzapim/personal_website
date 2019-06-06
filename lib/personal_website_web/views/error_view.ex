defmodule PersonalWebsiteWeb.ErrorView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView

  def render("500.html", _assigns) do
    "500: Internal Server Error"
  end

  def render("404.html", _assigns) do
    "404: Page not found"
  end

  def get_title("404.html", _assigns) do
    LayoutView.get_title("Page not Found")
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
