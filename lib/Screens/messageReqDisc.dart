import 'package:flutter/material.dart';

class MessageReqDiscScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1828),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 40, bottom: 10, left: 16, right: 16),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF375FFF),
                  width: 1,
                ),
                color: Color(0xFF152033),
                borderRadius: BorderRadius.circular(12),
              ),
              child: MessageReqDiscItem(
                icon: Icons.chat_bubble,
                text: 'Connect with your friends\n over local areas',
                messageText: 'Message Request',
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 40, left: 16, right: 16),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF375FFF),
                  width: 1,
                ),
                color: Color(0xFF152033),
                borderRadius: BorderRadius.circular(12),
              ),
              child: MessageReqDiscItem(
                icon: Icons.person_add,
                text: 'Discover your new friends\n over local areas',
                messageText: 'Message Request',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageReqDiscItem extends StatelessWidget {
  final String text;
  final String messageText;
  final IconData icon;

  const MessageReqDiscItem({
    required this.text,
    required this.messageText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        SizedBox(
          width: 12,
          height: 50,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8),
          ),
          onPressed: () {},
          child: Center(
            child: Text(
              messageText,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
