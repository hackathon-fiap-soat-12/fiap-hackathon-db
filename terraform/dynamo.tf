resource "aws_dynamodb_table" "video_entity" {
  name           = "video_entity"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "userId"
    type = "S"
  }

  attribute {
    name = "createdAt"
    type = "S"
  }

  global_secondary_index {
    name               = "UserCreatedAtIndex"
    hash_key           = "userId"
    range_key          = "createdAt"
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }
}
