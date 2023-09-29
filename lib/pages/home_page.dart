import 'package:flutter/material.dart';
import 'package:streamer/pages/join_with_code_page.dart';
import 'package:streamer/pages/new_meeting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Conference'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewMeeting(),));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('New Meeting'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(350, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 40,
                  indent: 40,
                  endIndent: 40,
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JoinWithCodePage(),
                        ));
                  },
                  icon: const Icon(
                    Icons.margin,
                    size: 20,
                  ),
                  label: const Text('Join Meeting with code'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.indigo,
                    side: const BorderSide(color: Colors.indigo),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    fixedSize: const Size(350, 30),
                  ),
                ),
                const SizedBox(height: 120),
                Image.network(
                    "https://user-images.githubusercontent.com/67534990/127524449-fa11a8eb-473a-4443-962a-07a3e41c71c0.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
