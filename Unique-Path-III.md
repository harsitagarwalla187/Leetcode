# Unique Paths III
[Question](https://leetcode.com/problems/unique-paths-iii/description/)

# Solution:
```cpp
class Solution {

    int m, n, tWalk, ans;
    
    // m -> no. of rows
    // n -> no. of columns
    // tWalk -> total empty square to walk over i.e grid[i][j] == 0
    // ans -> no. of ways to reach the ending square

    void DFS(vector<vector<int>> &grid, int i, int j) {

        // Condition to check the index are in range 
        //                  &
        // there is no obstacle in the square
        if(i < 0 || i >= m || j < 0 || j >= n || grid[i][j] == -1) 
            return;

        // Check Current Square is the ending Square 
        if(grid[i][j] == 2) {
            // If there is no square left to walk over then 
            // we have find a way to reach the ending square 
            // so increment the ans and return else
            // return also because there are more square to 
            // walk over before stepping in end square
            if(tWalk == -1) ans++;
            return; 
        }

        // Mark current square has been walked so that 
        // we don't walk over again
        grid[i][j] = -1;
        // Since we have walked one more square so 
        // decrement total swaures to walk
        tWalk--;

        // Recursive call for Left Square
        DFS(grid, i, j-1);
        // Recursive call for Right Square
        DFS(grid, i, j+1);
        // Recursive call for Upward Square
        DFS(grid, i-1, j);
        // Recursive call for Downward Square
        DFS(grid, i+1, j);

        // Restore Total Walk
        tWalk++; 
        // Restore current square identity
        grid[i][j] = 0;
    }

public:

    int uniquePathsIII(vector<vector<int>>& grid) {
        
        m = grid.size();
        n = grid[0].size();
        ans = 0;
        tWalk = 0;

        int sx, sy;
        for(int i=0; i<m; i++) {
            for(int j=0; j<n; j++) {
                // Calaculating total square to walk over
                if(grid[i][j] == 0) tWalk++;
                // Storing the starting Square index 
                if(grid[i][j] == 1) {
                    sx = i;
                    sy = j;
                } 
            }
        }

        DFS(grid, sx, sy);

        return ans;
    }   

};
```