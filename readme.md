#текущие задачи
1. Сделать поиск по Казахстану 
- правильные titles (15 дней)
- фильтр
2. Сделать поиск по Регионам
- правильные titles (15 дней)
- фильтр
3. Сделать поиск по Городам (15 дней)
- правильные titles
- фильтр
4. Правильное отображение на мобильных устройствах
5. SSR (7 дней)

#help
https://ospanel.io/forum/viewtopic.php?t=3397
// там где модули!
https://phpdev.toolsforresearch.com/php-7.2.10-Win32-VC15-x64.zip

#Расширение и php должны иметь одинаковую версию например: 7.2.10 иначе может возникнуть бинарный конфликт

#Разделить компоненты по страничка (что-бы не всё грузилось сразу)
index.vue: button, dialog, grid разметка
login.vue: b-form, b-input, разметка
register.vue: b-form, b-input, разметка
sendemail.vue: b-form, b-input, разметка
passwordreset.vue: b-form, b-input, разметка

# Очистка sitemap.xml раз в месяц (сделать cron скрипт sitemap_clean.php)
таблица urls
id, url, advert_id
Бежим по всем полям стучимся по адресу если 404, то удаляем запись из хml и запись в urls


