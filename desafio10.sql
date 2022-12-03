SELECT M.nome_musica AS 'nome', COUNT(H.musicas_id) AS 'reproducoes'
FROM SpotifyClone.historico_reproducao AS H
INNER JOIN SpotifyClone.usuarios AS U
ON H.usuarios_id = U.usuarios_id AND (U.plano = 1 OR U.plano = 3)
INNER JOIN SpotifyClone.musicas AS M
ON H.musicas_id = M.musicas_id
GROUP BY M.nome_musica
ORDER BY M.nome_musica;
