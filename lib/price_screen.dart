import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}


class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';


  CupertinoPicker iospicker(){
    List<Text> pickeritems = [];
    for (String currency in currenciesList) {
      pickeritems.add(Text(currency));
    }
    
    return CupertinoPicker(
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex) {
                print(selectedIndex);
              },
              children: pickeritems,
            );
  }

  DropdownButton<String> dropdownbutton() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (String curreny in currenciesList) {
      dropdownitems.add(DropdownMenuItem(
        child: Text(curreny),
        value: curreny,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownitems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:Platform.isIOS ? iospicker() : dropdownbutton(),
          ),
        ],
      ),
    );
  }
}
