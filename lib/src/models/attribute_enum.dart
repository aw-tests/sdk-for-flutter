part of appwrite.models;

/// AttributeEnum
class AttributeEnum implements Model {
    /// Attribute Key.
    final String key;
    /// Attribute type.
    final String type;
    /// Attribute status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    final String status;
    /// Is attribute required?
    final bool xrequired;
    /// Is attribute an array?
    final bool array;
    /// Array of elements in enumerated type.
    final List elements;
    /// String format.
    final String format;
    /// Default value for attribute when not provided. Cannot be set when attribute is required.
    final String xdefault;

    AttributeEnum({
        required this.key,
        required this.type,
        required this.status,
        required this.xrequired,
        required this.array,
        required this.elements,
        required this.format,
        required this.xdefault,
    });

    factory AttributeEnum.fromMap(Map<String, dynamic> map) {
        return AttributeEnum(
            key: map['key'],
            type: map['type'],
            status: map['status'],
            xrequired: map['required'],
            array: map['array'],
            elements: map['elements'],
            format: map['format'],
            xdefault: map['default'],
        );
    }

    @override
    Map<String, dynamic> toMap() {
        return {
            "key": key,
            "type": type,
            "status": status,
            "required": xrequired,
            "array": array,
            "elements": elements,
            "format": format,
            "default": xdefault,
        };
    }
}