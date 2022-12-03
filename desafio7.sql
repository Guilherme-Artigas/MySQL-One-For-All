SELECT A_R.nome AS 'artista', A_L.nome_album AS 'album', COUNT(S_A.artistas_id) AS 'seguidores'
FROM SpotifyClone.seguindo_artistas AS S_A
INNER JOIN SpotifyClone.albuns AS A_L
ON S_A.artistas_id = A_L.artista_id
INNER JOIN SpotifyClone.artistas AS A_R
ON S_A.artistas_id = A_R.artistas_id
GROUP BY A_R.nome, A_L.nome_album
ORDER BY seguidores DESC, artista, album;