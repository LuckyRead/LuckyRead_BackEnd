ALTER TABLE responses ADD FOREIGN KEY (comment_idcomment) REFERENCES comments(idcomment);
