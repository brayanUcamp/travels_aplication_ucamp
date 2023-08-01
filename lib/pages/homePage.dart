import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travels_application_ucamp/pages/places_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        body(),
        Padding(
          padding: const EdgeInsets.only(top: 200, left: 20),
          child: _title(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350, left: 20),
          child: _subTitle(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 600, left: 20),
          child: _button(context),
        )
      ],
    );
  }

  Container body() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage("assets/img/colombia.jpg")),
      ),
    );
  }

  Text _title() {
    return Text(
      "Colombia Un País Magíco",
      style: GoogleFonts.aclonica(
        textStyle: const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Text _subTitle() {
    return Text(
      "Conocé nuestros lugares Turisticos",
      style: GoogleFonts.aboreto(
        textStyle: const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

Center _button(BuildContext context) {
  return Center(
    child: GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlacesCard(),
        ),
      ),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 252, 214, 4),
              Color.fromARGB(255, 3, 22, 190),
              Color.fromARGB(255, 245, 20, 3)
            ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            "Ingresa Aquí",
            style: GoogleFonts.aboreto(
              textStyle: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontFamily: 'Montserrat-Bold',
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
