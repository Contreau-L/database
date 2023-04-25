CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "users" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL
);

CREATE TABLE "user_devices" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "user" uuid NOT NULL, 
  "device" bigint NOT NULL
);

CREATE TABLE "devices" (
  "id_mac" bigint PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "insee" int
);

CREATE TABLE "logs" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "device" bigint NOT NULL,
  "water_temperature" float NOT NULL,
  "water_level" float NOT NULL,
  "occurred_at" timestamp NOT NULL,
  "added_at" timestamp NOT NULL,
  "ph" float NOT NULL
);

CREATE TABLE "humidity_levels" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "log" uuid NOT NULL,
  "garden_line" uuid NOT NULL,
  "humidity_level" float NOT NULL
);

CREATE TABLE "garden_lines" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "device" bigint NOT NULL,
  "vegetable_type" varchar(255) NOT NULL,
  "humidity_threshold" float NOT NULL,
  "line_index" int NOT NULL,
  "status" boolean NOT NULL
);

CREATE TABLE "connection_history" (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    "device" bigint NOT NULL,
    "occurred_at" timestamp NOT NULL
);

CREATE TABLE "actions" (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    "device" bigint NOT NULL,
    "garden_line" uuid NOT NULL,
    "type" varchar(255) NOT NULL,
    "status" varchar(255) NOT NULL,
    "requested_at" timestamp NOT NULL,
    "occurred_at" timestamp
);



ALTER TABLE "user_devices" ADD FOREIGN KEY ("device") REFERENCES "devices" ("id_mac");

ALTER TABLE "user_devices" ADD FOREIGN KEY ("user") REFERENCES "users" ("id");

ALTER TABLE "logs" ADD FOREIGN KEY ("device") REFERENCES "devices" ("id_mac");

ALTER TABLE "humidity_levels" ADD FOREIGN KEY ("log") REFERENCES "logs" ("id");

ALTER TABLE "garden_lines" ADD FOREIGN KEY ("device") REFERENCES "devices" ("id_mac");

ALTER TABLE "humidity_levels" ADD FOREIGN KEY ("garden_line") REFERENCES "garden_lines" ("id");

ALTER TABLE "connection_history" ADD FOREIGN KEY ("device") REFERENCES "devices" ("id_mac");

ALTER TABLE "actions" ADD FOREIGN KEY ("device") REFERENCES "devices" ("id_mac");

ALTER TABLE "actions" ADD FOREIGN KEY ("garden_line") REFERENCES "garden_lines" ("id");