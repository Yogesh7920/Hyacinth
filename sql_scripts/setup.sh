#!/bin/bash

mysql -u root -p Hyacinth < create_schema.sql
mysql -u root -p Hyacinth < create_view.sql
mysql -u root -p Hyacinth < create_data.sql
mysql -u root -p Hyacinth < create_role.sql
mysql -u root -p Hyacinth < init.sql
mysql -u root -p Hyacinth < functions.sql
mysql -u root -p Hyacinth < procedure.sql

