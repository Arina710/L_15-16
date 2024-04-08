
program z1;

type
  PNode = ^Node;   
  Node = record    
    word: integer; 
    next: PNode; 
    prev: PNode; 
  end;

function CreateNode(NewValue: integer): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewValue;
  NewNode^.next := nil;
  NewNode^.prev := nil;
  Result := NewNode;
end;

procedure AddValue(var Head: PNode; var Tail: PNode; NewNode: PNode);
begin
  if Head = nil then
  begin
    Head := NewNode;
    Tail := NewNode;
  end
  else
  begin
    NewNode^.next := Head;
    Head^.prev := NewNode;
    Head := NewNode;
  end;
end;

procedure Writer(Head: PNode; Tail: PNode);
var pp: PNode;
    n : integer;
    filetext_2 : text;
begin
  pp := Head;
  assign(filetext_2, 'text2.txt');
  rewrite(filetext_2);
  while pp <> nil do 
  begin
    n := pp^.word;
    writeln(filetext_2, n);
    pp := pp^.next;
  end;
  close(filetext_2);
end;

var Head, Tail: PNode;
    newN, ValueN: PNode;
    NewValue: integer;
    filetext_1, filetext_2: text;

begin
  Head := nil;
  Tail := nil;
  assign(filetext_1, 'text1.txt');
  reset(filetext_1);
  while not eof(filetext_1) do
  begin
    read(filetext_1, NewValue);
    newN := CreateNode(NewValue);
    AddValue(Head, Tail, newN);
  end;
  close(filetext_1);
  Writer(Head, Tail);
end.