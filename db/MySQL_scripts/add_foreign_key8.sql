ALTER TABLE comments ADD FOREIGN KEY (user_iduser) REFERENCES users(username);
