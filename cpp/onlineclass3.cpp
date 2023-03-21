#include<iostream>
#include<string>
#include<vector>

using namespace std;


int main() {

    vector<int> vec;

    vector<string> strVec = {"Hello", "World"};

    cout << "size of vec = " << vec.size() << endl;
    cout << "size of vec = " << strVec.size() << endl;

    for(int ii=0;ii<8;ii++) {
        vec.push_back((ii+1)*3);
    }
    cout << "size of vec = " << vec.size() << endl;

    // for-each loop
    cout << "vec = ";
    for (auto const &ii : vec) {
        cout << ii << " ";
    }
    cout << endl;

    // iterator
    cout << "strVec";
    for (vector<string>::iterator ii=strVec.begin(); ii != strVec.end(); ++ii) {
        cout << (*ii) << " ";
    }
    cout << endl;



    return 0;
}