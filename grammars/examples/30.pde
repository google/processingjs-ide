    // RandomSentenceGenerator

    String names[] = {
      "太郎", "花子"
    };

    String how[] = {
      "早く", "とつぜん", "外で"
    };

    String verbs[] = {
      "叫びました",
      "きのこになりました",
      "ふられました"
    };

    size(400, 200);
    fill(0);
    textSize(25);

    int nameIndex = int(random(names.length));
    int howIndex = int(random(how.length));
    int verbIndex = int(random(verbs.length));

    String phrase = names[nameIndex] + how[howIndex] + verbs[verbIndex];
    text(phrase, 10, 100);
    speak(phrase);
