
import 'package:chatapp/constant.dart';

class MessageModel {
  final String messageContent;
  final String id;

  MessageModel(this.messageContent, this.id);

  factory MessageModel.fromjson(jsondata) {
    return MessageModel(jsondata[kmessagecontent], jsondata['id']);
  }
}
