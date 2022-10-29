import 'package:json_annotation/json_annotation.dart';
import 'package:keyforgery/data/models/Wrappers/MasterVaultWrappers/linkCards/EraCards/EraCards.dart';
import 'package:keyforgery/data/models/Wrappers/MasterVaultWrappers/linkCards/Links/Links.dart';

part 'MVDeck.g.dart';

@JsonSerializable()
class MVDeck {
  String name;
  int expansion;
  int power_level;
  int chains;
  int wins;
  int losses;
  String id;
  bool is_my_deck;
  List<String> notes;
  bool is_my_favorite;
  bool is_on_my_watchlist;
  int casual_wins;
  int casual_losses;
  EraCards set_era_cards;
  int? shards_bonus;
  @JsonKey(name: '_links')
  Links links;

  MVDeck(
      this.name,
      this.expansion,
      this.power_level,
      this.chains,
      this.wins,
      this.losses,
      this.id,
      this.is_my_deck,
      this.notes,
      this.is_my_favorite,
      this.is_on_my_watchlist,
      this.casual_wins,
      this.casual_losses,
      this.set_era_cards,
      this.shards_bonus,
      this.links);

  @override
  String toString() {
    return 'MVDeck{name: $name, expansion: $expansion, power_level: $power_level, chains: $chains, wins: $wins, losses: $losses, id: $id, is_my_deck: $is_my_deck, notes: $notes, is_my_favorite: $is_my_favorite, is_on_my_watchlist: $is_on_my_watchlist, casual_wins: $casual_wins, casual_losses: $casual_losses, set_era_cards: $set_era_cards, shards_bonus: $shards_bonus, links: $links}';
  }

  factory MVDeck.fromJson(Map<String, dynamic> json) => _$MVDeckFromJson(json);
  Map<String, dynamic> toJson() => _$MVDeckToJson(this);
}