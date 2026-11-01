% ====================================================
% Lab 9: Lab Activity - The Name Game
% ====================================================

:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    nl,
    writeln('Hi This is the "Name Game"'),
    writeln('You will be given a set of English letters in which you will add, delete or move to create your name.'),
    menu.

menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    nl,
    write('Enter your choice... '),
    read(Choice),
    process(Choice).

% ----------------------------------------------------
% (Process Options)
% ----------------------------------------------------

process(1) :-
    nl,
    writeln('Current set of letters:'),
    print_all_letters,
    menu.

process(2) :-
    nl, write('Enter a letter to add: '),
    read(L),
    assert(letter(L)),
    writeln('Letter added successfully.'),
    menu.

process(3) :-
    nl, write('Enter a letter to add at the top: '),
    read(L),
    asserta(letter(L)),
    writeln('Letter added at the top successfully.'),
    menu.

process(4) :-
    nl, write('Enter a letter to add at the bottom: '),
    read(L),
    assertz(letter(L)),
    writeln('Letter added at the bottom successfully.'),
    menu.

process(5) :-
    nl, write('Enter a letter to delete: '),
    read(L),
    (   retract(letter(L))
    ->  writeln('Letter deleted successfully.')
    ;   writeln('Letter not found!')
    ),
    menu.

process(6) :- retractall(letter(_)), nl, writeln('All letters have been deleted.'), menu.

process(7) :- nl, writeln('Exiting the Name Game. Goodbye!'), nl.

process(_) :- nl, writeln('Invalid option! Please enter a number between 1 and 7.'), menu.

% ----------------------------------------------------
% fail
% ----------------------------------------------------
print_all_letters :- letter(X), write(X), write(' '), fail.
print_all_letters :- nl.

% ----------------------------------------------------
% Output.
% ----------------------------------------------------
/* 2 ?- start.

Hi This is the "Name Game"
You will be given a set of English letters in which you will add, delete or move to create your name.

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... 1.

Current set of letters:
a b c 
Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 2.

Enter a letter to add: |: e.
Letter added successfully.

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 1.
Current set of letters:
a b c e 

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 3.

Enter a letter to add at the top: |: f.
Letter added at the top successfully.

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit
Enter your choice... |: 1.

Current set of letters:
f a b c e 

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 2.

Enter a letter to add: |: a.
Letter added successfully.

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 4.

Enter a letter to add at the bottom: |: g.
Letter added at the bottom successfully.

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 1.

Current set of letters:
f a b c e a g 

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 5.

Enter a letter to delete: |: a.
Letter deleted successfully.

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 1.

Current set of letters:
f b c e a g 

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 6.

All letters have been deleted.

Choose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 1.

Current set of letters:

hoose from the following:
1- Display the current set of letters
2- Add a letter
3- Add a letter at the top
4- Add a letter at the bottom
5- Delete a letter
6- Delete all letters
7- Exit

Enter your choice... |: 7.

Exiting the Name Game. Goodbye!

true .
*/