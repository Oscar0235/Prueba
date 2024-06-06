import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


void main(){
  runApp(Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
 
final _forkey =GlobalKey<FormState>();
final TextEditingController _alturaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/web.jpg'),
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
          controller:_alturaController,
          decoration: InputDecoration(labelText:'Altura(h)'),
          keyboardType: TextInputType.number,
          validator: (value){

            if (value == null || value.isEmpty) {
              return 'Ingrese la altura';
            }
            return null;
          },
        ),

        SizedBox(height: 30),
        ElevatedButton(onPressed: (){
          if (_forkey.currentState!.validate()){
            _CalcularPresion(context);

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


void _CalcularPresion (BuildContext context){

final double altura = double.parse(_alturaController.text);
final double densidad =1025.0;
final double gravedad =9.8;
final double presion =densidad * gravedad *altura;

showDialog(context: context,
 builder : (BuildContext context){
  return AlertDialog(
    title:Text('Resultado'),
    content:Text('La presion es : $presion'),
    actions: [
      TextButton(onPressed: (){
        Navigator.of(context).pop();
      },
 child: Text ('Cerrar')
 ),
    ],
  );

 },
);
}
}