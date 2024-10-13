// cocktail_home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cocktail.dart';
import 'cocktail_card.dart';

class CocktailHomePage extends StatelessWidget {
  final List<Cocktail> cocktails = [
    Cocktail(
      name: '"SEX ON THE BEACH"',
      image: 'assets/sex_on_the_beach.jpg',
      isFavorite: true,
      description: 'Napój alkoholowy',
      longDescription:
          'Sex on the Beach to owocowy, słodki koktajl na bazie wódki, likieru brzoskwiniowego, soku pomarańczowego i żurawinowego. Orzeźwiający i idealny na letnie wieczory, z przyjemnym połączeniem cytrusowych i słodkich nut.',
      ingredients: [
        '40 ml wódki',
        '20 ml likieru brzoskwiniowego (Peach Schnapps)',
        '40 ml soku pomarańczowego',
        '40 ml soku żurawinowego',
        'Kostki lodu',
      ],
      preparation: [
        'W shakerze z lodem wymieszaj wódkę, likier brzoskwiniowy, sok pomarańczowy i sok żurawinowy.',
        'Wstrząśnij energicznie, aby wszystkie składniki dobrze się połączyły.',
        'Przelej koktajl do wysokiej szklanki z lodem.',
        'Udekoruj plasterkiem pomarańczy lub wisienką koktajlową',
      ],
    ),
    Cocktail(
      name: '"MOJITO"',
      image: 'assets/mojito.jpg',
      isFavorite: false,
      description: 'Napój alkoholowy',
      longDescription:
          'Mojito to orzeźwiający, karaibski koktajl na bazie rumu. Składa się z białego rumu, świeżej mięty, limonki, cukru trzcinowego oraz wody gazowanej. Jest to lekki, świeży drink idealny na gorące dni, podawany z lodem.',
      ingredients: [
        '50 ml białego rumu',
        '6-8 liści mięty',
        '2 łyżeczki cukru trzcinowego',
        '25 ml soku z limonki',
        'Woda gazowana',
        'Kostki lodu'
      ],
      preparation: [
        'W szklance typu highball umieść liście mięty, cukier i sok z limonki.',
        'Delikatnie ugnieć, aby wydobyć aromat mięty.',
        'Dodaj lód, rum i wodę gazowaną.',
        'Całość wymieszaj łyżką barmańską.',
        'Udekoruj miętą i plasterkiem limonki.',
      ],
    ),
    Cocktail(
      name: '"PINA COLADA"',
      image: 'assets/pina_colada.jpg',
      isFavorite: false,
      description: 'Napój alkoholowy',
      longDescription:
          'Tropikalny koktajl na bazie rumu, mleka kokosowego i soku ananasowego, '
          'doskonały do relaksu w słońcu.',
      ingredients: ['Rum', 'Mleko kokosowe', 'Sok ananasowy'],
      preparation: [
        'W szklance typu highball umieść liście mięty, cukier i sok z limonki.',
        'Delikatnie ugnieć, aby wydobyć aromat mięty.',
        'Dodaj lód, rum i wodę gazowaną.',
        'Całość wymieszaj łyżką barmańską.',
        'Udekoruj miętą i plasterkiem limonki.',
      ],
    ),
    Cocktail(
      name: '"MARTINI"',
      image: 'assets/martini.jpg',
      isFavorite: false,
      description: 'Napój alkoholowy',
      longDescription:
          'Elegancki koktajl łączący gin z wermutem, podawany w schłodzonym kieliszku, '
          'idealny na każdą okazję.',
      ingredients: ['Gin', 'Wermut'],
      preparation: [
        'W szklance typu highball umieść liście mięty, cukier i sok z limonki.',
        'Delikatnie ugnieć, aby wydobyć aromat mięty.',
        'Dodaj lód, rum i wodę gazowaną.',
        'Całość wymieszaj łyżką barmańską.',
        'Udekoruj miętą i plasterkiem limonki.',
      ],
    ),
    Cocktail(
      name: '"COSMOPOLITAN"',
      image: 'assets/cosmopolitan.jpg',
      isFavorite: false,
      description: 'Napój alkoholowy',
      longDescription:
          'Stylowy koktajl o wyraźnym smaku cytrusów i delikatnej słodyczy, '
          'doskonały na wieczorne wyjścia.',
      ingredients: ['Wódka', 'Cointreau', 'Sok z limonki', 'Sok żurawinowy'],
      preparation: [
        'W szklance typu highball umieść liście mięty, cukier i sok z limonki.',
        'Delikatnie ugnieć, aby wydobyć aromat mięty.',
        'Dodaj lód, rum i wodę gazowaną.',
        'Całość wymieszaj łyżką barmańską.',
        'Udekoruj miętą i plasterkiem limonki.',
      ],
    ),
    Cocktail(
      name: '"DAIQUIRI"',
      image: 'assets/daiquiri.jpg',
      isFavorite: false,
      description: 'Napój alkoholowy',
      longDescription:
          'Pyszny koktajl na bazie rumu, idealny na lato, łączący słodkie i kwaśne smaki.',
      ingredients: ['Rum', 'Cukier', 'Sok z limonki'],
      preparation: [
        'W szklance typu highball umieść liście mięty, cukier i sok z limonki.',
        'Delikatnie ugnieć, aby wydobyć aromat mięty.',
        'Dodaj lód, rum i wodę gazowaną.',
        'Całość wymieszaj łyżką barmańską.',
        'Udekoruj miętą i plasterkiem limonki.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/Logo/LOGO.svg',
              height: 24.0,
              width: 24.0,
            ),
            const SizedBox(width: 8),
            const Text(
              'Cocktail.io',
              style: TextStyle(
                fontFamily: 'Aboreto',
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            iconSize: 26,
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'EN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.7,
        ),
        itemCount: cocktails.length,
        itemBuilder: (context, index) {
          return CocktailCard(cocktail: cocktails[index]);
        },
      ),
    );
  }
}
