part of 'shared.dart';

Future<File> getImage() async {
  File _image;
  final _picker = ImagePicker();

  var pathImage = await _picker.getImage(source: ImageSource.gallery);
  _image = File(pathImage.path);
  return _image;
}


Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask uploadTask = ref.putFile(image);
  var imageUrl = await (await uploadTask).ref.getDownloadURL();

  return imageUrl.toString();
}