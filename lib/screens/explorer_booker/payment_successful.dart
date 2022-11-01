import 'package:settings_page/util/exports.dart';
import 'package:video_player/video_player.dart';

class PaymentSuccesful extends StatefulWidget {
  @override
  State<PaymentSuccesful> createState() => _PaymentSuccesfulState();
}

class _PaymentSuccesfulState extends State<PaymentSuccesful> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    _playVideo();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  _playVideo() {
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/tryVid.mp4');
    videoPlayerController.addListener(() => setState(() {}));
    videoPlayerController.setLooping(true);
    videoPlayerController.initialize().then((_) => setState(() {}));
    videoPlayerController.play();
  }

  String videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidgetNew(
            appBarTitle: "3 Elements - Adult Class",
            hasActions: true,
            leadingWidget: Icon(
              Icons.close,
              size: 20,
            ),
            leadingWidgetColor: Constants.inactiveIconColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34),
            child: Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonImageView(
                    svgPath: "assets/images/icon_successful.svg",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "lbl_booked_success".tr,
                    style: AppStyle.poppinsTextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Constants.gray900,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width,
                    height: height * 0.3268,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        //color: Constants.fromHex("#2D3259"),
                        color: Constants.horizontalLineColor,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: videoPlayerController.value.isInitialized
                          ? Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    videoPlayerController.pause();
                                  },
                                  child: VideoPlayer(videoPlayerController),
                                ),
                                Positioned(
                                  left: 18,
                                  right: 18,
                                  bottom: 24,
                                  child: ValueListenableBuilder(
                                    valueListenable: videoPlayerController,
                                    builder: (context, VideoPlayerValue value,
                                        child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            videoDuration(value.position) +
                                                ' ' +
                                                '/' +
                                                ' ' +
                                                videoDuration(value.duration),
                                            style: AppStyle.poppinsTextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          CommonImageView(
                                            svgPath:
                                                "assets/images/icon_expand_video.svg",
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  //padding: const EdgeInsets.all(8.0),
                                  //top: 206,
                                  left: 16,
                                  right: 16,
                                  bottom: 8,
                                  child: VideoProgressIndicator(
                                    videoPlayerController,
                                    allowScrubbing: true,
                                    colors: VideoProgressColors(
                                        playedColor: Constants.lightBlue500,
                                        bufferedColor: Colors.white,
                                        backgroundColor: Color.fromRGBO(
                                            255, 255, 255, 0.33)),
                                  ),
                                ),
                                Center(
                                  child: Visibility(
                                    visible:
                                        !videoPlayerController.value.isPlaying,
                                    child: GestureDetector(
                                      onTap: () {
                                        videoPlayerController.play();
                                      },
                                      child: CommonImageView(
                                        svgPath:
                                            "assets/images/icon_play_pause.svg",
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  SizedBox(
                    height: 58,
                  ),
                  Button(
                    text: "lbl_open_my_bookings".tr.toUpperCase(),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
