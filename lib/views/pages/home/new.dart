//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../controller/home_controller.dart';
//
// class homescreen extends StatelessWidget {
//   HomeController dataController = Get.put(HomeController());
//
//    homescreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//          child:Obx(() => dataController.isDataLoading.value
//              ? const Center(child: CircularProgressIndicator())
//              : _builScreen()),
//     );
//   }
//   Widget _builScreen(){
//     return  ListView.builder(
//         itemCount: 2,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   margin: const EdgeInsets.only(left: 20, right: 20),
//                   padding: const EdgeInsets.only(left: 20),
//                   height: 80,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 35,
//                         backgroundImage: NetworkImage(dataController
//                             .user_model!.data![index].picture!),
//                       ),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             dataController.user_model[index]!.name??"",
//                             style: const TextStyle(
//                                 color: Colors.black, fontSize: 18),
//                           ),
//                           Text(
//                               dataController
//                                   .user_model!.data![index].firstName!,
//                               style: const TextStyle(
//                                   color: Colors.black, fontSize: 18)),
//                           Text(
//                               dataController
//                                   .user_model!.data![index].lastName!,
//                               style: const TextStyle(
//                                   color: Colors.black, fontSize: 18)),
//                         ],
//                       ),
//                     ],
//                   )),
//               const SizedBox(
//                 height: 10,
//               )
//             ],
//           );
//         });
//   }
// }
