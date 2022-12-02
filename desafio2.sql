SELECT COUNT(m.nome_musica) AS 'cancoes', COUNT(DISTINCT a.artista_id) AS 'artistas', COUNT(DISTINCT a.albuns_id) AS 'albuns'
FROM SpotifyClone.musicas AS m
LEFT JOIN SpotifyClone.albuns AS a
ON m.albuns_id = a.albuns_id;