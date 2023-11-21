

import 'package:chatapp/constant.dart';
import 'package:chatapp/core/widgets/custom_circle_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomMessageTextfeild extends StatelessWidget {
  CustomMessageTextfeild(
      {super.key, this.onsubmitted,
      this.textcontroller,
      this.scrollController,
      this.email});
  final Function(String)? onsubmitted;
  final TextEditingController? textcontroller;
  final ScrollController? scrollController;
  final Object? email;
  static String textFeildDataCopy = '';
  final CollectionReference messages =
  FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: 290,
              height: 58,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 1,
                    offset: const Offset(3, 4), // changes the position of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: textcontroller,
                  onChanged: (data) {
                    textFeildDataCopy = data;
                  },
                  onSubmitted: onsubmitted,
                  textAlign: TextAlign.justify,
                  decoration: const InputDecoration(
                    hintText: 'Type your message here ...',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        CustomCircleButton(
          ontap: () {
            if (textFeildDataCopy != '') {
              messages.add({
                'id': email,
                'message content': textFeildDataCopy,
                kcreatedAt: DateTime.now(),
              });
              textcontroller!.clear();
              scrollController!.animateTo(0,
                  duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
              textFeildDataCopy = '';
            } else {
              scrollController!.animateTo(0,
                  duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
            }
          },
        ),
      ],
    );
  }
}
