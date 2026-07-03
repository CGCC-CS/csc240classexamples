#include<iostream>

using namespace std;

class Activity3b {
   private:
       string characters[3];
       int count;
       int max = 3;
   public:
     explicit Activity3b() {
        count=0;
     }

     void load() {
        for(int ii=0;ii<max;ii++) {
            cout << "Enter a word: ";
            cin >> characters[ii];
        }
     }

     void print() {
        for(int ii=0;ii<max;ii++) {
            cout << ii+1 << ": " << characters[ii] << endl;
        }
     }
};

int main() {
    Activity3b act3;
    act3.load();
    act3.print();
}

