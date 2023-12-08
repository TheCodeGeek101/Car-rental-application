import 'dart:convert';

import '../services/BackendApi.dart';
import '../utils/toast.dart';

class BookCarHelper {

  void bookCar(data) async {
      var res = await CallApi().postData(data,'book');
      var body = json.decode(res.body);

      if(res.statusCode == 200){
        showToast(message: body['message']);
      }
      else if(res.statusCode == 400){
        showToast(message: body['message']);
      }
  }
}