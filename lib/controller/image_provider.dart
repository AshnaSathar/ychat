import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';

class File_provider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  setLoading(bool Loading) {
    _isLoading = Loading;
  }

  Future upload_profile_picture({
    required int userId,
    required context,
    required String token,
    required String imagePath,
  }) async {
    setLoading(true);
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
        // Update the profile image URL in Profile_provider
        Provider.of<Profile_provider>(context, listen: false)
            .profile_picture_url = 'new_profile_picture_url';

        // Notify listeners to update UI
        Provider.of<Profile_provider>(context, listen: false).notifyListeners();

        setLoading(false);
        return true;
      } else {
        setLoading(false);
        return false;
      }
    } catch (e) {
      setLoading(false);
      print('Error uploading profile picture: $e');
      return false;
    }
  }

  Future upload_cover_images({
    required int userId,
    required String token,
    required String imagePath,
  }) async {
    setLoading(true);
    // print("upload_cover_picture");
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
        // print(response.body);
        setLoading(false);
        return true;
      } else {
        setLoading(false);
        // print(response.body);
        print('Failed to upload cover picture: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      setLoading(false);
      print('Error uploading cover picture: $e');
      return false;
    }
  }
}
