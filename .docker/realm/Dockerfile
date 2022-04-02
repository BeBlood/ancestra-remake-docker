FROM java:8

WORKDIR /ancestra

ADD realm.jar Realm_Config.txt ./

EXPOSE 444
EXPOSE 489

CMD java -jar -Xmx200m -Xms200m realm.jar