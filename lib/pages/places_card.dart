import 'package:flutter/material.dart';
import 'package:travels_application_ucamp/pages/description_place.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travels_application_ucamp/models/place';

class PlacesCard extends StatefulWidget {
  const PlacesCard({super.key});

  @override
  State<PlacesCard> createState() => _PlacesCardState();
}

class _PlacesCardState extends State<PlacesCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      body: GridView.builder(
        itemCount: placesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            mainAxisExtent: 350,
            childAspectRatio: 30),
        itemBuilder: (BuildContext context, int index) {
          return _buildItemButon(placesList[index], context);
        },
      ),
    );
  }
}

_buildItemButon(PlacesTravel placesTravel, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DescriptionPlace(
            placesTravel: placesTravel,
          ),
        ),
      );
    },
    child: Hero(
      tag: placesTravel.namePlace,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(placesTravel.urlImage),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 260, left: 10),
          child: Text(
            placesTravel.namePlace,
            style: GoogleFonts.aclonica(
              textStyle: const TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 236, 233, 233),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ),
  );
}

List<PlacesTravel> placesList = [
  PlacesTravel(
      "assets/img/monserrate.jpg",
      "El cerro de Monserrate es el más conocido de los cerros Orientales de Bogotá. Junto a Guadalupe es uno de los cerros tutelares de la ciudad. Monserrate tiene una altitud de 3152 m y se ubica sobre la cordillera oriental.1​Los cerros de Bogotá, de origen sedimentario, tienen por lo menos 16 millones de años de antigüedad, con rocas de edad cretácica pertenecientes al Grupo guadalupe, en lo que se refiere al aspecto geológico. Hasta mediados del siglo xvii fue conocido como cerro de Las Nieves. La basílica del Señor de Monserrate ha sido lugar de peregrinación religiosa desde la época colonial y se constituye en un atractivo natural, religioso, gastronómico de la ciudad. Se puede ascender al cerro por el sendero peatonal, por teleférico o por funicular.",
      "Monserrate",
      "Colombia",
      "Bogota D.C"),
  PlacesTravel(
      "assets/img/guatape.jpg",
      "El peñón de Guatapé, o piedra del Peñol (lengua tahamí: Mojarrá), es un monolito de 220 metros de altura, localizado en el término municipal de Guatapé, Antioquia, Colombia.1​ La piedra de El Peñol es una masa granítica, compuesta por cuarzo, feldespato y mica, fue escalada por primera vez en 16 de julio de 1954 por un habitante de la zona, Luis Eduardo Villegas López. Actualmente se puede acceder a su cumbre subiendo los 715 escalones construidos en el monolito.",
      "Piedra del Peñon",
      "Colombia",
      "Medellin"),
  PlacesTravel(
      "assets/img/buga.jpg",
      "Buga, oficialmente Guadalajara de Buga, es un municipio colombiano del centro del departamento del Valle del Cauca. Es famoso por la Basílica del Señor de los Milagros, a la que acuden peregrinos de todo el mundo. Está situado en la parte plana del Valle del Cauca. Es una de las ciudades con más historia, no solo en el departamento, sino en el país, su historia corre paralelamente a la historia del Estado Soberano del Cauca y del Valle del Cauca, posee una gran arquitectura colonial y moderna. La ciudad en crecimiento se considera un polo de desarrollo para el departamento del Valle del Cauca. Hace parte de la Red de pueblos patrimonio de Colombia.",
      "Buga",
      "Colombia",
      "Cali"),
  PlacesTravel(
      "assets/img/catedral_de_sal.jpg",
      " La Catedral de la Sal es un recinto construido en el interior de las minas de sal de Zipaquirá, en el departamento de Cundinamarca, Colombia.En 2007 mediante un concurso para elegir las 7 Maravillas de Colombia; la Catedral de Sal obtuvo la mayor votación; convirtiéndola en la Maravilla No.1 de Colombia, aunque también fue propuesta entre las Nuevas siete maravillas del mundo moderno.",
      "Catedral de ̣̣̣̣\n Sal",
      "Colombia",
      "Zipaquira"),
  PlacesTravel(
      "assets/img/cristales.jpg",
      "Caño Cristales es un río de Colombia que está ubicado en la sierra de la Macarena, en el municipio del mismo nombre, en el departamento del Meta. Ha sido denominado «el río de los dioses», «el río de los siete colores», «el arco iris que se derritió» e, incluso, «el río más hermoso del mundo»,1​ ya que en su fondo se reproducen plantas acuáticas que con la exposición al sol cambian de color en un proceso que va desde el verde hasta un rojo intenso. Esto produce el efecto visual de estar frente a un río de seis colores: rojo, amarillo y verde, por las plantas; negro, por el agua de selva que baja por allí; azul, por el reflejo del cielo; y blanco, por la espuma formada por las caídas de agua.",
      "Caño\n Cristales",
      "Colombia",
      "Macarena"),
  PlacesTravel(
      "assets/img/santuario.jpg",
      "El Santuario de Nuestra Señora del Rosario de Las Lajas es un templo y basílica para el culto católico y veneración de Nuestra Señora de Las Lajas. Este santuario se ubica en Ipiales, en el departamento de Nariño, al sur de Colombia y es destino de peregrinación y turismo desde el siglo xviii.",
      "Santuario las Jalas",
      "Colombia",
      "Pasto"),
  PlacesTravel(
      "assets/img/amazonas.jpg",
      "Amazonas es uno de los treinta y dos departamentos que, junto con Bogotá, Distrito Capital, forman la República de Colombia. Su capital es Leticia. Está ubicado en el extremo sur del país, en gran parte al sur de la línea ecuatorial, en la región Amazonia. Con 110 000 km² es el departamento más extenso de Colombia, con unos 83 808 habitantes en 2023, el cuarto menos poblado —por delante de San Andrés y Providencia, Guainía y Vaupés, el menos poblado— y con 0.76 Hab/Km², el tercero menos densamente poblado, por delante de Vichada y Guainía, el menos densamente poblado.",
      "Amazonas",
      "Colombia",
      "Amazonas"),
  PlacesTravel(
      "assets/img/valle_cocora.jpg",
      "El valle de Cocora es un paisaje natural localizado en la cordillera central de los Andes colombianos, específicamente en el departamento del Quindío, en el área de influencia del Parque nacional natural Los Nevados. Cuenta con algunas poblaciones del árbol nacional de Colombia, la palma de cera del Quindío (Ceroxylon quindiuense), así como de una gran variedad de flora y fauna, mucha de ella en peligro de extinción, protegida bajo el estatus de parque nacional natural. El valle, así como la localidad cercana de Salento, se ubican entre los principales destinos turísticos de Colombia",
      "Valle de Cocora",
      "Colombia",
      "Quindio")
];
