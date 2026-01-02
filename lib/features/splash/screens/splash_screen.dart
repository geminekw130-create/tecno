import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motoboy/features/trip/controllers/trip_controller.dart';
import 'package:motoboy/features/wallet/controllers/wallet_controller.dart';
import 'package:motoboy/helper/login_helper.dart';
import 'package:motoboy/util/images.dart';
import 'package:motoboy/features/auth/controllers/auth_controller.dart';
import 'package:motoboy/features/location/controllers/location_controller.dart';
import 'package:motoboy/features/profile/controllers/profile_controller.dart';
import 'package:motoboy/features/ride/controllers/ride_controller.dart';
import 'package:motoboy/features/splash/controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  final Map<String,dynamic>? notificationData;
  final String? userName;
  const SplashScreen({super.key, this.notificationData, this.userName});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<List<ConnectivityResult>>? _onConnectivityChanged;

  @override
  void initState() {
    super.initState();
    if(!GetPlatform.isIOS){
      _checkConnectivity();
    }
    Get.find<SplashController>().initSharedData();
    Get.find<TripController>().rideCancellationReasonList();
    Get.find<TripController>().parcelCancellationReasonList();
    Get.find<AuthController>().remainingTime();
    Get.find<WalletController>().getPaymentGetWayList();
    _route();

  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _onConnectivityChanged?.cancel();
    super.dispose();
  }

  void _checkConnectivity(){
    bool isFirst = true;
    _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      bool isConnected = result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.mobile);
      if((isFirst && !isConnected) || !isFirst && context.mounted) {
        ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
        ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          backgroundColor: isConnected ? Colors.green : Colors.red,
          duration: Duration(seconds: isConnected ? 3 : 6000),
          content: Text(
            isConnected ? 'connected'.tr : 'no_connection'.tr,
            textAlign: TextAlign.center,
          ),
        ));

        if(isConnected) {
          _route();
        }
      }
      isFirst = false;
    });
  }


  void _route() async {
    bool isSuccess = await Get.find<SplashController>().getConfigData();
    if (isSuccess) {
      LoginHelper().checkLoginRoutes(widget.notificationData, widget.userName);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RideController>(builder: (rideController) {
        return GetBuilder<ProfileController>(builder: (profileController) {
          return GetBuilder<LocationController>(builder: (locationController) {
            return SizedBox.expand(
              child: Image.asset(
                Images.splashMainBlue,
                fit: BoxFit.cover,
              ),
            );
          });
        });
      }),
    );
  }

}
