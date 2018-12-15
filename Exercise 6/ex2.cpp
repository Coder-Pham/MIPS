#include <iostream>

using namespace std;

int arr[10] = {1,2,9,8,0,3,5,7,6,4};

int max_arr(int i)
{
    if (i == 9)
        return arr[9];
    else return max(max_arr(i + 1), arr[i]);
}

int main(int argc, char const *argv[])
{
    cout << max_arr(0);
    return 0;
}
