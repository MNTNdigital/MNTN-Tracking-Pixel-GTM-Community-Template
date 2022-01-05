// Copyright 2019 Google LLC

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

___INFO___

{
  "displayName": "MNTN Tracking Template",
  "description": "This is the MNTN GTM tracking pixel template",
  "categories": ["ADVERTISING", "ANALYTICS","REMARKETING"],
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "",
    "displayName": "",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "help": "Enter an example measurement ID. The value can be any character. This is only an example.",
    "displayName": "Example Measurement ID",
    "defaultValue": "foobarbaz1234",
    "name": "MeasurementID",
    "type": "TEXT"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_referrer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
// require relevant API
const sendPixel = require('sendPixel');
const encodeUriComponent = require('encodeUriComponent');
const tdr = require('getReferrerUrl');
const plh = require('getUrl');
const Math = require('Math');
const injectScript = require('injectScript');
const logToConsole = require('logToConsole');
const generateRandom = require('generateRandom');
const randomNumber = generateRandom(1,10);
const powerful =  Math.pow(randomNumber, 17);
const cb = Math.floor(powerful);
// capture values of template fields
const account = data.advertisertId;
// use the provided APIs to create the pixel call
const url = 'https://dx.mountain.com/spx?dxver=4.0.0&shaid=' + encodeUriComponent(account) + "&tdr=" + tdr() + "&plh=" + plh() + "&cb=" + encodeUriComponent(cb);
injectScript(url, data.gtmOnSuccess, data.gtmOnFailure);
//sendPixel(url, data.gtmOnSuccess, data.gtmOnFailure);


___NOTES___

Created on 9/2/2019, 1:02:37 PM
