import 'package:cocoon/models/artist.dart';
import 'package:flutter/material.dart';


class Constant {
  static String jsonExt = ".json";

  static String baseUrl = "https://cocoon-6c569.firebaseio.com/";
  static String newsletters = "/newsletters";
  static String ibiza = "/ibiza";
  static String events = "/events";
  static String carauselImages = "carausel";
  static String gridImages = "grids";
  static String recordings = "recordings";
  static String privacyPolicy = "https://www.cocoon.net/privacy-policy/";
  static String legalNotice = "https://www.cocoon.net/legal-notice/";

  static TextStyle defaultTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
    decoration: TextDecoration.none,
  );

  static List<Artist> artistList = [
    Artist(
      id: '1',
      name: 'André Galluzzi',
      imgUrl: 'assets/artists/andre_galluzzi.jpg',
      fb: 'https://www.facebook.com/AndreGalluzzi.official/',
      insta: 'https://www.instagram.com/andregalluzzi_official/',
      residentAdvisor: 'https://www.residentadvisor.net/dj/andregalluzzi',
      scoundCloud: 'https://soundcloud.com/andre-galluzzi',
      address: 'Berlin, Germany',
      aboutMe: 'André Galluzzi has been a vinyl DJ for over 25 years, with residencies at Tresor, Ostgut and Berghain. The past two decades have seen him release on labels like Cadenza, Cocoon, Ostgut Ton and Highgrade; also co-founder of Taksi Records and label head of Aras, looking back at quite a bit of history.',
      pressKit:
          'https://drive.google.com/drive/folders/1x1QSImH7vp3L395WXuMTVmZCljVmj5bO',
    ),
    Artist(
      id: '2',
      name: 'Dana Ruh',
      imgUrl: 'assets/artists/dana_ruh.jpg',
      fb: 'https://www.facebook.com/danaruh/',
      insta: 'https://www.instagram.com/danaruh/',
      residentAdvisor: 'https://www.residentadvisor.net/dj/danaruh',
      scoundCloud: 'https://soundcloud.com/danaruh',
      address: 'Berlin, Germany',
      aboutMe: 'Born and raised in Germany‘s small town Gera, Dana Ruh soon found her way to the capital city Berlin and since then has been on a constantly evolving musical journey. In the early years her sound was rooted in techno and landed most often on the label she set up with friend Ann in 2007 (though Anthea also joined the ranks in 2012). Named Brouqade, this label has become a go to outlet for contemporary club sounds and has helped established Dana as one of underground dance music’s leading ladies.',
      pressKit:
          'https://drive.google.com/open?id=1sDtv7WubYdBIIbIw1uNiwJOiXYPsU8GY',
    ),
    Artist(
      id: '3',
      name: 'Dorian Paic',
      imgUrl: 'assets/artists/dorian_paic.png',
      fb: 'https://www.facebook.com/Dorian-Paic-778791745523113/',
      insta: '',
      residentAdvisor: 'https://www.residentadvisor.net/dj/dorianpaic',
      scoundCloud: '',
      address: 'Berlin, Germany',
      aboutMe: 'For historians, there are only few better biographies than that of Dorian Paic to illustrate the Techno and House history of Frankfurt: the jet set disco Dorian Gray, a place called Music Hall, Sven Väths legendary Omen, the cult club XS or the younger high altars like the Monza or theRobert Johnson in Offenbach - Paic has been involved in one or another way.',
      pressKit:
          'https://drive.google.com/open?id=1bLY2ZkPXx1M2uaiKqqyQd3InI6iXcRIQ',
    ),
    Artist(
      id: '4',
      name: 'Emanuel Satie',
      imgUrl: 'assets/artists/emanuel.png',
      fb: 'https://www.facebook.com/emanuel.satie/',
      insta: 'https://www.instagram.com/emanuelsatie/',
      residentAdvisor: 'https://www.residentadvisor.net/dj/emanuelsatie',
      scoundCloud: 'https://soundcloud.com/emanuel-satie',
      address: 'Berlin, Germany',
      aboutMe: 'Since first deciding to make producing and DJing his full time career, Frankfurt-born, Berlin- based house and techno producer Emanuel Satie had been steadily picking up steam with straight to dancefloor hits on DTFD, Get Physical and Gruuv, plus a stunning remix on The 2 Bears ‘The Night Is Young’ remix LP, which led him to be featured in Resident Advisor’s top charted tracks of the year in 2015.',
      pressKit:
          'https://drive.google.com/open?id=1IKF1F7HnjVQ6YNZHbd3RU8ns4zwAZfh_',
    ),
    Artist(
      id: '5',
      name: 'Fabe',
      imgUrl: 'assets/artists/fabe.jpg',
      fb: 'https://www.facebook.com/fabeagain/',
      insta: 'https://www.instagram.com/fabe86/',
      residentAdvisor: 'https://www.residentadvisor.net/dj/fabe',
      scoundCloud: 'https://soundcloud.com/fabeagain',
      address: 'Mannheim, Germany',
      aboutMe: 'Mannheim own Fabe has an unpredictable way of surprising the crowd with his natural use ofthe edgy essence of classic house drive and uptlifiting dynamic groove, with a forceful touch oftechno. Rising to moderate prominence as resident of BE9 and founder of his own label, SaltyNuts, his music production and sets are mainly influenced by his roots, shape-shifting throughcrowds and constantly interconnecting with them.',
      pressKit:
          'https://drive.google.com/open?id=13RZwv9nFko68tx8n_Cx_Pae32CK189zp',
    ),
    Artist(
      id: '6',
      name: 'Gregor Tresher',
      imgUrl: 'assets/artists/gregor.jpg',
      fb: 'https://www.facebook.com/gregortresherofficial/',
      insta: 'https://www.instagram.com/gregortresher/',
      residentAdvisor: 'https://www.residentadvisor.net/dj/gregortresher',
      scoundCloud: 'https://soundcloud.com/gregortresher',
      address: 'Frankfurt',
      aboutMe: 'In the trend-driven universe of electronic dance music, Gregor Tresher is the rare artist who transcends such cycles. His secret? A relentless focus on melody and timbre, timeless musical elements that other producers often undervalue. Just as a painting or a photograph appears to move if one stares at it long enough,',
      pressKit:
          'https://drive.google.com/open?id=1pKC2QJjGUz5PegpW7EfWBFuHx22M2oVZ',
    ),
    Artist(
      id: '7',
      name: 'Michael Klein',
      imgUrl: 'assets/artists/Michael_Klein.jpg',
      fb: 'https://www.facebook.com/MichaelkleinPublic/',
      insta: 'https://www.instagram.com/michaelkleinberlin/',
      residentAdvisor: 'https://www.residentadvisor.net/dj/michaelklein',
      scoundCloud: 'https://soundcloud.com/michaelkleinberlin',
      aboutMe: 'Dark but groovy basslines are what defines the unique sound of Michael Klein. Born in Frankfurt, the former techno capital of Germany, raised by thesounds of Cocoon and Robert Johnson, Michael quickly found his passion forgradually teasing and heavy grooves. His releases reflect a wide range of sound from raw straightforward technoto groovy dubby sounds up to experimental and complex journeys through noises.',
      address: 'Berlin, Germany',

    ),
    Artist(
      id: '8',
      name: 'Sven Väth',
      imgUrl: 'assets/artists/sven.png',
      fb: 'https://www.facebook.com/SvenVaethOfficial/',
      insta: 'https://www.instagram.com/svenvaeth_official/',
      dates: 'https://www.cocoon.net/sven-vath/#events',
      address: ' London, England',
      scoundCloud: '',
      residentAdvisor: '',
      aboutMe: 'Sven Väth is quite simply unique. A legend in his own lifetime with a commitment and passion that has influenced the advance and evolution of electronic music. Clubs, record labels and careers have been launched. There are some people that are destined to emerge and change things. Change landscapes. Sven Väth is a risk taking visionary, an instigator, an innovator and very possibly invincible.',
      pressKit:
          'https://drive.google.com/drive/folders/1zG_-BFaE7rHB8ljyw1zVJde38ddYOsnA?usp=sharing',
    ),
    Artist(
      id: '9',
      name: 'DubLab',
      imgUrl: 'assets/artists/dublab.jpg',
      fb: 'https://www.facebook.com/dublab.pt/',
      insta: 'https://www.instagram.com/dublab.pt/',
      vimeo: 'https://vimeo.com/dublabpt',
      website: 'http://www.dublab.pt/',
      address: 'Lisbao, Portugal',
      scoundCloud: '',
      residentAdvisor: '',
      aboutMe: 'DubLab is the new label of Dub Video Connection, mix-media studio based in Lisbon since 1997. DubLab used to be the name of our Arts & Experimentation department, but now we became this department. New name, new life.',
      pressKit:
          'http://dublab.pt/wp-content/uploads/2017/10/Dossier_Stage_&_Visuals_2017_1.1-compressed.pdf',
    ),
  ];
}
