# Flutter Helpers

Some useful customizable widgets.

## Getting Started

iOS and Android projects are not included. You need to create them in your local. To do go to project's root folder and run `flutter create . && flutter run`

# Widgets
### 1. ConnectivityWidget
It's a [Community's Connectivity Plus](https://pub.dev/packages/connectivity_plus) widget with a little bit of extension. Since this `connectivity_plus` checks only device's connection _type_ has changed from one to another, for instance switching from **WiFi** to **Celluar Network** or **Airplane Mode**.

Although been connected to them doesn't tell you actually you are connected to the "internet", it could be just a network connection (Connected to WiFi with no internet access). Therefore we need to ensure if there's an actual internet connection or not.

This customized widget does that as an extra step. During tests I have seen this switching wasn't working perfectly and [some of them](https://github.com/fluttercommunity/plus_plugins/issues/479) has already been reported or mentioned on the package's documentation. So, I highly recommend that you combine the connection issues in your network layer with this.
