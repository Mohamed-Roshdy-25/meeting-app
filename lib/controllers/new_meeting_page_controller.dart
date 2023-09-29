import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

class NewMeetingController {
  String meetingCode = '';

  createMeetingId(){
    Uuid uuid = const Uuid();
    meetingCode = uuid.v1().substring(0, 8);
  }

  shareMeetingCode(){
    Share.share("Meeting Code : $meetingCode");
  }
}

NewMeetingController newMeetingController = NewMeetingController();