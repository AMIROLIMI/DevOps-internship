#!/bin/bash
#просим пользователя ввести название директории
echo "Введите название директории: "
#с помощью read присваиваем то что пользователь введёт в переменную d_name
read d_name
#if - если; then - тогда; else - иначе; fi - конец условия if
#проверяем с помощью if существует ли директория (с помощью флажка -d) с названием 
#то что пользователь ввёл, если да тогда выполняем действия (then):
if [ -d "$d_name" ]; then
   #изменяем пользователя на user1 для каталога и всех его внутренных файлов
   sudo chown -R user1 "$d_name"
   #изменяем группу на lab_group для каталога и всех его внутренных файлов
   sudo chgrp -R lab_group "$d_name"
   #изменяем права доступа для каталога и всех его внутренных файлов
   #(7 (rwx) – для владельца файла: чтение, запись и выполнение; 
   #6 (rw-) – для группы: чтение и запись; 4 (r--) – для остальных: только чтение) 
   sudo chmod -R 764 "$d_name"
   #выводим сообщение о том что группа, пользователь и права доступа на каталог 
   #и всех его внутренних файлов изменены
   echo "Права на "$d_name" изменены"
#если не выполняется условие выше тогда выполняется операция ниже,
#то есть если не существует директория с названием тогда: 
else
   #выводим сообщение что не существует такая директория
   echo "Директория с названием "$d_name" не существует!"
#в линуксе начало условие начинается на if а  для того чтобы закончить его 
#надо написать fi (это удобно для того чтобы увидеть начало и конец нашего условие)
fi
   

