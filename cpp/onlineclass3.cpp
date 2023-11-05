#include<iostream>
#include<string>
#include<vector>

using namespace std;

int main() {

    vector<int> vec;     // vector of ints
    vector<string> strVec = {"Hello", "World"};   // vector of string
    strVec.push_back("CGCC");
    strVec.push_back("CSC240");


    cout << "size of vec = " << vec.size() << endl;
    cout << "size of strVec = " << strVec.size() << endl;


    for (int ii=0;ii<8;ii++) {
        vec.push_back(ii+1);
    }
    cout << "After push_back loop, ";
    cout << "size of vec = " << vec.size() << endl;

    // for-each loop or ranged-for loop
    cout << "vec = ";
    for (auto const &ii : vec) {
        cout << ii << " ";
    }
    cout << endl;

    // iterator
    cout << "strVec = ";
    for(vector<string>::iterator ii=strVec.begin(); ii != strVec.end(); ++ii) {
        cout << (*ii) << " ";
    }
    cout << endl;

    return 0;
}