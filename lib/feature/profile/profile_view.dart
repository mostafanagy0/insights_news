import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:insights_news/core/app_colors.dart';
import 'package:insights_news/core/app_local_storage.dart';
import 'package:insights_news/feature/home/home_viev.dart';
import 'package:insights_news/feature/profile/widgets/show_dilog.dart';

String name = '';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // var box;
  @override
  void initState() {
    super.initState();
    Hive.openBox('user');
    AppLocal.getData(AppLocal.Name_Key).then((value) {
      setState(() {
        name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomeView(),
              ));
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        //  ---- mode ---------
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ----------- image------------

              FutureBuilder(
                  future: AppLocal.getData(AppLocal.Image_Key),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: AppColors.lomanada,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(File(snapshot.data!)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showImageDialog(context, onTapCamera: () async {
                                await getImagefromCamera().then((value) {
                                  setState(() {});
                                  Navigator.of(context).pop();
                                });
                              }, onTapGallery: () async {
                                await getImagefromGallery().then((value) {
                                  setState(() {});
                                  Navigator.of(context).pop();
                                });
                              });
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Icon(
                                Icons.camera_alt_rounded,
                                size: 20,
                                color: AppColors.lomanada,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.lightBg,
                        child: const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/user.png')),
                      );
                    }
                  }),
              const SizedBox(
                height: 20,
              ),

              // ----------- divider------------

              Padding(
                padding: const EdgeInsets.all(20),
                child: Divider(
                  color: AppColors.grey,
                  thickness: .7,
                ),
              ),

              // ----------- name------------

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: AppColors.lomanada, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        showNameDialog(context, name);
                        setState(() {});
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.lomanada)),
                        child: Icon(
                          Icons.mode_edit_outline_outlined,
                          color: AppColors.lomanada,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
