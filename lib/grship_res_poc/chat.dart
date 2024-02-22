import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                autofocus: true,
                onChanged: (value) {
                  // Handle search input changes
                },
              )
            : const Text('Chat App'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  // Clear the search text and reset the UI
                  _searchController.clear();
                  // Handle search cancellation or apply search logic here
                }
              });
            },
          ),
        ],
      ),
      body: const ChatList(),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with the actual number of chats
      itemBuilder: (context, index) {
        var data = 'Chat $index';
        return ListTile(
          leading: GestureDetector(
            onTap: () {
              // Navigate to the CommonGroups screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommonGroupsScreen(
                    data: data,
                  ),
                ),
              );
            },
            child: const CircleAvatar(
              // Replace with the actual profile image or initials
              child: Text('A'),
            ),
          ),
          title: Text(data),
          subtitle: const Text('Last message in the chat'),
          onTap: () {
            // Handle chat item click
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailsScreen(
                  chatName: data,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CommonGroupsScreen extends StatelessWidget {
  const CommonGroupsScreen({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of common groups
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Project $index'),
            subtitle: const Text('Role: Developer'),
            // Add more details or actions for each common group if needed
          );
        },
      ),
    );
  }
}

class ChatDetailsScreen extends StatelessWidget {
  final String chatName;

  const ChatDetailsScreen({Key? key, required this.chatName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // Replace with the actual list of messages
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Message $index'),
                  // Add more details or actions for each message if needed
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                      // Controller for the input text
                      // Handle sending logic in the onChanged callback
                      ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Handle send button tap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
