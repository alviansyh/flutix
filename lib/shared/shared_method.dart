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

Widget generateDashedDivider(double width) {
  int n = width ~/ 5;
  return Row(
    children: List.generate(
        n,
        (index) => (index % 2 == 0)
            ? Container(
                height: 2,
                width: width / n,
                color: Color(0xFFE4E4E4),
              )
            : SizedBox(
                width: width / n,
              )),
  );
}
