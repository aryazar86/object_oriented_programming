=begin 

Input:  A directed graph where a node represents a town and an edge represents a route between two towns.  The weighting of the edge represents the distance between the two towns.  A given route will never appear more than once, and for a given route, the starting and ending town will not be the same town.
 
Output: For test input 1 through 5, if no such route exists, output 'NO SUCH ROUTE'.  Otherwise, follow the route as given; do not make any extra stops!  For example, the first problem means to start at city A, then travel directly to city B (a distance of 5), then directly to city C (a distance of 4).
 
1. The distance of the route A -B-C.
2. The distance of the route A-D.
3. The distance of the route A-D-C.
4. The distance of the route A-E-B-C-D.
5. The distance of the route A-E-D.
6. The number of trips starting at C and ending at C with a maximum of 3 stops.  In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops).
7. The number of trips starting at A and ending at C with exactly 4 stops.  In the sample data below, there are three such trips: A to C (via B,C,D); A to C (via D,C,D); and A to C (via D,E,B).
8. The length of the shortest route (in terms of distance to travel) from A to C.
9. The length of the shortest route (in terms of distance to travel) from B to B.
10. The number of different routes from C to C with a distance of less than 30.  In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC.
 
Test Input:
 
For the test input, the towns are named using the first few letters of the alphabet from A to E.  A route between two towns (A to B) with a distance of 5 is represented as AB5.
  
Graph: AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7
 
Expected Output:
 
Output #1: 9
Output #2: 5
Output #3: 13
Output #4: 22
Output #5: NO SUCH ROUTE
Output #6: 2
Output #7: 3
Output #8: 9
Output #9: 9
Output #10: 7
=end

class Route
  
  attr_reader :node_1, :node_2, :distance

  def initialize(node_1, node_2, distance)
    @node_1 = node_1
    @node_2 = node_2
    @distance = distance
  end

end

def distance_in_route(nodes)

  route_in_question = []

  (0..question_1.length - 2).each do |x|
    y = 0
    pair = []
    pair[y] = question_1[x] 
    pair[y + 1] = question_1[x+1]
    route_in_question[x] = pair
  end

  distance_of_route = 0
  (0..route_in_question.length - 1).each do |x|
    (0..array_of_routes.length - 1).each do |y|
      if route_in_question[x][0] == array_of_routes[y].node_1 && route_in_question[x][1] == array_of_routes[y].node_2
        distance_of_route += array_of_routes[y].distance
  #      puts route_in_question[x][0] + " = " + array_of_routes[y].node_1
  #      puts route_in_question[x][1] + " = " + array_of_routes[y].node_2
      end
    end
  end

a_b = Route.new("A", "B", 5)
b_c = Route.new("B", "C", 4)
c_d = Route.new("C", "D", 8)
d_c = Route.new("D", "C", 8)
d_e = Route.new("D", "E", 6)
a_d = Route.new("A", "D", 5)
c_e = Route.new("C", "E", 2)
e_b = Route.new("E", "B", 3)
a_e = Route.new("A", "E", 7)

array_of_routes = [a_b, b_c, c_d, d_c, d_e, a_d, c_e, e_b, a_e]

question_1 = "AEBCD"

puts distance_of_route

=begin question_1 = "ABCDE"

pair = []

(0..question_1.length - 2).each do |x|
  pair[x] = question_1[x] + question_1[x+1]
end
=end

  