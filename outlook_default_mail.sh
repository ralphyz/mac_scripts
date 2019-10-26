#!/usr/bin/env bash


#makes outlook default mail program
/usr/local/bin/duti -s com.microsoft.outlook mailto

#makes outlook default calendar program
/usr/local/bin/duti -s com.microsoft.outlook ics all

#makes outlook default contacts program
/usr/local/bin/duti -s com.microsoft.outlook vcf all
