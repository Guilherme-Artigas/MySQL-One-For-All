DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
CREATE TABLE SpotifyClone.planos(
	id_plano INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL UNIQUE,
    valor DECIMAL(3, 2) NOT NULL
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.planos(id_plano, nome, valor)
VALUES
(1, 'gratuito', 0), (2, 'universitario', 5.99), (3, 'pessoal', 6.99), (4, 'familiar', 7.99);

CREATE TABLE SpotifyClone.assinantes(
	id_usuario INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    plano INT NOT NULL,
    FOREIGN KEY (plano) REFERENCES planos (id_plano) 
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.assinantes(id_usuario, nome, idade, plano)
VALUES
(1, 'Barbara Liskov', 82, 1), (2, 'Robert Cecil Martin', 58, 1), (3, 'Ada Lovelace', 37, 4), (4, 'Martin Fowler', 46, 4),
(5, 'Sandi Metz', 58, 4), (6, 'Paulo Freire', 19, 2), (7, 'Bell Hooks', 26, 2), (8, 'Christopher Alexander', 85, 3),
(9, 'Judith Butler', 45, 3), (10, 'Jorge Amado', 58, 3);

CREATE TABLE SpotifyClone.artistas(
	id_artista INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL UNIQUE
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.artistas(id_artista, nome)
VALUES
(1, 'Beyoncé'), (2, 'Queen'), (3, 'Elis Regina'), (4, 'Baco Exu do Blues'), (5, 'Blind Guardian'), (6, 'Nina Simone');

CREATE TABLE SpotifyClone.albuns(
	id_album INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL UNIQUE
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.albuns(id_album, nome)
VALUES
(1, 'Renaissance'), (2, 'Jazz'), (3, 'Hot Space'), (4, 'Falso Brilhante'), (5, 'Vento de Maio'), (6, 'QVVJFA?'), (7, 'Somewhere Far Beyond'), (8, 'I Put A Spell On You');

CREATE TABLE SpotifyClone.musicas(
	id_musica INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL UNIQUE,
    duracao_seg INT NOT NULL,
    ano_lancamento INT NOT NULL
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.musicas(id_musica, nome, duracao_seg, ano_lancamento)
VALUES
(1, 'BREAK MY SOUL', 279, 2022), (2, 'VIRGO’S GROOVE', 369, 2022), (3, 'ALIEN SUPERSTAR', 116, 2022), (4, 'Don’t Stop Me Now', 203, 1978),
(5, '"Under Pressure"', 152, 1982), (6, 'Como Nossos Pais', 105, 1998), (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 2001),
(8, 'Samba em Paris', 207, 2003), (9, 'The Bard’s Song', 244, 2007), (10, 'Feeling Good', 100, 2012);

CREATE TABLE SpotifyClone.historico_de_reproducoes(
	h_rep_id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.assinantes (id_usuario),
    usuario VARCHAR(255) NOT NULL,
    id_musica INT NOT NULL,
    FOREIGN KEY (id_musica) REFERENCES SpotifyClone.musicas (id_musica),
    musica VARCHAR(255) NOT NULL,
    data_reproducao TIMESTAMP NOT NULL
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.historico_de_reproducoes(id_usuario, usuario, id_musica, musica, data_reproducao)
VALUES
(1, 'Barbara Liskov', 8, 'Samba em Paris', '2022-02-28 10:45:55'), (1, 'Barbara Liskov', 2, 'VIRGO’S GROOVE', '2020-05-02 05:30:35'),
(1, 'Barbara Liskov', 10, 'Feeling Good', '2020-03-06 11:22:33'), (2, 'Robert Cecil Martin', 10, 'Feeling Good', '2022-08-05 08:05:17'),
(2, 'Robert Cecil Martin', 7, 'O Medo de Amar é o Medo de Ser Livre', '2020-01-02 07:40:33'), (3, 'Ada Lovelace', 10, 'Feeling Good', '2020-11-13 16:55:13'),
(3, 'Ada Lovelace', 2, 'VIRGO’S GROOVE', '2020-12-05 18:38:30'), (4, 'Martin Fowler', 8, 'Samba em Paris', '2021-08-15 17:10:10'),
(5, 'Sandi Metz', 8, 'Samba em Paris', '2022-01-09 01:44:33'), (5, 'Sandi Metz', 5, 'Under Pressure', '2020-08-06 15:23:43'),
(6, 'Paulo Freire', 7, 'O Medo de Amar é o Medo de Ser Livre', '2017-01-24 00:31:17'), (6, 'Paulo Freire', 1, 'BREAK MY SOUL', '2017-10-12 12:35:20'),
(7, 'Bell Hooks', 4, 'Don’t Stop Me Now', '2011-12-15 22:30:49'), (8, 'Christopher Alexander', 4, 'Don’t Stop Me Now', '2012-03-17 14:56:41'),
(9, 'Judith Butler', 9, 'The Bard’s Song', '2022-02-24 21:14:22'), (10, 'Jorge Amado', 3, 'ALIEN SUPERSTAR', '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.seguidores_dos_artistas(
	tb_seg INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.assinantes (id_usuario),
    usuario_nome VARCHAR(255) NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista),
    artista_nome VARCHAR(255) NOT NULL
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.seguidores_dos_artistas(id_usuario, usuario_nome, id_artista, artista_nome)
VALUES
(1, 'Barbara Liskov', 1, 'Beyoncé'), (1, 'Barbara Liskov', 2, 'Queen'), (1, 'Barbara Liskov', 3, 'Elis Regina'), (2, 'Robert Cecil Martin', 1, 'Beyoncé'),
(2, 'Robert Cecil Martin', 3, 'Elis Regina'), (3, 'Ada Lovelace', 2, 'Queen'), (4, 'Martin Fowler', 4, 'Baco Exu do Blues'), (5, 'Sandi Metz', 5, 'Blind Guardian'),
(5, 'Sandi Metz', 6, 'Nina Simone'), (6, 'Paulo Freire', 6, 'Nina Simone'), (6, 'Paulo Freire', 1, 'Beyoncé'), (7, 'Bell Hooks', 6, 'Nina Simone'),
(9, 'Judith Butler', 3, 'Elis Regina'), (10, 'Jorge Amado', 2, 'Queen');
