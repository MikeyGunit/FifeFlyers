class DboardEntry {
  String id;
  String date;
  String mediaType;
  String title;
  String text;
  String heroImage;

  DboardEntry(
      {this.id,
        this.date,
        this.mediaType,
        this.title,
        this.text,
        this.heroImage});
}

class DboardAppEntry {
  String id;
  String date;
  String mediaType;
  String title;
  String text;
  String heroImage;
  String videoID;

  DboardAppEntry(
      {this.id,
        this.date,
        this.mediaType,
        this.title,
        this.text,
        this.heroImage,
      this.videoID});
}