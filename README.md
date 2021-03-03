# テーブル設計

## users テーブル 
| Column             | Type    | Option                    |
|--------------------|---------|-------------------------- |
| nickname           | string     | NOT NULL               |
| email              | string     | NOT NULL, unique: true |
| encrypted_password | string     | NOT NULL               |
| full_name          | string     | NOT NULL               |
| full_name_kana     | string     | NOT NULL               |
| postal_code        | string     | NOT NULL               |
| prefecture_id      | integer    | NOT NULL               |
| city               | string     | NOT NULL               |
| address            | string     | NOT NULL               |
| building_name      | string     |                        |
| phone_number       | string     | NOT NULL               |
| job_id             | integer    | NOT NULL               |
| age_id             | integer    | NOT NULL               |
| gender_id          | integer    | NOT NULL               |

### Association
- has_many :dogs
- has_many :inquiry_records
- has_many :inquiry_lists

## dogs テーブル 
| Column             | Type       | Option              |
|--------------------|------------|---------------------|
| image              |            | ActiveStorage       |
| title              | string     |  NOT NULL           |
| dog_gender         | integer    |  NOT NULL           |
| dog_age_id         | integer    |  NOT NULL           |
| vaccine            | integer    |  NOT NULL           |
| surgery            | integer    |  NOT NULL           |
| prefecture_id      | integer    |  NOT NULL           |
| feature            | string     |  NOT NULL           |
| reason             | string     |  NOT NULL           |
| remarks            | string     |                     |
| user               | references | foreign_key: true   |

### Association
- belongs_to :user
- has_many :inquiry_records
- has_many :inquiry_forms

## inquiry_records テーブル
| Column             | Type       | Option                 |
| user               | references | foreign_key: true      |
| dog                | references | foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :dog
- has_one :inquiry_form

## inquiry_forms テーブル
| Column             | Type       | Option                 |
|--------------------|------------|------------------------|
| experience         | integer    | NOT NULL               |
| care_take          | string     | NOT NULL               |
| hope               | string     | NOT NULL               |
| inquiry_record     | references | foreign_key: true      |
| dog                | references | foreign_key: true      |
| user               | references | foreign_key: true      |

### Association
- belongs_to :inquiry_record
<!-- - belongs_to :dog -->
- has_one :inquiry_list

## inquiry_lists テーブル
| Column           | Type       | Option                 |
|------------------|------------|------------------------|
| user             | references | foreign_key            |
| dog              | references | foreign_key            |
| inquiry_form     | references | foreign_key            |

### Association
- belongs_to :user
- belongs_to :inquiry_form
<!-- - belongs_to :dog -->