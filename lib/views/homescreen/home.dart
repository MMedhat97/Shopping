import 'package:shopping/consts/consts.dart';
import 'package:shopping/controller/home_controller.dart';
import 'package:shopping/views/cartscreen/cart_screen.dart';
import 'package:shopping/views/categoryscreen/category_screen.dart';
import 'package:shopping/views/homescreen/home_screen.dart';
import 'package:shopping/views/profilescreen/profile_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(() => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value),
              )),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(
            fontFamily: semibold,
          ),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
