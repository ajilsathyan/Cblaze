import 'package:cblaze_task/constants/colors.dart';
import 'package:cblaze_task/controller/profiledata_controller.dart';
import 'package:cblaze_task/views/dashboard/widgets/divider_widget.dart';
import 'package:cblaze_task/views/dashboard/widgets/user_data_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileDataControllerProvider>(context, listen: false)
          .getUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<ProfileDataControllerProvider>(
        builder: (context, p, c) {
          return p.isLoading
              ? const SpinKitSpinningLines(
                  color: red,
                  size: 70.0,
                  lineWidth: 3,
                  duration: Duration(milliseconds: 2300),
                )
              : p.profileModel != null
                  ? SizedBox(
                      width: w,
                      height: h,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: h,
                                width: w,
                                color: white,
                              ),
                              Container(
                                height: h * .35,
                                width: w,
                                color: red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: h * .07,
                                    ),
                                    Container(
                                      width: h * .12,
                                      height: h * .12,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: white, width: 3),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  p.profileModel?.data?.photo ??
                                                      ""),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      p.profileModel?.data?.userName ?? "",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: white),
                                    ),
                                    Text(
                                      p.profileModel?.data?.code ?? "",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: white),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: h * .28,
                                  right: 5,
                                  left: 5,
                                  bottom: 0,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              width: w,
                                              child: Card(
                                                elevation: 3,
                                                margin: EdgeInsets.zero,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Basic Info",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      UserDataRowWidget(
                                                        title: p.profileModel
                                                                ?.data?.phone ??
                                                            "",
                                                        icon: Icons
                                                            .phone_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p.profileModel
                                                                ?.data?.email ??
                                                            "Not Provided",
                                                        icon: Icons
                                                            .email_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p.profileModel
                                                                ?.data?.dob ??
                                                            "Not Provided",
                                                        icon: Icons
                                                            .calendar_month_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.gender ??
                                                            "Not Provided",
                                                        icon: Icons.female,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.maritalStatus ??
                                                            "Not Provided",
                                                        icon: Icons
                                                            .family_restroom_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.nationality ??
                                                            "Not Provided",
                                                        icon:
                                                            Icons.flag_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.motherTongue ??
                                                            "Not Provided",
                                                        icon: Icons
                                                            .language_outlined,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                              width: w,
                                              child: Card(
                                                elevation: 3,
                                                margin: EdgeInsets.zero,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Permanent Address",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.permanentAddress
                                                                ?.address ??
                                                            "",
                                                        icon: Icons
                                                            .location_on_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.permanentAddress
                                                                ?.city ??
                                                            "Not Provided",
                                                        icon: Icons
                                                            .location_city_outlined,
                                                      ),
                                                      DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.permanentAddress
                                                                ?.country ??
                                                            "Not Provided",
                                                        icon:
                                                            Icons.flag_outlined,
                                                      ),
                                                      DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.permanentAddress
                                                                ?.state ??
                                                            "Not Provided",
                                                        icon:
                                                            Icons.flag_outlined,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                              width: w,
                                              child: Card(
                                                elevation: 3,
                                                margin: EdgeInsets.zero,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Residential Address",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.residentialAddress
                                                                ?.address ??
                                                            "",
                                                        icon: Icons
                                                            .location_on_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.residentialAddress
                                                                ?.city ??
                                                            "Not Provided",
                                                        icon: Icons
                                                            .location_city_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.residentialAddress
                                                                ?.country ??
                                                            "Not Provided",
                                                        icon:
                                                            Icons.flag_outlined,
                                                      ),
                                                      const DividerWidget(),
                                                      UserDataRowWidget(
                                                        title: p
                                                                .profileModel
                                                                ?.data
                                                                ?.residentialAddress
                                                                ?.state ??
                                                            "Not Provided",
                                                        icon:
                                                            Icons.flag_outlined,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text("No Profile Data Found"),
                    );
        },
      ),
    );
  }
}
