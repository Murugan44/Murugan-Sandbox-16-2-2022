import { LightningElement, api } from 'lwc';
import { reduceErrors  } from 'c/errorHandlingUtils'
export default class ReuseableNotification extends LightningElement {
 @api error;
}