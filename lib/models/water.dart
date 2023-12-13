class Water {
  String bottle = 'water1.png';
  String bottleDone = "";
  double waterintake = 0;

  wtrIntake() {
    print("TEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEST");
    if (waterintake < 500) {
      bottle = "water1.png";
      bottleDone = "You need to drink more water!";
    } else if (waterintake >= 500 && waterintake < 1000) {
      bottle = "water2.png";

      bottleDone = "You're getting started!";
    } else if (waterintake >= 1000 && waterintake < 2000) {
      bottle = "water3.png";
      bottleDone = "Half way done!";
    } else {
      bottle = "water4.png";
      bottleDone = "Congrats your water intake is perfect today!";
    }
  }
}
