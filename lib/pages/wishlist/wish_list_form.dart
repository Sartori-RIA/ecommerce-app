import 'package:ecommerce/data/stores/wish_list_store.dart';
import 'package:ecommerce/ui/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class WishListForm extends StatefulWidget {
  @override
  _WishListFormState createState() => _WishListFormState();
}

class _WishListFormState extends State<WishListForm> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  WishListStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store = Provider.of<WishListStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text("Nova lista"),
            actions: [
            _store.loading ? Center(child: CircularProgressIndicator()) :  IconButton(
                  icon: Icon(CupertinoIcons.check_mark),
                  onPressed: () async {
                    await _store.create();
                    Navigator.pop(context);
                  })
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: "Nome"),
                validator: Validators.required(context),
                onChanged: _store.setName,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
