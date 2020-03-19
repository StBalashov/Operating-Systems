 #!/bin/bash

# -o - возвращает совпадающую с образцом часть строки
# -w "образец" - заставляет искать строки, содержащие образец 
# -i ignore case
mail="[a-zA-Z0-9_.]+@[a-zA-Z0-9_]+(\\.[a-zA-Z]+)+"

grep -E -r -i -h -s -o -w $mail /etc | awk '{printf("%s, ",$1)}' | sed -E "s/$mail,\s$//g" > emails.lst

cat emails.lst
