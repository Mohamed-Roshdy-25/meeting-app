import 'dart:math';

import 'package:flutter/material.dart';
import 'package:streamer/constants/constants.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;
  final String userName;
  const VideoConferencePage({super.key, required this.conferenceID, required this.userName});

  @override
  State<VideoConferencePage> createState() => _VideoConferencePageState();
}

class _VideoConferencePageState extends State<VideoConferencePage> {
  final String localUserId = Random().nextInt(1000).toString();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: AppConstants.appId,
        appSign: AppConstants.appSign,
        conferenceID: widget.conferenceID,
        userID: localUserId,
        userName: widget.userName,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}
