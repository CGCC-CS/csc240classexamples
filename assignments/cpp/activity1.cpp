#include<iostream>

using namespace std;

class MyClass {
   private:
       int num;
   public:
     MyClass(int x=0) {
       num = x;
     }
     int doubleNum(); // Returns num times 2
     void print();  // Prints num
}; 

int main() {
  MyClass x(10);
  MyClass y(11);

  cout << "x: " << endl << "  ";
  x.print();
  cout << "  x.doubleNum=" << x.doubleNum() << endl;;

  cout << endl << "y: " << endl << "  ";
  y.print();
  cout << "  y.doubleNum=" << x.doubleNum() << endl;;

  return 0;
}
