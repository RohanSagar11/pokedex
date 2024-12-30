

import 'package:flutter/material.dart';
import 'package:pokedex/Screens/mainscreen.dart';
import 'package:pokedex/Logic/mainprovider.dart';
import '../Models/mainscreenmodel.dart';
import '../constants/colors.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PokemonScreenDetails extends StatefulWidget {
  final String number;
   PokemonScreenDetails({super.key, required this.number,});

  @override
  State<PokemonScreenDetails> createState() => _PokemonScreenDetailsState();
}

class _PokemonScreenDetailsState extends State<PokemonScreenDetails> {
  List<PokemonDetails> ability = [];
  String get number => widget.number;


  @override
  Widget build(BuildContext context) {

    void fetch() async {
      try {
        List<PokemonDetails> pokemonnames = await MainProvider().fetchPokemonDetail(number);
        setState(() {
          ability = pokemonnames;
        });
        ability = pokemonnames;
        print("Fetched ${pokemonnames.length} Pokémon abilities.");
      } catch (e) {
        print("Error fetching Pokémon details: $e");
      }
    }

    var size = MediaQuery.sizeOf(context);
    fetch();
    return  Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,

          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.cyan,
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
                    IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Mainscreen()));
                    }, icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Pokemon Name", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25,),),
                    ),
                  SizedBox(width: 3,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("#999", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 17,),),
                  )
                ],),
              ],

            ),

            ),
          Padding(
            padding: const EdgeInsets.only(left: 120.0),
            child: Image.asset("assets/pokeball.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(15)),
              height: 320,
              width: 320,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0,bottom: 5.0),
                            child: Text(

                              'Water',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'About',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Icon(Icons.shopping_bag),
                                  Text('9.0 kg'),
                                  SizedBox(height: 5,),
                                  Text('Weight',style:TextStyle(fontSize: 11),),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(Icons.height),
                                  Text('0.5 m'),
                                  SizedBox(height: 5,),
                                  Text('Height',style:TextStyle(fontSize: 11),),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Torrent'),
                                  Text('Rain-Dash'),
                                  SizedBox(height: 5,),
                                  Text('Moves',style: TextStyle(fontSize: 11),),
                                ], ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("When it retracts its long neck into its shell, it squirts out water with vigorous force"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Base Stats',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                              child: Row(
                                children: [
                                  Center(child: Text('HP :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)),
                                  SizedBox(width: 30,),
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20) ,
                                          color: Colors.cyanAccent[100]
                                      ),
                                      child: Divider(
                                        thickness: 3,
                                        indent: 2,
                                        endIndent: 50,
                                        color: Colors.cyan,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Align(
                              child: Row(
                                children: [
                                  Center(child: Text('ATK :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)),
                                  SizedBox(width: 22,),
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20) ,
                                          color: Colors.cyanAccent[100]
                                      ),
                                      child: Divider(
                                        thickness: 3,
                                        indent: 2,
                                        endIndent: 50,
                                        color: Colors.cyan,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Align(
                              child: Row(
                                children: [
                                  Center(child: Text('DEF :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)),
                                  SizedBox(width: 22,),
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20) ,
                                          color: Colors.cyanAccent[100]
                                      ),
                                      child: Divider(
                                        thickness: 3,
                                        indent: 2,
                                        endIndent: 50,
                                        color: Colors.cyan,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Align(
                              child: Row(
                                children: [
                                  Center(child: Text('SATK :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)),
                                  SizedBox(width: 13,),
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20) ,
                                          color: Colors.cyanAccent[100]
                                      ),
                                      child: Divider(
                                        thickness: 3,
                                        indent: 2,
                                        endIndent: 50,
                                        color: Colors.cyan,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Align(
                              child: Row(
                                children: [
                                  Center(child: Text('SDEF :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)),
                                  SizedBox(width: 13,),
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20) ,
                                          color: Colors.cyanAccent[100]
                                      ),
                                      child: Divider(
                                        thickness: 3,
                                        indent: 2,
                                        endIndent: 50,
                                        color: Colors.cyan,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Align(
                              child: Row(
                                children: [
                                  Center(child: Text('SPD :', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)),
                                  SizedBox(width: 22,),
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20) ,
                                          color: Colors.cyanAccent[100]
                                      ),
                                      child: Divider(
                                        thickness: 3,
                                        indent: 2,
                                        endIndent: 50,
                                        color: Colors.cyan,),
                                    ),
                                  ),

                                ],
                              ),
                            ),



                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Types',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Chip(label: Text("${ability[0].abilityname1}")),
                            Chip(label: Text('${ability[1].abilityname1}')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Image.asset("assets/squirt.png",scale: 3,),
          ),

          ],
        ),
      ),

    );
  }
}
