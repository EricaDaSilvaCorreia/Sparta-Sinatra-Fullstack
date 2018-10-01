DROP TABLE IF EXISTS artworks;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  dob DATE,
  nationality VARCHAR(50),
  periods VARCHAR(250)
);

CREATE TABLE artworks (
  id SERIAL PRIMARY KEY,
  img VARCHAR(300),
  title VARCHAR(100),
  year INTEGER,
  period TEXT,
  description TEXT,
  displayed TEXT,
  artist_id int REFERENCES artists(id)
);

INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Vincent', 'Van Gogh', '1853-03-30', 'Dutch', 'Realism, Post-Impressionism, Modern Art, Impressionism, Japonism, Cloisonnism, Pointilism, Neo-impressionism' );
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Georges', 'Seurat', '1859-12-02', 'French', 'Pointillism, Post-impressionism, Impressionism, Modern Art, Neo-impressionism, Neoclassicism, Divisionism');
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Alphonse', 'Mucha', '1860-07-24', 'Czech', 'Art Noveau, Symbolism, Romanticism, Modern Art, Post-impressionism, Modernism');
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Tamara', 'de Lempicka', '1898-05-16', 'Polish', 'Art Deco');
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Rene', 'Magritte', '1898-11-21', 'Belgian', 'Surrealism, Art Deco, Cubism, Post-impressionism, Modern Art, Dada');
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Marcel', 'Duchamp', '1887-07-28', 'French', 'Dada, Expressionism, Cubism, Post-impressionism, Fauvism, Surrealism, Conceptual Art, Symbolism, Cubo-Futurism, Modern Art, Section de or');
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Frida', 'Kahlo', '1907-07-06', 'Mexican', 'Naive Art, Symbolism, Surrealism, Magical Realism, Modern Art, Primitivism, Naturalism, Social Realism, Cubism');
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Salvador', 'Dali', '1904-05-11', 'Spanish', 'Surrealism, Expressionism, Post-impressionism, Impressionism, Realism, Cubism, Abstract Art, Abstract Expressionism, Symbolism, Modern Art, Pointillism, Op Art, Neoclassicism, Contemporary Art, Avant-Garde, Metaphysical Art, Dada');
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Gustav', 'Klimt', '1862-07-14', 'Austrian', 'Surrealism, Realism, Symbolism, Modern Art, Vienna Secession, Neoclassicism, Art Noveau, Romanticism');
INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('Claude', 'Monet', '1840-11-14', 'French', 'Impressionism, Realism, Modern Art');


INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://images.fineartamerica.com/images-medium-large-5/a-sunday-afternoon-on-the-island-of-la-grande-jatte-george-pierre-seurat.jpg','A Sunday Afternoon on the Island of La Grande Jatte', 1884, 'Pointillism', '207.6 cm × 308 cm (81.7 in × 121.25 in), Oil on Canvas', 'Art Institute of Chigago', 2);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://images.fineartamerica.com/images-medium-large-5/1-impression-sunrise-claude-monet.jpg','Impression Sunrise', 1872, 'Impressionism', '48 cm × 63 cm (18.9 in × 24.8 in), Oil on Canvas', 'Musee Marmottan Monet', 10);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/skull-of-a-skeleton-with-burning-cigarette-vincent-van-gogh-war-is-hell-store.jpg','Skull of a Skeleton with Burning Cigarette', 1885, 'Realism, Post-impressionism', '32 cm × 24.5 cm (13 in × 9.6 in), Oil on Canvas', 'Van Gogh Museum',1);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://i.pinimg.com/originals/9f/0a/ec/9f0aecc932ce95644a114b88fb8b78c3.jpg','Ruby (Precious Stones Series)', 1900, 'Art Noveau', '67.2 x 30 cm (26.5 in x 11.8 in), Colour lithograph on Paper (Poster Format)', 'Musée du Luxembourg', 3);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://upload.wikimedia.org/wikipedia/en/b/b9/MagrittePipe.jpg','The Treachery of Images', 1929, 'Surrealism', '63.5 cm × 93.98 cm (25 in × 37 in), Oil on Canvas', 'Los Angeles County Museum of Art',5);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://api.culture.pl/sites/default/files/styles/420_auto/public/images/imported/sztuki%20wizualne/galeria/gl%20lempicka%20tamara%20prace/galeria/lempicka%20tamara%20prace%205_6828863.jpg?itok=xGoPIIYW','Self-Portrait in a Green Bugatti)', 1929, 'Art Deco', '35 cm × 27 cm (13 (3/4) in × 10 (5/8) in), Oil on Panel', 'Private Collection, Switzerland', 4);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://images.nortonsimon.org/fcgi-bin/iipsrv.fcgi?IIIF=P1969094.ptif/full/!400,600/0/default.jpg','L.H.O.O.Q', 1919, 'Dada', '26.0 cm x 17.8 cm (10-1/4 in x 7 in), Pencil on Postcard', 'Norton Simon Museum',6);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('http://2.bp.blogspot.com/-gZ95ABV58jg/T_a2oEkvv0I/AAAAAAAAA_Y/BeKUgW4oD5I/s1600/The+Little+Deer+copy.jpg','The Wounded Deer', 1946, 'Naive Art', '22.4 cm × 30 cm (8.8 in × 12 in), Oil on Masonite', 'Private Collection, U.S.A', 7);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://az334033.vo.msecnd.net/images-9/the-persistence-of-memory-salvador-dali-1931-53c90cf1.jpg','The Persistence of Memory', 1931, 'Avant-Garde, Surrealism', '24 cm × 33 cm (9.5 in × 13 in), Oil on Canvas', 'Museum of Modern Art New York', 8);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://media.overstockart.com/optimized/cache/data/product_images/KL2143-1000x1000.jpg','The Tree of Life, Stoclet Frieze', 1909, 'Art Noveau, Symbolism', '195 cm × 102 cm (77 in × 40 in), Oil on Canvas', 'Museum of Applied Arts Vienna',9);
INSERT INTO artworks (img, title, year, period, description, displayed, artist_id) VALUES ('https://upload.wikimedia.org/wikipedia/en/archive/c/c0/20150719231100%21Duchamp_-_Nude_Descending_a_Staircase.jpg','Nude Descending a Staircase, No. 2', 1912, 'Cubism', '147 cm × 89.2 cm (​57 7⁄8 in × ​35 1⁄8 in), Oil on Canvas', 'Philadelphia Museum of Art',6);
