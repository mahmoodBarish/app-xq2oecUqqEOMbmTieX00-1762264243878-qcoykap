import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

class WhatsappChatsEdit extends StatefulWidget {
  const WhatsappChatsEdit({super.key});

  @override
  State<WhatsappChatsEdit> createState() => _WhatsappChatsEditState();
}

class _WhatsappChatsEditState extends State<WhatsappChatsEdit> {
  late List<_ChatData> _chats;
  bool get _isAnyChatSelected => _chats.any((chat) => chat.isSelected);

  @override
  void initState() {
    super.initState();
    _chats = [
      _ChatData(
        imageAsset: 'assets/images/320_90.png',
        name: 'Martin Randolph',
        message: 'Yes, 2pm is awesome',
        time: '11/19/19',
        isRead: true,
      ),
      _ChatData(
        imageAsset: 'assets/images/320_78.png',
        name: 'Andrew Parker',
        message: 'What kind of strategy is better?',
        time: '11/16/19',
        isRead: true,
      ),
      _ChatData(
        imageAsset: 'assets/images/320_66.png',
        name: 'Karen Castillo',
        message: '0:14',
        time: '11/15/19',
        isRead: false,
        messageType: _MessageType.voice,
      ),
      _ChatData(
        imageAsset: 'assets/images/320_54.png',
        name: 'Maximillian Jacobson',
        message: 'Bro, I have a good idea!',
        time: '10/30/19',
        isRead: true,
      ),
      _ChatData(
        imageAsset: 'assets/images/320_39.png',
        name: 'Martha Craig',
        message: 'Photo',
        time: '10/28/19',
        isRead: false,
        messageType: _MessageType.photo,
      ),
      _ChatData(
        imageAsset: 'assets/images/320_31.png',
        name: 'Tabitha Potter',
        message: 'Actually I wanted to check with you about your online...',
        time: '8/25/19',
        isRead: false,
      ),
      _ChatData(
        imageAsset: 'assets/images/320_17.png',
        name: 'Maisy Humphrey',
        message: 'Welcome, to make design process faster, look at...',
        time: '8/20/19',
        isRead: true,
      ),
      _ChatData(
        imageAsset: 'assets/images/320_5.png',
        name: 'Kieron Dotson',
        message: 'Ok, have a good trip!',
        time: '7/29/19',
        isRead: true,
      ),
    ];
  }

  void _toggleSelection(int index) {
    setState(() {
      _chats[index].isSelected = !_chats[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: ListView.separated(
          itemCount: _chats.length,
          itemBuilder: (context, index) {
            return _ChatItem(
              chat: _chats[index],
              onTap: () => _toggleSelection(index),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              indent: 85,
              thickness: 0.5,
              color: Color(0x4A3C3C43),
            );
          },
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              SizedBox(
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => context.go('/whatsapp_chats'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft,
                        ),
                        child: Text(
                          'Done',
                          style: GoogleFonts.sFProText(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF007AFF),
                            letterSpacing: -0.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Chats',
                style: GoogleFonts.sFProDisplay(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: -0.23,
                ),
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(44.0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0x4A3C3C43), width: 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Broadcast Lists',
                  style: GoogleFonts.sFProText(
                    fontSize: 17,
                    color: const Color(0xFFC7C7CC),
                    letterSpacing: -0.4,
                  ),
                ),
                Text(
                  'New Group',
                  style: GoogleFonts.sFProText(
                    fontSize: 17,
                    color: const Color(0xFFC7C7CC),
                    letterSpacing: -0.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      toolbarHeight: 140,
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 83,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.5),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBottomAction('Archive', isEnabled: _isAnyChatSelected),
              _buildBottomAction('Read All', isEnabled: _isAnyChatSelected),
              _buildBottomAction('Delete', isEnabled: _isAnyChatSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomAction(String label, {required bool isEnabled}) {
    return TextButton(
      onPressed: isEnabled ? () {} : null,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF007AFF),
      ),
      child: Text(
        label,
        style: GoogleFonts.sFProText(
          fontSize: 17,
          color:
              isEnabled ? const Color(0xFF007AFF) : const Color(0xFFC7C7CC),
          letterSpacing: -0.4,
        ),
      ),
    );
  }
}

enum _MessageType { text, photo, voice }

class _ChatData {
  final String imageAsset;
  final String name;
  final String message;
  final String time;
  final bool isRead;
  bool isSelected;
  final _MessageType messageType;

  _ChatData({
    required this.imageAsset,
    required this.name,
    required this.message,
    required this.time,
    required this.isRead,
    this.isSelected = false,
    this.messageType = _MessageType.text,
  });
}

class _ChatItem extends StatelessWidget {
  final _ChatData chat;
  final VoidCallback onTap;
  const _ChatItem({required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SelectIcon(isSelected: chat.isSelected),
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(chat.imageAsset),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          chat.name,
                          style: GoogleFonts.sFProText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.33,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        chat.time,
                        style: GoogleFonts.sFProText(
                          fontSize: 14,
                          color: const Color(0xFF8E8E93),
                          letterSpacing: -0.15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      if (chat.isRead) const _ReadReceiptIcon(),
                      if (chat.isRead) const SizedBox(width: 4),
                      _buildMessageContent(),
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

  Widget _buildMessageContent() {
    Widget messageIcon;
    switch (chat.messageType) {
      case _MessageType.photo:
        messageIcon =
            const Icon(Icons.photo_camera, color: Color(0xFF8E8E93), size: 16);
        break;
      case _MessageType.voice:
        messageIcon = const Icon(Icons.mic, color: Color(0xFF8E8E93), size: 16);
        break;
      case _MessageType.text:
      default:
        messageIcon = const SizedBox.shrink();
    }

    return Expanded(
      child: Row(
        children: [
          if (chat.messageType != _MessageType.text) messageIcon,
          if (chat.messageType != _MessageType.text) const SizedBox(width: 4),
          Expanded(
            child: Text(
              chat.message,
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
    );
  }
}

class _SelectIcon extends StatelessWidget {
  final bool isSelected;
  const _SelectIcon({this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.5,
      height: 20.5,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF007AFF) : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? const Color(0xFF007AFF)
              : const Color(0x993C3C43).withOpacity(0.42),
          width: 1.5,
        ),
      ),
      child: isSelected
          ? const Icon(
              Icons.check,
              size: 14,
              color: Colors.white,
            )
          : null,
    );
  }
}

class _ReadReceiptIcon extends StatelessWidget {
  const _ReadReceiptIcon();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.done_all,
      size: 18,
      color: Color(0xFF3497F9),
    );
  }
}