// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DecksDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDecksDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DecksDatabaseBuilder databaseBuilder(String name) =>
      _$DecksDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DecksDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$DecksDatabaseBuilder(null);
}

class _$DecksDatabaseBuilder {
  _$DecksDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DecksDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DecksDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DecksDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DecksDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DecksDatabase extends DecksDatabase {
  _$DecksDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DeckDao? _deckDaoInstance;

  CardDao? _cardDaoInstance;

  DeckWithCardsDao? _deckWithCardsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `decks` (`id` INTEGER NOT NULL, `keyforgeId` TEXT NOT NULL, `name` TEXT NOT NULL, `expansion` TEXT NOT NULL, `creatureCount` INTEGER NOT NULL, `actionCount` INTEGER NOT NULL, `artifactCount` INTEGER, `expectedAmber` REAL NOT NULL, `amberControl` REAL NOT NULL, `creatureControl` REAL, `artifactControl` REAL, `efficiency` REAL, `effectivePower` INTEGER, `creatureProtection` REAL, `disruption` REAL, `aercScore` REAL, `aercVersion` INTEGER NOT NULL, `sasRating` INTEGER NOT NULL, `synergyRating` REAL NOT NULL, `antisynergyRating` REAL NOT NULL, `localWins` INTEGER, `localLosses` INTEGER, `efficiencyBonus` REAL NOT NULL, `totalPower` INTEGER NOT NULL, `rawAmber` INTEGER NOT NULL, `sasPercentile` REAL NOT NULL, `housesAndCards` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cards` (`id` TEXT NOT NULL, `card_title` TEXT NOT NULL, `house` TEXT NOT NULL, `card_type` TEXT NOT NULL, `front_image` TEXT NOT NULL, `card_text` TEXT NOT NULL, `traits` TEXT NOT NULL, `amber` INTEGER NOT NULL, `power` TEXT NOT NULL, `armor` TEXT NOT NULL, `rarity` TEXT NOT NULL, `flavor_text` TEXT NOT NULL, `card_number` TEXT NOT NULL, `expansion` INTEGER NOT NULL, `is_maverick` INTEGER NOT NULL, `is_anomaly` INTEGER NOT NULL, `is_enhanced` INTEGER NOT NULL, `is_non_deck` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cards_deck_join` (`cardId` TEXT NOT NULL, `deckId` INTEGER NOT NULL, `count` INTEGER NOT NULL, `is_maverick` INTEGER NOT NULL, `is_legacy` INTEGER NOT NULL, `is_anomaly` INTEGER NOT NULL, `is_enhanced` INTEGER NOT NULL, FOREIGN KEY (`cardId`) REFERENCES `cards` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`deckId`) REFERENCES `decks` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`cardId`, `deckId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DeckDao get deckDao {
    return _deckDaoInstance ??= _$DeckDao(database, changeListener);
  }

  @override
  CardDao get cardDao {
    return _cardDaoInstance ??= _$CardDao(database, changeListener);
  }

  @override
  DeckWithCardsDao get deckWithCardsDao {
    return _deckWithCardsDaoInstance ??=
        _$DeckWithCardsDao(database, changeListener);
  }
}

class _$DeckDao extends DeckDao {
  _$DeckDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _deckInsertionAdapter = InsertionAdapter(
            database,
            'decks',
            (Deck item) => <String, Object?>{
                  'id': item.id,
                  'keyforgeId': item.keyforgeId,
                  'name': item.name,
                  'expansion': item.expansion,
                  'creatureCount': item.creatureCount,
                  'actionCount': item.actionCount,
                  'artifactCount': item.artifactCount,
                  'expectedAmber': item.expectedAmber,
                  'amberControl': item.amberControl,
                  'creatureControl': item.creatureControl,
                  'artifactControl': item.artifactControl,
                  'efficiency': item.efficiency,
                  'effectivePower': item.effectivePower,
                  'creatureProtection': item.creatureProtection,
                  'disruption': item.disruption,
                  'aercScore': item.aercScore,
                  'aercVersion': item.aercVersion,
                  'sasRating': item.sasRating,
                  'synergyRating': item.synergyRating,
                  'antisynergyRating': item.antisynergyRating,
                  'localWins': item.localWins,
                  'localLosses': item.localLosses,
                  'efficiencyBonus': item.efficiencyBonus,
                  'totalPower': item.totalPower,
                  'rawAmber': item.rawAmber,
                  'sasPercentile': item.sasPercentile,
                  'housesAndCards':
                      _houseArrayTypeConverter.encode(item.housesAndCards)
                },
            changeListener),
        _deckDeletionAdapter = DeletionAdapter(
            database,
            'decks',
            ['id'],
            (Deck item) => <String, Object?>{
                  'id': item.id,
                  'keyforgeId': item.keyforgeId,
                  'name': item.name,
                  'expansion': item.expansion,
                  'creatureCount': item.creatureCount,
                  'actionCount': item.actionCount,
                  'artifactCount': item.artifactCount,
                  'expectedAmber': item.expectedAmber,
                  'amberControl': item.amberControl,
                  'creatureControl': item.creatureControl,
                  'artifactControl': item.artifactControl,
                  'efficiency': item.efficiency,
                  'effectivePower': item.effectivePower,
                  'creatureProtection': item.creatureProtection,
                  'disruption': item.disruption,
                  'aercScore': item.aercScore,
                  'aercVersion': item.aercVersion,
                  'sasRating': item.sasRating,
                  'synergyRating': item.synergyRating,
                  'antisynergyRating': item.antisynergyRating,
                  'localWins': item.localWins,
                  'localLosses': item.localLosses,
                  'efficiencyBonus': item.efficiencyBonus,
                  'totalPower': item.totalPower,
                  'rawAmber': item.rawAmber,
                  'sasPercentile': item.sasPercentile,
                  'housesAndCards':
                      _houseArrayTypeConverter.encode(item.housesAndCards)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Deck> _deckInsertionAdapter;

  final DeletionAdapter<Deck> _deckDeletionAdapter;

  @override
  Stream<List<Deck>> getDecks() {
    return _queryAdapter.queryListStream(
        'select * from decks ORDER BY sasRating DESC,rawAmber DESC',
        mapper: (Map<String, Object?> row) => Deck(
            row['id'] as int,
            row['keyforgeId'] as String,
            row['name'] as String,
            row['expansion'] as String,
            row['creatureCount'] as int,
            row['actionCount'] as int,
            row['artifactCount'] as int?,
            row['expectedAmber'] as double,
            row['amberControl'] as double,
            row['creatureControl'] as double?,
            row['artifactControl'] as double?,
            row['efficiency'] as double?,
            row['effectivePower'] as int?,
            row['creatureProtection'] as double?,
            row['disruption'] as double?,
            row['aercScore'] as double?,
            row['aercVersion'] as int,
            row['sasRating'] as int,
            row['synergyRating'] as double,
            row['antisynergyRating'] as double,
            row['localWins'] as int?,
            row['localLosses'] as int?,
            row['efficiencyBonus'] as double,
            row['totalPower'] as int,
            row['rawAmber'] as int,
            row['sasPercentile'] as double,
            _houseArrayTypeConverter.decode(row['housesAndCards'] as String)),
        queryableName: 'decks',
        isView: false);
  }

  @override
  Future<void> updateWins(
    int wins,
    int id,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE decks SET localWins=?1 WHERE id=?2',
        arguments: [wins, id]);
  }

  @override
  Future<void> updateLosses(
    int loss,
    int id,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE decks SET localLosses=?1 WHERE id=?2',
        arguments: [loss, id]);
  }

  @override
  Future<void> updateDeckStatus(
    int sasRating,
    int powerLevel,
    int chains,
    int wins,
    int losses,
    double aercScore,
    double synergyRating,
    double antisynergyRating,
    int cardDrawCount,
    int cardArchiveCount,
    double recursion,
    int keyCheatCount,
    int id,
    double efficiency,
    double expectedAmber,
    double creatureProtection,
    int metaScores,
    double amberControl,
    double creatureControl,
    double artifactControl,
    double efficiencyBonus,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE decks SET sasRating=?1,powerLevel=?2,chains=?3,wins=?4,losses=?5,aercScore=?6,synergyRating=?7,keyCheatCount=?12 ,cardDrawCount=?9,cardArchiveCount=?10,expectedAmber=?15,creatureProtection=?16,efficiency=?14,efficiencyBonus=?21,amberControl=?18,creatureControl=?19,artifactControl=?20,recursion=?11,metaScores=?17,antisynergyRating=?8 WHERE id=?13',
        arguments: [
          sasRating,
          powerLevel,
          chains,
          wins,
          losses,
          aercScore,
          synergyRating,
          antisynergyRating,
          cardDrawCount,
          cardArchiveCount,
          recursion,
          keyCheatCount,
          id,
          efficiency,
          expectedAmber,
          creatureProtection,
          metaScores,
          amberControl,
          creatureControl,
          artifactControl,
          efficiencyBonus
        ]);
  }

  @override
  Future<DeckDTO?> getDeckDTOs(int id) async {
    await _queryAdapter
        .queryNoReturn('SELECT * FROM decks WHERE id=?1', arguments: [id]);
  }

  @override
  Future<List<DeckDTO>?> getAllDeckDTOs() async {
    await _queryAdapter.queryNoReturn('SELECT * FROM decks');
  }

  @override
  Future<void> addDeck(Deck deck) async {
    await _deckInsertionAdapter.insert(deck, OnConflictStrategy.ignore);
  }

  @override
  Future<void> bulkAdd(List<Deck> deckCollection) async {
    await _deckInsertionAdapter.insertList(
        deckCollection, OnConflictStrategy.ignore);
  }

  @override
  Future<void> deleteDeck(Deck deck) async {
    await _deckDeletionAdapter.delete(deck);
  }
}

class _$CardDao extends CardDao {
  _$CardDao(
    this.database,
    this.changeListener,
  ) : _cardInsertionAdapter = InsertionAdapter(
            database,
            'cards',
            (Card item) => <String, Object?>{
                  'id': item.id,
                  'card_title': item.card_title,
                  'house': item.house,
                  'card_type': item.card_type,
                  'front_image': item.front_image,
                  'card_text': item.card_text,
                  'traits': item.traits,
                  'amber': item.amber,
                  'power': item.power,
                  'armor': item.armor,
                  'rarity': item.rarity,
                  'flavor_text': item.flavor_text,
                  'card_number': item.card_number,
                  'expansion': item.expansion,
                  'is_maverick': item.is_maverick ? 1 : 0,
                  'is_anomaly': item.is_anomaly ? 1 : 0,
                  'is_enhanced': item.is_enhanced ? 1 : 0,
                  'is_non_deck': item.is_non_deck ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<Card> _cardInsertionAdapter;

  @override
  Future<void> bulkAdd(List<Card> cardsDeckRefCollection) async {
    await _cardInsertionAdapter.insertList(
        cardsDeckRefCollection, OnConflictStrategy.ignore);
  }
}

class _$DeckWithCardsDao extends DeckWithCardsDao {
  _$DeckWithCardsDao(
    this.database,
    this.changeListener,
  ) : _cardsDeckRefInsertionAdapter = InsertionAdapter(
            database,
            'cards_deck_join',
            (CardsDeckRef item) => <String, Object?>{
                  'cardId': item.cardId,
                  'deckId': item.deckId,
                  'count': item.count,
                  'is_maverick': item.is_maverick ? 1 : 0,
                  'is_legacy': item.is_legacy ? 1 : 0,
                  'is_anomaly': item.is_anomaly ? 1 : 0,
                  'is_enhanced': item.is_enhanced ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<CardsDeckRef> _cardsDeckRefInsertionAdapter;

  @override
  Future<void> add(CardsDeckRef cardsDeckRef) async {
    await _cardsDeckRefInsertionAdapter.insert(
        cardsDeckRef, OnConflictStrategy.ignore);
  }

  @override
  Future<void> bulkAdd(List<CardsDeckRef> cardsDeckRefCollection) async {
    await _cardsDeckRefInsertionAdapter.insertList(
        cardsDeckRefCollection, OnConflictStrategy.ignore);
  }
}

// ignore_for_file: unused_element
final _houseArrayTypeConverter = HouseArrayTypeConverter();