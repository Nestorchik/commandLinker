**Инструмент создания символических ссылок из командной строки**

> Tool for creating symbolic links from the command line

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

Запуск: **linker c:\SecondProgram\Library\VeryBigFile.DAT d:\FirstProgram\Library\VeryBigFile.DAT**

- ожидает на входе два папаметра командной строки "путь/файл куда" и "путь/файл откуда", если параметров нет, закрывается.
- создает символьную ссылку - файл "сюда" <- на файл "отcюда"

>  _ Start:_ **linker c:\SecondProgram\Library\VeryBigFile.DAT d:\FirstProgram\Library\VeryBigFile.DAT**
>- waits for two command-line parameters "path/file to" and "path/file from", if there are no parameters, it closes.
>- create symbolic link file "here" <- "from here".

Удачи! )
Good luck!)
@srigert
https://t.me/stable_cascade_rus
