import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {},
  disconnected() {},
  received(data) {
    alert(data)
  }
});