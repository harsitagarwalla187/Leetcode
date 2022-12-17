# Evaluate Reverse Polish Notation
[Ques-Link](https://leetcode.com/problems/coin-change/description/)

# My Solution:

```cpp
class Solution {
public:
    int evalRPN(vector<string>& v) {
        
        stack<long long int> s;

        int i=0;
        while(i<v.size()) {

            if(v[i]=="+" || v[i]=="-" || v[i]=="/" || v[i]=="*") {
                
                long long int t1 = s.top(); s.pop();
                long long int t2 = s.top(); s.pop();

                if(v[i] == "+")         s.push(t2+t1);
                else if(v[i] == "-")    s.push(t2-t1);
                else if(v[i] == "*")    s.push(t2*t1);
                else                    s.push(t2/t1);

            } else {

                s.push(stoi(v[i]));
            }

            i++;
        }

        return s.top();
    }
};
```

# Code:
```cpp
class Solution {
public:
    int evalRPN(vector<string>& v) {
        
        unordered_map<string, function<long long int (long long int,long long  int)>> map = {
            { "+" , [] (int a, int b) { return a + b; } },
            { "-" , [] (int a, int b) { return a - b; } },
            { "*" , [] (long long int a,long long int b) { return a * b; } },
            { "/" , [] (int a, int b) { return a / b; } }
        };
        stack<long long int> s;
        for (string& ss : v) {
            if (!map.count(ss)) {
                s.push(stoi(ss));
            } else {
                int op1 = s.top();
                s.pop();
                int op2 = s.top();
                s.pop();
                s.push(map[ss](op2, op1));
            }
        }

        return s.top();
    }
};
```