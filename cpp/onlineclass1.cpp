#include<iostream>

using namespace std;

class Shape {
    protected:
        string type;

    public:
        Shape(string t="Shape") : type(t) {}  

        // non-virtual method
        void print() { cout << "I am a shape" << endl; }
        
        // virtual method
        virtual void printType() { cout << "SHAPE: " << type << endl; }

        // pure virtual (abstract) methods
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

        int area() { return length * width; }
        int perimeter() { return 2 * length + 2 * width; }

        void print() {cout << type << " length=" << length <<
                              " width=" << width << endl; }
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
    /* Cannot instantiate Shape objects 
    Shape s("MyShape");  
    s.print(); 
    s.printType();
    */

    Rectangle r1(5, 7);  
    Rectangle * r2 = new Rectangle(3,4);
    Shape * sPtr = r2;

    cout << "Rectangle variable r1:" << endl;
    r1.print(); 
    r1.printType();
    cout << "area=" << r1.area() << "  perimeter=" << r1.perimeter() << endl;

    cout << endl << "Rectangle *r2 (pointer):" << endl;
    r2->print(); 
    r2->printType();
    cout << "area=" << r2->area() << "  perimeter=" << r2->perimeter() << endl;

    cout << endl << "Shape *sPtr=r2 (pointer to r2):" << endl;
    sPtr->print(); 
    sPtr->printType();
    cout << "area=" << sPtr->area() << "  perimeter=" << sPtr->perimeter() << endl;

    return 0;
}
