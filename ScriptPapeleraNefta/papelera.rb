#!/usr/bin/ruby
# encoding: utf-8
#Neftalí Rodríguez Rodríguez

puts "Iniciando Script Papelera.rb"

VALOR1=ARGV[0] || ""
VALOR2=ARGV[1] || ""
VALOR3=ARGV[2] || ""

def vaciar_papelera
puts "¿Seguro que quiere borrar todo el contenido de la papelera? Escriba s/n"
	puts "*************************************************"
	system ("rm /home/nefta/Escritorio/Papelera/* -r -I")
end

def mostrar_papelera
puts "Mostrando contenido de la papelera"
	puts "*************************************************"
	system ("ls /home/nefta/Escritorio/Papelera") 
	puts "*************************************************"
	system ("tree /home/nefta/Escritorio/Papelera")
end


if VALOR1=="--help" then
	puts "Mostrando la ayuda de Papelera.rb"
	puts "*************************************************"
	puts "Escriba --help para mostrar este dialogo de ayuda"
	puts "Escriba -file y nombre de fichero o directorio a borrar"
	puts "Escriba --help para ayuda"
	puts "Escriba -r para recuperacion de archivos o directorios"
	puts "Escriba --clean para eliminar la papelera de forma definitiva"
	puts "Escriba --help para ayuda"


elsif VALOR1=="-r" and VALOR2!="" then
	puts "Recuperando el archivo "+VALOR2+ VALOR3
	puts "*************************************************"
	comando=("mv /home/nefta/Escritorio/Papelera/" +VALOR2+ " "+VALOR3)
	puts comando
	system(comando)

elsif VALOR1=="--info" then
	mostrar_papelera


elsif VALOR1=="--clean" then
	vaciar_papelera

elsif VALOR1=="-i" then
	puts "MENU"
	puts "*************"
	puts "Escriba -borrar para borrar todo el contenido de la Papelera"
	puts "*************************************************"
	puts "Escriba -ver para mostrar el contenido de la Papelera"
	puts "*************************************************"

   s=$stdin.gets.chomp

  if (s=="-borrar") then
	vaciar_papelera
  elsif (s=="-ver") then
	mostrar_papelera
  else
	puts "No estas ejecutando bien el Script"
  end	
   
   elsif VALOR1=="-file" and VALOR2!="" then
	
	if File.exist?('/home/nefta/Escritorio/Papelera') then
	puts "Enviando archivo a la Papelera "+VALOR2
	borrar=("mv " +VALOR2+ " /home/nefta/Escritorio/Papelera/")
	puts borrar
	system(borrar)
	
	elsif
	
	system('mkdir /home/nefta/Escritorio/Papelera')
	puts "Creando Papelera"
	puts "Enviando archivo a la Papelera "+VALOR2
	borrar=("mv " +VALOR2+ " /home/nefta/Escritorio/Papelera/")
	puts borrar
	system(borrar)
	end	

else 
	puts "Introduce uno de los siguientes comandos"
	puts "****************************************"
	puts "papelera [ --help | -r file [ destino ] | --info | -i | --clean | -file ]"
	
end

