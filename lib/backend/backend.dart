import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Backend extends GetxController {
  var progress = 0.3.obs;
  incrementLoader() {
    progress.value = progress.value + 0.4;
    if (progress.value > 1.2) {
      addPatient();
    }
  }

  var sex = 1.obs;
  toggleSex(data) {
    sex.value = data;
  }

  var height = 153.obs;
  toggleHeight(data) {
    height.value = data;
  }

  var weightUnit = "Kg".obs;
  void toggleWeightUnit(data) {
    Future.delayed(const Duration(milliseconds: 150), () {
      weightUnit.value = data;
    });
  }

  var weight = 88.obs;
  toggleWeighht(data) {
    weight.value = data;
  }

  Future<void> addPatient() async {
    // Define the API URL and the bearer token
    final String url =
        'http://157.15.202.189:7002/patient/patient_info?patientId=73';
    final String bearerToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVbWVzaCIsInJvbGVJZCI6MiwiZXhwIjoxNzU0NDU1MDY5LCJpYXQiOjE3MjI5MTkwNjl9.WwBZtiNMQAeerkqkQL2MQjNVyfAEn7gE8CzzU0XpCIE';

    var gender;

    if (sex.value == 1) {
      gender = "Female";
    }

    if (sex.value == 2) {
      gender = "Male";
    }

    if (sex.value == 3) {
      gender = "Other";
    }

    // Define the request body
    final Map<String, dynamic> requestBody = {
      "gender": gender,
      "height": height.value.toString(),
      "heightType": "CM",
      "weight": weight.value.toString(),
      "weightType": weightUnit.value,
    };

    // Send the POST request
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Check the response status
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        Get.snackbar(
          'Success 👍',
          'Patient added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          duration: Duration(seconds: 2),
          borderRadius: 8,
          margin: EdgeInsets.all(10),
        );
        print(responseData); // Output: Patient Profile Updated Successfully
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
