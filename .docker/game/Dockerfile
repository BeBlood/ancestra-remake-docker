FROM java:8

WORKDIR /ancestra

ADD game.jar Game_Config.txt ./

EXPOSE 5555
EXPOSE 489

CMD java -jar -Xmx1024m -Xms1024m game.jar