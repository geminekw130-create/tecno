importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js");

// Inicialização do Firebase (FCM Web)
firebase.initializeApp({
  apiKey: "AIzaSyDp58F_Sdf-CrcwUb8ZizIV7zCVEjIB1FI",
  authDomain: "to-chegando-motoboy-24b4a.firebaseapp.com",
  databaseURL: "https://to-chegando-motoboy-24b4a-default-rtdb.firebaseio.com",
  projectId: "to-chegando-motoboy-24b4a",
  storageBucket: "to-chegando-motoboy-24b4a.appspot.com",
  messagingSenderId: "491950036407",
  appId: "1:491950036407:web:to-chegando-motoboy"
});

const messaging = firebase.messaging();

// Mensagens recebidas em background
messaging.setBackgroundMessageHandler(function (payload) {
  console.log("[firebase-messaging-sw.js] Background message received:", payload);

  const notification = payload.notification || {};
  const data = payload.data || {};

  const title = notification.title || "To Chegando Delivery";
  const options = {
    body: notification.body || "",
    icon: "/icons/Icon-192.png",
    badge: "/icons/Icon-192.png",
    data: {
      click_action: data.click_action || "/",
      payload: data
    }
  };

  return self.registration.showNotification(title, options);
});

// Clique na notificação
self.addEventListener("notificationclick", function (event) {
  event.notification.close();

  const clickAction =
    (event.notification.data && event.notification.data.click_action) || "/";

  event.waitUntil(
    clients.matchAll({ type: "window", includeUncontrolled: true }).then(clientList => {
      for (let i = 0; i < clientList.length; i++) {
        const client = clientList[i];
        if (client.url.includes(clickAction) && "focus" in client) {
          return client.focus();
        }
      }
      if (clients.openWindow) {
        return clients.openWindow(clickAction);
      }
    })
  );
});
