#!/usr/bin/perl

# PERL MODULES
use Mysql;

# MYSQL CONFIG VARIABLES
$host = "localhost:3306";
$database = "f4computer";
$tablename = "ordensdeservicos";
$user = "ailton";
$pw = "41L70N@@";

# PERL CONNECT()
$connect = Mysql->connect($host, $database, $user, $pw);

# LISTDBS()
@databases = $connect->listdbs;
foreach $database (@databases) {
	print "$database<br />";
}