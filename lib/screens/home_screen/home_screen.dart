import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/global%20widgets/designs/bouncing_button_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> topList = [
  "Recent",
  "Top 50",
  "Chill",
  "R&B",
  "Festival",
  "Pop",
  "Element",
  "Classics"
];
String tapped = "Recent";

List<List<String>> playlists = [
  [
    "Today's Hits",
    "Chill Your Mind",
    "https://marketplace.canva.com/EAFctkUT4qU/1/0/1600w/canva-colorful-cool-lonely-man-watching-the-sunset-photo-album-cover-2aE_LYxWtEI.jpg"
  ],
  [
    "Relaxing Instrument",
    "Made for you",
    "https://cms-assets.tutsplus.com/cdn-cgi/image/width=1700/uploads/users/114/posts/34296/final_image/Final-image.jpg"
  ],
  [
    "Workout Energy",
    "Special For You",
    "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/9/9/r/medium-butcute3748-album-cover-xxxtentacion-skins-matte-finish-original-imagkca87szrxhds.jpeg"
  ],
  [
    "Daily Mix",
    "Made for you",
    "https://images.prismic.io/milanote/df7eeb83a07162b45ac2e882cac055de9411054a_cover.jpg"
  ]
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(1, 1),
                colors: <Color>[
                  Colors.black,
                  Colors.purple,
                  Color.fromARGB(255, 28, 6, 68),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
          ),
          SafeArea(
              bottom: false,
              child: Container(
                width: double.maxFinite,
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Welcome Back!",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("What do you feel like today?",
                            style: GoogleFonts.openSans(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: BouncingButtonWidget(
                          child: Container(
                            height: 50,
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff433E48),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.search,
                                  color: Color(0xffA5A5A5),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Search song, playslist, artist...",
                                    style: GoogleFonts.openSans(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      color: const Color(0xffA5A5A5),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.08,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            // shrinkWrap: true,
                            itemCount: topList.length + 1,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 10, vertical: 10),
                            // physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => index == 0
                                ? const SizedBox(
                                    width: 20,
                                  )
                                : SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                    width: 60,
                                    child: GestureDetector(
                                      onTap: () => setState(() {
                                        tapped = topList.elementAt(index - 1);
                                      }),
                                      child: BouncingButtonWidget(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(topList.elementAt(index - 1),
                                              style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.035,
                                                color: Colors.white,
                                              )),
                                          if (tapped ==
                                              topList.elementAt(index - 1))
                                            Container(
                                              height: 5,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(200)),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment(2, 1),
                                                  colors: <Color>[
                                                    Color(0xff842ED8),
                                                    Color(0xffDB28A9),
                                                    Color(0xff9D1DCA),
                                                  ],
                                                  tileMode: TileMode.mirror,
                                                ),
                                              ),
                                            )
                                        ],
                                      )),
                                    ),
                                  )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.6,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            // shrinkWrap: true,
                            itemCount: playlists.length + 1,
                            scrollDirection: Axis.horizontal,
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 10, vertical: 10),
                            // physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => index == 0
                                ? const SizedBox(
                                    width: 20,
                                  )
                                : SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.6,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: GestureDetector(
                                      onTap: () => Navigator.of(context)
                                          .pushNamed(
                                              '/HomeScreenPage/PlayListScreen',
                                              arguments: playlists
                                                  .elementAt(index - 1)),
                                      child: BouncingButtonWidget(
                                        child: Container(
                                          color: Colors.transparent,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.52,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Color(0xff433E48),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child: CachedNetworkImage(
                                                    imageUrl: playlists
                                                        .elementAt(index - 1)
                                                        .elementAt(2),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        playlists
                                                            .elementAt(
                                                                index - 1)
                                                            .elementAt(0),
                                                        style: GoogleFonts
                                                            .openSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                          color: Colors.white,
                                                        )),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                        playlists
                                                            .elementAt(
                                                                index - 1)
                                                            .elementAt(1),
                                                        style: GoogleFonts
                                                            .openSans(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.035,
                                                          color: const Color(
                                                              0xffA5A5A5),
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                      ),
                      // const SizedBox(
                      //   height: 1,
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Your favourites",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              // shrinkWrap: true,
                              itemCount: 3,
                              scrollDirection: Axis.vertical,
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 10, vertical: 10),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.225,
                                    child: GestureDetector(
                                      child: BouncingButtonWidget(
                                        child: Container(
                                          color: Colors.transparent,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Color(0xff433E48),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child: CachedNetworkImage(
                                                    imageUrl: playlists
                                                        .elementAt(index)
                                                        .elementAt(2),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        playlists
                                                            .elementAt(index)
                                                            .elementAt(0),
                                                        style: GoogleFonts
                                                            .openSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                          color: Colors.white,
                                                        )),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                        playlists
                                                            .elementAt(index)
                                                            .elementAt(1),
                                                        style: GoogleFonts
                                                            .openSans(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.035,
                                                          color: const Color(
                                                              0xffA5A5A5),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              const Expanded(child: SizedBox()),
                                              Text("2:02",
                                                  style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.04,
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ]),
              )),
        ],
      ),
    );
  }
}
