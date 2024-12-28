

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PokemonScreenDetails extends StatefulWidget {
  const PokemonScreenDetails({super.key});

  @override
  State<PokemonScreenDetails> createState() => _PokemonScreenDetailsState();
}

class _PokemonScreenDetailsState extends State<PokemonScreenDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return  Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,

          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(15)),
              height: 540,
              width: 342,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Pokemon Name", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25,),),
                    ),
                  SizedBox(width: 19,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("#999", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 17,),),
                  )
                ],),
              ],

            ),

            ),
          Padding(
            padding: const EdgeInsets.only(top: 270),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(15)),
              height: 260,
              width: 320,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset("assets/pngegg(2).png",scale: 3,),
          ),

          ],
        ),
      ),

    );
  }
}
