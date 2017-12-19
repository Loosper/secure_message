# We just studied Rspec and i do this
# I feel like getting a 2 is an understatement
# >:)

# curl -H "Content-Type: application/json" -X POST -d '{"message":"test"}' http://localhost:3000
id=$(curl -s -X POST http://  "localhost:3000/rsas?n=899&e=11&d=611")
# id=3559
test=hello
keys=$(curl -s "http://localhost:3000/rsas/${id}")
enc_id=$(curl -s -X POST "http://localhost:3000/rsas/${id}/encrypt_messages?message=$test")
cypher=$(curl -s "http://localhost:3000/rsas/${id}/encrypt_messages/${enc_id}")
dec_id=$(curl -s -G -X POST "http://localhost:3000/rsas/${id}/decrypt_messages"  --data-urlencode "message=${cypher}")
msg=$(curl -s "http://localhost:3000/rsas/${id}/decrypt_messages/${dec_id}")

echo "key id: ${id}, keys: ${keys}"
echo $test
echo $cypher
echo $msg
