type
  PNode = ^Node;   
  Node = record    
    word: integer; 
    next: PNode; 
  end;

function CreateNode(NewValue: integer): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewValue;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure AddValue ( var Head: PNode; NewNode: PNode );
begin
  NewNode^.next := Head;
  Head := NewNode;
end;

procedure FindValues(Head: PNode; min, max: integer);
var pp: PNode;
begin
  pp := Head;
  min := pp^.word;
  max := pp^.word;
  while (pp <> nil) do
    begin
    if (pp^.word < min) then
    begin
      min := pp^.word;
    end;
    if (pp^.word > max) then
    begin
      max := pp^.word;
    end;
    pp := pp^.next;
    end;
    write('Максимальное значение в списке: ', max, '. Минимальное значение в списке: ', min);
end;  

var Head: PNode;
  newN: PNode;
  NewValue, min, max: integer;
  
begin
  Head := nil;
  for var i:= 1 to 10 do
  begin
    NewValue := random(-100, 100);
    newN := CreateNode(NewValue);
    AddValue(Head, newN);
    write(NewValue, ' ');
    NewValue := 0;
  end;
  writeln('');
  FindValues(Head, min, max);
end.