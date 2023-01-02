import 'dart:math';
import 'dart:io';

void main(List<String> arguments) {
  while (true) {
    print("Do you want do generate polygons[1] or stars[2]?");
    int? type = int.parse(stdin.readLineSync()!);
    if (type == 1) {
      String typeName = "polygon";
      print("Number of Corners (must be at least 5):");
      int? corners = int.parse(stdin.readLineSync()!);
      print("Radius:");
      int? radius = int.parse(stdin.readLineSync()!);
      print("Center of polygon X:");
      int? centerX = int.parse(stdin.readLineSync()!);
      print("Center of polygon Y:");
      int? centerY = int.parse(stdin.readLineSync()!);
      print("Duration of rotation:");
      int? duration = int.parse(stdin.readLineSync()!);
      print("Here is your polygon input:");
      String points = polygonPoints(corners, radius, centerX, centerY);
      printInput(typeName, duration, centerX, centerY, points);
      print("------------------------------------------------");
    } else if (type == 2) {
      String typeName = "star";
      print("Number of star egdes (must be at least 5):");
      int? starEdges = int.parse(stdin.readLineSync()!);
      print("Outer radius:");
      int? outerRadius = int.parse(stdin.readLineSync()!);
      print("Inner radius:");
      int? innerRadius = int.parse(stdin.readLineSync()!);
      print("Center of star X:");
      int? centerX = int.parse(stdin.readLineSync()!);
      print("Center of star Y:");
      int? centerY = int.parse(stdin.readLineSync()!);
      print("Duration of rotation:");
      int? duration = int.parse(stdin.readLineSync()!);
      print("Here is your star input:");
      String points =
          starPoints(starEdges, outerRadius, innerRadius, centerX, centerY);
      printInput(typeName, duration, centerX, centerY, points);
      print("------------------------------------------------");
    } else {
      print("Please select a valid number!");
    }
  }
}

String polygonPoints(int corners, int radius, int centerX, int centerY) {
  if (corners < 5) {
    return "Minimum Amount of Corners should be 5";
  }
  String points = "";
  for (int i = 0; i < corners; i++) {
    String x =
        (radius * cos(i * (2 * pi / corners)) + centerX).toStringAsFixed(1);
    String y =
        (radius * sin(i * (2 * pi / corners)) + centerY).toStringAsFixed(1);
    points += "$x,$y ";
  }
  return points;
}

String starPoints(
    int starEdges, int outerRadius, int innerRadius, int centerX, int centerY) {
  if (starEdges < 5) {
    return "Minimum Amount of StarEdges should be 5";
  }
  int amountPoints = starEdges * 2;
  String points = "";
  for (int i = 0; i < amountPoints; i++) {
    int pointRadius;
    if (i % 2 == 0) {
      pointRadius = outerRadius;
    } else {
      pointRadius = innerRadius;
    }
    String x = (pointRadius * cos(i * (2 * pi / amountPoints)) + centerX)
        .toStringAsFixed(1);
    String y = (pointRadius * sin(i * (2 * pi / amountPoints)) + centerY)
        .toStringAsFixed(1);
    points += "$x,$y ";
  }
  return points;
}

void printInput(
    String type, int duration, int centerX, int centerY, String points) {
  print(
      '<polygon id="$type" points="$points" fill="#ffd700"> <animateTransform attributeName="transform" type="rotate" from="0 $centerX $centerY" to="360 $centerX $centerY" dur="$duration" repeatCount="indefinite" /> </polygon>');
}
