# PowerShell スクリプト：Power Platform 環境の一括作成

このスクリプトは、CSVファイルから接続情報と環境情報を読み込み、Microsoft Power Platform に複数の環境を一括で作成するための PowerShell スクリプトです。

## 📄 概要

- 接続アカウント情報と環境情報を含む CSV ファイルを読み込みます。
- 各行の情報に基づいて Power Platform にログインし、環境を作成します。
- 環境は日本リージョンで、言語は日本語（1041）、通貨は日本円（JPY）、SKU は「trial」で作成されます。

## 📁 ソースデータファイル

CSV ファイルのパスは以下の通りです。PowerShellファイルと同じディレクトリに`userlist.csv`と言うファイル名で保存するようにしてください。

```powershell
$Datapath = ".\userlist.csv"
```

## 📁 CSVファイルのフォーマット例

```csv
account_UPN,account_pw,env_name
user1@example.com,password123,Environment A
user2@example.com,password456,Environment B
```

## 📚 参考情報

### 🌐 言語コード（LanguageName）

| 言語名         | 地域・バリエーション | LCID  |
|----------------|----------------------|-------|
| 日本語         | Japan                | 1041  |
| 英語（米国）   | United States        | 1033  |
| 英語（英国）   | United Kingdom       | 2057  |
| 中国語（簡体字）| China                | 2052  |
| 中国語（繁体字）| Taiwan               | 1028  |
| 韓国語         | Korea                | 1042  |
| ドイツ語       | Germany              | 1031  |
| フランス語     | France               | 1036  |
| スペイン語     | Spain                | 1034  |
| ポルトガル語   | Brazil               | 1046  |
| ロシア語       | Russia               | 1049  |
| イタリア語     | Italy                | 1040  |
| オランダ語     | Netherlands          | 1043  |
| トルコ語       | Turkey               | 1055  |
| アラビア語     | Saudi Arabia         | 1025  |
| ヒンディー語   | India                | 1081  |
| タイ語         | Thailand             | 1054  |
| ベトナム語     | Vietnam              | 1066  |

### ✅ よく使われるロケーションコードの例

| 地域名           | コード（`-Location` に指定） |
|------------------|-----------------------------|
| 日本             | `japan`                     |
| アメリカ | `unitedstates`              |
| カナダ           | `canada`                    |
| イギリス         | `unitedkingdom`             |
| オーストラリア   | `australia`                 |
| ヨーロッパ（西部）| `europe`                   |
| アジア（東南）   | `asia`                      |
| インド           | `india`                     |


### 🏷 環境 SKU（EnvironmentSku）

| SKU 名       | 説明                             |
|--------------|----------------------------------|
| Trial        | 評価用環境（機能制限あり）       |
| Production   | 本番環境（完全な機能）           |
| Sandbox      | テスト・開発用環境               |
| Developer    | 開発者向け環境（個人用）         |

### 📞 サポート

不明点がある場合は、スクリプト作成者またはシステム管理者にお問い合わせください。


## 注意事項

- パスワードは平文で CSV に記載されるため、取り扱いには十分注意してください。
- `ConvertTo-SecureString` を使用して暗号化していますが、セキュリティ上のベストプラクティスではありません。
