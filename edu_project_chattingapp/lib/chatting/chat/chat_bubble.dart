import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.isMe, this.userName, this.userImage,
      {Key? key})
      : super(key: key);

  final bool isMe;
  final String message;
  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (isMe) // 내가 보내는 메세지 일때
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 45, 0), //라이트 값만 5 준것
              child: ChatBubble(
                clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 20),
                backGroundColor: Colors.blue,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (!isMe) // 내가 보내는 메세지가 아닐 때
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
              child: ChatBubble(
                clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
                backGroundColor: const Color(0xffE7E7ED),
                margin: const EdgeInsets.only(top: 20),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Column(
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        message,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
      Positioned(
          top: 0,
          right: isMe ? 5 : null,
          left: isMe ? null : 5,
          child: CircleAvatar(
              //backgroundImage: NetworkImage(userImage),
              ))
    ]);
    //
    //
    //
    //
    //
    //
    //
    // Row(
    //   mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(
    //         color: !isMe ? Colors.blue : Colors.grey[300],
    //         borderRadius: BorderRadius.only(
    //             topLeft: const Radius.circular(12),
    //             topRight: const Radius.circular(12),
    //             bottomRight:
    //                 isMe ? const Radius.circular(0) : const Radius.circular(12),
    //             bottomLeft: isMe
    //                 ? const Radius.circular(12)
    //                 : const Radius.circular(0)),
    //       ),
    //       width: 145,
    //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //       margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    //       child: Text(
    //         message,
    //         style: TextStyle(color: !isMe ? Colors.white : Colors.black),
    //       ),
    //     ),
    //   ],
    // );
  }
}
