# Project
Immobilien was a project developed for the German market for property management. Allowing users to browse property and property managers and to seek maintenance and management assistance. 

### Setup  
```bundle install```
```rails rails_admin:install```   
```rails assets:precompile```
```rails db:setup```
### DB Setup 
```
CREATE SCHEMA immobilien;
DROP USER 'immobilien'@'%' ;
CREATE USER 'immobilien'@'%' IDENTIFIED BY 'immobilien';
GRANT ALL ON immobilien.* TO 'immobilien'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'immobilien'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER DATABASE immobilien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE immobilien;
SELECT DATABASE();

```

   

### Author
Vinayak srinivas [Linkedin](https://linkedin.com/in/vinayakcs)

### License
Creative Commons Attribution (CC BY)

### Demo
[![Demo](https://img.youtube.com/vi/YB2P2I7_yIE/maxresdefault.jpg)](https://youtu.be/YB2P2I7_yIE)