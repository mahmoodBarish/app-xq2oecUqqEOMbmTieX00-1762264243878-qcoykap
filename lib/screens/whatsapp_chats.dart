import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatsappChats extends StatelessWidget {
  const WhatsappChats({super.key});

  final List<Map<String, dynamic>> _chatData = const [
    {
      "name": "Martin Randolph",
      "message": "Yes, 2pm is awesome",
      "time": "11/19/19",
      "avatar": "assets/images/320_837.png",
      "isRead": true,
    },
    {
      "name": "Andrew Parker",
      "message": "What kind of strategy is better?",
      "time": "11/16/19",
      "avatar": "assets/images/320_776.png",
      "isRead": true,
    },
    {
      "name": "Karen Castillo",
      "message": "0:14",
      "time": "11/15/19",
      "avatar": "assets/images/320_849.png",
      "isRead": false,
      "isVoice": true,
    },
    {
      "name": "Maximillian Jacobson",
      "message": "Bro, I have a good idea!",
      "time": "10/30/19",
      "avatar": "assets/images/320_764.png",
      "isRead": true,
    },
    {
      "name": "Martha Craig",
      "message": "Photo",
      "time": "10/28/19",
      "avatar": "assets/images/320_822.png",
      "isRead": false,
      "isPhoto": true,
    },
    {
      "name": "Tabitha Potter",
      "message": "Actually I wanted to check with you about your...",
      "time": "8/25/19",
      "avatar": "assets/images/320_800.png",
      "isRead": false,
    },
    {
      "name": "Maisy Humphrey",
      "message": "Welcome, to make design process faster...",
      "time": "8/20/19",
      "avatar": "assets/images/320_808.png",
      "isRead": true,
    },
    {
      "name": "Kieron Dotson",
      "message": "Ok, have a good trip!",
      "time": "7/29/19",
      "avatar": "assets/images/320_788.png",
      "isRead": true,
    },
    {
      "name": "Joshua Lawrence",
      "message": "Do you like WhatsApp UI?",
      "time": "10/20/19",
      "avatar": "assets/images/320_861.png",
      "isRead": true,
    },
  ];

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/status')) {
      return 0;
    }
    if (location.startsWith('/calls')) {
      return 1;
    }
    if (location.startsWith('/camera')) {
      return 2;
    }
    if (location.startsWith('/chats')) {
      return 3;
    }
    if (location.startsWith('/settings')) {
      return 4;
    }
    return 3;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/status');
        break;
      case 1:
        context.go('/calls');
        break;
      case 2:
        context.go('/camera');
        break;
      case 3:
        context.go('/chats');
        break;
      case 4:
        context.go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(132.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
            border: Border(
              bottom: BorderSide(
                color: Color(0x4A3C3C43),
                width: 0.33,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => context.go('/whatsapp_chats_edit'),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(40, 44)),
                        child: Text(
                          "Edit",
                          style: GoogleFonts.sFProText(
                            fontSize: 17,
                            color: const Color(0xFF007AFF),
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.4,
                          ),
                        ),
                      ),
                      Text(
                        "Chats",
                        style: GoogleFonts.sFProText(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.4,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_square,
                            color: Color(0xFF007AFF)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Broadcast Lists",
                        style: GoogleFonts.sFProText(
                          color: const Color(0xFF007AFF),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "New Group",
                        style: GoogleFonts.sFProText(
                          color: const Color(0xFF007AFF),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: _chatData.length,
        itemBuilder: (context, index) {
          final chat = _chatData[index];
          return _ChatItem(
            avatar: chat['avatar'],
            name: chat['name'],
            message: chat['message'],
            time: chat['time'],
            isRead: chat['isRead'],
            isVoice: chat['isVoice'] ?? false,
            isPhoto: chat['isPhoto'] ?? false,
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          thickness: 0.33,
          color: Color(0x4A3C3C43),
          indent: 80,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        selectedItemColor: const Color(0xFF007AFF),
        unselectedItemColor: const Color(0xA5545458),
        onTap: (index) => _onItemTapped(index, context),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF6F6F6),
        showUnselectedLabels: true,
        selectedLabelStyle:
            GoogleFonts.sFProText(fontSize: 10, letterSpacing: 0.1),
        unselectedLabelStyle:
            GoogleFonts.sFProText(fontSize: 10, letterSpacing: 0.1),
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String message;
  final String time;
  final bool isRead;
  final bool isVoice;
  final bool isPhoto;

  const _ChatItem({
    required this.avatar,
    required this.name,
    required this.message,
    required this.time,
    this.isRead = false,
    this.isVoice = false,
    this.isPhoto = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 11.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(avatar),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: GoogleFonts.sFProText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.33,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: GoogleFonts.sFProText(
                          fontSize: 14,
                          color: const Color(0xFF8E8E93),
                          letterSpacing: -0.15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Color(0x4D3C3C43),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      if (isRead)
                        const Icon(Icons.done_all,
                            color: Color(0xFF3498DB), size: 18),
                      if (isPhoto)
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.photo_camera_back,
                              color: Color(0xFF8E8E93), size: 16),
                        ),
                      if (isVoice)
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.mic,
                              color: Color(0xFF8E8E93), size: 16),
                        ),
                      if (isRead && !isPhoto && !isVoice)
                        const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          message,
                          style: GoogleFonts.sFProText(
                            fontSize: 14,
                            color: const Color(0xFF8E8E93),
                            letterSpacing: -0.15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}