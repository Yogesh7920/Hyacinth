#!/bin/bash

mysql -u root Hyacinth < create.sql
mysql -u root Hyacinth < datagen.sql
mysql -u root Hyacinth < view_create.sql