# Possible Bipartition
[Question](https://leetcode.com/problems/possible-bipartition/description/)

# BFS Solution:
```cpp
class Solution {
    bool BFS(vector<vector<int>> &graph, vector<int> &color, int node) {

        queue<int> q;
        q.push(node);
        color[node] = 1;

        while(!q.empty()) {
            
            int curr = q.front();
            q.pop();

            for(auto& i:graph[curr]) {
                
                if(color[i] == color[curr]) {
                    return false;
                }

                if(color[i] == 0) {
                    q.push(i);
                    color[i] = - color[curr];
                }
            }
        }

        return true;
    }
public:
    bool possibleBipartition(int n, vector<vector<int>>& dislikes) {

        vector<vector<int>> graph(n+1);
        vector<int> color(n+1, 0);

        for(auto& i:dislikes) {
            graph[i[0]].push_back(i[1]);
            graph[i[1]].push_back(i[0]);
        }

        for(int i=1;i<=n;i++) {
            if(color[i] == 0) {
                if(!BFS(graph, color, i)) return false;
            }
        }

        return true;
    }
};
```

# Disjoint Set Union Solution:
```cpp
class DisjointSet {
    
    vector<int> rank;
    vector<int> parent;

    public:
        DisjointSet(int n) {

            rank.resize(n,0);
            parent.resize(n);
            iota(parent.begin(), parent.end(), 0);
        }      

        int findParent(int node) {

            if(parent[node] == node) return node;

            return parent[node] = findParent(parent[node]);
        }

        bool Union(int u, int v) {

            u = findParent(u);
            v = findParent(v);

            if(u == v) return true;

            if(rank[u] < rank[v]) {
                parent[u] = v;
            } else if(rank[v] < rank[u]) {
                parent[v] = u;
            } else {
                parent[u] = v;
                rank[v]++;
            }

            return false;
        }
};

class Solution {
public:
    bool possibleBipartition(int n, vector<vector<int>>& dislikes) {

        DisjointSet dsu(n+1);

        vector<vector<int>> graph(n+1);
        for(auto& i:dislikes) {
            graph[i[0]].push_back(i[1]);
            graph[i[1]].push_back(i[0]);
        }

        for(int i=1;i<=n;i++) {
            int currPar = dsu.findParent(i);
            for(auto& j:graph[i]) {
                if(dsu.findParent(j) == currPar) {
                    return false;
                }
                dsu.Union(graph[i][0], j);
            }
        }

        return true;
    }
};
```