# Top K Frequent Solution
[Question](https://leetcode.com/problems/find-if-path-exists-in-graph/description/)

# Solution 1:
## Using BFS:
```cpp
class Solution {
public:
    bool validPath(int n, vector<vector<int>>& edges, int source, int destination) {

        vector<vector<int>> graph(n);
        for(int i=0;i<edges.size();i++) {
            int t1 = edges[i][0];
            int t2 = edges[i][1];
            graph[t1].push_back(t2);
            graph[t2].push_back(t1);
        }

        queue<int> pend;
        vector<bool> visited(n, 0);
        pend.push(source);
        visited[source] = 1;

        while(!pend.empty()) {

            int curr = pend.front();
            pend.pop();

            if(curr == destination) return true;

            for(int i=0;i<graph[curr].size();i++) {
                if(!visited[graph[curr][i]]) {
                    pend.push(graph[curr][i]);
                    visited[graph[curr][i]] = 1;
                }
            }
        }

        return false;
    }
};
```
# Solution 2:
## Using DFS:
```cpp
class Solution {
    bool DFS(vector<vector<int>>& graph, vector<bool>& visited, int curr, int dest) {

        if(curr == dest) return true;
        if(visited[curr]) return false;

        visited[curr] = true;

        for(int i=0;i<graph[curr].size();i++) {
            if(DFS(graph, visited, graph[curr][i], dest)) return true;
        }

        return false;
    }
public:
    bool validPath(int n, vector<vector<int>>& edges, int source, int destination) {

        vector<vector<int>> graph(n);
        for(int i=0;i<edges.size();i++) {
            int t1 = edges[i][0];
            int t2 = edges[i][1];
            graph[t1].push_back(t2);
            graph[t2].push_back(t1);
        }

        vector<bool> visited(n, 0);
        
        return DFS(graph, visited, source, destination);

    }
};
```
# Solution 3:
## Using Disjoint Union Set:
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
    bool validPath(int n, vector<vector<int>>& edges, int source, int destination) {

        DisjointSet com(n);

        for(int i=0;i<edges.size();i++) {
            com.Union(edges[i][0], edges[i][1]);
        }

        return com.Union(source, destination);
    }
};

```
