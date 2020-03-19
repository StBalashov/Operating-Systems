#!/bin/bash
man bash | grep -o -i "[a-zA-Z]\{4,\}" | tr [:upper:] [:lower:] | sort | uniq -c | sort -r -n | head -3
