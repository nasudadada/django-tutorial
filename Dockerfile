FROM python:3.12-slim

# 作業ディレクトリを設定
WORKDIR /app

# システムの依存関係をインストール
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# uvをインストール
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"

# プロジェクトファイルをコピー
COPY pyproject.toml uv.lock ./

# 依存関係をインストール
RUN uv sync --frozen

# アプリケーションコードをコピー
COPY . .

# ポート8000を公開
EXPOSE 8000

# デフォルトコマンド
CMD ["uv", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]