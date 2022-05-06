import consumer from "./consumer"

// consumer.subscriptions.create("RoomChannel", {
window.App = consumer.subscriptions.create("RoomChannel", {
  connected() {
    document.
      querySelector('input[data-behavior="room_speaker"').
      addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
          this.speak(e.target.value);
          e.target.value = "";
          return e.preventDefault();
        }
      });
  },

  disconnected() {
  },

  received(data) {
    const element = document.querySelector('#messages')
    element.insertAdjacentHTML('beforeend', data["message"])
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});
