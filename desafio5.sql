SELECT M.nome_musica AS 'cancao', COUNT(H.musicas_id) AS 'reproducoes'
FROM SpotifyClone.musicas AS M
LEFT JOIN SpotifyClone.historico_reproducao AS H
ON M.musicas_id = H.musicas_id
GROUP BY M.nome_musica, H.musicas_id
ORDER BY reproducoes DESC
LIMIT 2;