library(quanteda)
library(rtweet)
library(ggplot2)
library(dplyr)

ch <- search_tweets("",
                    geocode = "47.3399347,7.8669005,10mi",
                    n = 1000)
ch_de <- ch %>%
    filter(lang == 'de')


tweet_corp <- corpus(ch_de, text_field = "text")

tweet_tok <- tweet_corp %>%
    tokens(remove_punct = TRUE,
           remove_numbers = TRUE,
           remove_twitter = TRUE,
           remove_url = TRUE) %>%
    tokens_remove(stopwords("de"))

tweet_dfm <- tweet_tok %>%
    dfm()



gg <- ggplot(data = ch_de, aes(x = source))

gg +
    geom_bar() +
    theme_minimal() +
    theme(axis.text.x =
              element_text(angle = 90))


messi <- search_tweets("Messi", n = 1000)

messi_dfm <- messi %>%
    filter(lang == "en") %>%
    corpus(text_field = "text") %>%
    tokens(remove_punct = TRUE) %>%
    tokens_remove(stopwords("en")) %>%
    dfm()

toptag <- names(topfeatures(messi_dfm, 20))


tag_fcm <- fcm(messi_dfm)
topgat_fcm <- fcm_select(tag_fcm, pattern = toptag)
textplot_network(topgat_fcm, min_freq = 0.1, edge_alpha = 0.8, edge_size = 5)







