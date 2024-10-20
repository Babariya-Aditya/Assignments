import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Bottom Navigation App',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index of the selected tab

  // Dummy data for each tab
  final List<Widget> _tabs = [
    GalleryScreen(),
    AudioScreen(),
    VideoScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Navigation App')),
      body: _tabs[_selectedIndex], // Display the selected tab's content
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Video',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // Handle tab selection
      ),
    );
  }
}

// Gallery Screen
class GalleryScreen extends StatelessWidget {
  final List<String> galleryItems = [
    'Image 1',
    'Image 2',
    'Image 3',
    'Image 4',
    'Image 5',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: galleryItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(galleryItems[index]),
          subtitle: Text('This is a preview of ${galleryItems[index]}'),
        );
      },
    );
  }
}

// Audio Screen
class AudioScreen extends StatelessWidget {
  final List<String> audioItems = [
    'Audio Track 1',
    'Audio Track 2',
    'Audio Track 3',
    'Audio Track 4',
    'Audio Track 5',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: audioItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(audioItems[index]),
          subtitle: Text('This is a preview of ${audioItems[index]}'),
        );
      },
    );
  }
}

// Video Screen
class VideoScreen extends StatelessWidget {
  final List<String> videoItems = [
    'Video Clip 1',
    'Video Clip 2',
    'Video Clip 3',
    'Video Clip 4',
    'Video Clip 5',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(videoItems[index]),
          subtitle: Text('This is a preview of ${videoItems[index]}'),
        );
      },
    );
  }
}
