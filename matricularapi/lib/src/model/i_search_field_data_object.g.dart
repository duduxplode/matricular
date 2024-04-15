// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i_search_field_data_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ISearchFieldDataObject extends ISearchFieldDataObject {
  @override
  final JsonObject? id;
  @override
  final String? description;

  factory _$ISearchFieldDataObject(
          [void Function(ISearchFieldDataObjectBuilder)? updates]) =>
      (new ISearchFieldDataObjectBuilder()..update(updates))._build();

  _$ISearchFieldDataObject._({this.id, this.description}) : super._();

  @override
  ISearchFieldDataObject rebuild(
          void Function(ISearchFieldDataObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ISearchFieldDataObjectBuilder toBuilder() =>
      new ISearchFieldDataObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ISearchFieldDataObject &&
        id == other.id &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ISearchFieldDataObject')
          ..add('id', id)
          ..add('description', description))
        .toString();
  }
}

class ISearchFieldDataObjectBuilder
    implements Builder<ISearchFieldDataObject, ISearchFieldDataObjectBuilder> {
  _$ISearchFieldDataObject? _$v;

  JsonObject? _id;
  JsonObject? get id => _$this._id;
  set id(JsonObject? id) => _$this._id = id;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ISearchFieldDataObjectBuilder() {
    ISearchFieldDataObject._defaults(this);
  }

  ISearchFieldDataObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ISearchFieldDataObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ISearchFieldDataObject;
  }

  @override
  void update(void Function(ISearchFieldDataObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ISearchFieldDataObject build() => _build();

  _$ISearchFieldDataObject _build() {
    final _$result =
        _$v ?? new _$ISearchFieldDataObject._(id: id, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
