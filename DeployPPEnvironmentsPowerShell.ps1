#ソースデータファイルのパス指定
$Datapath = ".\userlist.csv"
#データファイルのインポート(Shift-JIS)
$Datas = Import-Csv -Path $Datapath -Encoding Default
#データファイルの行数分ループ
foreach($Data in $Datas){
    $Data |Format-Table
    #パスワードを暗号化
    $PW=ConvertTo-SecureString $Data.account_pw -asplaintext -force
    #接続アカウント追加
    Add-PowerAppsAccount -Endpoint "prod" -Username $Data.account_UPN -Password $PW
    #新規環境作成
    New-AdminPowerAppEnvironment -DisplayName $Data.env_name -ProvisionDatabase -Location japan -LanguageName 1041  -CurrencyName JPY -EnvironmentSku trial -WaitUntilFinished $false 
}
