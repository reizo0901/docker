#モジュールopensllを確認し無ければインストールする。
if ! dnf list installed | grep openssl &> /dev/null; then
	echo OPENSSLをインストールします。
	dnf -y install openssl
fi       

#モジュールmod_sslを確認し無ければインストールする。
if ! dnf list installed | grep mod_ssl &> /dev/null; then
	echo MOD_SSLをインストールします。
	dnf -y install mod_ssl
fi

# 秘密鍵 (Private Key)、証明書署名要求 (CSR)、サーバ証明書(CRT) の作成
openssl genrsa 2048 > server.key
#echo 秘密鍵作成！

openssl req -new -key server.key << EOF > server.csr
JP
Tokyo
Shinjuku
JPiT

192.168.2.125



EOF
echo 証明書署名要求完了！
openssl x509 -days 36500 -req -signkey server.key < server.csr > server.crt
#echo サーバ証明書作成
