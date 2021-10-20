// cerner_2tothe5th_2021
// Program to print the complete lyrics of 99 Bottles of Beer on the Wall

#include <iostream>
using std::cout;
 
int main() 
{
  for(int i = 99; i > 0; i--){
    cout << i << " bottles of beer on the wall\n"
         << i << " bottles of beer\n"
         << "Take one down, pass it around\n"
         << i - 1 << " bottles of beer on the wall\n\n";
  }

  return(0);
}
