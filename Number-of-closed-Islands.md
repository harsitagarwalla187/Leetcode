# Number of Closed Islands :
## [Question](https://leetcode.com/problems/number-of-closed-islands/)

# Approach :

* ### Use DFS on element to check if it's surrounded by water or not. If Yes, mark that element visited.

# Code :
```cpp
class Solution {
    bool DFS(vector<vector<int>>& grid, int i, int j, vector<vector<bool>>& visited) {

        if(i<0 || j<0 || i==grid.size() || j==grid[0].size()) 
            return false;
        
        if(grid[i][j] || visited[i][j])
            return true;

        visited[i][j] = true;

        return min(
            min(DFS(grid, i-1, j, visited), DFS(grid, i+1, j, visited)),
            min(DFS(grid, i, j-1, visited), DFS(grid, i, j+1, visited))
        );
    }
public:
    int closedIsland(vector<vector<int>>& grid) {

        int rows = grid.size();
        int cols = grid[0].size();
        vector<vector<bool>> visited(rows, vector<bool>(cols, 0));

        for(int i=0; i<rows; i++) 
            for(int j=0; j<cols; j++) 
                if(grid[i][j]) visited[i][j] = true;

        int count = 0;
        
        for(int i=0; i<rows; i++) {
            for(int j=0; j<cols; j++) {
                if(!visited[i][j])
                    count += DFS(grid, i, j, visited);
            }
        }

        return count;
    }
};
```