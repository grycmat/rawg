import 'dart:convert';

class Reactions {
	int? 1;
	int? 2;
	int? 3;
	int? 4;
	int? 5;
	int? 6;
	int? 7;
	int? 9;
	int? 10;
	int? 11;
	int? 12;
	int? 13;
	int? 17;
	int? 18;

	Reactions({
		this.1, 
		this.2, 
		this.3, 
		this.4, 
		this.5, 
		this.6, 
		this.7, 
		this.9, 
		this.10, 
		this.11, 
		this.12, 
		this.13, 
		this.17, 
		this.18, 
	});

	factory Reactions.fromMap(Map<String, dynamic> data) => Reactions(
				1: data['1'] as int?,
				2: data['2'] as int?,
				3: data['3'] as int?,
				4: data['4'] as int?,
				5: data['5'] as int?,
				6: data['6'] as int?,
				7: data['7'] as int?,
				9: data['9'] as int?,
				10: data['10'] as int?,
				11: data['11'] as int?,
				12: data['12'] as int?,
				13: data['13'] as int?,
				17: data['17'] as int?,
				18: data['18'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'1': 1,
				'2': 2,
				'3': 3,
				'4': 4,
				'5': 5,
				'6': 6,
				'7': 7,
				'9': 9,
				'10': 10,
				'11': 11,
				'12': 12,
				'13': 13,
				'17': 17,
				'18': 18,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Reactions].
	factory Reactions.fromJson(String data) {
		return Reactions.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Reactions] to a JSON string.
	String toJson() => json.encode(toMap());
}
