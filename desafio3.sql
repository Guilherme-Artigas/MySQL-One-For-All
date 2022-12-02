SELECT DISTINCT u.nome AS 'usuario', COUNT(h.usuarios_id) AS 'qt_de_musicas_ouvidas', ROUND(SUM(m.duracao_seg) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.historico_reproducao AS h
INNER JOIN SpotifyClone.usuarios AS u ON h.usuarios_id = u.usuarios_id
INNER JOIN SpotifyClone.musicas AS m ON h.musicas_id = m.musicas_id
GROUP BY h.usuarios_id ORDER BY u.nome;