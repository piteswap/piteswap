<?php
return [
    'unique'               => ':attribute đã tồn tại',
    'accepted'             => ':attribute được chấp nhận',
    'active_url'           => ':attribute phải là một URL hợp pháp',
    'after'                => ':attribute phải là ngày sau :date',
    'alpha'                => ':attribute chỉ có thể được tạo thành bởi sự kết hợp của các chữ cái',
    'alpha_dash'           => ':attribute phải bao gồm các chữ cái, số, ký tự gạch dưới hoặc gạch dưới',
    'alpha_num'            => ':attribute phải bao gồm các chữ cái và số',
    'array'                => ':attribute phải là một mảng',
    'before'               => ':attribute phải là một ngày trước :date',
    'between'              => [
        'numeric' => ':attribute phải từ :min đến :max',
        'file'    => ':attribute phải từ :min đến :max KB',
        'string'  => ':attribute phải từ :min đến :max ký tự',
        'array'   => ':attribute phải nằm trong khoảng từ :min đến :max mục',
    ],
    'boolean'              => ' ký tự :attribute phải là true hoặc false',
    'confirmed'            => ':attribute xác minh thứ hai không khớp',
    'date'                 => ':attribute phải là một ngày hợp lệ',
    'date_format'          => ':attribute không khớp với :format định dạng đã cho',
    'different'            => ':attribute phải khác với :other',
    'digits'               => ':attribute phải là :digits chữ số',
    'digits_between'       => ':attribute phải từ :min đến :max',
    'email'                => ':attribute phải là một địa chỉ email hợp pháp.',
    'filled'               => 'Trường :attribute là bắt buộc',
    'exists'               => ':attribute đã chọn không hợp lệ',
    'image'                => ':attribute phải là một hình ảnh (jpeg, png, bmp hoặc gif)',
    'in'                   => 'Các lựa chọn :attribute không hợp lệ',
    'integer'              => ':attribute phải là một số nguyên',
    'ip'                   => ':attribute phải là địa chỉ IP hợp pháp.',
    'max'                  => [
        'numeric' => 'Độ dài tối đa của :attribute là :max chữ số',
        'file'    => 'Giá trị lớn nhất của :attribute là :max',
        'string'  => 'Độ dài tối đa của :attribute là :max ký tự',
        'array'   => 'Số :attribute tối đa là :max',
    ],
    'mimes'                => 'Loại tệp của :attribute phải là :values',
    'min'                  => [
        'numeric' => 'Độ dài tối thiểu của :attribute là :min chữ số',
        'string'  => 'Độ dài tối thiểu của :attribute là :min ký tự',
        'file'    => ':attribute kích thước ít nhất :min KB',
        'array'   => ':attribute có ít nhất :min mục',
    ],
    'not_in'               => ':attribute đã chọn không hợp lệ',
    'numeric'              => ':attribute phải là một số',
    'regex'                => 'định dạng :attribute không hợp lệ',
    'required'             => 'trường :attribute phải được điền',
    'required_if'          => 'Khi :other là :value, trường :attribute là bắt buộc',
    'required_with'        => 'Khi :values tồn tại, trường :attribute là bắt buộc',
    'required_with_all'    => 'Khi :values tồn tại, trường :attribute là bắt buộc',
    'required_without'     => 'Khi :values không tồn tại, trường :attribute là bắt buộc',
    'required_without_all' => 'Khi không tồn tại :values, trường :attribute là bắt buộc',
    'same'                 => ':attribute và :other phải khớp nhau',
    'size'                 => [
        'numeric' => ':attribute phải là :size chữ số',
        'file'    => ':attribute phải là :size KB',
        'string'  => ':attribute phải là :size ký tự',
        'array'   => ':attribute phải bao gồm :size mục nhập',
    ],
    'url'                  => ':attribute định dạng không hợp lệ',
    'timezone'             => ':attribute phải là múi giờ hợp lệ',
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
        'username' => 'tên người dùng',
        'account'  => 'số tài khoản',
        'captcha'  => 'Mã xác minh',
        'mobile'   => 'số điện thoại',
        'password' => 'mật khẩu',
        'content'  => 'Nội dung',
        'identity' => 'Số điện thoại di động / tên người dùng',
    ],
];
