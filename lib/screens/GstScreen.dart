import 'package:flutter/material.dart';
import 'package:gst_app/models/GSTModel.dart';

class GstScreen extends StatefulWidget {
  GSTModel gstData;
  GstScreen({
    this.gstData,
  });
  @override
  _GstScreenState createState() => _GstScreenState();
}

class _GstScreenState extends State<GstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Get Return Filling Status',
                style: TextStyle(color: Colors.white),
              ),
            )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            backgroundColor: Colors.green,
            floating: true,
            pinned: true,
            snap: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            title: Text('GST Profile',
                style: TextStyle(fontWeight: FontWeight.bold)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              background: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 75.0),
                        child: Text(
                          'GSTIN of  the Tax Payer',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white60, fontSize: 13.0),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 2.0),
                        child: Text(
                          widget.gstData.gstin,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0),
                        )),
                    SizedBox(height: 10),
                    Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(
                          widget.gstData.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        )),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                        icon: Icon(Icons.circle, color: Colors.green, size: 10),
                        label: Text(
                          widget.gstData.status_type,
                          style: TextStyle(color: Colors.green, fontSize: 15.0),
                        ))
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_history,
                                      color: Colors.green),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Principal Place of Bussiness',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.gstData.addrs_line_1,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.gstData.addrs_line_2,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${widget.gstData.addrs_line_3} , ${widget.gstData.pincode}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_city_rounded,
                                      color: Colors.green),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Additional Place of Bussiness',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Floor',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'State Jurisdiction',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.gstData.state_jurisdiction,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Center Jurisdiction',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.gstData.center_jurisdiction,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TaxPayer Type',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.gstData.taxpayer_type,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Constitution of Bussiness',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.gstData.bussiness_type,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Date of Registration',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.gstData.registration_date,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Date of Cancellation',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.gstData.cancellation_date,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
