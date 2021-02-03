import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap/dist/css/bootstrap.min.css"

Rails.start()
ActiveStorage.start()
