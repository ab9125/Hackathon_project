import 'package:demo_hackathon/model/msg.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final TextEditingController _controller = TextEditingController();
  final List<Messages> _messages = [
    Messages(text: 'Heyy, how can i help you today!?', isUser: false),
  ];
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          toolbarHeight: 62,
          centerTitle: false,
          elevation: 10,
          backgroundColor: Colors.blue.shade100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  children: [
                    // Image.asset("assets/images/chat-bot.png",width: 44),
                    SizedBox(width: 10,),
                    Text("Demo Chat",style: TextStyle(fontSize: 20,color: Theme.of(context).textTheme.titleLarge!.color),)
                  ]
              ),
              // Icon(
              //   ref.read(themeProvider)== ThemeMode.light ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              //   color: Colors.blue.shade500,
              // )
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 6,),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: message.isUser ? Colors.blue : Colors.grey[300],
                              borderRadius: message.isUser ?
                              BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ) :
                              BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(color: message.isUser ? Colors.white : Colors.black),
                          )
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 18,top: 16.0,left: 16,right: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3)
                      )
                    ]
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Message!!',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20)
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    _isLoading ?
                    CircularProgressIndicator() :
                    // IconButton(
                    //     onPressed: callGeminiModel,
                    //     icon: Icon(Icons.send_rounded, color: Colors.blue.shade300,)
                    // )
                    Icon(Icons.send_rounded, color: Colors.blue.shade300,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
