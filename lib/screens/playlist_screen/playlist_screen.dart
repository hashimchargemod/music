import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/global%20widgets/designs/bouncing_button_widget.dart';

class PlayListScreen extends StatefulWidget {
  final List<String> playListName;
  const PlayListScreen({super.key, required this.playListName});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

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

class _PlayListScreenState extends State<PlayListScreen> {
  bool isfav = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double scrWidth = size.width;
    double scrHeight = size.height;
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
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Color(0xff433E48),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: widget.playListName.elementAt(2),
                fit: BoxFit.fitWidth,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const BouncingButtonWidget(
                          child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                    ),
                    const Expanded(child: SizedBox()),
                    const BouncingButtonWidget(
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: scrHeight * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.playListName.elementAt(0),
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(widget.playListName.elementAt(1),
                            style: GoogleFonts.openSans(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              color: const Color(0xffA5A5A5),
                            )),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isfav = !isfav;
                        });
                      },
                      child: BouncingButtonWidget(
                        child: Icon(
                          isfav ? Icons.favorite : Icons.favorite_border,
                          color: isfav ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: BouncingButtonWidget(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
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
                          child: const Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
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
                            height: MediaQuery.of(context).size.width * 0.225,
                            child: GestureDetector(
                              child: BouncingButtonWidget(
                                child: Container(
                                  color: Colors.transparent,
                                  height:
                                      MediaQuery.of(context).size.width * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Color(0xff433E48),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
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
                                        padding: const EdgeInsets.symmetric(
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
                                                style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      MediaQuery.of(context)
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
                                                style: GoogleFonts.openSans(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.035,
                                                  color:
                                                      const Color(0xffA5A5A5),
                                                )),
                                          ],
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text("2:02",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
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
            ],
          )),
        ],
      ),
    );
  }
}
