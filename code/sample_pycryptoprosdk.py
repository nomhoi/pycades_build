import json
from pycryptoprosdk import CryptoProSDK


sdk = CryptoProSDK()

# Создание и проверка отсоединенной подписи:
content = 'test content'
cert = sdk.get_cert_by_subject('MY', 'test')
signature = sdk.sign(content, cert.thumbprint, 'MY', detached=True)

result = sdk.verify_detached(content, signature)

if result.verification_status == 0:
    print('Verified successfully')
else:
    print('Error:', result.verification_status)

print("Certificate:")
print(json.dumps(result.cert.as_dict(), indent=4, default=str))
