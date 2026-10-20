## Control 1 BDA
Se utiliza Docker para generar un contenedor, levantar, poblar y realizar las query sobre la base de datos.  
Hecho en postgreSQL 18.  
Primero se debe abrir la línea de comando (CMD en Windows/Bash en Linux) en la carpeta donde se encuentran los archivos .sql.  
Luego, la secuencia de comandos a ejecutar en la línea de comandos para correr los scripts son:

```
docker run --name control_1 -e POSTGRES_PASSWORD=tbd_bda_2026_2 -p 5432:5432 -d postgres:18

docker exec -it control_1 psql -U postgres -c "CREATE DATABASE estacionamientos;"

docker exec -i control_1 psql -U postgres -d estacionamientos < dbCreate.sql

docker exec -i control_1 psql -U postgres -d estacionamientos < loadData.sql

docker exec -i control_1 psql -U postgres -d estacionamientos < runStatements.sql > resultados.txt
```

OBS: Los resultados de las query se pueden ver en el documento de texto generado 'resultados.txt'.