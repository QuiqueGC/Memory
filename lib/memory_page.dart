import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_game/data_classes/game_card.dart';
import 'package:memory_game/game_over_page.dart';
import 'data_classes/deck.dart';




class MemoryPage extends StatefulWidget {
  const MemoryPage({super.key, required this.title});

  final String title;

  @override
  State<MemoryPage> createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage> {
  int tries = 7;
  Deck mainDeck = Deck();
  Deck deckToUse = Deck();

  bool canTouch = true;

  @override
  void initState() {
    mainDeck.createDeck();

    while (mainDeck.cards.isNotEmpty) {
      int random = Random().nextInt(mainDeck.cards.length);
      deckToUse.cards.add(mainDeck.cards[random]);
      mainDeck.cards.removeAt(random);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 1,
                    color: Colors.blue,
                  )),
              child: Row(
                children: [
                  const Text(
                    'Oportunidades restantes: ',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '$tries',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            rowOfCards(
              deckToUse.cards[0],
              deckToUse.cards[1],
              deckToUse.cards[2],
              deckToUse.cards[3],
            ),
            rowOfCards(
              deckToUse.cards[4],
              deckToUse.cards[5],
              deckToUse.cards[6],
              deckToUse.cards[7],
            ),
            rowOfCards(
              deckToUse.cards[8],
              deckToUse.cards[9],
              deckToUse.cards[10],
              deckToUse.cards[11],
            ),
            rowOfCards(
              deckToUse.cards[12],
              deckToUse.cards[13],
              deckToUse.cards[14],
              deckToUse.cards[15],
            ),
          ],
        ),
      ),
    );
  }

  Widget rowOfCards(GameCard gameCard1, GameCard gameCard2, GameCard gameCard3,
      GameCard gameCard4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        card(gameCard1),
        card(gameCard2),
        card(gameCard3),
        card(gameCard4),
      ],
    );
  }

  Widget card(GameCard gameCard) {
    return GestureDetector(
      onTap: canTouch
          ? () {
        tapCard(gameCard);
      }
          : null,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.white),
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue),
        margin: const EdgeInsets.all(10),
        child: Image.asset(!gameCard.isFaced ? gameCard.back : gameCard.face,
            width: 65,
            height: 125,
            fit: gameCard.isFaced ? BoxFit.contain : BoxFit.fitHeight),
      ),
    );
  }

  void tapCard(GameCard gameCard) async {
    GameCard? gameCardToCheck;
    canTouch = false;

    gameCardToCheck = takingCardToCheck(gameCard);

    Future.delayed(Duration(milliseconds: 400), () {

      checkingCards(gameCard, gameCardToCheck);
    });
  }




  GameCard? takingCardToCheck(GameCard gameCard) {
    GameCard? gameCardToCheck;

    if (!gameCard.isFaced) {
      for (GameCard card in deckToUse.cards) {
        if (card.isFaced && !card.paired) {
          gameCardToCheck = card;
        }
      }
      setState(() {
        gameCard.isFaced = true;
      });
      return gameCardToCheck;
    }
  }

  void checkingCards(GameCard gameCard, GameCard? gameCardToCheck) {
    if (gameCardToCheck != null) {
      if (gameCard.face != gameCardToCheck.face) {
        gameCardToCheck.isFaced = false;
        gameCard.isFaced = false;
        tries--;
        if (tries <= 0){
          loosing();
        }
      } else {
        gameCardToCheck.paired = true;
        gameCard.paired = true;
      }
    }
    setState(() {
      canTouch = true;
    });
  }

  void loosing(){

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GameOverPage()));

  }
}