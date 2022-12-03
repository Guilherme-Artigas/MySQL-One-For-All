SELECT U.nome AS 'usuario', IF(MAX(YEAR(H.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.usuarios AS U
LEFT JOIN SpotifyClone.historico_reproducao AS H
ON U.usuarios_id = H.usuarios_id
GROUP BY U.nome
ORDER BY U.nome;