import 'package:flutter/material.dart';
import 'package:widgettest/utils/constants.dart';
import 'package:widgettest/utils/custom/cut_container_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // double ht = MediaQuery.of(context).size.height;
    // double wt = MediaQuery.of(context).size.width;

    int gridItemLength = 5;

    return Scaffold(
      backgroundColor: const Color(0xFF1E0A3C),
      // appBar: AppBar(
      //   title: const Text("Home"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: veriticalPadding),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                CustomPaint(
                  painter: CutContainerPainter(
                    borderStrokeWidth: 1.5,
                    bgColor: Colors.black45,
                    linearGradient: LinearGradient(
                      colors: [const Color.fromARGB(255, 162, 232, 198), Colors.grey.shade700, Colors.grey.shade700],
                      begin: Alignment.topCenter, // Start the gradient at the top
                      end: Alignment.bottomCenter, // End the gradient at the bottom
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 200,
                    width: double.infinity,
                    child: const Text("Bitoin VS Gold", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                  ),
                ),
                const SizedBox(height: 20,),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.1
                  ),
                  itemCount: gridItemLength,
                  itemBuilder: (BuildContext context, int index) {
                    bool isLeftContainer = index % 2 == 0;
                    if(index < gridItemLength-2){
                      return CustomPaint(
                        painter: CutContainerPainter(
                          borderStrokeWidth: 1.5,
                          bgColor: Colors.black,
                          linearGradient: LinearGradient(
                            colors: isLeftContainer? [const Color.fromARGB(255, 162, 232, 198), Colors.grey.shade700, Colors.grey.shade700] : [const Color.fromARGB(255, 213, 19, 216), Colors.grey.shade700, Colors.grey.shade700],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(top: 16, right: 16, left: 12, bottom: 12),
                          alignment: Alignment.topLeft,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Live Price", style: TextStyle(color: Colors.white, fontSize: 14),),
                              SizedBox(height: 2,),
                              Text("18.362K", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      );
                    }else{
                      return CustomPaint(
                        painter: CutContainerPainter(
                          borderStrokeWidth: 0.75,
                          bgColor: Colors.black,
                          linearGradient: LinearGradient(
                            colors: isLeftContainer? [const Color.fromARGB(255, 162, 232, 198), Colors.grey.shade700, Colors.grey.shade700] : [const Color.fromARGB(255, 213, 19, 216), Colors.grey.shade700, Colors.grey.shade700],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.add, size: 40, color: Colors.grey.shade400,),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


