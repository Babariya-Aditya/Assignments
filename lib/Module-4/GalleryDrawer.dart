import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Drawer App',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Drawer App')),
      drawer: NavigationDrawer(),
      body: Center(child: Text('Select an option from the drawer')),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Gallery'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GalleryScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text('Audio'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AudioScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.videocam),
            title: Text('Video'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoScreen()),
              );
            },
          ),
        ],
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
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: ListView.builder(
        itemCount: galleryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(galleryItems[index]),
            subtitle: Text('This is a preview of ${galleryItems[index]}'),
          );
        },
      ),
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
    return Scaffold(
      appBar: AppBar(title: Text('Audio')),
      body: ListView.builder(
        itemCount: audioItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(audioItems[index]),
            subtitle: Text('This is a preview of ${audioItems[index]}'),
          );
        },
      ),
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
    return Scaffold(
      appBar: AppBar(title: Text('Video')),
      body: ListView.builder(
        itemCount: videoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(videoItems[index]),
            subtitle: Text('This is a preview of ${videoItems[index]}'),
          );
        },
      ),
    );
  }
}
