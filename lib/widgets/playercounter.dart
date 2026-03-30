// import 'package:flutter/material.dart';
// class PlayerCounter extends StatelessWidget{
//     final int count;
//     final VoidCallbackAction? onIncrement;
//     final VoidCallbackAction? onDecrement;

//     const PlayerCounter({
//         super.key,
//         required this.count,
//         required this.onDecrement,
//         required this.onIncrement,
//     });

//     @override
//     Widget build(BuildContext context){
//       return Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(20),
          
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
//         child: Row(children: [
//           IconButton(onPressed: onDecrement, icon: const Icon(Icons.remove)),
//           Text("$count", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//           IconButton(onPressed: onIncrement, icon: const Icon(Icons.add)),
//         ],),
//       );
//     }
// }