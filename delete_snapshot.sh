# Arvancloud Auto Delete snapshots

# Make the main json file
curl --location --request GET 'https://napi.arvancloud.ir/ecc/v1/regions/ir-thr-c1/volumes/snapshots' --header "Authorization: apikey xxxxxxxxxxxxxxxxxxxxx" | sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' > srv.json

# Create the List of Date that snapshots created
cat srv.json | grep -o '"created_at":"[^"]*' | grep -o '[^"]*$' | cut -f1 -dT | sed 's/\-//g' > times.txt
#cat srv.json | grep -o '"id":"[^"]*' | grep -o '[^"]*$' | cut -f1 -dT > id.txt  # Uncomment this line to see Snapshot id ( id's )

time_rate=$(wc -l times.txt | sed 's/[a-z].*//g')
REGION="ir-thr-c1"
Number=0
current_date=$(date +%Y%m%d)


for ((i=1;i<=time_rate;i++)); do
        date=$(cat srv.json | grep -o '"created_at":"[^"]*' | grep -o '[^"]*$' | cut -f1 -dT | sed 's/\-//g' | awk "FNR = $i")
        SNAPSHOT_ID=$(cat srv.json | grep -o '"id":"[^"]*' | grep -o '[^"]*$' | cut -f1 -dT | awk "FNR == $i")
        SNAPSHOT_ID=$(cat srv.json | grep -o '"id":"[^"]*' | grep -o '[^"]*$' | awk "FNR == $i")
        created_date=$( echo $date | cut -d ' ' -f$i )
        past_date=$(date -d "$created_date + $Number days" +%Y%m%d)
        if [ $past_date == $current_date ]
        then
                echo "$SNAPSHOT_ID should be deleted"
                curl "https://napi.arvancloud.ir/ecc/v1/regions/$REGION/volumes/$SNAPSHOT_ID/snapshot" -X 'DELETE'   -H 'authorization: apikey xxxxxxxxxxxxxxxxxxxxx'
                #curl --location --request DELETE "https://napi.arvancloud.ir/ecc/v1/regions/$REGION/volumes/$SNAPSHOT_ID/snapshot" --header "Authorization: apikey fc50e80c-77e2-5a2e-9c7b-ece39b3fc53"
        else
                echo "$SNAPSHOT_ID should not be deleted today"
        fi
done
