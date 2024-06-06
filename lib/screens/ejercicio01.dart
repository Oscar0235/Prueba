import 'package:flutter/material.dart';



void main(){
  runApp(Ejercicio01());
}

class Ejercicio01 extends StatelessWidget {
// ignore: unused_field
final _forkey =GlobalKey<FormState>();
// ignore: unused_field
final TextEditingController _initialSpeedController = TextEditingController();
// ignore: unused_field
final TextEditingController _finalSpedController = TextEditingController();
 
 
 
 @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://i.pinimg.com/originals/6b/71/e3/6b71e32c6eb59f985d121760ad9e3b77.jpg'),
            fit: BoxFit.cover,
          ),
        ),

child :Center(
  child: Padding(padding: const EdgeInsets.all(16.0),
  child: Form(
    key: _forkey,
    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        TextFormField(
          controller:_initialSpeedController,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(labelText:'velosidad inicial(V)',
                    labelStyle: TextStyle(color :Colors.white)),
          keyboardType: TextInputType.number,
         style: TextStyle(color :Colors.white),
          validator: (value){

            if (value == null || value.isEmpty) {
              return 'Ingrese la velosidad inicial';
            }
            return null;
          },
        ),
 TextFormField(
          controller:_finalSpedController,
          decoration: InputDecoration(labelText:'Velocidad FINAL (vf)',
          labelStyle: TextStyle(color :Colors.white)),
          keyboardType: TextInputType.number,
          style: TextStyle(color :Colors.white),
          validator: (value){

            if (value == null || value.isEmpty) {
              return 'Ingrese la velosidad final';
              
            }
            return null;
          },
        ),


        SizedBox(height: 30),
        ElevatedButton(onPressed: (){
          if (_forkey.currentState!.validate()){
            _calcular(context);

          }
        },
        child: Text('calcular'),
        
        ),
      ],
      )
    ),
  ),
),
     ),
     );
  }


void _calcular (BuildContext context){

final double inicioSpeed = double.parse(_initialSpeedController.text);
final double finalSpeed = double.parse(_finalSpedController.text);
// ignore: prefer_const_declarations
final double aceleracion =10;
// ignore: unused_local_variable
final double tiempo =(finalSpeed - inicioSpeed)/aceleracion;


// ignore: unused_local_variable
String message= tiempo >= 0 ?' El vehículo aprueba' :' El vehículo no aprueba';


showDialog(context: context,
 builder : (BuildContext context){
  return AlertDialog(
    // ignore: prefer_const_constructors
    title:Text('Resultado'),
    // ignore: prefer_const_constructors
    content:Text(message),
    actions: [
      TextButton(onPressed: (){
        Navigator.of(context).pop();
      },
 // ignore: prefer_const_constructors
 child: Text ('Cerrar')
 ),
    ],
  );

 },
);
}
}