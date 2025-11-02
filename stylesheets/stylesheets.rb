Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_stylesheets
  setup_extras_css
  setup_layout_css
  setup_auth_css
  setup_site_nav_css
  setup_toast_css
  setup_dropdown_css
  setup_simple_form_css

  append_to_file "app/assets/stylesheets/application.css", <<~CSS
    @import url("https://cdn.simplecss.org/simple.min.css");
    @import url("extras.css");
    @import url("layout.css");
    @import url("auth.css");
    @import url("site-nav.css");
    @import url("toast.css");
    @import url("dropdown.css");
    @import url("simple_form.css");\n\n
  CSS
end
