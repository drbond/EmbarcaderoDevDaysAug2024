type 
  intFun = function (i: integer) : integer; 
  intArray = array of integer;
function IntArray.Map(f : intFun) : intArray;
  begin
    SetLength(Result,Self.Length);
    for var i := 0 to Self.Length-1 do
      Result[i] := f(Self[i]);
  end;

begin
  var p : intarray;
  SetLength(p, 3); 
  p := arr(1,2,3);
  p.Map(x->x*x).print;
end.