import pycades

content = 'Hello World'

with open('signature.txt.sgn', 'r') as f:
    signature = f.read()

print("--Signature--")
print(signature)
print("----")

_signedData = pycades.SignedData()
_signedData.Content = content
_signedData.VerifyCades(signature, pycades.CADESCOM_CADES_BES, True)

print("Verified successfully")
