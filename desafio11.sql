SELECT
nome_musica,
CASE
  WHEN nome_musica LIKE '%Bard%' THEN REPLACE('The Bard’s Song', 'Bard', 'QA')
  WHEN nome_musica LIKE '%Amar%' THEN REPLACE('O Medo de Amar é o Medo de Ser Livre', 'Amar', 'Code Review')
  WHEN nome_musica LIKE '%Pais' THEN REPLACE('Como Nossos Pais', 'Pais', 'Pull Requests')
  WHEN nome_musica LIKE '%SOUL' THEN REPLACE('BREAK MY SOUL', 'SOUL', 'CODE')
  WHEN nome_musica LIKE '%SUPERSTAR' THEN REPLACE('ALIEN SUPERSTAR', 'SUPERSTAR', 'SUPERDEV')
  ELSE ' '
END AS 'novo_nome'
FROM SpotifyClone.musicas
ORDER BY novo_nome DESC
LIMIT 5;
