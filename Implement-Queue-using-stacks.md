# Implement Queue using Stacks
[Question](https://leetcode.com/problems/implement-queue-using-stacks/description/)

### My Solution:
```cpp
class MyQueue {

    stack<int> in, out;

public:

    void push(int x) {
        in.push(x);
    }
    
    int pop() {
        int temp = peek();
        out.pop();
        return temp;
    }
    
    int peek() {
        if(out.empty()) {
            while(in.size()) {
                out.push(in.top());
                in.pop();
            }
        }
        return out.top();
    }
    
    bool empty() {
        return in.empty() && out.empty();
    }
};
```

### Amortized Solution:

```cpp
class MyQueue {
    stack<int> in, out;
public:

    void push(int x) {
        in.push(x);
    }
    
    int pop() {
        int temp = peek();
        out.pop();
        return temp;
    }
    
    int peek() {
        if(out.empty()) {
            while(in.size()) {
                out.push(in.top());
                in.pop();
            }
        }
        return out.top();
    }
    
    bool empty() {
        return in.empty() && out.empty();
    }
};
```
