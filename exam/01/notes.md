# 1. **Základnı́ pojmy a vztahy mezi nimi, souvislosti** - definice strojové inteligence a strojového učenı́, učı́cı́ se algoritmy; vztah data–informace–znalosti, ontologie; paradigmata a formalismy strojového učenı́ (hypotéza – znalost, stavový prostor, parametrický prostor); aplikačnı́ domény, typické problémy aplikace strojové inteligence.

## Strojové učení
- podoblast **umělé inteligence**
    - není učení -> není zlepšení -> mdlá/žádná inteligence
- obor, který umožňuje počítačům řešit problémy, k jejichž řešení nebyly explpicitně naprogramovány
    - **algoritmy strojového učení popisují**, jak využít **vyřešené příklady** k odvození obecné znalosti (_Knowledge_), která dovolí předmětný problém řešit)
- způsob budování inteligentního počítačového systému, tj. takového, který obsahuje znalosti a využívá je
- učení je odvozování znalostí
    - nových z existujících (indukce, dedukce)
    - a z příkladů v trénovací množině generalizací (abdukcí)

## Učící se algoritmy
- s učitelem, bez učitele, zpětnovazební, jiné
- **učení**
    - s učitelem (_Supervised_)
        - učitel (expert) určil, do které třídy vzorek patří
    - bez učitele (_Unsupervised_)
        - žádná informace o zařazení vzorku do určité třídy není k dispozici
- **regrese**
    - hledá se **funkce/křivka**, jež prokládá data tak, aby bylo možné určit hodnotu kdekoli
- **klasifikace**
    - zledá se `(n-1)D` (hyper-plocha), která odděluje data v `nD` prostoru



## Vztah data-informace-znalosti
- **data** - něco je naměřeno a číslicově uloženo v paměti počítače (_nevíme, co to je_)
    - digitalizované stimuly
    - _čísla bez popisu_
    - jedničky a nuly z HW senzoru
- **informace** - je přidána jednoduchá **ontologie** vysvětlující co jednotlivé hodnoty znamenají
- **znalosti** 
    - např. matematický model popsaný množinou parametrů
    - znalosti umožňují odvozovat nové znalosti (in-/dedukce)
    - znalosti dovolují činit rozhodnutí
    - znalost je procedurálí - lze ji "vykonat"

## Ontologie
- data vybavíme kategorií
- konkrétní číslo uložené v paměti představuje např. teplotu
- jsoucno, to co jest, bytí
- entita existuje
- **něco, co umožňuje formalizovat definitoricky dané vztahy a souvilosti**
    - pomocí ontologie můžeme říct co je čím
- jsou to výroky o entitách

## Paradigmata a formalismy strojového učení
### Hypotéza - znalost
- správný formální popis problému, dostatečně obecný, aby mohl být aplikován na neznámá data a poskytoval uspokojivé výsledky 
- je-li známá forma hypotézy, stačí jen správně naladit její parametry 

### Stavový prostor
- množina všech možných konfigurací systému 

### Parametrický prostor
- parametry hypotézy (theta) se mohou měnit nezávisle, tvoří kartézský prostor `|R^2` -> **stavový prostor parametrů hypotézy**, čili **parametrický prostor**
- každý bod v parametrickém prostoru odpovídá jedné určité poloze **interpolantu**, daného hypotézou, ve stavovém prostoru úlohy

## Aplikační domény
- **s učitelem**
    - *předpovídej výsledky*
    - computer vision
        - detekce/identifikace/klasifikace objektů/tváří/lidí/zvířat ve scéně, OCR
        - rozpoznávání řeči (ASR)
        - zpracování přirozeného jazyka (NLP)
    - přizpůosbující se aplikace - recommendery
    - řízení strojů, optimalizace dopravních toků
- **bez učitele**
    - *najdi skrytou strukturu*
    - shluková analýza
    - klasifikace dokumentů/vyhledávání na webu
    - optimalizace topologie (sítě, logistika)
    - segmentace (marketing, výroba)
    - rekonstrukce dat, zvyšování rozlišení
    - oprava chyb
    - predikce katastrof
    

## Typické problémy aplikace strojové inteligence
- ???
- **prohledání stavového prostoru**
- nalezení nejlepší hypotézy = nalezení minima cenové funkce
    - řešení hrubou silou
    - vhodný tvar cenové funkce

## Inteligence
- systém je inteligentní, když je schopen provádět:
    1. uvažování
    2. řešení problémů
    3. plánování
    4. abstrakci a generalizaci
    5. učení 

