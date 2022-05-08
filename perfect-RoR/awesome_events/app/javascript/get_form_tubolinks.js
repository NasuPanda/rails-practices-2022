import Turbolinks from "turbolinks"

document.addEventListener("turbolinks:load", function(e) {
  const forms = document.querySelectorAll("form[method=get][data-remote=true]")
  for (const form of forms) {
    form.addEventListener("ajax:beforeSend", function (e) {
      const options = e.detail[1]

      Turbolinks.visit(options.url)
      e.preventDefault()
    })
  }
})
