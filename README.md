# kosodate-hitoiki
子育ての愚痴をこぼし、コメントでコツや体験談を共有できるSNSアプリ（Flutter + Supabase）

バックエンド（Supabaseのマイグレーション・RLSポリシー・Edge Functions）は別リポジトリ [kosodate-hitoiki-backend](https://github.com/naka328/kosodate-hitoiki-backend) で管理する。

詳細設計は [docs/全体設計書.md](docs/全体設計書.md) を参照。

## セットアップ

```bash
cp .env.example .env
# .envにSupabaseプロジェクトのURL・匿名キーを設定
flutter pub get
flutter run
```
