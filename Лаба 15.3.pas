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

procedure FindValue(Head: PNode);
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) do
    if(pp^.word mod 2 = 0) then
    begin
      write(pp^.word, ' ');
      pp := pp^.next;
    end
    else
    pp := pp^.next;
end;  

var Head: PNode;
  newN: PNode;
  NewValue: integer;
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
  FindValue(Head);
end.