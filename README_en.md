# homework.sty

To use this package write the following line in the preample of the document:
```tex
\usepackage{homework}
```
You can also use russian version (see README.ru.md):
```tex
\usepackage[russian]{homework}
```
This package has a number of features. First of all, it looks awesome!
But also, it makes writing down your homework a bit easier.

# Complete list of features

* *\nset* - pretty looking N (commonly used as the natural number set)
* Same as above for *\zset*, *\qset*, *\rset*, *\cset*
* *\comb* - operator for combination. Use like this:
```tex
\comb_n^k % n choose k
```
* *\impl* - binary operator for implication
* *\timesdots* - *\ldots* in the russian version, *\ldots* in the base version
* *\No* - the numero symbol
* *statement* and *statement*\* environment - use for statements, that you might later refer to:
```tex
\begin{statement}
There are infinitely many primes. \label{sttm:prime}
\end{statement}
... but $p$ can't be the last prime (see statement~\ref{sttm:prime}).
```
*statement* is numbered, *statement*\* is not.
* *\homework* - put right after *\begin{document}*. It has three requred arguments - the name of the homework, the author and the date.
* *problem* environment - put every problem inside this environment. It has one required argument - the name of the problem.
* *\Definitions*, *\Statement*, *\Proof*, *\Solution* and *\Answer* - put this before respective part of your problem.
* *definitions* environment - put your definitions here. *Every defenition should start with \item*.
```tex
\begin{definitions}
\item $n$ is any natural number
\item $f(n) = \sum_{k=1}n \frac 1 {k!}$
\end{definitions}
```
* *localdefinitions* environment - same as above, but doesn't \clearpage afterwards.
* *\DefineNaturalNumberSet* and *\DefineNaturalNumberSetWithIndex* - put this inside *[local]definitions*, for default definition of the natural set.
This is useful, because some people begin natural numbers with one, and some with zero. *\DefineNaturalNumberSet* has one optional argument - 
the first natural number (the default is 1).
```tex
\begin{definitions}
\DefineNaturalNumberSet
\end{definitions}
```
* *\DefineNChooseK* - similar to above. This is useful, because there are two ways to write "n choose k".
* *\QED* - macro, that is replaced with "Which is what had to be shown.". If the optional argument is
provided, it is replaced by "Which is what had to be shown in #1."
## Russian only
* *tg* and *ctg* is more common way to write *tan* and *cot* is Russia. So operators *\tg* and *\ctg* are added.
Also, *\tan* and *\cot* are replaced by them.
* *\leq* and *\geq* looks the accepted way in Russia.
* *\times* is replaced by *\cdot*
