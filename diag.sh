#!/usr/bin/bash
# wrapper for curl calling Diagnostics on OSA Identity endpoint
# usage: diag.sh
# Make sure getImplementationVersion.xml is in the working directory. Normally the response will be gzipped. If you see 
# 	gzip: stdin: not in gzip format
# drop gunzip - that will be likely a fault

#Local IP OSA 1.13 (prod)
#ENDPOINT=http://10.46.180.124:80/sid/spore/osa113/mithrandir_identity_wcf
#Public IP OSA 1.15 (dev)
ENDPOINT=http://89.189.218.15/spore_Dev/osa115/mithrandir_identity_wcf
#Local IP OSA 1.15 (dev)
#ENDPOINT=http://10.46.189.10/spore_Dev/osa115/mithrandir_identity_wcf
SERVICE=Diagnostics.svc

echo Checking $ENDPOINT/$SERVICE
curl --header "SOAPAction: http://services.wolterskluwer.com/common/Diagnostics/getImplementationVersion" \
	--header "Accept-Encoding: gzip,deflate" \
	--header "Content-Type: text/xml;charset=UTF-8" \
	--data @getImplementationVersion.xml $ENDPOINT/$SERVICE | gunzip
