ALTER TABLE photos ADD FOREIGN KEY (user_username) REFERENCES users(username);