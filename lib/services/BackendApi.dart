import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi{

  // Post data to the backend Api in Node js
  postData(data, apiUrl) async {
    var fullUrl = 'https://backend-api-green-sigma.vercel.app/' + apiUrl + await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  // Get data from the backend Api in node js
  getData(apiUrl) async {
    var fullUrl = "https://backend-api-green-sigma.vercel.app/" + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }

  // Headers
  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

  // Token stored in localStorage
  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
}