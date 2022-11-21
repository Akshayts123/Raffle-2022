//
// import 'package:get/get_connect/http/src/response/response.dart';
// import 'package:http/http.dart' as http;
//
// import '../models/items.dart';
//
// class HomeRepository {
//   Future<Unicorn> getHomeData() async {
//     var billion = Uri.parse("https://crudcrud.com/api/882d76e985624a8989eb5e7b80146066/unicorns");
//     Response response = (await http.get(billion)) ;
//     return Unicorn.fromJson(response.data);
//   }
// }