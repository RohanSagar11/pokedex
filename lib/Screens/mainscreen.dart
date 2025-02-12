import 'package:flutter/material.dart';
import 'package:pokedex/Logic/mainprovider.dart';
import 'package:pokedex/Screens/menu.dart';
import 'package:pokedex/Screens/pokemonscreendetails.dart';
import 'package:pokedex/constants/colors.dart';
import 'package:provider/provider.dart';

import '../Models/mainscreenmodel.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<Map<String, String>> fetchnames = [];

  @override
  Widget build(BuildContext context) {

    void fetch() async {
      List<PokemonResult> pokemonnames = await MainProvider().fetchPokemonList();

      setState(() {
        // Map each PokemonResult to a Map containing name and URL
        fetchnames = pokemonnames.map((pokemon) {
          return {'name': pokemon.name, 'url': pokemon.url};
        }).toList();
      });
      // Print the first item from the list as a map
      // Output: {name: bulbasaur, url: https://pokeapi.co/api/v2/pokemon/1/}
    }

    fetch();

    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/pokeball1.png",
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pokèdèx",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: "EricaOne-Regular"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: primary,
                          ),
                          hintText: 'Search',
                          filled: true,
                          iconColor: primary,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Menu(),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.red,
                          size: 30,
                        ),
                        color: Colors.red,
                        splashColor: Colors.white,
                        highlightColor: Colors.red[100],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 360,
                width: 320,
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.grey),
                          BoxShadow(color: Colors.grey),
                          BoxShadow(color: Colors.grey),
                          BoxShadow(color: Colors.grey)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: fetchnames.isEmpty?Center(child: CircularProgressIndicator()):GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                          itemCount: fetchnames.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PokemonScreenDetails(number: "${fetchnames[index]['url'].toString()}",)));
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Colors.white,
                                        Colors.grey
                                      ]),
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(right: 5),
                                        child: Text(
                                          "#${index.toString()}",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(

                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Image.asset('assets/squirt.png'),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "${fetchnames[index]['name'].toString().capitalize()}",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                    )),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: primary,
              border: Border.all(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(15)),
          height: 540,
          width: 342,
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
