___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Send Pixel",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "GET-Request to any given Endpoint with custom parameters.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "endpoint",
    "displayName": "Request URL",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^(https://).*"
        ]
      }
    ],
    "help": "Required field. Please provide the endpoint, starting with \"https://\"."
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "params",
    "displayName": "Request Parameters",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key",
        "name": "key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "help": "Please provide the parameters you would like to send as key-value-pairs. At least one key-value-pair is required.",
    "valueValidators": [
      {
        "type": "TABLE_ROW_COUNT",
        "args": [
          1
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Load API's
const sendPixel = require('sendPixel');
const makeString = require('makeString');
const encode = require('encodeUri');

// Endpoint and URL variable
const endpoint = data.endpoint + '?';
let urlParams = '';

// Logic for building parameters
if (data.params) {
 const params = data.params;
 params.forEach((obj, index, array) => {
   if(index === 0) {
     urlParams += makeString(obj.key) + '=' + makeString(obj.value);
     } else {
       urlParams += '&' + makeString(obj.key) + '=' + makeString(obj.value);
    }
 });
}

// Send Pixel
sendPixel(encode(endpoint) + encode(urlParams), data.gtmOnSuccess(), data.gtmOnFailure());


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 16.11.2022, 15:03:15


