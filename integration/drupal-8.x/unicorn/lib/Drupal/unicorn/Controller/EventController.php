<?php

namespace Drupal\unicorn\Controller;

use Drupal\Core\Controller\ControllerBase; 
use Guzzle\Http\ClientInterface;
use Guzzle\Http\Exception\RequestException;

/**
 * Route controller for event display
 */
class EventController extends ControllerBase {

    public function loadEventPage() {
        
        return array(
            '#title'  => 'Test',
            '#markup' => 'Hello, Drupal 8!'
        );
    
    }

}