// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TikTokHomePage(),
    );
  }
}

class TikTokHomePage extends StatefulWidget {
  @override
  _TikTokHomePageState createState() => _TikTokHomePageState();
}

class _TikTokHomePageState extends State<TikTokHomePage> {
  final List<String> videoPaths = [
    'assets/selatbali.mp4',
    'assets/taribarong.mp4',
    'assets/video1.mp4',
    'assets/video2.mp4',
  ];

  final List<String> usernames = [
    '@user1',
    '@user2',
    '@user3',
    '@user4',
  ];

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  String _currentTab = 'Untuk Anda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: videoPaths.length,
            itemBuilder: (context, index) {
              return VideoPlayerScreen(
                videoPath: videoPaths[index],
                username: usernames[index],
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.live_tv, color: Colors.white, semanticLabel: 'Live'),
                  onPressed: () {
                    // Action for live button
                  },
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentTab = 'Teman';
                    });
                  },
                  child: Text(
                    'Teman',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: _currentTab == 'Teman' ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentTab = 'Mengikuti';
                    });
                  },
                  child: Text(
                    'Mengikuti',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: _currentTab == 'Mengikuti' ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentTab = 'Untuk Anda';
                    });
                  },
                  child: Text(
                    'Untuk Anda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: _currentTab == 'Untuk Anda' ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // Action for search button
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopPage(),
                ),
              );
            } else if (_currentIndex == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InboxPage(),
                ),
              );
            } else if (_currentIndex == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Kotak Masuk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Kotak Masuk',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Logika untuk pencarian pesan
            },
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 71.0,  // Mengurangi tinggi kontainer jika perlu
              padding: EdgeInsets.symmetric(vertical: 4.0),  // Mengurangi padding jika perlu
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildStoryItem('assets/profile.jpeg', 'Stories Anda'),
                  _buildStoryItem('assets/comment_profile1.jpeg', 'Devarel'),
                  _buildStoryItem('assets/comment_profile2.jpeg', 'Revaldo'),
                  _buildStoryItem('assets/kaosbumiayu1.jpeg', 'FKWB STORE'),
                  // Tambahkan lebih banyak stories di sini jika perlu
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/teamwork.png'),
                    ),
                    title: Text(
                      'Pengikut baru',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'Devarel Albany mulai mengikuti',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(userName: 'Pengikut baru'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/lonceng.jpg'),
                    ),
                    title: Text(
                      'Aktivitas',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'Revaldo Novandhika menyukai video Anda',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(userName: 'Aktivitas'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/kubus.png'),
                    ),
                    title: Text(
                      'Notifikasi sistem',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'Monetisasi: pengajuan untuk promosi disetujui',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(userName: 'Notifikasi sistem'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/comment_profile1.jpeg'),
                    ),
                    title: Text(
                      '@Devarel Albany Putra Alamsyah',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'Assalamualaikum, Den...!!',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.camera_alt,
                      color: const Color.fromARGB(255, 109, 108, 108),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(userName: '@Devarel Albany Putra Alamsyah'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/comment_profile2.jpeg'),
                    ),
                    title: Text(
                      '@Revaldo Novandhika',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'Apa kabar, Den..?',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.camera_alt,
                      color: const Color.fromARGB(255, 109, 108, 108),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(userName: '@Revaldo Novandhika'),
                        ),
                      );
                    },
                  ),
                  // Tambahkan lebih banyak widget ListTile untuk mewakili pesan lainnya jika perlu
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryItem(String imagePath, String userName) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.lightBlueAccent,
                width: 3.0,
              ),
            ),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            userName,
            style: TextStyle(fontSize: 12.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final String userName;

  ChatPage({required this.userName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userName,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _messages[index],
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Kirim pesan...',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.black),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () => print('More options'),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildProfileHeader(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              TabBar(
                indicatorColor: const Color.fromARGB(255, 184, 184, 184),
                labelColor: Color.fromARGB(255, 18, 18, 18),
                unselectedLabelColor: Color.fromARGB(255, 184, 184, 184),
                tabs: [
                  Tab(icon: Icon(Icons.grid_on)),
                  Tab(icon: Icon(Icons.shopping_bag)),
                  Tab(icon: Icon(Icons.lock_outline)),
                  Tab(icon: Icon(Icons.replay)),
                  Tab(icon: Icon(Icons.bookmark_border_rounded)),
                  Tab(icon: Icon(Icons.favorite_border_rounded)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    buildMediaGrid(),
                    _buildLikedVideosList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildProfileHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Column(
      children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 151, 198, 237),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: Color.fromARGB(244, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          '@Denny Kusuma Wardana',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatColumn('300', 'Mengikuti'),
            _buildStatColumn('200 rb', 'Pengikut'),
            _buildStatColumn('77 rb', 'Suka'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Profil'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Bagikan Profil'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Icon(Icons.person_add),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Nama Kelompok ; ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Text(
          '1). Denny Kusuma Wardana STI202102421 ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Text(
          '2). Revaldo Novandhika STI202102353',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Text(
          '3). Devarel Albany Putra Alamsyah STI202102472 ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}


  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: const Color.fromARGB(255, 15, 15, 15),
          ),
        ),
      ],
    );
  }

  Widget buildMediaGrid() {
    List<MediaItem> mediaItems = [
      MediaItem(imagePath: 'assets/comment_profile2.jpeg', caption: 'Revaldo Novandhika', isVideo: false),
      MediaItem(imagePath: 'assets/profile.jpeg', caption: 'Denny Kusuma Wardana', isVideo: false),
      MediaItem(imagePath: 'assets/comment_profile1.jpeg', caption: 'Devarel Albany Putra Alamsyah', isVideo: false),
      MediaItem(imagePath: 'assets/post1 (1).png', caption: '', isVideo: false),
      MediaItem(imagePath: 'assets/post1 (2).png', caption: '', isVideo: false),
      MediaItem(imagePath: 'assets/post1 (3).png', caption: '', isVideo: false),
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
      itemCount: mediaItems.length,
      itemBuilder: (context, index) {
        final item = mediaItems[index];
        return Column(
          children: <Widget>[
            Container(
              width: 125,
              height: 125,
              child: item.isVideo
                  ? VideoPlayerWidget(videoPath: item.imagePath)
                  : Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 5),
            Text(
              item.caption,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLikedVideosList() {
  return ListView.builder(
    itemCount: 3,
    padding: EdgeInsets.all(16.0),
    itemBuilder: (context, index) {
      return Column(
        children: [
          ShopItem(
            image: 'assets/kaosbumiayu1.jpeg',
            title: 'KAOS BUMIAYU SPESIAL EDITION',
            price: 'Rp 99.000',
          ),
          SizedBox(height: 20),
        ],
      );
    },
  );
}

  
  VideoPlayerWidget({required String videoPath}) {}
}

class MediaItem {
  final String imagePath;
  final String caption;
  final bool isVideo;

  MediaItem({required this.imagePath, required this.caption, required this.isVideo});
}

mixin Video {
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  VideoPlayerScreen({required this.videoPath, required String username});

  @override
    _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool isLiked = false;
  bool isSaved = false;
  int saveCount = 0;
  int likeCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  void toggleSave() {
    setState(() {
      isSaved = !isSaved;
      saveCount += isSaved ? 1 : -1;
    });
  }

  void togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: togglePlayPause,
          child: _controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : Container(
                  color: Colors.black,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@Denny Kusuma Wardana',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Beautiful Moment....',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '#bali #taribarong #kaosbumiayucity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Action for profile picture
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpeg'),
                  radius: 20,
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: toggleLike,
                child: Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 10),
              Text('$likeCount',style: TextStyle(color: Colors.white)),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => CommentsSection(),
                  );
                },
                child: Column(
                  children: [
                    Icon(Icons.comment, color: Colors.white, size: 40),
                    SizedBox(height: 10),
                    Text('2', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: toggleSave,
                child: Column(
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: isSaved ? Colors.yellow : Colors.white,
                      size: 40,
                    ),
                    SizedBox(height: 10),
                    Text('$saveCount', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.white, size: 40,),
                onPressed: () {
                  // Action for more options
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CommentsSection extends StatefulWidget {
  @override
  _CommentsSectionState createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final List<Comment> comments = [
    Comment(username: '@Devarel Albany Putra Alamsyah', comment: 'Woww, keren!', replies: []),
    Comment(username: '@Revaldo Novandhika', comment: 'Kelassss!', replies: []),
  ];

  final TextEditingController _replyController = TextEditingController();
  int? _replyingTo;

  void addReply(int index) {
    setState(() {
      comments[index].replies.add(Comment(
        username: '@Denny Kusuma Wardana',
        comment: _replyController.text,
        replies: [],
      ));
      _replyController.clear();
      _replyingTo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'komentar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return CommentItem(
                  comment: comments[index],
                  onReply: () {
                    setState(() {
                      _replyingTo = index;
                    });
                  },
                );
              },
            ),
          ),
          if (_replyingTo != null)
            Column(
              children: [
                TextField(
                  controller: _replyController,
                  decoration: InputDecoration(
                    hintText: 'Balas komentar...',
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.black54,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _replyingTo = null;
                          _replyController.clear();
                        });
                      },
                      child: Text(
                        'Batal',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        if (_replyController.text.isNotEmpty) {
                          addReply(_replyingTo!);
                        }
                      },
                      child: Text(
                        'Balas',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final Comment comment;
  final VoidCallback onReply;

  CommentItem({required this.comment, required this.onReply});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(comment.username == '@Devarel Albany Putra Alamsyah' ? 'assets/comment_profile1.jpeg' : 'assets/comment_profile2.jpeg'),
                radius: 15,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.username,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    comment.comment,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: onReply,
                    child: Text(
                      'Balas',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
          for (var reply in comment.replies)
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                    radius: 15,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reply.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        reply.comment,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Comment {
  final String username;
  final String comment;
  final List<Comment> replies;

  Comment({required this.username, required this.comment, required this.replies});
}

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController _searchController = TextEditingController();
  List<ShopItem> _items = [
    ShopItem(
      image: 'assets/kaosbumiayu1.jpeg',
      title: 'Kaos Bumiayu Spesial Edition',
      price: 'Rp 99.000',
    ),
    ShopItem(
      image: 'assets/kaossirampog1.jpeg',
      title: 'Kaos Sirampog Beautiful Land Original',
      price: 'Rp 95.000',
    ),
    ShopItem(
      image: 'assets/kaosbumiayu2.jpeg',
      title: 'Kaos Bumiayu Original',
      price: 'Rp 80.000',
    ),
  ];

  String _searchText = '';
  int _cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    List<ShopItem> _filteredItems = _items
        .where((item) => item.title.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Cari Produk',
            border: InputBorder.none,
          ),
          onChanged: (text) {
            setState(() {
              _searchText = text;
            });
          },
        ),
        backgroundColor: Colors.white,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  // Navigate to cart page
                },
              ),
              if (_cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$_cartItemCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: _filteredItems.map((item) => Column(
          children: [
            item,
            SizedBox(height: 20),
          ],
        )).toList(),
      ),
    );
  }

  void _showOrderDialog(ShopItem item) {
    String? _selectedColor;
    int _orderQuantity = 1;

    var Context;
    showDialog(
      context: Context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Warna dan Jumlah'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Pilih Warna'),
                items: ['Merah', 'Biru', 'Hijau']
                    .map((color) => DropdownMenuItem(
                          value: color,
                          child: Text(color),
                        ))
                    .toList(),
                onChanged: (value) {
                  _selectedColor = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Jumlah Order'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _orderQuantity = int.tryParse(value) ?? 1;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _cartItemCount += _orderQuantity;
                });
                Navigator.of(context).pop();
              },
              child: Text('Konfirmasi'),
            ),
          ],
        );
      },
    );
  }
}

class ShopItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  ShopItem({required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              price,
              style: TextStyle(
                color: Color.fromARGB(255, 237, 54, 54),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showOrderDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 195, 198, 195),
              ),
              child: Text('Tambah ke troli'),
            ),
            SizedBox(height: 3),
            ElevatedButton(
              onPressed: () {
                _showOrderDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 9, 177, 31),
              ),
              child: Text('Beli sekarang'),
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => _OrderDialog(
        item: this,
        onConfirm: (color, quantity) {
          // Handle the action
        },
      ),
    );
  }
}

class _OrderDialog extends StatefulWidget {
  final ShopItem item;
  final Function(String, int) onConfirm;

  _OrderDialog({required this.item, required this.onConfirm});

  @override
  _OrderDialogState createState() => _OrderDialogState();
}

class _OrderDialogState extends State<_OrderDialog> {
  String? _selectedColor;
  int _orderQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pilih Warna dan Jumlah'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Pilih Warna'),
            items: ['Merah', 'Biru', 'Hijau']
                .map((color) => DropdownMenuItem(
                      value: color,
                      child: Text(color),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedColor = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Jumlah Order'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _orderQuantity = int.tryParse(value) ?? 1;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onConfirm(_selectedColor ?? 'Default', _orderQuantity);
            Navigator.of(context).pop();
          },
          child: Text('Konfirmasi'),
        ),
      ],
    );
  }
}


mixin context {
}
