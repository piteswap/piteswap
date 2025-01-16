<?php
return [
    'unique'               => ':attribute 존재했다',
    'accepted'             => ':attribute 허용',
    'active_url'           => ':attribute 합법적 인 URL이어야합니다.',
    'after'                => ':attribute 는 :date 일 이후의 날짜 여야합니다.',
    'alpha'                => ':attribute 는 모든 알파벳 문자로 구성해야합니다.',
    'alpha_dash'           => ':attribute 은 모든 문자, 숫자, 밑줄 또는 밑줄 문자로 구성되어야합니다.',
    'alpha_num'            => ':attribute 은 모든 문자와 숫자로 구성되어야합니다.',
    'array'                => ':attribute 은 배열이어야합니다.',
    'before'               => ':attribute 은 :date 이전의 날짜 여야합니다.',
    'between'              => [
        'numeric' => ':attribute 은 :min 과 :max 사이 여야합니다.',
        'file'    => ':attribute 은 :min 과 :max KB 사이 여야합니다.',
        'string'  => ':attribute 은 :min 과 :max 사이 여야합니다.',
        'array'   => ':attribute 은 :min 과 :max 사이 여야합니다.',
    ],
    'boolean'              => ':attribute 문자는 true 또는 false 이어야합니다.',
    'confirmed'            => ':attribute 두 번째 확인이 일치하지 않습니다',
    'date'                 => ':attribute 은 법적 날짜 여야합니다.',
    'date_format'          => ':attribute 은 주어진 형식 :format 과 일치하지 않습니다.',
    'different'            => ':attribute 은 :other 와 달라야합니다.',
    'digits'               => ':attribute 은 :digits 자리 여야합니다.',
    'digits_between'       => ':attribute 은 :min 과 :max 사이 여야합니다.',
    'email'                => ':attribute 은 법적 이메일 주소 여야합니다.',
    'filled'               => ':attribute 필드는 필수입니다',
    'exists'               => '선택한 :attribute 이 잘못되었습니다.',
    'image'                => ':attribute 은 이미지 여야합니다 (jpeg, png, bmp 또는 gif).',
    'in'                   => '선택한 :attribute 가 잘못되었습니다.',
    'integer'              => ':attribute 은 정수 여야합니다.',
    'ip'                   => ':attribute 은 유효한 IP 주소 여야합니다.',
    'max'                  => [
        'numeric' => ':attribute 의 최대 길이이다 :max 비트',
        'file'    => ':attribute 의 최대 값은 :max 이고',
        'string'  => ':attribute 의 최대 길이는 :max 자입니다.',
        'array'   => ':attribute 의 최대 수는 :max',
    ],
    'mimes'                => ':attribute 의 파일 유형은 :values 여야합니다.',
    'min'                  => [
        'numeric' => ':attribute 의 최소 길이는 :min 비트입니다.',
        'string'  => ':attribute 의 최소 길이는 :min 자입니다.',
        'file'    => ':attribute 크기는 최소 :min KB입니다.',
        'array'   => ':attribute 에는 최소한 :min 개의 항목이 있습니다.',
    ],
    'not_in'               => '선택한 :attribute 가 잘못되었습니다',
    'numeric'              => ':attribute 은 숫자 여야합니다.',
    'regex'                => ':attribute 형식이 잘못되었습니다.',
    'required'             => '필드 :attribute 을 채워야합니다.',
    'required_if'          => ':attribute 필드는 필수이며 :other 이 :value 인 경우',
    'required_with'        => ':attribute 필드는 필수이며 :values 가있는 경우',
    'required_with_all'    => ':values 개가있는 경우 :attribute 필드가 필요합니다.',
    'required_without'     => ':values가없는 경우 :attribute 필드가 필요합니다.',
    'required_without_all' => ':values 가없는 경우 :attribute 필드가 필요합니다.',
    'same'                 => ':attribute 과 :other 이 일치해야합니다.',
    'size'                 => [
        'numeric' => ':attribute 은 :size 자리 여야합니다.',
        'file'    => ':attribute 은 :size KB 여야합니다.',
        'string'  => ':attribute 은 :size 문자 여야합니다.',
        'array'   => ':attribute 은 :size 항목을 포함해야합니다.',
    ],
    'url'                  => ':attribute 잘못된 형식',
    'timezone'             => ':attribute 은 유효한 시간대 여야합니다.',
    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */
    'custom'               => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],
    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap attribute place-holders
    | with something more reader friendly such as E-Mail Address instead
    | of "email". This simply helps us make messages a little cleaner.
    |
    */
    'attributes'           => [
        'username' => '사용자 이름',
        'account'  => '계좌 번호',
        'captcha'  => '확인 코드',
        'mobile'   => '전화 번호',
        'password' => '암호',
        'content'  => '함유량',
        'identity' => '휴대폰 번호 / 사용자 이름',
    ],
];
