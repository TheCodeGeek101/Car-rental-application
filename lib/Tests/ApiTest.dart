import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import '../services/BackendApi.dart';

void main() {
  group('CallApi Tests', () {

    // Mock data for testing
    final testData = {
      'name': 'finale2023',
      'email':'ambuyefinale@unima.ac.mw',
      'password':'mzimundeifeyo'
    };

    test('Post data to API', () async {

      // define the method and endpoint
      final callApi = CallApi();
      const apiUrl = 'register'; // Replace with the actual endpoint

      // make the post request
      final response = await callApi.postData(testData, apiUrl);

      // Make assertions
      expect(response.statusCode, 200);
    });

    test('Get cars from API', () async {
      // Endpoint and metohod
      final callApi = CallApi();
      const apiUrl = 'cars'; // Replace with the actual endpoint

      // Call the Api
      final response = await callApi.getData(apiUrl);

      // Make assertions
      expect(response.statusCode, 200);

    });
  });
}
