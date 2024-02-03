#include<iostream>

using namespace std;

class Shape {
    protected:
        string type;

    public:
        Shape(string t="Shape") : type(t) {}  

        // non-virtual method - type of pointer determines what gets called
        void print() { cout << "SHAPE: I am a shape" << endl; }

        // virtual method - type of the object determines what gets called 
        virtual void printType() { cout << "SHAPE: " << type << endl; }

        // pure virtual method (abstract) - must be overridden in non-abstract child
        virtual int area() = 0;
        virtual int perimeter() = 0;

};

class Rectangle : public Shape {
    private:
        int length;
        int width;
    public:
        Rectangle(int l, int w, string t="Rectangle")
            : Shape(t), length(l), width(w) {}

        int area() override { return length * width; }
        int perimeter() override { return 2 * length + 2 * width; }

        void print() {
            cout << "RECTANGLE: " << type << " length=" << length << 
                    " width=" << width << endl;
        }

        void printType() {
            if (length == width) {
                cout << "RECTANGLE: " << "Square" << endl;
            }
            else {
                cout << "RECTANGLE: " << type << endl;
            }
        }
};

int main() {
    /*
    // You cannot instantiate an abstract object 
    Shape s("MyShape");  
    s.print(); 
    s.printType();
    Shape * sPtr = new Shape("Shape ptr");
    sPtr->print();
    sPtr->printType();
    */


    Rectangle r1(5, 7);
    Rectangle * r2 = new Rectangle(4, 4);
    Shape * sPtr = r2;

    cout << endl << "Rectangle variable r1:" << endl;
    r1.print();
    r1.printType();
    cout << "area=" << r1.area() << " perimeter=" << r1.perimeter() << endl;

    cout << endl << "Rectangle pointer r2:" << endl;
    r2->print();
    r2->printType();
    cout << "area=" << r2->area() << " perimeter=" << r2->perimeter() << endl;

    cout << endl << "Shape pointer sPtr to rectangle r2:" << endl;
    sPtr->print();
    sPtr->printType();
    cout << "area=" << sPtr->area() << " perimeter=" << sPtr->perimeter() << endl;


    return 0;
}
