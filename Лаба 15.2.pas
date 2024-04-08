type
  PNode = ^Node; // указатель на узел   
  Node = record    //структура узла 
    word: string[40]; // слово 
    count: integer;   // счетчик повторов слов 
    next: PNode; // ссылка на следующий 
  end;

var Head: PNode;
  newN, p: PNode;
  NewWord: string;
  filetext: text;
  c, count: integer;
  
function CreateNode(NewWord: string): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure AddAfter ( var Head: PNode; NewNode: PNode );
var p, temp: PNode;
begin
  p := Head;
  temp := p^.next;
  p^.next := NewNode;
  NewNode^.next := temp;
end;

function Find(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord <> pp^.word) do 
    pp := pp^.next;
  Result := pp;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

procedure AddWord(var Head: PNode; p, NewNode: PNode);
var pp, flag: PNode;
begin
  flag:= Find(Head, NewWord);
  if flag = nil then 
  begin
    count += 1;
    p := FindPlace(Head, NewWord);
    pp := Head;
    if p = Head then
    begin
      NewNode^.next := Head;
      Head := NewNode;
    end 
    else begin
      while (pp <> nil)  and  (pp^.next <> p) do
        pp := pp^.next;
      if pp <> nil then AddAfter ( pp, NewNode ); 
    end;    
  end;
end;

procedure printer(Head: PNode);
  var
    pp: PNode;
  begin
    pp:=Head;
    while pp <> nil do
    begin
      writeln(pp^.word);
      pp := pp^.next;
    end;
  end;
  
begin
  Head :=nil;
  assign(filetext, 'C:\Users\PC\Desktop\file.txt');
  reset(filetext);
  while not eof(filetext) do
  begin
   Readln(filetext, NewWord);
   newN := CreateNode(NewWord); 
   AddWord(Head, p, newN);
   c += 1;
  end;
  writeln('Количество всего слов в тексте = ', c);
  writeln('Количество уникальных слов в тексте = ', count);
  printer(Head);
end.