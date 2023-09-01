Reference Guide: https://techdocs.akamai.com/terraform/docs/set-up-edgedns

Here are the steps how I migrate my existing EdgeDNS zone "yinpok.com" into Terraform configuration

Step 1. Create a list of current zone recordsets, it will generate JSON files "yinpok_com_resources.json" and "yinpok_com_zoneconfig.json"
akamai terraform export-zone --resources yinpok.com

Step 2. Update the Terraform zone configuration file, it will generate TF files "yinpok_com.tf" and "variables.tf" files
akamai terraform export-zone --createconfig yinpok.com

Step 3. Generate a resource import script, it will generate an import script "yinpok_com_resource_import.script"
akamai terraform export-zone --importscript yinpok.com

Step 4. Import zone records into Terraform by executing the script 
./yinpok_com_resource_import.script

Step 5. After the script is executed, your Terraform configuration has sync'ed with your latest EdgeDNS zone config. You can edit your TF files to add or remove recordsets of your zone. You can use "terraform plan" to validate the zone config, and use "terraform apply" to apply the zone config to EdgeDNS.

In my demo, I create a recordset "demo.yinpok.com" in TF file, and create a TF variable demo_egress_IP. I can then update the IP of demo.yinpok.com by passing the IP to TF variable "demo_egress_IP"
