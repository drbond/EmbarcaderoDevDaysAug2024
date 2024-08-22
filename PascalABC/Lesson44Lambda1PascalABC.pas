begin
  var f : integer -> integer := x -> x + 4;
  var g : integer -> integer -> integer := x -> y -> x + y;
  writeln(f(2));  
  writeln(g(2)(5));
end.