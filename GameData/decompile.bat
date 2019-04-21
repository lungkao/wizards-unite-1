@echo off

SET "pogo_protos_path=.\WUProtos\src\"**

SET "pogo_protos_target=WUProtos.Networking.Responses.DownloadGmTemplatesResponse"**
SET "pogo_protos_template=.\WUProtos\src\WUProtos\Networking\Responses\DownloadGmTemplatesResponse.proto"**

protoc --proto_path=%pogo_protos_path% --js_out=import_style=commonjs,binary:build  %pogo_protos_template% 
REM protoc --proto_path=%pogo_protos_path% --decode %pogo_protos_target%  %pogo_protos_template%  < %1 > %1_decoded.txt

