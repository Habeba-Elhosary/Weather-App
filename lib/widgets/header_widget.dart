import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import '../constants/text_constants.dart';
import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city ="" ;
  final GlobalController globalController =
  Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat,lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat,lon);
    Placemark place = placemarks[0];
    city = place.locality!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(city,style:AppTextStyle().headlineWhite.copyWith(fontSize:15.sp),),
      ),
    );
  }
}
