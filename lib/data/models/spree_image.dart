import 'package:json_annotation/json_annotation.dart';

part 'spree_image.g.dart';

@JsonSerializable()
class SpreeImage {
  int id;
  int position;
  @JsonKey(name: "attachment_content_type")
  String attachmentContentType;
  @JsonKey(name: "attachment_file_name")
  String attachmentFileName;
  String type;
  @JsonKey(name: "attachment_updated_at")
  String attachmentUpdatedAt;
  @JsonKey(name: "attachment_width")
  String attachmentWidth;
  @JsonKey(name: "attachment_height")
  String attachmentHeight;
  String alt;
  @JsonKey(name: "viewable_type")
  String viewableType;
  @JsonKey(name: "viewable_id")
  int viewableId;
  @JsonKey(name: "v")
  String miniUrl;
  @JsonKey(name: "small_url")
  String smallUrl;
  @JsonKey(name: "product_url")
  String productUrl;
  @JsonKey(name: "pdp_thumbnail_url")
  String pdpThumbnailUrl;
  @JsonKey(name: "plp_and_carousel_url")
  String plpAndCarouselUrl;
  @JsonKey(name: "plp_and_carousel_xs_url")
  String plpAndCarouselXsUrl;
  @JsonKey(name: "plp_and_carousel_sm_url")
  String plpAndCarouselSmUrl;
  @JsonKey(name: "plp_and_carousel_md_url")
  String plpAndCarouselMdUrl;
  @JsonKey(name: "plp_and_carousel_lg_url")
  String plpAndCarouselLgUrl;
  @JsonKey(name: "large_url")
  String largeUrl;
  @JsonKey(name: "plp_url")
  String plpUrl;
  @JsonKey(name: "zoomed_url")
  String zoomedUrl;

  SpreeImage(
      {this.type,
      this.id,
      this.position,
      this.alt,
      this.attachmentContentType,
      this.attachmentFileName,
      this.attachmentHeight,
      this.attachmentUpdatedAt,
      this.attachmentWidth,
      this.largeUrl,
      this.miniUrl,
      this.pdpThumbnailUrl,
      this.plpAndCarouselLgUrl,
      this.plpAndCarouselMdUrl,
      this.plpAndCarouselSmUrl,
      this.plpAndCarouselUrl,
      this.plpAndCarouselXsUrl,
      this.plpUrl,
      this.productUrl,
      this.smallUrl,
      this.viewableId,
      this.viewableType,
      this.zoomedUrl});

  factory SpreeImage.fromJson(Map<String, dynamic> json) =>
      _$SpreeImageFromJson(json);

  Map<String, dynamic> toJson() => _$SpreeImageToJson(this);
}
