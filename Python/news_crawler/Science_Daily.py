import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
from urllib.request import urlopen, Request
import time

headers = {"User-Agent": "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.3"}
reg_url = "https://www.sciencedaily.com/"
req = Request(url=reg_url, headers=headers)

url = "https://www.sciencedaily.com/"
r = requests.get(url, headers = headers)
doc = BeautifulSoup(r.text, "html.parser")


class GetArticles():
    def __init__(self, url, headers):
        self.url = url
        self.headers = headers
    def fetch(self):
        print(self.url)
        articles = []
        r = requests.get(self.url, headers = self.headers)
        doc = BeautifulSoup(r.text, "html.parser")
        for article in doc.select(".col-xs-6.col-md-3"):
            title = article.text
            print(article.attrs["href"])
            break

fetcher = GetArticles("https://www.sciencedaily.com/", headers)
fetcher.fetch()


exit()
for article in doc.select(".col-xs-6.col-md-3"):
    print(article)
    break
    if article in doc.select(".tab-content"):
        continue
    print(article)
    content = article.select_one(".latest-summary").text
    header = article.select_one(".latest-head")
    print(content)


exit()


def fetch(url):
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.3"}
    reg_url = url
    req = Request(url=reg_url, headers=headers)

    print(req)
    time.sleep(1)
    r = requests.get(req)
    doc = BeautifulSoup(r.text, "html.parser")
    print(doc)
    article = doc.select(".col-xs-6.col-md-3")
    print(article)

fetch("https://www.sciencedaily.com/")