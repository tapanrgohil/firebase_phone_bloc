import 'package:ebizcard/utils/EditTextUtils.dart';
import 'package:ebizcard/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class EditUserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter your details!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: StepScreen(),
    );
  }
}

class StepScreen extends StatefulWidget {
  StepScreen();

  @override
  _StepScreenState createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  static int currStep = 0;
  static var _focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<Step> steps = [
    new Step(
        title: const Text('Perosnal Detail'),
        isActive: true,
        state: StepState.indexed,
        content: PersonalDetailUi()),
    new Step(
        title: const Text('Business Details'),
        isActive: true,
        state: StepState.indexed,
        content: BusinessUi()),
    new Step(
        title: const Text('Business Address'),
        isActive: true,
        state: StepState.complete,
        content: new BusinessAddressUi()),
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Stepper(
        steps: steps,
        type: StepperType.vertical,
        currentStep: currStep,
        onStepContinue: () {
          setState(() {
            if (currStep == 0) {
              currStep = 1;
            } else if (currStep == 1) {
              currStep = 2;
            } else {}
          });
        },
        onStepCancel: () {
          setState(() {
            if (currStep > 0) {
              currStep = currStep - 1;
            } else {
              currStep = 0;
            }
          });
        },
        onStepTapped: (step) {
          setState(() {
            if (step < currStep) currStep = step;
          });
        },
      ),
    );
  }
}

class PersonalDetailUi extends StatefulWidget {
  @override
  _PersonalDetailUiState createState() => _PersonalDetailUiState();
}

class _PersonalDetailUiState extends State<PersonalDetailUi> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
            child: new Center(
          child: new Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: new Form(
                    key: _formKey,
                    autovalidate: false,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: EditTextUtils().getCustomEditTextArea(
                              labelValue: "First Name",
                              hintValue: "Allen",
                              validator: (value) {
                                validateMinLength(value, length: 3);
                              },
                              icon: Icons.account_circle),
                        ),
                        new Padding(
                            padding: EdgeInsets.all(8.0),
                            child: EditTextUtils().getCustomEditTextArea(
                                labelValue: "Last Name",
                                hintValue: "Smith",
                                validator: (value) {
                                  validateMinLength(value, length: 3);
                                },
                                icon: Icons.account_circle)),
                        new Padding(
                            padding: EdgeInsets.all(8.0),
                            child: EditTextUtils().getCustomEditTextArea(
                                labelValue: "Personal Email",
                                hintValue: "abc@hello.com",
                                validator: (value) {
                                  validateMinLength(value, length: 3);
                                },
                                icon: Icons.email)),
                        new Padding(
                            padding: EdgeInsets.all(8.0),
                            child: EditTextUtils().getCustomEditTextArea(
                                labelValue: "Contact Number",
                                hintValue: "9874561230",
                                validator: (value) {
                                  validateMinLength(value, length: 3);
                                },
                                icon: Icons.phone)),
                      ],
                    ),
                  )),
            ],
          ),
        ))
      ],
    );
  }

  bool validateForm() {
    return _formKey.currentState.validate();
  }
}

class BusinessAddressUi extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  _BusinessAddressUiState createState() => _BusinessAddressUiState();

  bool validateForm() {
    return _formKey.currentState.validate();
  }
}

class _BusinessAddressUiState extends State<BusinessAddressUi> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
            child: new Center(
              child: new Stack(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: new Form(
                        key: _formKey,
                        autovalidate: false,
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.all(8.0),
                              child: EditTextUtils().getCustomEditTextArea(
                                  labelValue: "Line 1",
                                  hintValue: "abc xyz street",
                                  validator: (value) {
                                    validateMinLength(value, length: 3);
                                  },
                                  icon: Icons.place),
                            ),
                            new Padding(
                                padding: EdgeInsets.all(8.0),
                                child: EditTextUtils().getCustomEditTextArea(
                                    labelValue: "Line 2",
                                    hintValue: "Near xbc ",
                                    validator: (value) {
                                      validateMinLength(value, length: 3);
                                    },
                                    icon: Icons.place)),
                            new Padding(
                                padding: EdgeInsets.all(8.0),
                                child: EditTextUtils().getCustomEditTextArea(
                                    labelValue: "Personal Email",
                                    hintValue: "abc@hello.com",
                                    validator: (value) {
                                      validateMinLength(value, length: 3);
                                    },
                                    icon: Icons.place)),
                            new Padding(
                                padding: EdgeInsets.all(8.0),
                                child: EditTextUtils().getCustomEditTextArea(
                                    labelValue: "City",
                                    hintValue: "surat",
                                    validator: (value) {
                                      validateMinLength(value, length: 3);
                                    },
                                    icon: Icons.place)),
                            new Padding(
                                padding: EdgeInsets.all(8.0),
                                child: EditTextUtils().getCustomEditTextArea(
                                    labelValue: "State",
                                    hintValue: "Gujrat",
                                    validator: (value) {
                                      validateMinLength(value, length: 3);
                                    },
                                    icon: Icons.place)),
                            new Padding(
                                padding: EdgeInsets.all(8.0),
                                child: EditTextUtils().getCustomEditTextArea(
                                    labelValue: "Pincode",
                                    hintValue: "396521",
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      validateMinLength(value, length: 3);
                                    },
                                    icon: Icons.pin_drop)),
                          ],
                        ),
                      )),
                ],
              ),
            ))
      ],
    );
  }

  bool validateForm() {
    return _formKey.currentState.validate();
  }
}


class BusinessUi extends StatefulWidget {
  @override
  _BusinessUiState createState() => _BusinessUiState();
}

class _BusinessUiState extends State<BusinessUi> {
  String _mySelection;

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
            child: new Center(
          child: new Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: new Form(
                    autovalidate: false,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: EditTextUtils().getCustomEditTextArea(
                              labelValue: "Buisness Name",
                              hintValue: "Alphabet inc.",
                              validator: (value) {
                                validateMinLength(value, length: 3);
                              },
                              icon: Icons.title),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 1)),
                              child: new Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Center(
                                    child: new DropdownButton<String>(
                                      isDense: true,
                                      underline: SizedBox(),
                                      hint: new Text("Buiness category"),
                                      value: _mySelection,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _mySelection = newValue;
                                        });

                                        print(_mySelection);
                                      },
                                      items: List(),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 1)),
                              child: new Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Center(
                                    child: new DropdownButton<String>(
                                      isDense: true,
                                      underline: SizedBox(),
                                      hint: new Text("Buiness SubCategory"),
                                      value: _mySelection,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _mySelection = newValue;
                                        });

                                        print(_mySelection);
                                      },
                                      items: List(),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: EditTextUtils().getCustomEditTextArea(
                              labelValue: "Buisness Contact",
                              hintValue: "987654310",
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                validatePhone(value);
                              },
                              icon: Icons.title),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: EditTextUtils().getCustomEditTextArea(
                              labelValue: "Buisness Contact2",
                              hintValue: "987654310",
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                validatePhone(value);
                              },
                              icon: Icons.title),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: EditTextUtils().getCustomEditTextArea(
                              labelValue: "Buisness email",
                              hintValue: "abc@tes.com",
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                validateEmail(value);
                              },
                              icon: Icons.title),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: EditTextUtils().getCustomEditTextArea(
                              labelValue: "Buisness website",
                              hintValue: "www.xyx.com",
                              keyboardType: TextInputType.url,
                              validator: (value) {
                                validateWebsite(value);
                              },
                              icon: Icons.title),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: EditTextUtils().getCustomEditTextArea(
                              labelValue: "GSTIN Deetail",
                              hintValue: "xxxxxxxxxxxxxx",
                              keyboardType: TextInputType.url,
                              validator: (value) {
                                validateWebsite(value);
                              },
                              icon: Icons.title),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: EditTextUtils().getCustomEditTextArea(
                              labelValue: "Business TagLine",
                              hintValue: "",
                              keyboardType: TextInputType.url,
                              validator: (value) {
                                validateWebsite(value);
                              },
                              icon: Icons.title),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ))
      ],
    );
  }
}
