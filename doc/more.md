
### cabal dependencies,

```
apt-get install cabal-install
cabal install hxt
cabal install hxt-curl
cabal install warp
# cabal install warp-tls

# cabal install http-client
cabal install http-client-tls
cabal install raw-strings-qq

apt-get install libpq-dev
cabal install postgresql-simple

cabal install resource-pool

```

### Vim config

from, vim /usr/share/vim/vim80/syntax/haskell.vim

```
:let hs_highlight_delimiters = 1
:let hs_highlight_types = 1
:let hs_highlight_more_types = 1
```


#### refs


- postgresql simple
  https://hackage.haskell.org/package/postgresql-simple-0.5.2.1/docs/Database-PostgreSQL-Simple.html

- parameter vocabulary
  https://s3-ap-southeast-2.amazonaws.com/content.aodn.org.au/Vocabularies/parameter-category/aodn_aodn-parameter-category-vocabulary.rdf

- CSW GetCapabilities
  https://catalogue-portal.aodn.org.au/geonetwork/srv/eng/csw?request=GetCapabilities&service=CSW

- Good CSW examples,
  https://gist.github.com/kalxas/5ab6237b4163b0fdc930

- has PointOfTruth and OnlineResourceType

- postgres full text search
    http://rachbelaid.com/postgres-full-text-search-is-good-enough/
    note use of string_agg, and coalesce

- HXT
  https://wiki.haskell.org/HXT

  functions,
  https://hackage.haskell.org/package/hxt-9.3.1.16/docs/Text-XML-HXT-Arrow-XmlArrow.html


- PG conn management
  https://hackage.haskell.org/package/postgresql-simple-0.5.0.0/candidate/docs/Database-PostgreSQL-Simple.html#g:14

- pg pools
  - http://codeundreamedof.blogspot.com.au/2015/01/a-connection-pool-for-postgresql-in.html
  - https://github.com/lpsmith/postgresql-libpq/issues/33


### Old - Notes, on libraries




- http-client
  https://haskell-lang.org/library/http-client
  - minimalistic - no ssl/https support
  - someone else says it does have tls

- http-client-tls
  - has tls.

- http
  https://hackage.haskell.org/package/HTTP
  - no https - "NOTE: This package only supports HTTP; it does not support HTTPS. Attempts to use HTTPS result in an error."
  - cabal install http-conduit
  - absolutely huge


- warp
  - The biggest issue with warp-tls has nothing to do with performance, but that it uses an obscure TLS implementation that has received fairly little review, and almost certainly has bugs.  but It has gotten top marks in every audit. We are comfortable with relying on it in production. If the alternative is an OpenSSL-based implementation,

- wreq -
  - supposedly simple uses lenses.




