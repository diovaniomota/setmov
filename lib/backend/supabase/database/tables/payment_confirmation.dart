import '../database.dart';

class PaymentConfirmationTable extends SupabaseTable<PaymentConfirmationRow> {
  @override
  String get tableName => 'payment_confirmation';

  @override
  PaymentConfirmationRow createRow(Map<String, dynamic> data) =>
      PaymentConfirmationRow(data);
}

class PaymentConfirmationRow extends SupabaseDataRow {
  PaymentConfirmationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PaymentConfirmationTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get stripePaymentIntentId =>
      getField<String>('stripe_payment_intent_id')!;
  set stripePaymentIntentId(String value) =>
      setField<String>('stripe_payment_intent_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
