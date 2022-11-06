import 'package:floor/floor.dart';

import '../../models/Card/Card/Card.dart';

@dao
abstract class CardDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> bulkAdd(List<Card> cardsDeckRefCollection);

}