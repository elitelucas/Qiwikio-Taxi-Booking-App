import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;
  String imageline;

  SliderModel({this.imageAssetPath, this.title, this.desc, this.imageline});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  void setImageLine(String getImageLine) {
    imageline = getImageLine;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }

  String getImageLine() {
    return imageline;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Get a heads up on the health of you car "
      "right from the app. Helpful insights that "
      "reduce down time to due repairs");
  sliderModel.setTitle("In-App OBD Diagnostics");
  sliderModel.setImageAssetPath("assets/icons/car.png");
  sliderModel.setImageLine('assets/icons/line.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Registration is quick and easy, we let you "
      "move your rating from other providers."
      "                             ");
  sliderModel.setTitle("Get Registered");
  sliderModel.setImageAssetPath("assets/icons/register.png");
  sliderModel.setImageLine('assets/icons/line.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Earn your work’s worth, get up yo 90% "
      "commission and more incentives"
      "                             ");
  sliderModel.setTitle("Earn more with Qwikio");
  sliderModel.setImageAssetPath("assets/icons/earn.png");
  sliderModel.setImageLine('assets/icons/line.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
