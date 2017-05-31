# En Optimeringsprocess för databasfrågor i Qiiwi Interactives produkt Backpacker

Detta repository innehåller källkod som supplement till mitt examensarbete med ovanstående titel för programmet Java Enterprise Utvecklare(YH), YRGO Göteborg. Arbetet skapades även i uppdrag av Qiiwi Interactive i Alingsås med uppdraget att genomföra en optimering av de databasqueries som ställs emot backenden av deras mobilspel Backpacker. 

Inom ramen av uppdraget konstruerades ett system, <b>Analysservice</b>, som avlastar användarna från flera nödvändiga arbetssteg i optimeringsprocessen samt kör en webbtjänst([Box Open Source Anemometer](https://github.com/box/Anemometer)) som erbjuda en enhetlig, grafisk användaregränssnitt för att snabbt kunna identifiera icke optimala queries och få resultat från olika optimeringsverktyg. Analysen av databasqueries baserar på MySQLs Slow Query Log som analyseras med PT-Query-Digest från  [Perconas](https://www.percona.com/) Toolkit.       

## Optimeringsverktyget "Analysservice" 
Repot innehåller olika Bash-skript och anpassade PHP-filer som behövs för att kunna ta Analysservicen i drift. Olika anpassningar har gjorts för att kunna sammanfoga de inblandade tredjepartsverktyg till ett fungerande system matchande Qiiwi Interactives tekniska krav och önskemål. Mer information finns i rapporten till arbetet, som är för enkelhetens skull även bifogad till detta repository som pdf-fil, se [här](En\ optimeringsprocess\ för\ databasfrågor\ i\ Qiiwi\ Interactives\ produkt\ Backpacker_Tim\ Langhans.pdf).    
