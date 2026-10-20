// ignore_for_file: spell_check_on_languages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homework extends StatelessWidget {
  const homework({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Rayan Assiri'),
              accountEmail: Text('rayan@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'R',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blueAccent),
              title: const Text('Home'),
              subtitle: const Text('Go to Home screen'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blueAccent),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.blueAccent),
              title: const Text('Products'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Listviewexample2(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add, color: Colors.blueAccent),
              title: const Text('Register'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Colors.blueAccent),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blueAccent),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                debugPrint('Settings tapped');
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () {
                Navigator.pop(context);
                debugPrint('Logout tapped');
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const ListTile(
                title: Text(
                  'القائمة الجانبية (يمين)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.info, color: Colors.blueAccent),
                title: const Text('عن التطبيق'),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint('About tapped');
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blueAccent,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu_open),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome Home 👋\nاسحب من اليسار لفتح الـ Drawer\nواسحب من اليمين لفتح الـ endDrawer',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}

// صفحة Profile
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueAccent,
              child: Text(
                'R',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Rayan Assiri',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'UserName: Rayan',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 5),
            Text(
              'rayan@email.com',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة Products
class Listviewexample2 extends StatelessWidget {
  Listviewexample2({super.key});

  final List<String> items =
  List<String>.generate(5, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Example'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: const Icon(
                Icons.label,
                color: Colors.blueAccent,
              ),
              title: Text(items[index]),
              subtitle: Text(items[index]),
              trailing: const Icon(Icons.video_label_outlined),
              tileColor: Colors.blue.shade50,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.blue.shade100),
              ),
            ),
          );
        },
      ),
    );
  }
}

// صفحة التسجيل الجديد باستخدام TextFormField
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'FullName',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'UserName',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.blueAccent,
                  value: isAgreed,
                  onChanged: (value) {
                    setState(() {
                      isAgreed = value ?? false;
                    });
                  },
                ),
                const Text('الموافقة على الشروط والأحكام والخصوصية'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                debugPrint('Register tapped');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة تسجيل الدخول باستخدام TextFormField
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'UserName',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.blueAccent,
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },
                ),
                const Text('تذكرني (Remember Me)'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                debugPrint('Login tapped');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}