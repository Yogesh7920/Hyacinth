#!/bin/bash

mysql -u root -p Hyacinth < create.sql
mysql -u root -p Hyacinth < datagen.sql
mysql -u root -p Hyacinth < view_create.sql
