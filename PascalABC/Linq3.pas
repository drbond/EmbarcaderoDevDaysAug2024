function IsPrime(n : integer): boolean;
begin
  var UpperBound := Trunc(Sqrt(n));
  var i := 2;
  while (i <= UpperBound) and (n mod i <> 0) 
    do i += 1;
  Result := i > UpperBound; 
end;

var n := 11;

begin
  writeln(Range(2,n).Where(IsPrime).Count);
  writeln(Milliseconds);
  writeln(Range(2,n).AsParallel.Where(IsPrime).Count);
  writeln(MillisecondsDelta);
end.

