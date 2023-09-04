import 'package:btms_refee/Constants/Color/hexa_color.dart';
import 'package:btms_refee/Pages/TournamentDetail_Incoming/controller/tournament_detail_incoming_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentDetailIncomingScreen
    extends GetView<TournamentDetailIncomingController> {
  const TournamentDetailIncomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            // Get.back(closeOverlays: true);
            Get.toNamed(Routes.homeScreen);
          },
        ),
        elevation: 1,
        title: const Column(
          children: [
            Text(
              'Chi tiết giải đấu',
              style: TextStyle(color: Colors.black87, fontSize: 30),
            ),
          ],
        ),
      ),
      body: SafeArea(
        // child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                var tournament = controller.tournament.value;
                print("123 $tournament");
                return Container(
                  height: screenSize.height * 0.88,
                  margin: const EdgeInsets.only(
                    top: 5,
                    // bottom: 5,
                  ),
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 2,
                          right: 2,
                        ),
                        // height: screenSize.height * 0.35,
                        // width: screenSize.width * 0.95,
                        child: Image.network(tournament.banner_URL.toString()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        tournament.name.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.indigoAccent,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: const Text(
                          "Mô tả giải đấu:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Text(
                          tournament.description.toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: const Text(
                              "Ngày thi đấu:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: Text(
                              Formatter.date(tournament.startDate),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: const Text(
                              "Ngày đăng ký:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            Formatter.date(tournament.startRegisterDate),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: const Text(
                              "Hạn đăng ký: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Text(
                            Formatter.date(tournament.endRegisterDate),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                            ),
                            width: 100,
                            child: const Text(
                              "Địa điểm: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 37,
                          ),
                          Expanded(
                            child: Text(
                              tournament.location.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: const Text(
                              "Số lượng lồng: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "${tournament.maxParticipant} Lồng",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: const Text(
                              "Chi phí đăng ký:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "${tournament.participantFee} VND",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: const Text(
                          "Giải thưởng:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //Prizes
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        child: Obx(
                          () {
                            var listPrizes = controller.prizeList();
                            if (listPrizes.isEmpty) {
                              return const Center(
                                child: Expanded(
                                  child: Text(
                                    style: TextStyle(fontSize: 18),
                                    "Chưa có giải thưởng",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else {
                              return ListView.builder(
                                addSemanticIndexes: true,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listPrizes.length,
                                itemBuilder: (BuildContext ctv, index) {
                                  final prizes = listPrizes[index];
                                  return Container(
                                    height: screenSize.height * 0.05,
                                    margin: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                      bottom: 10,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black),
                                      color: HexColor("#efe9f9"),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          prizes.name.toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 55,
                                            ),
                                            const Text(
                                              "Tiền thưởng:",
                                              // textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${prizes.price.toString()} VND",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        // ),
      ),
    );
  }
}