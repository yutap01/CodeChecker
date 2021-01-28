CREATE TABLE T_AUTO_CAL_SWITCH_SETTING
(
    id_pc                           INT NOT NULL,
    auto_cal_switch_enabled_flg     TINYINT NOT NULL,
    operation_monitor_enabled_flg   TINYINT NOT NULL,
    unregistered_calmode_type       NVARCHAR(32) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_AUTO_CAL_SWITCH_SETTING
    ADD CONSTRAINT PK_T_AUTO_CAL_SWITCH_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_AUTO_CAL_SWITCH_REGISTRATION
(
    id_registration                 INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    registered_application_name     NVARCHAR(256) NOT NULL,
    registered_process_name         NVARCHAR(256) NOT NULL,
    registered_calmode_type         NVARCHAR(32) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_AUTO_CAL_SWITCH_REGISTRATION
    ADD CONSTRAINT PK_T_AUTO_CAL_SWITCH_REGISTRATION PRIMARY KEY  CLUSTERED (id_registration)
go
CREATE  INDEX IX_T_AUTO_CAL_SWITCH_REGISTRATION_ID_PC
    ON T_AUTO_CAL_SWITCH_REGISTRATION (id_pc)
go
CREATE TABLE T_BACKLIGHTMETER_LOG
(
    id_cal                          INT NOT NULL,
    operating_time                  INT NOT NULL,
    dt_execute                      DATETIMEOFFSET(2) NOT NULL,
    result                          SMALLINT NOT NULL,
    dt_create                       DATETIME DEFAULT (NULL) NULL,
    dt_update                       DATETIME DEFAULT (NULL) NULL
)
go
ALTER TABLE T_BACKLIGHTMETER_LOG
    ADD CONSTRAINT PK_T_BACKLIGHTMETER_LOG PRIMARY KEY  CLUSTERED (id_cal, operating_time)
go
CREATE TABLE T_BACKLIGHTMETER
(
    id_cal                          INT NOT NULL,
    no_backlightvalue               INT DEFAULT ((0)) NOT NULL,
    operating_time                  INT DEFAULT ((0)) NOT NULL,
    no_leatime                      INT DEFAULT (NULL) NULL,
    pwm_value                       INT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_BACKLIGHTMETER
    ADD CONSTRAINT PK_T_BACKLIGHTMETER PRIMARY KEY  CLUSTERED (id_cal, operating_time)
go
CREATE TABLE T_BACKLIGHT_SAVER
(
    id_pc                           INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL,
    except_monitor_maker            NVARCHAR(50) DEFAULT ('') NOT NULL,
    except_monitor_model            NVARCHAR(50) DEFAULT ('') NOT NULL,
    except_monitor_serial_no        NVARCHAR(50) DEFAULT ('') NOT NULL
)
go
ALTER TABLE T_BACKLIGHT_SAVER
    ADD CONSTRAINT PK_T_BACKLIGHT_SAVER PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_BACKLIGHT_SAVER_URL
(
    id_url                          INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    registered_url                  NVARCHAR(256) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_BACKLIGHT_SAVER_URL
    ADD CONSTRAINT PK_T_BACKLIGHT_SAVER_URL PRIMARY KEY  CLUSTERED (id_url)
go
CREATE  INDEX IX_T_BACKLIGHT_SAVER_URL_ID_PC
    ON T_BACKLIGHT_SAVER_URL (id_pc)
go
CREATE TABLE T_BACKLIGHT_SAVER_APPLICATION
(
    id_application                  INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    registered_application_name     NVARCHAR(256) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_BACKLIGHT_SAVER_APPLICATION
    ADD CONSTRAINT PK_T_BACKLIGHT_SAVER_APPLICATION PRIMARY KEY  CLUSTERED (id_application)
go
CREATE  INDEX IX_T_BACKLIGHT_SAVER_APPLICATION_ID_PC
    ON T_BACKLIGHT_SAVER_APPLICATION (id_pc)
go
CREATE TABLE T_CALMODE
(
    id_cal                          INT IDENTITY(1, 1) NOT NULL,
    id_mon                          INT NOT NULL,
    no_cal                          SMALLINT NOT NULL,
    cal_name                        NVARCHAR(10) NOT NULL,
    fl_manage                       TINYINT NOT NULL,
    id_update_user_fl_manage        INT DEFAULT (NULL) NULL,
    setupinfocomment                NVARCHAR(20) DEFAULT (NULL) NULL,
    comment                         NVARCHAR(1536) DEFAULT (NULL) NULL,
    cal_value                       INT NOT NULL,
    calmode_type                    NVARCHAR(32) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_CALMODE
    ADD CONSTRAINT PK_T_CALMODE PRIMARY KEY  CLUSTERED (id_cal)
go
CREATE  INDEX IX_T_CALMODE_ID_MON
    ON T_CALMODE (id_mon)
go
ALTER TABLE T_CALMODE
    ADD CONSTRAINT AK_monitor_calmode UNIQUE  (id_mon, no_cal)
go
CREATE TABLE T_DIN_TEST_REQUIREMENT
(
    id_pc                           INT NOT NULL,
    id_cal                          INT NOT NULL,
    inherit_result_flg              TINYINT DEFAULT ((1)) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_DIN_TEST_REQUIREMENT
    ADD CONSTRAINT PK_T_DIN_TEST_REQUIREMENT PRIMARY KEY  CLUSTERED (id_pc, id_cal)
go
CREATE TABLE T_EV_MONITOR_BRIGHTNESS_SETTING
(
    id_pc                           INT NOT NULL,
    fl_pc_enable                    TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_EV_MONITOR_BRIGHTNESS_SETTING
    ADD CONSTRAINT PK_T_EV_MONITOR_BRIGHTNESS_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_EV_MONITOR_BRIGHTNESS_REGISTRATION
(
    id_pc                           INT NOT NULL,
    id_mon                          INT NOT NULL,
    fl_monitor_enable               TINYINT NOT NULL,
    mouse_in_brightness             INT NOT NULL,
    mouse_out_brightness            INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_EV_MONITOR_BRIGHTNESS_REGISTRATION
    ADD CONSTRAINT PK_T_EV_MONITOR_BRIGHTNESS_REGISTRATION PRIMARY KEY  CLUSTERED (id_pc, id_mon)
go
CREATE TABLE T_FACILITY
(
    id_group                        INT NOT NULL,
    address                         NVARCHAR(128) NOT NULL,
    id_region                       NVARCHAR(2) NOT NULL,
    key_facility                    NVARCHAR(15) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_FACILITY
    ADD CONSTRAINT PK_T_FACILITY PRIMARY KEY  CLUSTERED (id_group)
go
CREATE TABLE T_FW_FILE
(
    model_name                      NVARCHAR(50) NOT NULL,
    system                          NVARCHAR(5) NOT NULL,
    controller                      NVARCHAR(5) NOT NULL,
    frontend                        NVARCHAR(5) NOT NULL,
    osd                             NVARCHAR(5) NOT NULL,
    fpga                            NVARCHAR(5) NOT NULL,
    file_name                       NVARCHAR(50) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_deploy                       DATETIMEOFFSET(2) NOT NULL
)
go
ALTER TABLE T_FW_FILE
    ADD CONSTRAINT PK_T_FW_FILE PRIMARY KEY  CLUSTERED (model_name)
go
CREATE TABLE T_GATEWAY
(
    id_group                        INT NOT NULL,
    uuid_organization               NVARCHAR(36) NOT NULL,
    address                         NVARCHAR(128) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_GATEWAY
    ADD CONSTRAINT PK_T_GATEWAY PRIMARY KEY  CLUSTERED (id_group)
go
CREATE TABLE T_GATEWAY_USAGE
(
    id_pc                           INT NOT NULL,
    gateway_usage_flg               TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_GATEWAY_USAGE
    ADD CONSTRAINT PK_T_GATEWAY_USAGE PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_GATEWAY_CONNECT
(
    id_pc                           INT NOT NULL,
    gateway_address                 NVARCHAR(32) NOT NULL,
    no_port                         INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_GATEWAY_CONNECT
    ADD CONSTRAINT PK_T_GATEWAY_CONNECT PRIMARY KEY  CLUSTERED (id_pc, gateway_address)
go
CREATE TABLE T_HANDS_OFF_ICS
(
    id_cal                          INT NOT NULL,
    operating_time                  INT NOT NULL,
    lcs_value_ddl56                 FLOAT(53) NOT NULL,
    lcs_value_ddl184                FLOAT(53) NOT NULL,
    lcs_value_ddl224                FLOAT(53) NOT NULL,
    lcs_value_ddl250                FLOAT(53) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_HANDS_OFF_ICS
    ADD CONSTRAINT PK_T_HANDS_OFF_ICS PRIMARY KEY  CLUSTERED (id_cal, operating_time)
go
CREATE TABLE T_HANDS_OFF
(
    id_cal                          INT NOT NULL,
    operating_time                  INT NOT NULL,
    ad_value                        INT NOT NULL,
    judgment                        SMALLINT NOT NULL,
    threshold                       INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_HANDS_OFF
    ADD CONSTRAINT PK_T_HANDS_OFF PRIMARY KEY  CLUSTERED (id_cal, operating_time)
go
CREATE TABLE T_HIDE_AND_SEEK_SETTING
(
    id_pc                           INT NOT NULL,
    hide_and_seek_flg               TINYINT DEFAULT ((0)) NOT NULL,
    transparent_window_display_flg  TINYINT DEFAULT ((1)) NOT NULL,
    pinp_screen_display_flg         TINYINT DEFAULT ((0)) NOT NULL,
    pinp_screen_hide_flg            TINYINT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_HIDE_AND_SEEK_SETTING
    ADD CONSTRAINT PK_T_HIDE_AND_SEEK_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_IMAGE_ROTATION_PLUS_SETTING
(
    id_pc                           INT NOT NULL,
    image_rotation_plus_flg         TINYINT NOT NULL,
    rotation_direction              SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_IMAGE_ROTATION_PLUS_SETTING
    ADD CONSTRAINT PK_T_IMAGE_ROTATION_PLUS_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_LEADATA_SELFCAL
(
    id_mon                          INT NOT NULL,
    operating_time                  INT NOT NULL,
    fl_timing                       TINYINT NOT NULL,
    default_timing                  INT NULL,
    lea_data                        IMAGE NOT NULL,
    monitor_usage_data              IMAGE NOT NULL,
    usage_section_number            INT NOT NULL,
    selected_lmax                   FLOAT(53) NULL,
    backlight_data                  IMAGE NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_LEADATA_SELFCAL
    ADD CONSTRAINT PK_T_LEADATA_SELFCAL PRIMARY KEY  CLUSTERED (id_mon, operating_time, fl_timing, usage_section_number)
go
CREATE TABLE T_PC_ALLOCATION_RULE
(
    id_rule                         INT IDENTITY(1, 1) NOT NULL,
    allocation_type                 SMALLINT NOT NULL,
    search_condition                SMALLINT NOT NULL,
    search_keyword                  NVARCHAR(64) DEFAULT ('') NOT NULL,
    id_group                        INT NOT NULL,
    comment                         NVARCHAR(50) DEFAULT ('') NOT NULL,
    fl_enable                       TINYINT NOT NULL,
    id_group_register               INT NOT NULL,
    id_user_register                INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_PC_ALLOCATION_RULE
    ADD CONSTRAINT PK_T_PC_ALLOCATION_RULE PRIMARY KEY  CLUSTERED (id_rule)
go
CREATE TABLE T_PC
(
    id_pc                           INT IDENTITY(1, 1) NOT NULL,
    nm_pc                           NVARCHAR(64) NOT NULL,
    ct_monitor                      SMALLINT DEFAULT ((1)) NOT NULL,
    ipaddr                          NVARCHAR(50) DEFAULT ('') NOT NULL,
    fl_enable                       TINYINT DEFAULT ((0)) NOT NULL,
    fl_registration                 TINYINT DEFAULT ((0)) NOT NULL,
    ver_major                       SMALLINT DEFAULT ((0)) NOT NULL,
    ver_minor                       SMALLINT DEFAULT ((0)) NOT NULL,
    ver_build                       SMALLINT DEFAULT ((0)) NOT NULL,
    ver_revision                    SMALLINT DEFAULT ((0)) NOT NULL,
    lang_radics                     SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL,
    id_gateway                      INT NOT NULL,
    id_room                         INT NOT NULL,
    platform_type                   SMALLINT DEFAULT ((0)) NOT NULL,
    nm_pc_manufacturer              NVARCHAR(50) DEFAULT ('') NOT NULL,
    nm_pc_model                     NVARCHAR(50) DEFAULT ('') NOT NULL,
    nm_pc_serial                    NVARCHAR(128) DEFAULT ('') NOT NULL,
    nm_platform_type                NVARCHAR(70) DEFAULT ('') NOT NULL
)
go
ALTER TABLE T_PC
    ADD CONSTRAINT PK_T_PC PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE  INDEX IX_T_PC_ID_GROUP
    ON T_PC (id_gateway)
go
CREATE TABLE T_LOG_CHANGE_PC_LOCATION
(
    id_pc                           INT NOT NULL,
    dt_change                       DATETIMEOFFSET(2) NOT NULL,
    id_group                        INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_LOG_CHANGE_PC_LOCATION
    ADD CONSTRAINT PK_T_LOG_CHANGE_PC_LOCATION PRIMARY KEY  CLUSTERED (id_pc, dt_change)
go
CREATE TABLE T_PCCONNECT
(
    id_pc                           INT NOT NULL,
    dt_access                       DATETIMEOFFSET(2) DEFAULT (NULL) NULL,
    fl_constate                     SMALLINT DEFAULT ((0)) NOT NULL,
    dt_usesituation                 DATETIMEOFFSET(2) NULL,
    fl_usesituation                 SMALLINT NULL,
    logon_user                      NVARCHAR(256) NULL
)
go
ALTER TABLE T_PCCONNECT
    ADD CONSTRAINT PK_T_PCCONNECT PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_PINP_SWITCH_POSITION
(
    id_pinp_switch                  INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    no_mon                          SMALLINT NOT NULL,
    pinp_switch_position            SMALLINT NOT NULL,
    pinp_switch_position_start_point_x INT NOT NULL,
    pinp_switch_position_start_point_y INT NOT NULL,
    pinp_switch_position_end_point_x INT NOT NULL,
    pinp_switch_position_end_point_y INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_PINP_SWITCH_POSITION
    ADD CONSTRAINT PK_T_PINP_SWITCH_POSITION PRIMARY KEY  CLUSTERED (id_pinp_switch)
go
CREATE  INDEX IX_T_PINP_SWITCH_POSITION_ID_PC
    ON T_PINP_SWITCH_POSITION (id_pc)
go
CREATE  INDEX IX_T_PINP_SWITCH_POSITION_NO_MON
    ON T_PINP_SWITCH_POSITION (no_mon)
go
CREATE TABLE T_PINP_REGISTRATION
(
    id_pc                           INT NOT NULL,
    no_mon                          SMALLINT NOT NULL,
    pinp_display_position           SMALLINT DEFAULT ((1)) NOT NULL,
    pinp_move_position_x            INT DEFAULT ((0)) NOT NULL,
    pinp_move_position_y            INT DEFAULT ((0)) NOT NULL,
    mouse_operation_flg             TINYINT DEFAULT ((1)) NOT NULL,
    pinp_switch_position            NVARCHAR(6) DEFAULT ((0)) NOT NULL,
    pinp_switch_timing              INT DEFAULT ((500)) NOT NULL,
    pinp_hot_key_flg                TINYINT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_PINP_REGISTRATION
    ADD CONSTRAINT PK_T_PINP_REGISTRATION PRIMARY KEY  CLUSTERED (id_pc, no_mon)
go
CREATE TABLE T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST
(
    id_pc                           INT NOT NULL,
    high_light_area_cal_mode_index  INT NOT NULL,
    high_light_area_cal_mode_value  INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST
    ADD CONSTRAINT PK_T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST PRIMARY KEY  CLUSTERED (id_pc, high_light_area_cal_mode_index)
go
CREATE TABLE T_POINT_AND_FOCUS_SETTING
(
    id_pc                           INT NOT NULL,
    point_and_focus_flg             TINYINT DEFAULT ((0)) NOT NULL,
    shape_type                      SMALLINT DEFAULT ((0)) NOT NULL,
    horizontal_flg                  TINYINT DEFAULT ((1)) NOT NULL,
    symmetrical_rectangle_flg       TINYINT DEFAULT ((1)) NOT NULL,
    rectangle_flg                   TINYINT DEFAULT ((1)) NOT NULL,
    distinguishes_pbyp_border_flg   TINYINT DEFAULT ((1)) NOT NULL,
    shape_horizontal_size           INT DEFAULT ((300)) NOT NULL,
    shape_rectangle_size            INT DEFAULT ((300)) NOT NULL,
    base_area_cal_mode              INT DEFAULT ((0)) NOT NULL,
    high_light_area_cal_mode        INT DEFAULT ((0)) NOT NULL,
    operation_fix                   TINYINT DEFAULT ((1)) NOT NULL,
    operation_fix_modifier_key      NVARCHAR(6) DEFAULT ((1)) NOT NULL,
    operation_remove                TINYINT DEFAULT ((1)) NOT NULL,
    operation_remove_modifier_key   NVARCHAR(6) DEFAULT ((2)) NOT NULL,
    operation_shape_switch          TINYINT DEFAULT ((1)) NOT NULL,
    operation_shape_switch_modifier_key NVARCHAR(6) DEFAULT ((2)) NOT NULL,
    operation_resize                TINYINT DEFAULT ((1)) NOT NULL,
    operation_resize_modifier_key   NVARCHAR(6) DEFAULT ((3)) NOT NULL,
    operation_cal_mode_switch       TINYINT DEFAULT ((0)) NOT NULL,
    operation_cal_mode_switch_modifier_key NVARCHAR(6) DEFAULT ((3)) NOT NULL,
    operation_display               TINYINT DEFAULT ((1)) NOT NULL,
    operation_display_modifier_key  NVARCHAR(6) DEFAULT ((3)) NOT NULL,
    preview_timeout                 INT DEFAULT ((3000)) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POINT_AND_FOCUS_SETTING
    ADD CONSTRAINT PK_T_POINT_AND_FOCUS_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_PROVIDER
(
    id_group                        INT NOT NULL,
    id_provider                     NVARCHAR(15) NOT NULL,
    address                         NVARCHAR(128) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_PROVIDER
    ADD CONSTRAINT PK_T_PROVIDER PRIMARY KEY  CLUSTERED (id_group)
go
CREATE TABLE T_QCGUIDELINE_SYSTEM_VERSION
(
    id_qcguideline_system_version   INT IDENTITY(1, 1) NOT NULL,
    version_radics                  NVARCHAR(15) NOT NULL,
    id_qcguideline                  INT NOT NULL,
    version_qcguideline             INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE_SYSTEM_VERSION
    ADD CONSTRAINT PK_T_QCGUIDELINE_SYSTEM_VERSION PRIMARY KEY  CLUSTERED (id_qcguideline_system_version)
go
ALTER TABLE T_QCGUIDELINE_SYSTEM_VERSION
    ADD CONSTRAINT AX_radics_qcguideline UNIQUE  (version_radics, id_qcguideline)
go
CREATE TABLE T_QCGUIDELINE_TYPE
(
    id_qcguideline                  INT NOT NULL,
    type_qcguidelne                 NVARCHAR(128) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE_TYPE
    ADD CONSTRAINT PK_T_QCGUIDELINE_TYPE PRIMARY KEY  CLUSTERED (id_qcguideline, type_qcguidelne)
go
CREATE TABLE T_QCGUIDELINE_PLUGIN_VERSION
(
    qcguideline_plugin_version      INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE_PLUGIN_VERSION
    ADD CONSTRAINT PK_T_QCGUIDELINE_PLUGIN_VERSION PRIMARY KEY  CLUSTERED (qcguideline_plugin_version)
go
CREATE TABLE T_QCGUIDELINE_TEST_INFO
(
    id_qcguideline                  INT NOT NULL,
    version                         INT NOT NULL,
    task_type                       SMALLINT NOT NULL,
    task_seq                        INT NOT NULL,
    execute_pattern                 SMALLINT NULL,
    execute_interval                SMALLINT NULL,
    support_sensor_type             SMALLINT NOT NULL,
    enable_lamb_setting_flg         TINYINT NOT NULL,
    enable_baseline_setting_flg     TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE_TEST_INFO
    ADD CONSTRAINT PK_T_QCGUIDELINE_TEST_INFO PRIMARY KEY  CLUSTERED (id_qcguideline, version, task_type, task_seq)
go
CREATE TABLE T_QCGUIDELINE_TEST
(
    id_qcguideline                  INT NOT NULL,
    version                         INT NOT NULL,
    task_type                       SMALLINT NOT NULL,
    task_seq                        INT NOT NULL,
    language                        NVARCHAR(10) NOT NULL,
    json_test                       NVARCHAR(MAX) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE_TEST
    ADD CONSTRAINT PK_T_QCGUIDELINE_TEST PRIMARY KEY  CLUSTERED (id_qcguideline, version, task_type, task_seq, language)
go
CREATE TABLE T_QCGUIDELINE_TEST_NAME
(
    id_qcguideline_test_name        INT IDENTITY(1, 1) NOT NULL,
    id_qcguideline                  INT NOT NULL,
    version                         INT NOT NULL,
    task_type                       SMALLINT NOT NULL,
    task_seq                        INT NOT NULL,
    language                        NVARCHAR(10) NOT NULL,
    test_name                       NVARCHAR(64) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE_TEST_NAME
    ADD CONSTRAINT PK_T_QCGUIDELINE_TEST_NAME PRIMARY KEY  CLUSTERED (id_qcguideline_test_name)
go
ALTER TABLE T_QCGUIDELINE_TEST_NAME
    ADD CONSTRAINT AK_qcguideline_test_name UNIQUE  (id_qcguideline, version, task_type, task_seq, language)
go
CREATE TABLE T_QCGUIDELINE
(
    id_qcguideline                  INT NOT NULL,
    type                            SMALLINT NOT NULL,
    fl_legacy                       TINYINT NOT NULL,
    supported_inch_size             FLOAT(53) NULL,
    supported_resolution_x          INT NULL,
    supported_resolution_y          INT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE
    ADD CONSTRAINT PK_T_QCGUIDELINE PRIMARY KEY  CLUSTERED (id_qcguideline)
go
CREATE TABLE T_QCGUIDELINE_REGION
(
    id_region                       NVARCHAR(2) NOT NULL,
    type_qcguidelne                 NVARCHAR(10) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE_REGION
    ADD CONSTRAINT PK_T_QCGUIDELINE_REGION PRIMARY KEY  CLUSTERED (id_region)
go
CREATE TABLE T_QCGUIDELINE_NAME
(
    id_qcguideline_name             INT IDENTITY(1, 1) NOT NULL,
    id_qcguideline                  INT NOT NULL,
    version                         INT NOT NULL,
    language                        NVARCHAR(10) NOT NULL,
    short_name                      NVARCHAR(256) NOT NULL,
    long_name                       NVARCHAR(512) NOT NULL,
    main_name                       NVARCHAR(256) NOT NULL,
    category_name                   NVARCHAR(256) NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_QCGUIDELINE_NAME
    ADD CONSTRAINT PK_T_QCGUIDELINE_NAME PRIMARY KEY  CLUSTERED (id_qcguideline_name)
go
ALTER TABLE T_QCGUIDELINE_NAME
    ADD CONSTRAINT AK_qcguideline_name UNIQUE  (id_qcguideline, version, language)
go
CREATE TABLE T_CORE_CONFIG
(
    id_pc                           INT NOT NULL,
    radinetpro_sequence_interval    INT DEFAULT 1440 NOT NULL,
    radinetpro_connection_notice_interval INT DEFAULT 60 NOT NULL,
    backlight_meter_threshold       SMALLINT DEFAULT 10 NOT NULL,
    baseline_value_lamb_threshold_others FLOAT(53) DEFAULT 0.3 NOT NULL,
    monitor_detection_manage_flg    TINYINT DEFAULT 0 NOT NULL,
    startup_monitor_detection_flg   TINYINT DEFAULT 1 NOT NULL,
    auto_registration_information_flg TINYINT DEFAULT 1 NOT NULL,
    report_lang                     SMALLINT DEFAULT 0 NOT NULL,
    lea_noise_deleting_threshold    INT DEFAULT 10 NOT NULL,
    backlight_sensor_ad_threshold   INT DEFAULT 5 NOT NULL,
    illuminance_correlation_threshold FLOAT(53) DEFAULT 10 NOT NULL,
    illuminance_correlation_coefficient_min FLOAT(53) DEFAULT 0.5 NOT NULL,
    illuminance_correlation_coefficient_max FLOAT(53) DEFAULT 1.5 NOT NULL,
    ambient_luminance_correlation_threshold FLOAT(53) DEFAULT 0.05 NOT NULL,
    ambient_luminance_correlation_coefficient_min FLOAT(53) DEFAULT 0.5 NOT NULL,
    ambient_luminance_correlation_coefficient_max FLOAT(53) DEFAULT 2 NOT NULL,
    baseline_value_lamb_threshold_din6868_157 FLOAT(53) DEFAULT 0.2 NOT NULL,
    selfqc_history_flg              TINYINT DEFAULT 0 NOT NULL,
    forced_termination_standby_time INT DEFAULT 60 NOT NULL,
    forced_termination_condition_monitoring_time INT DEFAULT 60 NOT NULL,
    cancel_ambient_illuminance_flg  TINYINT DEFAULT 0 NOT NULL,
    lang                            SMALLINT NOT NULL,
    log_level                       SMALLINT NOT NULL,
    fl_remote_sensor_priority       TINYINT NOT NULL,
    fl_display_ambient              TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_CORE_CONFIG
    ADD CONSTRAINT PK_T_CORE_CONFIG PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_RADICS_GATEWAY
(
    id_radics_gateway               INT IDENTITY(1, 1) NOT NULL,
    nm_radics_gateway               NVARCHAR(64) NOT NULL,
    ipaddr                          NVARCHAR(15) NOT NULL,
    fl_use_gateway                  TINYINT NOT NULL,
    no_port                         INT NOT NULL,
    proxy_type                      SMALLINT NOT NULL,
    fl_auto_detect                  TINYINT NOT NULL,
    proxy_address                   NVARCHAR(64) NOT NULL,
    proxy_port                      INT NULL,
    fl_authentication               TINYINT NOT NULL,
    id_gateway                      INT NOT NULL,
    dt_first_access                 DATETIMEOFFSET(2) NOT NULL,
    dt_last_access                  DATETIMEOFFSET(2) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_RADICS_GATEWAY
    ADD CONSTRAINT PK_T_RADICS_GATEWAY PRIMARY KEY  CLUSTERED (id_radics_gateway)
go
CREATE  INDEX IX_T_RADICS_GATEWAY_ID_GATEWAY
    ON T_RADICS_GATEWAY (id_gateway)
go
CREATE TABLE T_RADICS_VERSION
(
    radics_version                  NVARCHAR(15) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_RADICS_VERSION
    ADD CONSTRAINT PK_T_RADICS_VERSION PRIMARY KEY  CLUSTERED (radics_version)
go
CREATE TABLE T_RADILIGHT
(
    no_serial                       NVARCHAR(16) NOT NULL,
    id_pc                           INT NOT NULL,
    id_lastpc                       INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_RADILIGHT
    ADD CONSTRAINT PK_T_RADILIGHT PRIMARY KEY  CLUSTERED (no_serial)
go
CREATE  INDEX IX_T_RADILIGHT_ID_PC
    ON T_RADILIGHT (id_pc)
go
CREATE  INDEX IX_T_RADILIGHT_ID_LASTPC
    ON T_RADILIGHT (id_lastpc)
go
CREATE TABLE T_SWINGSENSOR
(
    id_sensor                       INT IDENTITY(1, 1) NOT NULL,
    model                           NVARCHAR(32) NOT NULL,
    serial                          NVARCHAR(64) NOT NULL,
    kd_type                         SMALLINT NOT NULL,
    fl_enable                       TINYINT DEFAULT ((1)) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_SWINGSENSOR
    ADD CONSTRAINT PK_T_SWINGSENSOR PRIMARY KEY  CLUSTERED (id_sensor)
go
CREATE TABLE T_SWITCH_AND_GO_DETECTED_POSITION
(
    id_switch_and_go_detected_position INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    detected_position               SMALLINT DEFAULT ((0)) NOT NULL,
    detected_position_start_point_x INT DEFAULT ((0)) NOT NULL,
    detected_position_start_point_y INT DEFAULT ((0)) NOT NULL,
    detected_position_end_point_x   INT DEFAULT ((0)) NOT NULL,
    detected_position_end_point_y   INT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_SWITCH_AND_GO_DETECTED_POSITION
    ADD CONSTRAINT PK_T_SWITCH_AND_GO_DETECTED_POSITION PRIMARY KEY  CLUSTERED (id_switch_and_go_detected_position)
go
CREATE  INDEX IX_T_SWITCH_AND_GO_DETECTED_POSITION_ID_PC
    ON T_SWITCH_AND_GO_DETECTED_POSITION (id_pc)
go
CREATE TABLE T_SWITCH_AND_GO_SETTING
(
    id_pc                           INT NOT NULL,
    switch_and_go_flg               TINYINT DEFAULT ((0)) NOT NULL,
    correspondence_monitor_model    NVARCHAR(50) DEFAULT ('') NOT NULL,
    correspondence_monitor_serial   NVARCHAR(50) DEFAULT ('') NOT NULL,
    mouse_operation_flg             TINYINT DEFAULT ((1)) NOT NULL,
    detected_position_target_monitor_type SMALLINT DEFAULT ((0)) NOT NULL,
    detected_position_target_monitor_model NVARCHAR(50) DEFAULT ('') NOT NULL,
    detected_position_target_monitor_serial NVARCHAR(50) DEFAULT ('') NOT NULL,
    switch_timing                   INT DEFAULT ((500)) NOT NULL,
    hot_key_flg                     TINYINT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_SWITCH_AND_GO_SETTING
    ADD CONSTRAINT PK_T_SWITCH_AND_GO_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_USB_CONNECTION_STATUS
(
    id_mon                          INT NOT NULL,
    id_source_pc                    INT NOT NULL,
    dt_usb_error_alert_utc          DATETIME DEFAULT (NULL) NULL,
    dt_usb_status_utc               DATETIME NOT NULL,
    fl_usb_status                   SMALLINT NOT NULL,
    fl_alert_confirmed              TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_USB_CONNECTION_STATUS
    ADD CONSTRAINT PK_T_USB_CONNECTION_STATUS PRIMARY KEY  CLUSTERED (id_mon)
go
CREATE TABLE T_ACTIVATION
(
    id_activation                   INT IDENTITY(1, 1) NOT NULL,
    controllable_monitors           INT NOT NULL,
    monitor_threshold               INT NOT NULL,
    grace_days                      INT NOT NULL,
    validation                      NVARCHAR(64) NOT NULL,
    dt_excess                       DATETIME DEFAULT (NULL) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_ACTIVATION
    ADD CONSTRAINT PK_T_ACTIVATION PRIMARY KEY  CLUSTERED (id_activation)
go
CREATE TABLE T_ACCEPT_ALERT_SCOPE
(
    id_user                         INT NOT NULL,
    data_accept_scope               IMAGE NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_ACCEPT_ALERT_SCOPE
    ADD CONSTRAINT PK_T_ACCEPT_ALERT_SCOPE PRIMARY KEY  CLUSTERED (id_user)
go
CREATE TABLE T_CARD_LUT_DATA
(
    id_mon                          INT NOT NULL,
    lut_data_index                  SMALLINT NOT NULL,
    red                             FLOAT(53) NOT NULL,
    green                           FLOAT(53) NOT NULL,
    blue                            FLOAT(53) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_CARD_LUT_DATA
    ADD CONSTRAINT PK_T_CARD_LUT_DATA PRIMARY KEY  CLUSTERED (id_mon, lut_data_index)
go
CREATE TABLE T_CARD_LUT_SETUP
(
    id_mon                          INT NOT NULL,
    card_lut_setup_status_flag      TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_CARD_LUT_SETUP
    ADD CONSTRAINT PK_T_CARD_LUT_SETUP PRIMARY KEY  CLUSTERED (id_mon)
go
CREATE TABLE T_CALIBRATION_UNSUPPORTED_MODE
(
    id_mon                          INT NOT NULL,
    no_cal                          SMALLINT NOT NULL,
    cal_name                        NVARCHAR(10) NOT NULL,
    cal_value                       INT NOT NULL,
    calmode_type                    NVARCHAR(32) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_CALIBRATION_UNSUPPORTED_MODE
    ADD CONSTRAINT PK_T_CALIBRATION_UNSUPPORTED_MODE PRIMARY KEY  CLUSTERED (id_mon, no_cal)
go
CREATE TABLE T_CALIBRATION
(
    id_cal                          INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL,
    fl_use_external_sensor          TINYINT DEFAULT ((0)) NOT NULL,
    fl_post_measurement             TINYINT DEFAULT ((0)) NOT NULL,
    target_lmax                     FLOAT(53) NOT NULL,
    target_lmin                     FLOAT(53) NOT NULL,
    measurement_level               SMALLINT NOT NULL,
    fl_use_measurement_lmin         TINYINT NOT NULL,
    color_temperature               SMALLINT NOT NULL,
    color_x                         FLOAT(53) DEFAULT (NULL) NULL,
    color_y                         FLOAT(53) DEFAULT (NULL) NULL,
    fl_luminance_lifetime_priority  TINYINT DEFAULT ((0)) NOT NULL,
    display_function                SMALLINT NOT NULL,
    fl_use_lamb                     TINYINT NOT NULL,
    exp_value                       FLOAT(53) NOT NULL,
    id_update_user                  INT DEFAULT (NULL) NULL,
    fl_use_policy                   TINYINT DEFAULT ((0)) NOT NULL
)
go
ALTER TABLE T_CALIBRATION
    ADD CONSTRAINT PK_T_CALIBRATION PRIMARY KEY  CLUSTERED (id_cal)
go
CREATE TABLE T_GRAPHICS_CARD
(
    id_pc                           INT NOT NULL,
    no_screen                       SMALLINT NOT NULL,
    card_name                       NVARCHAR(256) NOT NULL,
    card_maker                      NVARCHAR(256) NOT NULL,
    serial_no                       NVARCHAR(16) NOT NULL,
    driver_name                     NVARCHAR(256) NOT NULL,
    driver_version                  NVARCHAR(64) NOT NULL,
    dt_buy                          DATE NOT NULL,
    id_slot                         NVARCHAR(512) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_GRAPHICS_CARD
    ADD CONSTRAINT PK_T_GRAPHICS_CARD PRIMARY KEY  CLUSTERED (id_pc, no_screen)
go
CREATE TABLE T_GROUP
(
    id_group                        INT IDENTITY(1, 1) NOT NULL,
    group_name                      NVARCHAR(128) NOT NULL,
    group_type                      SMALLINT DEFAULT ((1)) NOT NULL,
    status                          TINYINT DEFAULT ((1)) NOT NULL,
    no_positionleft                 INT NOT NULL,
    no_positionright                INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_GROUP
    ADD CONSTRAINT PK_T_GROUP PRIMARY KEY  CLUSTERED (id_group)
go
CREATE  INDEX IX_T_GROUP_NO_POSITION
    ON T_GROUP (no_positionleft, no_positionright)
go
CREATE TABLE T_CORRELATION
(
    id_mon                          INT NOT NULL,
    id_sensor                       INT NOT NULL,
    correlation_data                NVARCHAR(MAX) NOT NULL,
    dt_execution                    DATE NULL,
    measurement_level               SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_CORRELATION
    ADD CONSTRAINT PK_T_CORRELATION PRIMARY KEY  CLUSTERED (id_mon, id_sensor)
go
CREATE TABLE T_SYS
(
    fl_mail                         TINYINT NOT NULL,
    nm_mailserver                   NVARCHAR(256) DEFAULT (NULL) NULL,
    senderaddr                      NVARCHAR(256) DEFAULT (NULL) NULL,
    nm_url                          NVARCHAR(256) NOT NULL,
    backlightmeter_threshold        INT DEFAULT 20 NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
CREATE TABLE T_JOB_MANAGE
(
    id_pc                           INT NOT NULL,
    no_job                          INT NOT NULL,
    no_monitor                      SMALLINT NULL,
    no_cal                          SMALLINT NULL,
    task_type                       SMALLINT NOT NULL,
    task_parameter                  NVARCHAR(100) NOT NULL,
    execution_method_type           SMALLINT NOT NULL,
    scheduled_execution_date        DATETIMEOFFSET(2) NULL,
    execution_timing                SMALLINT NOT NULL,
    execution_date                  DATETIMEOFFSET(2) NULL,
    tester_name                     NVARCHAR(32) NOT NULL,
    execution_status                SMALLINT NOT NULL,
    progress                        TINYINT NOT NULL,
    fl_cancel                       TINYINT NOT NULL,
    dt_cancel                       DATETIMEOFFSET(2) NULL,
    error_code                      TINYINT NOT NULL,
    fl_fix_remote_execution         TINYINT NOT NULL,
    dt_job_create                   DATETIMEOFFSET(2) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_JOB_MANAGE
    ADD CONSTRAINT PK_T_JOB_MANAGE PRIMARY KEY  CLUSTERED (id_pc, no_job)
go
CREATE TABLE T_SCHEDULE_APPLICATION
(
    id_application                  INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    registered_application_name     NVARCHAR(256) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_SCHEDULE_APPLICATION
    ADD CONSTRAINT PK_T_SCHEDULE_APPLICATION PRIMARY KEY  CLUSTERED (id_application)
go
CREATE  INDEX IX_T_SCHEDULE_APPLICATION_ID_PC
    ON T_SCHEDULE_APPLICATION (id_pc)
go
CREATE TABLE T_SENSOR_SETTING
(
    id_pc                           INT NOT NULL,
    fl_lx_plus_enable               TINYINT DEFAULT ((0)) NOT NULL,
    fl_cd_lux_enable                TINYINT DEFAULT ((0)) NOT NULL,
    fl_ls_100_enable                TINYINT DEFAULT ((0)) NOT NULL,
    fl_ssm_enable                   TINYINT DEFAULT ((0)) NOT NULL,
    fl_manual_enable                TINYINT DEFAULT ((0)) NOT NULL,
    sensor_serial_ls_100            NVARCHAR(16) DEFAULT ('') NOT NULL,
    sensor_model_manual             NVARCHAR(16) DEFAULT ('') NOT NULL,
    sensor_serial_manual            NVARCHAR(16) DEFAULT ('') NOT NULL,
    fl_chromaticity_measurement_enable TINYINT DEFAULT ((0)) NOT NULL,
    sensor_serial_cd_lux            NVARCHAR(16) DEFAULT ('') NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_SENSOR_SETTING
    ADD CONSTRAINT PK_T_SENSOR_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_ALERT_TASK
(
    id_his                          BIGINT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_ALERT_TASK
    ADD CONSTRAINT PK_T_ALERT_TASK PRIMARY KEY  CLUSTERED (id_his)
go
CREATE TABLE T_PASSWORD
(
    id_pc                           INT NOT NULL,
    advanced_mode_password          NVARCHAR(64) NOT NULL,
    maintenance_mode_password       NVARCHAR(64) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_PASSWORD
    ADD CONSTRAINT PK_T_PASSWORD PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_PRESET_PATTERN
(
    id_preset_file                  INT IDENTITY(1, 1) NOT NULL,
    pattern_name                    NVARCHAR(256) NULL,
    fl_reverse                      TINYINT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NULL
)
go
ALTER TABLE T_PRESET_PATTERN
    ADD CONSTRAINT PK_T_PRESET_PATTERN PRIMARY KEY  CLUSTERED (id_preset_file)
go
CREATE TABLE T_HOTKEY_SETTING
(
    id_hotkey                       INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    function_name                   SMALLINT NOT NULL,
    no_monitor                      SMALLINT NOT NULL,
    nm_model                        NVARCHAR(50) NOT NULL,
    no_serial                       NVARCHAR(50) NOT NULL,
    modifier_key                    SMALLINT NOT NULL,
    virtual_key                     NVARCHAR(4) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_HOTKEY_SETTING
    ADD CONSTRAINT PK_T_HOTKEY_SETTING PRIMARY KEY  CLUSTERED (id_hotkey)
go
CREATE  INDEX IX_T_HOTKEY_SETTING_ID_PC
    ON T_HOTKEY_SETTING (id_pc)
go
CREATE  INDEX IX_T_HOTKEY_SETTING_FUNCTION_NAME
    ON T_HOTKEY_SETTING (function_name)
go
CREATE TABLE T_POLICY_GROUP_SET
(
    id_group                        INT NOT NULL,
    policy_type                     SMALLINT NOT NULL,
    id_policy                       INT NOT NULL,
    id_user_set                     INT NOT NULL,
    id_group_set_origin             INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_GROUP_SET
    ADD CONSTRAINT PK_T_POLICY_GROUP_SET PRIMARY KEY  CLUSTERED (id_group, policy_type, id_policy)
go
CREATE TABLE T_POLICY_BACKLIGHT_SAVER
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    fl_enable                       TINYINT NOT NULL,
    backlightsaver_type             SMALLINT NOT NULL,
    screensaver_interlocking_type   SMALLINT NOT NULL,
    waitingtime_screensaver         SMALLINT NOT NULL,
    fl_specify_url_enable           TINYINT NOT NULL,
    waitingtime_absencejudgement    SMALLINT NOT NULL,
    fl_lowbrightness_enable         TINYINT NOT NULL,
    reductionrate_lowbrightness     SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_BACKLIGHT_SAVER
    ADD CONSTRAINT PK_T_POLICY_BACKLIGHT_SAVER PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_EIZO_MONITOR_SETTING
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    led_flg                         TINYINT NOT NULL,
    keylock_type                    SMALLINT NOT NULL,
    json_detail                     NVARCHAR(MAX) DEFAULT (NULL) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_EIZO_MONITOR_SETTING
    ADD CONSTRAINT PK_T_POLICY_EIZO_MONITOR_SETTING PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_QCGUIDELINE_CUSTOM
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    id_qcguideline                  INT NOT NULL,
    version                         INT NOT NULL,
    qcguideline_plugin_version      INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIMEOFFSET(2) NOT NULL
)
go
ALTER TABLE T_POLICY_QCGUIDELINE_CUSTOM
    ADD CONSTRAINT PK_T_POLICY_QCGUIDELINE_CUSTOM PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_QC_BASIC_SETTING
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    id_rec                          INT NOT NULL,
    id_cons                         INT NOT NULL,
    id_room_class_rec               INT DEFAULT (NULL) NULL,
    id_room_class_cons              INT DEFAULT (NULL) NULL,
    fl_multimonitor                 TINYINT NOT NULL,
    fl_reset_base_value             TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_QC_BASIC_SETTING
    ADD CONSTRAINT PK_T_POLICY_QC_BASIC_SETTING PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_RADICS_UPDATE
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    update_type                     SMALLINT NOT NULL,
    monday_execute_flg              TINYINT NOT NULL,
    tuesday_execute_flg             TINYINT NOT NULL,
    wednesday_execute_flg           TINYINT NOT NULL,
    thursday_execute_flg            TINYINT NOT NULL,
    friday_execute_flg              TINYINT NOT NULL,
    saturday_execute_flg            TINYINT NOT NULL,
    sunday_execute_flg              TINYINT NOT NULL,
    start_hour                      SMALLINT NOT NULL,
    start_minutes                   SMALLINT NOT NULL,
    end_hour                        SMALLINT NOT NULL,
    end_minutes                     SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_RADICS_UPDATE
    ADD CONSTRAINT PK_T_POLICY_RADICS_UPDATE PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_CALIBRATION
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    target_lmax                     FLOAT(53) NOT NULL,
    target_lmin                     FLOAT(53) NOT NULL,
    fl_use_measurement_lmin         TINYINT NOT NULL,
    color_temperature               SMALLINT NOT NULL,
    color_x                         FLOAT(53) DEFAULT (NULL) NULL,
    color_y                         FLOAT(53) DEFAULT (NULL) NULL,
    display_function                SMALLINT NOT NULL,
    fl_use_lamb                     TINYINT NOT NULL,
    exp_value                       FLOAT(53) NOT NULL,
    fl_use_external_sensor          TINYINT DEFAULT ((0)) NOT NULL,
    fl_post_measurement             TINYINT DEFAULT ((0)) NOT NULL,
    fl_luminance_lifetime_priority  TINYINT DEFAULT ((0)) NOT NULL,
    measurement_level               SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_CALIBRATION
    ADD CONSTRAINT PK_T_POLICY_CALIBRATION PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_SCHEDULE
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    scheduler_execute_flg           TINYINT NOT NULL,
    policy                          SMALLINT NOT NULL,
    start_presense_flg              TINYINT NOT NULL,
    regular_presense_flg            TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_SCHEDULE
    ADD CONSTRAINT PK_T_POLICY_SCHEDULE PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_SCHEDULE_DETAIL
(
    id_policy                       INT NOT NULL,
    task_type                       SMALLINT NOT NULL,
    execute_pattern                 SMALLINT NOT NULL,
    execute_flg                     TINYINT NOT NULL,
    schedule_type                   SMALLINT NOT NULL,
    execute_base_hour               SMALLINT NOT NULL,
    execute_base_minute             SMALLINT NOT NULL,
    execute_interval                INT NOT NULL,
    execute_base_month              SMALLINT NOT NULL,
    execute_base_year               SMALLINT NOT NULL,
    auto_execute_flg                TINYINT NOT NULL,
    alert_time_period               INT NOT NULL,
    recalibration_after_failure_flg TINYINT NOT NULL,
    monday_execute_flg              TINYINT NOT NULL,
    tuesday_execute_flg             TINYINT NOT NULL,
    wednesday_execute_flg           TINYINT NOT NULL,
    thursday_execute_flg            TINYINT NOT NULL,
    friday_execute_flg              TINYINT NOT NULL,
    saturday_execute_flg            TINYINT NOT NULL,
    sunday_execute_flg              TINYINT NOT NULL,
    execute_date_pattern            SMALLINT NOT NULL,
    execute_date                    SMALLINT NOT NULL,
    execute_week                    SMALLINT NOT NULL,
    execute_day_of_the_week         SMALLINT NOT NULL,
    execute_month                   SMALLINT NOT NULL,
    execute_month_day_of_the_week   SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_SCHEDULE_DETAIL
    ADD CONSTRAINT PK_T_POLICY_SCHEDULE_DETAIL PRIMARY KEY  CLUSTERED (id_policy, task_type)
go
CREATE TABLE T_POLICY_QCGUIDELINE_TEST
(
    id_policy                       INT NOT NULL,
    task_type                       SMALLINT NOT NULL,
    task_seq                        INT NOT NULL,
    json_custom_test                NVARCHAR(MAX) NOT NULL,
    support_sensor_type             SMALLINT NOT NULL,
    enable_lamb_setting_flg         TINYINT NOT NULL,
    enable_baseline_setting_flg     TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_QCGUIDELINE_TEST
    ADD CONSTRAINT PK_T_POLICY_QCGUIDELINE_TEST PRIMARY KEY  CLUSTERED (id_policy, task_type, task_seq)
go
CREATE TABLE T_POLICY_POWER_INTERLOCK_SETTING
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    power_interlock_flg             TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_POWER_INTERLOCK_SETTING
    ADD CONSTRAINT PK_T_POLICY_POWER_INTERLOCK_SETTING PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_REGISTRATION
(
    id_policy                       INT IDENTITY(1, 1) NOT NULL,
    orgnization_value               NVARCHAR(128) NOT NULL,
    address_value                   NVARCHAR(128) NOT NULL,
    phone_number_value              NVARCHAR(128) NOT NULL,
    administrator_value             NVARCHAR(128) NOT NULL,
    service_provider_value          NVARCHAR(128) NOT NULL,
    item_name1                      NVARCHAR(50) NOT NULL,
    item_name2                      NVARCHAR(50) NOT NULL,
    item_name3                      NVARCHAR(50) NOT NULL,
    item_name4                      NVARCHAR(50) NOT NULL,
    item_name5                      NVARCHAR(50) NOT NULL,
    item_name6                      NVARCHAR(50) NOT NULL,
    item_name7                      NVARCHAR(50) NOT NULL,
    item_name8                      NVARCHAR(50) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_REGISTRATION
    ADD CONSTRAINT PK_T_POLICY_REGISTRATION PRIMARY KEY  CLUSTERED (id_policy)
go
CREATE TABLE T_POLICY_SETTING
(
    policy_type                     SMALLINT NOT NULL,
    id_policy                       INT NOT NULL,
    nm_policy_setting               NVARCHAR(50) NOT NULL,
    condition_model                 NVARCHAR(50) DEFAULT (NULL) NULL,
    condition_calno                 SMALLINT DEFAULT (NULL) NULL,
    id_user_register                INT NOT NULL,
    id_group_register               INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_SETTING
    ADD CONSTRAINT PK_T_POLICY_SETTING PRIMARY KEY  CLUSTERED (policy_type, id_policy)
go
CREATE TABLE T_POLICY_SETTING_NOTICE
(
    id_room                         INT NOT NULL,
    dt_policy_update                DATETIMEOFFSET(2) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_POLICY_SETTING_NOTICE
    ADD CONSTRAINT PK_T_POLICY_SETTING_NOTICE PRIMARY KEY  CLUSTERED (id_room)
go
CREATE TABLE T_MOUSE_POINTER_MOVE_SETTING
(
    id_pc                           INT NOT NULL,
    multimonitor_move_flg           TINYINT NOT NULL,
    warp_move_flg                   TINYINT NOT NULL,
    home_position_move_flg          TINYINT NOT NULL,
    display_position_flg            TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_MOUSE_POINTER_MOVE_SETTING
    ADD CONSTRAINT PK_T_MOUSE_POINTER_MOVE_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_MONITOR_FW
(
    id_monitor                      INT NOT NULL,
    system                          NVARCHAR(5) NOT NULL,
    controller                      NVARCHAR(5) NOT NULL,
    osd                             NVARCHAR(5) NOT NULL,
    frontend                        NVARCHAR(5) NOT NULL,
    fpga                            NVARCHAR(5) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_MONITOR_FW
    ADD CONSTRAINT PK_T_MONITOR_FW PRIMARY KEY  CLUSTERED (id_monitor)
go
CREATE TABLE T_FILTER_MONITOR_MODEL
(
    id_filter_monitor_model         INT IDENTITY(1, 1) NOT NULL,
    model_name                      NVARCHAR(50) DEFAULT ('') NOT NULL,
    monitor_type                    SMALLINT NOT NULL
)
go
ALTER TABLE T_FILTER_MONITOR_MODEL
    ADD CONSTRAINT PK_T_TARGET_MODEL PRIMARY KEY  CLUSTERED (id_filter_monitor_model)
go
ALTER TABLE T_FILTER_MONITOR_MODEL
    ADD CONSTRAINT AK_T_QCGUIDELINE_TEST_NAME UNIQUE  (model_name)
go
CREATE TABLE T_LOG_REPLACE_MONITOR
(
    id_mon                          INT NOT NULL,
    id_pc                           INT NOT NULL,
    dt_replace_monitor              DATETIMEOFFSET(2) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_LOG_REPLACE_MONITOR
    ADD CONSTRAINT PK_T_LOG_REPLACE_MONITOR PRIMARY KEY  CLUSTERED (id_mon, id_pc, dt_replace_monitor)
go
CREATE TABLE T_MON
(
    id_mon                          INT IDENTITY(1, 1) NOT NULL,
    nm_maker                        NVARCHAR(50) NOT NULL,
    nm_model                        NVARCHAR(50) NOT NULL,
    no_serial                       NVARCHAR(50) NOT NULL,
    no_screen                       SMALLINT DEFAULT ((0)) NOT NULL,
    no_monitor                      SMALLINT DEFAULT ((0)) NOT NULL,
    kd_monitor                      SMALLINT DEFAULT ((0)) NOT NULL,
    kd_monitortype                  SMALLINT DEFAULT ((0)) NOT NULL,
    nm_profile                      NVARCHAR(50) NOT NULL,
    no_asset                        NVARCHAR(50) NOT NULL,
    calibration_type                TINYINT DEFAULT ((0)) NOT NULL,
    id_pc                           INT DEFAULT ((0)) NOT NULL,
    usedtime                        INT DEFAULT ((0)) NOT NULL,
    coordinate_x                    INT DEFAULT ((0)) NOT NULL,
    coordinate_y                    INT DEFAULT ((0)) NOT NULL,
    width                           INT DEFAULT ((0)) NOT NULL,
    height                          INT DEFAULT ((0)) NOT NULL,
    id_swingsensor                  INT DEFAULT ((0)) NOT NULL,
    id_illuminancesensor            INT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL,
    id_lastpc                       INT DEFAULT ((0)) NOT NULL,
    cal_count                       INT DEFAULT ((1)) NOT NULL,
    special_model                   SMALLINT DEFAULT ((0)) NOT NULL,
    inch_size                       FLOAT(53) DEFAULT (NULL) NULL,
    connection_type                 SMALLINT NOT NULL,
    monitor_udi                     NVARCHAR(50) NOT NULL,
    fl_ics                          TINYINT DEFAULT ((0)) NOT NULL,
    fl_due                          TINYINT DEFAULT ((0)) NOT NULL,
    edid_monitor_model              NVARCHAR(16) DEFAULT ('') NOT NULL,
    edid_monitor_serial_no          NVARCHAR(16) DEFAULT ('') NOT NULL,
    fl_inch_size_change             TINYINT DEFAULT ((0)) NOT NULL,
    dt_buy                          DATE DEFAULT (NULL) NULL,
    cal_name_count                  INT DEFAULT (NULL) NULL,
    fl_enable                       TINYINT DEFAULT ((1)) NOT NULL
)
go
ALTER TABLE T_MON
    ADD CONSTRAINT PK_T_MON PRIMARY KEY  CLUSTERED (id_mon)
go
ALTER TABLE T_MON
    ADD CONSTRAINT AK_monitor_name UNIQUE  (nm_maker, nm_model, no_serial)
go
CREATE  INDEX IX_T_MON_ID_PC
    ON T_MON (id_pc)
go
CREATE  INDEX IX_T_MON_ID_LASTPC
    ON T_MON (id_lastpc)
go
CREATE TABLE T_LOG_DELETE_MONITOR
(
    id_mon                          INT NOT NULL,
    dt_delete_monitor               DATETIMEOFFSET(2) NOT NULL,
    id_pc                           INT NOT NULL,
    id_user                         INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_LOG_DELETE_MONITOR
    ADD CONSTRAINT PK_T_LOG_DELETE_MONITOR PRIMARY KEY  CLUSTERED (id_mon, dt_delete_monitor)
go
CREATE TABLE T_ALERT_MONITOR_ALWAYS_ON
(
    id_mon                          INT NOT NULL,
    dt_alert_reset                  DATETIME NOT NULL,
    usagetime_alert_reset           INT NOT NULL,
    dt_latest_upload                DATETIME NOT NULL,
    usagetime_latest_upload         INT NOT NULL,
    alert_status                    SMALLINT NOT NULL,
    dt_alert_utc                    DATETIME NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_ALERT_MONITOR_ALWAYS_ON
    ADD CONSTRAINT PK_T_ALERT_MONITOR_ALWAYS_ON PRIMARY KEY  CLUSTERED (id_mon)
go
CREATE TABLE T_MONITOR_HEALTH_DATA
(
    id_mon                          INT NOT NULL,
    id_monitor_health_data          INT NOT NULL,
    dt_get                          DATETIMEOFFSET(2) NOT NULL,
    operating_time                  INT NULL,
    monitor_parts_data              IMAGE NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_MONITOR_HEALTH_DATA
    ADD CONSTRAINT PK_T_MONITOR_HEALTH_DATA PRIMARY KEY  CLUSTERED (id_mon, id_monitor_health_data)
go
CREATE TABLE T_USER_MODE_SETTING
(
    id_pc                           INT NOT NULL,
    consistency_test_display_flg    TINYINT NOT NULL,
    work_and_flow_display_flg       TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_USER_MODE_SETTING
    ADD CONSTRAINT PK_T_USER_MODE_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_USER_ROLE
(
    id_user_role                    INT IDENTITY(1, 1) NOT NULL,
    id_group                        INT NOT NULL,
    nm_user_role                    NVARCHAR(32) NOT NULL,
    kd_acnt                         SMALLINT NOT NULL,
    fl_job_tile                     TINYINT NOT NULL,
    fl_action_required_tile         TINYINT NOT NULL,
    fl_usb_disconnected_alert_tile  TINYINT NOT NULL,
    fl_monitor_on_alert_tile        TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_USER_ROLE
    ADD CONSTRAINT PK_T_USER_ROLE PRIMARY KEY NONCLUSTERED (id_user_role)
go
ALTER TABLE T_USER_ROLE
    ADD CONSTRAINT AK_role_name UNIQUE  (id_group, nm_user_role)
go
CREATE TABLE T_USER
(
    id_user                         INT IDENTITY(1, 1) NOT NULL,
    id_login                        NVARCHAR(256) NOT NULL,
    kd_acnt                         SMALLINT DEFAULT ((0)) NOT NULL,
    pswd                            NVARCHAR(64) DEFAULT (NULL) NULL,
    old_paswd                       NVARCHAR(64) DEFAULT (NULL) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL,
    fl_dbsizealert                  TINYINT DEFAULT ((0)) NOT NULL,
    status                          SMALLINT DEFAULT ((1)) NOT NULL,
    nm_tester                       NVARCHAR(50) COLLATE Latin1_General_CS_AS NOT NULL,
    id_group                        INT NOT NULL,
    lang_disp                       NVARCHAR(10) NOT NULL,
    mailaddr                        NVARCHAR(256) NOT NULL,
    fl_acceptalert                  TINYINT DEFAULT ((0)) NOT NULL,
    id_timezone                     NVARCHAR(50) NULL,
    date_format                     SMALLINT NOT NULL,
    firstname                       NVARCHAR(29) DEFAULT (NULL) NULL,
    lastname                        NVARCHAR(29) DEFAULT (NULL) NULL,
    kd_login_id                     SMALLINT NOT NULL,
    telno                           NVARCHAR(30) NULL,
    id_user_role                    INT NULL
)
go
ALTER TABLE T_USER
    ADD CONSTRAINT PK_T_USER PRIMARY KEY  CLUSTERED (id_user)
go
CREATE  INDEX IX_T_USR_ID_ORGANIZATION
    ON T_USER (id_group)
go
CREATE TABLE T_USER_CONFIG
(
    id_user                         INT NOT NULL,
    fl_display_unmanaged_calmode    TINYINT DEFAULT ((0)) NOT NULL,
    kd_displayhistory               SMALLINT DEFAULT ((99)) NOT NULL,
    report_lang                     NVARCHAR(10) NOT NULL,
    fl_history                      TINYINT NOT NULL,
    fl_alert                        TINYINT NOT NULL,
    fl_calibration_setting          TINYINT NOT NULL,
    fl_registration                 TINYINT NOT NULL,
    fl_lifetime_expentancy          TINYINT NOT NULL,
    fl_connection                   TINYINT NOT NULL,
    fl_job_tile                     TINYINT NOT NULL,
    fl_action_required_tile         TINYINT NOT NULL,
    fl_usb_disconnected_alert_tile  TINYINT NOT NULL,
    fl_monitor_on_alert_tile        TINYINT NOT NULL,
    fl_action_required_mail         TINYINT NOT NULL,
    fl_usb_disconnected_alert_mail  TINYINT NOT NULL,
    fl_monitor_on_alert_mail        TINYINT NOT NULL,
    fl_calibration_failed           TINYINT NOT NULL,
    fl_acceptance_test_failed       TINYINT NOT NULL,
    fl_visual_check_failed          TINYINT NOT NULL,
    fl_consistency_test_failed      TINYINT NOT NULL,
    fl_hands_off_check_failed       TINYINT NOT NULL,
    fl_radics_selfqc_failed         TINYINT NOT NULL,
    fl_luminance_check_failed       TINYINT NOT NULL,
    fl_grayscale_check_failed       TINYINT NOT NULL,
    fl_calibration_error            TINYINT NOT NULL,
    fl_consistency_test_error       TINYINT NOT NULL,
    fl_hands_off_check_error        TINYINT NOT NULL,
    fl_radics_selfqc_error          TINYINT NOT NULL,
    fl_eizo_monitor_setting_error   TINYINT NOT NULL,
    fl_firmware_update_error        TINYINT NOT NULL,
    fl_calibration_canceled         TINYINT NOT NULL,
    fl_visual_check_canceled        TINYINT NOT NULL,
    fl_consistency_test_canceled    TINYINT NOT NULL,
    fl_hands_off_check_canceled     TINYINT NOT NULL,
    fl_radics_selfqc_canceled       TINYINT NOT NULL,
    fl_firmware_update_canceled     TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_USER_CONFIG
    ADD CONSTRAINT PK_T_USER_CONFIG PRIMARY KEY  CLUSTERED (id_user)
go
CREATE TABLE T_USRPTRNFILE
(
    id_file                         INT IDENTITY(1, 1) NOT NULL,
    nm_userfile                     NVARCHAR(256) NOT NULL,
    zip_file                        IMAGE NOT NULL,
    thumbnail_file                  IMAGE NULL,
    preview_file                    IMAGE NULL,
    hash_value                      NVARCHAR(50) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIMEOFFSET(2) NOT NULL,
    id_group                        INT NOT NULL,
    fl_delete                       TINYINT NOT NULL
)
go
ALTER TABLE T_USRPTRNFILE
    ADD CONSTRAINT PK_T_USRPTRNFILE PRIMARY KEY  CLUSTERED (id_file)
go
CREATE  INDEX IX_T_USRPTRNFILE_ID_GROUP
    ON T_USRPTRNFILE (id_group)
go
CREATE TABLE T_LICENSE_KEY
(
    license_key                     NVARCHAR(24) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_LICENSE_KEY
    ADD CONSTRAINT PK_T_LICENSE_KEY PRIMARY KEY  CLUSTERED (license_key)
go
CREATE TABLE T_REMOTE_SETTING_NOTICE
(
    id_pc                           INT NOT NULL,
    dt_remote_update                DATETIMEOFFSET(2) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_REMOTE_SETTING_NOTICE
    ADD CONSTRAINT PK_T_REMOTE_SETTING_NOTICE PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_REPORT
(
    id_qcguideline                  INT NOT NULL,
    task_type                       SMALLINT NOT NULL,
    display_order                   INT NOT NULL,
    lang_disp                       NVARCHAR(10) NOT NULL,
    nm_reportformat                 NVARCHAR(256) NOT NULL,
    nm_xsl                          NVARCHAR(256) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_REPORT
    ADD CONSTRAINT PK_T_REPORT PRIMARY KEY  CLUSTERED (id_qcguideline, task_type, display_order, lang_disp)
go
CREATE TABLE T_REPORT_EXTRA_INFO
(
    id_pc                           INT NOT NULL,
    id_reportinformation            NVARCHAR(10) NOT NULL,
    value_reportinformation         NVARCHAR(128) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_REPORT_EXTRA_INFO
    ADD CONSTRAINT PK_T_REPORT_EXTRA_INFO PRIMARY KEY  CLUSTERED (id_pc, id_reportinformation)
go
CREATE TABLE T_LOGIN
(
    id_login                        INT IDENTITY(1, 1) NOT NULL,
    id_user                         INT NOT NULL,
    kd_login                        SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_LOGIN
    ADD CONSTRAINT PK_T_LOGIN PRIMARY KEY  CLUSTERED (id_login)
go
CREATE TABLE T_TMP_FACILITY_USER
(
    id_user                         INT IDENTITY(1, 1) NOT NULL,
    key_facility                    NVARCHAR(15) NOT NULL,
    nm_tester                       NVARCHAR(50) NOT NULL,
    firstname                       NVARCHAR(29) DEFAULT (NULL) NOT NULL,
    lastname                        NVARCHAR(29) DEFAULT (NULL) NOT NULL,
    telno                           NVARCHAR(30) NOT NULL,
    mailaddr                        NVARCHAR(256) NOT NULL,
    id_login                        NVARCHAR(256) NOT NULL,
    kd_login_id                     SMALLINT NOT NULL,
    pswd                            NVARCHAR(64) DEFAULT (NULL) NOT NULL,
    lang_disp                       NVARCHAR(10) NOT NULL,
    id_timezone                     NVARCHAR(50) NOT NULL,
    date_format                     SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_TMP_FACILITY_USER
    ADD CONSTRAINT PK_T_TMP_FACILITY_USER PRIMARY KEY  CLUSTERED (id_user)
go
CREATE  INDEX IX_T_TMP_FACILITY_KEY_FACILITY
    ON T_TMP_FACILITY_USER (key_facility)
go
CREATE TABLE T_TMP_FACILITY
(
    key_facility                    NVARCHAR(15) NOT NULL,
    id_group                        INT NOT NULL,
    nm_facility                     NVARCHAR(64) NOT NULL,
    address                         NVARCHAR(128) NOT NULL,
    id_region                       NVARCHAR(2) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_TMP_FACILITY
    ADD CONSTRAINT PK_T_TMP_FACILITY PRIMARY KEY  CLUSTERED (key_facility)
go
CREATE  INDEX IX_T_TMP_FACILITY_ID_GROUP
    ON T_TMP_FACILITY (id_group)
go
CREATE TABLE T_DISPLAY
(
    id_pc                           INT NOT NULL,
    no_screen                       SMALLINT NOT NULL,
    coordinate_x                    INT NOT NULL,
    coordinate_y                    INT NOT NULL,
    width                           INT NOT NULL,
    height                          INT NOT NULL,
    scaled_width                    INT NOT NULL,
    scaled_height                   INT NOT NULL,
    scale_rate                      FLOAT(53) NOT NULL,
    vertical_monitor_count          TINYINT NOT NULL,
    horizontal_monitor_count        TINYINT NOT NULL,
    screen_type                     SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_DISPLAY
    ADD CONSTRAINT PK_T_DISPLAY PRIMARY KEY  CLUSTERED (id_pc, no_screen)
go
CREATE TABLE T_ILLUMINANCESENSOR
(
    id_sensor                       INT IDENTITY(1, 1) NOT NULL,
    model                           NVARCHAR(32) NOT NULL,
    serial                          NVARCHAR(64) NOT NULL,
    kd_type                         SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_ILLUMINANCESENSOR
    ADD CONSTRAINT PK_T_ILLUMINANCESENSOR PRIMARY KEY  CLUSTERED (id_sensor)
go
CREATE TABLE T_AMBIENT
(
    id_cal                          INT NOT NULL,
    sensor_name                     NVARCHAR(16) NOT NULL,
    sensor_serial                   NVARCHAR(16) NOT NULL,
    ambient_value                   FLOAT(53) NOT NULL,
    id_update_user                  INT DEFAULT (NULL) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL,
    id_pc                           INT DEFAULT 0 NOT NULL
)
go
ALTER TABLE T_AMBIENT
    ADD CONSTRAINT PK_T_AMBIENT PRIMARY KEY  CLUSTERED (id_cal, id_pc)
go
CREATE TABLE T_AMBIENT_LUMINANCE_CORRELATION
(
    id_cal                          INT NOT NULL,
    id_sensor                       INT NOT NULL,
    ambient_luminance_coefficient   FLOAT(53) DEFAULT 1 NOT NULL,
    target_ambient_luminance_coefficient FLOAT(53) DEFAULT 1 NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL,
    id_pc                           INT NOT NULL
)
go
ALTER TABLE T_AMBIENT_LUMINANCE_CORRELATION
    ADD CONSTRAINT PK_T_AMBIENT_LUMINANCE_CORRELATION PRIMARY KEY  CLUSTERED (id_cal, id_sensor, id_pc)
go
CREATE TABLE T_AMBIENT_ILLUMINANCE_MONITORING_DATA
(
    id_data                         INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    id_mon                          INT NOT NULL,
    dt_measurement                  DATETIME NOT NULL,
    sensor_model                    NVARCHAR(32) NOT NULL,
    sensor_serial_no                NVARCHAR(64) NOT NULL,
    ambient_illuminance             FLOAT(53) NOT NULL,
    judgment_min                    FLOAT(53) NOT NULL,
    judgment_max                    FLOAT(53) NOT NULL,
    judgment                        SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_AMBIENT_ILLUMINANCE_MONITORING_DATA
    ADD CONSTRAINT PK_T_AMBIENT_ILLUMINANCE_MONITORING_DATA PRIMARY KEY  CLUSTERED (id_data)
go
CREATE  INDEX IX_T_AMBIENT_ILLUMINANCE_MONITORING_DATA_PC_MON
    ON T_AMBIENT_ILLUMINANCE_MONITORING_DATA (id_pc, id_mon)
go
CREATE TABLE T_AMBIENT_ILLUMINANCE_MONITORING_SETTING
(
    id_pc                           INT NOT NULL,
    monitoring_flg                  TINYINT NOT NULL,
    alert_flg                       TINYINT NOT NULL,
    judgment_min_value              FLOAT(53) NOT NULL,
    judgment_max_value              FLOAT(53) NOT NULL,
    measurement_interval            INT NOT NULL,
    alert_count                     INT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_AMBIENT_ILLUMINANCE_MONITORING_SETTING
    ADD CONSTRAINT PK_T_AMBIENT_ILLUMINANCE_MONITORING_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_BASELINE_VALUE
(
    id_cal                          INT NOT NULL,
    base_Lmax                       FLOAT(53) NOT NULL,
    base_Lmin                       FLOAT(53) NOT NULL,
    base_Lamb                       FLOAT(53) NOT NULL,
    base_execute_date               DATE DEFAULT (NULL) NULL,
    base_tester                     NVARCHAR(50) DEFAULT ('') NOT NULL,
    base_sensor_name                NVARCHAR(32) DEFAULT ('') NOT NULL,
    base_sensor_serial              NVARCHAR(16) DEFAULT ('') NOT NULL,
    fl_base_available               TINYINT DEFAULT ((1)) NOT NULL,
    id_update_user                  INT DEFAULT (NULL) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_BASELINE_VALUE
    ADD CONSTRAINT PK_T_BASELINE_VALUE PRIMARY KEY  CLUSTERED (id_cal)
go
CREATE TABLE T_ROOM_CLASS_SUPPORT
(
    id_room_class                   INT NOT NULL,
    id_qcguideline                  INT NOT NULL,
    priority                        INT NOT NULL
)
go
ALTER TABLE T_ROOM_CLASS_SUPPORT
    ADD CONSTRAINT PK_T_ROOM_CLASS_SUPPORT PRIMARY KEY  CLUSTERED (id_room_class, id_qcguideline)
go
CREATE TABLE T_ROOM_CLASS
(
    id_room_class                   INT NOT NULL,
    room_class_name                 NVARCHAR(256) NOT NULL
)
go
ALTER TABLE T_ROOM_CLASS
    ADD CONSTRAINT PK_T_ROOM_CLASS PRIMARY KEY  CLUSTERED (id_room_class)
go
CREATE TABLE T_USING_USER_PATTERN
(
    id_policy                       INT NOT NULL,
    id_file                         INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_USING_USER_PATTERN
    ADD CONSTRAINT PK_T_USING_USER_PATTERN PRIMARY KEY  CLUSTERED (id_policy, id_file)
go
CREATE  INDEX IX_T_POLICY_QCGUIDELINE_CUSTOM_ID_POLICY
    ON T_USING_USER_PATTERN (id_policy)
go
CREATE  INDEX IX_T_USRPTRNFILE_ID_FILE
    ON T_USING_USER_PATTERN (id_file)
go
CREATE TABLE T_TESTER
(
    id_pc                           INT NOT NULL,
    no_tester                       SMALLINT NOT NULL,
    nm_tester                       NVARCHAR(50) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_TESTER
    ADD CONSTRAINT PK_T_TESTER PRIMARY KEY  CLUSTERED (id_pc, no_tester)
go
CREATE TABLE T_MANUAL_CAL_SWITCH_SETTING
(
    id_pc                           INT NOT NULL,
    manual_cal_switch_enabled_flg   TINYINT NOT NULL,
    same_model_applied_flg          TINYINT NOT NULL,
    window_size_type                SMALLINT NOT NULL,
    x_coordinate                    INT DEFAULT (NULL) NULL,
    y_coordinate                    INT DEFAULT (NULL) NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_MANUAL_CAL_SWITCH_SETTING
    ADD CONSTRAINT PK_T_MANUAL_CAL_SWITCH_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_MANUAL_CAL_SWITCH_DISPLAY_SETTING
(
    id_manual_cal_switch_display_setting INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    model_name                      NVARCHAR(50) NOT NULL,
    calmode_type                    NVARCHAR(32) NOT NULL,
    cal_switch_button_display_flg   TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_MANUAL_CAL_SWITCH_DISPLAY_SETTING
    ADD CONSTRAINT PK_T_MANUAL_CAL_SWITCH_DISPLAY_SETTING PRIMARY KEY  CLUSTERED (id_manual_cal_switch_display_setting)
go
CREATE  INDEX IX_T_MANUAL_CAL_SWITCH_DISPLAY_SETTING_ID_PC
    ON T_MANUAL_CAL_SWITCH_DISPLAY_SETTING (id_pc)
go
CREATE TABLE T_LIFETIME_EXPECTANCY
(
    id_lea                          INT IDENTITY(1, 1) NOT NULL,
    id_pc                           INT NOT NULL,
    id_cal                          INT NOT NULL,
    usage_section_number            INT NOT NULL,
    operating_time                  INT NOT NULL,
    lea_result                      SMALLINT NOT NULL,
    lea_time                        INT NULL,
    average_usage_time_of_a_day     FLOAT(53) NULL,
    fl_lea_enable                   TINYINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_LIFETIME_EXPECTANCY
    ADD CONSTRAINT PK_T_LIFETIME_EXPECTANCY PRIMARY KEY  CLUSTERED (id_lea)
go
CREATE  INDEX IX_T_LIFETIME_EXPECTANCY_ID_PC
    ON T_LIFETIME_EXPECTANCY (id_pc)
go
CREATE  INDEX IX_T_LIFETIME_EXPECTANCY_ID_CAL
    ON T_LIFETIME_EXPECTANCY (id_cal)
go
CREATE TABLE T_ILLUMINANCE_CORRELATION
(
    id_mon                          INT NOT NULL,
    id_sensor                       INT NOT NULL,
    correlation_coefficient         FLOAT(53) DEFAULT 1 NOT NULL,
    target_correlation_coefficient  FLOAT(53) DEFAULT 1 NOT NULL,
    correlation_flg                 TINYINT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL,
    id_pc                           INT NOT NULL
)
go
ALTER TABLE T_ILLUMINANCE_CORRELATION
    ADD CONSTRAINT PK_T_ILLUMINANCE_CORRELATION PRIMARY KEY  CLUSTERED (id_mon, id_sensor, id_pc)
go
CREATE TABLE T_SWITCH_SIGNAL_MONITOR_SETTING
(
    id_pc                           INT NOT NULL,
    id_mon                          INT NOT NULL,
    switch_signal_permonitor_enabled_flg TINYINT NOT NULL,
    port_type                       SMALLINT NOT NULL,
    port_number                     SMALLINT NOT NULL,
    display_index                   SMALLINT NOT NULL,
    port_value                      NVARCHAR(6) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_SWITCH_SIGNAL_MONITOR_SETTING
    ADD CONSTRAINT PK_T_SWITCH_SIGNAL_MONITOR_SETTING PRIMARY KEY  CLUSTERED (id_pc, id_mon, port_number, display_index)
go
CREATE TABLE T_SWITCH_SIGNAL_SETTING
(
    id_pc                           INT NOT NULL,
    switch_signal_enabled_flg       TINYINT NOT NULL,
    switch_signal_interlocking_type SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_SWITCH_SIGNAL_SETTING
    ADD CONSTRAINT PK_T_SWITCH_SIGNAL_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_PRESENSESENSOR
(
    id_mon                          INT NOT NULL,
    kd_type                         SMALLINT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_PRESENSESENSOR
    ADD CONSTRAINT PK_T_PRESENSESENSOR PRIMARY KEY  CLUSTERED (id_mon)
go
CREATE TABLE T_SENDMAIL
(
    sequence                        INT IDENTITY(1, 1) NOT NULL,
    kd_mail                         SMALLINT NOT NULL,
    id_mon                          INT NULL,
    id_his                          BIGINT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_SENDMAIL
    ADD CONSTRAINT PK_T_SENDMAIL PRIMARY KEY  CLUSTERED (sequence)
go
CREATE TABLE T_REGISTRATION
(
    id_pc                           INT NOT NULL,
    item1                           NVARCHAR(128) DEFAULT ('') NOT NULL,
    item2                           NVARCHAR(128) DEFAULT ('') NOT NULL,
    item3                           NVARCHAR(128) DEFAULT ('') NOT NULL,
    item4                           NVARCHAR(128) DEFAULT ('') NOT NULL,
    item5                           NVARCHAR(128) DEFAULT ('') NOT NULL,
    item6                           NVARCHAR(128) DEFAULT ('') NOT NULL,
    item7                           NVARCHAR(128) DEFAULT ('') NOT NULL,
    item8                           NVARCHAR(128) DEFAULT ('') NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NULL
)
go
ALTER TABLE T_REGISTRATION
    ADD CONSTRAINT PK_T_REGISTRATION PRIMARY KEY  CLUSTERED (id_pc)
go
CREATE TABLE T_UNREGISTERED_MONITOR
(
    id_pc                           INT NOT NULL,
    no_monitor                      SMALLINT NOT NULL,
    no_screen                       SMALLINT NOT NULL,
    nm_maker                        NVARCHAR(50) NOT NULL,
    edid_monitor_model              NVARCHAR(50) NOT NULL,
    edid_monitor_serial_no          NVARCHAR(50) NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_UNREGISTERED_MONITOR
    ADD CONSTRAINT PK_T_UNREGISTERED_MONITOR PRIMARY KEY  CLUSTERED (id_pc, no_monitor)
go
CREATE TABLE T_INCOMPLETED_GROUP
(
    id_group                        INT NOT NULL,
    dt_create                       DATETIME NOT NULL
)
go
ALTER TABLE T_INCOMPLETED_GROUP
    ADD CONSTRAINT PK_T_INCOMPLETED_GROUP PRIMARY KEY  CLUSTERED (id_group)
go
CREATE TABLE T_DISPLAY_COLUMN
(
    id_user                         INT NOT NULL,
    target_page                     INT NOT NULL,
    display_column                  NVARCHAR(MAX) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_DISPLAY_COLUMN
    ADD CONSTRAINT PK_T_DISPLAY_COLUMN PRIMARY KEY  CLUSTERED (id_user, target_page)
go
CREATE TABLE T_HIS
(
    id_his                          BIGINT IDENTITY(1, 1) NOT NULL,
    id_mon                          INT NULL,
    id_cal                          INT NULL,
    id_pc                           INT NOT NULL,
    task_type                       INT NOT NULL,
    task_typeold                    INT NOT NULL,
    task_seq                        INT DEFAULT (NULL) NULL,
    sq_clienthis                    INT NOT NULL,
    result                          SMALLINT NOT NULL,
    nm_standards                    NVARCHAR(50) NULL,
    id_qcguideline                  INT DEFAULT (NULL) NULL,
    tester                          NVARCHAR(50) DEFAULT (NULL) NULL,
    cd_error                        INT DEFAULT ((0)) NOT NULL,
    errorinfo                       INT DEFAULT ((0)) NOT NULL,
    xml_log                         NVARCHAR(MAX) NULL,
    va_testinfo                     INT DEFAULT ((0)) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    nm_cal                          NVARCHAR(10) DEFAULT (NULL) NULL,
    fl_delete                       TINYINT DEFAULT ((0)) NOT NULL,
    kd_test                         SMALLINT DEFAULT ((0)) NOT NULL,
    ver_qcguideline                 INT DEFAULT ((1)) NOT NULL,
    lmax_measurement_value          FLOAT(53) DEFAULT (NULL) NULL,
    lmin_measurement_value          FLOAT(53) DEFAULT (NULL) NULL,
    lamb_measurement_value          FLOAT(53) DEFAULT (NULL) NULL,
    monitor_usedtime                INT DEFAULT (NULL) NULL,
    lmax_measurement_values_x       FLOAT(53) DEFAULT (NULL) NULL,
    lmax_measurement_values_y       FLOAT(53) DEFAULT (NULL) NULL,
    color_temperature               FLOAT(53) DEFAULT (NULL) NULL,
    dt_test                         DATETIME DEFAULT (NULL) NULL,
    dt_test_offset                  INT DEFAULT (NULL) NULL,
    test_name                       NVARCHAR(60) DEFAULT ('') NOT NULL,
    qc_guideline_short_name         NVARCHAR(256) DEFAULT ('') NOT NULL,
    dt_update                       DATETIME DEFAULT (NULL) NULL
)
go
ALTER TABLE T_HIS
    ADD CONSTRAINT PK_T_HIS PRIMARY KEY  CLUSTERED (id_his)
go
CREATE  INDEX IX_T_HIS_ID_PC
    ON T_HIS (id_pc)
go
CREATE  INDEX IX_T_HIS_ID_CAL
    ON T_HIS (id_cal)
go
CREATE  INDEX IX_T_HIS_TASK_TYPE
    ON T_HIS (task_type)
go
CREATE  INDEX IX_T_HIS_ID_QCGUIDELINE
    ON T_HIS (id_qcguideline)
go
CREATE  INDEX IX_T_HIS_DT_TEST
    ON T_HIS (dt_test)
go
CREATE  INDEX IX_T_HIS_CAL_TASK_TYPEOLD
    ON T_HIS (task_typeold, id_cal)
go
ALTER TABLE T_HIS
    ADD CONSTRAINT AK_unique_history UNIQUE  (id_mon, id_cal, id_pc, task_type, task_typeold, task_seq, dt_test, dt_test_offset)
go
CREATE TABLE T_HISDETAIL
(
    id_his                          BIGINT NOT NULL,
    detail_type                     SMALLINT NOT NULL,
    result                          SMALLINT NOT NULL,
    max_error_rate                  FLOAT(53) DEFAULT (NULL) NULL,
    xml_log                         NVARCHAR(MAX) NULL,
    dt_test                         DATETIMEOFFSET(2) DEFAULT (NULL) NULL,
    sensor_log                      NVARCHAR(MAX) NULL
)
go
ALTER TABLE T_HISDETAIL
    ADD CONSTRAINT PK_T_HISDETAIL PRIMARY KEY  CLUSTERED (id_his, detail_type)
go
CREATE TABLE T_HISTORY_SETTING
(
    id_pc                           INT NOT NULL,
    fl_his_backup                   TINYINT DEFAULT ((0)) NOT NULL,
    backup_folder                   NVARCHAR(255) NOT NULL,
    fl_his_export                   TINYINT DEFAULT ((0)) NOT NULL,
    export_folder                   NVARCHAR(255) NOT NULL,
    dt_create                       DATETIME NOT NULL,
    dt_update                       DATETIME NOT NULL
)
go
ALTER TABLE T_HISTORY_SETTING
    ADD CONSTRAINT PK_T_HISTORY_SETTING PRIMARY KEY  CLUSTERED (id_pc)
go
ALTER TABLE T_REGISTRATION
    ADD CONSTRAINT FK_T_PC_T_REGISTRATION FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_PC
    ADD CONSTRAINT FK_T_GROUP_T_PC FOREIGN KEY(id_room) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_REPORT
    ADD CONSTRAINT FK_T_QCGUIDELINE_T_REPORT FOREIGN KEY(id_qcguideline) REFERENCES T_QCGUIDELINE (id_qcguideline) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_QCGUIDELINE_NAME
    ADD CONSTRAINT FK_T_QCGUIDELINE_T_QCGUIDELINE_NAME FOREIGN KEY(id_qcguideline) REFERENCES T_QCGUIDELINE (id_qcguideline) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_QCGUIDELINE_TEST_NAME
    ADD CONSTRAINT FK_T_QCGUIDELINE_T_QCGUIDELINE_TEST_NAME FOREIGN KEY(id_qcguideline) REFERENCES T_QCGUIDELINE (id_qcguideline) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POLICY_GROUP_SET
    ADD CONSTRAINT FK_T_GROUP_T_POLICY_GROUP_SET FOREIGN KEY(id_group) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_CALIBRATION_UNSUPPORTED_MODE
    ADD CONSTRAINT FK_T_MON_T_CALIBRATION_UNSUPPORTED_MODE FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_LOG_DELETE_MONITOR
    ADD CONSTRAINT FK_T_USR_T_LOG_DELETE_MONITOR FOREIGN KEY(id_user) REFERENCES T_USER (id_user) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_LOGIN
    ADD CONSTRAINT FK_T_USR_T_LOGIN FOREIGN KEY(id_user) REFERENCES T_USER (id_user) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_LOG_DELETE_MONITOR
    ADD CONSTRAINT FK_T_MON_T_LOG_DELETE_MONITOR FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_USER_CONFIG
    ADD CONSTRAINT FK_T_USR_T_USER_CONFIG FOREIGN KEY(id_user) REFERENCES T_USER (id_user) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_BACKLIGHT_SAVER
    ADD CONSTRAINT FK_T_PC_T_BACKLIGHT_SAVER FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_REMOTE_SETTING_NOTICE
    ADD CONSTRAINT FK_T_PC_T_REMOTE_SETTING_NOTICE FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POLICY_GROUP_SET
    ADD CONSTRAINT FK_T_GROUP_T_POLICY_GROUP_SET_ORIGIN FOREIGN KEY(id_group_set_origin) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_FACILITY
    ADD CONSTRAINT FK_T_GROUP_T_FACILITY FOREIGN KEY(id_group) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POLICY_SETTING
    ADD CONSTRAINT FK_T_GROUP_T_POLICY_SETTING FOREIGN KEY(id_group_register) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POLICY_SETTING
    ADD CONSTRAINT FK_T_USR_T_POLICY_SETTING FOREIGN KEY(id_user_register) REFERENCES T_USER (id_user) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POLICY_GROUP_SET
    ADD CONSTRAINT FK_T_USR_T_POLICY_GROUP_SET FOREIGN KEY(id_user_set) REFERENCES T_USER (id_user) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_USRPTRNFILE
    ADD CONSTRAINT FK_T_GROUP_T_USRPTRNFILE FOREIGN KEY(id_group) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_BASELINE_VALUE
    ADD CONSTRAINT FK_T_CALMODE_T_BASELINE_VALUE FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_GATEWAY
    ADD CONSTRAINT FK_T_GROUP_T_GATEWAY FOREIGN KEY(id_group) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_REPORT_EXTRA_INFO
    ADD CONSTRAINT FK_T_PC_T_REPORT_USER_INPUT FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_PC
    ADD CONSTRAINT FK_T_GATEWAY_T_PC FOREIGN KEY(id_gateway) REFERENCES T_GATEWAY (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_DIN_TEST_REQUIREMENT
    ADD CONSTRAINT FK_T_PC_T_DIN_TEST_REQUIREMENT FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_JOB_MANAGE
    ADD CONSTRAINT FK_T_PC_T_JOB_MANAGE FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_CORRELATION
    ADD CONSTRAINT FK_T_SWINGSENSOR_T_CORRELATION FOREIGN KEY(id_sensor) REFERENCES T_SWINGSENSOR (id_sensor) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_LEADATA_SELFCAL
    ADD CONSTRAINT FK_T_MON_T_LEADATA_SELFCAL1 FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_HOTKEY_SETTING
    ADD CONSTRAINT FK_T_PC_T_HOTKEY_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_CORRELATION
    ADD CONSTRAINT FK_T_MON_T_CORRELATION FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_BACKLIGHTMETER_LOG
    ADD CONSTRAINT FK_T_CALMODE_T_BACKLIGHTMETER_LOG1 FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_CARD_LUT_SETUP
    ADD CONSTRAINT FK_T_MON_T_CARD_LUT_SETUP FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_CALMODE
    ADD CONSTRAINT FK_T_MON_T_CALMODE FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_PRESENSESENSOR
    ADD CONSTRAINT FK_T_MON_T_PRESENSESENSOR FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_SENSOR_SETTING
    ADD CONSTRAINT FK_T_PC_T_SENSOR_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_ILLUMINANCE_CORRELATION
    ADD CONSTRAINT FK_T_MON_T_ILLUMINANCE_CORRELATION FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_ILLUMINANCE_CORRELATION
    ADD CONSTRAINT FK_T_PC_T_ILLUMINANCE_CORRELATION FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_CARD_LUT_DATA
    ADD CONSTRAINT FK_T_MON_T_CARD_LUT_DATA FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_HANDS_OFF_ICS
    ADD CONSTRAINT FK_T_CALMODE_T_HANDS_OFF_ICS FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_HANDS_OFF
    ADD CONSTRAINT FK_T_CALMODE_T_HANDS_OFF FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_CALIBRATION
    ADD CONSTRAINT FK_T_CALMODE_T_CALIBRATION FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_CORE_CONFIG
    ADD CONSTRAINT FK_T_PC_T_CORE_CONFIG FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_DISPLAY
    ADD CONSTRAINT FK_T_PC_T_DISPLAY4 FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST
    ADD CONSTRAINT FK_T_POINT_AND_FOCUS_SETTING_T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST FOREIGN KEY(id_pc) REFERENCES T_POINT_AND_FOCUS_SETTING (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_GATEWAY_USAGE
    ADD CONSTRAINT FK_T_PC_T_GATEWAY_USAGE FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_GATEWAY_CONNECT
    ADD CONSTRAINT FK_T_GATEWAY_USAGE_T_GATEWAY_CONNECT FOREIGN KEY(id_pc) REFERENCES T_GATEWAY_USAGE (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_DIN_TEST_REQUIREMENT
    ADD CONSTRAINT FK_T_CALMODE_T_DIN_TEST_REQUIREMENT FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_ILLUMINANCE_CORRELATION
    ADD CONSTRAINT FK_T_ILLUMINANCESENSOR2_T_ILLUMINANCE_CORRELATION FOREIGN KEY(id_sensor) REFERENCES T_ILLUMINANCESENSOR (id_sensor) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_AMBIENT_LUMINANCE_CORRELATION
    ADD CONSTRAINT FK_T_ILLUMINANCESENSOR_T_AMBIENT_LUMINANCE_CORRELATION FOREIGN KEY(id_sensor) REFERENCES T_ILLUMINANCESENSOR (id_sensor) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_PCCONNECT
    ADD CONSTRAINT FK_T_PC_T_PCCONNECT FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_TESTER
    ADD CONSTRAINT FK_T_PC_T_TESTER2 FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_PASSWORD
    ADD CONSTRAINT FK_T_PC_T_PASSWORD FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_GRAPHICS_CARD
    ADD CONSTRAINT FK_T_DISPLAY_T_GRAPHICS_CARD2 FOREIGN KEY(id_pc, no_screen) REFERENCES T_DISPLAY (id_pc, no_screen) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_SWITCH_AND_GO_SETTING
    ADD CONSTRAINT FK_T_PC_T_SWITCH_AND_GO_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POINT_AND_FOCUS_SETTING
    ADD CONSTRAINT FK_T_PC_T_POINT_AND_FOCUS_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_UNREGISTERED_MONITOR
    ADD CONSTRAINT FK_T_PC_T_UNREGISTERED_MONITOR FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_BACKLIGHTMETER
    ADD CONSTRAINT FK_T_CALMODE_T_BACKLIGHTMETER1 FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_PINP_SWITCH_POSITION
    ADD CONSTRAINT FK_T_PINP_REGISTRATION_T_PINP_SWITCH_POSITION FOREIGN KEY(id_pc, no_mon) REFERENCES T_PINP_REGISTRATION (id_pc, no_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_BACKLIGHT_SAVER_URL
    ADD CONSTRAINT FK_T_BACKLIGHT_SAVER_T_BACKLIGHT_SAVER_URL FOREIGN KEY(id_pc) REFERENCES T_BACKLIGHT_SAVER (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_BACKLIGHT_SAVER_APPLICATION
    ADD CONSTRAINT FK_T_BACKLIGHT_SAVER_T_BACKLIGHT_SAVER_APPLICATION FOREIGN KEY(id_pc) REFERENCES T_BACKLIGHT_SAVER (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_HIDE_AND_SEEK_SETTING
    ADD CONSTRAINT FK_T_PC_T_HIDE_AND_SEEK_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_AMBIENT_LUMINANCE_CORRELATION
    ADD CONSTRAINT FK_T_PC_T_AMBIENT_LUMINANCE_CORRELATION FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_AMBIENT_LUMINANCE_CORRELATION
    ADD CONSTRAINT FK_T_CALMODE_T_AMBIENT_LUMINANCE_CORRELATION FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_AMBIENT
    ADD CONSTRAINT FK_T_PC_T_AMBIENT FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_AMBIENT
    ADD CONSTRAINT FK_T_CALMODE_T_AMBIENT FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_HISDETAIL
    ADD CONSTRAINT FK_T_HIS_T_HISDETAIL FOREIGN KEY(id_his) REFERENCES T_HIS (id_his) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_QCGUIDELINE_TEST
    ADD CONSTRAINT FK_T_QCGUIDELINE_T_QCGUIDELINE_TEST FOREIGN KEY(id_qcguideline) REFERENCES T_QCGUIDELINE (id_qcguideline) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_INCOMPLETED_GROUP
    ADD CONSTRAINT FK_T_GROUP_T_INCOMPLETED_GROUP FOREIGN KEY(id_group) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_PROVIDER
    ADD CONSTRAINT FK_T_GROUP_T_PROVIDER FOREIGN KEY(id_group) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_RADICS_GATEWAY
    ADD CONSTRAINT FK_T_GATEWAY_T_RADICS_GATEWAY FOREIGN KEY(id_gateway) REFERENCES T_GATEWAY (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POLICY_SETTING_NOTICE
    ADD CONSTRAINT FK_T_GROUP_T_POLICY_SETTING_NOTICE FOREIGN KEY(id_room) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_DISPLAY_COLUMN
    ADD CONSTRAINT FK_T_USER_T_DISPLAY_COLUMN FOREIGN KEY(id_user) REFERENCES T_USER (id_user) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_SCHEDULE_APPLICATION
    ADD CONSTRAINT FK_T_PC_T_SCHEDULE_APPLICATION FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POLICY_SCHEDULE_DETAIL
    ADD CONSTRAINT FK_T_POLICY_SCHEDULE_T_POLICY_SCHEDULE_DETAIL FOREIGN KEY(id_policy) REFERENCES T_POLICY_SCHEDULE (id_policy) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_ACCEPT_ALERT_SCOPE
    ADD CONSTRAINT FK_T_USER_T_ACCEPT_ALERT_SCOPE FOREIGN KEY(id_user) REFERENCES T_USER (id_user) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_LOG_CHANGE_PC_LOCATION
    ADD CONSTRAINT FK_T_PC_T_LOG_CHANGE_PC_LOCATION FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_AUTO_CAL_SWITCH_SETTING
    ADD CONSTRAINT FK_T_PC_T_AUTO_CAL_SWITCH_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_AUTO_CAL_SWITCH_REGISTRATION
    ADD CONSTRAINT FK_T_AUTO_CAL_SWITCH_SETTING_T_AUTO_CAL_SWITCH_REGISTRATION FOREIGN KEY(id_pc) REFERENCES T_AUTO_CAL_SWITCH_SETTING (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_ROOM_CLASS_SUPPORT
    ADD CONSTRAINT FK_T_ROOM_CLASS_T_ROOM_CLASS_SUPPORT FOREIGN KEY(id_room_class) REFERENCES T_ROOM_CLASS (id_room_class) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_ROOM_CLASS_SUPPORT
    ADD CONSTRAINT FK_T_QCGUIDELINE_T_ROOM_CLASS_SUPPORT FOREIGN KEY(id_qcguideline) REFERENCES T_QCGUIDELINE (id_qcguideline) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_TMP_FACILITY
    ADD CONSTRAINT FK_T_PROVIDER_T_TMP_FACILITY FOREIGN KEY(id_group) REFERENCES T_PROVIDER (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_PC_ALLOCATION_RULE
    ADD CONSTRAINT FK_T_GROUP_T_PC_ALLOCATION_RULE FOREIGN KEY(id_group) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_TMP_FACILITY_USER
    ADD CONSTRAINT FK_T_TMP_FACILITY_T_TMP_FACILITY_USER FOREIGN KEY(key_facility) REFERENCES T_TMP_FACILITY (key_facility) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_POLICY_QCGUIDELINE_TEST
    ADD CONSTRAINT FK_T_POLICY_QCGUIDELINE_CUSTOM_T_POLICY_QCGUIDELINE_TEST FOREIGN KEY(id_policy) REFERENCES T_POLICY_QCGUIDELINE_CUSTOM (id_policy) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_USER_MODE_SETTING
    ADD CONSTRAINT FK_T_PC_T_USER_MODE_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_SWITCH_SIGNAL_SETTING
    ADD CONSTRAINT FK_T_PC_T_SWITCH_SIGNAL_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_SWITCH_SIGNAL_MONITOR_SETTING
    ADD CONSTRAINT FK_T_MON_T_SWITCH_SIGNAL_MONITOR_SETTING FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_SWITCH_SIGNAL_MONITOR_SETTING
    ADD CONSTRAINT FK_T_PC_T_SWITCH_SIGNAL_MONITOR_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_ALERT_TASK
    ADD CONSTRAINT FK_T_HIS_T_ALERT_TASK FOREIGN KEY(id_his) REFERENCES T_HIS (id_his) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_USING_USER_PATTERN
    ADD CONSTRAINT FK_T_POLICY_QCGUIDELINE_CUSTOM_T_USING_USER_PATTERN FOREIGN KEY(id_policy) REFERENCES T_POLICY_QCGUIDELINE_CUSTOM (id_policy) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_USING_USER_PATTERN
    ADD CONSTRAINT FK_T_USRPTRNFILE_T_USING_USER_PATTERN FOREIGN KEY(id_file) REFERENCES T_USRPTRNFILE (id_file) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_LOG_REPLACE_MONITOR
    ADD CONSTRAINT FK_T_MON_T_LOG_REPLACE_MONITOR FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_HISTORY_SETTING
    ADD CONSTRAINT FK_T_PC_T_HISTORY_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_MANUAL_CAL_SWITCH_SETTING
    ADD CONSTRAINT FK_T_PC_T_MANUAL_CAL_SWITCH_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_MANUAL_CAL_SWITCH_DISPLAY_SETTING
    ADD CONSTRAINT FK_T_MANUAL_CAL_SWITCH_SETTING_T_MANUAL_CAL_SWITCH_DISPLAY_SETTING FOREIGN KEY(id_pc) REFERENCES T_MANUAL_CAL_SWITCH_SETTING (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_LIFETIME_EXPECTANCY
    ADD CONSTRAINT FK_T_PC_T_LIFETIME_EXPECTANCY FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_LIFETIME_EXPECTANCY
    ADD CONSTRAINT FK_T_CALMODE_T_LIFETIME_EXPECTANCY FOREIGN KEY(id_cal) REFERENCES T_CALMODE (id_cal) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_USER_ROLE
    ADD CONSTRAINT FK_T_GROUP_T_USER_ROLE FOREIGN KEY(id_group) REFERENCES T_GROUP (id_group) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_USER
    ADD CONSTRAINT FK_T_USER_ROLE_T_USER FOREIGN KEY(id_user_role) REFERENCES T_USER_ROLE (id_user_role) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_MOUSE_POINTER_MOVE_SETTING
    ADD CONSTRAINT FK_T_PC_T_MOUSE_POINTER_MOVE_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_IMAGE_ROTATION_PLUS_SETTING
    ADD CONSTRAINT FK_T_PC_T_IMAGE_ROTATION_PLUS_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_SWITCH_AND_GO_DETECTED_POSITION
    ADD CONSTRAINT FK_T_PC_T_SWITCH_AND_GO_DETECTED_POSITION FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_AMBIENT_ILLUMINANCE_MONITORING_SETTING
    ADD CONSTRAINT FK_T_PC_T_AMBIENT_ILLUMINANCE_MONITORING_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_EV_MONITOR_BRIGHTNESS_SETTING
    ADD CONSTRAINT FK_T_PC_T_EV_MONITOR_BRIGHTNESS_SETTING FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_EV_MONITOR_BRIGHTNESS_REGISTRATION
    ADD CONSTRAINT FK_T_PC_T_EV_MONITOR_BRIGHTNESS_REGISTRATION FOREIGN KEY(id_pc) REFERENCES T_PC (id_pc) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_EV_MONITOR_BRIGHTNESS_REGISTRATION
    ADD CONSTRAINT FK_T_MON_T_EV_MONITOR_BRIGHTNESS_REGISTRATION FOREIGN KEY(id_mon) REFERENCES T_MON (id_mon) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE T_QCGUIDELINE_TEST_INFO
    ADD CONSTRAINT FK_T_QCGUIDELINE_T_QCGUIDELINE_TEST_INFO FOREIGN KEY(id_qcguideline) REFERENCES T_QCGUIDELINE (id_qcguideline) ON UPDATE NO ACTION ON DELETE NO ACTION
go
CREATE VIEW V_AUTO_CAL_SWITCH_SETTING
    (id,t_pc_id_pc,t_auto_cal_switch_setting_auto_cal_switch_enabled_flg,
    t_auto_cal_switch_setting_operation_monitor_enabled_flg,t_auto_cal_switch_setting_unregistered_calmode_type,
    t_auto_cal_switch_registration_registered_application_name,t_auto_cal_switch_setting_registration_registered_process_name,
    t_auto_cal_switch_setting_registration_registered_calmode_type)
AS
SELECT	
(	
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +	
ISNULL(CONVERT(nvarchar(10), T_AUTO_CAL_SWITCH_SETTING.id_pc), 'NULL') + '_' +	
ISNULL(CONVERT(nvarchar(10), T_AUTO_CAL_SWITCH_REGISTRATION.id_registration), 'NULL')	
)	
AS Id,
T_PC.id_pc t_pc_id_pc,
T_AUTO_CAL_SWITCH_SETTING.auto_cal_switch_enabled_flg t_auto_cal_switch_setting_auto_cal_switch_enabled_flg,
T_AUTO_CAL_SWITCH_SETTING.operation_monitor_enabled_flg t_auto_cal_switch_setting_operation_monitor_enabled_flg,
T_AUTO_CAL_SWITCH_SETTING.unregistered_calmode_type t_auto_cal_switch_setting_unregistered_calmode_type,
T_AUTO_CAL_SWITCH_REGISTRATION.registered_application_name t_auto_cal_switch_registration_registered_application_name,
T_AUTO_CAL_SWITCH_REGISTRATION.registered_process_name t_auto_cal_switch_setting_registration_registered_process_name,
T_AUTO_CAL_SWITCH_REGISTRATION.registered_calmode_type t_auto_cal_switch_setting_registration_registered_calmode_type
FROM (
T_PC
left outer join T_AUTO_CAL_SWITCH_SETTING on T_PC.id_pc = T_AUTO_CAL_SWITCH_SETTING.id_pc
left outer join T_AUTO_CAL_SWITCH_REGISTRATION on T_AUTO_CAL_SWITCH_SETTING.id_pc = T_AUTO_CAL_SWITCH_REGISTRATION.id_pc
)
go
CREATE VIEW V_BACKLIGHT_SAVER_SETTING
    (id,t_pc_id_pc,
    t_backlight_saver_except_monitor_maker,t_backlight_saver_except_monitor_model,
    t_backlight_saver_except_monitor_serial_no,t_backlight_saver_url_registered_url,
    t_backlight_saver_application_registered_application_name)
AS
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_BACKLIGHT_SAVER.id_pc), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_BACKLIGHT_SAVER_URL.id_url), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_BACKLIGHT_SAVER_APPLICATION.id_application), 'NULL')
)
AS Id,
T_PC.id_pc t_pc_id_pc,
T_BACKLIGHT_SAVER.except_monitor_maker t_backlight_saver_except_monitor_maker,
T_BACKLIGHT_SAVER.except_monitor_model t_backlight_saver_except_monitor_model,
T_BACKLIGHT_SAVER.except_monitor_serial_no t_backlight_saver_except_monitor_serial_no,
T_BACKLIGHT_SAVER_URL.registered_url t_backlight_saver_url_registered_url,
T_BACKLIGHT_SAVER_APPLICATION.registered_application_name t_backlight_saver_application_registered_application_name
FROM (
T_PC 
inner join T_BACKLIGHT_SAVER on T_PC.id_pc = T_BACKLIGHT_SAVER.id_pc
left outer join T_BACKLIGHT_SAVER_URL on T_BACKLIGHT_SAVER.id_pc = T_BACKLIGHT_SAVER_URL.id_pc
left outer join T_BACKLIGHT_SAVER_APPLICATION on T_BACKLIGHT_SAVER.id_pc = T_BACKLIGHT_SAVER_APPLICATION.id_pc
)
                       
go
CREATE VIEW V_CALMODE_PROPERTY
	(
		Id, t_calmode_id_cal, t_calmode_no_cal, t_calmode_cal_name, t_calmode_fl_manage, t_calmode_setupinfocomment,
		t_calmode_comment, t_ambient_ambient_value, t_baseline_value_base_lmax, t_baseline_value_base_lmin,
		t_baseline_value_base_lamb, t_baseline_value_fl_base_available, t_policy_qc_basic_setting_id_rec, t_policy_qc_basic_setting_id_cons,
		t_policy_qc_basic_setting_fl_multimonitor, t_qcguideline_name_id_qcguideline_acceptance, t_qcguideline_name_main_name_acceptance,
		t_qcguideline_name_category_name_acceptance, t_qcguideline_name_language_acceptance, t_room_class_room_class_name_acceptance,
		t_qcguideline_name_id_qcguideline_consistency, t_qcguideline_name_main_name_consistency, t_qcguideline_name_category_name_consistency,
		t_qcguideline_name_language_consistency, t_room_class_room_class_name_consistency, t_pc_id_room, t_mon_usedtime,
		t_mon_nm_profile, t_lifetime_expectancy_lea_result, t_lifetime_expectancy_operating_time, t_lifetime_expectancy_lea_time,
		t_lifetime_expectancy_average_usage, t_core_config_backlight_meter_threshold, t_hands_off_ad_value_min,
		t_hands_off_ad_value_max
	)
AS
SELECT
	(
		ISNULL(CONVERT(NVARCHAR(10), T_CALMODE.id_cal), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_MON.id_mon), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_PC.id_pc), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_AMBIENT.id_cal), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_BASELINE_VALUE.id_cal), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), POLICY_QC_BASIC_SETTING.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), POLICY_QC_BASIC_SETTING.id_policy), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), POLICY_QC_BASIC_SETTING.t_acceptance_qcguideline_system_version_id_qcguideline_system_version_acceptance), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), POLICY_QC_BASIC_SETTING.t_qcguideline_system_version_id_qcguideline_acceptance), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), POLICY_QC_BASIC_SETTING.t_room_class_id_room_class_acceptance), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), POLICY_QC_BASIC_SETTING.t_consistency_qcguideline_system_version_id_qcguideline_system_version_consistency), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), POLICY_QC_BASIC_SETTING.t_qcguideline_system_version_id_qcguideline_consistency), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), POLICY_QC_BASIC_SETTING.t_room_class_id_room_class_consistency), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_LIFETIME_EXPECTANCY.id_lea), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_CORE_CONFIG.id_pc), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), HANDSOFF_MIN.id_cal), 'NULL') + '_' + ISNULL(CONVERT(NVARCHAR(10), HANDSOFF_MIN.operating_time), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), HANDSOFF_MAX.id_cal), 'NULL') + '_' + ISNULL(CONVERT(NVARCHAR(10), HANDSOFF_MAX.operating_time), 'NULL')
	) Id,
	T_CALMODE.id_cal t_calmode_id_cal,
	T_CALMODE.no_cal t_calmode_no_cal,
	T_CALMODE.cal_name t_calmode_cal_name,
	T_CALMODE.fl_manage t_calmode_fl_manage,
	T_CALMODE.setupinfocomment t_calmode_setupinfocomment,
	T_CALMODE.comment t_calmode_comment,
	T_AMBIENT.ambient_value t_ambient_ambient_value,
	T_BASELINE_VALUE.base_Lmax t_baseline_value_base_lmax,
	T_BASELINE_VALUE.base_Lmin t_baseline_value_base_lmin,
	T_BASELINE_VALUE.base_Lamb t_baseline_value_base_lamb,
	T_BASELINE_VALUE.fl_base_available t_baseline_value_fl_base_available,
	POLICY_QC_BASIC_SETTING.id_rec t_policy_qc_basic_setting_id_rec,
	POLICY_QC_BASIC_SETTING.id_cons t_policy_qc_basic_setting_id_cons,
	POLICY_QC_BASIC_SETTING.fl_multimonitor t_policy_qc_basic_setting_fl_multimonitor,
	POLICY_QC_BASIC_SETTING.t_qcguideline_system_version_id_qcguideline_acceptance t_qcguideline_name_id_qcguideline_acceptance,
	POLICY_QC_BASIC_SETTING.t_qcguideline_name_main_name_acceptance t_qcguideline_name_main_name_acceptance,
	POLICY_QC_BASIC_SETTING.t_qcguideline_name_category_name_acceptance t_qcguideline_name_category_name_acceptance,
	POLICY_QC_BASIC_SETTING.t_qcguideline_name_language_acceptance t_qcguideline_name_language_acceptance,
	POLICY_QC_BASIC_SETTING.t_room_class_room_class_name_acceptance t_room_class_room_class_name_acceptance,
	POLICY_QC_BASIC_SETTING.t_qcguideline_system_version_id_qcguideline_consistency t_qcguideline_name_id_qcguideline_consistency,
	POLICY_QC_BASIC_SETTING.t_qcguideline_name_main_name_consistency t_qcguideline_name_main_name_consistency,
	POLICY_QC_BASIC_SETTING.t_qcguideline_name_category_name_consistency t_qcguideline_name_category_name_consistency,
	POLICY_QC_BASIC_SETTING.t_qcguideline_name_language_consistency t_qcguideline_name_language_consistency,
	POLICY_QC_BASIC_SETTING.t_room_class_room_class_name_consistency t_room_class_room_class_name_consistency,
	T_PC.id_room t_pc_id_room,
	T_MON.usedtime t_mon_usedtime,
	T_MON.nm_profile t_mon_nm_profile,
	T_LIFETIME_EXPECTANCY.lea_result t_lifetime_expectancy_lea_result,
	T_LIFETIME_EXPECTANCY.operating_time t_lifetime_expectancy_operating_time,
	T_LIFETIME_EXPECTANCY.lea_time t_lifetime_expectancy_lea_time,
	T_LIFETIME_EXPECTANCY.average_usage_time_of_a_day t_lifetime_expectancy_average_usage,
	T_CORE_CONFIG.backlight_meter_threshold t_core_config_backlight_meter_threshold,
	HANDSOFF_MIN.ad_value t_hands_off_ad_value_min,
	HANDSOFF_MAX.ad_value t_hands_off_ad_value_max
FROM
	T_CALMODE
	INNER JOIN T_MON ON T_CALMODE.id_mon = T_MON.id_mon
	INNER JOIN T_PC ON T_MON.id_lastpc = T_PC.id_pc
	LEFT OUTER JOIN T_AMBIENT ON T_CALMODE.id_cal = T_AMBIENT.id_cal AND T_PC.id_pc = T_AMBIENT.id_pc
	LEFT OUTER JOIN T_BASELINE_VALUE ON T_CALMODE.id_cal = T_BASELINE_VALUE.id_cal
	LEFT OUTER JOIN
		(
			SELECT
				T_POLICY_GROUP_SET.id_group,
				T_POLICY_SETTING.condition_model,
				T_POLICY_SETTING.condition_calno,
				T_POLICY_QC_BASIC_SETTING.id_policy,
				T_POLICY_QC_BASIC_SETTING.id_rec,
				T_POLICY_QC_BASIC_SETTING.id_cons,
				T_POLICY_QC_BASIC_SETTING.fl_multimonitor,
				ACCEPTANCE_QCGUIDELINE_SYSTEM_VERSION.id_qcguideline_system_version t_acceptance_qcguideline_system_version_id_qcguideline_system_version_acceptance,
				ACCEPTANCE_QCGUIDELINE_SYSTEM_VERSION.id_qcguideline t_qcguideline_system_version_id_qcguideline_acceptance,
				ACCEPTANCE_QCGUIDELINE_SYSTEM_VERSION.version_radics t_qcguideline_system_version_version_radics_acceptance,
				ACCEPTANCE_QCGUIDELINE_NAME.id_qcguideline_name t_consistency_qcguideline_name_id_qcguideline_name_acceptance,
				ACCEPTANCE_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name_acceptance,
				ACCEPTANCE_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name_acceptance,
				ACCEPTANCE_QCGUIDELINE_NAME.language t_qcguideline_name_language_acceptance,
				ACCEPTANCE_ROOM_CLASS.id_room_class t_room_class_id_room_class_acceptance,
				ACCEPTANCE_ROOM_CLASS.room_class_name t_room_class_room_class_name_acceptance,
				CONSISTENCY_QCGUIDELINE_SYSTEM_VERSION.id_qcguideline_system_version t_consistency_qcguideline_system_version_id_qcguideline_system_version_consistency,
				CONSISTENCY_QCGUIDELINE_SYSTEM_VERSION.id_qcguideline t_qcguideline_system_version_id_qcguideline_consistency,
				CONSISTENCY_QCGUIDELINE_SYSTEM_VERSION.version_radics t_qcguideline_system_version_version_radics_consistency,
				CONSISTENCY_QCGUIDELINE_NAME.id_qcguideline_name t_consistency_qcguideline_name_id_qcguideline_name_consistency,
				CONSISTENCY_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name_consistency,
				CONSISTENCY_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name_consistency,
				CONSISTENCY_QCGUIDELINE_NAME.language t_qcguideline_name_language_consistency,
				CONSISTENCY_ROOM_CLASS.id_room_class t_room_class_id_room_class_consistency,
				CONSISTENCY_ROOM_CLASS.room_class_name t_room_class_room_class_name_consistency
			FROM
				T_POLICY_GROUP_SET
				INNER JOIN T_POLICY_SETTING ON T_POLICY_GROUP_SET.id_policy = T_POLICY_SETTING.id_policy AND T_POLICY_GROUP_SET.policy_type = T_POLICY_SETTING.policy_type
				INNER JOIN T_POLICY_QC_BASIC_SETTING ON T_POLICY_SETTING.id_policy = T_POLICY_QC_BASIC_SETTING.id_policy
				INNER JOIN T_QCGUIDELINE_SYSTEM_VERSION ACCEPTANCE_QCGUIDELINE_SYSTEM_VERSION ON T_POLICY_QC_BASIC_SETTING.id_rec = ACCEPTANCE_QCGUIDELINE_SYSTEM_VERSION.id_qcguideline
				INNER JOIN T_QCGUIDELINE_NAME ACCEPTANCE_QCGUIDELINE_NAME ON ACCEPTANCE_QCGUIDELINE_SYSTEM_VERSION.id_qcguideline = ACCEPTANCE_QCGUIDELINE_NAME.id_qcguideline AND ACCEPTANCE_QCGUIDELINE_SYSTEM_VERSION.version_qcguideline = ACCEPTANCE_QCGUIDELINE_NAME.version
				LEFT OUTER JOIN T_ROOM_CLASS ACCEPTANCE_ROOM_CLASS ON T_POLICY_QC_BASIC_SETTING.id_room_class_rec = ACCEPTANCE_ROOM_CLASS.id_room_class
				INNER JOIN T_QCGUIDELINE_SYSTEM_VERSION CONSISTENCY_QCGUIDELINE_SYSTEM_VERSION ON T_POLICY_QC_BASIC_SETTING.id_cons = CONSISTENCY_QCGUIDELINE_SYSTEM_VERSION.id_qcguideline
				INNER JOIN T_QCGUIDELINE_NAME CONSISTENCY_QCGUIDELINE_NAME ON CONSISTENCY_QCGUIDELINE_SYSTEM_VERSION.id_qcguideline = CONSISTENCY_QCGUIDELINE_NAME.id_qcguideline AND CONSISTENCY_QCGUIDELINE_SYSTEM_VERSION.version_qcguideline = CONSISTENCY_QCGUIDELINE_NAME.version
				LEFT OUTER JOIN T_ROOM_CLASS CONSISTENCY_ROOM_CLASS ON T_POLICY_QC_BASIC_SETTING.id_room_class_cons = CONSISTENCY_ROOM_CLASS.id_room_class
			WHERE
				T_POLICY_GROUP_SET.policy_type = 0
		) POLICY_QC_BASIC_SETTING
			ON T_PC.id_room = POLICY_QC_BASIC_SETTING.id_group
				AND T_MON.nm_profile = POLICY_QC_BASIC_SETTING.condition_model
				AND T_CALMODE.no_cal = POLICY_QC_BASIC_SETTING.condition_calno
				AND (CONVERT(NVARCHAR(3), T_PC.ver_major) + '.' + CONVERT(NVARCHAR(3), T_PC.ver_minor) + '.' + CONVERT(NVARCHAR(3), T_PC.ver_build) + '.' + CONVERT(NVARCHAR(3), T_PC.ver_revision)) = POLICY_QC_BASIC_SETTING.t_qcguideline_system_version_version_radics_acceptance
				AND (CONVERT(NVARCHAR(3), T_PC.ver_major) + '.' + CONVERT(NVARCHAR(3), T_PC.ver_minor) + '.' + CONVERT(NVARCHAR(3), T_PC.ver_build) + '.' + CONVERT(NVARCHAR(3), T_PC.ver_revision)) = POLICY_QC_BASIC_SETTING.t_qcguideline_system_version_version_radics_consistency
	LEFT OUTER JOIN T_LIFETIME_EXPECTANCY
		ON T_LIFETIME_EXPECTANCY.id_pc = T_PC.id_pc
			AND T_CALMODE.id_cal = T_LIFETIME_EXPECTANCY.id_cal
			AND T_LIFETIME_EXPECTANCY.fl_lea_enable = 1
			AND T_LIFETIME_EXPECTANCY.operating_time =
				(
					SELECT MAX(operating_time)
					FROM T_LIFETIME_EXPECTANCY
					WHERE T_LIFETIME_EXPECTANCY.id_pc = T_PC.id_pc AND T_CALMODE.id_cal = T_LIFETIME_EXPECTANCY.id_cal AND T_LIFETIME_EXPECTANCY.fl_lea_enable = 1
				)
	LEFT OUTER JOIN T_CORE_CONFIG ON T_CORE_CONFIG.id_pc = T_PC.id_pc
	LEFT OUTER JOIN T_HANDS_OFF HANDSOFF_MIN
		ON HANDSOFF_MIN.id_cal = T_CALMODE.id_cal
			AND HANDSOFF_MIN.operating_time =
				(
					SELECT MIN(operating_time)
					FROM T_HANDS_OFF
					WHERE (id_cal = T_CALMODE.id_cal)
				)
	LEFT OUTER JOIN T_HANDS_OFF HANDSOFF_MAX
		ON HANDSOFF_MAX.id_cal = T_CALMODE.id_cal
			AND HANDSOFF_MAX.operating_time =
				(
					SELECT MAX(operating_time)
					FROM T_HANDS_OFF
					WHERE (id_cal = T_CALMODE.id_cal)
				)
go
CREATE VIEW V_PC_SETTING
    (id,t_pc_id_pc,t_pc_nm_pc,t_pc_nm_pc_manufacturer,t_pc_nm_pc_model,
    t_pc_nm_pc_serial,t_pc_nm_platform_type,t_pc_platform_type,t_pc_ipaddr,
    t_pc_version,t_pc_language,t_display_no_screen,t_display_coordinate_x,
    t_display_coordinate_y,t_display_width,t_display_height,t_display_scaled_width,
    t_display_scaled_height,t_display_scale_rate,t_display_vertical_monitor_count,
    t_display_horizontal_monitor_count,t_display_screen_type,t_graphics_card_no_screen,
    t_graphics_card_card_name,t_graphics_card_card_maker,t_graphics_card_serial_no,
    t_graphics_card_driver_name,t_graphics_card_driver_version,t_graphics_card_dt_buy,
    t_graphics_card_id_slot,t_core_config_radinetpro_sequence_interval,
    t_core_config_radinetpro_connection_notice_interval,t_core_config_backlight_meter_threshold,
    t_core_config_baseline_value_lamb_threshold_others,t_core_config_monitor_detection_manage_flg,
    t_core_config_startup_monitor_detection_flg,t_core_config_auto_registration_information_flg,
    t_core_config_dinqsrlonr_report_lang,t_core_config_lea_noise_deleting_threshold,
    t_core_config_backlight_sensor_ad_threshold,t_core_config_illuminance_correlation_threshold,
    t_core_config_illuminance_correlation_coefficient_min,t_core_config_illuminance_correlation_coefficient_max,
    t_core_config_ambient_luminance_correlation_threshold,t_core_config_ambient_luminance_correlation_coefficient_min,
    t_core_config_ambient_luminance_correlation_coefficient_max,t_core_config_baseline_value_lamb_threshold_din6868_157,
    t_core_config_selfqc_history_flg,t_core_config_forced_termination_standby_time,
    t_core_config_forced_termination_condition_monitoring_time,t_core_config_cancel_ambient_illuminance_flg,
    t_core_config_lang,t_core_config_log_level,t_core_config_fl_remote_sensor_priority,
    t_core_config_fl_display_ambient,t_registration_item1,t_registration_item2,
    t_registration_item3,t_registration_item4,t_registration_item5,t_registration_item6,
    t_registration_item7,t_registration_item8,t_sensor_setting_fl_lx_plus_enable,
    t_sensor_setting_fl_cd_lux_enable,t_sensor_setting_fl_ls_100_enable,
    t_sensor_setting_fl_ssm_enable,t_sensor_setting_fl_manual_enable,t_sensor_setting_sensor_serial_ls_100,
    t_sensor_setting_sensor_model_manual,t_sensor_setting_sensor_serial_manual,
    t_sensor_setting_fl_chromaticity_measurement_enable,t_sensor_setting_sensor_serial_cd_lux,
    t_password_advanced_mode_password,t_password_maintenance_mode_password,
    t_switch_signal_setting_switch_signal_enabled_flg,t_switch_signal_setting_switch_signal_interlocking_type,
    t_user_mode_setting_consistency_test_display_flg,t_user_mode_setting_work_and_flow_display_flg,
    t_history_setting_fl_his_backup,t_history_setting_backup_folder,t_history_setting_fl_his_export,
    t_history_setting_export_folder,t_manual_cal_switch_setting_manual_cal_switch_enabled_flg,
    t_manual_cal_switch_setting_same_model_applied_flg,t_manual_cal_switch_setting_window_size_type,
    t_manual_cal_switch_setting_x_coordinate,t_manual_cal_switch_setting_y_coordinate,
    t_manual_cal_switch_display_setting_model_name,t_manual_cal_switch_display_setting_calmode_type,
    t_manual_cal_switch_display_setting_cal_switch_button_display_flg,t_mouse_pointer_move_setting_multimonitor_move_flg,
    t_mouse_pointer_move_setting_warp_move_flg,t_mouse_pointer_move_setting_home_position_move_flg,
    t_mouse_pointer_move_setting_display_position_flg,t_image_rotation_plus_setting_image_rotation_plus_flg,
    t_image_rotation_plus_setting_rotation_direction)
AS
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_DISPLAY.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_DISPLAY.no_screen), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.no_screen), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_CORE_CONFIG.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_REGISTRATION.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_SENSOR_SETTING.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_PASSWORD.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_SWITCH_SIGNAL_SETTING.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_USER_MODE_SETTING.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_HISTORY_SETTING.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_MANUAL_CAL_SWITCH_SETTING.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_MANUAL_CAL_SWITCH_DISPLAY_SETTING.id_manual_cal_switch_display_setting), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_MOUSE_POINTER_MOVE_SETTING.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_IMAGE_ROTATION_PLUS_SETTING.id_pc), 'NULL')
)	
AS 
Id,
T_PC.id_pc t_pc_id_pc,
T_PC.nm_pc t_pc_nm_pc,
T_PC.nm_pc_manufacturer t_pc_nm_pc_manufacturer,
T_PC.nm_pc_model t_pc_nm_pc_model,
T_PC.nm_pc_serial t_pc_nm_pc_serial,
T_PC.nm_platform_type t_pc_nm_platform_type,
T_PC.platform_type t_pc_platform_type,
T_PC.ipaddr t_pc_ipaddr,
CONCAT(T_PC.ver_major, '.', T_PC.ver_minor, '.', T_PC.ver_build, '.',T_PC.ver_revision) t_pc_version,
T_PC.lang_radics t_pc_language,
T_DISPLAY.no_screen t_display_no_screen,
T_DISPLAY.coordinate_x t_display_coordinate_x,
T_DISPLAY.coordinate_y t_display_coordinate_y,
T_DISPLAY.width t_display_width,
T_DISPLAY.height t_display_height,
T_DISPLAY.scaled_width t_display_scaled_width,
T_DISPLAY.scaled_height t_display_scaled_height,
T_DISPLAY.scale_rate t_display_scale_rate,
T_DISPLAY.vertical_monitor_count t_display_vertical_monitor_count,
T_DISPLAY.horizontal_monitor_count t_display_horizontal_monitor_count,
T_DISPLAY.screen_type t_display_screen_type,
T_GRAPHICS_CARD.no_screen t_graphics_card_no_screen,
T_GRAPHICS_CARD.card_name t_graphics_card_card_name,
T_GRAPHICS_CARD.card_maker t_graphics_card_card_maker,
T_GRAPHICS_CARD.serial_no t_graphics_card_serial_no,
T_GRAPHICS_CARD.driver_name t_graphics_card_driver_name,
T_GRAPHICS_CARD.driver_version t_graphics_card_driver_version,
T_GRAPHICS_CARD.dt_buy t_graphics_card_dt_buy,
T_GRAPHICS_CARD.id_slot t_graphics_card_id_slot,
T_CORE_CONFIG.radinetpro_sequence_interval t_core_config_radinetpro_sequence_interval,
T_CORE_CONFIG.radinetpro_connection_notice_interval t_core_config_radinetpro_connection_notice_interval,
T_CORE_CONFIG.backlight_meter_threshold t_core_config_backlight_meter_threshold,
T_CORE_CONFIG.baseline_value_lamb_threshold_others t_core_config_baseline_value_lamb_threshold_others,
T_CORE_CONFIG.monitor_detection_manage_flg t_core_config_monitor_detection_manage_flg,
T_CORE_CONFIG.startup_monitor_detection_flg t_core_config_startup_monitor_detection_flg,
T_CORE_CONFIG.auto_registration_information_flg t_core_config_auto_registration_information_flg,
T_CORE_CONFIG.report_lang t_core_config_dinqsrlonr_report_lang,
T_CORE_CONFIG.lea_noise_deleting_threshold t_core_config_lea_noise_deleting_threshold,
T_CORE_CONFIG.backlight_sensor_ad_threshold t_core_config_backlight_sensor_ad_threshold,
T_CORE_CONFIG.illuminance_correlation_threshold t_core_config_illuminance_correlation_threshold,
T_CORE_CONFIG.illuminance_correlation_coefficient_min t_core_config_illuminance_correlation_coefficient_min,
T_CORE_CONFIG.illuminance_correlation_coefficient_max t_core_config_illuminance_correlation_coefficient_max,
T_CORE_CONFIG.ambient_luminance_correlation_threshold t_core_config_ambient_luminance_correlation_threshold,
T_CORE_CONFIG.ambient_luminance_correlation_coefficient_min t_core_config_ambient_luminance_correlation_coefficient_min,
T_CORE_CONFIG.ambient_luminance_correlation_coefficient_max t_core_config_ambient_luminance_correlation_coefficient_max,
T_CORE_CONFIG.baseline_value_lamb_threshold_din6868_157 t_core_config_baseline_value_lamb_threshold_din6868_157,
T_CORE_CONFIG.selfqc_history_flg t_core_config_selfqc_history_flg,
T_CORE_CONFIG.forced_termination_standby_time t_core_config_forced_termination_standby_time,
T_CORE_CONFIG.forced_termination_condition_monitoring_time t_core_config_forced_termination_condition_monitoring_time,
T_CORE_CONFIG.cancel_ambient_illuminance_flg t_core_config_cancel_ambient_illuminance_flg,
T_CORE_CONFIG.lang t_core_config_lang,
T_CORE_CONFIG.log_level t_core_config_log_level,
T_CORE_CONFIG.fl_remote_sensor_priority t_core_config_fl_remote_sensor_priority,
T_CORE_CONFIG.fl_display_ambient t_core_config_fl_display_ambient,
T_REGISTRATION.item1 t_registration_item1,
T_REGISTRATION.item2 t_registration_item2,
T_REGISTRATION.item3 t_registration_item3,
T_REGISTRATION.item4 t_registration_item4,
T_REGISTRATION.item5 t_registration_item5,
T_REGISTRATION.item6 t_registration_item6,
T_REGISTRATION.item7 t_registration_item7,
T_REGISTRATION.item8 t_registration_item8,
T_SENSOR_SETTING.fl_lx_plus_enable t_sensor_setting_fl_lx_plus_enable,
T_SENSOR_SETTING.fl_cd_lux_enable t_sensor_setting_fl_cd_lux_enable,
T_SENSOR_SETTING.fl_ls_100_enable t_sensor_setting_fl_ls_100_enable,
T_SENSOR_SETTING.fl_ssm_enable t_sensor_setting_fl_ssm_enable,
T_SENSOR_SETTING.fl_manual_enable t_sensor_setting_fl_manual_enable,
T_SENSOR_SETTING.sensor_serial_ls_100 t_sensor_setting_sensor_serial_ls_100,
T_SENSOR_SETTING.sensor_model_manual t_sensor_setting_sensor_model_manual,
T_SENSOR_SETTING.sensor_serial_manual t_sensor_setting_sensor_serial_manual,
T_SENSOR_SETTING.fl_chromaticity_measurement_enable t_sensor_setting_fl_chromaticity_measurement_enable,
T_SENSOR_SETTING.sensor_serial_cd_lux t_sensor_setting_sensor_serial_cd_lux,
T_PASSWORD.advanced_mode_password t_password_advanced_mode_password,
T_PASSWORD.maintenance_mode_password t_password_maintenance_mode_password,
T_SWITCH_SIGNAL_SETTING.switch_signal_enabled_flg t_switch_signal_setting_switch_signal_enabled_flg,
T_SWITCH_SIGNAL_SETTING.switch_signal_interlocking_type t_switch_signal_setting_switch_signal_interlocking_type,
T_USER_MODE_SETTING.consistency_test_display_flg t_user_mode_setting_consistency_test_display_flg,
T_USER_MODE_SETTING.work_and_flow_display_flg t_user_mode_setting_work_and_flow_display_flg,
T_HISTORY_SETTING.fl_his_backup t_history_setting_fl_his_backup,
T_HISTORY_SETTING.backup_folder t_history_setting_backup_folder,
T_HISTORY_SETTING.fl_his_export t_history_setting_fl_his_export,
T_HISTORY_SETTING.export_folder t_history_setting_export_folder,
T_MANUAL_CAL_SWITCH_SETTING.manual_cal_switch_enabled_flg t_manual_cal_switch_setting_manual_cal_switch_enabled_flg,
T_MANUAL_CAL_SWITCH_SETTING.same_model_applied_flg t_manual_cal_switch_setting_same_model_applied_flg,
T_MANUAL_CAL_SWITCH_SETTING.window_size_type t_manual_cal_switch_setting_window_size_type,
T_MANUAL_CAL_SWITCH_SETTING.x_coordinate t_manual_cal_switch_setting_x_coordinate,
T_MANUAL_CAL_SWITCH_SETTING.y_coordinate t_manual_cal_switch_setting_y_coordinate,
T_MANUAL_CAL_SWITCH_DISPLAY_SETTING.model_name t_manual_cal_switch_display_setting_model_name,
T_MANUAL_CAL_SWITCH_DISPLAY_SETTING.calmode_type t_manual_cal_switch_display_setting_calmode_type,
T_MANUAL_CAL_SWITCH_DISPLAY_SETTING.cal_switch_button_display_flg t_manual_cal_switch_display_setting_cal_switch_button_display_flg,
T_MOUSE_POINTER_MOVE_SETTING.multimonitor_move_flg t_mouse_pointer_move_setting_multimonitor_move_flg,
T_MOUSE_POINTER_MOVE_SETTING.warp_move_flg t_mouse_pointer_move_setting_warp_move_flg,
T_MOUSE_POINTER_MOVE_SETTING.home_position_move_flg t_mouse_pointer_move_setting_home_position_move_flg,
T_MOUSE_POINTER_MOVE_SETTING.display_position_flg t_mouse_pointer_move_setting_display_position_flg,
T_IMAGE_ROTATION_PLUS_SETTING.image_rotation_plus_flg t_image_rotation_plus_setting_image_rotation_plus_flg,
T_IMAGE_ROTATION_PLUS_SETTING.rotation_direction t_image_rotation_plus_setting_rotation_direction
FROM (
T_PC
inner join T_DISPLAY on T_PC.id_pc = T_DISPLAY.id_pc
inner join T_GRAPHICS_CARD on T_DISPLAY.no_screen = T_GRAPHICS_CARD.no_screen AND T_DISPLAY.id_pc = T_GRAPHICS_CARD.id_pc
left outer join T_CORE_CONFIG on T_PC.id_pc = T_CORE_CONFIG.id_pc
inner join T_REGISTRATION on T_PC.id_pc = T_REGISTRATION.id_pc
left outer join T_SENSOR_SETTING on T_PC.id_pc = T_SENSOR_SETTING.id_pc
inner join T_PASSWORD on T_PC.id_pc = T_PASSWORD.id_pc
left outer join T_SWITCH_SIGNAL_SETTING on T_PC.id_pc = T_SWITCH_SIGNAL_SETTING.id_pc
left outer join T_USER_MODE_SETTING on T_PC.id_pc = T_USER_MODE_SETTING.id_pc
inner join T_HISTORY_SETTING on T_PC.id_pc = T_HISTORY_SETTING.id_pc
left outer join T_MANUAL_CAL_SWITCH_SETTING on T_PC.id_pc = T_MANUAL_CAL_SWITCH_SETTING.id_pc
left outer join T_MANUAL_CAL_SWITCH_DISPLAY_SETTING on T_MANUAL_CAL_SWITCH_SETTING.id_pc = T_MANUAL_CAL_SWITCH_DISPLAY_SETTING.id_pc
left outer join T_MOUSE_POINTER_MOVE_SETTING on T_PC.id_pc = T_MOUSE_POINTER_MOVE_SETTING.id_pc
left outer join T_IMAGE_ROTATION_PLUS_SETTING on T_PC.id_pc = T_IMAGE_ROTATION_PLUS_SETTING.id_pc
)
go
CREATE VIEW V_POINT_AND_FOCUS_SETTING
    (id,t_pc_id_pc,t_point_and_focus_setting_point_and_focus_flg,t_point_and_focus_setting_shape_type,
    t_point_and_focus_setting_horizontal_flg,t_point_and_focus_setting_symmetrical_rectangle_flg,
    t_point_and_focus_setting_rectangle_flg,t_point_and_focus_setting_distinguishes_pbyp_border_flg,
    t_point_and_focus_setting_shape_horizontal_size,t_point_and_focus_setting_shape_rectangle_size,
    t_point_and_focus_setting_base_area_cal_mode,t_point_and_focus_setting_high_light_area_cal_mode,
    t_point_and_focus_setting_operation_fix,t_point_and_focus_setting_operation_fix_modifier_key,
    t_point_and_focus_setting_operation_remove,t_point_and_focus_setting_operation_remove_modifier_key,
    t_point_and_focus_setting_operation_shape_switch,t_point_and_focus_setting_operation_shape_switch_modifier_key,
    t_point_and_focus_setting_operation_resize,t_point_and_focus_setting_operation_resize_modifier_key,
    t_point_and_focus_setting_operation_cal_mode_switch,t_point_and_focus_setting_operation_cal_mode_switch_modifier_key,
    t_point_and_focus_setting_operation_display,t_point_and_focus_setting_operation_display_modifier_key,
    t_point_and_focus_setting_preview_timeout,t_point_and_focus_highlight_calmode_list_high_light_area_cal_mode_index,
    t_point_and_focus_highlight_calmode_list_high_light_area_cal_mode_value)
AS
SELECT	
(	
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' + 	
ISNULL(CONVERT(nvarchar(10), T_POINT_AND_FOCUS_SETTING.id_pc), 'NULL') + '_' + 	
ISNULL(CONVERT(nvarchar(10), T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST.id_pc), 'NULL') + '_' + 	
ISNULL(CONVERT(nvarchar(10), T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST.high_light_area_cal_mode_index), 'NULL')	
)	
AS Id,	
T_PC.id_pc t_pc_id_pc,
T_POINT_AND_FOCUS_SETTING.point_and_focus_flg t_point_and_focus_setting_point_and_focus_flg,
T_POINT_AND_FOCUS_SETTING.shape_type t_point_and_focus_setting_shape_type,
T_POINT_AND_FOCUS_SETTING.horizontal_flg t_point_and_focus_setting_horizontal_flg,
T_POINT_AND_FOCUS_SETTING.symmetrical_rectangle_flg t_point_and_focus_setting_symmetrical_rectangle_flg,
T_POINT_AND_FOCUS_SETTING.rectangle_flg t_point_and_focus_setting_rectangle_flg,
T_POINT_AND_FOCUS_SETTING.distinguishes_pbyp_border_flg t_point_and_focus_setting_distinguishes_pbyp_border_flg,
T_POINT_AND_FOCUS_SETTING.shape_horizontal_size t_point_and_focus_setting_shape_horizontal_size,
T_POINT_AND_FOCUS_SETTING.shape_rectangle_size t_point_and_focus_setting_shape_rectangle_size,
T_POINT_AND_FOCUS_SETTING.base_area_cal_mode t_point_and_focus_setting_base_area_cal_mode,
T_POINT_AND_FOCUS_SETTING.high_light_area_cal_mode t_point_and_focus_setting_high_light_area_cal_mode,
T_POINT_AND_FOCUS_SETTING.operation_fix t_point_and_focus_setting_operation_fix,
T_POINT_AND_FOCUS_SETTING.operation_fix_modifier_key t_point_and_focus_setting_operation_fix_modifier_key,
T_POINT_AND_FOCUS_SETTING.operation_remove t_point_and_focus_setting_operation_remove,
T_POINT_AND_FOCUS_SETTING.operation_remove_modifier_key t_point_and_focus_setting_operation_remove_modifier_key,
T_POINT_AND_FOCUS_SETTING.operation_shape_switch t_point_and_focus_setting_operation_shape_switch,
T_POINT_AND_FOCUS_SETTING.operation_shape_switch_modifier_key t_point_and_focus_setting_operation_shape_switch_modifier_key,
T_POINT_AND_FOCUS_SETTING.operation_resize t_point_and_focus_setting_operation_resize,
T_POINT_AND_FOCUS_SETTING.operation_resize_modifier_key t_point_and_focus_setting_operation_resize_modifier_key,
T_POINT_AND_FOCUS_SETTING.operation_cal_mode_switch t_point_and_focus_setting_operation_cal_mode_switch,
T_POINT_AND_FOCUS_SETTING.operation_cal_mode_switch_modifier_key t_point_and_focus_setting_operation_cal_mode_switch_modifier_key,
T_POINT_AND_FOCUS_SETTING.operation_display t_point_and_focus_setting_operation_display,
T_POINT_AND_FOCUS_SETTING.operation_display_modifier_key t_point_and_focus_setting_operation_display_modifier_key,
T_POINT_AND_FOCUS_SETTING.preview_timeout t_point_and_focus_setting_preview_timeout,
T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST.high_light_area_cal_mode_index t_point_and_focus_highlight_calmode_list_high_light_area_cal_mode_index,
T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST.high_light_area_cal_mode_value t_point_and_focus_highlight_calmode_list_high_light_area_cal_mode_value
FROM (
T_PC
left outer join T_POINT_AND_FOCUS_SETTING on T_PC.id_pc = T_POINT_AND_FOCUS_SETTING.id_pc
left outer join T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST on T_POINT_AND_FOCUS_SETTING.id_pc = T_POINT_AND_FOCUS_HIGHLIGHT_CALMODE_LIST.id_pc
)
go
CREATE VIEW V_QCGUIDELINE_PLUGIN_POLICY
    (id,t_policy_group_set_id_group,t_policy_qcguideline_custom_id_qcguideline,
    t_policy_qcguideline_custom_version,t_policy_qcguideline_custom_qcguideline_plugin_version,
    t_qcguideline_type,t_qcguideline_supported_inch_size,t_qcguideline_supported_resolution_x,
    t_qcguideline_supported_resolution_y,t_qcguideline_name_short_name,
    t_qcguideline_name_long_name,t_qcguideline_name_main_name,t_qcguideline_name_category_name,
    t_policy_qcguideline_test_task_type,t_policy_qcguideline_test_task_seq,
    t_policy_qcguideline_test_json_custom_test,t_policy_qcguideline_test_support_sensor_type,
    t_policy_qcguideline_test_enable_lamb_setting_flg,t_policy_qcguideline_test_enable_baseline_setting_flg,
    changer,t_pc_id_pc)
AS
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_POLICY_GROUP_SET.id_group), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_GROUP_SET.policy_type), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_GROUP_SET.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_QCGUIDELINE_CUSTOM.id_policy), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE.id_qcguideline), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_POLICY_QCGUIDELINE_TEST.id_policy), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_POLICY_QCGUIDELINE_TEST.task_type), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_POLICY_QCGUIDELINE_TEST.task_seq), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_USER.id_user), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL')
)
AS Id,
T_POLICY_GROUP_SET.id_group t_policy_group_set_id_group,
T_POLICY_QCGUIDELINE_CUSTOM.id_qcguideline t_policy_qcguideline_custom_id_qcguideline,
T_POLICY_QCGUIDELINE_CUSTOM.version t_policy_qcguideline_custom_version,
T_POLICY_QCGUIDELINE_CUSTOM.qcguideline_plugin_version t_policy_qcguideline_custom_qcguideline_plugin_version,
T_QCGUIDELINE.type t_qcguideline_type,
T_QCGUIDELINE.supported_inch_size t_qcguideline_supported_inch_size,
T_QCGUIDELINE.supported_resolution_x t_qcguideline_supported_resolution_x,
T_QCGUIDELINE.supported_resolution_y t_qcguideline_supported_resolution_y,
T_QCGUIDELINE_NAME.short_name t_qcguideline_name_short_name,
T_QCGUIDELINE_NAME.long_name t_qcguideline_name_long_name,
T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,
T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,
T_POLICY_QCGUIDELINE_TEST.task_type t_policy_qcguideline_test_task_type,
T_POLICY_QCGUIDELINE_TEST.task_seq t_policy_qcguideline_test_task_seq,
T_POLICY_QCGUIDELINE_TEST.json_custom_test t_policy_qcguideline_test_json_custom_test,
T_POLICY_QCGUIDELINE_TEST.support_sensor_type t_policy_qcguideline_test_support_sensor_type,
T_POLICY_QCGUIDELINE_TEST.enable_lamb_setting_flg t_policy_qcguideline_test_enable_lamb_setting_flg,
T_POLICY_QCGUIDELINE_TEST.enable_baseline_setting_flg t_policy_qcguideline_test_enable_baseline_setting_flg,
CASE WHEN T_PC.id_gateway = T_USER.id_group THEN T_USER.nm_tester ELSE 'RadiNET Pro' END changer,
T_PC.id_pc t_pc_id_pc
FROM (
T_POLICY_GROUP_SET INNER JOIN T_POLICY_QCGUIDELINE_CUSTOM ON T_POLICY_GROUP_SET.id_policy = T_POLICY_QCGUIDELINE_CUSTOM.id_policy AND T_POLICY_GROUP_SET.policy_type = 1
INNER JOIN T_QCGUIDELINE ON T_POLICY_QCGUIDELINE_CUSTOM.id_qcguideline = T_QCGUIDELINE.id_qcguideline
INNER JOIN T_PC on T_POLICY_GROUP_SET.id_group = T_PC.id_room
INNER JOIN T_QCGUIDELINE_NAME ON T_POLICY_QCGUIDELINE_CUSTOM.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND T_POLICY_QCGUIDELINE_CUSTOM.version = T_QCGUIDELINE_NAME.version AND T_QCGUIDELINE_NAME.language =
(CASE
WHEN T_PC.lang_radics = 0 THEN 'en-US'
WHEN T_PC.lang_radics = 1 THEN 'ja-JP'
WHEN T_PC.lang_radics = 2 THEN 'de-DE'
WHEN T_PC.lang_radics = 3 THEN 'zh-CN'
WHEN T_PC.lang_radics = 4 THEN 'fr-FR'
END)
INNER JOIN T_POLICY_QCGUIDELINE_TEST ON T_POLICY_QCGUIDELINE_CUSTOM.id_policy = T_POLICY_QCGUIDELINE_TEST.id_policy
INNER JOIN T_USER on T_POLICY_GROUP_SET.id_user_set = T_USER.id_user
)
go
CREATE VIEW V_SWITCH_AND_GO_SETTING
    (id,t_pc_id_pc,t_switch_and_go_setting_switch_and_go_flg,t_switch_and_go_setting_correspondence_monitor_model,
    t_switch_and_go_setting_correspondence_monitor_serial,t_switch_and_go_setting_mouse_operation_flg,
    t_switch_and_go_setting_detected_position_target_monitor_type,t_switch_and_go_setting_detected_position_target_monitor_model,
    t_switch_and_go_setting_detected_position_target_monitor_serial,t_switch_and_go_setting_switch_timing,
    t_switch_and_go_setting_hot_key_flg,t_switch_and_go_detected_position_detected_position,
    t_switch_and_go_detected_position_detected_position_start_point_x,t_switch_and_go_detected_position_detected_position_start_point_y,
    t_switch_and_go_detected_position_detected_position_end_point_x,t_switch_and_go_detected_position_detected_position_end_point_y)
AS
SELECT	
(	
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' + 	
ISNULL(CONVERT(nvarchar(10), T_SWITCH_AND_GO_SETTING.id_pc), 'NULL') + '_' + 	
ISNULL(CONVERT(nvarchar(10), T_SWITCH_AND_GO_DETECTED_POSITION.id_switch_and_go_detected_position), 'NULL') + '_' + 	
ISNULL(CONVERT(nvarchar(10), T_SWITCH_AND_GO_DETECTED_POSITION.id_pc), 'NULL')	
)	
AS Id,	
T_PC.id_pc t_pc_id_pc,
T_SWITCH_AND_GO_SETTING.switch_and_go_flg t_switch_and_go_setting_switch_and_go_flg,
T_SWITCH_AND_GO_SETTING.correspondence_monitor_model t_switch_and_go_setting_correspondence_monitor_model,
T_SWITCH_AND_GO_SETTING.correspondence_monitor_serial t_switch_and_go_setting_correspondence_monitor_serial,
T_SWITCH_AND_GO_SETTING.mouse_operation_flg t_switch_and_go_setting_mouse_operation_flg,
T_SWITCH_AND_GO_SETTING.detected_position_target_monitor_type t_switch_and_go_setting_detected_position_target_monitor_type,
T_SWITCH_AND_GO_SETTING.detected_position_target_monitor_model t_switch_and_go_setting_detected_position_target_monitor_model,
T_SWITCH_AND_GO_SETTING.detected_position_target_monitor_serial t_switch_and_go_setting_detected_position_target_monitor_serial,
T_SWITCH_AND_GO_SETTING.switch_timing t_switch_and_go_setting_switch_timing,
T_SWITCH_AND_GO_SETTING.hot_key_flg t_switch_and_go_setting_hot_key_flg,
T_SWITCH_AND_GO_DETECTED_POSITION.detected_position t_switch_and_go_detected_position_detected_position,
T_SWITCH_AND_GO_DETECTED_POSITION.detected_position_start_point_x t_switch_and_go_detected_position_detected_position_start_point_x,
T_SWITCH_AND_GO_DETECTED_POSITION.detected_position_start_point_y t_switch_and_go_detected_position_detected_position_start_point_y,
T_SWITCH_AND_GO_DETECTED_POSITION.detected_position_end_point_x t_switch_and_go_detected_position_detected_position_end_point_x,
T_SWITCH_AND_GO_DETECTED_POSITION.detected_position_end_point_y t_switch_and_go_detected_position_detected_position_end_point_y
FROM (
T_PC
left outer join T_SWITCH_AND_GO_SETTING on T_PC.id_pc = T_SWITCH_AND_GO_SETTING.id_pc
left outer join T_SWITCH_AND_GO_DETECTED_POSITION on T_SWITCH_AND_GO_SETTING.id_pc = T_SWITCH_AND_GO_DETECTED_POSITION.id_pc
)
go
CREATE VIEW V_USB_DISCONNECTED_ALERT
    (
        Id,
        t_mon_id_mon,t_mon_nm_maker,t_mon_nm_model,t_mon_kd_monitor,t_mon_no_serial,
        t_group_group_name_gateway,t_group_group_name_location,t_group_group_name_department,t_group_group_name_room,t_group_id_group_room,
        t_pc_id_pc,t_pc_nm_pc,t_pc_fl_enable,
        t_usb_connection_status_dt_usb_error_alert_utc,
        t_filter_monitor_model_monitor_type
    )
AS
SELECT
    (
        ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), GW.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), ROOM.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), DEPT.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LOC.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_USB_CONNECTION_STATUS.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_FILTER_MONITOR_MODEL.id_filter_monitor_model), 'NULL')
    ) Id,
    T_MON.id_mon t_mon_id_mon,
    T_MON.nm_maker t_mon_nm_maker,
    T_MON.nm_model t_mon_nm_model,
    T_MON.kd_monitor t_mon_kd_monitor,
    T_MON.no_serial t_mon_no_serial,
    GW.group_name t_group_group_name_gateway,
    LOC.group_name t_group_group_name_location,
    DEPT.group_name t_group_group_name_department,
    ROOM.group_name t_group_group_name_room,
    ROOM.id_group t_group_id_group_room,
    T_PC.id_pc t_pc_id_pc,
    T_PC.nm_pc t_pc_nm_pc,
    T_PC.fl_enable t_pc_fl_enable,
    T_USB_CONNECTION_STATUS.dt_usb_error_alert_utc t_usb_connection_status_dt_usb_error_alert_utc,
    T_FILTER_MONITOR_MODEL.monitor_type t_filter_monitor_model_monitor_type
FROM
    T_MON
    INNER JOIN
    (
        SELECT 
            T_MON.id_mon
        FROM 
            T_CALMODE 
            INNER JOIN T_MON ON T_MON.id_mon = T_CALMODE.id_mon
        WHERE
            T_CALMODE.fl_manage = 1
        GROUP BY T_MON.id_mon
        HAVING COUNT(id_cal) >= 1
    ) CAL_MANAGED_MONITOR ON T_MON.id_mon = CAL_MANAGED_MONITOR.id_mon
    INNER JOIN T_USB_CONNECTION_STATUS ON T_MON.id_mon = T_USB_CONNECTION_STATUS.id_mon  
    INNER JOIN T_PC ON T_MON.id_pc = T_PC.id_pc
    INNER JOIN T_GROUP GW ON T_PC.id_gateway = GW.id_group
    INNER JOIN T_GROUP ROOM ON T_PC.id_room = ROOM.id_group
    INNER JOIN T_GROUP DEPT 
        ON ROOM.no_positionleft > DEPT.no_positionleft AND ROOM.no_positionleft < DEPT.no_positionright
        AND NOT EXISTS 
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE 
                    MIDDLE.no_positionleft BETWEEN DEPT.no_positionleft AND DEPT.no_positionright
                    AND ROOM.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (ROOM.id_group, DEPT.id_group))    
    INNER JOIN T_GROUP LOC
        ON DEPT.no_positionleft > LOC.no_positionleft AND DEPT.no_positionleft < LOC.no_positionright
        AND NOT EXISTS 
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE 
                    MIDDLE.no_positionleft BETWEEN LOC.no_positionleft AND LOC.no_positionright
                    AND DEPT.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (DEPT.id_group, LOC.id_group))
    LEFT OUTER JOIN T_FILTER_MONITOR_MODEL ON T_MON.kd_monitortype = 0 AND T_FILTER_MONITOR_MODEL.model_name = T_MON.nm_model
WHERE
    (T_USB_CONNECTION_STATUS.fl_usb_status = 0 AND T_USB_CONNECTION_STATUS.fl_alert_confirmed = 0) AND 
    T_MON.fl_enable = 1 AND 
    GW.status = 1
go
CREATE VIEW V_ALERT_GROUP
    (
        t_alert_task_id_his,
        t_his_id_mon,
        t_his_id_cal,
        t_his_dt_test,
        t_his_task_type,
        t_his_result,
        t_mon_id_pc,
        t_mon_no_monitor,
        t_calmode_no_cal,
        alert_type,
        alert_group,
        required_task_display_name,
        required_task_to_fix
    )
AS
SELECT
    T_ALERT_TASK.id_his t_alert_task_id_his,
    T_HIS.id_mon t_his_id_mon,
    T_HIS.id_cal t_his_id_cal,
    DATEADD(NANOSECOND,T_HIS.task_type*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) t_his_dt_test,
    T_HIS.task_type t_his_task_type,
    T_HIS.result t_his_result,
    T_MON.id_pc t_mon_id_pc,
    T_MON.no_monitor t_mon_no_monitor,
    T_CALMODE.no_cal t_calmode_no_cal,
    CASE
        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --
        THEN 1

        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 2

        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 3

        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 4

        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 5

        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 6
    
        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 7

        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 8

        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 〇--
        THEN 9

        WHEN 
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND NOT (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 ×--
        THEN 10

        WHEN 
            T_HIS.task_type = 0 -- 受入試験 --
            AND T_HIS.result = 1 -- 不合格 --
        THEN 11
        
        WHEN 
            T_HIS.task_type = 1 -- 日次試験 --
            AND T_HIS.result = 1 -- 不合格 --
        THEN 12

        WHEN 
            T_HIS.task_type = 1 -- 日次試験 --
            AND T_HIS.result = 2 -- 中止 --
        THEN 13

        WHEN 
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_A.id_his IS NULL -- 不合格になった試験要素 パターンチェック, 輝度チェック, 階調チェック, ユニフォミティチェック のいずれも不合格でない --
        THEN 14

        WHEN 
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_B.id_his IS NOT NULL -- 不合格になった試験要素 パターンチェック, ユニフォミティチェック のいずれかが不合格 --
        THEN 15

        WHEN 
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_C.id_his IS NOT NULL -- 不合格になった試験要素 上記以外かつ 輝度チェック, 階調チェック のいずれかが不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
        THEN 16
        
        WHEN 
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_C.id_his IS NOT NULL -- 不合格になった試験要素 上記以外かつ 輝度チェック, 階調チェック のいずれかが不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
        THEN 17

        WHEN 
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 18

        WHEN 
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
        THEN 19

        WHEN 
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 20

        WHEN 
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 21

        WHEN 
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 22

        WHEN 
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 23

        WHEN 
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 〇 --
        THEN 24

        WHEN 
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND NOT (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 × --
        THEN 25

        WHEN 
            T_HIS.task_type = 5 -- Hands-off Check --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 26

        WHEN 
            T_HIS.task_type = 5 -- Hands-off Check --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
        THEN 27
            
        WHEN 
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 28

        WHEN 
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 29

        WHEN 
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 30

        WHEN 
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 31

        WHEN 
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --  
        THEN 32

        WHEN 
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 33

        WHEN 
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 34

        WHEN 
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 35

        WHEN 
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 36

        WHEN 
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 37

        WHEN 
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --            
        THEN 38

        WHEN 
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 39

        WHEN 
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 40

        WHEN 
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 41

        WHEN 
            T_HIS.task_type = 37 -- EIZOモニター設定 --
            AND T_HIS.result = 3 -- エラー --
        THEN 42

        WHEN 
            T_HIS.task_type = 38 -- Firmware Update --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
        THEN 43

    END AS alert_type,
    
    CASE
        WHEN 
        	-- alert_type 1 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 2 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 3 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 4 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 5 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 6 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- リモートアクショングループ --
    
        WHEN 
        	-- alert_type 7 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 8 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 9 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 〇--
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 10 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND NOT (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 ×--
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 11 --
            T_HIS.task_type = 0 -- 受入試験 --
            AND T_HIS.result = 1 -- 不合格 --
        THEN 1 -- オンサイトアクショングループ --
        
        WHEN 
        	-- alert_type 12 --
            T_HIS.task_type = 1 -- 日次試験 --
            AND T_HIS.result = 1 -- 不合格 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 13 --
            T_HIS.task_type = 1 -- 日次試験 --
            AND T_HIS.result = 2 -- 中止 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 14 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_A.id_his IS NULL -- 不合格になった試験要素 パターンチェック, 輝度チェック, 階調チェック, ユニフォミティチェック のいずれも不合格でない --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 15 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_B.id_his IS NOT NULL -- 不合格になった試験要素 パターンチェック, ユニフォミティチェック のいずれかが不合格 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 16 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_C.id_his IS NOT NULL -- 不合格になった試験要素 上記以外かつ 輝度チェック, 階調チェック のいずれかが不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
        THEN 0 -- リモートアクショングループ --
        
        WHEN 
        	-- alert_type 17 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_C.id_his IS NOT NULL -- 不合格になった試験要素 上記以外かつ 輝度チェック, 階調チェック のいずれかが不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 18 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 19 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 20 --        
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 21 --        
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 22 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 23 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 24 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 〇 --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 25 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND NOT (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 × --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 26 --        
            T_HIS.task_type = 5 -- Hands-off Check --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 27 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
        THEN 0 -- リモートアクショングループ --
            
        WHEN 
        	-- alert_type 28 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 29 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 30 --        
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 31 --        
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 32 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --  
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 33 --
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 34 --        
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 35 --
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 36 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 37 --        
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 38 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --            
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 39 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- リモートアクショングループ --

        WHEN 
        	-- alert_type 40 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 41 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 1 -- オンサイトアクショングループ --

        WHEN 
        	-- alert_type 42 --
            T_HIS.task_type = 37 -- EIZOモニター設定 --
            AND T_HIS.result = 3 -- エラー --
        THEN 2 -- オンサイトアクショングループ（モニター単位） --

        WHEN 
        	-- alert_type 43 --
            T_HIS.task_type = 38 -- Firmware Update --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
        THEN 2 -- オンサイトアクショングループ（モニター単位） --

    END AS alert_group,
    
    CASE
        WHEN 
        	-- alert_type 1 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 2 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 3 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 4 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 5 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 6 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- キャリブレーション --
    
        WHEN 
        	-- alert_type 7 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 8 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 9 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 〇--
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 10 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND NOT (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 ×--
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 11 --
            T_HIS.task_type = 0 -- 受入試験 --
            AND T_HIS.result = 1 -- 不合格 --
        THEN 2 -- キャリブレーション Re-test --
        
        WHEN 
        	-- alert_type 12 --
            T_HIS.task_type = 1 -- 日次試験 --
            AND T_HIS.result = 1 -- 不合格 --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 13 --
            T_HIS.task_type = 1 -- 日次試験 --
            AND T_HIS.result = 2 -- 中止 --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 14 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_A.id_his IS NULL -- 不合格になった試験要素 パターンチェック, 輝度チェック, 階調チェック, ユニフォミティチェック のいずれも不合格でない --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 15 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_B.id_his IS NOT NULL -- 不合格になった試験要素 パターンチェック, ユニフォミティチェック のいずれかが不合格 --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 16 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_C.id_his IS NOT NULL -- 不合格になった試験要素 上記以外かつ 輝度チェック, 階調チェック のいずれかが不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
        THEN 2 -- キャリブレーション Re-test --
        
        WHEN 
        	-- alert_type 17 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_C.id_his IS NOT NULL -- 不合格になった試験要素 上記以外かつ 輝度チェック, 階調チェック のいずれかが不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 18 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 1 -- Re-test --

        WHEN 
        	-- alert_type 19 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
        THEN 1 -- Re-test --

        WHEN 
        	-- alert_type 20 --        
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 1 -- Re-test --

        WHEN 
        	-- alert_type 21 --        
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 22 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 23 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 24 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 25 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND NOT (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 × --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 26 --        
            T_HIS.task_type = 5 -- Hands-off Check --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 1 -- Re-test --

        WHEN 
        	-- alert_type 27 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
        THEN 1 -- Re-test --
            
        WHEN 
        	-- alert_type 28 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 29 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 30 --        
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 31 --        
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード 〇 --
        THEN 1 -- Re-test --

        WHEN 
        	-- alert_type 32 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --  
        THEN 1 -- Re-test --

        WHEN 
        	-- alert_type 33 --
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 34 --        
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 35 --
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 36 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 37 --        
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 38 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --            
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 39 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 40 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 2 -- キャリブレーション Re-test --

        WHEN 
        	-- alert_type 41 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 2 -- キャリブレーション Re-test --

    END AS required_task_display_name,

    
    CASE
        WHEN 
        	-- alert_type 1 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 6 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- キャリブレーション --
    
        WHEN 
        	-- alert_type 7 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 9 --
            T_HIS.task_type = 3 -- キャリブレーション --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 〇--
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 16 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND T_HIS.result = 1 -- 不合格 --
            AND DETAIL_TYPE_GROUP_C.id_his IS NOT NULL -- 不合格になった試験要素 上記以外かつ 輝度チェック, 階調チェック のいずれかが不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
        THEN 3 -- キャリブレーション 定期試験 --

        WHEN 
        	-- alert_type 19 --
            T_HIS.task_type = 2 -- 定期試験 --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
        THEN 1 -- 定期試験 --

        WHEN 
        	-- alert_type 21 --        
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 22 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 24 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor = 0 -- リモートセンサー × --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
            AND (T_MON.kd_monitortype = 0 AND T_MON.calibration_type = 0) -- リモート実行でキャリブレーション実行可能 〇 --
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 27 --
            T_HIS.task_type = 5 -- Hands-off Check --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
        THEN 2 -- Hands-off Check --
            
        WHEN 
        	-- alert_type 28 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 29 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --
        THEN 3 -- キャリブレーション 定期試験 --

        WHEN 
        	-- alert_type 30 --        
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 3 -- キャリブレーション 定期試験 --

        WHEN 
        	-- alert_type 32 --
            T_HIS.task_type = 12 -- RadiCS SelfQC --
            AND (T_HIS.result = 2 OR T_HIS.result = 3)  -- エラー／中止 --
            AND T_HIS.cd_error NOT IN (103,104,105,106,107,114,119,129,136,142,151,152,157) -- オンサイト対処のエラーコード × --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --  
        THEN 1 -- 定期試験 --

        WHEN 
        	-- alert_type 33 --
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
        THEN 3 -- キャリブレーション 定期試験 --

        WHEN 
        	-- alert_type 34 --        
            T_HIS.task_type = 15 -- 簡易輝度チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 3 -- キャリブレーション 定期試験 --

        WHEN 
        	-- alert_type 36 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --            
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 1 -- 測定を実行 〇 --            
        THEN 0 -- キャリブレーション --

        WHEN 
        	-- alert_type 38 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 1 -- 外部センサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_post_measurement, INDIVIDUAL_CALIBRATION.fl_post_measurement) = 0 -- 測定を実行 × --            
        THEN 3 -- キャリブレーション 定期試験 --

        WHEN 
        	-- alert_type 39 --
            T_HIS.task_type = 16 -- 簡易階調チェック --
            AND T_HIS.result = 1 -- 不合格 --
            AND T_MON.id_swingsensor <> 0 -- リモートセンサー 〇 --
            AND COALESCE(POLICY_CALIBRATION.fl_use_external_sensor, INDIVIDUAL_CALIBRATION.fl_use_external_sensor) = 0 -- 外部センサー × --
        THEN 3 -- キャリブレーション 定期試験 --

    END AS required_task_to_fix
    
FROM
    T_ALERT_TASK

    INNER JOIN T_HIS ON T_ALERT_TASK.id_his = T_HIS.id_his

    INNER JOIN T_MON ON T_HIS.id_mon = T_MON.id_mon

    INNER JOIN T_PC ON T_MON.id_pc = T_PC.id_pc
    
    LEFT OUTER JOIN T_CALMODE ON T_HIS.id_cal = T_CALMODE.id_cal

    LEFT OUTER JOIN
    (
        SELECT 
            id_his
        FROM
            T_HISDETAIL
        WHERE
            T_HISDETAIL.detail_type IN (0,1,2,3) AND T_HISDETAIL.result = 1
        GROUP BY id_his
    ) DETAIL_TYPE_GROUP_A ON T_HIS.id_his = DETAIL_TYPE_GROUP_A.id_his

    LEFT OUTER JOIN
    (
        SELECT 
            id_his
        FROM
            T_HISDETAIL
        WHERE
            T_HISDETAIL.detail_type IN (2,3) AND T_HISDETAIL.result = 1
        GROUP BY id_his
    ) DETAIL_TYPE_GROUP_B ON T_HIS.id_his = DETAIL_TYPE_GROUP_B.id_his

    LEFT OUTER JOIN
    (
        SELECT 
            id_his
        FROM
            T_HISDETAIL
        WHERE
            T_HISDETAIL.detail_type IN (0,1) AND T_HISDETAIL.result = 1
        GROUP BY id_his
    ) DETAIL_TYPE_GROUP_C ON T_HIS.id_his = DETAIL_TYPE_GROUP_C.id_his

    LEFT OUTER JOIN
    (
        SELECT
            T_CALMODE.id_cal id_cal,
            T_CALIBRATION.fl_use_external_sensor fl_use_external_sensor,
            T_CALIBRATION.fl_post_measurement fl_post_measurement,
            T_CALIBRATION.fl_use_policy fl_use_policy
        FROM
            T_CALMODE
            INNER JOIN T_CALIBRATION ON T_CALMODE.id_cal = T_CALIBRATION.id_cal
    ) INDIVIDUAL_CALIBRATION ON T_HIS.id_cal = INDIVIDUAL_CALIBRATION.id_cal

    LEFT OUTER JOIN
    (
            SELECT
                SUBQUERY.id_group,
                CASE
                    WHEN SUBQUERY.id_group IS NULL THEN 1
                    ELSE SUBQUERY.fl_use_external_sensor
                END AS fl_use_external_sensor,
                CASE
                    WHEN SUBQUERY.id_group IS NULL THEN 1
                    ELSE SUBQUERY.fl_post_measurement
                END AS fl_post_measurement,
                condition_model,
                condition_calno
            FROM
            (
                SELECT
                    T_POLICY_GROUP_SET.id_group id_group,
                    T_POLICY_SETTING.condition_model condition_model,
                    T_POLICY_SETTING.condition_calno condition_calno,
                    T_POLICY_CALIBRATION.fl_use_external_sensor fl_use_external_sensor,
                    T_POLICY_CALIBRATION.fl_post_measurement fl_post_measurement
                FROM        
                    T_POLICY_GROUP_SET
                    INNER JOIN T_POLICY_CALIBRATION ON T_POLICY_GROUP_SET.id_policy = T_POLICY_CALIBRATION.id_policy 
                    INNER JOIN T_POLICY_SETTING ON T_POLICY_CALIBRATION.id_policy = T_POLICY_SETTING.id_policy AND T_POLICY_SETTING.policy_type = 3
                WHERE
                    T_POLICY_GROUP_SET.policy_type = 3
            ) SUBQUERY
    ) POLICY_CALIBRATION ON POLICY_CALIBRATION.id_group = T_PC.id_room AND T_MON.nm_profile = POLICY_CALIBRATION.condition_model AND T_CALMODE.no_cal = POLICY_CALIBRATION.condition_calno AND INDIVIDUAL_CALIBRATION.fl_use_policy = 1
go
CREATE VIEW V_GROUP_TREE
	(
		Id, t_group_id_group_parent, t_group_group_name_parent, t_group_group_type_parent, t_group_status_parent,
		t_group_id_group_child, t_group_group_name_child, t_group_group_type_child, t_group_status_child, t_group_status_grandchild
	)
AS
SELECT
	(
		ISNULL(CONVERT(nvarchar(10), PARENT.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(nvarchar(10), CHILD.id_group), 'NULL')
	) Id,
	PARENT.id_group t_group_id_group_parent,
	PARENT.group_name t_group_group_name_parent,
	PARENT.group_type t_group_group_type_parent,
	PARENT.status t_group_status_parent,
	CHILD.id_group t_group_id_group_child,
	CHILD.group_name t_group_group_name_child,
	CHILD.group_type t_group_group_type_child,
	CHILD.status t_group_status_child,
	MAX(GRANDCHILD.status) t_group_status_grandchild
FROM
	T_GROUP PARENT
	LEFT OUTER JOIN T_GROUP CHILD ON PARENT.no_positionleft < CHILD.no_positionleft AND CHILD.no_positionleft < PARENT.no_positionright
	LEFT OUTER JOIN T_GROUP GRANDCHILD ON CHILD.no_positionleft < GRANDCHILD.no_positionleft AND GRANDCHILD.no_positionleft < CHILD.no_positionright
WHERE
	NOT EXISTS
	(
		SELECT *
		FROM T_GROUP MIDDLE
		WHERE
			MIDDLE.no_positionleft BETWEEN PARENT.no_positionleft AND PARENT.no_positionright
			AND CHILD.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
			AND MIDDLE.id_group NOT IN (PARENT.id_group, CHILD.id_group)
	)
	AND NOT EXISTS
	(
		SELECT *
		FROM T_GROUP MIDDLE
		WHERE
			MIDDLE.no_positionleft BETWEEN CHILD.no_positionleft AND CHILD.no_positionright
			AND GRANDCHILD.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
			AND MIDDLE.id_group NOT IN (CHILD.id_group, GRANDCHILD.id_group)
	)
GROUP BY PARENT.id_group, CHILD.id_group, PARENT.group_name, CHILD.group_name, PARENT.group_type, CHILD.group_type, PARENT.status, CHILD.status             
go
CREATE VIEW [dbo].[V_GROUP_POLICY_SET]
(
	Id,
	t_group_id_group,
	t_policy_group_set_policy_type,
	t_policy_group_set_id_policy
)
AS
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_GROUP.id_group), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_POLICY_GROUP_SET.policy_type), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_POLICY_GROUP_SET.id_policy), 'NULL')
) Id,
T_GROUP.id_group,
T_POLICY_GROUP_SET.policy_type,
T_POLICY_GROUP_SET.id_policy
FROM T_GROUP
LEFT OUTER JOIN T_POLICY_GROUP_SET
ON T_GROUP.id_group = T_POLICY_GROUP_SET.id_group
AND T_POLICY_GROUP_SET.policy_type <> 1
go
CREATE VIEW V_GROUP_LIST
	(
		Id, t_group_id_group, t_group_group_name, t_group_group_type, t_group_status, t_group_id_group_parent
	)
AS
SELECT
	(
		ISNULL(CONVERT(nvarchar(10), T_GROUP.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(nvarchar(10), PARENT.id_group), 'NULL')
	) Id,
	T_GROUP.id_group t_group_id_group,
	T_GROUP.group_name t_group_group_name,
	T_GROUP.group_type t_group_group_type,
	T_GROUP.status t_group_status,
	PARENT.id_group t_group_id_group_parent
FROM
	T_GROUP
	INNER JOIN
	(
		SELECT
			id_group,
			no_positionleft,
			no_positionright
		FROM
			T_GROUP
	) PARENT ON PARENT.no_positionleft <= T_GROUP.no_positionleft AND T_GROUP.no_positionleft <= PARENT.no_positionright                                                                                  
go
CREATE VIEW V_GROUP_PARENT_CHILD
	(
		Id, t_group_id_group_parent, t_group_group_name_parent, t_group_group_type_parent, t_group_status_parent,
		t_group_id_group_child, t_group_group_name_child, t_group_group_type_child, t_group_status_child
	)
AS
SELECT
	(
		ISNULL(CONVERT(nvarchar(10), PARENT.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(nvarchar(10), CHILD.id_group), 'NULL')
	) Id,
	PARENT.id_group t_group_id_group_parent,
	PARENT.group_name t_group_group_name_parent,
	PARENT.group_type t_group_group_type_parent,
	PARENT.status t_group_status_parent,
	CHILD.id_group t_group_id_group_child,
	CHILD.group_name t_group_group_name_child,
	CHILD.group_type t_group_group_type_child,
	CHILD.status t_group_status_child
FROM 
	T_GROUP PARENT
	LEFT OUTER JOIN T_GROUP CHILD ON PARENT.no_positionleft < CHILD.no_positionleft AND CHILD.no_positionleft < PARENT.no_positionright
WHERE
	NOT EXISTS
	(
		SELECT *
		FROM T_GROUP MIDDLE
		WHERE
			MIDDLE.no_positionleft BETWEEN PARENT.no_positionleft AND PARENT.no_positionright
			AND CHILD.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
			AND MIDDLE.id_group NOT IN (PARENT.id_group, CHILD.id_group)
	)                                                                                           
go
CREATE VIEW V_JOB
    (
        Id,
        t_job_manage_no_job,t_job_manage_execution_date,
        t_job_manage_execution_timing,t_job_manage_scheduled_execution_date,
        t_job_manage_fl_fix_remote_execution,t_job_manage_task_type,
        t_job_manage_tester_name,t_job_manage_execution_status,t_job_manage_fl_cancel,t_job_manage_progress,
        t_pc_id_pc,t_pc_nm_pc,t_pc_fl_enable,
        t_mon_id_mon,t_mon_nm_maker,t_mon_nm_model,t_mon_fl_enable,t_mon_kd_monitor,t_mon_no_serial,
        t_calmode_id_cal,t_calmode_cal_name,
        t_group_group_name_gateway,
        t_group_group_name_location,
        t_group_group_name_department,
        t_group_group_name_room,t_group_id_group_room,
        t_filter_monitor_model_monitor_type
    )
AS
SELECT
    (
        ISNULL(CONVERT(nvarchar(10), T_JOB_MANAGE.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_JOB_MANAGE.no_job), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_CALMODE.id_cal), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), GW.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), ROOM.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), DEPT.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LOC.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_FILTER_MONITOR_MODEL.id_filter_monitor_model), 'NULL')
    ) Id,
    T_JOB_MANAGE.no_job t_job_manage_no_job,
    T_JOB_MANAGE.execution_date t_job_manage_execution_date,
    T_JOB_MANAGE.execution_timing t_job_manage_execution_timing,
    T_JOB_MANAGE.scheduled_execution_date t_job_manage_scheduled_execution_date,
    T_JOB_MANAGE.fl_fix_remote_execution t_job_manage_fl_fix_remote_execution,
    T_JOB_MANAGE.task_type t_job_manage_task_type,
    T_JOB_MANAGE.tester_name t_job_manage_tester_name,
    T_JOB_MANAGE.execution_status t_job_manage_execution_status,
    T_JOB_MANAGE.fl_cancel t_job_manage_fl_cancel,
    T_JOB_MANAGE.progress t_job_manage_progress,
    T_PC.id_pc t_pc_id_pc,
    T_PC.nm_pc t_pc_nm_pc,
    T_PC.fl_enable t_pc_fl_enable,
    T_MON.id_mon t_mon_id_mon,
    T_MON.nm_maker t_mon_nm_maker,
    T_MON.nm_model t_mon_nm_model,
    T_MON.fl_enable t_mon_fl_enable,
    T_MON.kd_monitor t_mon_kd_monitor,
    T_MON.no_serial t_mon_no_serial,
    T_CALMODE.id_cal t_calmode_id_cal,    
    T_CALMODE.cal_name t_calmode_cal_name,
    GW.group_name t_group_group_name_gateway,
    LOC.group_name t_group_group_name_location,
    DEPT.group_name t_group_group_name_department,
    ROOM.group_name t_group_group_name_room,
    ROOM.id_group t_group_id_group_room,
    T_FILTER_MONITOR_MODEL.monitor_type t_filter_monitor_model_monitor_type
FROM
    T_JOB_MANAGE
    INNER JOIN T_PC ON T_JOB_MANAGE.id_pc = T_PC.id_pc
    INNER JOIN T_GROUP GW ON T_PC.id_gateway = GW.id_group
    INNER JOIN T_GROUP ROOM ON T_PC.id_room = ROOM.id_group
    INNER JOIN T_GROUP DEPT 
        ON ROOM.no_positionleft > DEPT.no_positionleft AND ROOM.no_positionleft < DEPT.no_positionright
        AND NOT EXISTS 
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE 
                    MIDDLE.no_positionleft BETWEEN DEPT.no_positionleft AND DEPT.no_positionright
                    AND ROOM.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (ROOM.id_group, DEPT.id_group))    
    INNER JOIN T_GROUP LOC
        ON DEPT.no_positionleft > LOC.no_positionleft AND DEPT.no_positionleft < LOC.no_positionright
        AND NOT EXISTS 
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE 
                    MIDDLE.no_positionleft BETWEEN LOC.no_positionleft AND LOC.no_positionright
                    AND DEPT.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (DEPT.id_group, LOC.id_group))
    LEFT OUTER JOIN T_MON ON T_JOB_MANAGE.no_monitor = T_MON.no_monitor AND T_PC.id_pc = T_MON.id_pc
    LEFT OUTER JOIN T_CALMODE ON T_JOB_MANAGE.no_cal = T_CALMODE.no_cal AND T_MON.id_mon = T_CALMODE.id_mon
    LEFT OUTER JOIN T_FILTER_MONITOR_MODEL ON T_MON.kd_monitortype = 0 AND T_FILTER_MONITOR_MODEL.model_name = T_MON.nm_model
WHERE
    T_JOB_MANAGE.execution_status IN (0, 1, 2, 6, 7, 8)
    AND NOT ((T_JOB_MANAGE.fl_cancel = 1) AND DATEDIFF(SECOND,T_JOB_MANAGE.dt_job_create, GETUTCDATE()) > 86400)
    AND NOT ((T_JOB_MANAGE.no_monitor IS NOT NULL) AND (T_MON.no_monitor IS NULL))
go
CREATE VIEW V_SCHEDULE_SETTING
    (id,t_pc_id_pc,t_schedule_application_registered_application_name)
AS
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_SCHEDULE_APPLICATION.id_application), 'NULL')
)
AS Id,
T_PC.id_pc t_pc_id_pc,
T_SCHEDULE_APPLICATION.registered_application_name t_schedule_application_registered_application_name
FROM (
T_PC inner join T_SCHEDULE_APPLICATION on T_PC.id_pc = T_SCHEDULE_APPLICATION.id_pc
)
go
CREATE VIEW V_CARD_LUT_SETUP_SETTING
    (id,t_pc_id_pc,t_mon_no_monitor,t_mon_nm_maker,t_mon_nm_model,t_mon_no_serial,
    t_card_lut_setup_card_lut_setup_status_flag,t_card_lut_data_lut_data_index,
    t_card_lut_data_red,t_card_lut_data_green,t_card_lut_data_blue)
AS
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_DISPLAY.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_DISPLAY.no_screen), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_CARD_LUT_SETUP.id_mon), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_CARD_LUT_DATA.id_mon), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_CARD_LUT_DATA.lut_data_index), 'NULL')
)						
AS Id,
T_PC.id_pc t_pc_id_pc,
T_MON.no_monitor t_mon_no_monitor,
T_MON.nm_maker t_mon_nm_maker,
T_MON.nm_model t_mon_nm_model,
T_MON.no_serial t_mon_no_serial,
T_CARD_LUT_SETUP.card_lut_setup_status_flag t_card_lut_setup_card_lut_setup_status_flag,
T_CARD_LUT_DATA.lut_data_index t_card_lut_data_lut_data_index,
T_CARD_LUT_DATA.red t_card_lut_data_red,
T_CARD_LUT_DATA.green t_card_lut_data_green,
T_CARD_LUT_DATA.blue t_card_lut_data_blue
FROM (
T_PC
inner join T_DISPLAY on T_PC.id_pc = T_DISPLAY.id_pc
left outer join T_MON  on T_MON.id_pc = T_PC.id_pc AND T_MON.no_screen = T_DISPLAY.no_screen
left outer join T_CARD_LUT_SETUP on T_MON.id_mon = T_CARD_LUT_SETUP.id_mon
left outer join T_CARD_LUT_DATA on T_CARD_LUT_SETUP.id_mon = T_CARD_LUT_DATA.id_mon
)
go
CREATE VIEW V_USB_DISCONNECTED_ALERT_COUNT
AS
SELECT
	(
		ISNULL(CONVERT(NVARCHAR(10), T_MON.id_mon), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), PC.id_room), 'NULL')
	) Id,
	T_MON.id_mon t_mon_id_mon,
	PC.id_room t_pc_id_room
FROM
	T_MON
	INNER JOIN T_USB_CONNECTION_STATUS USB ON T_MON.id_mon = USB.id_mon AND USB.fl_usb_status = 0 AND USB.fl_alert_confirmed = 0
	INNER JOIN T_CALMODE CALMODE ON T_MON.id_mon = CALMODE.id_mon AND CALMODE.fl_manage = 1
	INNER JOIN T_PC PC ON T_MON.id_pc = PC.id_pc
	INNER JOIN T_GROUP ROOM ON PC.id_room = ROOM.id_group AND ROOM.status = 1
WHERE
	T_MON.fl_enable = 1
GROUP BY
	T_MON.id_mon, PC.id_room
go
CREATE VIEW V_JOB_COUNT
AS
SELECT
	(
		ISNULL(CONVERT(NVARCHAR(10), T_JOB_MANAGE.id_pc), 'NULL') + '_' + ISNULL(CONVERT(NVARCHAR(10), T_JOB_MANAGE.no_job), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_PC.id_pc), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), GW.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), ROOM.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), DEPT.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), LOC.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_MON.id_mon), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_CALMODE.id_cal), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_FILTER_MONITOR_MODEL.id_filter_monitor_model), 'NULL')
	) Id,
	T_MON.id_mon t_mon_id_mon,
	T_PC.id_room t_pc_id_room
FROM
	T_JOB_MANAGE
	INNER JOIN T_PC ON T_JOB_MANAGE.id_pc = T_PC.id_pc
	INNER JOIN T_GROUP GW ON T_PC.id_gateway = GW.id_group
	INNER JOIN T_GROUP ROOM ON T_PC.id_room = ROOM.id_group
	INNER JOIN T_GROUP DEPT
		ON ROOM.no_positionleft > DEPT.no_positionleft AND ROOM.no_positionleft < DEPT.no_positionright
		AND NOT EXISTS
			(
				SELECT id_group, group_name, group_type, status, no_positionleft, no_positionright, dt_create, dt_update
				FROM T_GROUP AS MIDDLE
                WHERE
					no_positionleft BETWEEN DEPT.no_positionleft AND DEPT.no_positionright
					AND ROOM.no_positionleft BETWEEN no_positionleft AND no_positionright
					AND id_group NOT IN (ROOM.id_group, DEPT.id_group)
			)
	INNER JOIN T_GROUP LOC
		ON DEPT.no_positionleft > LOC.no_positionleft AND DEPT.no_positionleft < LOC.no_positionright
		AND NOT EXISTS
			(
				SELECT id_group, group_name, group_type, status, no_positionleft, no_positionright, dt_create, dt_update
				FROM T_GROUP AS MIDDLE
				WHERE
					no_positionleft BETWEEN LOC.no_positionleft AND LOC.no_positionright
					AND DEPT.no_positionleft BETWEEN no_positionleft AND no_positionright
					AND id_group NOT IN (DEPT.id_group, LOC.id_group)
			)
	LEFT OUTER JOIN T_MON ON T_JOB_MANAGE.no_monitor = T_MON.no_monitor AND T_PC.id_pc = T_MON.id_pc
	LEFT OUTER JOIN T_CALMODE ON T_JOB_MANAGE.no_cal = T_CALMODE.no_cal AND T_MON.id_mon = T_CALMODE.id_mon
	LEFT OUTER JOIN T_FILTER_MONITOR_MODEL ON T_MON.kd_monitortype = 0 AND T_FILTER_MONITOR_MODEL.model_name = T_MON.nm_model
WHERE
	(T_JOB_MANAGE.execution_status IN (2)) AND (NOT (T_JOB_MANAGE.fl_cancel = 1)) AND (NOT (T_JOB_MANAGE.no_monitor IS NOT NULL))
	OR (T_JOB_MANAGE.execution_status IN (2)) AND (NOT (T_JOB_MANAGE.no_monitor IS NOT NULL)) AND (NOT (DATEDIFF(SECOND, T_JOB_MANAGE.dt_job_create, GETUTCDATE()) > 86400))
	OR (T_JOB_MANAGE.execution_status IN (2)) AND (NOT (T_JOB_MANAGE.fl_cancel = 1)) AND (NOT (T_MON.no_monitor IS NULL))
	OR (T_JOB_MANAGE.execution_status IN (2)) AND (NOT (DATEDIFF(SECOND, T_JOB_MANAGE.dt_job_create, GETUTCDATE()) > 86400)) AND (NOT (T_MON.no_monitor IS NULL))
go
CREATE VIEW V_ALL_MONITORS_CALMODES_COUNT
AS
SELECT
	(
		ISNULL(CONVERT(NVARCHAR(10), T_MON.id_mon), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_CALMODE.id_cal), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), LASTPC.id_pc), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), ROOM.id_group), 'NULL')
	) Id,
	T_CALMODE.id_cal t_calmode_id_cal,
	T_MON.id_mon,
	LASTPC.id_pc t_last_id_pc,
	LASTPC.fl_enable t_last_pc_fl_enable,
	T_CALMODE.fl_manage t_calmode_fl_manage,
	LASTPC.id_room t_lastpc_id_room
FROM
	T_MON
	INNER JOIN T_CALMODE ON T_MON.id_mon = T_CALMODE.id_mon
	INNER JOIN T_PC LASTPC ON T_MON.id_lastpc = LASTPC.id_pc
	INNER JOIN T_GROUP ROOM ON LASTPC.id_room = ROOM.id_group
WHERE
	(T_MON.fl_enable = 1) AND (ROOM.status = 1)
go
CREATE VIEW V_BACKLIGHT_ALWAYS_ON_ALERT_COUNT
AS
SELECT
	(
		ISNULL(CONVERT(NVARCHAR(10), MON.id_mon), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), PC.id_room), 'NULL')
	) Id,
	MON.id_mon t_mon_id_mon,
	PC.id_room t_pc_id_room
FROM
	T_MON MON
	INNER JOIN T_ALERT_MONITOR_ALWAYS_ON ALWAYSON ON ALWAYSON.id_mon = MON.id_mon AND ALWAYSON.alert_status = 1
	INNER JOIN T_CALMODE CALMODE ON CALMODE.id_mon = MON.id_mon AND CALMODE.fl_manage = 1
	INNER JOIN T_PC PC ON PC.id_pc = MON.id_pc
	INNER JOIN T_GROUP ROOM ON PC.id_room = ROOM.id_group AND ROOM.status = 1
WHERE
	(MON.fl_enable = 1) AND (MON.id_pc <> 0)
GROUP BY
	MON.id_mon, PC.id_room
go
CREATE VIEW V_ACTION_REQUIRED_ALERT_COUNT
    (            
        Id, 
        t_group_id_group_room,
        t_his_task_type,t_his_result,
        t_qcguideline_name_language
    )
AS
SELECT
    (
        ISNULL(CONVERT(nvarchar(10), GW.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), ROOM.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), DEPT.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LOC.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PCCONNECT.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.id_pc), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.no_screen), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_CALMODE.id_cal), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_CORE_CONFIG.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_HIS.id_his), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    ROOM.id_group t_group_id_group_room,
    T_HIS.task_type t_his_task_type,
    T_HIS.result t_his_result, 
    T_QCGUIDELINE_NAME.language t_qcguideline_name_language
FROM
    T_ALERT_TASK
    INNER JOIN T_HIS ON T_ALERT_TASK.id_his = T_HIS.id_his
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON T_HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND T_HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
    INNER JOIN T_MON ON T_HIS.id_mon = T_MON.id_mon AND T_MON.fl_enable = 1
    INNER JOIN
    (
        SELECT
            T_MON.id_mon
        FROM
            T_CALMODE
            INNER JOIN T_MON ON T_MON.id_mon = T_CALMODE.id_mon
        WHERE
            T_CALMODE.fl_manage = 1
        GROUP BY
            T_MON.id_mon
        HAVING
            COUNT(id_cal) >= 1
    ) CAL_MANAGED_MONITOR ON T_MON.id_mon = CAL_MANAGED_MONITOR.id_mon
    LEFT OUTER JOIN T_CALMODE ON T_HIS.id_cal = T_CALMODE.id_cal AND T_HIS.id_mon = T_CALMODE.id_mon AND T_CALMODE.fl_manage = 1
    INNER JOIN T_PC ON T_MON.id_pc = T_PC.id_pc AND T_PC.fl_enable = 1
    INNER JOIN T_PCCONNECT ON T_PC.id_pc = T_PCCONNECT.id_pc
    INNER JOIN T_CORE_CONFIG ON T_PC.id_pc = T_CORE_CONFIG.id_pc
    INNER JOIN T_GRAPHICS_CARD ON T_MON.id_pc = T_GRAPHICS_CARD.id_pc AND T_MON.no_screen = T_GRAPHICS_CARD.no_screen
    INNER JOIN T_GROUP GW ON T_PC.id_gateway = GW.id_group
    INNER JOIN T_GROUP ROOM ON T_PC.id_room = ROOM.id_group
    INNER JOIN T_GROUP DEPT
        ON ROOM.no_positionleft > DEPT.no_positionleft AND ROOM.no_positionleft < DEPT.no_positionright
        AND NOT EXISTS
            (
                SELECT
                    *
                FROM
                    T_GROUP MIDDLE
                WHERE
                    MIDDLE.no_positionleft BETWEEN DEPT.no_positionleft AND DEPT.no_positionright
                    AND ROOM.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (ROOM.id_group, DEPT.id_group)
            )
    INNER JOIN T_GROUP LOC
        ON DEPT.no_positionleft > LOC.no_positionleft AND DEPT.no_positionleft < LOC.no_positionright
        AND NOT EXISTS
            (
                SELECT
                    *
                FROM
                    T_GROUP MIDDLE
                WHERE
                    MIDDLE.no_positionleft BETWEEN LOC.no_positionleft AND LOC.no_positionright
                    AND DEPT.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (DEPT.id_group, LOC.id_group)
             )
WHERE
    ((T_CALMODE.id_cal = T_HIS.id_cal) OR (T_CALMODE.id_cal IS NULL AND T_HIS.id_cal IS NULL))
go
CREATE VIEW V_POLICY_COMMON_INFORMATION
AS
SELECT
	(
		ISNULL(CONVERT(NVARCHAR(10), T_POLICY_SETTING.policy_type), 'NULL') + '_' + ISNULL(CONVERT(NVARCHAR(10), T_POLICY_SETTING.id_policy), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), T_POLICY_GROUP_SET.id_group), 'NULL') + '_' + ISNULL(CONVERT(NVARCHAR(10), T_POLICY_GROUP_SET.policy_type), 'NULL') + '_' + ISNULL(CONVERT(NVARCHAR(10), T_POLICY_GROUP_SET.id_policy), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), TARGET_GROUP.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(NVARCHAR(10), ORIGIN_GROUP.id_group), 'NULL')
	) Id,
	T_POLICY_SETTING.id_policy t_policy_setting_id_policy,
	T_POLICY_SETTING.policy_type t_policy_setting_policy_type,
	T_POLICY_SETTING.nm_policy_setting t_policy_setting_nm_policy_setting,
	T_POLICY_SETTING.condition_model t_policy_setting_condition_model,
	T_POLICY_SETTING.condition_calno t_policy_setting_condition_calno,
	TARGET_GROUP.id_group target_group_id_group,
	ORIGIN_GROUP.id_group origin_group_id_group,
	ORIGIN_GROUP.group_name origin_group_group_name
FROM
	T_POLICY_SETTING
	INNER JOIN T_POLICY_GROUP_SET ON T_POLICY_SETTING.id_policy = T_POLICY_GROUP_SET.id_policy AND T_POLICY_SETTING.policy_type = T_POLICY_GROUP_SET.policy_type
	INNER JOIN T_GROUP TARGET_GROUP ON T_POLICY_GROUP_SET.id_group = TARGET_GROUP.id_group
	INNER JOIN T_GROUP ORIGIN_GROUP ON T_POLICY_GROUP_SET.id_group_set_origin = ORIGIN_GROUP.id_group
go
CREATE VIEW V_BACKLIGHT_ALWAYS_ON_ALERT
    (
        Id,
        t_mon_id_mon,t_mon_nm_maker,t_mon_nm_model,t_mon_kd_monitor,t_mon_no_serial,
        t_group_group_name_gateway,t_group_group_name_location,t_group_group_name_department,t_group_group_name_room,t_group_id_group_room,
        t_pc_id_pc,t_pc_nm_pc,t_pc_fl_enable,
        t_alert_monitor_always_on_dt_alert_utc,
        t_alert_monitor_always_on_dulation,
        t_filter_monitor_model_monitor_type
    )
AS
SELECT
    (
        ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), GW.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), ROOM.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), DEPT.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LOC.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_ALERT_MONITOR_ALWAYS_ON.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_FILTER_MONITOR_MODEL.id_filter_monitor_model), 'NULL')
    ) Id,
    T_MON.id_mon t_mon_id_mon,
    T_MON.nm_maker t_mon_nm_maker,
    T_MON.nm_model t_mon_nm_model,
    T_MON.kd_monitor t_mon_kd_monitor,
    T_MON.no_serial t_mon_no_serial,
    GW.group_name t_group_group_name_gateway,
    LOC.group_name t_group_group_name_location,
    DEPT.group_name t_group_group_name_department,
    ROOM.group_name t_group_group_name_room,
    ROOM.id_group t_group_id_group_room,
    T_PC.id_pc t_pc_id_pc,
    T_PC.nm_pc t_pc_nm_pc,
    T_PC.fl_enable t_pc_fl_enable,
    T_ALERT_MONITOR_ALWAYS_ON.dt_alert_utc t_alert_monitor_always_on_dt_alert_utc,
    DATEDIFF(minute, T_ALERT_MONITOR_ALWAYS_ON.dt_alert_reset, T_ALERT_MONITOR_ALWAYS_ON.dt_latest_upload)/60 t_alert_monitor_always_on_dulation,
    T_FILTER_MONITOR_MODEL.monitor_type t_filter_monitor_model_monitor_type    
FROM
    T_MON
    INNER JOIN
    (
        SELECT 
            T_MON.id_mon
        FROM 
            T_CALMODE 
            INNER JOIN T_MON ON T_MON.id_mon = T_CALMODE.id_mon
        WHERE
            T_CALMODE.fl_manage = 1
        GROUP BY T_MON.id_mon
        HAVING COUNT(id_cal) >= 1
    ) CAL_MANAGED_MONITOR ON T_MON.id_mon = CAL_MANAGED_MONITOR.id_mon
    INNER JOIN T_ALERT_MONITOR_ALWAYS_ON ON T_MON.id_mon = T_ALERT_MONITOR_ALWAYS_ON.id_mon  
    INNER JOIN T_PC ON T_MON.id_pc = T_PC.id_pc
    INNER JOIN T_GROUP GW ON T_PC.id_gateway = GW.id_group
    INNER JOIN T_GROUP ROOM ON T_PC.id_room = ROOM.id_group
    INNER JOIN T_GROUP DEPT 
        ON ROOM.no_positionleft > DEPT.no_positionleft AND ROOM.no_positionleft < DEPT.no_positionright
        AND NOT EXISTS 
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE 
                    MIDDLE.no_positionleft BETWEEN DEPT.no_positionleft AND DEPT.no_positionright
                    AND ROOM.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (ROOM.id_group, DEPT.id_group))    
    INNER JOIN T_GROUP LOC
        ON DEPT.no_positionleft > LOC.no_positionleft AND DEPT.no_positionleft < LOC.no_positionright
        AND NOT EXISTS 
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE 
                    MIDDLE.no_positionleft BETWEEN LOC.no_positionleft AND LOC.no_positionright
                    AND DEPT.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (DEPT.id_group, LOC.id_group))
    LEFT OUTER JOIN T_FILTER_MONITOR_MODEL ON T_MON.kd_monitortype = 0 AND T_FILTER_MONITOR_MODEL.model_name = T_MON.nm_model
WHERE
    T_ALERT_MONITOR_ALWAYS_ON.alert_status = 1 AND 
    T_MON.fl_enable = 1 AND 
    T_MON.id_pc <> 0 AND
    GW.status = 1
go
CREATE VIEW V_MONITOR_SETTING
    (id,
    t_pc_id_pc,
    t_mon_no_monitor,
    t_mon_nm_maker,
    t_mon_nm_model,
    t_mon_no_serial,
    t_mon_no_screen,
    t_mon_kd_monitor,
    t_mon_no_asset,
    t_mon_kd_monitortype,
    t_mon_nm_profile,
    t_mon_calibration_type,
    t_mon_dt_buy,
    t_mon_connection_type,
    t_mon_cal_count,
    t_mon_usedtime,
    t_mon_coordinate_x,
    t_mon_coordinate_y,
    t_mon_width,t_mon_height,
    t_mon_special_model,
    t_mon_fl_ics,
    t_mon_fl_due,
    t_mon_cal_name_count,
    t_mon_edid_monitor_model,
    t_mon_edid_monitor_serial_no,
    t_mon_inch_size,
    t_mon_fl_inch_size_change,
    t_mon_monitor_udi,
    t_mon_id_swingsensor,
    t_mon_id_illuminancesensor,
    t_monitor_fw_system,
    t_monitor_fw_controller,
    t_monitor_fw_osd,
    t_monitor_fw_frontend,
    t_monitor_fw_fpga,
    t_calmode_no_cal,
    t_calmode_cal_name,
    t_calmode_fl_manage,
    t_calmode_setupinfocomment,
    t_calmode_cal_value,
    t_calmode_calmode_type,
    t_calibration_unsupported_mode_no_cal,
    t_calibration_unsupported_mode_cal_name,
    t_calibration_unsupported_mode_cal_value,
    t_calibration_unsupported_mode_calmode_type,
    t_swingsensor_model,
    t_swingsensor_serial,
    t_swingsensor_kd_type,
    t_swingsensor_fl_enable,
    t_presensesensor_kd_type,
    t_illuminancesensor_model,
    t_illuminancesensor_serial,
    t_illuminancesensor_kd_type,
    t_illuminance_correlation_correlation_coefficient,
    t_illuminance_correlation_target_correlation_coefficient,
    t_illuminance_correlation_correlation_flg,
    t_din_test_requirement_inherit_result_flg,
    t_ambient_luminance_correlation_ambient_luminance_coefficient,
    t_ambient_luminance_correlation_target_ambient_luminance_coefficient,
    t_baseline_value_base_Lmax,
    t_baseline_value_base_Lmin,
    t_baseline_value_base_Lamb,
    t_baseline_value_base_execute_date,
    t_baseline_value_base_tester,
    t_baseline_value_base_sensor_name,
    t_baseline_value_base_sensor_serial,
    t_baseline_value_fl_base_available,
    t_ambient_sensor_name,
    t_ambient_sensor_serial,
    t_ambient_ambient_value,
    t_calibration_fl_use_external_sensor,
    t_calibration_fl_post_measurement,
    t_calibration_target_lmax,
    t_calibration_target_lmin,
    t_calibration_measurement_level,
    t_calibration_fl_use_measurement_lmin,
    t_calibration_color_temperature,
    t_calibration_color_x,
    t_calibration_color_y,
    t_calibration_fl_luminance_lifetime_priority,
    t_calibration_display_function,
    t_calibration_fl_use_lamb,
    t_calibration_exp_value,
    t_calibration_fl_use_policy,
    t_correlation_correlation_data,
    t_correlation_dt_execution,
    t_correlation_measurement_level,
    t_switch_signal_monitor_setting_switch_signal_permonitor_enabled_flg,
    t_switch_signal_monitor_setting_port_type,
    t_switch_signal_monitor_setting_port_number,
    t_switch_signal_monitor_setting_display_index,
    t_switch_signal_monitor_setting_port_value,
    calModeManageChanger,
    calibrationSettingChanger,
    baselineValueChanger,
    ambientValueChanger
    )
AS
WITH Changers AS
(
SELECT T_USER.id_user, T_USER.nm_tester, T_USER.id_group
FROM T_USER
)
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_DISPLAY.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_DISPLAY.no_screen), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_MONITOR_FW.id_monitor), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_CALMODE.id_cal), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_CALIBRATION_UNSUPPORTED_MODE.id_mon), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_CALIBRATION_UNSUPPORTED_MODE.no_cal), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_SWINGSENSOR.id_sensor), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_PRESENSESENSOR.id_mon), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_ILLUMINANCESENSOR.id_sensor), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_ILLUMINANCE_CORRELATION.id_mon), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_ILLUMINANCE_CORRELATION.id_sensor), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_ILLUMINANCE_CORRELATION.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_DIN_TEST_REQUIREMENT.id_pc), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_DIN_TEST_REQUIREMENT.id_cal), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_AMBIENT_LUMINANCE_CORRELATION.id_cal), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_AMBIENT_LUMINANCE_CORRELATION.id_sensor), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_AMBIENT_LUMINANCE_CORRELATION.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_BASELINE_VALUE.id_cal), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_AMBIENT.id_cal), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_AMBIENT.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_CALIBRATION.id_cal), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_CORRELATION.id_mon), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_CORRELATION.id_sensor), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_SWITCH_SIGNAL_MONITOR_SETTING.id_pc), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_SWITCH_SIGNAL_MONITOR_SETTING.id_mon), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_SWITCH_SIGNAL_MONITOR_SETTING.port_number), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_SWITCH_SIGNAL_MONITOR_SETTING.display_index), 'NULL')
)
AS Id,
T_PC.id_pc t_pc_id_pc,
T_MON.no_monitor t_mon_no_monitor,
T_MON.nm_maker t_mon_nm_maker,
T_MON.nm_model t_mon_nm_model,
T_MON.no_serial t_mon_no_serial,
T_MON.no_screen t_mon_no_screen,
T_MON.kd_monitor t_mon_kd_monitor,
T_MON.no_asset t_mon_no_asset,
T_MON.kd_monitortype t_mon_kd_monitortype,
T_MON.nm_profile t_mon_nm_profile,
T_MON.calibration_type t_mon_calibration_type,
T_MON.dt_buy t_mon_dt_buy,
T_MON.connection_type t_mon_connection_type,
T_MON.cal_count t_mon_cal_count,
T_MON.usedtime t_mon_usedtime,
T_MON.coordinate_x t_mon_coordinate_x,
T_MON.coordinate_y t_mon_coordinate_y,
T_MON.width t_mon_width,
T_MON.height t_mon_height,
T_MON.special_model t_mon_special_model,
T_MON.fl_ics t_mon_fl_ics,
T_MON.fl_due t_mon_fl_due,
T_MON.cal_name_count t_mon_cal_name_count,
T_MON.edid_monitor_model t_mon_edid_monitor_model,
T_MON.edid_monitor_serial_no t_mon_edid_monitor_serial_no,
T_MON.inch_size t_mon_inch_size,
T_MON.fl_inch_size_change t_mon_fl_inch_size_change,
T_MON.monitor_udi t_mon_monitor_udi,
T_MON.id_swingsensor t_mon_id_swingsensor,
T_MON.id_illuminancesensor t_mon_id_illuminancesensor,
T_MONITOR_FW.system t_monitor_fw_system,
T_MONITOR_FW.controller t_monitor_fw_controller,
T_MONITOR_FW.osd t_monitor_fw_osd,
T_MONITOR_FW.frontend t_monitor_fw_frontend,
T_MONITOR_FW.fpga t_monitor_fw_fpga,
T_CALMODE.no_cal t_calmode_no_cal,
T_CALMODE.cal_name t_calmode_cal_name,
T_CALMODE.fl_manage t_calmode_fl_manage,
T_CALMODE.setupinfocomment t_calmode_setupinfocomment,
T_CALMODE.cal_value t_calmode_cal_value,
T_CALMODE.calmode_type t_calmode_calmode_type,
T_CALIBRATION_UNSUPPORTED_MODE.no_cal t_calibration_unsupported_mode_no_cal,
T_CALIBRATION_UNSUPPORTED_MODE.cal_name t_calibration_unsupported_mode_cal_name,
T_CALIBRATION_UNSUPPORTED_MODE.cal_value t_calibration_unsupported_mode_cal_value,
T_CALIBRATION_UNSUPPORTED_MODE.calmode_type t_calibration_unsupported_mode_calmode_type,
T_SWINGSENSOR.model t_swingsensor_model,
T_SWINGSENSOR.serial t_swingsensor_serial,
T_SWINGSENSOR.kd_type t_swingsensor_kd_type,
T_SWINGSENSOR.fl_enable t_swingsensor_fl_enable,
T_PRESENSESENSOR.kd_type t_presensesensor_kd_type,
T_ILLUMINANCESENSOR.model t_illuminancesensor_model,
T_ILLUMINANCESENSOR.serial t_illuminancesensor_serial,
T_ILLUMINANCESENSOR.kd_type t_illuminancesensor_kd_type,
T_ILLUMINANCE_CORRELATION.correlation_coefficient t_illuminance_correlation_correlation_coefficient,
T_ILLUMINANCE_CORRELATION.target_correlation_coefficient t_illuminance_correlation_target_correlation_coefficient,
T_ILLUMINANCE_CORRELATION.correlation_flg t_illuminance_correlation_correlation_flg,
T_DIN_TEST_REQUIREMENT.inherit_result_flg t_din_test_requirement_inherit_result_flg,
T_AMBIENT_LUMINANCE_CORRELATION.ambient_luminance_coefficient t_ambient_luminance_correlation_ambient_luminance_coefficient,
T_AMBIENT_LUMINANCE_CORRELATION.target_ambient_luminance_coefficient t_ambient_luminance_correlation_target_ambient_luminance_coefficient,
T_BASELINE_VALUE.base_Lmax t_baseline_value_base_Lmax,
T_BASELINE_VALUE.base_Lmin t_baseline_value_base_Lmin,
T_BASELINE_VALUE.base_Lamb t_baseline_value_base_Lamb,
T_BASELINE_VALUE.base_execute_date t_baseline_value_base_execute_date,
T_BASELINE_VALUE.base_tester t_baseline_value_base_tester,
T_BASELINE_VALUE.base_sensor_name t_baseline_value_base_sensor_name,
T_BASELINE_VALUE.base_sensor_serial t_baseline_value_base_sensor_serial,
T_BASELINE_VALUE.fl_base_available t_baseline_value_fl_base_available,
T_AMBIENT.sensor_name t_ambient_sensor_name,
T_AMBIENT.sensor_serial t_ambient_sensor_serial,
T_AMBIENT.ambient_value t_ambient_ambient_value,
T_CALIBRATION.fl_use_external_sensor t_calibration_fl_use_external_sensor,
T_CALIBRATION.fl_post_measurement t_calibration_fl_post_measurement,
T_CALIBRATION.target_lmax t_calibration_target_lmax,
T_CALIBRATION.target_lmin t_calibration_target_lmin,
T_CALIBRATION.measurement_level t_calibration_measurement_level,
T_CALIBRATION.fl_use_measurement_lmin t_calibration_fl_use_measurement_lmin,
T_CALIBRATION.color_temperature t_calibration_color_temperature,
T_CALIBRATION.color_x t_calibration_color_x,
T_CALIBRATION.color_y t_calibration_color_y,
T_CALIBRATION.fl_luminance_lifetime_priority t_calibration_fl_luminance_lifetime_priority,
T_CALIBRATION.display_function t_calibration_display_function,
T_CALIBRATION.fl_use_lamb t_calibration_fl_use_lamb,
T_CALIBRATION.exp_value t_calibration_exp_value,
T_CALIBRATION.fl_use_policy t_calibration_fl_use_policy,
T_CORRELATION.correlation_data t_correlation_correlation_data,
T_CORRELATION.dt_execution t_correlation_dt_execution,
T_CORRELATION.measurement_level t_correlation_measurement_level,
T_SWITCH_SIGNAL_MONITOR_SETTING.switch_signal_permonitor_enabled_flg t_switch_signal_monitor_setting_switch_signal_permonitor_enabled_flg,
T_SWITCH_SIGNAL_MONITOR_SETTING.port_type t_switch_signal_monitor_setting_port_type,
T_SWITCH_SIGNAL_MONITOR_SETTING.port_number t_switch_signal_monitor_setting_port_number,
T_SWITCH_SIGNAL_MONITOR_SETTING.display_index t_switch_signal_monitor_setting_display_index,
T_SWITCH_SIGNAL_MONITOR_SETTING.port_value t_switch_signal_monitor_setting_port_value,
CASE WHEN T_CALMODE.id_update_user_fl_manage IS NULL THEN ''
     ELSE ISNULL((SELECT Changers.nm_tester FROM Changers WHERE Changers.id_user = T_CALMODE.id_update_user_fl_manage and Changers.id_group = T_PC.id_gateway) ,'RadiNET Pro') END calModeManageChanger,
CASE WHEN T_CALIBRATION.id_update_user IS NULL THEN ''
     ELSE ISNULL((SELECT Changers.nm_tester FROM Changers WHERE Changers.id_user = T_CALIBRATION.id_update_user and Changers.id_group = T_PC.id_gateway) ,'RadiNET Pro') END calibrationSettingChanger,
CASE WHEN T_BASELINE_VALUE.id_update_user IS NULL THEN ''
     ELSE ISNULL((SELECT Changers.nm_tester FROM Changers WHERE Changers.id_user = T_BASELINE_VALUE.id_update_user and Changers.id_group = T_PC.id_gateway) ,'RadiNET Pro') END baselineValueChanger,
CASE WHEN T_AMBIENT.id_update_user IS NULL THEN ''
     ELSE ISNULL((SELECT Changers.nm_tester FROM Changers WHERE Changers.id_user = T_AMBIENT.id_update_user and Changers.id_group = T_PC.id_gateway) ,'RadiNET Pro') END ambientValueChanger
FROM (
T_PC
inner join T_DISPLAY on T_PC.id_pc = T_DISPLAY.id_pc
left outer join T_MON  on T_MON.id_pc = T_PC.id_pc AND T_MON.no_screen = T_DISPLAY.no_screen
left outer join T_MONITOR_FW on T_MON.id_mon = T_MONITOR_FW.id_monitor
left outer join T_CALMODE on T_MON.id_mon = T_CALMODE.id_mon
left outer join T_CALIBRATION_UNSUPPORTED_MODE on T_MON.id_mon = T_CALIBRATION_UNSUPPORTED_MODE.id_mon
left outer join T_SWINGSENSOR on T_MON.id_swingsensor = T_SWINGSENSOR.id_sensor
left outer join T_PRESENSESENSOR on T_MON.id_mon = T_PRESENSESENSOR.id_mon
left outer join T_ILLUMINANCESENSOR on T_MON.id_illuminancesensor = T_ILLUMINANCESENSOR.id_sensor
left outer join T_ILLUMINANCE_CORRELATION on T_MON.id_mon = T_ILLUMINANCE_CORRELATION.id_mon AND T_ILLUMINANCESENSOR.id_sensor = T_ILLUMINANCE_CORRELATION.id_sensor AND T_PC.id_pc = T_ILLUMINANCE_CORRELATION.id_pc
left outer join T_DIN_TEST_REQUIREMENT on T_PC.id_pc = T_DIN_TEST_REQUIREMENT.id_pc AND T_CALMODE.id_cal = T_DIN_TEST_REQUIREMENT.id_cal
left outer join T_AMBIENT_LUMINANCE_CORRELATION on T_CALMODE.id_cal = T_AMBIENT_LUMINANCE_CORRELATION.id_cal AND T_MON.id_illuminancesensor = T_AMBIENT_LUMINANCE_CORRELATION.id_sensor AND T_PC.id_pc = T_AMBIENT_LUMINANCE_CORRELATION.id_pc
left outer join T_BASELINE_VALUE on T_CALMODE.id_cal = T_BASELINE_VALUE.id_cal
left outer join T_AMBIENT on T_CALMODE.id_cal = T_AMBIENT.id_cal AND T_PC.id_pc = T_AMBIENT.id_pc
left outer join T_CALIBRATION on T_CALMODE.id_cal = T_CALIBRATION.id_cal
left outer join T_CORRELATION on T_MON.id_mon = T_CORRELATION.id_mon AND T_SWINGSENSOR.id_sensor = T_CORRELATION.id_sensor
left outer join T_SWITCH_SIGNAL_MONITOR_SETTING on T_MON.id_mon = T_SWITCH_SIGNAL_MONITOR_SETTING.id_mon AND T_PC.id_pc = T_SWITCH_SIGNAL_MONITOR_SETTING.id_pc
)
go
CREATE VIEW V_BASICINFO_POLICY
    (id,t_policy_group_set_id_group,t_policy_group_set_policy_type,t_policy_setting_condition_model,
    t_policy_setting_condition_calno,t_policy_qc_basic_setting_id_rec,t_policy_qc_basic_setting_id_cons,
    t_policy_qc_basic_setting_id_room_class_rec,t_policy_qc_basic_setting_id_room_class_cons,
    t_policy_qc_basic_setting_fl_multimonitor,t_policy_qc_basic_setting_fl_reset_base_value,
    t_policy_qcguideline_custom_id_qcguideline,t_policy_qcguideline_custom_dt_update,
    t_policy_schedule_scheduler_execute_flg,t_policy_schedule_policy,t_policy_schedule_start_presense_flg,
    t_policy_schedule_regular_presense_flg,t_policy_schedule_detail_task_type,
    t_policy_schedule_detail_execute_pattern,t_policy_schedule_detail_execute_flg,
    t_policy_schedule_detail_schedule_type,t_policy_schedule_detail_execute_base_hour,
    t_policy_schedule_detail_execute_base_minute,t_policy_schedule_detail_execute_interval,
    t_policy_schedule_detail_execute_base_month,t_policy_schedule_detail_execute_base_year,
    t_policy_schedule_detail_auto_execute_flg,t_policy_schedule_detail_alert_time_period,
    t_policy_schedule_detail_recalibration_after_failure_flg,t_policy_schedule_detail_monday_execute_flg,
    t_policy_schedule_detail_tuesday_execute_flg,t_policy_schedule_detail_wednesday_execute_flg,
    t_policy_schedule_detail_thursday_execute_flg,t_policy_schedule_detail_friday_execute_flg,
    t_policy_schedule_detail_saturday_execute_flg,t_policy_schedule_detail_sunday_execute_flg,
    t_policy_schedule_detail_execute_date_pattern,t_policy_schedule_detail_execute_date,
    t_policy_schedule_detail_execute_week,t_policy_schedule_detail_execute_day_of_the_week,
    t_policy_schedule_detail_execute_month,t_policy_schedule_detail_execute_month_day_of_the_week,
    t_policy_calibration_target_lmax,t_policy_calibration_target_lmin,t_policy_calibration_fl_use_measurement_lmin,
    t_policy_calibration_color_temperature,t_policy_calibration_color_x,
    t_policy_calibration_color_y,t_policy_calibration_display_function,
    t_policy_calibration_fl_use_lamb,t_policy_calibration_exp_value,t_policy_calibration_fl_use_external_sensor,
    t_policy_calibration_fl_post_measurement,t_policy_calibration_fl_luminance_lifetime_priority,
    t_policy_calibration_measurement_level,t_policy_registration_orgnization_value,
    t_policy_registration_address_value,t_policy_registration_phone_number_value,
    t_policy_registration_administrator_value,t_policy_registration_service_provider_value,
    t_policy_registration_item_name1,t_policy_registration_item_name2,t_policy_registration_item_name3,
    t_policy_registration_item_name4,t_policy_registration_item_name5,t_policy_registration_item_name6,
    t_policy_registration_item_name7,t_policy_registration_item_name8,
    t_policy_eizo_monitor_setting_led_flg,t_policy_eizo_monitor_setting_keylock_type,t_policy_eizo_monitor_setting_json_detail,
    t_policy_backlight_saver_fl_enable,t_policy_backlight_saver_backlightsaver_type,t_policy_backlight_saver_screensaver_interlocking_type,
    t_policy_backlight_saver_waitingtime_screensaver,t_policy_backlight_saver_fl_specify_url_enable,
    t_policy_backlight_saver_waitingtime_absencejudgement,t_policy_backlight_saver_fl_lowbrightness_enable,
    t_policy_backlight_saver_reductionrate_lowbrightness,t_policy_power_interlock_setting_power_interlock_flg,
    t_policy_radics_update_update_type,t_policy_radics_update_monday_execute_flg,
    t_policy_radics_update_tuesday_execute_flg,t_policy_radics_update_wednesday_execute_flg,
    t_policy_radics_update_thursday_execute_flg,t_policy_radics_update_friday_execute_flg,
    t_policy_radics_update_saturday_execute_flg,t_policy_radics_update_sunday_execute_flg,
    t_policy_radics_update_start_hour,t_policy_radics_update_start_minutes,
    t_policy_radics_update_end_hour,t_policy_radics_update_end_minutes,
    changer,t_pc_id_pc)
AS
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_POLICY_GROUP_SET.id_group), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_GROUP_SET.policy_type), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_GROUP_SET.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_SETTING.policy_type), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_SETTING.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_QC_BASIC_SETTING.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_QCGUIDELINE_CUSTOM.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_SCHEDULE.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_SCHEDULE_DETAIL.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_SCHEDULE_DETAIL.task_type), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_CALIBRATION.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_REGISTRATION.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_EIZO_MONITOR_SETTING.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_BACKLIGHT_SAVER.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_POWER_INTERLOCK_SETTING.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_POLICY_RADICS_UPDATE.id_policy), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_USER.id_user), 'NULL') + '_' + 
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL')
)
AS Id,
T_POLICY_GROUP_SET.id_group t_policy_group_set_id_group,
T_POLICY_GROUP_SET.policy_type t_policy_group_set_policy_type,
T_POLICY_SETTING.condition_model t_policy_setting_condition_model,
T_POLICY_SETTING.condition_calno t_policy_setting_condition_calno,
T_POLICY_QC_BASIC_SETTING.id_rec t_policy_qc_basic_setting_id_rec,
T_POLICY_QC_BASIC_SETTING.id_cons t_policy_qc_basic_setting_id_cons,
T_POLICY_QC_BASIC_SETTING.id_room_class_rec t_policy_qc_basic_setting_id_room_class_rec,
T_POLICY_QC_BASIC_SETTING.id_room_class_cons t_policy_qc_basic_setting_id_room_class_cons,
T_POLICY_QC_BASIC_SETTING.fl_multimonitor t_policy_qc_basic_setting_fl_multimonitor,
T_POLICY_QC_BASIC_SETTING.fl_reset_base_value t_policy_qc_basic_setting_fl_reset_base_value,
T_POLICY_QCGUIDELINE_CUSTOM.id_qcguideline t_policy_qcguideline_custom_id_qcguideline,
T_POLICY_QCGUIDELINE_CUSTOM.dt_update t_policy_qcguideline_custom_dt_update,
T_POLICY_SCHEDULE.scheduler_execute_flg t_policy_schedule_scheduler_execute_flg,
T_POLICY_SCHEDULE.policy t_policy_schedule_policy,
T_POLICY_SCHEDULE.start_presense_flg t_policy_schedule_start_presense_flg,
T_POLICY_SCHEDULE.regular_presense_flg t_policy_schedule_regular_presense_flg,
T_POLICY_SCHEDULE_DETAIL.task_type t_policy_schedule_detail_task_type,
T_POLICY_SCHEDULE_DETAIL.execute_pattern t_policy_schedule_detail_execute_pattern,
T_POLICY_SCHEDULE_DETAIL.execute_flg t_policy_schedule_detail_execute_flg,
T_POLICY_SCHEDULE_DETAIL.schedule_type t_policy_schedule_detail_schedule_type,
T_POLICY_SCHEDULE_DETAIL.execute_base_hour t_policy_schedule_detail_execute_base_hour,
T_POLICY_SCHEDULE_DETAIL.execute_base_minute t_policy_schedule_detail_execute_base_minute,
T_POLICY_SCHEDULE_DETAIL.execute_interval t_policy_schedule_detail_execute_interval,
T_POLICY_SCHEDULE_DETAIL.execute_base_month t_policy_schedule_detail_execute_base_month,
T_POLICY_SCHEDULE_DETAIL.execute_base_year t_policy_schedule_detail_execute_base_year,
T_POLICY_SCHEDULE_DETAIL.auto_execute_flg t_policy_schedule_detail_auto_execute_flg,
T_POLICY_SCHEDULE_DETAIL.alert_time_period t_policy_schedule_detail_alert_time_period,
T_POLICY_SCHEDULE_DETAIL.recalibration_after_failure_flg t_policy_schedule_detail_recalibration_after_failure_flg,
T_POLICY_SCHEDULE_DETAIL.monday_execute_flg t_policy_schedule_detail_monday_execute_flg,
T_POLICY_SCHEDULE_DETAIL.tuesday_execute_flg t_policy_schedule_detail_tuesday_execute_flg,
T_POLICY_SCHEDULE_DETAIL.wednesday_execute_flg t_policy_schedule_detail_wednesday_execute_flg,
T_POLICY_SCHEDULE_DETAIL.thursday_execute_flg t_policy_schedule_detail_thursday_execute_flg,
T_POLICY_SCHEDULE_DETAIL.friday_execute_flg t_policy_schedule_detail_friday_execute_flg,
T_POLICY_SCHEDULE_DETAIL.saturday_execute_flg t_policy_schedule_detail_saturday_execute_flg,
T_POLICY_SCHEDULE_DETAIL.sunday_execute_flg t_policy_schedule_detail_sunday_execute_flg,
T_POLICY_SCHEDULE_DETAIL.execute_date_pattern t_policy_schedule_detail_execute_date_pattern,
T_POLICY_SCHEDULE_DETAIL.execute_date t_policy_schedule_detail_execute_date,
T_POLICY_SCHEDULE_DETAIL.execute_week t_policy_schedule_detail_execute_week,
T_POLICY_SCHEDULE_DETAIL.execute_day_of_the_week t_policy_schedule_detail_execute_day_of_the_week,
T_POLICY_SCHEDULE_DETAIL.execute_month t_policy_schedule_detail_execute_month,
T_POLICY_SCHEDULE_DETAIL.execute_month_day_of_the_week t_policy_schedule_detail_execute_month_day_of_the_week,
T_POLICY_CALIBRATION.target_lmax t_policy_calibration_target_lmax,
T_POLICY_CALIBRATION.target_lmin t_policy_calibration_target_lmin,
T_POLICY_CALIBRATION.fl_use_measurement_lmin t_policy_calibration_fl_use_measurement_lmin,
T_POLICY_CALIBRATION.color_temperature t_policy_calibration_color_temperature,
T_POLICY_CALIBRATION.color_x t_policy_calibration_color_x,
T_POLICY_CALIBRATION.color_y t_policy_calibration_color_y,
T_POLICY_CALIBRATION.display_function t_policy_calibration_display_function,
T_POLICY_CALIBRATION.fl_use_lamb t_policy_calibration_fl_use_lamb,
T_POLICY_CALIBRATION.exp_value t_policy_calibration_exp_value,
T_POLICY_CALIBRATION.fl_use_external_sensor t_policy_calibration_fl_use_external_sensor,
T_POLICY_CALIBRATION.fl_post_measurement t_policy_calibration_fl_post_measurement,
T_POLICY_CALIBRATION.fl_luminance_lifetime_priority t_policy_calibration_fl_luminance_lifetime_priority,
T_POLICY_CALIBRATION.measurement_level t_policy_calibration_measurement_level,
T_POLICY_REGISTRATION.orgnization_value t_policy_registration_orgnization_value,
T_POLICY_REGISTRATION.address_value t_policy_registration_address_value,
T_POLICY_REGISTRATION.phone_number_value t_policy_registration_phone_number_value,
T_POLICY_REGISTRATION.administrator_value t_policy_registration_administrator_value,
T_POLICY_REGISTRATION.service_provider_value t_policy_registration_service_provider_value,
T_POLICY_REGISTRATION.item_name1 t_policy_registration_item_name1,
T_POLICY_REGISTRATION.item_name2 t_policy_registration_item_name2,
T_POLICY_REGISTRATION.item_name3 t_policy_registration_item_name3,
T_POLICY_REGISTRATION.item_name4 t_policy_registration_item_name4,
T_POLICY_REGISTRATION.item_name5 t_policy_registration_item_name5,
T_POLICY_REGISTRATION.item_name6 t_policy_registration_item_name6,
T_POLICY_REGISTRATION.item_name7 t_policy_registration_item_name7,
T_POLICY_REGISTRATION.item_name8 t_policy_registration_item_name8,
T_POLICY_EIZO_MONITOR_SETTING.led_flg t_policy_eizo_monitor_setting_led_flg,
T_POLICY_EIZO_MONITOR_SETTING.keylock_type t_policy_eizo_monitor_setting_keylock_type,
T_POLICY_EIZO_MONITOR_SETTING.json_detail t_policy_eizo_monitor_setting_json_detail,
T_POLICY_BACKLIGHT_SAVER.fl_enable t_policy_backlight_saver_fl_enable,
T_POLICY_BACKLIGHT_SAVER.backlightsaver_type t_policy_backlight_saver_backlightsaver_type,
T_POLICY_BACKLIGHT_SAVER.screensaver_interlocking_type t_policy_backlight_saver_screensaver_interlocking_type,
T_POLICY_BACKLIGHT_SAVER.waitingtime_screensaver t_policy_backlight_saver_waitingtime_screensaver,
T_POLICY_BACKLIGHT_SAVER.fl_specify_url_enable t_policy_backlight_saver_fl_specify_url_enable,
T_POLICY_BACKLIGHT_SAVER.waitingtime_absencejudgement t_policy_backlight_saver_waitingtime_absencejudgement,
T_POLICY_BACKLIGHT_SAVER.fl_lowbrightness_enable t_policy_backlight_saver_fl_lowbrightness_enable,
T_POLICY_BACKLIGHT_SAVER.reductionrate_lowbrightness t_policy_backlight_saver_reductionrate_lowbrightness,
T_POLICY_POWER_INTERLOCK_SETTING.power_interlock_flg t_policy_power_interlock_setting_power_interlock_flg,
T_POLICY_RADICS_UPDATE.update_type t_policy_radics_update_update_type,
T_POLICY_RADICS_UPDATE.monday_execute_flg t_policy_radics_update_monday_execute_flg,
T_POLICY_RADICS_UPDATE.tuesday_execute_flg t_policy_radics_update_tuesday_execute_flg,
T_POLICY_RADICS_UPDATE.wednesday_execute_flg t_policy_radics_update_wednesday_execute_flg,
T_POLICY_RADICS_UPDATE.thursday_execute_flg t_policy_radics_update_thursday_execute_flg,
T_POLICY_RADICS_UPDATE.friday_execute_flg t_policy_radics_update_friday_execute_flg,
T_POLICY_RADICS_UPDATE.saturday_execute_flg t_policy_radics_update_saturday_execute_flg,
T_POLICY_RADICS_UPDATE.sunday_execute_flg t_policy_radics_update_sunday_execute_flg,
T_POLICY_RADICS_UPDATE.start_hour t_policy_radics_update_start_hour,
T_POLICY_RADICS_UPDATE.start_minutes t_policy_radics_update_start_minutes,
T_POLICY_RADICS_UPDATE.end_hour t_policy_radics_update_end_hour,
T_POLICY_RADICS_UPDATE.end_minutes t_policy_radics_update_end_minutes,
CASE WHEN T_PC.id_gateway = T_USER.id_group THEN T_USER.nm_tester ELSE 'RadiNET Pro' END changer,
T_PC.id_pc t_pc_id_pc
FROM (
T_POLICY_GROUP_SET
inner join T_POLICY_SETTING on T_POLICY_GROUP_SET.policy_type = T_POLICY_SETTING.policy_type and T_POLICY_GROUP_SET.id_policy = T_POLICY_SETTING.id_policy
left outer join T_POLICY_QC_BASIC_SETTING on T_POLICY_GROUP_SET.id_policy = T_POLICY_QC_BASIC_SETTING.id_policy and T_POLICY_GROUP_SET.policy_type = 0
left outer join T_POLICY_QCGUIDELINE_CUSTOM on T_POLICY_GROUP_SET.id_policy = T_POLICY_QCGUIDELINE_CUSTOM.id_policy and T_POLICY_GROUP_SET.policy_type = 1
left outer join T_POLICY_SCHEDULE on T_POLICY_GROUP_SET.id_policy = T_POLICY_SCHEDULE.id_policy and T_POLICY_GROUP_SET.policy_type = 2
left outer join T_POLICY_SCHEDULE_DETAIL on T_POLICY_SCHEDULE.id_policy = T_POLICY_SCHEDULE_DETAIL.id_policy
left outer join T_POLICY_CALIBRATION on T_POLICY_GROUP_SET.id_policy = T_POLICY_CALIBRATION.id_policy and T_POLICY_GROUP_SET.policy_type = 3
left outer join T_POLICY_REGISTRATION on T_POLICY_GROUP_SET.id_policy = T_POLICY_REGISTRATION.id_policy and T_POLICY_GROUP_SET.policy_type = 4
left outer join T_POLICY_EIZO_MONITOR_SETTING on T_POLICY_GROUP_SET.id_policy = T_POLICY_EIZO_MONITOR_SETTING.id_policy and T_POLICY_GROUP_SET.policy_type = 5
left outer join T_POLICY_BACKLIGHT_SAVER on T_POLICY_GROUP_SET.id_policy = T_POLICY_BACKLIGHT_SAVER.id_policy and T_POLICY_GROUP_SET.policy_type = 6
left outer join T_POLICY_POWER_INTERLOCK_SETTING on T_POLICY_GROUP_SET.id_policy = T_POLICY_POWER_INTERLOCK_SETTING.id_policy and T_POLICY_GROUP_SET.policy_type = 7
left outer join T_POLICY_RADICS_UPDATE on T_POLICY_GROUP_SET.id_policy = T_POLICY_RADICS_UPDATE.id_policy and T_POLICY_GROUP_SET.policy_type = 8
inner join T_USER on T_POLICY_GROUP_SET.id_user_set = T_USER.id_user
inner join T_PC on T_POLICY_GROUP_SET.id_group = T_PC.id_room
)
go
CREATE VIEW V_ALL_MONITORS
    (            
        Id, t_group_group_name_gateway, t_group_group_name_location, t_group_group_name_department, t_group_group_name_room, t_group_id_group_room,
        t_pc_id_pc, t_pc_nm_pc, t_pcconnect_fl_constate, t_pcconnect_dt_access, t_pcconnect_fl_usesituation, t_pcconnect_logon_user,        
        t_pcconnect_dt_usesituation, t_pc_ver_major, t_pc_ver_minor, t_pc_ver_build, t_pc_ver_revision, t_pc_nm_platform_type,        
        t_pc_ipaddr, t_pc_dt_create, t_pc_fl_enable, t_graphics_card_card_name, t_graphics_card_card_maker, t_graphics_card_serial_no,        
        t_graphics_card_driver_name, t_graphics_card_driver_version, t_graphics_card_dt_buy, t_mon_id_mon, t_calmode_id_cal, t_mon_nm_maker,        
        t_mon_nm_model, t_mon_kd_monitor, t_mon_nm_profile, t_mon_width, t_mon_height, t_mon_no_serial, t_calmode_cal_name,        
        t_mon_monitor_udi, t_mon_connection_type, t_usb_connection_status_fl_usb_status, t_calmode_fl_manage,        
        t_mon_usedtime, t_mon_no_asset, t_backlightmeter_no_backlightvalue, t_mon_dt_buy,        
        t_calmode_comment, t_swingsensor_kd_type, t_presensesensor_id_mon, t_illuminancesensor_kd_type, t_mon_dt_create,        
        t_policy_registration_value_organization, t_policy_registration_value_address, t_policy_registration_value_phone_number,        
        t_policy_registration_value_administrator, t_policy_registration_value_service_provider, t_registration_item1,        
        t_registration_item2, t_registration_item3, t_registration_item4, t_registration_item5, t_registration_item6,        
        t_registration_item7, t_registration_item8,
        t_monitor_fw_system, t_monitor_fw_controller, t_monitor_fw_frontend, t_monitor_fw_osd, t_monitor_fw_fpga,
        t_last_pc_fl_enable, t_filter_monitor_model_monitor_type,
        t_lea_operating_time, t_lea_lea_time, t_lea_average_usage_time_of_a_day, t_lea_lea_result,
        t_hands_off_min_ad_value, t_hands_off_max_ad_value, t_hands_off_max_judgment, t_hands_off_max_threshold,
        t_core_config_backlight_meter_threshold
    )            
AS                
SELECT                
    (            
        ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_CALMODE.id_cal), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), LASTPC.id_pc), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), GW.id_group), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), ROOM.id_group), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), DEPT.id_group), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), LOC.id_group), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), POLICY_REGISTRATION.id_group), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_MONITOR_FW.id_monitor), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_USB_CONNECTION_STATUS.id_mon), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_SWINGSENSOR.id_sensor), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_PRESENSESENSOR.id_mon), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_ILLUMINANCESENSOR.id_sensor), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), BACKLIGHTMETER.id_cal), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_PCCONNECT.id_pc), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.id_pc), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.no_screen), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_REGISTRATION.id_pc), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_FILTER_MONITOR_MODEL.id_filter_monitor_model), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), LEA.id_lea), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), HANDS_OFF_MIN.id_cal), 'NULL') + '_' +  
        ISNULL(CONVERT(nvarchar(10), HANDS_OFF_MAX.id_cal), 'NULL') + '_' +  
        ISNULL(CONVERT(nvarchar(10), T_CORE_CONFIG.id_pc), 'NULL')
    ) Id,            
    GW.group_name t_group_group_name_gateway,            
    LOC.group_name t_group_group_name_location,            
    DEPT.group_name t_group_group_name_department,            
    ROOM.group_name t_group_group_name_room,
    ROOM.id_group t_group_id_group_room,
    T_PC.id_pc t_pc_id_pc,        
    T_PC.nm_pc t_pc_nm_pc,            
    T_PCCONNECT.fl_constate t_pcconnect_fl_constate,            
    T_PCCONNECT.dt_access t_pcconnect_dt_access,            
    T_PCCONNECT.fl_usesituation t_pcconnect_fl_usesituation,            
    T_PCCONNECT.logon_user t_pcconnect_logon_user,            
    T_PCCONNECT.dt_usesituation t_pcconnect_dt_usesituation,            
    T_PC.ver_major t_pc_ver_major,            
    T_PC.ver_minor t_pc_ver_minor,            
    T_PC.ver_build t_pc_ver_build,            
    T_PC.ver_revision t_pc_ver_revision,            
    T_PC.nm_platform_type t_pc_nm_platform_type,            
    T_PC.ipaddr t_pc_ipaddr,            
    T_PC.dt_create t_pc_dt_create,            
    T_PC.fl_enable t_pc_fl_enable,        
    T_GRAPHICS_CARD.card_name t_graphics_card_card_name,            
    T_GRAPHICS_CARD.card_maker t_graphics_card_card_maker,            
    T_GRAPHICS_CARD.serial_no t_graphics_card_serial_no,            
    T_GRAPHICS_CARD.driver_name t_graphics_card_driver_name,            
    T_GRAPHICS_CARD.driver_version t_graphics_card_driver_version,            
    T_GRAPHICS_CARD.dt_buy t_graphics_card_dt_buy,            
    T_MON.id_mon t_mon_id_mon,            
    T_CALMODE.id_cal t_calmode_id_cal,            
    T_MON.nm_maker t_mon_nm_maker,            
    T_MON.nm_model t_mon_nm_model,            
    T_MON.kd_monitor t_mon_kd_monitor,            
    T_MON.nm_profile t_mon_nm_profile ,    
    T_MON.width t_mon_width,            
    T_MON.height t_mon_height,            
    T_MON.no_serial t_mon_no_serial,            
    T_CALMODE.cal_name t_calmode_cal_name,            
    T_MON.monitor_udi t_mon_monitor_udi,            
    T_MON.connection_type t_mon_connection_type,            
    T_USB_CONNECTION_STATUS.fl_usb_status t_usb_connection_status_fl_usb_status,            
    T_CALMODE.fl_manage t_calmode_fl_manage,            
    T_MON.usedtime t_mon_usedtime,            
    T_MON.no_asset t_mon_no_asset,            
    BACKLIGHTMETER.no_backlightvalue t_backlightmeter_no_backlightvalue,            
    T_MON.dt_buy t_mon_dt_buy,            
    T_CALMODE.comment t_calmode_comment,            
    T_SWINGSENSOR.kd_type t_swingsensor_kd_type,            
    T_PRESENSESENSOR.id_mon t_presensesensor_id_mon,            
    T_ILLUMINANCESENSOR.kd_type t_illuminancesensor_kd_type,            
    T_MON.dt_create t_mon_dt_create,            
    POLICY_REGISTRATION.organization t_policy_registration_value_organization,            
    POLICY_REGISTRATION.address t_policy_registration_value_address,            
    POLICY_REGISTRATION.phone_number t_policy_registration_value_phone_number,            
    POLICY_REGISTRATION.administrator t_policy_registration_value_administrator,            
    POLICY_REGISTRATION.service_provider t_policy_registration_value_service_provider,            
    T_REGISTRATION.item1 t_registration_item1,            
    T_REGISTRATION.item2 t_registration_item2,            
    T_REGISTRATION.item3 t_registration_item3,            
    T_REGISTRATION.item4 t_registration_item4,            
    T_REGISTRATION.item5 t_registration_item5,            
    T_REGISTRATION.item6 t_registration_item6,            
    T_REGISTRATION.item7 t_registration_item7,            
    T_REGISTRATION.item8 t_registration_item8,            
    T_MONITOR_FW.system t_monitor_fw_system,            
    T_MONITOR_FW.controller t_monitor_fw_controller,            
    T_MONITOR_FW.frontend t_monitor_fw_frontend,            
    T_MONITOR_FW.osd t_monitor_fw_osd,            
    T_MONITOR_FW.fpga t_monitor_fw_fpga,            
    LASTPC.fl_enable t_last_pc_fl_enable,
    T_FILTER_MONITOR_MODEL.monitor_type t_filter_monitor_model_monitor_type,            
    LEA.operating_time t_lea_operating_time,
    LEA.lea_time t_lea_lea_time,
    LEA.average_usage_time_of_a_day t_lea_average_usage_time_of_a_day,
    LEA.lea_result t_lea_lea_result,
    HANDS_OFF_MIN.ad_value t_hands_off_min_ad_value,
    HANDS_OFF_MAX.ad_value t_hands_off_max_ad_value,
    HANDS_OFF_MAX.judgment t_hands_off_max_judgment,
    HANDS_OFF_MAX.threshold t_hands_off_max_threshold,
    T_CORE_CONFIG.backlight_meter_threshold t_core_config_backlight_meter_threshold
FROM                
    T_MON            
    INNER JOIN T_CALMODE ON T_MON.id_mon = T_CALMODE.id_mon            
    INNER JOIN T_PC LASTPC ON T_MON.id_lastpc = LASTPC.id_pc            
    INNER JOIN T_GROUP GW ON LASTPC.id_gateway = GW.id_group            
    INNER JOIN T_GROUP ROOM ON LASTPC.id_room = ROOM.id_group            
    INNER JOIN T_GROUP DEPT 
        ON ROOM.no_positionleft > DEPT.no_positionleft AND ROOM.no_positionleft < DEPT.no_positionright
        AND NOT EXISTS 
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE 
                    MIDDLE.no_positionleft BETWEEN DEPT.no_positionleft AND DEPT.no_positionright
                    AND ROOM.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (ROOM.id_group, DEPT.id_group))    
    INNER JOIN T_GROUP LOC
        ON DEPT.no_positionleft > LOC.no_positionleft AND DEPT.no_positionleft < LOC.no_positionright
        AND NOT EXISTS 
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE 
                    MIDDLE.no_positionleft BETWEEN LOC.no_positionleft AND LOC.no_positionright
                    AND DEPT.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (DEPT.id_group, LOC.id_group))               
    LEFT OUTER JOIN
    (            
        SELECT        
            T_POLICY_GROUP_SET.id_group,    
            T_POLICY_REGISTRATION.orgnization_value organization,
            T_POLICY_REGISTRATION.address_value address, 
            T_POLICY_REGISTRATION.phone_number_value phone_number,
            T_POLICY_REGISTRATION.administrator_value administrator,
            T_POLICY_REGISTRATION.service_provider_value service_provider        
        FROM        
            T_POLICY_GROUP_SET    
            INNER JOIN T_POLICY_REGISTRATION ON T_POLICY_GROUP_SET.id_policy = T_POLICY_REGISTRATION.id_policy    
        WHERE        
            T_POLICY_GROUP_SET.policy_type = 4
    ) POLICY_REGISTRATION ON LASTPC.id_room = POLICY_REGISTRATION.id_group                
    LEFT OUTER JOIN T_MONITOR_FW ON T_MON.id_mon = T_MONITOR_FW.id_monitor            
    LEFT OUTER JOIN T_USB_CONNECTION_STATUS ON T_MON.id_mon = T_USB_CONNECTION_STATUS.id_mon            
    LEFT OUTER JOIN T_SWINGSENSOR ON T_MON.id_swingsensor = T_SWINGSENSOR.id_sensor            
    LEFT OUTER JOIN T_PRESENSESENSOR ON T_MON.id_mon = T_PRESENSESENSOR.id_mon            
    LEFT OUTER JOIN T_ILLUMINANCESENSOR ON T_MON.id_illuminancesensor = T_ILLUMINANCESENSOR.id_sensor  AND T_ILLUMINANCESENSOR.kd_type <> 3        
    LEFT OUTER JOIN            
    (            
        SELECT        
            T_BACKLIGHTMETER.id_cal,    
            no_backlightvalue    
        FROM        
            T_BACKLIGHTMETER    
            INNER JOIN    
            (    
                SELECT id_cal, MAX(operating_time) max_operating_time
                FROM T_BACKLIGHTMETER
                GROUP BY id_cal
            ) SUBQUERY ON T_BACKLIGHTMETER.id_cal = SUBQUERY.id_cal AND T_BACKLIGHTMETER.operating_time = SUBQUERY.max_operating_time    
    ) BACKLIGHTMETER ON T_CALMODE.id_cal = BACKLIGHTMETER.id_cal            
    LEFT OUTER JOIN T_PC ON T_MON.id_pc = T_PC.id_pc            
    LEFT OUTER JOIN T_PCCONNECT ON T_PC.id_pc = T_PCCONNECT.id_pc            
	LEFT OUTER JOIN T_GRAPHICS_CARD ON T_MON.id_pc = T_GRAPHICS_CARD.id_pc AND T_MON.no_screen = T_GRAPHICS_CARD.no_screen
    LEFT OUTER JOIN T_REGISTRATION ON LASTPC.id_pc = T_REGISTRATION.id_pc            
    LEFT OUTER JOIN T_FILTER_MONITOR_MODEL ON T_MON.kd_monitortype = 0 AND T_FILTER_MONITOR_MODEL.model_name = T_MON.nm_model
    LEFT OUTER JOIN
    (            
        SELECT        
            id_lea,
            T_LIFETIME_EXPECTANCY.id_pc,
            T_LIFETIME_EXPECTANCY.id_cal,
            T_LIFETIME_EXPECTANCY.operating_time,
            lea_time,
            average_usage_time_of_a_day,
            lea_result
        FROM        
            T_LIFETIME_EXPECTANCY    
            INNER JOIN    
            (    
                SELECT id_pc, id_cal, MAX(operating_time) operating_time
                FROM T_LIFETIME_EXPECTANCY
                WHERE fl_lea_enable = 1
                GROUP BY id_pc, id_cal
            ) SUBQUERY ON T_LIFETIME_EXPECTANCY.operating_time = SUBQUERY.operating_time AND T_LIFETIME_EXPECTANCY.id_pc = SUBQUERY.id_pc AND T_LIFETIME_EXPECTANCY.id_cal = SUBQUERY.id_cal AND T_LIFETIME_EXPECTANCY.fl_lea_enable = 1
    ) LEA ON T_PC.id_pc = LEA.id_pc AND T_CALMODE.id_cal = LEA.id_cal
    LEFT OUTER JOIN
    (            
        SELECT        
            T_HANDS_OFF.id_cal,
            T_HANDS_OFF.ad_value
        FROM        
            T_HANDS_OFF    
            INNER JOIN    
            (    
                SELECT id_cal, MIN(operating_time) operating_time
                FROM T_HANDS_OFF
                GROUP BY id_cal
            ) SUBQUERY ON T_HANDS_OFF.operating_time = SUBQUERY.operating_time AND T_HANDS_OFF.id_cal = SUBQUERY.id_cal
    ) HANDS_OFF_MIN ON T_CALMODE.id_cal = HANDS_OFF_MIN.id_cal                     
    LEFT OUTER JOIN
    (            
        SELECT        
            T_HANDS_OFF.id_cal,
            T_HANDS_OFF.ad_value,
            judgment,
            threshold
        FROM        
            T_HANDS_OFF    
            INNER JOIN    
            (    
                SELECT id_cal, MAX(operating_time) operating_time
                FROM T_HANDS_OFF
                GROUP BY id_cal
            ) SUBQUERY ON T_HANDS_OFF.operating_time = SUBQUERY.operating_time AND T_HANDS_OFF.id_cal = SUBQUERY.id_cal
    ) HANDS_OFF_MAX ON T_CALMODE.id_cal = HANDS_OFF_MAX.id_cal
    LEFT OUTER JOIN T_CORE_CONFIG ON LASTPC.id_pc = T_CORE_CONFIG.id_pc
    
WHERE
    T_MON.fl_enable = 1
go
CREATE VIEW V_ALL_MONITORS_FOR_CSV
    (
        Id,
        t_group_group_name_gateway,
        t_group_group_name_location,
        t_group_group_name_department,
        t_group_group_name_room,
        t_group_id_group_room,
        t_pc_nm_pc,
        t_pc_ver_major,
        t_pc_ver_minor,
        t_pc_ver_build,
        t_pc_ver_revision,
        t_pc_nm_platform_type,
        t_pc_ipaddr,
        t_pc_fl_enable,
        t_pcconnect_fl_constate,
        t_pcconnect_dt_access,
        t_pcconnect_fl_usesituation,
        t_pcconnect_logon_user,
        t_pcconnect_dt_usesituation,
        t_graphics_card_card_name,
        t_graphics_card_card_maker,
        t_graphics_card_serial_no,
        t_graphics_card_driver_name,
        t_graphics_card_driver_version,
        t_graphics_card_dt_buy,
        t_mon_id_mon,
        t_mon_nm_maker,
        t_mon_nm_model,        
        t_mon_no_serial,
        t_mon_monitor_udi,
        t_mon_connection_type,
        t_mon_usedtime,
        t_mon_no_asset,
        t_mon_dt_buy,        
        t_calmode_id_cal,
        t_calmode_no_cal,
        t_calmode_cal_name,
        t_calmode_fl_manage,
        t_calmode_comment,
        t_policy_registration_value_organization,
        t_policy_registration_value_address,
        t_policy_registration_value_phone_number,
        t_policy_registration_value_administrator,
        t_policy_registration_value_service_provider,
        t_registration_item1,
        t_registration_item2,
        t_registration_item3,
        t_registration_item4,
        t_registration_item5,
        t_registration_item6,
        t_registration_item7,
        t_registration_item8,        
        t_monitor_fw_system,
        t_monitor_fw_controller,
        t_monitor_fw_frontend,
        t_monitor_fw_osd,
        t_monitor_fw_fpga,
        t_last_pc_fl_enable,
        t_lea_operating_time,
        t_lea_lea_time,
        t_lea_average_usage_time_of_a_day,
        t_lea_lea_result,
        usb_disconnected_alert_id_mon,
        backlight_always_on_alert_dulation
    )
AS
SELECT
    (
        ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_CALMODE.id_cal), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LASTPC.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), GW.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), ROOM.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), DEPT.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LOC.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), POLICY_REGISTRATION.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_MONITOR_FW.id_monitor), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PCCONNECT.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.id_pc), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.no_screen), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_REGISTRATION.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LEA.id_lea), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), USB_DISCONNECTED_ALERT.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), BACKLIGHT_ALWAYS_ON_ALERT.id_mon), 'NULL')
    ) Id,
    GW.group_name t_group_group_name_gateway,
    LOC.group_name t_group_group_name_location,
    DEPT.group_name t_group_group_name_department,
    ROOM.group_name t_group_group_name_room,
    ROOM.id_group t_group_id_group_room,
    T_PC.nm_pc t_pc_nm_pc,
    T_PC.ver_major t_pc_ver_major,
    T_PC.ver_minor t_pc_ver_minor,
    T_PC.ver_build t_pc_ver_build,
    T_PC.ver_revision t_pc_ver_revision,
    T_PC.nm_platform_type t_pc_nm_platform_type,
    T_PC.ipaddr t_pc_ipaddr,
    T_PC.fl_enable t_pc_fl_enable,
    T_PCCONNECT.fl_constate t_pcconnect_fl_constate,
    T_PCCONNECT.dt_access t_pcconnect_dt_access,
    T_PCCONNECT.fl_usesituation t_pcconnect_fl_usesituation,
    T_PCCONNECT.logon_user t_pcconnect_logon_user,
    T_PCCONNECT.dt_usesituation t_pcconnect_dt_usesituation,
    T_GRAPHICS_CARD.card_name t_graphics_card_card_name,
    T_GRAPHICS_CARD.card_maker t_graphics_card_card_maker,
    T_GRAPHICS_CARD.serial_no t_graphics_card_serial_no,
    T_GRAPHICS_CARD.driver_name t_graphics_card_driver_name,
    T_GRAPHICS_CARD.driver_version t_graphics_card_driver_version,
    T_GRAPHICS_CARD.dt_buy t_graphics_card_dt_buy,
    T_MON.id_mon t_mon_id_mon,
    T_MON.nm_maker t_mon_nm_maker,
    T_MON.nm_model t_mon_nm_model,
    T_MON.no_serial t_mon_no_serial,
    T_MON.monitor_udi t_mon_monitor_udi,
    T_MON.connection_type t_mon_connection_type,
    T_MON.usedtime t_mon_usedtime,
    T_MON.no_asset t_mon_no_asset,
    T_MON.dt_buy t_mon_dt_buy,
    T_CALMODE.id_cal t_calmode_id_cal,
    T_CALMODE.no_cal t_calmode_no_cal,
    T_CALMODE.cal_name t_calmode_cal_name,
    T_CALMODE.fl_manage t_calmode_fl_manage,
    T_CALMODE.comment t_calmode_comment,
    POLICY_REGISTRATION.organization t_policy_registration_value_organization,
    POLICY_REGISTRATION.address t_policy_registration_value_address,
    POLICY_REGISTRATION.phone_number t_policy_registration_value_phone_number,
    POLICY_REGISTRATION.administrator t_policy_registration_value_administrator,
    POLICY_REGISTRATION.service_provider t_policy_registration_value_service_provider,
    T_REGISTRATION.item1 t_registration_item1,
    T_REGISTRATION.item2 t_registration_item2,
    T_REGISTRATION.item3 t_registration_item3,
    T_REGISTRATION.item4 t_registration_item4,
    T_REGISTRATION.item5 t_registration_item5,
    T_REGISTRATION.item6 t_registration_item6,
    T_REGISTRATION.item7 t_registration_item7,
    T_REGISTRATION.item8 t_registration_item8,
    T_MONITOR_FW.system t_monitor_fw_system,
    T_MONITOR_FW.controller t_monitor_fw_controller,
    T_MONITOR_FW.frontend t_monitor_fw_frontend,
    T_MONITOR_FW.osd t_monitor_fw_osd,
    T_MONITOR_FW.fpga t_monitor_fw_fpga,
    LASTPC.fl_enable t_last_pc_fl_enable,
    LEA.operating_time t_lea_operating_time,
    LEA.lea_time t_lea_lea_time,
    LEA.average_usage_time_of_a_day t_lea_average_usage_time_of_a_day,
    LEA.lea_result t_lea_lea_result,
    USB_DISCONNECTED_ALERT.id_mon usb_disconnected_alert_id_mon,
    BACKLIGHT_ALWAYS_ON_ALERT.dulation backlight_always_on_alert_dulation
FROM
    T_MON
    INNER JOIN T_CALMODE ON T_MON.id_mon = T_CALMODE.id_mon
    INNER JOIN T_PC LASTPC ON T_MON.id_lastpc = LASTPC.id_pc
    INNER JOIN T_GROUP GW ON LASTPC.id_gateway = GW.id_group
    INNER JOIN T_GROUP ROOM ON LASTPC.id_room = ROOM.id_group
    INNER JOIN T_GROUP DEPT
        ON ROOM.no_positionleft > DEPT.no_positionleft AND ROOM.no_positionleft < DEPT.no_positionright
        AND NOT EXISTS
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE
                    MIDDLE.no_positionleft BETWEEN DEPT.no_positionleft AND DEPT.no_positionright
                    AND ROOM.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (ROOM.id_group, DEPT.id_group))
    INNER JOIN T_GROUP LOC
        ON DEPT.no_positionleft > LOC.no_positionleft AND DEPT.no_positionleft < LOC.no_positionright
        AND NOT EXISTS
            (
                SELECT *
                FROM T_GROUP MIDDLE
                WHERE
                    MIDDLE.no_positionleft BETWEEN LOC.no_positionleft AND LOC.no_positionright
                    AND DEPT.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (DEPT.id_group, LOC.id_group))
    LEFT OUTER JOIN
    (
        SELECT
            T_POLICY_GROUP_SET.id_group,
            T_POLICY_REGISTRATION.orgnization_value organization,
            T_POLICY_REGISTRATION.address_value address,
            T_POLICY_REGISTRATION.phone_number_value phone_number,
            T_POLICY_REGISTRATION.administrator_value administrator,
            T_POLICY_REGISTRATION.service_provider_value service_provider
        FROM
            T_POLICY_GROUP_SET
            INNER JOIN T_POLICY_REGISTRATION ON T_POLICY_GROUP_SET.id_policy = T_POLICY_REGISTRATION.id_policy
        WHERE
            T_POLICY_GROUP_SET.policy_type = 4
    ) POLICY_REGISTRATION ON LASTPC.id_room = POLICY_REGISTRATION.id_group
    LEFT OUTER JOIN T_MONITOR_FW ON T_MON.id_mon = T_MONITOR_FW.id_monitor
    LEFT OUTER JOIN T_PC ON T_MON.id_pc = T_PC.id_pc
    LEFT OUTER JOIN T_PCCONNECT ON T_PC.id_pc = T_PCCONNECT.id_pc
    LEFT OUTER JOIN T_GRAPHICS_CARD ON T_MON.id_pc = T_GRAPHICS_CARD.id_pc AND T_MON.no_screen = T_GRAPHICS_CARD.no_screen
    LEFT OUTER JOIN T_REGISTRATION ON LASTPC.id_pc = T_REGISTRATION.id_pc
    LEFT OUTER JOIN
    (
        SELECT
            id_lea,
            T_LIFETIME_EXPECTANCY.id_pc,
            T_LIFETIME_EXPECTANCY.id_cal,
            T_LIFETIME_EXPECTANCY.operating_time,
            lea_time,
            average_usage_time_of_a_day,
            lea_result
        FROM
            T_LIFETIME_EXPECTANCY
            INNER JOIN
            (
                SELECT id_pc, id_cal, MAX(operating_time) operating_time
                FROM T_LIFETIME_EXPECTANCY
                WHERE fl_lea_enable = 1
                GROUP BY id_pc, id_cal
            ) SUBQUERY ON T_LIFETIME_EXPECTANCY.operating_time = SUBQUERY.operating_time AND T_LIFETIME_EXPECTANCY.id_pc = SUBQUERY.id_pc AND T_LIFETIME_EXPECTANCY.id_cal = SUBQUERY.id_cal AND T_LIFETIME_EXPECTANCY.fl_lea_enable = 1
    ) LEA ON T_PC.id_pc = LEA.id_pc AND T_CALMODE.id_cal = LEA.id_cal
    LEFT OUTER JOIN
    (
        SELECT
            T_MON.id_mon id_mon
        FROM
            T_MON
            INNER JOIN
            (
                SELECT
                    T_MON.id_mon
                FROM
                    T_CALMODE
                    INNER JOIN T_MON ON T_MON.id_mon = T_CALMODE.id_mon
                WHERE
                    T_CALMODE.fl_manage = 1
                GROUP BY T_MON.id_mon
                HAVING COUNT(id_cal) >= 1
            ) CAL_MANAGED_MONITOR ON T_MON.id_mon = CAL_MANAGED_MONITOR.id_mon
            INNER JOIN T_USB_CONNECTION_STATUS ON T_MON.id_mon = T_USB_CONNECTION_STATUS.id_mon
            WHERE (T_USB_CONNECTION_STATUS.fl_usb_status = 0 AND T_USB_CONNECTION_STATUS.fl_alert_confirmed = 0) AND T_MON.fl_enable = 1
    ) USB_DISCONNECTED_ALERT ON T_MON.id_mon = USB_DISCONNECTED_ALERT.id_mon
    LEFT OUTER JOIN
    (
        SELECT
            T_MON.id_mon id_mon,
            DATEDIFF(minute, T_ALERT_MONITOR_ALWAYS_ON.dt_alert_reset, T_ALERT_MONITOR_ALWAYS_ON.dt_latest_upload)/60 dulation
        FROM
            T_MON
            INNER JOIN
            (
                SELECT
                    T_MON.id_mon
                FROM
                    T_CALMODE
                    INNER JOIN T_MON ON T_MON.id_mon = T_CALMODE.id_mon
                WHERE
                    T_CALMODE.fl_manage = 1
                GROUP BY T_MON.id_mon
                HAVING COUNT(id_cal) >= 1
            ) CAL_MANAGED_MONITOR ON T_MON.id_mon = CAL_MANAGED_MONITOR.id_mon
            INNER JOIN T_ALERT_MONITOR_ALWAYS_ON ON T_MON.id_mon = T_ALERT_MONITOR_ALWAYS_ON.id_mon
        WHERE
            T_ALERT_MONITOR_ALWAYS_ON.alert_status = 1 AND
            T_MON.fl_enable = 1
    ) BACKLIGHT_ALWAYS_ON_ALERT ON T_MON.id_mon = BACKLIGHT_ALWAYS_ON_ALERT.id_mon
WHERE
    T_MON.fl_enable = 1
go
CREATE VIEW V_ALL_MONITORS_HISTORY_HANDS_OFF_CHECK
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 5 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_RADICS_SELFQC
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 12 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_CALIBRATION
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 3 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_UNIFORMITY_MEASUREMENT
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 7 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_GLAYSCALE_CHECK
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_type*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 16 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_type*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_LUMINANCE_CHECK
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_type*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 15 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_type*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_NEWEST
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_type*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold IN (0, 1, 2, 3, 5, 7, 12, 15, 16) AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_type*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_ACCEPTANCE_TEST
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 0 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_CONSISTENCY_TEST
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 2 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test    
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ALL_MONITORS_HISTORY_VISUAL_CHECK
    (            
        Id,
        t_his_id_his,
        t_his_id_cal,
        t_his_dt_test, 
        t_his_task_typeold, 
        t_qcguideline_test_name_test_name,        
        t_qcguideline_test_name_language, 
        t_qcguideline_name_main_name, 
        t_qcguideline_name_category_name, 
        t_qcguideline_name_language,
        t_his_tester, 
        t_his_result, 
        t_his_lmax_measurement_value,        
        t_his_lmin_measurement_value, 
        t_his_lamb_measurement_value, 
        t_his_lmax_measurement_values_x, 
        t_his_lmax_measurement_values_y,
        t_his_color_temperature, 
        t_hisdetail_max_error_rate
    )
AS    
SELECT 
    (            
        ISNULL(CONVERT(nvarchar(10), HIS.id_his), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + 
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL') + '_' +        
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL')
    ) Id,
    HIS.id_his t_his_id_his,
    HIS.id_cal t_his_id_cal,
    HIS.dt_test t_his_dt_test,            
    HIS.task_typeold t_his_task_typeold,            
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name,            
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,            
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,            
	T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    HIS.tester t_his_tester,            
    HIS.result t_his_result,            
    CAST(ROUND(HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate
FROM
    (            
        SELECT        
            id_his,    
            T_HIS.id_cal,    
            task_type,    
            T_HIS.task_typeold,    
            task_seq,    
            result,    
            id_qcguideline,    
            tester,    
            ver_qcguideline,    
            lmax_measurement_value,    
            lmin_measurement_value,    
            lamb_measurement_value,    
            monitor_usedtime,    
            lmax_measurement_values_x,    
            lmax_measurement_values_y,    
            color_temperature,    
            SUBQUERY.dt_test    
        FROM        
            T_HIS
            INNER JOIN
            (    
                SELECT id_cal, MAX(DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7)))) dt_test
                FROM T_HIS
                WHERE task_typeold = 1 AND result IN (0, 1, 4) AND fl_delete = 0
                GROUP BY id_cal
            ) SUBQUERY ON T_HIS.id_cal = SUBQUERY.id_cal AND DATEADD(NANOSECOND,T_HIS.task_typeold*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) = SUBQUERY.dt_test
    ) HIS 
    LEFT OUTER JOIN T_HISDETAIL ON HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq            
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
go
CREATE VIEW V_ORGANIZATION_TREE
	(
		Id, t_group_id_group_parent, t_group_group_name_parent, t_group_group_type_parent, t_group_status_parent,
		t_group_id_group_child, t_group_group_name_child, t_group_group_type_child, t_group_status_child, t_group_status_grandchild
	)
AS
SELECT
	(
		ISNULL(CONVERT(nvarchar(10), T_GROUP.id_group), 'NULL') + '_' +
		ISNULL(CONVERT(nvarchar(10), CHILD.id_group), 'NULL')
	) Id,
	T_GROUP.id_group t_group_id_group_parent,
	T_GROUP.group_name t_group_group_name_parent,
	T_GROUP.group_type t_group_group_type_parent,
	T_GROUP.status t_group_status_parent,
	CHILD.id_group t_group_id_group_child,
	CHILD.group_name t_group_group_name_child,
	CHILD.group_type t_group_group_type_child,
	CHILD.status t_group_status_child,
	MAX(GRANDCHILD.status) t_group_status_grandchild
FROM
	T_GROUP
	LEFT OUTER JOIN T_GROUP CHILD ON T_GROUP.no_positionleft < CHILD.no_positionleft AND CHILD.no_positionleft < T_GROUP.no_positionright AND (CHILD.group_type = 0 OR CHILD.group_type = 1 OR CHILD.group_type = 2)
	LEFT OUTER JOIN T_GROUP GRANDCHILD ON CHILD.no_positionleft < GRANDCHILD.no_positionleft AND GRANDCHILD.no_positionleft < CHILD.no_positionright AND (GRANDCHILD.group_type = 0 OR GRANDCHILD.group_type = 1 OR GRANDCHILD.group_type = 2)
WHERE
	NOT EXISTS
	(
		SELECT *
		FROM T_GROUP MIDDLE
		WHERE
			MIDDLE.no_positionleft BETWEEN T_GROUP.no_positionleft AND T_GROUP.no_positionright
			AND CHILD.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
			AND MIDDLE.id_group NOT IN (T_GROUP.id_group, CHILD.id_group)
	)
	AND NOT EXISTS
	(
		SELECT *
		FROM T_GROUP MIDDLE
		WHERE
			MIDDLE.no_positionleft BETWEEN CHILD.no_positionleft AND CHILD.no_positionright
			AND GRANDCHILD.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
			AND MIDDLE.id_group NOT IN (CHILD.id_group, GRANDCHILD.id_group)
	)
	AND (T_GROUP.group_type = 0 OR T_GROUP.group_type = 1 OR T_GROUP.group_type = 2)
GROUP BY T_GROUP.id_group, CHILD.id_group, T_GROUP.group_name , CHILD.group_name, T_GROUP.group_type, CHILD.group_type, T_GROUP.status, CHILD.status                                                  
go
CREATE VIEW V_UNREGISTERED_MONITOR_SETTING
    (id,t_pc_id_pc,t_unregistered_mon_no_screen,t_unregistered_mon_no_monitor,
    t_unregistered_mon_nm_maker,t_unregistered_mon_edid_monitor_model,t_unregistered_mon_edid_monitor_serial_no,
    t_hide_and_seek_setting_hide_and_seek_flg,t_hide_and_seek_setting_transparent_window_display_flg,
    t_hide_and_seek_setting_pinp_screen_display_flg,t_hide_and_seek_setting_pinp_screen_hide_flg,
    t_pinp_registration_no_mon,t_pinp_registration_pinp_display_position,
    t_pinp_registration_pinp_move_position_x,t_pinp_registration_pinp_move_position_y,
    t_pinp_registration_mouse_operation_flg,t_pinp_registration_pinp_switch_position,
    t_pinp_registration_pinp_switch_timing,t_pinp_registration_pinp_hot_key_flg,
    t_pinp_switch_position_no_mon,t_pinp_switch_position_pinp_switch_position,
    t_pinp_switch_position_pinp_switch_position_start_point_x,t_pinp_switch_position_pinp_switch_position_start_point_y,
    t_pinp_switch_position_pinp_switch_position_end_point_x,t_pinp_switch_position_pinp_switch_position_end_point_y)
AS
SELECT
(
ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_DISPLAY.id_pc), 'NULL') + '_' + 	
ISNULL(CONVERT(nvarchar(10), T_DISPLAY.no_screen), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_UNREGISTERED_MONITOR.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_UNREGISTERED_MONITOR.no_monitor), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_HIDE_AND_SEEK_SETTING.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_PINP_REGISTRATION.id_pc), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_PINP_REGISTRATION.no_mon), 'NULL') + '_' +
ISNULL(CONVERT(nvarchar(10), T_PINP_SWITCH_POSITION.id_pinp_switch), 'NULL')
)
AS Id,	
T_PC.id_pc t_pc_id_pc,
T_UNREGISTERED_MONITOR.no_screen t_unregistered_mon_no_screen,
T_UNREGISTERED_MONITOR.no_monitor t_unregistered_mon_no_monitor,
T_UNREGISTERED_MONITOR.nm_maker t_unregistered_mon_nm_maker,
T_UNREGISTERED_MONITOR.edid_monitor_model t_unregistered_mon_edid_monitor_model,
T_UNREGISTERED_MONITOR.edid_monitor_serial_no t_unregistered_mon_edid_monitor_serial_no,
T_HIDE_AND_SEEK_SETTING.hide_and_seek_flg t_hide_and_seek_setting_hide_and_seek_flg,
T_HIDE_AND_SEEK_SETTING.transparent_window_display_flg t_hide_and_seek_setting_transparent_window_display_flg,
T_HIDE_AND_SEEK_SETTING.pinp_screen_display_flg t_hide_and_seek_setting_pinp_screen_display_flg,
T_HIDE_AND_SEEK_SETTING.pinp_screen_hide_flg t_hide_and_seek_setting_pinp_screen_hide_flg,
T_PINP_REGISTRATION.no_mon t_pinp_registration_no_mon,
T_PINP_REGISTRATION.pinp_display_position t_pinp_registration_pinp_display_position,
T_PINP_REGISTRATION.pinp_move_position_x t_pinp_registration_pinp_move_position_x,
T_PINP_REGISTRATION.pinp_move_position_y t_pinp_registration_pinp_move_position_y,
T_PINP_REGISTRATION.mouse_operation_flg t_pinp_registration_mouse_operation_flg,
T_PINP_REGISTRATION.pinp_switch_position t_pinp_registration_pinp_switch_position,
T_PINP_REGISTRATION.pinp_switch_timing t_pinp_registration_pinp_switch_timing,
T_PINP_REGISTRATION.pinp_hot_key_flg t_pinp_registration_pinp_hot_key_flg,
T_PINP_SWITCH_POSITION.no_mon t_pinp_switch_position_no_mon,
T_PINP_SWITCH_POSITION.pinp_switch_position t_pinp_switch_position_pinp_switch_position,
T_PINP_SWITCH_POSITION.pinp_switch_position_start_point_x t_pinp_switch_position_pinp_switch_position_start_point_x,
T_PINP_SWITCH_POSITION.pinp_switch_position_start_point_y t_pinp_switch_position_pinp_switch_position_start_point_y,
T_PINP_SWITCH_POSITION.pinp_switch_position_end_point_x t_pinp_switch_position_pinp_switch_position_end_point_x,
T_PINP_SWITCH_POSITION.pinp_switch_position_end_point_y t_pinp_switch_position_pinp_switch_position_end_point_y
FROM (
T_PC
inner join T_DISPLAY on T_PC.id_pc = T_DISPLAY.id_pc
left outer join T_UNREGISTERED_MONITOR  on T_UNREGISTERED_MONITOR.id_pc = T_PC.id_pc AND T_UNREGISTERED_MONITOR.no_screen = T_DISPLAY.no_screen
left outer join T_HIDE_AND_SEEK_SETTING on T_PC.id_pc = T_HIDE_AND_SEEK_SETTING.id_pc
left outer join T_PINP_REGISTRATION on T_UNREGISTERED_MONITOR.id_pc = T_PINP_REGISTRATION.id_pc AND T_UNREGISTERED_MONITOR.no_monitor = T_PINP_REGISTRATION.no_mon
left outer join T_PINP_SWITCH_POSITION on T_PINP_REGISTRATION.id_pc = T_PINP_SWITCH_POSITION.id_pc AND T_PINP_REGISTRATION.no_mon = T_PINP_SWITCH_POSITION.no_mon
)
go
CREATE VIEW V_ACTION_REQUIRED_ALERT
    (            
        Id, 
        t_group_group_name_gateway,t_group_group_name_location,t_group_group_name_department,t_group_group_name_room,t_group_id_group_room,
        t_pc_id_pc,t_pc_nm_pc,t_pc_ver_major,t_pc_ver_minor,t_pc_ver_build,t_pc_ver_revision,t_pc_nm_platform_type,t_pc_ipaddr,t_pc_dt_create,t_pc_fl_enable,
        t_pcconnect_fl_constate,t_pcconnect_dt_access,t_pcconnect_logon_user,t_pcconnect_dt_usesituation,t_pcconnect_fl_usesituation,
        t_graphics_card_card_name,t_graphics_card_card_maker,t_graphics_card_serial_no,t_graphics_card_driver_name,t_graphics_card_driver_version,t_graphics_card_dt_buy,
        t_mon_id_mon,t_mon_nm_maker,t_mon_nm_model,t_mon_kd_monitor,t_mon_no_serial,t_mon_monitor_udi,t_mon_connection_type,t_mon_usedtime,t_mon_no_asset,t_mon_dt_buy,t_mon_width,t_mon_height,t_mon_nm_profile,t_mon_dt_create,
        t_filter_monitor_model_monitor_type,
        t_usb_connection_status_fl_usb_status,
        t_calmode_id_cal,t_calmode_cal_name,t_calmode_comment,
        fix_remotejob_count,
        t_lea_operating_time,t_lea_lea_time,t_lea_average_usage_time_of_a_day,t_lea_lea_result,
        t_hands_off_min_ad_value,
        t_hands_off_max_ad_value,t_hands_off_max_judgment,t_hands_off_max_threshold,
        t_core_config_backlight_meter_threshold,
        t_swingsensor_kd_type,
        t_presensesensor_id_mon,
        t_illuminancesensor_kd_type,
        t_policy_registration_value_organization,t_policy_registration_value_address,t_policy_registration_value_phone_number,t_policy_registration_value_administrator,t_policy_registration_value_service_provider,
        t_registration_item1,t_registration_item2,t_registration_item3,t_registration_item4,t_registration_item5,t_registration_item6,t_registration_item7,t_registration_item8,
        t_his_id_his,t_his_dt_test,t_his_task_type,t_his_result,t_his_tester,t_his_cd_error,t_his_lmax_measurement_value,t_his_lmin_measurement_value,t_his_lamb_measurement_value,t_his_lmax_measurement_values_x,t_his_lmax_measurement_values_y,t_his_color_temperature,
        t_hisdetail_max_error_rate,
        t_qcguideline_name_main_name,t_qcguideline_name_category_name,t_qcguideline_name_language,
        t_monitor_fw_system,t_monitor_fw_controller,t_monitor_fw_frontend,t_monitor_fw_osd,t_monitor_fw_fpga
    )
AS
SELECT
    (
        ISNULL(CONVERT(nvarchar(10), GW.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), ROOM.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), DEPT.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LOC.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PCCONNECT.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.id_pc), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_GRAPHICS_CARD.no_screen), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_FILTER_MONITOR_MODEL.id_filter_monitor_model), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_USB_CONNECTION_STATUS.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_CALMODE.id_cal), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), LEA.id_lea), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), HANDS_OFF_MIN.id_cal), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), HANDS_OFF_MAX.id_cal), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_CORE_CONFIG.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_SWINGSENSOR.id_sensor), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PRESENSESENSOR.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_ILLUMINANCESENSOR.id_sensor), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), POLICY_REGISTRATION.id_group), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_REGISTRATION.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_HIS.id_his), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.id_his), 'NULL') + '_' + ISNULL(CONVERT(nvarchar(10), T_HISDETAIL.detail_type), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_MONITOR_FW.id_monitor), 'NULL')
    ) Id,
    GW.group_name t_group_group_name_gateway,
    LOC.group_name t_group_group_name_location,
    DEPT.group_name t_group_group_name_department,
    ROOM.group_name t_group_group_name_room,
    ROOM.id_group t_group_id_group_room,
    T_PC.id_pc t_pc_id_pc,
    T_PC.nm_pc t_pc_nm_pc,
    T_PC.ver_major t_pc_ver_major,
    T_PC.ver_minor t_pc_ver_minor,
    T_PC.ver_build t_pc_ver_build,
    T_PC.ver_revision t_pc_ver_revision,   
    T_PC.nm_platform_type t_pc_nm_platform_type,    
    T_PC.ipaddr t_pc_ipaddr,    
    T_PC.dt_create t_pc_dt_create,
    T_PC.fl_enable t_pc_fl_enable,
    T_PCCONNECT.fl_constate t_pcconnect_fl_constate,
    T_PCCONNECT.dt_access t_pcconnect_dt_access,
    T_PCCONNECT.logon_user t_pcconnect_logon_user,
    T_PCCONNECT.dt_usesituation t_pcconnect_dt_usesituation,
    T_PCCONNECT.fl_usesituation t_pcconnect_fl_usesituation,
    T_GRAPHICS_CARD.card_name t_graphics_card_card_name,
    T_GRAPHICS_CARD.card_maker t_graphics_card_card_maker,
    T_GRAPHICS_CARD.serial_no t_graphics_card_serial_no,
    T_GRAPHICS_CARD.driver_name t_graphics_card_driver_name,
    T_GRAPHICS_CARD.driver_version t_graphics_card_driver_version,
    T_GRAPHICS_CARD.dt_buy t_graphics_card_dt_buy,
    T_MON.id_mon t_mon_id_mon,
    T_MON.nm_maker t_mon_nm_maker,
    T_MON.nm_model t_mon_nm_model,
    T_MON.kd_monitor t_mon_kd_monitor,
    T_MON.no_serial t_mon_no_serial,
    T_MON.monitor_udi t_mon_monitor_udi,
    T_MON.connection_type t_mon_connection_type,
    T_MON.usedtime t_mon_usedtime,
    T_MON.no_asset t_mon_no_asset,
    T_MON.dt_buy t_mon_dt_buy,
    T_MON.width t_mon_width,
    T_MON.height t_mon_height,
    T_MON.nm_profile t_mon_nm_profile ,    
    T_MON.dt_create t_mon_dt_create,
    T_FILTER_MONITOR_MODEL.monitor_type t_filter_monitor_model_monitor_type,
    T_USB_CONNECTION_STATUS.fl_usb_status t_usb_connection_status_fl_usb_status,
    T_CALMODE.id_cal t_calmode_id_cal,
    T_CALMODE.cal_name t_calmode_cal_name,
    T_CALMODE.comment t_calmode_comment,
    FIX_REMOTE_JOB.count fix_remotejob_count,
    LEA.operating_time t_lea_operating_time,
    LEA.lea_time t_lea_lea_time,
    LEA.average_usage_time_of_a_day t_lea_average_usage_time_of_a_day,
    LEA.lea_result t_lea_lea_result,
    HANDS_OFF_MIN.ad_value t_hands_off_min_ad_value,
    HANDS_OFF_MAX.ad_value t_hands_off_max_ad_value,
    HANDS_OFF_MAX.judgment t_hands_off_max_judgment,
    HANDS_OFF_MAX.threshold t_hands_off_max_threshold,
    T_CORE_CONFIG.backlight_meter_threshold t_core_config_backlight_meter_threshold,
    T_SWINGSENSOR.kd_type t_swingsensor_kd_type,
    T_PRESENSESENSOR.id_mon t_presensesensor_id_mon,
    T_ILLUMINANCESENSOR.kd_type t_illuminancesensor_kd_type,    
    POLICY_REGISTRATION.organization t_policy_registration_value_organization,
    POLICY_REGISTRATION.address t_policy_registration_value_address,
    POLICY_REGISTRATION.phone_number t_policy_registration_value_phone_number,
    POLICY_REGISTRATION.administrator t_policy_registration_value_administrator,
    POLICY_REGISTRATION.service_provider t_policy_registration_value_service_provider,
    T_REGISTRATION.item1 t_registration_item1,
    T_REGISTRATION.item2 t_registration_item2,
    T_REGISTRATION.item3 t_registration_item3,
    T_REGISTRATION.item4 t_registration_item4,
    T_REGISTRATION.item5 t_registration_item5,
    T_REGISTRATION.item6 t_registration_item6,
    T_REGISTRATION.item7 t_registration_item7,
    T_REGISTRATION.item8 t_registration_item8,
    T_HIS.id_his t_his_id_his,
    DATEADD(NANOSECOND,T_HIS.task_type*1000 + ISNULL(T_HIS.task_seq,0)*100,CAST(T_HIS.dt_test AS DATETIME2(7))) t_his_dt_test,
    T_HIS.task_type t_his_task_type,
    T_HIS.result t_his_result,
    T_HIS.tester t_his_tester,
    T_HIS.cd_error t_his_cd_error,    
    CAST(ROUND(T_HIS.lmax_measurement_value,2) AS decimal(38,2)) t_his_lmax_measurement_value,
    CAST(ROUND(T_HIS.lmin_measurement_value,2) AS decimal(38,2)) t_his_lmin_measurement_value,
    CAST(ROUND(T_HIS.lamb_measurement_value,2) AS decimal(38,2)) t_his_lamb_measurement_value,
    CAST(ROUND(T_HIS.lmax_measurement_values_x,2) AS decimal(38,2)) t_his_lmax_measurement_values_x,
    CAST(ROUND(T_HIS.lmax_measurement_values_y,2) AS decimal(38,2)) t_his_lmax_measurement_values_y,
    CAST(ROUND(T_HIS.color_temperature,0,1) AS decimal(38,0)) t_his_color_temperature,
    CAST(ROUND(T_HISDETAIL.max_error_rate,2) AS decimal(38,2)) t_hisdetail_max_error_rate,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,
    T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    T_MONITOR_FW.system t_monitor_fw_system,
    T_MONITOR_FW.controller t_monitor_fw_controller,
    T_MONITOR_FW.frontend t_monitor_fw_frontend,
    T_MONITOR_FW.osd t_monitor_fw_osd,
    T_MONITOR_FW.fpga t_monitor_fw_fpga
FROM
    T_ALERT_TASK
    INNER JOIN T_HIS ON T_ALERT_TASK.id_his = T_HIS.id_his
    LEFT OUTER JOIN T_HISDETAIL ON T_HIS.id_his = T_HISDETAIL.id_his AND T_HISDETAIL.detail_type IN (1,4,12,16)
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON T_HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND T_HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
    INNER JOIN T_MON ON T_HIS.id_mon = T_MON.id_mon AND T_MON.fl_enable = 1
    INNER JOIN
    (
        SELECT
            T_MON.id_mon
        FROM
            T_CALMODE
            INNER JOIN T_MON ON T_MON.id_mon = T_CALMODE.id_mon
        WHERE
            T_CALMODE.fl_manage = 1
        GROUP BY
            T_MON.id_mon
        HAVING
            COUNT(id_cal) >= 1
    ) CAL_MANAGED_MONITOR ON T_MON.id_mon = CAL_MANAGED_MONITOR.id_mon
    LEFT OUTER JOIN T_USB_CONNECTION_STATUS ON T_MON.id_mon = T_USB_CONNECTION_STATUS.id_mon
    LEFT OUTER JOIN T_FILTER_MONITOR_MODEL ON T_MON.kd_monitortype = 0 AND T_FILTER_MONITOR_MODEL.model_name = T_MON.nm_model
    LEFT OUTER JOIN T_MONITOR_FW ON T_MON.id_mon = T_MONITOR_FW.id_monitor    
    LEFT OUTER JOIN T_SWINGSENSOR ON T_MON.id_swingsensor = T_SWINGSENSOR.id_sensor            
    LEFT OUTER JOIN T_PRESENSESENSOR ON T_MON.id_mon = T_PRESENSESENSOR.id_mon            
    LEFT OUTER JOIN T_ILLUMINANCESENSOR ON T_MON.id_illuminancesensor = T_ILLUMINANCESENSOR.id_sensor  AND T_ILLUMINANCESENSOR.kd_type <> 3
    LEFT OUTER JOIN T_CALMODE ON T_HIS.id_cal = T_CALMODE.id_cal AND T_HIS.id_mon = T_CALMODE.id_mon AND T_CALMODE.fl_manage = 1
    LEFT OUTER JOIN
            (
                SELECT
                    T_JOB_MANAGE.id_pc id_pc,
                    T_JOB_MANAGE.no_monitor no_monitor,
                    T_JOB_MANAGE.no_cal no_cal,
                    COUNT(*) count
                FROM
                    T_JOB_MANAGE
                WHERE
                    fl_fix_remote_execution = 1
                GROUP BY
                    id_pc,no_monitor,no_cal
            ) FIX_REMOTE_JOB ON T_MON.id_pc = FIX_REMOTE_JOB.id_pc AND T_MON.no_monitor = FIX_REMOTE_JOB.no_monitor AND T_CALMODE.no_cal = FIX_REMOTE_JOB.no_cal
    INNER JOIN T_PC ON T_MON.id_pc = T_PC.id_pc AND T_PC.fl_enable = 1
    INNER JOIN T_PCCONNECT ON T_PC.id_pc = T_PCCONNECT.id_pc
    INNER JOIN T_CORE_CONFIG ON T_PC.id_pc = T_CORE_CONFIG.id_pc
    LEFT OUTER JOIN T_REGISTRATION ON T_PC.id_pc = T_REGISTRATION.id_pc    
    INNER JOIN T_GRAPHICS_CARD ON T_MON.id_pc = T_GRAPHICS_CARD.id_pc AND T_MON.no_screen = T_GRAPHICS_CARD.no_screen
    INNER JOIN T_GROUP GW ON T_PC.id_gateway = GW.id_group
    INNER JOIN T_GROUP ROOM ON T_PC.id_room = ROOM.id_group
    INNER JOIN T_GROUP DEPT
        ON ROOM.no_positionleft > DEPT.no_positionleft AND ROOM.no_positionleft < DEPT.no_positionright
        AND NOT EXISTS
            (
                SELECT
                    *
                FROM
                    T_GROUP MIDDLE
                WHERE
                    MIDDLE.no_positionleft BETWEEN DEPT.no_positionleft AND DEPT.no_positionright
                    AND ROOM.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (ROOM.id_group, DEPT.id_group)
            )
    INNER JOIN T_GROUP LOC
        ON DEPT.no_positionleft > LOC.no_positionleft AND DEPT.no_positionleft < LOC.no_positionright
        AND NOT EXISTS
            (
                SELECT
                    *
                FROM
                    T_GROUP MIDDLE
                WHERE
                    MIDDLE.no_positionleft BETWEEN LOC.no_positionleft AND LOC.no_positionright
                    AND DEPT.no_positionleft BETWEEN MIDDLE.no_positionleft AND MIDDLE.no_positionright
                    AND MIDDLE.id_group NOT IN (DEPT.id_group, LOC.id_group)
             )
    LEFT OUTER JOIN
    (
        SELECT
            T_POLICY_GROUP_SET.id_group,
            T_POLICY_REGISTRATION.orgnization_value organization,
            T_POLICY_REGISTRATION.address_value address,
            T_POLICY_REGISTRATION.phone_number_value phone_number,
            T_POLICY_REGISTRATION.administrator_value administrator,
            T_POLICY_REGISTRATION.service_provider_value service_provider
        FROM
            T_POLICY_GROUP_SET
            INNER JOIN T_POLICY_REGISTRATION ON T_POLICY_GROUP_SET.id_policy = T_POLICY_REGISTRATION.id_policy
        WHERE
            T_POLICY_GROUP_SET.policy_type = 4
    ) POLICY_REGISTRATION ON T_PC.id_room = POLICY_REGISTRATION.id_group
    LEFT OUTER JOIN
    (
        SELECT
            id_lea,
            T_LIFETIME_EXPECTANCY.id_pc,
            T_LIFETIME_EXPECTANCY.id_cal,
            T_LIFETIME_EXPECTANCY.operating_time,
            lea_time,
            average_usage_time_of_a_day,
            lea_result
        FROM
            T_LIFETIME_EXPECTANCY
            INNER JOIN
            (
                SELECT
                    id_pc,
                    id_cal,
                    MAX(operating_time) operating_time
                FROM
                    T_LIFETIME_EXPECTANCY
                WHERE
                    fl_lea_enable = 1
                GROUP BY
                    id_pc, id_cal
            ) SUBQUERY ON T_LIFETIME_EXPECTANCY.operating_time = SUBQUERY.operating_time AND T_LIFETIME_EXPECTANCY.id_pc = SUBQUERY.id_pc AND T_LIFETIME_EXPECTANCY.id_cal = SUBQUERY.id_cal AND T_LIFETIME_EXPECTANCY.fl_lea_enable = 1
    ) LEA ON T_PC.id_pc = LEA.id_pc AND T_CALMODE.id_cal = LEA.id_cal
    LEFT OUTER JOIN
    (
        SELECT
            T_HANDS_OFF.id_cal,
            T_HANDS_OFF.ad_value
        FROM
            T_HANDS_OFF
            INNER JOIN
            (
                SELECT
                    id_cal,
                    MIN(operating_time) operating_time
                FROM
                    T_HANDS_OFF
                GROUP BY
                    id_cal
            ) SUBQUERY ON T_HANDS_OFF.operating_time = SUBQUERY.operating_time AND T_HANDS_OFF.id_cal = SUBQUERY.id_cal
    ) HANDS_OFF_MIN ON T_CALMODE.id_cal = HANDS_OFF_MIN.id_cal
    LEFT OUTER JOIN
    (
        SELECT
            T_HANDS_OFF.id_cal,
            T_HANDS_OFF.ad_value,
            judgment,
            threshold
        FROM
            T_HANDS_OFF
            INNER JOIN
            (
                SELECT
                    id_cal,
                    MAX(operating_time) operating_time
                FROM
                    T_HANDS_OFF
                GROUP BY
                    id_cal
            ) SUBQUERY ON T_HANDS_OFF.operating_time = SUBQUERY.operating_time AND T_HANDS_OFF.id_cal = SUBQUERY.id_cal
    ) HANDS_OFF_MAX ON T_CALMODE.id_cal = HANDS_OFF_MAX.id_cal
WHERE
    ((T_CALMODE.id_cal = T_HIS.id_cal) OR (T_CALMODE.id_cal IS NULL AND T_HIS.id_cal IS NULL))
go
CREATE VIEW V_HISTORY
    (
        Id,
        t_his_id_his,t_his_task_type,t_his_task_typeold,t_his_task_seq,
        t_his_result,t_his_id_qcguideline,t_his_tester,t_his_dt_test,
        t_pc_id_pc,
        t_mon_id_mon,t_mon_nm_maker,t_mon_nm_model,t_mon_no_serial,t_mon_kd_monitor,t_mon_id_pc,
        t_calmode_id_cal, t_calmode_cal_name,
        t_filter_monitor_model_monitor_type,
        t_qcguideline_name_id_qcguideline_name,t_qcguideline_name_language,t_qcguideline_name_main_name,t_qcguideline_name_category_name,
        t_qcguideline_test_name_language,t_qcguideline_test_name_test_name
    )
AS
SELECT
    (
        ISNULL(CONVERT(nvarchar(10), T_HIS.id_his), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_PC.id_pc), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_MON.id_mon), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_CALMODE.id_cal), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_FILTER_MONITOR_MODEL.id_filter_monitor_model), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_NAME.id_qcguideline_name), 'NULL') + '_' +
        ISNULL(CONVERT(nvarchar(10), T_QCGUIDELINE_TEST_NAME.id_qcguideline_test_name), 'NULL')
    ) Id,
    T_HIS.id_his t_his_id_his,
    T_HIS.task_type t_his_task_type,
    T_HIS.task_typeold t_his_task_typeold,
    T_HIS.task_seq t_his_task_seq,
    T_HIS.result t_his_result,
    T_HIS.id_qcguideline t_his_id_qcguideline,
    T_HIS.tester t_his_tester,
    T_HIS.dt_test t_his_dt_test,    
    T_PC.id_pc t_pc_id_pc,
    T_MON.id_mon t_mon_id_mon,
    T_MON.nm_maker t_mon_nm_maker,
    T_MON.nm_model t_mon_nm_model,
    T_MON.no_serial t_mon_no_serial,
    T_MON.kd_monitor t_mon_kd_monitor,
    T_MON.id_pc t_mon_id_pc,
    T_CALMODE.id_cal t_calmode_id_cal,
    T_CALMODE.cal_name t_calmode_cal_name,
    T_FILTER_MONITOR_MODEL.monitor_type t_filter_monitor_model_monitor_type,
    T_QCGUIDELINE_NAME.id_qcguideline_name t_qcguideline_name_id_qcguideline_name,    
    T_QCGUIDELINE_NAME.language t_qcguideline_name_language,
    T_QCGUIDELINE_NAME.main_name t_qcguideline_name_main_name,
    T_QCGUIDELINE_NAME.category_name t_qcguideline_name_category_name,
    T_QCGUIDELINE_TEST_NAME.language t_qcguideline_test_name_language,
    T_QCGUIDELINE_TEST_NAME.test_name t_qcguideline_test_name_test_name
FROM
    T_HIS
    INNER JOIN T_PC ON T_HIS.id_pc = T_PC.id_pc
    LEFT OUTER JOIN T_MON ON T_HIS.id_mon = T_MON.id_mon
    LEFT OUTER JOIN T_CALMODE ON T_HIS.id_cal = T_CALMODE.id_cal AND T_HIS.id_mon = T_CALMODE.id_mon
    LEFT OUTER JOIN T_FILTER_MONITOR_MODEL ON T_MON.kd_monitortype = 0 AND T_FILTER_MONITOR_MODEL.model_name = T_MON.nm_model
    LEFT OUTER JOIN T_QCGUIDELINE_NAME ON T_HIS.id_qcguideline = T_QCGUIDELINE_NAME.id_qcguideline AND T_HIS.ver_qcguideline = T_QCGUIDELINE_NAME.version
    LEFT OUTER JOIN T_QCGUIDELINE_TEST_NAME ON T_HIS.id_qcguideline = T_QCGUIDELINE_TEST_NAME.id_qcguideline AND T_HIS.ver_qcguideline = T_QCGUIDELINE_TEST_NAME.version AND T_HIS.task_type = T_QCGUIDELINE_TEST_NAME.task_type AND T_HIS.task_seq = T_QCGUIDELINE_TEST_NAME.task_seq
WHERE
    T_HIS.fl_delete = 0 AND
    T_HIS.task_typeold IN (0,1,2,3,5,7,8,9,10,12,15,16,18,23,24,25,26,28,29,30,31,33,34,35,36,37,38) AND 
    NOT ((T_HIS.id_qcguideline IS NOT NULL) AND (T_QCGUIDELINE_NAME.id_qcguideline IS NULL))
go
