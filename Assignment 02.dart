class Book{
  String title;
  String author;
  double price;
  Book({required this.title, required this.author,required this.price,});

  double discountPrice(double discountPercent){
    return price - (discountPercent* price)/100;
  }
 
}


class Employee{
  String name;
  double salary;
  Employee({required this.name, required this.salary});

}

class Manager extends Employee{
  String department;
  Manager({required String name,required double salary, required this.department}) :super(name: name,salary: salary);
  void displayManager()
  {
    print("Name: $name, Salary: $salary, Department: $department");
  }

}

class Developer extends Employee{
  String prLanguage;
  Developer({ required String name, required double salary, required this.prLanguage}):super(name: name,salary: salary);

  void displayDeveloper()
  {
    print("Name: $name, Salary: $salary, Language: $prLanguage");
  }
}

abstract class Appliance{
  void turnOff();
  void turnOn();
}

class Fan extends Appliance{
  
  
  @override
  void turnOn() {
    print("Fan is now running");
  }
  
  @override
  void turnOff() {
    print("Fan is not running");
  }
}

class Light extends Appliance{
  @override
  void turnOff() {
    print("Light is switched off");
  }

  @override
  void turnOn() {
    print("Light is switched on");
  }

}
void main(){
Book book1 = Book(title: "ICT", author: "Moinul", price: 600);
print("Title: ${book1.title}, Author: ${book1.author}, Discout Price: ${book1.discountPrice(10)}");
Book book2 = Book(title: "Math", author: "Hasan", price: 700);
print("Title: ${book2.title}, Author: ${book2.author}, Discout Price: ${book2.discountPrice(10)}");
Manager m1 = Manager(name: "Raka", salary: 8000, department: "HR");
m1.displayManager();
Developer d1 = Developer(name: "Afridi", salary: 70000, prLanguage: "C++");
d1.displayDeveloper();
Fan fan=Fan();
fan.turnOn();
fan.turnOff();
Light light=Light();
light.turnOn();
light.turnOff();

}