import 'package:flutter_test/flutter_test.dart';
import 'package:fish_man/provider/tank_provider.dart';

void main() {
  test(
    "A tank should be added to your list of tanks",
    () async {
      //Arrange
      var tanksProvider = TankProvider();
      //Act
      tanksProvider.addTank(
          id: 23, tankName: "TestTank", tankSize: 15, occupants: ["fish"]);
      //Assert
      expect(tanksProvider.tanks.isNotEmpty, true);
    },
  );
}
