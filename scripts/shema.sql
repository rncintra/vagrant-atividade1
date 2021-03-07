USE mbaimpacta;

CREATE TABLE IF NOT EXISTS notas (
  id INT(4) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  aluno VARCHAR(30),
  disciplina VARCHAR(30),
  nota FLOAT,
  INDEX(id)
) engine=InnoDB;