# This program illustrates how to analyze text by modelling the relationship
# between words. The distribution for ngram is nothing but the joint distribution
# of two words (X and Y)

# This program is adapted from Text Mining with R (Silge and Robinson)
# available here at https://www.tidytextmining.com/ngrams.html

library(dplyr)
library(tidytext)
library(janeaustenr)
library(ggplot2)
library(tidyr)


# We will examine pairs of two consecutive words, called "bigrams"
# tokenize the "text" variable with bigram, and save this information
# in a variable called "bigram"

  austen_bigrams <- austen_books() %>%
    unnest_tokens(bigram, text, token = "ngrams", n = 2)
  
  austen_bigrams

# Let's examine what are the most common bigrams

  austen_bigrams %>%
    count(bigram, sort = TRUE)

# Now let's treat each word as X and Y
# The first word as X and the second as Y

  
  bigrams_separated <- austen_bigrams %>%
    separate(bigram, c("word1", "word2"), sep = " ")

# Let's get rid of all the stop words
  bigrams_filtered <- bigrams_separated %>%
    filter(!word1 %in% stop_words$word) %>%
    filter(!word2 %in% stop_words$word)

# new bigram counts:
  bigram_counts <- bigrams_filtered %>% 
    count(word1, word2, sort = TRUE)
  
  bigram_counts

# names (whether first and last or with a salutation) 
# are the most common pairs in Jane Austen books.

# Note that you can reverse the action of splitting words
# with unite()

  bigrams_united <- bigrams_filtered %>%
    unite(bigram, word1, word2, sep = " ")
  
  bigrams_united
  
  # Let's calculate the frequency for each pair of words
  
  joint.dist<-bigrams_united %>% 
    count(bigram, sort = TRUE) %>% 
      mutate(
        freq = n/sum(n)
      )
  
  # We can visualize the joint distribution (just treating two words as one compound word!) as we did last semester
  
  ggplot(joint.dist[joint.dist$freq>=0.001,], mapping = aes(x=reorder(bigram,freq),y=freq)) +
    geom_bar(stat="identity") +
    coord_flip()
  
# Suppose that you are interested in predicting a word coming after sir
# You just need to use Bayes classifier with the next word being Y
# Below is a toy novel writer starting with "sir"!
  
  bigram_counts %>%
    filter(word1 == "sir") %>%
    mutate(
      freq = n/sum(n)
    )
  
  bigram_counts %>%
    filter(word1 == "miss") %>%
    mutate(
      freq = n/sum(n)
    )  
  
  bigram_counts %>%
    filter(word1 == "crawford") %>%
    mutate(
      freq = n/sum(n)
    )  
  
  bigram_counts %>%
    filter(word1 == "fanny") %>%
    mutate(
      freq = n/sum(n)
    )  
  
  bigram_counts %>%
    filter(word1 == "price") %>%
    mutate(
      freq = n/sum(n)
    )   
  
  bigram_counts %>%
    filter(word1 == "walked") %>%
    mutate(
      freq = n/sum(n)
    )   
  
  bigram_counts %>%
    filter(word1 == "home") %>%
    mutate(
      freq = n/sum(n)
    )   
  
  bigram_counts %>%
    filter(word1 == "directly") %>%
    mutate(
      freq = n/sum(n)
    )      
  
  
# You can certainly create tri-gram data as well
  
  austen_books() %>%
    unnest_tokens(trigram, text, token = "ngrams", n = 3) %>%
    separate(trigram, c("word1", "word2", "word3"), sep = " ") %>%
    filter(!word1 %in% stop_words$word,
           !word2 %in% stop_words$word,
           !word3 %in% stop_words$word) %>%
    count(word1, word2, word3, sort = TRUE)  
  