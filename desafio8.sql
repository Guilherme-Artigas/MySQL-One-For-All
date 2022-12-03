SELECT A_R.nome AS 'artista', A_L.nome_album AS 'album'
FROM SpotifyClone.artistas AS A_R
INNER JOIN SpotifyClone.albuns AS A_L
ON A_R.artistas_id = A_L.artista_id
WHERE A_R.nome = 'Elis Regina'
ORDER BY album;