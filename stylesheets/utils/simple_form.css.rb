def setup_simple_form_css
  file "app/assets/stylesheets/simple_form.css", <<~CODE
    .simple_form .input {
      margin-bottom: 1rem;
    }

    .simple_form input.string,
    .simple_form input.password {
      width: 100%;
    }
  CODE
end
