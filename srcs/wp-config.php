
<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'ade-la-c' );

/** MySQL database password */
define( 'DB_PASSWORD', '1234' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '8-TS*z|44iC90xU|u($9Nh(i$pspSln%Wk0N5B[VF2-W{=C>h4q[F.+:%7?5Uw=C');
define('SECURE_AUTH_KEY',  'e-o<.I+;<l92cbD;C|44Ruf|8g^?`Xrcz)Eeyz4pgv>79t}jaOHUL/Wh>~5uXq0u');
define('LOGGED_IN_KEY',    'yIuD$A?lf20bSl|mOW}T.E-V@#,5^r#$?1|&Umqa;oul^05NN /-Z.{--U#-}kS.');
define('NONCE_KEY',        'G/:-H2}n2 B=FFa-+Uqx+3~6}|5EXKg5u|&s>D0F#Ne_.9V_9{d&e{T%[s0VF&7v');
define('AUTH_SALT',        '!<LdMCR2L?2|:2{FQ{ 8]bQKMgNn}+5q7mJ8->zfgUE%z1}UK|`mGuVc_PSr$%8o');
define('SECURE_AUTH_SALT', 'e9`~.Tr+&`mVcsGfU )gU=O|AL6fL(+BU?0#zMFa>l@|*1-=O(~$Q6}42|J]371X');
define('LOGGED_IN_SALT',   'Ii<AoDR`&Bn+Bh Kl3H-Q|AWxVF;`N1iN=Y8`M,QMS<9Y ^jpufdyQuD~4_X0yJF');
define('NONCE_SALT',       ')1PZeP)0D/:5Fkb_2ODzzO,s-VVuM U{<T19Eo0(rpn1M<02 546ML]v>|(j%}4|');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
