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