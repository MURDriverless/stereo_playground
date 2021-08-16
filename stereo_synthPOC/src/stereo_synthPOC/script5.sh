#!/bin/bash

# Takes the file directory to the file location 

rm nohup.out & for ((i=2; i < 5; i++)); do nohup bash script${i}.sh & done
