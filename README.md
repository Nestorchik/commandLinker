**Инструмент создания символических ссылок из командной строки**

**Работает с кириллицей и пробелами в путях!**

_(Писался "на коленке" как отладочный модуль другого проекта, пригодится начинающим в качестве примера работы с символьными ссылками. В ZIP-е exe-шник запакован, можете скачать exe-шником.)_

> Tool for creating symbolic links from the command line
> Adapted to the Cyrillic alphabet and spaces in paths and file names!
> _(It was written "on the knee" as a debugging module of another project, it will be useful for beginners as an example of working with symbolic links.)_

---

Для широкго применения в системе Windows!

> For use on a Windows system!

---

Распаковать архив новую папку, запустить "linker.exe"

> Unzip the archive to a new folder, run "linker.exe "

---

При запуске создает папки "logs" и "bat", в которые складывает логи работы. Так же создает файл "temp.bat"который создается для запуска процесса создания ссылок. Папки "bat", "logs" и файл "temp.bat" могут быть удалены, т.к. после создания ссылок из них больше не используются и остаются пользователю "На вечную, добрую память!" )

> At startup, it creates the "logs" and "bat" folders, into which it puts the work logs. It also creates the file "temp.bat" which is created to start the link creation process. The folders "bat", "logs" and the file "temp.bat" can be deleted, because after creating links, they are no longer used and remain to the user "For eternal, good memory!")

---

Запуск:  **linker  "c:\SecondProgram\Library\VeryBigFile.DAT"   "d:\FirstProgram\Library\VeryBigFile.DAT"**

- ожидает на входе два параметра командной строки "путь/файл куда" и "путь/файл откуда", если параметров нет, закрывается.
- создает символьную ссылку - файл "сюда" <- на файл "отcюда"

>  Start:  **linker  "c:\SecondProgram\Library\VeryBigFile.DAT"  "d:\FirstProgram\Library\VeryBigFile.DAT"**
>- waits for two command-line parameters "path/file to" and "path/file from", if there are no parameters, it closes.
>- create symbolic link file "here" <- "from here".

---

Если второй параметр аргументов командной строки является папкой, то автоматически создает ссылку на папку, иначе создает ссылку на файл.
>If the second parameter of the command line arguments is a folder, it automatically creates a link to the folder, otherwise it creates a link to the file.

---

При наличии кириллицы и пробелов в путях и именах файлов заключайте каждый параметр командной строки в двойные кавычки!

_**linker "c:\Первая папка\первый файл.txt" "d:\Вторая папка\второй файл.txt"**_

>If there are Cyrillic characters and spaces in the paths and file names, enclose each command line parameter in double quotes!

>_**linker "с:\Первая папка\первый файл.txt" "d:\Вторая папка\второй файл.txt"**_

---

Адаптировано под _**866**_ кодовую страницу. Если вам нужна другая кодировка, измените кодировку в функции _**"WinToDos"**_ и скомпилируйте свою версию.

>Adapted to the _**866**_ code page. If you need a different encoding, change the encoding in the **"WinToDos"** function and compile your version.

---

Удачи! )
Good luck!)
@srigert
https://t.me/stable_cascade_rus
