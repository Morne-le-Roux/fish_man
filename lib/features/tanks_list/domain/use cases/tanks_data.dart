import 'package:fish_man/features/auth/provider/current_user.dart';
import 'package:provider/provider.dart';
import '../../data/tanklist_database.dart';

class TanksData {
  addTank(
      {required owner,
      required tankName,
      required tankSize,
      required tankPhoto}) {
    try {
      TanklistDatabase().addTankToDatabase(
          owner: owner,
          tankName: tankName,
          tankSize: tankSize,
          tankPhoto: tankPhoto);
    } catch (error) {
      return (error);
    }
  }

  Stream tanksStream({required context}) {
    return TanklistDatabase().tankStream(
        ownerUID:
            Provider.of<FishManUser>(context, listen: false).currentUser?.id ??
                "none");
  }
}
