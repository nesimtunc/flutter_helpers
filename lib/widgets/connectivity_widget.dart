import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityWidget extends StatelessWidget {
  final Connectivity _connectivity = Connectivity();
  final String host = 'google.com';
  final String offlineText;
  final Color backgroundColor;
  final TextStyle? offlineTextSyle;

  ConnectivityWidget({
    Key? key,
    this.backgroundColor = Colors.redAccent,
    this.offlineText = 'Offline',
    this.offlineTextSyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _connectivity.onConnectivityChanged,
        builder: (_, connectivityStream) {
          if (!connectivityStream.hasError && connectivityStream.hasData) {
            if (connectivityStream.data != ConnectivityResult.none) {
              return FutureBuilder<bool>(
                  future: _checkInternetConnection(),
                  builder: (context, connectionState) {
                    if (connectionState.data == true) {
                      return Container();
                    }

                    return Container(
                      height: 50,
                      color: backgroundColor,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              offlineText,
                              style: offlineTextSyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                            ),
                          ]),
                    );
                  });
            }
          }
          return Container();
        });
  }

  Future<bool> _checkInternetConnection() async {
    return InternetAddress.lookup(host)
        .then((value) {
          return value.isNotEmpty && value[0].rawAddress.isNotEmpty;
        })
        .timeout(const Duration(seconds: 10), onTimeout: () => false)
        .onError((error, stackTrace) => false);
  }
}
