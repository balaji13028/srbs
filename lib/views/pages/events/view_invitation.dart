import 'package:srbs/constants/import_packages.dart';

class ViewInvitation extends StatelessWidget {
  final Size size;
  final Uint8List inviationImage;
  const ViewInvitation({
    super.key,
    required this.inviationImage,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Center(
              child: Image.memory(
            inviationImage,
            fit: BoxFit.fill,
            height: size.height,
            width: size.width,
          )),
        ),
      ),
    );
  }
}
