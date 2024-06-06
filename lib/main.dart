import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ejercicio01.dart';
import 'package:flutter_application_1/screens/ejercicio02.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Prueba(),
    Ejercicio01(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Prueba',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: 'Ejercicio01',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue,

      ),
    );
  }
}

class Prueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.freepik.com/free-vector/rectangle-gold-frame-grunge-blue-background-vector_53876-144241.jpg?t=st=1717680176~exp=1717683776~hmac=3f4faeaec6671cc6a19e88d3cf2e53b305734c95a10a9f5a7b77e39c2f0544bf&w=360'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'Nombre:'   ,
      
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
          
                  'Oscar Prado',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  'Usuario de GitHub:',
                
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  'Oscar035',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showAlertDialog(context);
                  },
                  child: Text('Ir a Ejercicio02'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: ( BuildContext) {
        return AlertDialog(
          title: Text("Mensaje"),
          content: Text("Deseas ir al Ejercicio 2"),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('No'),
            ),
TextButton(onPressed: (){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context)
    // ignore: prefer_const_constructors
    => Ejercicio02()),
  );
},
child :Text('Si')
),

          ],
          );
      },
      );
}
}