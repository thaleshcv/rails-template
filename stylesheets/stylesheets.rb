# frozen_string_literal: true

def setup_stylesheets
  prepend_to_file "app/assets/stylesheets/application.css", <<~CSS
    @import url("https://cdn.simplecss.org/simple.min.css");\n\n
  CSS
end
