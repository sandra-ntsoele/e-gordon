import 'package:e_gordon/view/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future<FilePickerResult?> file;
        file = FilePicker.platform.pickFiles();
      },
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: size.height * 0.04,
                      color: const Color.fromRGBO(159, 165, 193, 1),
                    ),
                    SizedBox(height: size.height * 0.01),
                    const Text(
                      "Tap to add cover photo.",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "up to 12Mb",
                      style: TextStyle(
                        color: outlineColour,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
