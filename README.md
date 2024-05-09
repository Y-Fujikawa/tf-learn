# tf-learn
2024年版Terraform練習場

## Usage

- 各環境ごとのディレクトリに移動
- Terraform用のバケットを作成
- `terraform init` 実行
- `terraform plan` または `terraform apply` 実行

## ドキュメント生成

`terraform-docs` をローカルマシンにインストール

```shell
brew install terraform-docs
```

各環境ごとのディレクトリで以下を実行する。

```shell
terraform-docs markdown table --output-file README.md --output-mode inject .
```
