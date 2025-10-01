# Django Tutorial - Polls App️

Django公式チュートリアルに基づいた投票アプリケーションです。

## 概要

このプロジェクトは、Djangoの基本的な機能を学習するための投票（Polls）アプリケーションです。質問と選択肢を作成し、投票機能を提供するWebアプリケーションです。

## 機能

- 質問の一覧表示（未来の質問は非表示）
- 質問の詳細表示と選択肢の確認
- 投票機能（重複投票防止、エラーハンドリング）
- 投票結果の表示
- 高度な管理画面（インライン編集、検索、フィルタリング）
- 静的ファイル（CSS、画像）
- 包括的なテストスイート
- デバッグツールバー

## 技術スタック

- **Python**: 3.12
- **Django**: 5.2.5
- **データベース**: PostgreSQL
- **パッケージマネージャー**: uv
- **コンテナ**: Docker & Docker Compose


## セットアップ

### 前提条件

- Python 3.12以上
- uv（パッケージマネージャー）
- Docker & Docker Compose（オプション）

### ローカル開発環境

1. リポジトリをクローン
```bash
git clone <repository-url>
cd django-tutorial
```

2. 依存関係をインストール
```bash
uv sync
```

3. 環境変数を設定
```bash
cp .env.example .env
# .envファイルを編集してSECRET_KEYなどを設定
```

4. データベースのマイグレーション
```bash
uv run python manage.py migrate
```

5. 開発サーバーを起動
```bash
uv run python manage.py runserver
```

アプリケーションは http://localhost:8000 でアクセスできます。

### Docker を使用した開発

1. PostgreSQLコンテナを起動
```bash
docker-compose up postgres -d
```

2. 環境変数を設定（PostgreSQL用）
```bash
# .envファイルでデータベース設定を更新
DB_HOST=localhost
DB_NAME=djangotutorial
DB_USER=postgres
DB_PASSWORD=postgres
```

3. マイグレーションとサーバー起動
```bash
uv run python manage.py migrate
uv run python manage.py runserver
```

### 本番環境デモ

```bash
docker-compose --profile production up --build
```

## 使い方

1. 管理ユーザーを作成
```bash
uv run python manage.py createsuperuser
```

2. 管理画面（http://localhost:8000/admin/）にアクセスして質問を作成

3. Polls アプリ（http://localhost:8000/polls/）で質問を確認

## VS Code / Cursor でのデバッグ

このプロジェクトは VS Code / Cursor でのデバッグが簡単に行えるよう設定しています。

### デバッグ手順

1. **環境設定**
```bash
# 依存関係をインストール
uv sync

# 環境変数ファイルをコピー
cp .env.example .env

# データベースマイグレーション
uv run python manage.py migrate
```

2. **デバッグ開始**
   - VS Code / Cursor で F5 キーを押す
   - または「実行とデバッグ」タブから「Django: Debug Server」を選択
   - ブレークポイントを設置したい行の左側をクリック

3. **デバッグ機能**
   - 自動リロード有効（コード変更時に自動再起動）
   - ブレークポイントでの実行停止
   - 変数の監視
   - ステップ実行（F10: ステップオーバー、F11: ステップイン）

### デバッグ設定ファイル

- `.vscode/launch.json`: デバッグ設定
- `.env.example`: 環境変数のテンプレート

## プロジェクト構造

```
django-tutorial/
├── mysite/                 # Djangoプロジェクト設定
│   ├── settings.py         # プロジェクト設定
│   ├── urls.py            # メインURLルーティング
│   └── wsgi.py            # WSGI設定
├── polls/                  # Pollsアプリケーション
│   ├── models.py          # データモデル
│   ├── views.py           # ビュー関数
│   ├── urls.py            # アプリURLルーティング
│   ├── admin.py           # 管理画面設定
│   └── templates/polls/   # HTMLテンプレート
├── docker-compose.yml     # Docker設定
├── Dockerfile            # Dockerイメージ設定
├── pyproject.toml        # Python依存関係
└── manage.py             # Django管理コマンド
```


## 参考リンク

- [Django公式チュートリアル](https://docs.djangoproject.com/ja/5.2/intro/tutorial01/)
- [Django公式ドキュメント](https://docs.djangoproject.com/ja/5.2/)
- [Django Debug Toolbar](https://django-debug-toolbar.readthedocs.io/)
- [uv - Python パッケージマネージャー](https://docs.astral.sh/uv/)

## ライセンス

このプロジェクトは学習目的で作成されています。
