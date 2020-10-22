//Queries information on the provider and makes it available
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow" //The permissions
    actions = [ "s3:GetObject" ] //Only allow read access
    principals {
      type = "*"
      identifiers = [ "*" ]
    }
    resources = [ "arn:aws:s3:::maximexplorecalifornia.org/*" ]
  }
}

//Host a resource named website on S3
resource "aws_s3_bucket" "website" {
  bucket = "maximexplorecalifornia.org"  // The name of the bucket.
  acl    = "public-read"            /* Access control list for the bucket.
                                       Websites need to be publicly-available
                                       to the Internet for website hosting to
                                       work. */
  policy = "${data.aws_iam_policy_document.bucket_policy.json}" //Get the JSON version of the bucket policy
  website {
    index_document = "index.htm"   // The root of the website.
    error_document = "error.htm"   // The page to show when people hit invalid pages.
  }
}

//To export the info
output "website_bucket_url" {
  value = "${aws_s3_bucket.website.website_endpoint}"
}

