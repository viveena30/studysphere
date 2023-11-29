import 'package:mcwc/const/const.dart';

class ChatController extends GetxController {
  var messages = <Message>[
    Message(message: msgs[0], isMe: isMe[0]),
    Message(message: msgs[1], isMe: isMe[1]),
    Message(message: msgs[2], isMe: isMe[2]),
    Message(message: msgs[3], isMe: isMe[3]),
    Message(message: msgs[4], isMe: isMe[4]),
    Message(message: msgs[5], isMe: isMe[5]),
    Message(message: msgs[6], isMe: isMe[6]),
    Message(message: msgs[7], isMe: isMe[7]),
    Message(message: msgs[8], isMe: isMe[8]),
    Message(message: msgs[9], isMe: isMe[9]),
    Message(message: msgs[10], isMe: isMe[10]),
  ].obs;

  var messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      messages.add(Message(message: messageController.text, isMe: true));
      messageController.clear();
    }
  }
}

class Message {
  final String message;
  final bool isMe;

  Message({
    required this.message,
    required this.isMe,
  });
}

const List msgs = [
  "Hey, how are you?",
  "I'm fine, what about you?",
  "I'm good too.",
  "have you completed the assignment?",
  "No, I haven't.",
  "Okay, do it as soon as possible.",
  "Okay, I will.",
  "What are you doing?",
  "Nothing much, just chilling.",
  "Okay, bye.",
  "Bye.",
];

const List<bool> isMe = [
  true,
  false,
  true,
  false,
  true,
  false,
  true,
  false,
  true,
  false,
  true,
];
