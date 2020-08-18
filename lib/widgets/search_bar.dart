import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:squad/core/firebase/squad_operation.dart';

import 'opacity_button.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(29.5),
          ),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: "Ekip adı giriniz",
              icon: SvgPicture.asset("assets/icons/search.svg"),
              border: InputBorder.none,
            ),
          ),
        ),
        CreateOrJoinButtons(textController: textController)
      ],
    );
  }
}

class CreateOrJoinButtons extends StatelessWidget {
  const CreateOrJoinButtons({
    Key key,
    @required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        OpacityButton(
          title: 'Oluştur',
          function: () async {
            if (textController.text.isEmpty) {
              final snackBar = SnackBar(
                content: Text('Lütfen bir ekip adı giriniz'),
                action: SnackBarAction(
                  label: 'Tamam',
                  onPressed: () {},
                ),
              );
              return Scaffold.of(context).showSnackBar(snackBar);
            }
            var result = await createSquad(textController.text);
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: result
                      ? Row(
                          children: <Widget>[
                            Icon(Icons.check, color: Colors.green),
                            SizedBox(width: 5),
                            Text('Ekip Oluşturuldu'),
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Icon(Icons.close, color: Colors.red),
                            SizedBox(width: 5),
                            Text('Tekrar Deneyiniz !'),
                          ],
                        ),
                  content: result
                      ? Text('${textController.text} başarı ile oluştu.')
                      : Text(
                          '${textController.text} adında bir ekip bulunmakta. \nLütfen farklı bir isim seçiniz.'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Tamam'),
                      onPressed: () {
                        textController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        SizedBox(width: 20),
        OpacityButton(
          title: 'Katıl',
          function: () async {
            if (textController.text.isEmpty) {
              final snackBar = SnackBar(
                content: Text('Lütfen bir ekip adı giriniz'),
                action: SnackBarAction(
                  label: 'Tamam',
                  onPressed: () {},
                ),
              );
              return Scaffold.of(context).showSnackBar(snackBar);
            }
            var result = await joinSquad(textController.text);
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: result
                      ? Row(
                          children: <Widget>[
                            Icon(Icons.check, color: Colors.green),
                            SizedBox(width: 5),
                            Text('Onay Bekleniyor'),
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Icon(Icons.close, color: Colors.red),
                            SizedBox(width: 5),
                            Text('Tekrar Deneyiniz !'),
                          ],
                        ),
                  content: result
                      ? Text(
                          '${textController.text} Ekibine Katıldınız. \nEkip lideri onayı bekleniyor.')
                      : Text(
                          '${textController.text} adında bir ekip bulunmakta. \nLütfen farklı bir ekip seçiniz.'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Tamam'),
                      onPressed: () {
                        textController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
