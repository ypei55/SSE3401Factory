import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lab5_factory/invitation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 1;
  int currentFactoryIndex = 1;
  Color fac1 = Colors.blue;
  Color fac2 = Colors.grey;
  Color fac3 = Colors.grey;
  final List<String> entries = ['Ben', 'Testing 1', 'Hello'];
  final List<String> telNum = ['+60109219938', '+601234567891', '+60123456789'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(213, 213, 212, 1),
      appBar: AppBar(
        title: Text(
          'Factory $currentFactoryIndex',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.54,
                width: MediaQuery.of(context).size.width * 0.90,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 10, 3, 3),
                  child: currentIndex == 0
                      ? 
                      currentFactoryIndex == 1
                          ? Column(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                    itemCount: entries.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color:const Color.fromRGBO(254, 255, 254, 1),
                                            borderRadius:BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset:const Offset(0, 3))
                                            ]),
                                        height:
                                            MediaQuery.of(context).size.height *0.11,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            mainAxisAlignment:MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 30),
                                                child:
                                                 Text(
                                                  entries[index],
                                                  style: const TextStyle(fontSize: 25,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 10,),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius:BorderRadius.circular(20),
                                                      color:const Color.fromRGBO(168, 169, 169, 1),
                                                    ),
                                                  ),
                                                 const SizedBox(width: 10,),
                                                  Text(
                                                    telNum[index],
                                                    style: const TextStyle(
                                                    fontSize: 25,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:(BuildContext context, int index) {
                                      return const SizedBox(height: 20,);
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) =>const Invitation(currentFactoryIndex: 1,),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(60, 60),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:BorderRadius.circular(15),
                                            ),
                                            backgroundColor: const Color.fromRGBO(223, 220, 254, 1)),
                                        child: 
                                        const Text('+',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : const Column()
                      : currentIndex == 1
                              ?currentFactoryIndex==2
                              ?FactoryInformation('1549.7kW','34.19','22.82','55.41','50.08','images/data1.png','images/data2.png','images/data3.png','images/data4.png',DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()))
                              :const FactoryInformation('⚠️ABD1234 IS UNREACHABLE !','0.0','0.0','0.0','0.0','images/data1.png','images/data2.png','images/data3.png','images/data4.png','--:--')

                          //setting page
                        : currentFactoryIndex == 1
                              ? Padding(
                                  padding:const EdgeInsets.fromLTRB(10, 25, 10, 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Minimum Threshold',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 22.5,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.info_outline_rounded),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(70, 50),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:BorderRadius.circular(30),
                                                ),
                                                backgroundColor: const Color.fromRGBO(247, 241, 249, 1)),
                                            child: const Icon(
                                              Icons.edit,
                                              size: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 15,
                                          mainAxisSpacing: 5,
                                          children: [
                                            buildThresholdData('Steam\nPressure','29','bar'),
                                            buildThresholdData('Steam\nFlow','22','T/H'),
                                            buildThresholdData('Water\nLevel','53','%'),
                                            buildThresholdData('Power\nFrequency','48','Hz'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : const Column(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     const SizedBox(width: 20,
                      ),
                      buildFactoryContainer(
                        factoryName:'Factory 1',
                        color: fac1,
                        onTap:(){
                          setState(() {
                            fac1 = Colors.blue;
                            fac2 = Colors.grey;
                            fac3 = Colors.grey;
                            currentFactoryIndex = 1;
                          });
                        }
                      ),
                      const SizedBox(width: 25,
                      ),
                      buildFactoryContainer(
                        factoryName:'Factory 2',
                        color: fac2,
                        onTap:(){
                          setState(() {
                            fac1 = Colors.grey;
                            fac2 = Colors.blue;
                            fac3 = Colors.grey;
                            currentFactoryIndex = 2;
                          });
                        }
                      ),
                      const SizedBox(width: 25,
                      ),
                      buildFactoryContainer(
                        factoryName:'Factory 3',
                        color: fac3,
                        onTap:(){
                          setState(() {
                            fac1 = Colors.grey;
                            fac2 = Colors.grey;
                            fac3 = Colors.blue;
                            currentFactoryIndex = 3;
                          });
                        }
                      ),
                      
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            label: '',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
  
  Widget buildThresholdData(String title, String data, String unit) {
    return Column(
      children: [
        Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              ),
            ),
        const SizedBox(height: 5,),
        Container(
            decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius:BorderRadius.circular(10),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding:const EdgeInsets.symmetric(horizontal:30,vertical: 5),
                  child: Text(
                    data,
                    style: const TextStyle(
                          fontSize: 30,
                          fontWeight:FontWeight.w900),
                              ),
                          ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 3,
                ),
                Padding(padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  child: Text(
                    unit,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight:FontWeight.w900,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  
  buildFactoryContainer({
    required String factoryName, 
    required Color color, 
    required VoidCallback onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width * 0.40,
          decoration: BoxDecoration(
            border: Border.all(color: color),
            color: const Color.fromRGBO(247, 247, 247, 1),
            borderRadius:const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                  BoxShadow(
                      color: color.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                      ),
                    ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.factory,
                    size: 40,
                  ),
                  Text(
                      factoryName,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                  ),
              ],
          ),
        ),
      );
  }
}

class FactoryInformation extends StatefulWidget {
  final String title;
  final String data1; 
  final String data2; 
  final String data3; 
  final String data4; 
  final String imgPath1; 
  final String imgPath2; 
  final String imgPath3; 
  final String imgPath4;
  final String date;

  const FactoryInformation(this.title, this.data1, this.data2,this.data3,this.data4,this.imgPath1,this.imgPath2,this.imgPath3,this.imgPath4, this.date,
  {super.key});

  @override
  State<FactoryInformation> createState() => _FactoryInformationState();
}

class _FactoryInformationState extends State<FactoryInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Expanded(child: 
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 12.0,
              padding: const EdgeInsets.all(10.0),
              children: [
                buildData('Steam Pressure',widget.imgPath1,widget.data1,'bar'),
                buildData('Steam Flow', widget.imgPath2,widget.data2,'T/H'),
                buildData('Water Level',widget.imgPath3,widget.data3,'%'),
                buildData('Power Frequency', widget.imgPath4, widget.data4,'Hz'),
              ],),),
          const SizedBox(
            height: 15,
          ),
          
          Text(
            widget.date,
            style: const TextStyle(fontSize: 20),
          )
          
        ],
      );
  }
  
  Widget buildData(String subTitle, String imgPath, String value, String unit) {
        return Container(
          decoration: BoxDecoration(
          color: const Color.fromRGBO(254, 255, 254, 1),
          borderRadius: BorderRadius.circular(10),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 3,),
              Text(
                subTitle, 
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                  color: Color.fromRGBO(125, 125, 125, 1),
                ),
              ),
              const SizedBox(height: 3,),
              Image.asset(
                imgPath,
                width: 145,),
                const SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),),
                    Text(unit,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),),
                  ],
                ),
            ],
          ),
        );
  }
}

         