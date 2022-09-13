CREATE TABLE "customer" (
	"customer_id" serial NOT NULL,
	"ticket_id" serial NOT NULL,
	"concession_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"contact_number" varchar(255) NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ticket" (
	"ticket_id" serial NOT NULL,
	"film_id" integer NOT NULL,
	CONSTRAINT "ticket_pk" PRIMARY KEY ("ticket_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "movies" (
	"movie_id" serial NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" varchar(1200) NOT NULL,
	"release_year" integer NOT NULL,
	"movie_length" integer NOT NULL,
	CONSTRAINT "movies_pk" PRIMARY KEY ("movie_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "concession" (
	"concession_id" serial NOT NULL,
	"food" varchar(255) NOT NULL,
	"description" varchar(255) NOT NULL,
	"price" float NOT NULL,
	"quantity" integer NOT NULL,
	CONSTRAINT "concession_pk" PRIMARY KEY ("concession_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "customer" ADD CONSTRAINT "customer_fk0" FOREIGN KEY ("ticket_id") REFERENCES "ticket"("ticket_id");
ALTER TABLE "customer" ADD CONSTRAINT "customer_fk1" FOREIGN KEY ("concession_id") REFERENCES "concession"("concession_id");

ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk0" FOREIGN KEY ("film_id") REFERENCES "movies"("movie_id");
