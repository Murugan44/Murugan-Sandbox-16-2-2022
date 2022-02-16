import { LightningElement } from 'lwc';
import PORTAL from '@salesforce/resourceUrl/portalcarousel'
export default class PortalCarouselLwc extends LightningElement {
    slides=[
        {
            image:`${PORTAL}/portal/Asr.png`,
            heading:'Aesir Space',
            description:'Aesir Space provides the broadest possible range of space covers in the most flexible packages. Based on technical underwriting foundations we apply commercial, scientific and technical rigour to every policy to ensure that the right cover is available.'

        },
        
        {
            image:`${PORTAL}/portal/edm.png`,
            heading:'Edison Motor',
            description:'Edison Motor is a London Market-based MGA providing full-service insurance coverage, claims management and risk control support across multiple specialist sectors of the UK commercial motor insurance sector.'
        },
        {
            image:`${PORTAL}/portal/bdg.png`,
            heading:'Bridge',
            //description:'Our Nordic team represent 100+ years of insurance market expertise with experience from underwriting, distribution, risk engineering and claims handling.'
            description:'Our Nordic team represent 100+ years of insurance market expertise with experience from underwriting, distribution, risk engineering and claims handling. A highly qualified team backed by strong capacity providers and top class infrastructure.'
        },
        {
            image:`${PORTAL}/portal/ls.png`,
            heading:'Affinity',
            description:'Affinity Solutions is a UK-focused MGA that provides a broad range of insurance products for the amateur sports, leisure and entertainment sectors. '
        },
        {
            image:`${PORTAL}/portal/imr.png`,
            heading:'Imara',
            description:'“Imara” is a Swahili word that means strong, resilient and resolute and these are our core attributes. We provide reinsurance backed by A rated security (Standard & Poor’s) and are proud to offer this to our partners in Africa and high growth markets.'
        },
        // {
        //     image:`${PORTAL}/portal/vc.png`,
        //     heading:'Volante Canada',
        //     description:'Volante Canada is a Toronto-based MGA which offers a wide range of products spanning the property, casualty and auto lines of business.'
        // },
        {
            image:`${PORTAL}/portal/hr.png`,
            heading:'Horizon',
            description:'Horizon Europe AG is an MGA established to operate within the European property sector.'
        }
    ]
}