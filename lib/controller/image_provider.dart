import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class File_provider extends ChangeNotifier {
  Future upload_profile_picture({
    required int userId,
    required String token,
    required String imagePath,
  }) async {
    final url = Uri.parse(
        'http://127.0.0.1:8000/api/users/$userId/update-profile-picture');
    var request = http.MultipartRequest('POST', url);

    request.files.add(
      await http.MultipartFile.fromPath(
        'profile_picture',
        imagePath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    request.headers['Authorization'] = 'Bearer $token';

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Profile picture uploaded successfully');
        return true;
      } else {
        print('Failed to upload profile picture: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error uploading profile picture: $e');
    }
  }

  Future upload_cover_images({
    required int userId,
    required String token,
    required String imagePath,
  }) async {
    print("upload_cover_picture");
    final url =
        Uri.parse('http://127.0.0.1:8000/api/users/$userId/update-cover-image');
    var request = http.MultipartRequest('POST', url);

    request.files.add(
      await http.MultipartFile.fromPath(
        'cover_image',
        imagePath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    request.headers['Authorization'] = 'Bearer $token';

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print(response.body);
        return true;
      } else {
        print(response.body);
        print('Failed to upload cover picture: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error uploading cover picture: $e');
    }
  }
}
