import '../database.dart';

class WalletTransactionsTable extends SupabaseTable<WalletTransactionsRow> {
  @override
  String get tableName => 'wallet_transactions';

  @override
  WalletTransactionsRow createRow(Map<String, dynamic> data) =>
      WalletTransactionsRow(data);
}

class WalletTransactionsRow extends SupabaseDataRow {
  WalletTransactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WalletTransactionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get walletId => getField<String>('wallet_id')!;
  set walletId(String value) => setField<String>('wallet_id', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  int get coins => getField<int>('coins')!;
  set coins(int value) => setField<int>('coins', value);

  int get valueBrlCents => getField<int>('value_brl_cents')!;
  set valueBrlCents(int value) => setField<int>('value_brl_cents', value);

  String get reason => getField<String>('reason')!;
  set reason(String value) => setField<String>('reason', value);

  String? get stripePaymentIntentId =>
      getField<String>('stripe_payment_intent_id');
  set stripePaymentIntentId(String? value) =>
      setField<String>('stripe_payment_intent_id', value);

  dynamic get metadata => getField<dynamic>('metadata');
  set metadata(dynamic value) => setField<dynamic>('metadata', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
