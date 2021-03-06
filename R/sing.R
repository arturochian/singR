#' Writing a number of syllables on standard output defined by \code{speed} number of seconds
#' @param text character vector
#' @param speed numeric
#' @param language language to be used for finding hyphens (passed to \code{koRpus})
#' @return Nothing is returned, the text is written to \code{stdout}.
#' @export
#' @importFrom koRpus hyphen
sing <- function(text, speed = 4, language = 'en') {

    ## recursive stuff
    if (length(text) > 1)
        return(invisible(sapply(text, sing, speed = speed)))

    ## find syllabus by hyphens
    text <- hyphen(text, hyph.pattern = language, quiet = TRUE)@hyphen[1, 2]

    ## split it
    text <- strsplit(text, split = ' |-')[[1]]

    ## remove NULL
    text <- text[which(nchar(text) > 0)]

    ## sing!
    for (s in text) {
        cat(s, '')
        Sys.sleep(1/speed)
    }

    ## stop for a while after LF
    cat('\n')
    Sys.sleep(1/6)

}
