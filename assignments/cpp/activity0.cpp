#include<iostream>

using namespace std;

class MyClass {
  private:  
    string name;   // String data member
    int num;       // int data member
  public:
    // Constructor
    MyClass(string n="", int x=0) {
      name = n;
      num = x;
    }
  // Method definition
  void print() {
    cout << "Name=" << name << ", Num=" << num << endl;
  }
};

int main() {
  MyClass c1("Bob Smith", 1);
  MyClass c2("Alice Jones", 2);
  c1.print();
  c2.print();
  cout << endl;
  return 0;
}
