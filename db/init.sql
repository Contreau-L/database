CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE "Users" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL
);

CREATE TABLE "UserDevice" (
   id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "user" uuid NOT NULL, 
  "device" bigint NOT NULL
);

CREATE TABLE "Device" (
  "id_mac" bigint PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "latitude" float NOT NULL,
  "longitude" float NOT NULL
);

CREATE TABLE "Logs" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "device" bigint NOT NULL,
  "water_temperature" float NOT NULL,
  "water_level" float NOT NULL,
  "occurred_at" timestamp NOT NULL,
  "added_at" timestamp NOT NULL,
  "ph" float NOT NULL
);

CREATE TABLE "HumidityLevel" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "log" uuid NOT NULL,
  "garden_line" uuid NOT NULL,
  "humidity_level" float NOT NULL
);

CREATE TABLE "GardenLine" (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  "device" bigint NOT NULL,
  "vegetable_type" varchar(255) NOT NULL,
  "humidity_threshold" float NOT NULL,
  "line_index" int NOT NULL
);

CREATE TABLE "ConnectionHistory" (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    "device" bigint NOT NULL,
    "occurred_at" timestamp NOT NULL
);

CREATE TABLE "Action" (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    "device" bigint NOT NULL,
    "type" varchar(255) NOT NULL,
    "status" varchar(255) NOT NULL,
    "requested_at" timestamp NOT NULL,
    "occurred_at" timestamp NOT NULL,
);



ALTER TABLE "UserDevice" ADD FOREIGN KEY ("device") REFERENCES "Device" ("id_mac");

ALTER TABLE "UserDevice" ADD FOREIGN KEY ("user") REFERENCES "Users" ("id");

ALTER TABLE "Logs" ADD FOREIGN KEY ("device") REFERENCES "Device" ("id_mac");

ALTER TABLE "HumidityLevel" ADD FOREIGN KEY ("log") REFERENCES "Logs" ("id");

ALTER TABLE "GardenLine" ADD FOREIGN KEY ("device") REFERENCES "Device" ("id_mac");

ALTER TABLE "HumidityLevel" ADD FOREIGN KEY ("garden_line") REFERENCES "GardenLine" ("id");

ALTER TABLE "ConnectionHistory" ADD FOREIGN KEY ("device") REFERENCES "Device" ("id_mac");

ALTER TABLE "Action" ADD FOREIGN KEY ("device") REFERENCES "Device" ("id_mac");