import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../controller/search_screen_controller.dart';

class SearchDetailsScreen extends GetView<SearchScreenController> {
  const SearchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(controller.cityNotFound.toString()));
  }
}
