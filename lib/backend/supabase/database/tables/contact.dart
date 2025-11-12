import '../database.dart';

class ContactTable extends SupabaseTable<ContactRow> {
  @override
  String get tableName => 'contact';

  @override
  ContactRow createRow(Map<String, dynamic> data) => ContactRow(data);
}

class ContactRow extends SupabaseDataRow {
  ContactRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContactTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get subject => getField<String>('subject');
  set subject(String? value) => setField<String>('subject', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);
}
