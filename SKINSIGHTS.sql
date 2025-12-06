DROP DATABASE Skinsight;
CREATE DATABASE IF NOT EXISTS Skinsight;
USE Skinsight;

-- 1. Ingredients Table
DROP TABLE IF EXISTS ingredients;
CREATE TABLE ingredients (
    ingredient_id INT PRIMARY KEY,
    ingredient_name VARCHAR(255) NOT NULL
);

INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES
(1,'Fragrance'),(2,'Salicylic Acid'),(3,'Benzoyl Peroxide'),(4,'Alcohol Denat'),
(5,'Sodium Lauryl Sulfate'),(6,'Sodium Laureth Sulfate'),(7,'Aluminum'),(8,'Glycolic Acid'),
(9,'Tea Tree Oil'),(10,'Retinoids (high %)'),(11,'Hyaluronic Acid'),(12,'Ceramides'),
(13,'Antioxidants'),(14,'Glycerin'),(15,'Niacinamide'),(16,'Shea Butter'),
(17,'Alpha-hydroxy Acid'),(18,'Petrolatum'),(19,'Squalane'),(20,'Cetyl Alcohol'),
(21,'Stearyl Alcohol'),(22,'Retinol'),(23,'Clay'),(24,'Zinc PCA'),(25,'Kaolin Clay'),
(26,'Bentonite Clay'),(27,'Isopropyl Myristate'),(28,'Coconut Oil'),(29,'Myristyl Myristate'),
(30,'Lanolin'),(31,'Silicones (heavy use)'),(32,'Essential Oils'),(33,'Vitamin C'),
(34,'Peptides'),(35,'Panthenol'),(36,'Green Tea Extract'),(37,'Cocoa Butter'),(38,'Azelaic Acid'),
(39,'Lactic Acid'),(40,'PHA (Gluconolactone)'),(41,'Limonene'),(42,'Linalool'),(43,'Eugenol'),
(44,'SD Alcohol 40'),(45,'Isopropyl Alcohol'),(46,'Denatonium Benzoate'),(47,'Citric Acid'),
(48,'Cholesterol'),(49,'Zinc Oxide'),(50,'Centella Asiatica'),(51,'Isopropyl Palmitate'),
(52,'Wheat Germ Oil'),(53,'Dimethicone'),(54,'Cyclopentasiloxane'),(55,'Talc'),
(56,'Algae Extract'),(57,'Laureth-4'),(58,'Retinol (low %)'),(59,'Adapalene'),(60,'Aloe Vera'),
(61,'Geraniol'),(62,'Citronellol'),(63,'Ethanol'),(64,'Witch Hazel'),(65,'Menthol'),
(66,'Methylisothiazolinone'),(67,'Methylchloroisothiazolinone'),(68,'Cocamidopropyl Betaine'),
(69,'Propylene Glycol'),(70,'Urea (high %)'),(71,'Colloidal Oatmeal'),(72,'Allantoin'),
(73,'Sodium Cocoyl Isethionate'),(74,'Decyl Glucoside'),(75,'Peppermint Oil'),(76,'Camphor'),
(77,'Niacin'),(78,'Licorice Root Extract'),(79,'Phenoxyethanol'),(80,'Sodium Benzoate'),
(81,'Mineral Oil'),(82,'Methylparaben'),(83,'Propylparaben'),(84,'Ethylhexylglycerin');

-- 2. Safety Table
DROP TABLE IF EXISTS safety;
CREATE TABLE safety (
    skin_type ENUM('Dry','Oily','Combination','Normal','Sensitive','Acne-prone','Eczema-prone','Rosacea-prone') NOT NULL,
    ingredient_id INT NOT NULL,
    safety ENUM('safe','not safe') NOT NULL,
    PRIMARY KEY (skin_type, ingredient_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO safety (skin_type, ingredient_id, safety) VALUES
('Dry',1,'not safe'),('Dry',2,'not safe'),('Dry',3,'not safe'),('Dry',4,'not safe'),('Dry',5,'not safe'),
('Dry',6,'not safe'),('Dry',7,'not safe'),('Dry',8,'not safe'),('Dry',9,'not safe'),('Dry',10,'not safe'),
('Dry',11,'safe'),('Dry',12,'safe'),('Dry',13,'safe'),('Dry',14,'safe'),('Dry',15,'safe'),
('Dry',16,'safe'),('Dry',17,'safe'),('Dry',18,'safe'),('Dry',19,'safe'),('Dry',20,'safe'),
('Dry',21,'safe'),
('Oily',15,'safe'),('Oily',2,'safe'),('Oily',22,'safe'),('Oily',23,'safe'),('Oily',24,'safe'),
('Oily',25,'safe'),('Oily',26,'safe'),('Oily',27,'not safe'),('Oily',28,'not safe'),('Oily',4,'not safe'),
('Oily',1,'not safe'),('Oily',29,'not safe'),('Oily',16,'not safe'),('Oily',30,'not safe'),('Oily',31,'not safe'),
('Normal',1,'not safe'),('Normal',32,'not safe'),('Normal',4,'not safe'),('Normal',5,'not safe'),('Normal',6,'not safe'),
('Normal',3,'not safe'),('Normal',15,'safe'),('Normal',11,'safe'),('Normal',12,'safe'),('Normal',14,'safe'),
('Normal',33,'safe'),('Normal',34,'safe'),('Normal',19,'safe'),('Normal',35,'safe'),('Normal',36,'safe'),
('Combination',28,'not safe'),('Combination',27,'not safe'),('Combination',29,'not safe'),('Combination',1,'not safe'),
('Combination',4,'not safe'),('Combination',5,'not safe'),('Combination',6,'not safe'),('Combination',37,'not safe'),
('Combination',14,'safe'),('Combination',15,'safe'),('Combination',11,'safe'),('Combination',12,'safe'),
('Combination',38,'safe'),('Combination',36,'safe'),('Combination',35,'safe'),('Combination',39,'safe'),
('Combination',19,'safe'),('Combination',40,'safe'),
('Sensitive',1,'not safe'),('Sensitive',32,'not safe'),('Sensitive',41,'not safe'),('Sensitive',42,'not safe'),
('Sensitive',43,'not safe'),('Sensitive',4,'not safe'),('Sensitive',44,'not safe'),('Sensitive',45,'not safe'),
('Sensitive',5,'not safe'),('Sensitive',6,'not safe'),('Sensitive',3,'not safe'),('Sensitive',2,'not safe'),
('Sensitive',22,'not safe'),('Sensitive',46,'not safe'),('Sensitive',47,'not safe'),('Sensitive',9,'not safe'),
('Sensitive',12,'safe'),('Sensitive',11,'safe'),('Sensitive',14,'safe'),('Sensitive',35,'safe'),('Sensitive',19,'safe'),
('Sensitive',48,'safe'),('Sensitive',40,'safe'),('Sensitive',49,'safe'),('Sensitive',50,'safe'),
('Acne-prone',28,'not safe'),('Acne-prone',27,'not safe'),('Acne-prone',51,'not safe'),('Acne-prone',29,'not safe'),
('Acne-prone',30,'not safe'),('Acne-prone',37,'not safe'),('Acne-prone',52,'not safe'),('Acne-prone',4,'not safe'),
('Acne-prone',44,'not safe'),('Acne-prone',5,'not safe'),('Acne-prone',6,'not safe'),('Acne-prone',53,'not safe'),
('Acne-prone',54,'not safe'),('Acne-prone',55,'not safe'),('Acne-prone',56,'not safe'),('Acne-prone',57,'not safe'),
('Acne-prone',2,'safe'),('Acne-prone',3,'safe'),('Acne-prone',58,'safe'),('Acne-prone',59,'safe'),('Acne-prone',24,'safe'),
('Acne-prone',15,'safe'),('Acne-prone',11,'safe'),('Acne-prone',14,'safe'),('Acne-prone',19,'safe'),('Acne-prone',35,'safe'),
('Acne-prone',36,'safe'),('Acne-prone',50,'safe'),('Acne-prone',60,'safe'),('Acne-prone',38,'safe'),('Acne-prone',49,'safe'),
('Eczema-prone',1,'not safe'),('Eczema-prone',41,'not safe'),('Eczema-prone',42,'not safe'),('Eczema-prone',61,'not safe'),
('Eczema-prone',62,'not safe'),('Eczema-prone',32,'not safe'),('Eczema-prone',4,'not safe'),('Eczema-prone',63,'not safe'),
('Eczema-prone',44,'not safe'),('Eczema-prone',45,'not safe'),('Eczema-prone',64,'not safe'),('Eczema-prone',65,'not safe'),
('Eczema-prone',66,'not safe'),('Eczema-prone',67,'not safe'),('Eczema-prone',47,'not safe'),('Eczema-prone',68,'not safe'),
('Eczema-prone',69,'not safe'),('Eczema-prone',70,'not safe'),('Eczema-prone',12,'safe'),('Eczema-prone',11,'safe'),
('Eczema-prone',14,'safe'),('Eczema-prone',18,'safe'),('Eczema-prone',19,'safe'),('Eczema-prone',48,'safe'),
('Eczema-prone',15,'safe'),('Eczema-prone',71,'safe'),('Eczema-prone',35,'safe'),('Eczema-prone',72,'safe'),
('Eczema-prone',50,'safe'),('Eczema-prone',60,'safe'),('Eczema-prone',36,'safe'),('Eczema-prone',73,'safe'),
('Eczema-prone',74,'safe'),
('Rosacea-prone',1,'not safe'),('Rosacea-prone',41,'not safe'),('Rosacea-prone',42,'not safe'),('Rosacea-prone',62,'not safe'),
('Rosacea-prone',5,'not safe'),('Rosacea-prone',6,'not safe'),('Rosacea-prone',64,'not safe'),('Rosacea-prone',65,'not safe'),
('Rosacea-prone',75,'not safe'),('Rosacea-prone',76,'not safe'),('Rosacea-prone',77,'not safe'),('Rosacea-prone',8,'not safe'),
('Rosacea-prone',12,'safe'),('Rosacea-prone',11,'safe'),('Rosacea-prone',14,'safe'),('Rosacea-prone',19,'safe'),
('Rosacea-prone',48,'safe'),('Rosacea-prone',35,'safe'),('Rosacea-prone',50,'safe'),('Rosacea-prone',72,'safe'),
('Rosacea-prone',36,'safe'),('Rosacea-prone',78,'safe'),('Rosacea-prone',74,'safe'),('Rosacea-prone',73,'safe'),
('Dry',79,'safe'),('Oily',79,'safe'),('Combination',79,'safe'),('Acne-prone',79,'safe'),
('Sensitive',79,'not safe'),('Eczema-prone',79,'not safe'),('Rosacea-prone',79,'not safe'),
('Dry',80,'safe'),('Oily',80,'safe'),('Combination',80,'safe'),('Acne-prone',80,'safe'),
('Sensitive',80,'not safe'),('Eczema-prone',80,'not safe'),('Rosacea-prone',80,'not safe'),
('Dry',81,'safe'),('Normal',81,'safe'),('Combination',81,'not safe'),('Oily',81,'not safe'),
('Acne-prone',81,'not safe'),('Sensitive',81,'safe'),('Eczema-prone',81,'safe'),('Rosacea-prone',81,'safe'),
('Sensitive',82,'not safe'),('Sensitive',83,'not safe'),('Oily',84,'safe');

-- 3. Products Table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_name VARCHAR(255) NOT NULL,
    product_type VARCHAR(100)
);

INSERT INTO products (product_id, product_name, brand_name, product_type) VALUES
(1,'CeraVe Hydrating Facial Cleanser','CeraVe','Cleanser'),
(2,'CeraVe SA Cleanser','CeraVe','Cleanser'),
(3,'CeraVe Foaming Facial Cleanser','CeraVe','Cleanser'),
(4,'CeraVe Moisturizing Cream','CeraVe','Moisturizer'),
(5,'Cetaphil Daily Face Wash','Cetaphil','Cleanser'),
(6,'Cetaphil Gentle Skin Cleanser','Cetaphil','Cleanser'),
(7,'Cetaphil DermaControl Oil Removing Foam Wash','Cetaphil','Cleanser'),
(8,'Cetaphil Daily Hydrating Lotion','Cetaphil','Moisturizer'),
(9,'La Roche-Posay Toleriane Hydrating Cleanser','La Roche-Posay','Cleanser'),
(10,'La Roche-Posay Double Repair Moisturizer with SPF','La Roche-Posay','Moisturizer'),
(11,'Neutrogena Hydro Boost Gel Cleanser','Neutrogena','Cleanser'),
(12,'Aquaphor Healing Ointment','Aquaphor','Serum'),
(13,'Anua Heartleaf Quercetinol Pore Deep Cleansing Foam','Anua','Cleanser'),
(14,'Anua Heartleaf Pore Control Cleansing Oil','Anua','Cleanser'),
(15,'Vanicream Daily Facial Moisturizer','Vanicream','Moisturizer'),
(16,'The Ordinary Niacinamide 10% + Zinc 1%','The Ordinary','Serum'),
(17,'The Ordinary Glycolic Acid 7% Exfoliating Toner','The Ordinary','Toner'),
(18,'PanOxyl Acne Foaming Wash','PanOxyl','Cleanser'),
(19,'TruSkin Vitamin C Serum','TruSkin','Serum'),
(20,'CeraVe Hydrating Toner','CeraVe','Toner'),
(21,'Neutrogena Clear Face Sunscreen SPF 50','Neutrogena','Sunscreen'),
(22,'The Ordinary Retinol 0.2% in Squalane','The Ordinary','Serum'),
(23,'Dr. Althea 345 Relief Cream','Dr.Althea','Moisturizer'),
(24,'Numbuzin No.5 Glutathione Vitamin Concentrated Serum','Numbuzin','Serum'),
(25,'Byoma Moisturising Gel Cream','BYOMA','Moisturizer');

-- 4. Product Ingredients Table
CREATE TABLE product_ingredients (
    product_id INT NOT NULL,
    ingredient_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (product_id, ingredient_name),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO product_ingredients (product_id, ingredient_name) VALUES
-- Product 1
(1,'Water'),(1,'Glycerin'),(1,'Cetearyl Alcohol'),(1,'PEG-40 Stearate'),(1,'Stearyl Alcohol'),
(1,'Potassium Phosphate'),(1,'Ceramide NP'),(1,'Ceramide AP'),(1,'Ceramide EOP'),(1,'Carbomer'),
(1,'Glyceryl Stearate'),(1,'Behentrimonium Methosulfate'),(1,'Sodium Lauroyl Lactylate'),(1,'Sodium Hyaluronate'),
(1,'Cholesterol'),(1,'Phenoxyethanol'),(1,'Disodium EDTA'),(1,'Dipotassium Phosphate'),(1,'Tocopherol'),
(1,'Phytosphingosine'),(1,'Xanthan Gum'),(1,'Cetyl Alcohol'),(1,'Polysorbate 20'),(1,'Ethylhexylglycerin'),

-- Product 2
(2,'Water'),(2,'Cocamidopropyl Hydroxysultaine'),(2,'Glycerin'),(2,'Sodium Lauroyl Sarcosinate'),
(2,'Niacinamide'),(2,'Gluconolactone'),(2,'PEG-150 Pentaerythrityl Tetrastearate'),
(2,'Sodium Methyl Cocoyl Taurate'),(2,'Zea Mays (Corn) Oil'),(2,'Ceramide NP'),
(2,'Ceramide AP'),(2,'Ceramide EOP'),(2,'Carbomer'),(2,'Calcium Gluconate'),
(2,'Sodium Chloride'),(2,'Salicylic Acid'),(2,'Sodium Benzoate'),(2,'Sodium Lauroyl Lactylate'),
(2,'Cholecalciferol'),(2,'Cholesterol'),(2,'Phenoxyethanol'),(2,'Disodium EDTA'),
(2,'Tetrasodium EDTA'),(2,'Hydrolyzed Hyaluronic Acid'),(2,'Phytosphingosine'),(2,'Xanthan Gum'),
(2,'Ethylhexylglycerin'),

-- Product 3
(3,'Water'),(3,'Cocamidopropyl Hydroxysultaine'),(3,'Glycerin'),(3,'Sodium Lauroyl Sarcosinate'),
(3,'PEG-150 Pentaerythrityl Tetrastearate'),(3,'Niacinamide'),(3,'PEG-6 Caprylic/Capric Glycerides'),
(3,'Sodium Methyl Cocoyl Taurate'),(3,'Propylene Glycol'),(3,'Ceramide NP'),(3,'Ceramide AP'),
(3,'Ceramide EOP'),(3,'Carbomer'),(3,'Methylparaben'),(3,'Sodium Chloride'),(3,'Sodium Lauroyl Lactylate'),
(3,'Cholesterol'),(3,'Disodium EDTA'),(3,'Propylparaben'),(3,'Citric Acid'),(3,'Tetrasodium EDTA'),
(3,'Hydrolyzed Hyaluronic Acid'),(3,'Phytosphingosine'),(3,'Xanthan Gum'),

-- Product 4
(4,'Water'),(4,'Glycerin'),(4,'Cetearyl Alcohol'),(4,'Caprylic/Capric Triglyceride'),(4,'Cetyl Alcohol'),
(4,'Ceteareth-20'),(4,'Petrolatum'),(4,'Potassium Phosphate'),(4,'Ceramide NP'),(4,'Ceramide AP'),
(4,'Ceramide EOP'),(4,'Carbomer'),(4,'Dimethicone'),(4,'Behentrimonium Methosulfate'),(4,'Sodium Lauroyl Lactylate'),
(4,'Sodium Hyaluronate'),(4,'Cholesterol'),(4,'Phenoxyethanol'),(4,'Disodium EDTA'),(4,'Dipotassium Phosphate'),
(4,'Tocopherol'),(4,'Phytosphingosine'),(4,'Xanthan Gum'),(4,'Ethylhexylglycerin'),

-- Product 5
(5,'Water'),(5,'Glycerin'),(5,'Cocamidopropyl Betaine'),(5,'Disodium Laureth Sulfosuccinate'),
(5,'Sodium Cocoyl Isethionate'),(5,'Panthenol'),(5,'Niacinamide'),(5,'Acrylates/C10-30 Alkyl Acrylate Crosspolymer'),
(5,'Sodium Benzoate'),(5,'Fragrance'),(5,'Sodium Chloride'),(5,'Citric Acid'),

-- Product 6
(6,'Water'),(6,'Glycerin'),(6,'Cetearyl Alcohol'),(6,'Panthenol'),(6,'Niacinamide'),(6,'Pantolactone'),
(6,'Xanthan Gum'),(6,'Sodium Cocoyl Isethionate'),(6,'Sodium Benzoate'),(6,'Citric Acid'),

-- Product 7
(7,'Water'),(7,'Zinc Coco-Sulfate'),(7,'Glycerin'),(7,'PEG-75'),(7,'Dipotassium Glycyrrhizate'),
(7,'PEG-40 Hydrogenated Castor Oil'),(7,'Fragrance'),(7,'Zinc Gluconate'),(7,'PEG-200 Hydrogenated Glyceryl Palmate'),
(7,'PEG-7 Glyceryl Cocoate'),(7,'Sodium Benzoate'),(7,'Disodium EDTA'),

-- Product 8
(8,'Water'),(8,'Dicaprylyl Carbonate'),(8,'Hydroxyethyl Urea'),(8,'Cyclopentasiloxane'),(8,'Glycerin'),
(8,'Glyceryl Stearate'),(8,'PEG-100 Stearate'),(8,'Hydrolyzed Hyaluronic Acid'),(8,'Sodium Hydroxide'),
(8,'Homoarine HCl'),(8,'Sodium PCA'),(8,'Cetyl Alcohol'),(8,'Caprylyl Glycol'),(8,'Phenoxyethanol'),
(8,'Acrylates/C10-30 Alkyl Acrylate Crosspolymer'),(8,'Erythritol'),

-- Product 9
(9,'Water'),(9,'Glycerin'),(9,'Pentaerythrityl Tetraethylhexanoate'),(9,'Propanediol'),
(9,'Ammonium Polyacryloyldimethyl Taurate'),(9,'Polysorbate 60'),(9,'Ceramide NP'),(9,'Niacinamide'),
(9,'Sodium Chloride'),(9,'Coco-Betaine'),(9,'Disodium EDTA'),(9,'Caprylyl Glycol'),(9,'Citric Acid'),
(9,'Trisodium Ethylenediamine Disuccinate'),(9,'Panthenol'),(9,'Pentylene Glycol'),(9,'Ethylhexylglycerin'),
(9,'Tocopherol'),(9,'Chlorphenesin'),

-- Product 10
(10,'Avobenzone'),(10,'Homosalate'),(10,'Octisalate'),(10,'Octocrylene'),(10,'Water'),(10,'Glycerin'),
(10,'Silica'),(10,'Dimethicone'),(10,'Niacinamide'),(10,'PEG-100 Stearate'),(10,'Glyceryl Stearate'),
(10,'Stearic Acid'),(10,'Stearyl Alcohol'),(10,'Allantoin'),(10,'Ceramide NP'),(10,'Dimethicone/Vinyl Dimethicone Crosspolymer'),
(10,'Sodium Hydroxide'),(10,'Myristic Acid'),(10,'Myristyl Alcohol'),(10,'Palmitic Acid'),(10,'Ammonium Polyacryloyldimethyl Taurate'),
(10,'Disodium EDTA'),(10,'Capryloyl Glycine'),(10,'Caprylyl Glycol'),(10,'Citric Acid'),(10,'Xanthan Gum'),
(10,'t-Butyl Alcohol'),(10,'Cetyl Alcohol'),(10,'Tocopherol'),

-- Product 11
(11,'Water'),(11,'Glycerin'),(11,'Cocamidopropyl Hydroxysultaine'),(11,'Sodium Cocoyl Isethionate'),
(11,'Sodium Methyl Cocoyl Taurate'),(11,'Sodium Chloride'),(11,'Sodium Hydrolyzed Potato Starch Dodecenylsuccinate'),
(11,'Potassium Acrylates Copolymer'),(11,'Hydroxyacetophenone'),(11,'Phenoxyethanol'),(11,'Linoleamidopropyl PG-Dimonium Chloride Phosphate'),
(11,'Polyquaternium-10'),(11,'Sodium Hydroxide'),(11,'Disodium EDTA'),(11,'Citric Acid'),(11,'Ethylhexylglycerin'),
(11,'Hydrolyzed Hyaluronic Acid'),

-- Product 12
(12,'Petrolatum 41%'),(12,'Mineral Oil'),(12,'Ceresin'),(12,'Lanolin Alcohol'),(12,'Panthenol'),(12,'Glycerin'),(12,'Bisabolol'),

-- Product 13
(13,'Houttuynia Cordata Flower/Leaf/Stem Water'),(13,'Glycerin'),(13,'Sodium Cocoyl Glycinate'),(13,'Water'),
(13,'Sodium Lauroyl Glutamate'),(13,'Disodium Cocoamphodiacetate'),(13,'Coco-Glucoside'),(13,'Decyl Glucoside'),
(13,'Hectorite'),(13,'Sodium Chloride'),(13,'1,2-Hexanediol'),(13,'Betaine Salicylate'),(13,'Potassium Benzoate'),
(13,'Houttuynia Cordata Powder'),(13,'Polyquaternium-67'),(13,'Acrylates/C10-30 Alkyl Acrylate Crosspolymer'),
(13,'Butylene Glycol'),(13,'Gardenia Florida Fruit Extract'),(13,'Dextrin'),(13,'Disodium EDTA'),
(13,'Eucalyptus Globulus Leaf Oil'),(13,'Ethylhexylglycerin'),(13,'Sodium Acetate'),(13,'Isopropyl Alcohol'),
(13,'Pinus Densiflora Leaf Extract'),(13,'Ulmus Davidiana Root Extract'),(13,'Oenothera Biennis Flower Extract'),
(13,'Pueraria Lobata Root Extract'),(13,'Pentylene Glycol'),(13,'Capryloyl Salicylic Acid'),(13,'Tocopherol'),

-- Product 14
(14,'Ethylhexyl Palmitate'),(14,'Sorbet-30 Tetraoleate'),(14,'Sorbitan Sesquioleate'),(14,'Caprylic/Capric Triglyceride'),
(14,'Butyl Avocadate'),(14,'Fragrance'),(14,'Helianthus Annuus Seed Oil'),(14,'Macadamia Ternifolia Seed Oil'),
(14,'Olea Europaea Fruit Oil'),(14,'Simmondsia Chinensis Seed Oil'),(14,'Vitis Vinifera Seed Oil'),
(14,'Caprylyl Glycol'),(14,'Ethylhexylglycerin'),(14,'Curcuma Longa Root Extract'),(14,'Melia Azadirachta Flower Extract'),
(14,'Tocopherol'),(14,'Melia Azadirachta Leaf Extract'),(14,'Houttuynia Cordata Extract'),(14,'Corallina Officinalis Extract'),
(14,'Melia Azadirachta Bark Extract'),(14,'Moringa Oleifera Seed Oil'),(14,'Ocimum Sanctum Leaf Extract'),

-- Product 15
(15,'Aqua'),(15,'Squalane'),(15,'Glycerin'),(15,'Pentylene Glycol'),(15,'Polyglyceryl-2 Stearate'),
(15,'Glyceryl Stearate'),(15,'Stearyl Alcohol'),(15,'Hyaluronic Acid'),(15,'Ceramide EOP'),(15,'Ceramide NG'),
(15,'Ceramide NP'),(15,'Ceramide AS'),(15,'Ceramide AP'),(15,'Carnosine'),(15,'Hydrogenated Lecithin'),
(15,'Phytosterols'),(15,'Caprylyl Glycol'),(15,'Polyacrylate Crosspolymer-11'),(15,'1,2-Hexanediol'),

-- Product 16
(16,'Aqua'),(16,'Niacinamide'),(16,'Pentylene Glycol'),(16,'Zinc PCA'),(16,'Dimethyl Isosorbide'),
(16,'Tamarindus Indica Seed Gum'),(16,'Xanthan Gum'),(16,'Isoceteth-20'),(16,'Ethoxydiglycol'),
(16,'Phenoxyethanol'),(16,'Chlorphenesin'),

-- Product 17
(17,'Water'),(17,'Glycolic Acid'),(17,'Rosa Damascena Flower Water'),(17,'Centaurea Cyanus Flower Water'),
(17,'Aloe Barbadensis Leaf Water'),(17,'Propanediol'),(17,'Glycerin'),(17,'Triethanolamine'),(17,'Aminomethyl Propanol'),
(17,'Panax Ginseng Root Extract'),(17,'Tasmannia Lanceolata Fruit Extract'),(17,'Aspartic Acid'),(17,'Alanine'),
(17,'Glycine'),(17,'Serine'),(17,'Valine'),(17,'Isoleucine'),(17,'Proline'),(17,'Threonine'),(17,'Histidine'),
(17,'Phenylalanine'),(17,'Glutamic Acid'),(17,'Arginine'),(17,'PCA'),(17,'Sodium PCA'),(17,'Sodium Lactate'),
(17,'Fructose'),(17,'Glucose'),(17,'Sucrose'),(17,'Urea'),(17,'Hexyl Nicotinate'),(17,'Dextrin'),
(17,'Citric Acid'),(17,'Polysorbate 20'),(17,'Gellan Gum'),(17,'Trisodium Ethylenediamine Disuccinate'),
(17,'Sodium Chloride'),(17,'Hexylene Glycol'),(17,'Potassium Sorbate'),(17,'Sodium Benzoate'),
(17,'1,2-Hexanediol'),(17,'Caprylyl Glycol'),

-- Product 18
(18,'Benzoyl Peroxide 10%'),(18,'Carbomer Homopolymer Type C'),(18,'Carbomer Interpolymer Type A'),
(18,'Decyl Glucoside'),(18,'Dimethicone'),(18,'Dioctyl Sodium Sulfosuccinate'),(18,'Glycerin'),
(18,'Palmitic Acid'),(18,'Polyacrylate Crosspolymer-6'),(18,'Polyoxyl 40 Stearate'),(18,'Propanediol'),
(18,'Water'),(18,'Silica'),(18,'Sodium Chloride'),(18,'Sodium Citrate'),(18,'Sodium Hydroxide'),
(18,'Sodium Laurylglucosides Hydroxypropylsulfonate'),(18,'Sorbitan Stearate'),(18,'Stearic Acid'),
(18,'t-Butyl Alcohol'),(18,'Xanthan Gum'),

-- Product 19
(19,'Water'),(19,'Aloe'),(19,'Gotu Kola'),(19,'Horsetail'),(19,'Dandelion'),(19,'Geranium'),
(19,'Aloe Barbadensis Leaf'),(19,'Sodium Ascorbyl Phosphate'),(19,'MSM'),(19,'Hyaluronic Acid'),
(19,'Witch Hazel'),(19,'Vitamin E'),(19,'Glycerin'),(19,'Carbomer'),(19,'Arginine'),(19,'Jojoba Oil'),
(19,'Phenoxyethanol'),(19,'Ethylhexylglycerin'),

-- Product 20
(20,'Aqua'),(20,'Water'),(20,'Propanediol'),(20,'Glycerin'),(20,'Butylene Glycol'),(20,'PPG-6-Decyltetradeceth-30'),
(20,'PEG-240/HDI Copolymer Bis-Decyltetradeceth-20 Ether'),(20,'PEG/PPG/Polybutylene Glycol-8/5/3 Glycerin'),
(20,'Ceramide NP'),(20,'Ceramide AP'),(20,'Potassium Laurate'),(20,'Ceramide EOP'),(20,'Carbomer'),
(20,'Niacinamide'),(20,'Sodium Hydroxide'),(20,'Sodium Citrate'),(20,'Sodium Hyaluronate'),
(20,'Sodium Lauroyl Lactylate'),(20,'Cholesterol'),(20,'Phenoxyethanol'),(20,'Chlorphenesin'),
(20,'Tocopherol'),(20,'Phytosphingosine'),(20,'Xanthan Gum'),(20,'Ethylhexylglycerin'),

-- Product 21
(21,'Avobenzone (3%)'),(21,'Homosalate (10%)'),(21,'Octisalate (5%)'),(21,'Octocrylene (10%)'),(21,'Water'),
(21,'Silica'),(21,'Cetyl Dimethicone'),(21,'Styrene/Acrylates Copolymer'),(21,'C12-15 Alkyl Benzoate'),
(21,'Steareth-100'),(21,'Ethylhexylglycerin'),(21,'Aluminum Starch Octenylsuccinate'),(21,'Phenoxyethanol'),
(21,'Caprylyl Glycol'),(21,'Sodium Polyacrylate'),(21,'Dimethicone'),(21,'Steareth-2'),(21,'Polyester-7'),
(21,'Chlorphenesin'),(21,'Ethylhexyl Stearate'),(21,'Isostearyl Neopentanoate'),(21,'Propylene Glycol'),
(21,'Disodium EDTA'),(21,'Sodium Hydroxide'),

-- Product 22
(22,'Water'),(22,'Glycerin'),(22,'Butylene Glycol'),(22,'Niacinamide'),(22,'Sodium Hyaluronate'),
(22,'Hydroxyethyl Urea'),(22,'PEG-60 Hydrogenated Castor Oil'),(22,'1,2-Hexanediol'),(22,'Caprylyl Glycol'),

-- Product 23
(23,'Water'),(23,'Glycerin'),(23,'Cetearyl Alcohol'),(23,'Dimethicone'),(23,'Stearyl Alcohol'),
(23,'Cetyl Alcohol'),(23,'PEG-100 Stearate'),(23,'Glyceryl Stearate'),(23,'Sodium Chloride'),(23,'Phenoxyethanol'),
(23,'Disodium EDTA'),(23,'Xanthan Gum'),(23,'Ethylhexylglycerin'),

-- Product 24
(24,'Water'),(24,'Glycerin'),(24,'Niacinamide'),(24,'Butylene Glycol'),(24,'Pentylene Glycol'),
(24,'Sodium Hyaluronate'),(24,'Hydroxyethyl Urea'),(24,'Caprylyl Glycol'),(24,'1,2-Hexanediol'),
(24,'Ethylhexylglycerin'),(24,'Phenoxyethanol'),(24,'Xanthan Gum'),

-- Product 25
(25,'Water'),(25,'Glycerin'),(25,'Cetearyl Alcohol'),(25,'Cetyl Alcohol'),(25,'Stearyl Alcohol'),
(25,'Dimethicone'),(25,'Carbomer'),(25,'Sodium Hydroxide'),(25,'Disodium EDTA'),(25,'Phenoxyethanol'),
(25,'Ethylhexylglycerin'),(25,'Xanthan Gum');

-- 5. User Products Join Table
DROP TABLE IF EXISTS user_products_join;
CREATE TABLE user_products_join (
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (user_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO user_products_join (user_id, product_id) VALUES
(1,23),(2,2),(2,16),(3,3),(4,8),(6,4),(6,9),(6,19),(7,5),(7,8),(7,22),(8,11),(8,12),(8,21),
(9,1),(10,15),(10,2),(11,1),(12,9),(13,1),(13,4),(13,20),(14,18),(16,3),(17,23),(17,24),
(20,4),(20,14),(22,13),(23,10),(24,1),(24,25),(25,4),(25,17),(27,10),(28,6);


-- 6. Brands Table
CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL UNIQUE,
    expense_level ENUM('Low','Medium','High') NOT NULL
);

INSERT INTO brands (brand_id, brand_name, expense_level) VALUES
(1,'Anua','Low'),
(2,'Aquaphor','Medium'),
(3,'CeraVe','Low'),
(4,'Cetaphil','Low'),
(5,'La Roche-Posay','Medium'),
(6,'Neutrogena','Low'),
(7,'PanOxyl','Medium'),
(8,'The Ordinary','Low'),
(9,'Truskin','Low'),
(10,'Vanicream','Low'),
(11,'Dr. Althea','Medium'),
(12,'Numbuzin','Medium'),
(13,'BYOMA','Low');


-- 7. User Responses Table
CREATE TABLE user_responses (
    user_id INT PRIMARY KEY,
    skin_type ENUM('Dry','Oily','Combination','Normal') NOT NULL,
    is_sensitive TINYINT(1) NOT NULL,
    acne_prone TINYINT(1) NOT NULL,
    eczema_prone TINYINT(1) NOT NULL,
    rosacea TINYINT(1) NOT NULL,
    reaction VARCHAR(255),
    previous_allergies VARCHAR(255)
);

INSERT INTO user_responses (user_id, skin_type, is_sensitive, acne_prone, eczema_prone, rosacea, reaction, previous_allergies) VALUES
(1,'Dry',0,0,0,0,NULL,'Tumeric'),(2,'Combination',0,0,0,0,NULL,NULL),(3,'Oily',1,0,0,0,'Breakouts',NULL),
(4,'Combination',1,0,0,0,NULL,NULL),(5,'Dry',0,0,0,0,NULL,NULL),(6,'Combination',0,0,0,0,NULL,NULL),
(7,'Combination',0,0,0,0,NULL,NULL),(8,'Combination',0,0,0,0,NULL,NULL),(9,'Oily',1,1,0,1,'Redness',NULL),
(10,'Dry',1,1,0,0,NULL,NULL),(11,'Combination',1,1,0,0,'Dryness',NULL),(12,'Dry',1,0,0,0,NULL,'Lanolin'),
(13,'Combination',0,0,0,0,NULL,NULL),(14,'Oily',0,0,0,0,NULL,NULL),(15,'Combination',0,0,0,0,NULL,NULL),
(16,'Combination',1,0,1,0,NULL,'Almond Oil'),(17,'Oily',0,1,0,0,NULL,NULL),(18,'Normal',0,1,0,0,NULL,NULL),
(19,'Normal',0,0,0,0,NULL,NULL),(20,'Dry',0,0,0,0,NULL,NULL),(21,'Dry',1,0,0,0,NULL,NULL),
(22,'Combination',1,1,0,0,'Breakouts',NULL),(23,'Oily',0,0,0,0,NULL,NULL),(24,'Combination',0,0,0,0,NULL,NULL),
(25,'Dry',1,1,1,0,NULL,NULL),(26,'Normal',0,0,0,0,NULL,NULL),(27,'Dry',1,1,0,0,'redness',NULL),
(28,'Normal',0,0,0,0,NULL,'Vitamin C'),(29,'Combination',0,1,0,0,NULL,'Cetaphil products');


-- 8. User Brands Join Table
CREATE TABLE user_brands_join (
    user_id INT NOT NULL,
    brand_id INT NOT NULL,
    PRIMARY KEY (user_id, brand_id),
    FOREIGN KEY (user_id) REFERENCES user_responses(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO user_brands_join (user_id, brand_id) VALUES
(1,11),(2,3),(2,8),(3,3),(4,3),(5,8),(5,6),(6,3),(6,5),(6,9),(7,8),(7,4),
(8,7),(8,2),(9,3),(10,10),(10,3),(11,3),(12,5),(13,3),(14,7),(16,3),(17,11),
(17,12),(20,3),(20,1),(21,4),(21,6),(22,8),(22,1),(23,4),(23,5),(23,3),(24,3),
(24,8),(24,13),(25,3),(25,8),(27,5),(28,4);


-- 9. Location Table
CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO location (location_id, location_name) VALUES
(1,'Sephora'),(2,'Target'),(3,'Walmart'),(4,'Ulta'),(5,'Amazon'),
(6,'CVS'),(7,'Dermatologist'),(8,'Taos'),(9,'Moida'),(10,'The Ordinary'),(11,'Supermarket');


-- 10. Location Products Join Table
CREATE TABLE location_products_join (
    product_id INT NOT NULL,
    location_id INT NOT NULL,
    PRIMARY KEY (product_id, location_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (location_id) REFERENCES location(location_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO location_products_join (product_id, location_id) VALUES
(1,5),(1,6),(2,1),(2,2),(3,6),(4,3),(5,3),(6,1),(6,6),(6,5),(7,6),(7,11),(8,3),(9,2),
(9,5),(10,6),(10,11),(11,2),(11,4),(12,2),(12,4),(13,9),(13,10),(14,5),(15,2),(16,1),
(16,2),(17,1),(17,4),(18,1),(18,2),(19,3),(20,2),(20,4),(21,2),(22,3),(23,1),(23,8),
(24,8),(25,3),(25,4);


-- Queries
-- Query 1
-- For users with dry skin, what is the most common brand used?
SELECT b.brand_name, count(ub.brand_id) AS "brand_count"
FROM user_responses u join user_brands_join ub
USING(user_id)
JOIN brands b
USING(brand_id)
WHERE u.skin_type = "Dry"
GROUP BY brand_id
ORDER BY brand_count DESC
LIMIT 3;

-- Query 2
-- Who is one of the users that uses the most products? 
-- List their products, product types, the brand, and the expense level for that brand
SELECT up.user_id, p.product_name, p.product_type, p.brand_name, b.expense_level 
FROM products p
JOIN user_products_join up
USING (product_id)
JOIN brands b
USING (brand_name)
JOIN (    
	SELECT user_id, count(product_id) AS "num_products" 
	FROM user_products_join 
	GROUP BY user_id
	ORDER BY num_products DESC
	LIMIT 1) top
ON up.user_id = top.user_id;

-- Query 3
-- List all the ingredients that are associated with oily skin, include the safe and unsafe ingredients.
SELECT i.ingredient_name, s.safety 
FROM ingredients i 
JOIN safety s
USING(ingredient_id)
WHERE skin_type = "Oily";

-- Query 4
-- Which products are safe for both dry and oily skin types?
SELECT p.product_id,
       p.product_name
FROM products AS p
JOIN product_ingredients AS pi
    ON pi.product_id = p.product_id
JOIN ingredients AS i
    ON i.ingredient_name = pi.ingredient_name
JOIN safety AS s
    ON s.ingredient_id = i.ingredient_id
GROUP BY p.product_id, p.product_name
HAVING SUM(s.safety = 'not safe') = 0;

-- Query 5
-- For acne-prone users, how many were using products containing unsafe ingredients for their skin type?
SELECT COUNT(DISTINCT u.user_id) AS num_acne_users_using_unsafe_products
FROM user_responses AS u
JOIN user_products_join AS up
    ON up.user_id = u.user_id
JOIN product_ingredients AS pi
    ON pi.product_id = up.product_id
JOIN ingredients AS i
    ON i.ingredient_name = pi.ingredient_name
JOIN safety AS s
    ON s.ingredient_id = i.ingredient_id
WHERE u.acne_prone = 1
  AND s.safety = 'not safe'
  AND s.skin_type = u.skin_type;

-- Query 6
-- Which brands use the highest number of unsafe ingredients?
SELECT p.brand_name,
       COUNT(DISTINCT i.ingredient_id) AS num_unsafe_ingredients
FROM products AS p
JOIN product_ingredients AS pi
    ON pi.product_id = p.product_id
JOIN ingredients AS i
    ON i.ingredient_name = pi.ingredient_name
JOIN safety AS s
    ON s.ingredient_id = i.ingredient_id
WHERE s.safety = 'not safe'
GROUP BY p.brand_name
ORDER BY num_unsafe_ingredients DESC
LIMIT 5;

-- Query 7
-- Which brands are the ‘cleanest’?
SELECT p.brand_name,
    COUNT(DISTINCT i.ingredient_id) AS num_unsafe_ingredients
FROM products AS p
JOIN product_ingredients AS pi
    ON pi.product_id = p.product_id
JOIN ingredients AS i
    ON i.ingredient_name = pi.ingredient_name
JOIN safety AS s
    ON s.ingredient_id = i.ingredient_id
WHERE s.safety = 'not safe'
GROUP BY p.brand_name
ORDER BY num_unsafe_ingredients ASC
LIMIT 5;

-- Query 8
-- Which store location sells the most high-risk products? 
SELECT loc.location_name,
    COUNT(DISTINCT lp.product_id) AS num_high_risk_products
FROM location AS loc
JOIN location_products_join AS lp
    ON lp.location_id = loc.location_id
JOIN product_ingredients AS pi
    ON pi.product_id = lp.product_id
JOIN ingredients AS ing
    ON ing.ingredient_name = pi.ingredient_name
JOIN safety AS safe
    ON safe.ingredient_id = ing.ingredient_id
WHERE safe.safety = 'not safe'
GROUP BY loc.location_id, loc.location_name
ORDER BY num_high_risk_products DESC
LIMIT 3;

-- Query 9
-- What are the top five ingredients that are unsafe for the greatest number of skin types? 
SELECT ing.ingredient_name,
    COUNT(*) AS num_skin_types_unsafe_for
FROM safety AS safe
JOIN ingredients AS ing
    ON ing.ingredient_id = safe.ingredient_id
WHERE safe.safety = 'not safe'
GROUP BY ing.ingredient_id, ing.ingredient_name
ORDER BY num_skin_types_unsafe_for DESC
LIMIT 5; 
