function IsPrime(n : integer) : boolean;
begin
  var upperbound := Trunc(Sqrt(n));
  var i := 2;
  while (i <= upperbound) and (n mod i <> 0) 
    do i += 1;
  Result := i > upperbound; 
end;

begin
  Range(2,16).Where(IsPrime).Print;
end.

