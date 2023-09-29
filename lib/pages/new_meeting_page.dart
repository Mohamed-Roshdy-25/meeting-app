import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:streamer/controllers/new_meeting_page_controller.dart';
import 'package:streamer/pages/video_conference_page.dart';

class NewMeeting extends StatefulWidget {
  const NewMeeting({Key? key}) : super(key: key);

  @override
  State<NewMeeting> createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  final TextEditingController _nameController = TextEditingController();



  @override
  void initState() {
    newMeetingController.createMeetingId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new_sharp, size: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Image.network(
                  "https://user-images.githubusercontent.com/67534990/127776392-8ef4de2d-2fd8-4b5a-b98b-ea343b19c03e.png",
                  fit: BoxFit.cover,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter meeting code below",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: Card(
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.link),
                        title: SelectableText(
                          newMeetingController.meetingCode,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                        trailing: const Icon(Icons.copy),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your name...."),
                    ),
                  ),
                ),
                const Divider(thickness: 1, height: 40, indent: 20, endIndent: 20),
                ElevatedButton.icon(
                  onPressed: () => newMeetingController.shareMeetingCode(),
                  icon: const Icon(Icons.arrow_drop_down),
                  label: const Text("Share invite"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 30), backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () {
                    if(_nameController.text != '')
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoConferencePage(
                                conferenceID: newMeetingController.meetingCode.trim(),
                                userName: _nameController.text),
                          ));
                    }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Enter your name')));
                    }
                  },
                  icon: const Icon(Icons.video_call),
                  label: const Text("start call"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.indigo, side: const BorderSide(color: Colors.indigo),
                    fixedSize: const Size(350, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}