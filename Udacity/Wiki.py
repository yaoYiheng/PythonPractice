import requests

response = requests.get('https://news.agentm.tw/71504/%E9%BB%91%E8%A2%8D%E7%B3%BE%E5%AF%9F%E9%9A%8A-the-boys-%E7%AC%AC%E4%B8%80%E5%AD%A3-%E6%BC%AB%E7%95%AB-%E5%BD%B1%E9%9B%86-8-%E5%B7%AE%E7%95%B0/')
print(response.text)
print(type(response.text))
