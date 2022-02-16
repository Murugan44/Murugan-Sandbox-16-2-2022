import { LightningElement,api } from 'lwc';
import {loadScript} from 'lightning/platformResourceLoader';

import lottieJS from '@salesforce/resourceUrl/lottie';

const PlayMode = {
    Normal: "normal",
    Bounce: "bounce",
}

function parseSrc(src) {
    if (typeof src === "object") {
        return src;
    }
  
    try {
        return JSON.parse(src);
    } catch (e) {
        // Try construct an absolute URL from the src URL
        const srcUrl = new URL(src, window.location.href);
  
        return srcUrl.toString();
    }
}

export default class LottieFilesLWC extends LightningElement {

    @api mode = PlayMode.Normal;
    // @api autoplay = true;
    @api background = "transparent";
    @api controls = false;
    @api hover = false;
    @api loop = false;
    @api preserveAspectRatio = "xMidYMid meet";
    @api renderer = "svg";
    @api height;
    @api width;
    @api speed = 1;
    @api src;
    // @api currentState = PlayerState.Loading;
    // @api seeker;
    // @api intermission = 1;
    // @api description = "lottie animation";

    get computedMainStyle() {
        let result = '';
        if(this.height) {
            result += `height:${this.height}px;`;
        }
        if(this.width) {
            result += `width:${this.width}px;`;
        }
        return result;
    }
   

    loaded = false;
     renderedCallback() {
        if(!this.loaded) {
            loadScript(this, lottieJS).then(() => {
                // this.firstUpdated();
                console.log('lottieJS loaded succesfully')
                this.loaded = true;
                this.testCheck()
            })
        }
    }

    // firstUpdated(){
    //     var container = this.template.querySelector('.animation');
    //     const options = {
    //         container: container,
    //         loop: true,
    //         autoplay: true,
    //         renderer: this.renderer,
    //         rendererSettings: {
    //             preserveAspectRatio: this.preserveAspectRatio,
    //             clearCanvas: false,
    //             progressiveLoad: true,
    //             hideOnTransparent: true,
    //         },
    //     };
    //     console.log('src::', this.src)
    //     const srcParsed = parseSrc(this.src);
    //     console.log('srcParsed::'+srcParsed)
    //     console.log('lottie::',lottie)
    //     const srcAttrib = typeof srcParsed === "string" ? "path" : "animationData";
    //     console.log('srcAttrib::'+srcAttrib)
       
    //     var c = lottie.loadAnimation({
    //             ...options,[srcAttrib]: srcParsed
                
    //     });
    //     console.log('c::',c)
    // }

    testCheck(){
        console.log('lottie::',lottie)
        var container = this.template.querySelector('.animation');
        var options = {
            container: container,
            loop: true,
            autoplay: true,
            renderer: this.renderer,
            rendererSettings: {
                preserveAspectRatio: this.preserveAspectRatio,
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src = 'https://assets2.lottiefiles.com/packages/lf20_t4m6huub.json'
        var srcParsed = parseSrc(src);
        var srcAttrib = typeof srcParsed === "string" ? "path" : "animationData";
        lottie.loadAnimation({
                ...options,[srcAttrib]: srcParsed
        });

        var container1 = this.template.querySelector('.ani');
        var options1 = {
            container: container1,
            loop: true,
            autoplay: true,
            renderer: this.renderer,
            rendererSettings: {
                preserveAspectRatio: this.preserveAspectRatio,
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src1 = 'https://assets1.lottiefiles.com/datafiles/HN7OcWNnoqje6iXIiZdWzKxvLIbfeCGTmvXmEm1h/data.json'
        var srcParsed1 = parseSrc(src1);
        var srcAttrib1 = typeof srcParsed1 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
                ...options1,[srcAttrib1]: srcParsed1
        });

        var container3 = this.template.querySelector('.profile');
        var options3 = {
            container: container3,
            loop: true,
            autoplay: true,
            renderer: this.renderer,
            rendererSettings: {
                preserveAspectRatio: this.preserveAspectRatio,
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src3 = 'https://assets9.lottiefiles.com/packages/lf20_ibrxdnnn.json'
        var srcParsed3 = parseSrc(src3);
        var srcAttrib3 = typeof srcParsed3 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
                ...options3,[srcAttrib3]: srcParsed3
        });

        var container5 = this.template.querySelector('.check');
        var options5 = {
            container: container5,
            loop: true,
            autoplay: true,
            renderer: this.renderer,
            rendererSettings: {
                preserveAspectRatio: this.preserveAspectRatio,
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src5 = 'https://assets4.lottiefiles.com/packages/lf20_s1nooojy.json'
        var srcParsed5 = parseSrc(src5);
        var srcAttrib5 = typeof srcParsed5 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
                ...options5,[srcAttrib5]: srcParsed5
        });

         var container5 = this.template.querySelector('.book');
        var options5 = {
            container: container5,
            loop: true,
            autoplay: true,
            renderer: this.renderer,
            rendererSettings: {
                preserveAspectRatio: this.preserveAspectRatio,
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src5 = 'https://assets4.lottiefiles.com/packages/lf20_2jbzmbru.json'
        var srcParsed5 = parseSrc(src5);
        var srcAttrib5 = typeof srcParsed5 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
                ...options5,[srcAttrib5]: srcParsed5
        });

         var container6 = this.template.querySelector('.red');
        var options6 = {
            container: container6,
            loop: true,
            autoplay: true,
            renderer: this.renderer,
            rendererSettings: {
                preserveAspectRatio: this.preserveAspectRatio,
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src6 = 'https://assets6.lottiefiles.com/temp/lf20_bo1y1b.json'
        var srcParsed6 = parseSrc(src6);
        var srcAttrib6 = typeof srcParsed6 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
                ...options6,[srcAttrib6]: srcParsed6
        });

         var container8 = this.template.querySelector('.c');
        var options8 = {
            container: container8,
            loop: true,
            autoplay: true,
            renderer: this.renderer,
            rendererSettings: {
                preserveAspectRatio: this.preserveAspectRatio,
                clearCanvas: false,
                progressiveLoad: true,
                hideOnTransparent: true,
            },
        };
        var src8 = 'https://assets4.lottiefiles.com/packages/lf20_wqepljpj.json'
        var srcParsed8 = parseSrc(src8);
        var srcAttrib8 = typeof srcParsed8 === "string" ? "path" : "animationData";
        lottie.loadAnimation({
                ...options8,[srcAttrib8]: srcParsed8
        });
    }
}