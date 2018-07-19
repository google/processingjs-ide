    String itsu[] = {"昨日", "2年前", "今朝"};
    String darega[] = {"太郎が", "花子が"};
    String dokode[] = {"外で", "学校で", "とつぜん", "大きく"};
    String doushita[] = {"起きました",  "叫びました",  "転びました",  "輝きました"};

    size(400, 200);
    fill(0);
    textSize(25);

    int itsuIndex = int(random(itsu.length));
    int daregaIndex = int(random(darega.length));
    int dokodeIndex = int(random(dokode.length));
    int doushitaIndex = int(random(doushita.length));

    String phrase = itsu[itsuIndex] + darega[daregaIndex] + dokode[dokodeIndex] + doushita[doushitaIndex];
    text(phrase, 10, 100);
    speak(phrase);
