#!/bin/bash
mkdir nuevojava
mkdir nuevojava/bin
mkdir nuevojava/src
mkdir nuevojava/lib
touch nuevojava/src/App.java
printf "
public class App{
	public static void main(String[] args){
		System.out.println(\"Hola mundo!\");
	}
}">>nuevojava/src/App.java

# PARA INTRODUCIRLO POR ARGUMENTO
#!/bin/bash
mkdir $1
mkdir $1/bin
mkdir $1/src
mkdir $1/lib
printf "
public class App{
	public static void main(String[] args){
		System.out.println(\"Hola mundo!\");
	}
}">>$1/src/App.java
