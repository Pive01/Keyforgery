import 'package:keyforgery/data/models/DeckModel/Deck/Deck.dart';

import 'CardMetadataDTO.dart';

class DeckDTO{
  Deck deck;
  List<CardMetadataDTO> cards;

  DeckDTO(this.deck, this.cards);
}