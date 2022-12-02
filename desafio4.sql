SELECT U.nome AS 'usuarios', IF(YEAR(H.data_reproducao) >= '2021', 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.historico_reproducao AS H
INNER JOIN SpotifyClone.usuarios AS U
ON H.usuarios_id = U.usuarios_id
GROUP BY U.nome, H.data_reproducao;