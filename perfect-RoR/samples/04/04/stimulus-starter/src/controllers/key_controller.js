import { Controller } from "stimulus"

export default class extends Controller {
  showkeyCode(event) {
    console.log("press key code =", event.keyCode)
  }
}
