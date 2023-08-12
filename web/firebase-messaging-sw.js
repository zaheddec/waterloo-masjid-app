importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");
const firebaseConfig = {
    apiKey: "AIzaSyBGMTdF1qhL0zC1s5brPUofTf2SOFNLClk",
    authDomain: "waterloo-masjid-app-a1dd9.firebaseapp.com",
    projectId: "waterloo-masjid-app-a1dd9",
    storageBucket: "waterloo-masjid-app-a1dd9.appspot.com",
    messagingSenderId: "281921997914",
    appId: "1:281921997914:web:0acff13b863e1597861c63",
    measurementId: "G-HVRH019FHX"
  };
firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});