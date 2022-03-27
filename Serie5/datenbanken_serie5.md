
Databases
 ̈Exercise sheet 5 Submission of L ̈osungen: 31. M ̈arz 2022
Task 1
The nat ̈ural join (natural join) is in general neither commutative (i.e., R ./ S = S ./ R
does not hold) nor associative (i.e. (R ./ S) ./ T = R ./ (S ./ T ) does not hold).
Prove that.
Hints:
W ̈choose appropriate schemes.
Remember that tuples are ordered.
A counterexample (an example f ̈ur the opposite of the assertion) is sufficient as a rebuttal
(i.e., as a proof that the general statement is false), but in contrast, an
Example f ̈ur a true assertion is not sufficient evidence.
Task 2
Calculate the following expressions on the relations given by the tables! Give
the result relations again as a table.
X
A B
a d
b d
b e
c f
Y
B C
d 3
e 1
- 2
Z
A B C
a d 2
b e 1
c a 7
b - 2
d b 3
b d 1
b d 3
W
A B C D
a d 3 d
b d - d
c f 2 f
b e 3 d
b e 2 f
c f 3 d
b d 2 f
a d 2 f
a) Z ÷ Y
b) W ÷ X
c) W ÷ Y
d) Y ./ X
Task 3
On the server faulus there is f ̈ur you an (empty) Postgres database. The name of the data
database is composed as follows:
fs22 username playground
This database will be used throughout this course f ̈ur your experiments and in this ̈exercise as a
basis f ̈ur your first experiments.
For example, f ̈ur username "t.kohler4" is called the database "fs22 t.kohler4 playground".
Connect to this database using your username and password!
The username is visible on Ilias. The password is "12345678".  ̈Change this
immediately (see below)!
1. my input to connect to the database:
$ psql -h faulus.inf.unibe.ch -U t.kohler4 -W fs22_t.kohler4_playground
2. this is followed by the request to enter my password:
Databases
 ̈Exam sheet 5 Submission of L ̈osungen: 31. M ̈arz 2022
Password for user t.kohler4:
After entering the password (12345678), the computer connects to my database:
psql (9.6.2, server 9.6.11)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384,
bits: 256, compression: off)
Type "help" for help.
fs22_t.kohler4_playground=>
3. now you can enter SQL commands.  ̈First change the user name with
ALTER USER Username WITH PASSWORD 'newPassword';
your password!
4. with
\d
K ̈you can display all existing tables. (Use this command,
after you have created your test table).
You may get a warning if you do not have a reasonably recent version of psql.
If the warning comes, either update your version of psql or live with it,
that some psql features do not work. (As far as we can tell, there should not be any
problems as long as you have a reasonably recent version of psql.)
Write the name of the database (tok ̈unftig one database per group is enough, for this
series, however, all databases must be specified) on which you are working, as a solution to this
Task on your submission!
Task:
Log in to your database and enter the following command:
=> CREATE TABLE test ( TestID INTEGER);
Hints:
1) A connection with faulus is only possible from the Universit ̈atsnetz m ̈oglich! So configure
your VPN correctly or work in the computer pool or ̈via the WLAN at the university.
2) You need a suitable sql client.
For Windows there are two possibilities:
You install psql ̈via Cygwin or
You use the graphical client "pgAdmin4". In this variant the work with its
with its SQL-Console is recommended. (To be found under Tools/Query Tool).
Under Gnu/Linux, BSD or other Unixoids the Postgresql client can be found mostly
already in the package management (Ex: Debian/Ubuntu: apt-get install postgresql-client, Gentoo:
emerge dev-db/postgresql-base, Suse: yast2 -install postgresql-client, ...).
On Ilias you can find the file Manual SQL Skripte.pdf, which describes the client in more detail.
installation and usage of the client.
Databases
 ̈Exercise sheet 5 Submission of the L ̈osungen: 31. M ̈arz 2022
3) In the client, you can use \i <filename> to load a source file, which is then processed.
will be processed. Note to specify the path to the file relative to the Ausf ̈uhrungsverzeichnis.
4) Username and password do NOT match the campus login ̈uberein and have
NOTHING else to do with Computer Science Services! Please spare their helpdesk
with your questions and send them to us via forum or e-mail instead!


Translated with www.DeepL.com/Translator (free version)
