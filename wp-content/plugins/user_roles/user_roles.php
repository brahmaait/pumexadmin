<?php 

/*
Plugin Name: User Role
Description: Customise WordPress with powerful, professional and intuitive fields
Version: 4.4.12
License: GPL
Copyright: Elliot Condon
Text Domain: acf
Domain Path: /lang
*/








class WP_Analytify_Simple{

  // Constructor
    function __construct() {

        //add_action( 'admin_menu', array( $this, 'wpa_add_menu' ));
        register_activation_hook( __FILE__, array( $this, 'wpa_install' ) );
        register_deactivation_hook( __FILE__, array( $this, 'wpa_uninstall' ) );
    }

   
    function wpa_page_file_path() {
    

    }

    /*
     * Actions perform on activation of plugin
     */
    function wpa_install() {


if ( ! user_can( $current_user, "administrator" ) ) {

    $user = get_role($current_user);
    $user->add_cap('publish_posts',false);

}

 if($user != 'administrator'){
function send_email( $post_id ) {
// lets check if post is not revision
    
    

//global $current_user; // Use global
get_currentuserinfo(); // Make sure global is set, if not set it.
if ( ! user_can( $current_user, "administrator" ) ) {
	if ( !wp_is_post_revision( $post_id ) ) {
          
              $user = wp_get_current_user();
//if ( in_array( 'Editor', (array) $user->roles ) )
                

    //The user has the "author" role

             
		$post_url = get_permalink( $post_id );
		$subject =  get_bloginfo('name').'Post approval';
		$message = "Please find the link below to approve the post"; 
                

		//$message .= "<a href='". $post_url. "'>Click here to view</a>\n\n";
                $email = get_post_meta($post_id, 'supervisors_email_id', true);
               // 
               $headers = 'From: ' . $name . ' <' . $email . '>' . "\r\n";
		//sends email
               
	
		wp_mail($email, $subject, $message );
          }
} }
add_action( 'save_post', 'send_email' );

}

    }

    /*
     * Actions perform on de-activation of plugin
     */
    function wpa_uninstall() {

    if ( ! user_can( $current_user, "administrator" ) ) {

    $user = get_role($current_user);
    $user->add_cap('publish_posts');

     }

    //   $user = get_role('author');
      // $user->add_cap( 'publish_posts' );

    }

}

new WP_Analytify_Simple();
?>
