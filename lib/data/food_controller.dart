import 'food.dart';
class FoodList {
  List<Food> list;
  int get getLength => list.length;
}

var dummyFood = [
  new Food(name: "Hamburger", price: 18.0, count: 15,),
  new Food(name: "Pizza", price: 18.0, count: 12,),
  new Food(name: "Cola", price: 6.0, count: 24,),
  new Food(name: "Chocolate Milk", price: 4.0, count: 117),
];

class FoodController {
  FoodList menu = new FoodList();
  FoodList basket = new FoodList();
  Food getFoodByName(FoodList foodList, String name) {
    Food f;
    foodList.list.forEach((food) {
      if(food.name == name) {
        f = food;
        print(food.name);
      }
    });
    return f;
  }
  addToBasket(Food food) {
    Food f = getFoodByName(basket, food.name);
    if(f != null) {
      getFoodByName(menu, food.name).count--;
      f.count++;
    }
    else {
      Food f = new Food(name: food.name, price: food.price);
      f.count = 1;
      basket.list.add(f);
      getFoodByName(menu, food.name).count--;
      print("${f.name} has been added to the basket!");
    }
    print(food.count);
  }
  removeFromBasket(Food food) {
    print("Initial count is: ${food.count}");
    if(food.count == 1) {
      basket.list.remove(food);
      getFoodByName(menu, food.name).count++;
    } else {
      food.count--;
    }
    print("Removal count is: ${food.count}");
  }
  confirmOrder(double price) {
    var orderList = List.from(basket.list);
    orderList.forEach((food) {
      basket.list.remove(food);
    });
  }
  cancelOrder() {
    basket.list.forEach((food) {
      removeFromBasket(food);
    });
    basket.list.clear();
  }
  FoodController(){
    this.menu.list = dummyFood;
    this.basket.list = [];
  }
}