// ignore_for_file: avoid_print
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hive_cache_interceptor/hive_cache_interceptor.dart';
import 'package:logger/logger.dart';

import '../../dialogs/loadings/loading_screen.dart';
import '../../global/navigation_service.dart';
import '../dialogs/app_dialog/error_dialog.dart';

class TokenInterceptor extends HiveCacheInterceptor {
  TokenInterceptor();

  @override
  Future? onRequest(Request request, HasuraConnect connect) async {
    try {
      request.headers["content-type"] = "application/json";
      request.headers["x-hasura-admin-secret"] = dotenv.env['ADMIN_SECRET']!;
      // Logger().d("onRequest : ${request.toString()}");
      return request;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<void>? onConnected(HasuraConnect connect) async {
    Logger().d("onConnected");
  }

  @override
  Future<void>? onDisconnected() async {
    Logger().d("onDisconnected");
  }

  @override
  Future onError(HasuraError error, HasuraConnect connect) async {
    final Connectivity connectivity = Connectivity();

    Future<bool> isConnected() async {
      var connectivityResult = await connectivity.checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    }

    if (!await isConnected()) {
      if (NavigationService.navigatorKey.currentContext != null) {
        showErrorDialog(
          NavigationService.navigatorKey.currentContext!,
          maxline: 2,
          title: "ການເຊື່ອມຕໍ່ຜິດພາດ",
          contentText: "ກະລຸນາກວດສອບສັນຍານອິນເຕີເນັດຂອງທ່ານແລ້ວລອງໃໝ່ອີກຄັ້ງ",
        );
        await Future.delayed(const Duration(milliseconds: 300));
        LoadingScreen.instance().hide();
      }

      Logger().d("No internet connection <<");
    }

    Logger().d("onError : ${error.toString()}");

    return super.onError(error, connect);
  }

  @override
  Future onResponse(Response data, HasuraConnect connect) {
    Logger().d("onResponse : ${data.toString()}");
    return super.onResponse(data, connect);
  }

  @override
  Future<void> onSubscription(Request request, Snapshot snapshot) {
    Logger().d("onSubscription");
    return super.onSubscription(request, snapshot);
  }

  @override
  Future<void>? onTryAgain(HasuraConnect connect) async {
    Logger().d("onTryAgain");
  }
}
