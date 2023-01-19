CREATE TABLE "User" (
  "id" uuid PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL
);

CREATE TABLE "UserDevice" (
  "id" uuid PRIMARY KEY,
  "fk_user" uuid NOT NULL, 
  "fk_device" bigint NOT NULL
);

CREATE TABLE "Device" (
  "id_mac" bigint PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "latitude" float NOT NULL,
  "longitude" float NOT NULL
);

CREATE TABLE "Logs" (
  "id" uuid PRIMARY KEY,
  "fk_device" bigint NOT NULL,
  "water_temperature" float NOT NULL,
  "water_level" float NOT NULL,
  "occurred_at" timestamp NOT NULL,
  "added_at" timestamp NOT NULL,
  "ph" float NOT NULL
);

CREATE TABLE "HumidityLevel" (
  "id" uuid PRIMARY KEY,
  "fk_logs" uuid NOT NULL,
  "fk_garden_line" uuid NOT NULL,
  "humidity_level" float NOT NULL
);

CREATE TABLE "GardenLine" (
  "id" uuid PRIMARY KEY,
  "fk_device" bigint NOT NULL,
  "vegetable_type" varchar(255) NOT NULL,
  "humidity_threshold" float NOT NULL
);

ALTER TABLE "UserDevice" ADD FOREIGN KEY ("fk_device") REFERENCES "Device" ("id");

ALTER TABLE "UserDevice" ADD FOREIGN KEY ("fk_user") REFERENCES "User" ("id");

ALTER TABLE "Logs" ADD FOREIGN KEY ("fk_device") REFERENCES "Device" ("id");

ALTER TABLE "HumidityLevel" ADD FOREIGN KEY ("fk_logs") REFERENCES "Logs" ("id");

ALTER TABLE "GardenLine" ADD FOREIGN KEY ("fk_device") REFERENCES "Device" ("id");

ALTER TABLE "HumidityLevel" ADD FOREIGN KEY ("fk_garden_line") REFERENCES "GardenLine" ("id");