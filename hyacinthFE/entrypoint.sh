#!/bin/bash

# ng serve --host 0.0.0.0 --disableHostCheck --poll 500

cp -r /cache/node_modules/. /code/node_modules
exec npm start
