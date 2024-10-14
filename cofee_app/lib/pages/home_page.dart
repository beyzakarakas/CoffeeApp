// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_element

import 'package:cofee_app/util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/coffee_type.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List coffeeType = [
    //coffeeType, isSelected
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Americano', false],
    ['Mocha', false],
    ['Macchiato', false],
  ];

  void coffeeTypeSelected(int index) {
    setState() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          //text
          Text(
            'Find the best coffee for you',
            style: GoogleFonts.bebasNeue(
              fontSize: 60,
            ),
          ),
          SizedBox(height: 25),

          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          //coffee types
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      });
                }),
          ),

          //cofee tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'assets/images/latte.jpeg',
                coffeeName: "Latte",
                coffeePrice: '4',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/cappucino.jpeg',
                coffeeName: "Cappucino",
                coffeePrice: '4.5',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/americano.jpeg',
                coffeeName: "Americano",
                coffeePrice: '5',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/mocha.jpeg',
                coffeeName: "Mocha",
                coffeePrice: '6.2',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/macchiato.jpeg',
                coffeeName: "Macchiato",
                coffeePrice: '8',
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.orange,
            ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
    );
  }
}
