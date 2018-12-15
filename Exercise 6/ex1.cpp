#include<iostream>

using namespace std;

int array[10] = {17, 24, 19, 21, 14, 16, 18, 12, 22, 23};

int sum(int i)
{
    if (i == 9)
        return array[9];
    return array[i] + sum(i + 1);
}

int main(int argc, char const *argv[])
{
    cout << sum(0);
    return 0;
}