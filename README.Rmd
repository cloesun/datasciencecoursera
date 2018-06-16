---
title: "README"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


##read feature to a a list to name the columns of the full data set 

```{r features}
features 
```

## read files in both of the subdirectories, cbind the files for test and training respectively 

## rbind the training and testing data togeter 

```{r data, echo=FALSE}
    names(data)
    summary(data) 
```



Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
