Unaccent <- function(text) {
  text <- gsub("['`^~\"]", " ", text)
  text <- iconv(text, to="ASCII//TRANSLIT//IGNORE")
  text <- gsub("['`^~\"]", "", text)
  return(text)
}

NoSpace <- function(text) {
  return(gsub(" ", "", text))
}

Processing <- function(text, space, accent){
  if(accent == TRUE){
    text <- Unaccent(text)
  }
  if(space == TRUE){
    text <- NoSpace(text)
  }
  return(text)
}

Reversed <-function(text) {
  text_split <- strsplit(text, NULL)[[1]]
  return(paste(rev(text_split), collapse=""))
}

is_palindromiques <- function(word, space=FALSE, accent=TRUE) {
  word_process <- Processing(word, space, accent)
  word_reversed <- Reversed(word_process)
  if(tolower(word_process) == tolower(word_reversed)){
    return(TRUE)
  }else{
    return(FALSE) 
  }
}

RandomWord <- function(){
  alphabet <- "abcdefghijklmnopqrstuvwxyz"
  alphabet <- strsplit(alphabet, NULL)[[1]]
  lettermax <- sample(2:9, 1)
  word <- ""
  for(i in 1:lettermax){
    rnd <-sample(1:26, 1)
    word <- paste(word, alphabet[rnd], collapse="")
  }
  word <- NoSpace(word)
  return(word)
}

PalindromeAutoLib <- function(max =50){
  for(i in 1:max){
    word <- RandomWord()
    if(is_palindromiques(word)){
      print(word)
    }
  }
}

#1) & 2)
is_palindromiques("radar")
is_palindromiques("bonne année", space=TRUE)
is_palindromiques("sept")
is_palindromiques("kayak")
is_palindromiques("la mariée ira mal")
is_palindromiques("la mariée ira mal", space=TRUE, accent=FALSE)
is_palindromiques("la mariée ira mal", space=TRUE)
is_palindromiques("statistiques")
is_palindromiques("engage le jeu que je le gagne")
is_palindromiques("engage le jeu que je le gagne", space=TRUE)
is_palindromiques("esope reste ici et se repose")
is_palindromiques("esope reste ici et se repose", space=TRUE)

#3
PalindromeAutoLib(max=1500)