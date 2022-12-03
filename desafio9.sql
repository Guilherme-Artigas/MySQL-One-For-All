SELECT COUNT(*) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.historico_reproducao AS H
INNER JOIN SpotifyClone.usuarios AS U
ON H.usuarios_id = U.usuarios_id
WHERE U.nome = 'Barbara Liskov';