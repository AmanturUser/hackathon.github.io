import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class AuthClient{
  var client = http.Client();
  static var ip='192.168.164.236';

  Future<dynamic> getProducts() async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'Products/Index',
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<dynamic> getCategoryProducts(String id) async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'Products/getProductsByCategoryId',
      queryParameters: {'categoryId': id}
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<dynamic> getSearchProducts(String search) async {
    var uri = Uri(
        scheme: 'http',
        host: ip,
        port: 80,
        path: 'Products/Search',
        queryParameters: {'param':search}
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<dynamic> getCategories() async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'Categories/Index',
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<dynamic> getProductsFavorite(String email) async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'Favorites/GetFavorites',
      queryParameters: {'email':email}
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<dynamic> getProductData(String productId,String email) async {
    var uri = Uri(
        scheme: 'http',
        host: ip,
        port: 80,
        path: 'Products/GetById',
        queryParameters: {'productId':productId,'email':email}
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<String> getSetFavorite(String productId,String email) async {
    var uri = Uri(
        scheme: 'http',
        host: ip,
        port: 80,
        path: 'Favorites/SetFavorite',
        queryParameters: {'email':email,'productId':productId}
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return 'true';
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      return 'false';
    }
  }

  Future<String> getUnSetFavorite(String productId,String email) async {
    var uri = Uri(
        scheme: 'http',
        host: ip,
        port: 80,
        path: 'Favorites/UnsetFavorite',
        queryParameters: {'email':email,'productId':productId}
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return 'true';
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      return 'false';
    }
  }



  Future<bool> postSingUp(String email,String password,String api) async {
    //var _payload = json.encode(object);

    Map<String, String> json={
      "email" : email,
      "password" : password
    };





    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'User/SignUp',
    );
    var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<String> postSingIn(String email,String password) async {
    //var _payload = json.encode(object);

    Map<String, String> json={
      "email" : email,
      "password" : password
    };



    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'User/SignIn',
    );
    var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return 'true';
    } else if(response.statusCode==400){
      print('error not found');
      print(response.body);
      return 'password';
      //throw exception and catch it in UI
    }else {
      print('error not found');
      print(response.body);
      return 'false';
      //throw exception and catch it in UI
    }
  }


  Future<bool> postProfileEdit(var json) async {
    //var _payload = json.encode(object);




    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'User/UpdateProfile',
    );
    var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> getProfileProducts(String email) async {
    // email=email.replaceAll('@', '%40');

    var url=Uri.parse('http://$ip/Products/Index?email=$email');
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'Products/Index',
     queryParameters: {'email':email}
    );
    print('$url\n'+uri.toString());

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<dynamic> getUserData(String email) async {

    var uri = Uri(
        scheme: 'http',
        host: ip,
        port: 80,
        path: '/User/GetProfile',
        queryParameters: {'Email':email}
    );
    print(uri.toString());

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<bool> getConfirmEmail(String email) async {
    //var _payload = json.encode(object);

    email=email.replaceAll('@', '%40');
    print(email);

    var url=Uri.parse('http://$ip/User/SendCodeWordToEmailToConfirmEmail?email=$email');
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: "User/SendCodeWordToEmailToConfirmEmail?email=$email",
    );
    var response = await client.get(url);
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<bool> postConfirmEmail(String email,String kod) async {
    //var _payload = json.encode(object);

    Map<String, String> json={
      "secretWord" : kod,
      "email" : email
    };



    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'User/ConfirmEmail',
    );
    var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }
  Future<int> postProductAdd(var json) async {
    //var _payload = json.encode(object);



    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'Products/AddWithEmail',
    );
    var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);

      var data = jsonDecode(response.body);
      var inner = data['data'];
      var id = inner['id'];
      var type = id.runtimeType;
      return id;
    } else {
      print('error not found');
      print(response.body);
      return 0;
      //throw exception and catch it in UI
    }
  }

  Future<bool> postProductPhotoAdd( List<XFile> file,int id) async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'ProductImage/AddImage/$id',
    );
    var request = http.MultipartRequest('POST', uri);


//for image and videos and files

// request.files.add(await http.MultipartFile.fromPath("images", path));
    for(var i=0;i<file.length;i++) {
      var fileBytes$i = await file[i].readAsBytes();
      var httpImage$i = http.MultipartFile.fromBytes(
          'Images', fileBytes$i.toList(),contentType:   MediaType('image', 'jpeg'), filename: file[i].name);


//for completeing the request
    request.files.add(httpImage$i);}
    var response =await request.send();

//for getting and decoding the response into json format
    var responsed = await http.Response.fromStream(response);
// final responseData = json.decode();


    if (response.statusCode==200) {
      print("SUCCESS");
      print(responsed.body);
      return true;
    }
    else {
      print(response.statusCode);
      print(responsed.body);
      print("ERROR");
      return false;
    }
  }

  Future<bool> postProfilePhotoAdd( XFile file,String email,[bool update=false]) async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'User/ProfileAvatar',
      queryParameters:update ?{'email':email,'updateDelete':'true'}:{'email':email}
    );
    print(uri);
    var request = http.MultipartRequest('POST', uri);


//for image and videos and files

// request.files.add(await http.MultipartFile.fromPath("images", path));
    final fileBytes = await file.readAsBytes();
    final httpImage = http.MultipartFile.fromBytes('Avatar', fileBytes.toList(),

        contentType:   MediaType('image', 'jpeg'), filename: file.name);
//for completeing the request
    request.files.add(httpImage);
    var response =await request.send();

//for getting and decoding the response into json format
    var responsed = await http.Response.fromStream(response);
// final responseData = json.decode();


    if (response.statusCode==200) {
      print("SUCCESS photoprofile add");
      print(responsed.body);
      return true;
    }
    else {
      print(response.statusCode);
      print(responsed.body);
      print("ERROR photo profile");
      return false;
    }
  }

  Future addCollective(int productId, String buyerEmail) async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'CollectiveTrade/AddCollectiveProduct',
    );
    Map<String, dynamic> obj = {
      'productId': productId,
      'buyerEmail': buyerEmail,
    };

    var json = jsonEncode(obj);
    var response = await client.post(
      uri,
      body: json,
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if(response.statusCode != 200) {
      throw Exception("Не удалось добавить в список коллективной покупки");
    }
  }

  Future removeCollective(int productId, String buyerEmail) async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'CollectiveTrade/RemoveCollectiveProduct',
    );
    Map<String, dynamic> data = {
      'productId': productId,
      'buyerEmail': buyerEmail,
    };
    var response = await client.delete(
      uri,
      body:jsonEncode(data),
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if(response.statusCode != 200) {
      throw Exception("Не удалось удалить в список коллективной покупки");
    }
  }


  Future makeCollective(MakeCollectiveArgument argument) async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'CollectiveTrade/MakeProductCollective',
    );
    // Map<String, dynamic> data = argument.toMap();
    var response = await client.post(
      uri,
      body: jsonEncode(argument),
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if(response.statusCode != 200) {
      throw Exception("Не удалось добавить в список товаров коллективной покупки");
    }
  }

  Future unmakeCollective(MakeCollectiveArgument argument) async {
    var uri = Uri(
      scheme: 'http',
      host: ip,
      port: 80,
      path: 'CollectiveTrade/MakeProductCollective',
    );
    // Map<String, dynamic> data = argument.toMap();
    var response = await client.delete(
      uri,
      body: jsonEncode(argument),
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if(response.statusCode != 200) {
      throw Exception("Не удалось убрать из список товаров коллективной покупки");
    }
  }
}

class MakeCollectiveArgument{
  final int productId;
  final String  sellerEmail;
  final double collectivePrice;
  final int buyerAmount;
  final DateTime startDate;
  final DateTime endDate;

  MakeCollectiveArgument(this.productId, this.sellerEmail, this.collectivePrice, this.buyerAmount, this.startDate, this.endDate);
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'sellerEmail': sellerEmail,
      'collectivePrice': collectivePrice,
      'buyerAmount': buyerAmount,
      'startDate': startDate,
      'endDate': endDate
    };
  }
}



class UnmakeCollectiveArgument{
  final int productId;

  UnmakeCollectiveArgument(this.productId);
}