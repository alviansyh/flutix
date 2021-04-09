part of 'shared.dart';

Future<File> getImage() async {
  File _image;
  final _picker = ImagePicker();

  var pathImage = await _picker.getImage(source: ImageSource.gallery);
  _image = File(pathImage.path);
  return _image;
}

