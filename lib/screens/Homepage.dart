import 'package:flutter/material.dart';
import 'package:gst_app/api/api.dart';
import 'package:gst_app/screens/GstScreen.dart';
import 'package:provider/provider.dart';
import 'package:toggle_bar/toggle_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> selections = List.generate(2, (index) => false);
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gstProvider = Provider.of<GSTProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
           FocusManager.instance.primaryFocus?.unfocus();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
              backgroundColor: Colors.green,
              floating: true,
              pinned: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.more_vert, color: Colors.white),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 75.0),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          'Select the type for',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 2.0),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          'GST Number Search Tool',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0),
                        )),
                    Center(
                      child: Container(
                        height: 70,
                        margin: EdgeInsets.only(top: 15.0),
                        // padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: ToggleBar(
                          labels: ['Search GST number', 'GST return status'],
                          onSelectionUpdated: (int index) {
                            setState(() {
                              selections[index] = !selections[index];
                            });
                          },
                          selectedTabColor: Colors.white,
                          selectedTextColor: Colors.green,
                          backgroundColor: Colors.green[700],
                          labelTextStyle:
                              TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 5),
                    child: Text(
                      'Enter GST number',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 0, bottom: 0),
                      height: 100,
                      child: TextFormField(
                        controller: myController,
                        validator: (text) {
                          if (!(text.length == 15) && text.isNotEmpty) {
                            return "Enter 15 characters!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            alignLabelWithHint: true,
                            hintText: 'ex : ashidf8uf09',
                            border: InputBorder.none,
                            focusColor: Colors.blueGrey,
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 0, bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.green)))
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                await gstProvider.fetchGstInfo(
                                    myController.text.toUpperCase());
                                setState(() {
                                  loading = false;
                                });
                                if (gstProvider.result != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => GstScreen(
                                            gstData: gstProvider.result,
                                          )));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'No record found for the given GSTIN'),
                                    backgroundColor: Colors.green,
                                    elevation: 2,
                                    duration: Duration(seconds: 3),
                                    
                                    padding: EdgeInsets.all(2),
                                  ));
                                }
                                ;
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Search',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
