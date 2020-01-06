import "package:flutter/material.dart";
import "quotes.dart";
import "quote_card.dart";

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  //  Quo te(Author, quote)
  List<Quote> quotes = [
    Quote("Lellouch","If the king doesn’t move, then his subjects won’t follow."),
    Quote("CC","Lelouch, do you know why snow is white? Because it's forgotten what color it's supposed to be."),
    Quote("Lellouch", "Don't confuse borrowed power with your own ability.")
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
        backgroundColor: Colors.pink[700],
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: (){
              setState(() {
                quotes.remove(quote);
              });
            },
        )).toList(),
      ),
    );
  }
}

