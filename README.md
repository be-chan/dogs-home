# テーブル設計

## users テーブル 
| Column             | Type    | Option                 |
|--------------------|---------|------------------------|
| nickname           | string  | NOT NULL               |
| email              | string  | NOT NULL, unique: true |
| encrypted_password | string  | NOT NULL               |
| full_name          | string  | NOT NULL               |
| full_name_kana     | string  | NOT NULL               |
| postal_code        | string  | NOT NULL               |
| prefecture_id      | integer | NOT NULL               |
| address            | string  | NOT NULL               |
| building_name      | string  |                        |
| phone_number       | string  | NOT NULL               |
| job_id             | integer | NOT NULL               |
| age_id             | integer | NOT NULL               |
| gender_id          | integer | NOT NULL               |

### Association
- has_many :dogs
- has_many :application_recodes
- has_many :application_lists

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
- has_many :application_recodes
- has_many :application_forms

## application_recodes テーブル
| Column             | Type       | Option                 |
| user               | references | foreign_key: true      |
| dog                | references | foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :dog
- has_one :application_form

## application_forms テーブル
| Column             | Type       | Option                 |
|--------------------|------------|------------------------|
| experience         | string     | NOT NULL               |
| care_take          | integer    | NOT NULL               |
| hope               | integer    | NOT NULL               |
| application_recode | references | foreign_key: true      |

### Association
- belongs_to :application_recode
- belongs_to :dog
- has_many :application_lists

## application_lists テーブル
| Column           | Type       | Option                 |
|------------------|------------|------------------------|
| user             | references | foreign_key            |
| application_form | references | foreign_key            |

### Association
- belongs_to :user
- belongs_to :application_form