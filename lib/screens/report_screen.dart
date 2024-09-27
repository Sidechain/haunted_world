import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? _selectedHaunting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Report a haunting',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Report Data',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedHaunting,
              hint: const Text('Select haunting type',
                  style: TextStyle(color: Colors.white)),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedHaunting = newValue;
                });
              },
              items: <String>['Ghost', 'Poltergeist', 'Demon', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child:
                      Text(value, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              dropdownColor: Colors.black,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.all(20),
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      // TODO: Handle the selected image
                      print('Image selected: ${image.path}');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.zero,
                      iconColor: Colors.white),
                  child: const Icon(Icons.image, size: 50, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement video upload logic
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero,
                    iconColor: Colors.white,
                  ),
                  child:
                      const Icon(Icons.videocam, size: 50, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement audio upload logic
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero,
                    iconColor: Colors.white,
                  ),
                  child: const Icon(Icons.mic, size: 50, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement report generation logic
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero,
                    iconColor: Colors.white,
                  ),
                  child: const Icon(Icons.description,
                      size: 50, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
