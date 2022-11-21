import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/search_controller.dart';

class search extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  final searchController = Get.put(SearchController());
  search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
        width: 245,
        style: TextStyle(fontSize: 20),
        helpText: "Search Text...",
        closeSearchOnSuffixTap: true,
        textController: textController,
        onSuffixTap: () {
          textController.clear();
        });
  }
}
