import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travels_application_ucamp/models/place';

class DescriptionPlace extends StatefulWidget {
  const DescriptionPlace({
    super.key,
    required this.placesTravel,
  });
  final PlacesTravel placesTravel;

  @override
  State<DescriptionPlace> createState() => _DescriptionPlaceState();
}

class _DescriptionPlaceState extends State<DescriptionPlace>
    with SingleTickerProviderStateMixin {
  bool _isLiked = false;
  onLikeButtonPressed() {
    setState(() {
      _isLiked = !_isLiked;
      _controller.forward();
    });
  }

  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween(
      begin: 20.0,
      end: 40.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        ;
      });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
      tag: widget.placesTravel.namePlace,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    width: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.placesTravel.urlImage),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 300, right: 350),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 90,
                    left: 20,
                    child: Column(
                      children: [
                        Text(
                          widget.placesTravel.namePlace,
                          style: GoogleFonts.abel(
                            decoration: TextDecoration.none,
                            textStyle: const TextStyle(
                                fontSize: 35, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "📍${widget.placesTravel.city}",
                      style: GoogleFonts.abel(
                          textStyle: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              color: Color.fromARGB(255, 70, 68, 68),
                              fontWeight: FontWeight.bold)),
                    ),
                    GestureDetector(
                      onTap: () {
                        onLikeButtonPressed();
                      },
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Icon(
                            Icons.favorite,
                            color: _isLiked ? Colors.red : Colors.black,
                            size: _animation.value,
                          );
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.placesTravel.description,
                    style: GoogleFonts.abel(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
