#!/bin/bash -e



for d in RebelSite Convekta Kingbase Britbase PgnMentor ChessNostalgia.com WorldChampionships Corus ChessOk.com PgnDownloads Chessopolis.com Twic Npollock Bundesliga; do
    echo $d
    rm -f ${d}/mega*.pgn
    time ./pe2600.sh ${d}/*.pgn > ${d}/mega2600.pgn 2> ${d}/mega2600.err
done

echo FINAL
time ./pe2600.sh */mega2600.pgn > mega2600.pgn 2> mega2600.err

echo SPLIT
time python Code/xsplit.py mega2600.pgn */mega2600.pgn