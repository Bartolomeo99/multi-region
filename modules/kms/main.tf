resource "aws_kms_key" "my_key" {
  description              = "Managed KMS key for S3 data encryption"
  key_usage                = "ENCRYPT_DECRYPT"
  deletion_window_in_days  = 10
  enable_key_rotation      = false
  customer_master_key_spec = "RSA_4096"
  tags = merge( {
    Name = var.name
  }, var.tags)
}

resource "aws_kms_alias" "key_alias" {
  name          = "alias/my_key"
  target_key_id = aws_kms_key.my_key.key_id
}

