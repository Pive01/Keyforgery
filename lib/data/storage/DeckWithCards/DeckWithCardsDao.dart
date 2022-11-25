import 'package:floor/floor.dart';

import '../../models/CardsDeckRef.dart';

@dao
abstract class DeckWithCardsDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> add(CardsDeckRef cardsDeckRef);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> bulkAdd(List<CardsDeckRef> cardsDeckRefCollection);
}