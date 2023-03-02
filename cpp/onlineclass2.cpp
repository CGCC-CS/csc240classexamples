#include<iostream>

using namespace std;

class OnlineExample {
    private:
        string s;
        int * x;
        int * y;
    public:
        // Constructor
        OnlineExample(int a, int b, const string & str="") : s(str) {
            cout << "Constructor for " << s << " a=" << a << " b=" << b << endl;
            x = new int(a);
            y = new int[b];
            for (int ii=0;ii<b;ii++) {
                y[ii]=ii+a;
            }
        }

        // Copy Constructor
        OnlineExample(const OnlineExample & original) : s("COPY OF " + original.s) {
            cout << "Copy Constructor for " << original.s << " x=" << original.x << " y=" << original.y << endl;
            x = new int(*original.x);
            y = new int [10];
            for (int ii=0;ii<10;ii++) {
                y[ii]=ii+1;
            }
            cout << "         New Object: " << s << " x=" << x << " y=" << y << endl;
        }

        // Destructor
        ~OnlineExample(void) {
            cout << "Destructor for " << s << endl;
            delete x;
            x = nullptr;
            delete[] y;
            y = nullptr;
            s = "";
        }

};

void exampleFunction(const OnlineExample &functionParameterObject1, OnlineExample functionParameterObject2) {
    cout << "--------- Start of exampleFunction ---------" << endl;
    OnlineExample functionLocalVar(3, 6, "function local stack");
    static OnlineExample functionStaticLocalVar(2, 4, "function local static");
    cout << "---------- End of exampleFunction ----------" << endl;
}

int main() {
    int var = 10;                    // Integer variable
    int * intPtr = new int(20);      // Integer pointer variable
    int ** intPtrPtr = new int *;    // Double integer pointer variable
    *intPtrPtr = new int(30);
    int * arrPtr = new int[5];

    for (int ii=0;ii<5;ii++) {
        arrPtr[ii] = (ii+1) * 10;
    }

    cout << "variable var: " << var << " address: " << &var << endl;
    cout << "pointer intPtr: " << intPtr << " dereferenced: " << *intPtr << " address: " << &intPtr << endl;
    cout << "pointer to pointer intPtrPtr: " << intPtrPtr << " dereferenced: " << *intPtrPtr << endl;
    cout << "         double dereferenced: " << **intPtrPtr << " address: " << &intPtrPtr << endl;
    cout << "pointer arrPtr: " << arrPtr << " dereferenced: " << *arrPtr << " address: " << &arrPtr << "  values: ";
    for (int ii=0;ii<5;ii++) {
        cout << arrPtr[ii] << " ";
    }
    cout << endl << endl;

    cout << "------- Start of testing OnlineExample -------" << endl;
    static OnlineExample staticObj(6, 12, "static object");
    OnlineExample stackObj(5, 10, "stack object");
    OnlineExample * heapObj = new OnlineExample(4, 8, "heap object");


    cout << endl << "---------- Calling exampleFunction1 ----------" << endl;
    exampleFunction(staticObj, stackObj);
    cout << "------- Returned from exampleFunction1 -------" << endl;
    cout << endl << "---------- Calling exampleFunction2 ----------" << endl;
    exampleFunction(staticObj, stackObj);
    cout << "------- Returned from exampleFunction2 -------" << endl;
    cout << endl;;

    // Delete the integer poitners
    delete(intPtr);
    delete(*intPtrPtr);
    delete(intPtrPtr);
    delete[](arrPtr);

    // Delete the object pointer
    delete(heapObj);
    cout << "-------- End of testing OnlineExample --------" << endl;

    return 0;
}
