def setup_simple_form
  gsub_file "config/initializers/simple_form.rb",
    "{ tag: :span, class: :hint }",
    "{ tag: :small, class: :hint }"

  gsub_file "config/initializers/simple_form.rb",
    "{ tag: :span, class: :error }",
    "{ tag: :small, class: :error }"
end
