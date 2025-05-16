import 'package:chat_app_final/auth/auth_service.dart';
import 'package:chat_app_final/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Components/Textfield.dart';

class Chatpage extends StatefulWidget {
  final String receiverEmail;
  final String receiverid;

  const Chatpage({
    super.key,
    required this.receiverEmail,
    required this.receiverid,
  });

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final TextEditingController messagecontroller = TextEditingController();

  final ChatService chatsevice = ChatService();
  final AuthService authService = AuthService();

  void sendmessage() async {
    if (messagecontroller.text.isNotEmpty) {
      print("Sending message: ${messagecontroller.text}");
      await chatsevice.sendMessage(widget.receiverid, messagecontroller.text);
      messagecontroller.clear();
      setState(() {}); // update UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverEmail)),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderid = authService.getCurrentuser()!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: chatsevice.getMessage(senderid, widget.receiverid),  // swapped here
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text("Error loading messages");
        if (snapshot.connectionState == ConnectionState.waiting) return const Text("Loading...");
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const Text("No messages");

        return ListView(
          reverse: true,
          children: snapshot.data!.docs.map((doc) => _buildMessageitem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ListTile(
      title: Text(data['message']),
      subtitle: Text(data['senderid'] == authService.getCurrentuser()!.uid ? "You" : widget.receiverEmail),
    );
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: txtfld(
            hinttet: "Type a message",
            visible: false,
            controller: messagecontroller,
          ),
        ),
        IconButton(
          onPressed: sendmessage,
          icon: Icon(Icons.send),
        ),
      ],
    );
  }
}

