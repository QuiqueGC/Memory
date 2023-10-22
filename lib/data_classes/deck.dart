import 'game_card.dart';

class Deck {

  List<GameCard> cards = [];


  Deck();


  void createDeck(){
    cards.add(GameCard(0,"assets/beholder.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(1,"assets/beholder.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(2,"assets/cube.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(3,"assets/cube.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(4,"assets/dragon.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(5,"assets/dragon.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(6,"assets/giant.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(7,"assets/giant.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(8,"assets/lich.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(9,"assets/lich.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(10,"assets/raksasha.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(11,"assets/raksasha.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(12,"assets/tarasque.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(13,"assets/tarasque.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(14,"assets/werewolf.png", "assets/hyperion.png", false, false));
    cards.add(GameCard(15,"assets/werewolf.png", "assets/hyperion.png", false, false));
  }


}