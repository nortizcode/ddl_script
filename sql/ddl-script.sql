USE nortiz41;
ALTER DATABASE nortiz41 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS user;

CREATE TABLE user(
   userId BINARY(16) NOT NULL,
   userActivationToken CHAR(32),
   userEmail VARCHAR(128) NOT NULL,
   userHash CHAR(97) NOT NULL,
   userUsername VARCHAR(32) NOT NULL,
   UNIQUE (userEmail),
   UNIQUE (userUsername),
   INDEX (userEmail),
   PRIMARY KEY (userId)
);

CREATE TABLE post(
   postId BINARY(16) NOT NULL,
   postDate DATETIME(6) NOT NULL,
   postContent VARCHAR(4000) NOT NULL,
   postTime TIMESTAMP (6) NOT NULL,
   postUserId BINARY (16) NOT NULL,
   INDEX (postUserId),
   FOREIGN KEY (postUserId) references user(userId),
   PRIMARY KEY (postId)
);

CREATE TABLE comment(
   commentId BINARY(16) NOT NULL,
   commentUserId BINARY(16) NOT NULL,
   commentPostId BINARY(16) NOT NULL,
   commentContent VARCHAR(400) NOT NULL,
   INDEX (commentUserId),
   INDEX (commentPostId),
   FOREIGN KEY (commentUserId) REFERENCES user(userId),
   FOREIGN KEY (commentPostId) REFERENCES post(postId),
   PRIMARY KEY (commentPostId, commentUserId)
);

