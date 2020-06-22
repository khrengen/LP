# Отчет по лабораторной работе №1
## Работа со списками и реляционным представлением данных
## по курсу "Логическое программирование"

### студент: Хренов Г.Н.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|              |               |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*


## Введение

Список - структура данных, состоящая из узлов, которые позволяют хранить набор значений. Связный список означает, что у каждого элемента есть ссылка на следующий. В таких языках программирования как Си, С++, реализация списков требует явную работу с ссылками, в отличие от языка Prolog. В прологе список можно указывать следующим образом: [H|T], где H - голова списка, а T - хвост, тоже являющийся списком. 

## Задание 1.1: Предикат обработки списка

`insert(X,[Y|T],K,[Y|Y2])` - вставляет элемент X на K позицию списка.

Примеры использования:
```prolog
?- insert(3,[1,2,4],3,X).
X = [1, 2, 3, 4] .

?- insert(w,[a,b,c],2,X).
X = [a, w, b, c] 

Реализация:
```prolog
insert(X,T,1,[X|T]).
insert(X,[Y|T],K,[Y|Y2]) :- 
    K > 1, K1 is K - 1, insert(X,T,K1,Y2).
```

Вставка на 1 позицию означает, что наш элемент становится головой списка. Далее идёт рекурсивное определение, в котором мы уменьшаем число место вставки и сам список, отсекая голову.

## Задание 1.2: Предикат обработки числового списка

`is_geom([A, B | T])` - проверяет список на геометрическую прогрессию.
Примеры использования:
```prolog
?- is_geom([27,9,3,1]).
true 

Реализация:
```prolog
geom([A, B], Q) :-
    Q is B / A.
    geom([_, B | T], Q) :-
    geom([B|T], P),
    P = Q.

is_geom([A, B | T]) :-
    Q is B / A,
    geom([A, B|T], Q).
  ```
Определяем шаг прорессии - q = b/a. Затем проверяем, выполняется ли для каждых соседних чисел шаг равный q.

## Задание 2: Реляционное представление данных

 Один из плюсов реляционного представления - простота восприятия.Как и в моём случае - в каждом отношении небольшое количество полей, и понято, что хотел сказать автор. Также из плюсов - однозначность интерпретации данных. Из минусов - большой размер, большое количество повторяющегося кода.

Вариант 2.
1)средний бал предмета - необходимо составить список, содержащий оценки по определённыму предмету(неважно, что за ученик), затем подсчитать сумму элементов этого списка. Также нужно найти количество студентов со всех групп. Средним баллом будет являтся сумма оценок разделить на количество учеников.

2)Для каждой группы, найти количество не сдавших студентов - найдём список студентов определённой группы, затем, если фамилия студента нашей группы всплывает рядом с двойкой - добавляем его в список, длинна которого и будет ответом, однако стоит заметить, что у одного студента может быть несколько двоек, и из списка нужно убрать одинаковые элементы.

3)Найти количество не сдавших студентов для каждого из предметов - составляем список всх студентов с оценкой 2 за определённый предмет, далее считаем длинну списка.

## Выводы

В данной лабораторной я познакомился с языком Prolog. Синтаксис языка сильно отличается от других, а именно пролог отличается способом организации вычислений и представления данных, но зато все операции, совершаемые в прологе, логичны и понятны. Также пролог может работать с фактами и выражениями в отличие от других языков. Вообщем, язык prolog хорошо подходит для развивития умение мыслить логически. Что касается списков - в прологе список представлется из двух элементов: головы и хвоста. У списка нет ограчений по размеру. Вложенность списков тожу ничем не ограничивается. Список - это основная структура данных, применяемая в этом языке. Списки приминяются для многих сложных вычислений. 