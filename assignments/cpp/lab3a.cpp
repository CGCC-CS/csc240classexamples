#include<iostream>

using namespace std;

class Activity3a {
   private:
       string * characters;
       int count;
       int max;
   public:
     Activity3a(int m=0) {
        count=0;
        max=m;
        characters = new string[m];
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
    Activity3a act3(3);
    act3.load();
    act3.print();
}

