import 'package:flutter/material.dart';
import 'package:streamer/pages/video_conference_page.dart';

class JoinWithCodePage extends StatelessWidget {
  final TextEditingController _channelIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  JoinWithCodePage({super.key});

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
                  "https://user-images.githubusercontent.com/67534990/127776450-6c7a9470-d4e2-4780-ab10-143f5f86a26e.png",
                  fit: BoxFit.cover,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter meeting code below",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _channelIdController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Example : abc-efg-dhi"),
                    ),
                  ),
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
                ElevatedButton(
                  onPressed: () {
                    if(_channelIdController.text.trim() != '' && _nameController.text != '') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VideoConferencePage(conferenceID: _channelIdController.text.trim(), userName: _nameController.text,),));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Enter the info of the meeting')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(50, 30),
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Text("Join"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
