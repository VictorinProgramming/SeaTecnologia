use exemplobd;

CREATE USER 'admin'@'localhost' IDENTIFIED BY '123qwe!@#'; 
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost'; 
FLUSH PRIVILEGES;

CREATE USER 'usuario'@'localhost' IDENTIFIED BY '123qwe123';
GRANT SELECT ON exemplobd.* TO 'usuario'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    CONSTRAINT chk_nome_format CHECK (
        nome REGEXP '^[A-Za-z0-9 ]{3,100}$'
    ),
    endereco_cep CHAR(8) NOT NULL,
    endereco_logradouro VARCHAR(255) NOT NULL,
    endereco_bairro VARCHAR(100) NOT NULL,
    endereco_cidade VARCHAR(100) NOT NULL,
    endereco_uf CHAR(2) NOT NULL,
    endereco_complemento VARCHAR(255),
    CONSTRAINT chk_cpf_format CHECK (
        cpf REGEXP '^[0-9]{11}$'
    ),
    CONSTRAINT chk_cep_format CHECK (
        endereco_cep REGEXP '^[0-9]{8}$'
    )
);

CREATE TABLE telefone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    tipo ENUM('residencial', 'comercial', 'celular') NOT NULL,
    numero CHAR(11) NOT NULL,
    CONSTRAINT chk_telefone_format CHECK (
        (tipo = 'celular' AND numero REGEXP '^[0-9]{11}$') OR 
        ((tipo = 'residencial' OR tipo = 'comercial') AND numero REGEXP '^[0-9]{10}$')
    ),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE email (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    CONSTRAINT chk_email_format CHECK (
        email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);
