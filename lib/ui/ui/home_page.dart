part of '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userId;
  Future<Map<String, dynamic>>? userData;
  final TaskService _auth = TaskService();

  @override
  void initState() {
    super.initState();
    User? user = _auth.currentUser;
    if (user != null) {
      userId = user.uid;
      userData = _auth.getUserData(userId!);
    } else {
      userData = Future.value({}); // Solusi untuk error Null type
    }
  }

  void _signOut() async {   
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: userData ?? Future.value({}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('User Data not found'),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome - ${snapshot.data!['email']}'),
                Text('name - ${snapshot.data!['name']}'),
                Text('UID -  $userId'),
                Text('as a = ${snapshot.data!['role']}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {},
                      child: Text(
                        'attandence',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/note');
                      },
                      child: Text(
                        'notes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Text(
                        'profile',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _signOut,
                  child: Text(
                    'sign out',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
