import 'dart:io';
import 'package:image_picker/image_picker.dart';
class PickImage {
  static Future<File?> pickImageFromGallery() async {
    File? imageFile;
    final XFile? xfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (xfile != null) {
      imageFile = File(xfile.path);
    }
    return imageFile;
  }
}
