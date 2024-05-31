// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import AutocompleteController from "./autocomplete_controller"
application.register("autocomplete", AutocompleteController)

