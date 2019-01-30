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
            href = urljoin(self.url, article.find("a").attrs["href"])
            title = article.text
            print(title + "\n" + href)
            respond = requests.get(href, headers = self.headers)
            page = BeautifulSoup(respond.text, "html.parser")
            headline = page.find("h1").text
            summary = page.find("dd", {"id": "abstract"}).text
            print(headline)            print(summary)
            break

fetcher = GetArticles("https://www.sciencedaily.com/", headers)
fetcher.fetch()
