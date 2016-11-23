  /*                  GRUPO 2                         */
  
  /* 2) */
  
SELECT d.OTRO_ID FROM DESCARGA d WHERE  d.OTRO_ID IS NOT NULL; /* Saca los OTRO de DESCARGA */

SELECT o.ID, d.USO_ID, o.TIPO /* Saca las claves y los usuario from DESCARGA y OTRO cuando es Album o pelicula*/
FROM OTRO o
JOIN (SELECT OTRO_ID, USO_ID FROM DESCARGA WHERE  OTRO_ID IS NOT NULL) d 
ON d.OTRO_ID = o.ID
WHERE o.TIPO = 'Musica' OR o.TIPO = 'Pelicula'; 

SELECT d.USO_ID /* Saca los USUARIOS (sin repetir)  que han descargado peliculas o musica*/
FROM OTRO o
JOIN (SELECT OTRO_ID, USO_ID FROM DESCARGA WHERE  OTRO_ID IS NOT NULL) d 
ON d.OTRO_ID = o.ID
WHERE o.TIPO = 'Musica' OR o.TIPO = 'Pelicula'
GROUP BY d.USO_ID;


SELECT u.ID, u.NOMBRE FROM USUARIO u /* Muestra el nombre  y id de los usuarios que nunca han comprado musica o pelicula */
JOIN (
  SELECT ID FROM USUARIO
  MINUS
  SELECT d.USO_ID 
  FROM OTRO o
  JOIN (SELECT OTRO_ID, USO_ID FROM DESCARGA WHERE  OTRO_ID IS NOT NULL) d 
  ON d.OTRO_ID = o.ID
  WHERE o.TIPO = 'Musica' OR o.TIPO = 'Pelicula'
  GROUP BY d.USO_ID) r
ON u.ID = r.ID;
