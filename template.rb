# frozen_string_literal: true

# ---> new
require_relative "gems/gems"
require_relative "application/application"
require_relative "views/views"
require_relative "controllers/controllers"
require_relative "models/models"
require_relative "stylesheets/stylesheets"
require_relative "stimulus/stimulus"
require_relative "javascript/javascript"
require_relative "components/components"

setup_gems
setup_application
setup_views
setup_controllers
setup_models
setup_stylesheets
setup_stimulus
setup_javascript
setup_components
