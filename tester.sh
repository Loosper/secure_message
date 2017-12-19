# We just studied Rspec and i do this
# I feel like getting a 2 is an understatement
# >:)

url=http://localhost:3000
# url=https://not-secure.herokuapp.com

# id=$(curl -s -X POST "${url}/rsas?n=899&e=11&d=611")
id=$(curl -s -X POST "${url}/rsas")
# id=3559
test=hello
keys=$(curl -s "${url}/rsas/${id}")
enc_id=$(curl -s -X POST "${url}/rsas/${id}/encrypt_messages?message=$test")
cypher=$(curl -s "${url}/rsas/${id}/encrypt_messages/${enc_id}")
dec_id=$(curl -s -G -X POST "${url}/rsas/${id}/decrypt_messages"  --data-urlencode "message=${cypher}")
msg=$(curl -s "${url}/rsas/${id}/decrypt_messages/${dec_id}")

echo "key id: ${id}, keys: ${keys}"
echo $test
echo $cypher
echo $msg
