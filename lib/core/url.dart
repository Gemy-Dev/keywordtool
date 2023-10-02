const String googleSuggestionUrl = 'suggestqueries.google.com';
//const String google = 'https://www.google.com/complete/search';
const String amazonUrl = 'completion.amazon.com';
//const String url = 'http://suggestqueries.google.com/complete/search?client=';
const String bingUrl = "www.bing.com";
const String yahooUrl = "search.yahoo.com";
const String ebayUrl = "autosug.ebay.com";
//https://autosug.ebay.co.uk/autosug?_dg=1&sId=0v=$v&kwd=$q
// func requestKeyWords(keyChannel chan Keyword, keyword Keyword) {
// 	client := http.Client{}

// 	req, _ := http.NewRequest("GET", "https://completion.amazon.com/api/2017/suggestions", nil)

// 	req.Header.Set("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_"+strconv.Itoa(rand.Intn(15-9)+9)+"_1) AppleWebKit/531.36 (KHTML, like Gecko) Chrome/"+strconv.Itoa(rand.Intn(79-70)+70)+".0.3945.130 Safari/531.36")

// 	q := req.URL.Query()
// 	q.Add("mid", "ATVPDKIKX0DER")

// 	q.Add("alias", "aps")
// 	q.Add("fresh", "0")
// 	q.Add("ks", "88")
// 	q.Add("prefix", keyword.Keyword)
// 	q.Add("event", "onKeyPress")
// 	q.Add("limit", "11")
// 	req.URL.RawQuery = q.Encode()

// 	resp, err := client.Do(req)

// 	if err != nil {
// 		log.Fatalln(err)
// 	}

// 	var result KeywordSuggestions

// 	json.NewDecoder(resp.Body).Decode(&result)

// 	if len(result.Suggestions) == 0 {
// 		log.Fatalln("No keywords found")
// 	}

// 	if len(result.Suggestions) == 1 {
// 		keyChannel <- Keyword{"", 0}
// 	} else {
// 		for _, item := range result.Suggestions {
// 			keyChannel <- Keyword{item.Value, 0}
// 		}
// 	}
// }

// func keywordMetadata(totalResultCount chan Keyword, keyword Keyword) {
// 	client := http.Client{}

// 	req, _ := http.NewRequest("GET", "https://www.amazon.com/s", nil)

// 	req.Header.Set("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_"+strconv.Itoa(rand.Intn(15-9)+9)+"_1) AppleWebKit/531.36 (KHTML, like Gecko) Chrome/"+strconv.Itoa(rand.Intn(79-70)+70)+".0.3945.130 Safari/531.36")
// 	req.Header.Set("Origin", "https://www.amazon.com")
// 	req.Header.Set("Referer", "https://www.amazon.com/")
// 	req.Header.Set("Accept-Encoding", "gzip")
// 	req.Header.Set("Accept-Language", "en-US,en;q=0.9,ru;q=0.8")
// 	req.Header.Set("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9")

// 	q := req.URL.Query()
// 	q.Add("i", "aps")
// 	q.Add("k", keyword.Keyword)
// 	q.Add("ref", "nb_sb_noss")
// 	q.Add("url", "search-alias=aps")
// 	req.URL.RawQuery = q.Encode()

// 	r, err := client.Do(req)

// 	if err != nil {
// 		log.Fatalln(err)
// 	}
// 	var reader io.ReadCloser
// 	reader, _ = gzip.NewReader(r.Body)

// 	dataInBytes, _ := ioutil.ReadAll(reader)
// 	pageContent := string(dataInBytes)

// 	reTotalCount := regexp.MustCompile(`(\w*"totalResultCount":\w*)(.[0-9])`)
// 	res := reTotalCount.FindAllString(string(pageContent), -1)

// 	var total int64 = 0
// 	if len(res) > 0 {
// 		reCount := regexp.MustCompile(`[-]?\d[\d,]*[\.]?[\d{2}]*`)
// 		submatchall := reCount.FindAllString(res[0], -1)
// 		total, _ = strconv.ParseInt(submatchall[0], 0, 64)
// 	}

// 	totalResultCount <- Keyword{keyword.Keyword, total}
// }