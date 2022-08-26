import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Список гениальных идей'),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          body: const MyForm()),
    ));

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State {
  final TextEditingController myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Set idia = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: myController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                    labelText: 'Ваша идея',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                validator: (value) {
                  if (value!.isEmpty) return 'Введите Вашу идею';
                  return null;
                },
              ),
              ElevatedButton(
                  child: const Text(
                    'Добавить',
                    style: TextStyle(color: Colors.brown, fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                    idia.add(myController.text);
                    myController.clear();
                    setState(() {});
                  }),
              for (var i in idia)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        '$i',
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
