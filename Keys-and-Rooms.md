# Keys And Rooms
[Question](https://leetcode.com/problems/keys-and-rooms/description/)

# My Solution:
```cpp
class Solution {
public:
    bool canVisitAllRooms(vector<vector<int>>& rooms) {
        
        vector<bool> visited(rooms.size(),false);
        stack<int> s;
        s.push(0);
        visited[0] = true;

        while(!s.empty()) {
            
            int curr = s.top();
            s.pop();

            for(int i=0;i<rooms[curr].size();i++) {
                if(!visited[rooms[curr][i]]) {
                    s.push(rooms[curr][i]);
                    visited[rooms[curr][i]] = true;
                }
            }
        }

        int count=0;
        for(int i=0;i<rooms.size();i++) if(visited[i] == true) count++;
        return (count == rooms.size());
    }
};
```

# Complexity Analysis
## Time Complexity: $O(n)$
## Space Complexity: $O(n)$
