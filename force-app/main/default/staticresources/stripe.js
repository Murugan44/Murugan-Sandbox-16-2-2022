! function(e) {
    function t(t) {
        for (var n, a, o = t[0], i = t[1], c = 0, u = []; c < o.length; c++) a = o[c], Object.prototype.hasOwnProperty.call(r, a) && r[a] && u.push(r[a][0]), r[a] = 0;
        for (n in i) Object.prototype.hasOwnProperty.call(i, n) && (e[n] = i[n]);
        for (s && s(t); u.length;) u.shift()()
    }
    var n = {},
        r = {
            6: 0
        };

    function a(t) {
        if (n[t]) return n[t].exports;
        var r = n[t] = {
            i: t,
            l: !1,
            exports: {}
        };
        return e[t].call(r.exports, r, r.exports, a), r.l = !0, r.exports
    }
    a.e = function(e) {
        var t = [],
            n = r[e];
        if (0 !== n)
            if (n) t.push(n[2]);
            else {
                var o = new Promise((function(t, a) {
                    n = r[e] = [t, a]
                }));
                t.push(n[2] = o);
                var i, c = document.createElement("script");
                c.charset = "utf-8", c.timeout = 120, a.nc && c.setAttribute("nonce", a.nc), c.src = function(e) {
                    return a.p + "fingerprinted/js/" + ({
                        1: "elements-affirm-message",
                        2: "elements-affirm-modal",
                        3: "elements-afterpay-clearpay-message",
                        4: "elements-afterpay-clearpay-modal",
                        7: "trusted-types-checker"
                    } [e] || e) + "-" + {
                        1: "16eb786ad909a7a734fa9faf566abced",
                        2: "cde2cefaff706da198025c91c12b3101",
                        3: "2a277c393ec7f13874dc5700ef08e3ac",
                        4: "9cf8c5e597b7bf2a4725c2767b86fcaf",
                        7: "cda1635e27dc416e23614def05f39e01"
                    } [e] + ".js"
                }(e);
                var s = new Error;
                i = function(t) {
                    c.onerror = c.onload = null, clearTimeout(u);
                    var n = r[e];
                    if (0 !== n) {
                        if (n) {
                            var a = t && ("load" === t.type ? "missing" : t.type),
                                o = t && t.target && t.target.src;
                            s.message = "Loading chunk " + e + " failed.\n(" + a + ": " + o + ")", s.name = "ChunkLoadError", s.type = a, s.request = o, n[1](s)
                        }
                        r[e] = void 0
                    }
                };
                var u = setTimeout((function() {
                    i({
                        type: "timeout",
                        target: c
                    })
                }), 12e4);
                c.onerror = c.onload = i, document.head.appendChild(c)
            } return Promise.all(t)
    }, a.m = e, a.c = n, a.d = function(e, t, n) {
        a.o(e, t) || Object.defineProperty(e, t, {
            enumerable: !0,
            get: n
        })
    }, a.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, a.t = function(e, t) {
        if (1 & t && (e = a(e)), 8 & t) return e;
        if (4 & t && "object" == typeof e && e && e.__esModule) return e;
        var n = Object.create(null);
        if (a.r(n), Object.defineProperty(n, "default", {
                enumerable: !0,
                value: e
            }), 2 & t && "string" != typeof e)
            for (var r in e) a.d(n, r, function(t) {
                return e[t]
            }.bind(null, r));
        return n
    }, a.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return a.d(t, "a", t), t
    }, a.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, a.p = "https://js.stripe.com/v3/", a.oe = function(e) {
        throw console.error(e), e
    };
    var o = window.__webpackStripeJSv3Jsonp = window.__webpackStripeJSv3Jsonp || [],
        i = o.push.bind(o);
    o.push = t, o = o.slice();
    for (var c = 0; c < o.length; c++) t(o[c]);
    var s = i;
    a(a.s = 61)
}([function(e, t, n) {
    "use strict";
    n.d(t, "B", (function() {
        return m
    })), n.d(t, "D", (function() {
        return _
    })), n.d(t, "f", (function() {
        return h
    })), n.d(t, "g", (function() {
        return y
    })), n.d(t, "i", (function() {
        return b
    })), n.d(t, "e", (function() {
        return v
    })), n.d(t, "s", (function() {
        return g
    })), n.d(t, "m", (function() {
        return O
    })), n.d(t, "t", (function() {
        return j
    })), n.d(t, "h", (function() {
        return E
    })), n.d(t, "w", (function() {
        return k
    })), n.d(t, "v", (function() {
        return P
    })), n.d(t, "q", (function() {
        return S
    })), n.d(t, "r", (function() {
        return A
    })), n.d(t, "y", (function() {
        return T
    })), n.d(t, "z", (function() {
        return I
    })), n.d(t, "A", (function() {
        return C
    })), n.d(t, "x", (function() {
        return N
    })), n.d(t, "G", (function() {
        return R
    })), n.d(t, "b", (function() {
        return x
    })), n.d(t, "n", (function() {
        return M
    })), n.d(t, "o", (function() {
        return L
    })), n.d(t, "c", (function() {
        return q
    })), n.d(t, "k", (function() {
        return B
    })), n.d(t, "p", (function() {
        return F
    })), n.d(t, "a", (function() {
        return U
    })), n.d(t, "C", (function() {
        return Y
    })), n.d(t, "j", (function() {
        return G
    })), n.d(t, "l", (function() {
        return H
    })), n.d(t, "d", (function() {
        return W
    })), n.d(t, "u", (function() {
        return K
    })), n.d(t, "F", (function() {
        return V
    })), n.d(t, "E", (function() {
        return J
    }));
    var r = n(6),
        a = n(7),
        o = n(1),
        i = n(3),
        c = n(8),
        s = n(17),
        u = ["aed", "afn", "all", "amd", "ang", "aoa", "ars", "aud", "awg", "azn", "bam", "bbd", "bdt", "bgn", "bhd", "bif", "bmd", "bnd", "bob", "brl", "bsd", "btn", "bwp", "byr", "bzd", "cad", "cdf", "chf", "clf", "clp", "cny", "cop", "crc", "cuc", "cup", "cve", "czk", "djf", "dkk", "dop", "dzd", "egp", "ern", "etb", "eur", "fjd", "fkp", "gbp", "gel", "ghs", "gip", "gmd", "gnf", "gtq", "gyd", "hkd", "hnl", "hrk", "htg", "huf", "idr", "ils", "inr", "iqd", "irr", "isk", "jmd", "jod", "jpy", "kes", "kgs", "khr", "kmf", "kpw", "krw", "kwd", "kyd", "kzt", "lak", "lbp", "lkr", "lrd", "lsl", "ltl", "lvl", "lyd", "mad", "mdl", "mga", "mkd", "mmk", "mnt", "mop", "mro", "mur", "mvr", "mwk", "mxn", "myr", "mzn", "nad", "ngn", "nio", "nok", "npr", "nzd", "omr", "pab", "pen", "pgk", "php", "pkr", "pln", "pyg", "qar", "ron", "rsd", "rub", "rwf", "sar", "sbd", "scr", "sdg", "sek", "sgd", "shp", "skk", "sll", "sos", "srd", "ssp", "std", "svc", "syp", "szl", "thb", "tjs", "tmt", "tnd", "top", "try", "ttd", "twd", "tzs", "uah", "ugx", "usd", "uyu", "uzs", "vef", "vnd", "vuv", "wst", "xaf", "xag", "xau", "xcd", "xdr", "xof", "xpf", "yer", "zar", "zmk", "zmw", "btc", "jep", "eek", "ghc", "mtl", "tmm", "yen", "zwd", "zwl", "zwn", "zwr"],
        l = {
            AE: "AE",
            AT: "AT",
            AU: "AU",
            BE: "BE",
            BG: "BG",
            BR: "BR",
            CA: "CA",
            CH: "CH",
            CI: "CI",
            CR: "CR",
            CY: "CY",
            CZ: "CZ",
            DE: "DE",
            DK: "DK",
            DO: "DO",
            EE: "EE",
            ES: "ES",
            FI: "FI",
            FR: "FR",
            GB: "GB",
            GI: "GI",
            GR: "GR",
            GT: "GT",
            HK: "HK",
            HU: "HU",
            ID: "ID",
            IE: "IE",
            IN: "IN",
            IT: "IT",
            JP: "JP",
            LI: "LI",
            LT: "LT",
            LU: "LU",
            LV: "LV",
            MT: "MT",
            MX: "MX",
            MY: "MY",
            NL: "NL",
            NO: "NO",
            NZ: "NZ",
            PE: "PE",
            PH: "PH",
            PL: "PL",
            PT: "PT",
            RO: "RO",
            SE: "SE",
            SG: "SG",
            SI: "SI",
            SK: "SK",
            SN: "SN",
            TH: "TH",
            TT: "TT",
            US: "US",
            UY: "UY"
        },
        p = Object.keys(l),
        d = n(30),
        f = n(22),
        m = (n(24), function(e, t, n) {
            var r = n.path.reduce((function(e, t, n) {
                return 0 === n ? t : 0 === t.indexOf(".") ? "".concat(e, '["').concat(t, '"]') : "".concat(e, ".").concat(t)
            }), "");
            return "undefined" === t ? "Missing value for ".concat(n.label, ": ").concat(r || "value", " should be ").concat(e, ".") : "Invalid value for ".concat(n.label, ": ").concat(r || "value", " should be ").concat(e, ". You specified: ").concat(t, ".")
        }),
        _ = function(e) {
            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
            return {
                type: "valid",
                value: e,
                warnings: t
            }
        },
        h = function(e) {
            return {
                error: e,
                errorType: "full",
                type: "error"
            }
        },
        y = function(e, t, n) {
            var r = new i.a(m(e, t, n));
            return h(r)
        },
        b = function(e, t, n) {
            return {
                expected: e,
                actual: String(t),
                options: n,
                errorType: "mismatch",
                type: "error"
            }
        },
        v = function(e, t) {
            return Object(o.a)(Object(o.a)({}, e), {}, {
                path: [].concat(Object(a.a)(e.path), [t])
            })
        },
        g = function(e) {
            return function(t, n) {
                return void 0 === t ? _(t) : e(t, n)
            }
        },
        O = function(e) {
            return function(t, n) {
                return null === t ? _(t) : e(t, n)
            }
        },
        j = function(e, t) {
            return function(n, r) {
                var a = function(e) {
                        var t = e.options.path.join(".") || "value";
                        return {
                            error: "".concat(t, " should be ").concat(e.expected),
                            actual: "".concat(t, " as ").concat(e.actual)
                        }
                    },
                    o = function(e, t, n) {
                        return h(new i.a("Invalid value for ".concat(e, ": ").concat(t, ". You specified ").concat(n, ".")))
                    },
                    c = e(n, r),
                    s = t(n, r);
                if ("error" === c.type && "error" === s.type) {
                    if ("mismatch" === c.errorType && "mismatch" === s.errorType) {
                        var u = a(c),
                            l = u.error,
                            p = u.actual,
                            d = a(s),
                            f = d.error,
                            m = d.actual;
                        return o(r.label, l === f ? l : "".concat(l, " or ").concat(f), p === m ? p : "".concat(p, " and ").concat(m))
                    }
                    if ("mismatch" === c.errorType) {
                        var _ = a(c),
                            y = _.error,
                            b = _.actual;
                        return o(r.label, y, b)
                    }
                    if ("mismatch" === s.errorType) {
                        var v = a(s),
                            g = v.error,
                            O = v.actual;
                        return o(r.label, g, O)
                    }
                    return h(c.error)
                }
                return "valid" === c.type ? c : s
            }
        },
        E = function(e, t) {
            return function(n, r) {
                return n instanceof e ? _(n) : b("a ".concat(t, " instance"), n, r)
            }
        },
        w = function(e, t) {
            return function(n, r) {
                var a = Object(s.a)(e, (function(e) {
                    return e === n
                }));
                if (void 0 === a) {
                    var o = t ? "a recognized string." : "one of the following strings: ".concat(e.join(", "));
                    return b(o, n, r)
                }
                return _(a)
            }
        },
        k = function(e) {
            return function(t, n) {
                return "string" == typeof t && 0 === t.indexOf(e) ? _(t) : b("a string starting with ".concat(e), t, n)
            }
        },
        P = function(e, t) {
            return function(n, r) {
                return "string" == typeof n && n.length >= e && n.length <= t ? _(n) : b(e === t ? "a string of ".concat(e, " characters") : "a string with ".concat(e, " to ").concat(t, " characters"), n, r)
            }
        },
        S = function() {
            for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            return w(t, !1)
        },
        A = function() {
            for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            return w(t, !0)
        },
        T = S.apply(void 0, Object(a.a)(p)),
        I = S.apply(void 0, Object(a.a)(u)),
        C = S.apply(void 0, Object(a.a)(d.c)),
        N = (S.apply(void 0, Object(a.a)(Object.keys(f.a))), function(e, t) {
            return "string" == typeof e ? _(e) : b("a string", e, t)
        }),
        R = function(e, t) {
            return function(n, r) {
                return void 0 === n ? _(t()) : e(n, r)
            }
        },
        x = function(e, t) {
            return "boolean" == typeof e ? _(e) : b("a boolean", e, t)
        },
        M = function(e, t) {
            return "number" == typeof e ? _(e) : b("a number", e, t)
        },
        L = function(e) {
            return function(t, n) {
                return "number" == typeof t && t > e ? _(t) : b("a number greater than ".concat(e), t, n)
            }
        },
        D = function(e) {
            return function(t, n) {
                return "number" == typeof t && t === parseInt(t, 10) && (!e || t >= 0) ? _(t) : b(e ? "a positive amount in the currency's subunit" : "an amount in the currency's subunit", t, n)
            }
        },
        q = function(e, t) {
            return D(!1)(e, t)
        },
        B = function(e, t) {
            return D(!0)(e, t)
        },
        F = function(e, t) {
            return e && "object" == typeof e ? _(e) : b("an object", e, t)
        },
        U = function(e) {
            return function(t, n) {
                return Array.isArray(t) ? t.map((function(t, r) {
                    return e(t, v(n, String(r)))
                })).reduce((function(e, t) {
                    return "error" === e.type ? e : "error" === t.type ? t : _([].concat(Object(a.a)(e.value), [t.value]), [].concat(Object(a.a)(e.warnings), Object(a.a)(t.warnings)))
                }), _([])) : b("array", t, n)
            }
        },
        Y = function(e) {
            return function(t) {
                return function(n, r) {
                    if (Array.isArray(n)) {
                        var a = t(n, r);
                        if ("valid" === a.type)
                            for (var o = {}, c = 0; c < a.value.length; c += 1) {
                                var s = a.value[c];
                                if ("object" == typeof s && s && "string" == typeof s[e]) {
                                    var u = s[e],
                                        l = "_".concat(u);
                                    if (o[l]) return h(new i.a("Duplicate value for ".concat(e, ": ").concat(u, ". The property '").concat(e, "' of '").concat(r.path.join("."), "' has to be unique.")));
                                    o[l] = !0
                                }
                            }
                        return a
                    }
                    return b("array", n, r)
                }
            }
        },
        G = function(e) {
            return function(t, n) {
                return void 0 === t ? _(void 0) : b("used in ".concat(e, " instead"), t, n)
            }
        },
        H = function(e) {
            return function(t, n) {
                return void 0 === t ? _(void 0) : h(new i.a(e))
            }
        },
        z = function(e) {
            return function(t) {
                return function(n, c) {
                    if (n && "object" == typeof n && !Array.isArray(n)) {
                        var u = n,
                            l = Object(s.a)(Object.keys(u), (function(e) {
                                return !t[e]
                            }));
                        if (l && e) return h(new i.a("Invalid ".concat(c.label, " parameter: ").concat([].concat(Object(a.a)(c.path), [l]).join("."), " is not an accepted parameter.")));
                        var p = Object.keys(u),
                            d = _({});
                        return l && (d = p.reduce((function(e, n) {
                            return t[n] ? e : _(e.value, [].concat(Object(a.a)(e.warnings), ["Unrecognized ".concat(c.label, " parameter: ").concat([].concat(Object(a.a)(c.path), [n]).join("."), " is not a recognized parameter. This may cause issues with your integration in the future.")]))
                        }), d)), Object.keys(t).reduce((function(e, n) {
                            if ("error" === e.type) return e;
                            var i = (0, t[n])(u[n], v(c, n));
                            return "valid" === i.type && void 0 !== i.value ? _(Object(o.a)(Object(o.a)({}, e.value), {}, Object(r.a)({}, n, i.value)), [].concat(Object(a.a)(e.warnings), Object(a.a)(i.warnings))) : "valid" === i.type ? _(e.value, [].concat(Object(a.a)(e.warnings), Object(a.a)(i.warnings))) : i
                        }), d)
                    }
                    return b("an object", n, c)
                }
            }
        },
        W = z(!0),
        K = z(!1),
        V = function(e, t, n, r) {
            var a = r || {},
                o = e(t, {
                    authenticatedOrigin: a.authenticatedOrigin || "",
                    element: a.element || "",
                    label: n,
                    path: a.path || []
                });
            return "valid" === o.type || "full" === o.errorType ? o : {
                type: "error",
                errorType: "full",
                error: new i.a(m(o.expected, o.actual, o.options))
            }
        },
        J = function(e, t, n, r) {
            var a = V(e, t, n, r);
            switch (a.type) {
                case "valid":
                    return {
                        value: a.value, warnings: a.warnings
                    };
                case "error":
                    throw a.error;
                default:
                    return Object(c.a)(a)
            }
        }
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return o
    }));
    var r = n(6);

    function a(e, t) {
        var n = Object.keys(e);
        if (Object.getOwnPropertySymbols) {
            var r = Object.getOwnPropertySymbols(e);
            t && (r = r.filter((function(t) {
                return Object.getOwnPropertyDescriptor(e, t).enumerable
            }))), n.push.apply(n, r)
        }
        return n
    }

    function o(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = null != arguments[t] ? arguments[t] : {};
            t % 2 ? a(Object(n), !0).forEach((function(t) {
                Object(r.a)(e, t, n[t])
            })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : a(Object(n)).forEach((function(t) {
                Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
            }))
        }
        return e
    }
}, function(e, t, n) {
    "use strict";
    var r = n(49),
        a = n.n(r),
        o = (n(64), window.Promise ? Promise : a.a);
    t.a = o
}, function(e, t, n) {
    "use strict";
    var r = n(9),
        a = n(26),
        o = n(20),
        i = n(21),
        c = n(39),
        s = function(e) {
            Object(o.a)(n, e);
            var t = Object(i.a)(n);

            function n(e) {
                var o;
                return Object(r.a)(this, n), o = t.call(this, e), window.__stripeElementsController && window.__stripeElementsController.reportIntegrationError(e), o.name = "IntegrationError", Object.defineProperty(Object(a.a)(o), "message", {
                    value: o.message,
                    enumerable: !0
                }), o
            }
            return n
        }(Object(c.a)(Error));
    t.a = s
}, function(e, t, n) {
    "use strict";
    n.d(t, "n", (function() {
        return d
    })), n.d(t, "k", (function() {
        return m
    })), n.d(t, "i", (function() {
        return _
    })), n.d(t, "j", (function() {
        return h
    })), n.d(t, "f", (function() {
        return y
    })), n.d(t, "c", (function() {
        return a.a
    })), n.d(t, "e", (function() {
        return c
    })), n.d(t, "d", (function() {
        return s
    })), n.d(t, "b", (function() {
        return u.a
    })), n.d(t, "m", (function() {
        return p
    })), n.d(t, "g", (function() {
        return l
    })), n.d(t, "h", (function() {
        return b
    })), n.d(t, "a", (function() {
        return v
    })), n.d(t, "l", (function() {
        return g
    }));
    var r = n(24),
        a = n(19),
        o = n(8),
        i = n(11),
        c = function(e) {
            switch (e) {
                case "ADDRESS_AUTOCOMPLETE":
                    return Object(i.a)("checkout-inner-address-autocomplete-1783a7300ff333bb59f09c4eebf5296e.html");
                case "CARD_ELEMENT":
                    return Object(i.a)("elements-inner-card-93c7d6cff5a6ff1aaffc0f07e72a14bd.html");
                case "CONTROLLER":
                    return Object(i.a)("controller-1b85bcfd732aaac03f48168931ebe5f7.html");
                case "METRICS_CONTROLLER":
                    return Object(i.a)("m-outer-fd3c67f2efa9f22f2ecd16b13f2a7fb3.html");
                case "PAYMENT_REQUEST_ELEMENT":
                    return Object(i.a)("elements-inner-payment-request-3a4a22b11835716d2c0b0b4e3b8b6ffa.html");
                case "PAYMENT_REQUEST_BROWSER":
                    return Object(i.a)("payment-request-inner-browser-3188d881e36b9374e7941614944b81b1.html");
                case "PAYMENT_REQUEST_GOOGLE_PAY":
                    return Object(i.a)("payment-request-inner-google-pay-444fbd8d5c8dbcaeae14a34b11b22c44.html");
                case "IBAN_ELEMENT":
                    return Object(i.a)("elements-inner-iban-2d46890333ff88e36bb7d3dcf1afc697.html");
                case "IDEAL_BANK_ELEMENT":
                    return Object(i.a)("elements-inner-ideal-bank-054f9a4cc6c9170e2a7f8816a0adb623.html");
                case "P24_BANK_ELEMENT":
                    return Object(i.a)("elements-inner-p24-bank-9a2a98f645fcb28e517958ad2070413d.html");
                case "AUTHORIZE_WITH_URL":
                    return Object(i.a)("authorize-with-url-inner-9d1ccbec9eea80a18d8cfdf2ec18362f.html");
                case "STRIPE_3DS2_CHALLENGE":
                    return Object(i.a)("three-ds-2-challenge-06c659a79fe290e4564d4a7e2190bb56.html");
                case "STRIPE_3DS2_FINGERPRINT":
                    return Object(i.a)("three-ds-2-fingerprint-48a798b2ae6621c853967387ffe1e92a.html");
                case "AU_BANK_ACCOUNT_ELEMENT":
                    return Object(i.a)("elements-inner-au-bank-account-12d2d6594f0aeea601af13e366d3ddeb.html");
                case "FPX_BANK_ELEMENT":
                    return Object(i.a)("elements-inner-fpx-bank-58b6607d306ada50a18c67cc63b5896d.html");
                case "LIGHTBOX_APP":
                    return Object(i.a)("lightbox-inner-b2e3d0ba58cede776cffd0f2a6940540.html");
                case "ISSUING_CARD_NUMBER_DISPLAY_ELEMENT":
                    return Object(i.a)("elements-inner-issuing-card-number-display-809ca01560ca2a35e6da2330ab71d9f3.html");
                case "ISSUING_CARD_COPY_BUTTON_ELEMENT":
                    return Object(i.a)("elements-inner-issuing-card-copy-button-6151f6ff24e1b93e077e79c224963410.html");
                case "ISSUING_CARD_CVC_DISPLAY_ELEMENT":
                    return Object(i.a)("elements-inner-issuing-card-cvc-display-7ee2f5a63ea2f49183c237f1a3095ae4.html");
                case "ISSUING_CARD_EXPIRY_DISPLAY_ELEMENT":
                    return Object(i.a)("elements-inner-issuing-card-expiry-display-b9b27784aded93ac66eb9ba2ecfa4ffd.html");
                case "EPS_BANK_ELEMENT":
                    return Object(i.a)("elements-inner-eps-bank-145909c32f9495ce9fa6c619051b6b20.html");
                case "HCAPTCHA_APP":
                    return Object(i.a)("hcaptcha-inner-b7f129a717827121f8b32bf8eaf4b9c4.html");
                case "NETBANKING_BANK_ELEMENT":
                    return Object(i.a)("elements-inner-netbanking-bank-9c33db31d4af90502b0bd3ecbdcc7411.html");
                case "AFFIRM_MESSAGE_ELEMENT":
                    return Object(i.a)("elements-inner-affirm-message-0c5253d438b5e07e84641ac0b7915a09.html");
                case "AFFIRM_MESSAGE_MODAL_ELEMENT":
                    return Object(i.a)("elements-inner-affirm-message-modal-d4b6fd75124c36b614771658aa688953.html");
                case "AFTERPAY_MESSAGE_MODAL_ELEMENT":
                    return Object(i.a)("elements-inner-afterpay-message-modal-04f7bb98c8b9c4477ce9c4a5ff9986d0.html");
                case "INSTANT_DEBITS_APP":
                    return Object(i.a)("instant-debits-app-035dbfcc01adbdd5ac1f7199f3a84a3b.html");
                case "LINK_AUTHENTICATION_ELEMENT":
                    return Object(i.a)("elements-inner-authentication-9ffcf4b6a2645ebece45d9098437ec2c.html");
                case "PAYMENT_ELEMENT":
                    return Object(i.a)("elements-inner-payment-031295d946744703d5fc13f14631dd1a.html");
                case "LINKED_ACCOUNTS_INNER":
                    return Object(i.a)("linked-accounts-inner-29dddd8cf5a8bed469cda9e3c5957e4d.html");
                case "WECHAT_PAY_INNER":
                    return Object(i.a)("wechat-pay-inner-69eba77acf1538628d62ba55e5bac74a.html");
                case "PAYNOW_INNER":
                    return Object(i.a)("paynow-inner-b0eacfd128acf58f8e9c70bdca62e9d2.html");
                case "PROMPTPAY_INNER":
                    return Object(i.a)("promptpay-inner-3be9568ed1abde8d56856db1bb116380.html");
                case "SHIPPING_ADDRESS_ELEMENT":
                    return Object(i.a)("elements-inner-shipping-address-86db4e123bf2dfa713e9974ab4040b13.html");
                case "LINK_AUTOFILL_MODAL":
                    return Object(i.a)("link-autofill-modal-inner-3c07fc2a5e3f2ff24149c02c95ae71a7.html");
                case "GOOGLE_MAPS_APP":
                    return Object(i.a)("google-maps-inner-9e7e5a463800e3a372e0a22465ec6929.html");
                default:
                    return Object(o.a)(e)
            }
        },
        s = function(e) {
            var t = {
                frameborder: "0",
                allowTransparency: "true",
                scrolling: "no",
                allow: "payment *"
            };
            if ("STRIPE_3DS2_CHALLENGE" === e && (t.allow = "payment *; publickey-credentials-get ".concat(Object(i.a)())), "PAYMENT_REQUEST_GOOGLE_PAY" === e) {
                t.sandbox = ["allow-scripts", "allow-forms", "allow-popups", "allow-popups-to-escape-sandbox", "allow-same-origin"].join(" "), t.referrerpolicy = "origin"
            }
            return t
        },
        u = n(12),
        l = {
            PAYMENT_INTENT: "PAYMENT_INTENT",
            SETUP_INTENT: "SETUP_INTENT"
        },
        p = [u.a.card, u.a.cardNumber, u.a.cardExpiry, u.a.cardCvc, u.a.postalCode],
        d = "https://js.stripe.com/v3/",
        f = Object(r.d)(d),
        m = f ? f.origin : "",
        _ = 5,
        h = ["stripe_3ds2_challenge", "stripe_3ds2_fingerprint", "three_d_secure_redirect"],
        y = "https://verify.stripe.com/",
        b = {
            family: "font-family",
            src: "src",
            unicodeRange: "unicode-range",
            style: "font-style",
            variant: "font-variant",
            stretch: "font-stretch",
            weight: "font-weight",
            display: "font-display"
        },
        v = Object.keys(b).reduce((function(e, t) {
            return e[b[t]] = t, e
        }), {}),
        g = [u.a.issuingCardCopyButton, u.a.idealBank, u.a.p24Bank, u.a.netbankingBank, u.a.idealBankSecondary, u.a.p24BankSecondary, u.a.netbankingBankSecondary, u.a.fpxBank, u.a.fpxBankSecondary, u.a.epsBank, u.a.epsBankSecondary];
    Object.keys({
        visa: "visa",
        amex: "amex",
        discover: "discover",
        mastercard: "mastercard",
        jcb: "jcb",
        diners: "diners",
        unionpay: "unionpay",
        elo: "elo",
        unknown: "unknown"
    })
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return r
    })), n.d(t, "b", (function() {
        return a
    })), n.d(t, "c", (function() {
        return o
    })), n.d(t, "d", (function() {
        return i
    }));
    var r = {
            checkout_beta_2: "checkout_beta_2",
            checkout_beta_3: "checkout_beta_3",
            checkout_beta_4: "checkout_beta_4",
            checkout_beta_testcards: "checkout_beta_testcards",
            payment_intent_beta_1: "payment_intent_beta_1",
            payment_intent_beta_2: "payment_intent_beta_2",
            payment_intent_beta_3: "payment_intent_beta_3",
            google_pay_beta_1: "google_pay_beta_1",
            acss_debit_beta_1: "acss_debit_beta_1",
            acss_debit_beta_2: "acss_debit_beta_2",
            affirm_pilot_beta_1: "affirm_pilot_beta_1",
            afterpay_clearpay_setup_intents_beta: "afterpay_clearpay_setup_intents_beta",
            bacs_debit_beta: "bacs_debit_beta",
            fpx_bank_beta_1: "fpx_bank_beta_1",
            ideal_pm_beta_1: "ideal_pm_beta_1",
            konbini_pm_beta_1: "konbini_pm_beta_1",
            line_items_beta_1: "line_items_beta_1",
            oxxo_pm_beta_1: "oxxo_pm_beta_1",
            paypal_pm_beta_1: "paypal_pm_beta_1",
            sepa_pm_beta_1: "sepa_pm_beta_1",
            sofort_pm_beta_1: "sofort_pm_beta_1",
            tax_product_beta_1: "tax_product_beta_1",
            wechat_pay_pm_beta_1: "wechat_pay_pm_beta_1",
            wechat_pay_pm_beta_2: "wechat_pay_pm_beta_2",
            checkout_beta_locales: "checkout_beta_locales",
            stripe_js_beta_locales: "stripe_js_beta_locales",
            upi_beta_1: "upi_beta_1",
            blik_beta_1: "blik_beta_1",
            issuing_elements_1: "issuing_elements_1",
            issuing_elements_2: "issuing_elements_2",
            return_intents_beta_1: "return_intents_beta_1",
            netbanking_beta_1: "netbanking_beta_1",
            netbanking_bank_beta_1: "netbanking_bank_beta_1",
            instant_debits_beta_1: "instant_debits_beta_1",
            link_beta_1: "link_beta_1",
            payment_element_beta_1: "payment_element_beta_1",
            elements_customers_beta_1: "elements_customers_beta_1",
            card_country_event_beta_1: "card_country_event_beta_1",
            id_bank_transfer_beta_1: "id_bank_transfer_beta_1",
            linked_accounts_beta_1: "linked_accounts_beta_1",
            us_bank_account_beta_1: "us_bank_account_beta_1",
            us_bank_account_beta_2: "us_bank_account_beta_2",
            cup_apple_pay_beta_1: "cup_apple_pay_beta_1",
            nz_bank_account_beta_1: "nz_bank_account_beta_1",
            paynow_beta_1: "paynow_beta_1",
            customer_balance_beta_1: "customer_balance_beta_1",
            promptpay_beta_1: "promptpay_beta_1",
            payment_element_apple_pay_beta_1: "payment_element_apple_pay_beta_1",
            link_autofill_modal_beta_1: "link_autofill_modal_beta_1",
            pix_beta_1: "pix_beta_1",
            shipping_address_element_beta_1: "shipping_address_element_beta_1"
        },
        a = Object.freeze({
            affirmMessage: "affirm_pilot_beta_1",
            netbankingBank: "netbanking_bank_beta_1",
            linkAuthentication: "link_beta_1",
            shippingAddress: ["link_beta_1", "shipping_address_element_beta_1"]
        }),
        o = Object.keys(r),
        i = function(e, t) {
            return Array.isArray(t) ? t.some((function(t) {
                return e.indexOf(t) > -1
            })) : e.indexOf(t) > -1
        }
}, function(e, t, n) {
    "use strict";

    function r(e, t, n) {
        return t in e ? Object.defineProperty(e, t, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = n, e
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return i
    }));
    var r = n(41);
    var a = n(42),
        o = n(36);

    function i(e) {
        return function(e) {
            if (Array.isArray(e)) return Object(r.a)(e)
        }(e) || Object(a.a)(e) || Object(o.a)(e) || function() {
            throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return r
    }));
    var r = function(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "absurd";
        throw new Error(t)
    }
}, function(e, t, n) {
    "use strict";

    function r(e, t) {
        if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";

    function r(e, t) {
        if (null == e) return {};
        var n, r, a = function(e, t) {
            if (null == e) return {};
            var n, r, a = {},
                o = Object.keys(e);
            for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
            return a
        }(e, t);
        if (Object.getOwnPropertySymbols) {
            var o = Object.getOwnPropertySymbols(e);
            for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
        }
        return a
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";
    t.a = function(e) {
        return "".concat("https://js.stripe.com/v3/").concat(e || "")
    }
}, function(e, t, n) {
    "use strict";
    var r = {
        card: "card",
        cardNumber: "cardNumber",
        cardExpiry: "cardExpiry",
        cardCvc: "cardCvc",
        postalCode: "postalCode",
        iban: "iban",
        idealBank: "idealBank",
        p24Bank: "p24Bank",
        paymentRequestButton: "paymentRequestButton",
        auBankAccount: "auBankAccount",
        fpxBank: "fpxBank",
        netbankingBank: "netbankingBank",
        epsBank: "epsBank",
        affirmMessage: "affirmMessage",
        afterpayClearpayMessage: "afterpayClearpayMessage",
        linkAuthentication: "linkAuthentication",
        payment: "payment",
        shippingAddress: "shippingAddress",
        idealBankSecondary: "idealBankSecondary",
        p24BankSecondary: "p24BankSecondary",
        auBankAccountNumber: "auBankAccountNumber",
        auBsb: "auBsb",
        fpxBankSecondary: "fpxBankSecondary",
        netbankingBankSecondary: "netbankingBankSecondary",
        issuingCardNumberDisplay: "issuingCardNumberDisplay",
        issuingCardCopyButton: "issuingCardCopyButton",
        issuingCardCvcDisplay: "issuingCardCvcDisplay",
        issuingCardExpiryDisplay: "issuingCardExpiryDisplay",
        epsBankSecondary: "epsBankSecondary",
        affirmMessageModal: "affirmMessageModal",
        afterpayClearpayMessageModal: "afterpayClearpayMessageModal"
    };
    t.a = r
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return s
    }));
    var r = n(9),
        a = n(16),
        o = Date.now ? function() {
            return Date.now()
        } : function() {
            return (new Date).getTime()
        },
        i = o(),
        c = window.performance && window.performance.now ? function() {
            return window.performance.now()
        } : function() {
            return o() - i
        },
        s = function() {
            function e(t) {
                Object(r.a)(this, e), this.timestampValue = null != t ? t : c()
            }
            return Object(a.a)(e, [{
                key: "getAsPosixTime",
                value: function() {
                    return o() - this.getElapsedTime()
                }
            }, {
                key: "getElapsedTime",
                value: function(e) {
                    return Math.round((e ? e.timestampValue : c()) - this.timestampValue)
                }
            }, {
                key: "valueOf",
                value: function() {
                    return Math.round(this.timestampValue)
                }
            }], [{
                key: "fromPosixTime",
                value: function(t) {
                    return new e(t - o() + c())
                }
            }]), e
        }()
}, function(e, t, n) {
    "use strict";
    n.d(t, "f", (function() {
        return c
    })), n.d(t, "d", (function() {
        return s
    })), n.d(t, "c", (function() {
        return l
    })), n.d(t, "e", (function() {
        return p
    })), n.d(t, "a", (function() {
        return d
    })), n.d(t, "g", (function() {
        return f
    })), n.d(t, "b", (function() {
        return h
    }));
    var r = n(18),
        a = n(50),
        o = n.n(a),
        i = n(3),
        c = function(e, t) {
            var n = {};
            t.forEach((function(e) {
                var t = Object(r.a)(e, 2),
                    a = t[0],
                    o = t[1];
                a.split(/\s+/).forEach((function(e) {
                    e && (n[e] = n[e] || o)
                }))
            })), e.className = o()(e.className, n)
        },
        s = function(e, t) {
            e.style.cssText = Object.keys(t).map((function(e) {
                return "".concat(e, ": ").concat(t[e], " !important;")
            })).join(" ")
        },
        u = {
            border: "none",
            margin: "0",
            padding: "0",
            width: "1px",
            "min-width": "100%",
            overflow: "hidden",
            display: "block",
            visibility: "hidden",
            position: "fixed",
            height: "1px",
            "pointer-events": "none",
            "user-select": "none"
        },
        l = function(e) {
            s(e, u)
        },
        p = function(e) {
            try {
                return window.parent.frames[e]
            } catch (e) {
                return null
            }
        },
        d = function() {
            if (!document.body) throw new i.a("Stripe.js requires that your page has a <body> element.");
            return document.body
        },
        f = function(e) {
            return requestAnimationFrame((function() {
                requestAnimationFrame(e)
            }))
        },
        m = function(e, t) {
            return !!e.documentElement && e.documentElement.contains(t)
        },
        _ = "isConnected" in window.Node.prototype ? function(e, t) {
            return t.isConnected && t.ownerDocument === e
        } : m,
        h = function(e, t) {
            return !m(e, t) && _(e, t)
        }
}, function(e, t, n) {
    "use strict";

    function r() {
        return (r = Object.assign || function(e) {
            for (var t = 1; t < arguments.length; t++) {
                var n = arguments[t];
                for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
            }
            return e
        }).apply(this, arguments)
    }
    n.d(t, "a", (function() {
        return a.a
    })), n.d(t, "b", (function() {
        return a.c
    })), n.d(t, "g", (function() {
        return a.g
    })), n.d(t, "f", (function() {
        return a.e
    })), n.d(t, "e", (function() {
        return o
    })), n.d(t, "c", (function() {
        return u
    })), n.d(t, "d", (function() {
        return l
    }));
    n(44), n(42), n(36), n(45);
    n(18);
    var a = n(17),
        o = function(e, t) {
            for (var n = {}, r = 0; r < t.length; r++) void 0 !== e[t[r]] && (n[t[r]] = e[t[r]]);
            return n
        },
        i = function(e) {
            return e && "object" == typeof e && (e.constructor === Array || e.constructor === Object)
        },
        c = function(e) {
            return i(e) ? Array.isArray(e) ? e.slice(0, e.length) : r({}, e) : e
        },
        s = function e(t) {
            return function() {
                for (var n = arguments.length, r = new Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                if (Array.isArray(r[0]) && t) return c(r[0]);
                var o = Array.isArray(r[0]) ? [] : {};
                return r.forEach((function(n) {
                    n && Object.keys(n).forEach((function(r) {
                        var a = o[r],
                            s = n[r],
                            u = i(a) && !(t && Array.isArray(a));
                        "object" == typeof s && u ? o[r] = e(t)(a, c(s)) : void 0 !== s ? o[r] = i(s) ? e(t)(s) : c(s) : void 0 !== a && (o[r] = a)
                    }))
                })), o
            }
        },
        u = s(!1),
        l = s(!0)
}, function(e, t, n) {
    "use strict";

    function r(e, t) {
        for (var n = 0; n < t.length; n++) {
            var r = t[n];
            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
        }
    }

    function a(e, t, n) {
        return t && r(e.prototype, t), n && r(e, n), e
    }
    n.d(t, "a", (function() {
        return a
    }))
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return o
    })), n.d(t, "b", (function() {
        return i
    })), n.d(t, "c", (function() {
        return s
    })), n.d(t, "g", (function() {
        return u
    })), n.d(t, "e", (function() {
        return l
    })), n.d(t, "f", (function() {
        return p
    })), n.d(t, "d", (function() {
        return d
    }));
    var r = n(2),
        a = n(13),
        o = function(e, t) {
            for (var n = 0; n < e.length; n++)
                if (t(e[n])) return e[n]
        },
        i = function(e, t) {
            for (var n = 0; n < e.length; n++)
                if (t(e[n])) return n;
            return -1
        },
        c = "[object Object]",
        s = function e(t, n) {
            if ("object" != typeof t || "object" != typeof n) return t === n;
            if (null === t || null === n) return t === n;
            var r = Array.isArray(t);
            if (r !== Array.isArray(n)) return !1;
            var a = Object.prototype.toString.call(t) === c;
            if (a !== (Object.prototype.toString.call(n) === c)) return !1;
            if (!a && !r) return !1;
            var o = Object.keys(t),
                i = Object.keys(n);
            if (o.length !== i.length) return !1;
            for (var s = {}, u = 0; u < o.length; u++) s[o[u]] = !0;
            for (var l = 0; l < i.length; l++) s[i[l]] = !0;
            var p = Object.keys(s);
            if (p.length !== o.length) return !1;
            var d = t,
                f = n;
            return p.every((function(t) {
                return e(d[t], f[t])
            }))
        },
        u = function(e) {
            return Object.keys(e).map((function(t) {
                return e[t]
            }))
        },
        l = function(e, t) {
            for (var n = {}, r = 0; r < t.length; r++) n[t[r]] = !0;
            for (var a = [], o = 0; o < e.length; o++) n[e[o]] && a.push(e[o]);
            return a
        },
        p = function(e) {
            for (var t = 0, n = 0; n < e.length; n++) t += e[n];
            return t
        },
        d = function(e, t) {
            var n = 0,
                o = function r(o) {
                    for (var i = new a.a; n < e.length && i.getElapsedTime() < 50;) t(e[n]), n++;
                    n === e.length ? o() : setTimeout((function() {
                        return r(o)
                    }))
                };
            return new r.a((function(e) {
                return o(e)
            }))
        }
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return i
    }));
    var r = n(44);
    var a = n(36),
        o = n(45);

    function i(e, t) {
        return Object(r.a)(e) || function(e, t) {
            if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) {
                var n = [],
                    r = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var i, c = e[Symbol.iterator](); !(r = (i = c.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                } catch (e) {
                    a = !0, o = e
                } finally {
                    try {
                        r || null == c.return || c.return()
                    } finally {
                        if (a) throw o
                    }
                }
                return n
            }
        }(e, t) || Object(a.a)(e, t) || Object(o.a)()
    }
}, function(e, t, n) {
    "use strict";
    var r = {
        ADDRESS_AUTOCOMPLETE: "ADDRESS_AUTOCOMPLETE",
        CARD_ELEMENT: "CARD_ELEMENT",
        CONTROLLER: "CONTROLLER",
        METRICS_CONTROLLER: "METRICS_CONTROLLER",
        PAYMENT_REQUEST_ELEMENT: "PAYMENT_REQUEST_ELEMENT",
        PAYMENT_REQUEST_BROWSER: "PAYMENT_REQUEST_BROWSER",
        PAYMENT_REQUEST_GOOGLE_PAY: "PAYMENT_REQUEST_GOOGLE_PAY",
        IBAN_ELEMENT: "IBAN_ELEMENT",
        IDEAL_BANK_ELEMENT: "IDEAL_BANK_ELEMENT",
        P24_BANK_ELEMENT: "P24_BANK_ELEMENT",
        AUTHORIZE_WITH_URL: "AUTHORIZE_WITH_URL",
        STRIPE_3DS2_CHALLENGE: "STRIPE_3DS2_CHALLENGE",
        STRIPE_3DS2_FINGERPRINT: "STRIPE_3DS2_FINGERPRINT",
        AU_BANK_ACCOUNT_ELEMENT: "AU_BANK_ACCOUNT_ELEMENT",
        FPX_BANK_ELEMENT: "FPX_BANK_ELEMENT",
        LIGHTBOX_APP: "LIGHTBOX_APP",
        ISSUING_CARD_NUMBER_DISPLAY_ELEMENT: "ISSUING_CARD_NUMBER_DISPLAY_ELEMENT",
        ISSUING_CARD_COPY_BUTTON_ELEMENT: "ISSUING_CARD_COPY_BUTTON_ELEMENT",
        ISSUING_CARD_CVC_DISPLAY_ELEMENT: "ISSUING_CARD_CVC_DISPLAY_ELEMENT",
        ISSUING_CARD_EXPIRY_DISPLAY_ELEMENT: "ISSUING_CARD_EXPIRY_DISPLAY_ELEMENT",
        EPS_BANK_ELEMENT: "EPS_BANK_ELEMENT",
        HCAPTCHA_APP: "HCAPTCHA_APP",
        NETBANKING_BANK_ELEMENT: "NETBANKING_BANK_ELEMENT",
        AFFIRM_MESSAGE_ELEMENT: "AFFIRM_MESSAGE_ELEMENT",
        AFFIRM_MESSAGE_MODAL_ELEMENT: "AFFIRM_MESSAGE_MODAL_ELEMENT",
        AFTERPAY_MESSAGE_MODAL_ELEMENT: "AFTERPAY_MESSAGE_MODAL_ELEMENT",
        INSTANT_DEBITS_APP: "INSTANT_DEBITS_APP",
        LINK_AUTHENTICATION_ELEMENT: "LINK_AUTHENTICATION_ELEMENT",
        PAYMENT_ELEMENT: "PAYMENT_ELEMENT",
        LINKED_ACCOUNTS_INNER: "LINKED_ACCOUNTS_INNER",
        WECHAT_PAY_INNER: "WECHAT_PAY_INNER",
        PAYNOW_INNER: "PAYNOW_INNER",
        PROMPTPAY_INNER: "PROMPTPAY_INNER",
        SHIPPING_ADDRESS_ELEMENT: "SHIPPING_ADDRESS_ELEMENT",
        LINK_AUTOFILL_MODAL: "LINK_AUTOFILL_MODAL",
        GOOGLE_MAPS_APP: "GOOGLE_MAPS_APP"
    };
    t.a = r
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return a
    }));
    var r = n(37);

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function");
        e.prototype = Object.create(t && t.prototype, {
            constructor: {
                value: e,
                writable: !0,
                configurable: !0
            }
        }), t && Object(r.a)(e, t)
    }
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return s
    }));
    var r = n(25),
        a = n(43),
        o = n(33),
        i = n(26);

    function c(e, t) {
        return !t || "object" !== Object(o.a)(t) && "function" != typeof t ? Object(i.a)(e) : t
    }

    function s(e) {
        var t = Object(a.a)();
        return function() {
            var n, a = Object(r.a)(e);
            if (t) {
                var o = Object(r.a)(this).constructor;
                n = Reflect.construct(a, arguments, o)
            } else n = a.apply(this, arguments);
            return c(this, n)
        }
    }
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return a
    })), n.d(t, "c", (function() {
        return o
    })), n.d(t, "b", (function() {
        return i
    }));
    var r = n(3),
        a = {
            live: "live",
            test: "test",
            unknown: "unknown"
        },
        o = function(e) {
            return /^pk_test_/.test(e) ? a.test : /^pk_live_/.test(e) ? a.live : a.unknown
        },
        i = function(e) {
            if (e === a.unknown) throw new r.a("It looks like you're using an older Stripe key. In order to use this API, you'll need to use a modern API key, which is prefixed with 'pk_live_' or 'pk_test_'.\n    You can roll your publishable key here: https://dashboard.stripe.com/account/apikeys")
        }
}, function(e, t, n) {
    "use strict";
    n.d(t, "b", (function() {
        return s
    })), n.d(t, "d", (function() {
        return u
    })), n.d(t, "a", (function() {
        return p
    })), n.d(t, "c", (function() {
        return d
    }));
    var r, a, o, i = n(6),
        c = n(4),
        s = (r = {}, Object(i.a)(r, c.b.card, {
            unique: !0,
            conflict: [c.b.cardNumber, c.b.cardExpiry, c.b.cardCvc, c.b.postalCode],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.cardNumber, {
            unique: !0,
            conflict: [c.b.card],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.cardExpiry, {
            unique: !0,
            conflict: [c.b.card],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.cardCvc, {
            unique: !0,
            conflict: [c.b.card],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.postalCode, {
            unique: !0,
            conflict: [c.b.card],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.paymentRequestButton, {
            unique: !0,
            conflict: [],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.iban, {
            unique: !0,
            conflict: [],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.idealBank, {
            unique: !0,
            conflict: [],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.p24Bank, {
            unique: !0,
            conflict: [],
            beta: !1,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.auBankAccount, {
            unique: !0,
            beta: !1,
            conflict: [],
            implementation: "legacy"
        }), Object(i.a)(r, c.b.fpxBank, {
            unique: !0,
            beta: !1,
            conflict: [],
            implementation: "legacy"
        }), Object(i.a)(r, c.b.netbankingBank, {
            unique: !0,
            beta: !0,
            conflict: [],
            implementation: "legacy"
        }), Object(i.a)(r, c.b.issuingCardCopyButton, {
            unique: !1,
            beta: !0,
            conflict: [],
            implementation: "legacy"
        }), Object(i.a)(r, c.b.issuingCardNumberDisplay, {
            unique: !1,
            beta: !0,
            conflict: [],
            implementation: "legacy"
        }), Object(i.a)(r, c.b.issuingCardCvcDisplay, {
            unique: !1,
            beta: !0,
            conflict: [],
            implementation: "legacy"
        }), Object(i.a)(r, c.b.issuingCardExpiryDisplay, {
            unique: !1,
            beta: !0,
            conflict: [],
            implementation: "legacy"
        }), Object(i.a)(r, c.b.epsBank, {
            unique: !0,
            conflict: [],
            beta: !0,
            implementation: "legacy"
        }), Object(i.a)(r, c.b.affirmMessage, {
            unique: !1,
            conflict: [],
            beta: !0,
            implementation: "affirm_message"
        }), Object(i.a)(r, c.b.afterpayClearpayMessage, {
            unique: !1,
            conflict: [],
            beta: !1,
            implementation: "afterpay_message"
        }), Object(i.a)(r, c.b.linkAuthentication, {
            unique: !0,
            conflict: [],
            beta: !0,
            implementation: "frame"
        }), Object(i.a)(r, c.b.payment, {
            unique: !0,
            conflict: [],
            beta: !0,
            implementation: "frame"
        }), Object(i.a)(r, c.b.shippingAddress, {
            unique: !0,
            conflict: [],
            beta: !0,
            implementation: "frame"
        }), r),
        u = "__PrivateStripeElement",
        l = ["brand"],
        p = (a = {}, Object(i.a)(a, c.b.card, l), Object(i.a)(a, c.b.cardNumber, l), Object(i.a)(a, c.b.iban, ["country", "bankName"]), Object(i.a)(a, c.b.auBankAccount, ["bankName", "branchName"]), a),
        d = (o = {}, Object(i.a)(o, c.b.idealBank, {
            secondary: c.b.idealBankSecondary
        }), Object(i.a)(o, c.b.p24Bank, {
            secondary: c.b.p24BankSecondary
        }), Object(i.a)(o, c.b.fpxBank, {
            secondary: c.b.fpxBankSecondary
        }), Object(i.a)(o, c.b.netbankingBank, {
            secondary: c.b.netbankingBankSecondary
        }), Object(i.a)(o, c.b.epsBank, {
            secondary: c.b.epsBankSecondary
        }), o)
}, function(e, t, n) {
    "use strict";
    n.d(t, "b", (function() {
        return a
    })), n.d(t, "a", (function() {
        return o
    })), n.d(t, "d", (function() {
        return i
    })), n.d(t, "c", (function() {
        return c
    }));
    var r = /^(http(s)?):\/\//,
        a = function(e) {
            return r.test(e)
        },
        o = function(e) {
            var t = e.match(r);
            return t && t.length ? t[1] : null
        },
        i = function(e) {
            if (!a(e)) return null;
            var t = document.createElement("a");
            t.href = e;
            var n = t.protocol,
                r = t.host,
                o = t.pathname,
                i = /:80$/,
                c = /:443$/;
            return "http:" === n && i.test(r) ? r = r.replace(i, "") : "https:" === n && c.test(r) && (r = r.replace(c, "")), {
                host: r,
                protocol: n,
                origin: "".concat(n, "//").concat(r),
                path: o
            }
        },
        c = function(e, t) {
            if ("/" === t[0]) {
                var n = i(e);
                return n ? "".concat(n.origin).concat(t) : t
            }
            var r = e.replace(/\/[^/]*$/, "/");
            return "".concat(r).concat(t)
        }
}, function(e, t, n) {
    "use strict";

    function r(e) {
        return (r = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";

    function r(e) {
        if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
        return e
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return a
    })), n.d(t, "b", (function() {
        return o
    }));
    var r = n(2),
        a = function(e) {
            return new r.a((function(t, n) {
                var r = setTimeout((function() {
                    t({
                        type: "error",
                        error: {
                            code: "redirect_error",
                            message: "Failed to redirect to ".concat(e)
                        },
                        locale: "en"
                    })
                }), 6e4);
                window.addEventListener("pagehide", (function() {
                    clearTimeout(r)
                })), window.top.location.href = e
            }))
        },
        o = function(e, t, n) {
            e.report("redirect_error", {
                initiator: t,
                error: n.error
            })
        }
}, function(e, t, n) {
    "use strict";
    n.d(t, "b", (function() {
        return a
    })), n.d(t, "a", (function() {
        return o
    })), n.d(t, "c", (function() {
        return i
    }));
    var r = n(3),
        a = function(e) {
            var t = {},
                n = {};
            return function(r) {
                var a = "_".concat(r);
                if ("string" == typeof r && void 0 !== t[a]) return t[a];
                if ("number" == typeof r && void 0 !== n[a]) return n[a];
                var o = e(r);
                return "string" == typeof r && (t[a] = o), "number" == typeof r && (n[a] = o), o
            }
        },
        o = function(e, t) {
            var n = !1;
            return function() {
                if (n) throw new r.a(t);
                n = !0;
                try {
                    return e.apply(void 0, arguments).then((function(e) {
                        return n = !1, e
                    }), (function(e) {
                        throw n = !1, e
                    }))
                } catch (e) {
                    throw n = !1, e
                }
            }
        },
        i = function(e) {
            var t = e;
            return function() {
                t && (t.apply(void 0, arguments), t = null)
            }
        }
}, function(e, t, n) {
    "use strict";
    n.d(t, "c", (function() {
        return s
    })), n.d(t, "d", (function() {
        return u
    })), n.d(t, "a", (function() {
        return l
    })), n.d(t, "e", (function() {
        return p
    })), n.d(t, "b", (function() {
        return d
    }));
    var r, a = n(6),
        o = n(23),
        i = n(12),
        c = n(19),
        s = "".concat(o.d, "-input"),
        u = ("".concat(o.d, "-inputAfter"), "".concat(o.d, "-safariInput")),
        l = "StripeElement",
        p = ["ready", "focus", "blur", "escape", "change"],
        d = (r = {}, Object(a.a)(r, i.a.linkAuthentication, c.a.LINK_AUTHENTICATION_ELEMENT), Object(a.a)(r, i.a.payment, c.a.PAYMENT_ELEMENT), Object(a.a)(r, i.a.shippingAddress, c.a.SHIPPING_ADDRESS_ELEMENT), r)
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return r
    })), n.d(t, "b", (function() {
        return a
    })), n.d(t, "c", (function() {
        return o
    }));
    var r = {
            applePay: "applePay",
            googlePay: "googlePay",
            browserCard: "browserCard"
        },
        a = function(e, t) {
            return e.indexOf(t) >= 0
        },
        o = Object.keys(r)
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return a
    })), n.d(t, "b", (function() {
        return o
    })), n.d(t, "c", (function() {
        return i
    }));
    var r = n(24),
        a = function(e, t) {
            var n = Object(r.d)(e),
                a = Object(r.d)(t);
            return !(!n || !a) && n.origin === a.origin
        },
        o = function(e) {
            return a(e, "https://js.stripe.com/v3/")
        },
        i = function(e) {
            return o(e) || function(e) {
                var t = Object(r.d)(e),
                    n = t ? t.host : "";
                return "stripe.com" === n || !!n.match(/\.stripe\.(com|me)$/)
            }(e)
        }
}, function(e, t, n) {
    "use strict";
    var r = n(7);
    t.a = function e(t, n) {
        var a = [];
        return Object.keys(t).forEach((function(o) {
            var i = t[o],
                c = n ? "".concat(n, "[").concat(o, "]") : o;
            if (i && "object" == typeof i) {
                var s = e(i, c);
                "" !== s && (a = [].concat(Object(r.a)(a), [s]))
            } else null != i && (a = [].concat(Object(r.a)(a), ["".concat(c, "=").concat(encodeURIComponent(String(i)))]))
        })), a.join("&").replace(/%20/g, "+")
    }
}, function(e, t, n) {
    "use strict";

    function r(e) {
        return (r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
            return typeof e
        } : function(e) {
            return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
        })(e)
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";
    n.d(t, "b", (function() {
        return c
    })), n.d(t, "c", (function() {
        return s
    })), n.d(t, "a", (function() {
        return u
    }));
    var r = n(28),
        a = n(17),
        o = n(38),
        i = function() {
            return Array.prototype.slice.call(document.querySelectorAll("a[href], area[href], input:not([disabled]),\n  select:not([disabled]), textarea:not([disabled]), button:not([disabled]),\n  object, embed, *[tabindex], *[contenteditable]")).filter((function(e) {
                var t = e.getAttribute("tabindex"),
                    n = !t || parseInt(t, 10) >= 0,
                    r = e.getBoundingClientRect(),
                    a = Object(o.a)(e),
                    i = r.width > 0 && r.height > 0 && a && "hidden" !== a.getPropertyValue("visibility");
                return n && i
            }))
        },
        c = function(e, t) {
            var n = i();
            return n[Object(a.b)(n, (function(t) {
                return t === e || e.contains(t)
            })) + ("previous" === t ? -1 : 1)]
        },
        s = function(e, t) {
            return e.then((function() {
                return Object(a.d)(t, (function(e) {
                    var t = e.element,
                        n = e.tabIndex;
                    "" === n ? t.removeAttribute("tabindex") : t.setAttribute("tabindex", n)
                }))
            }))
        },
        u = function(e) {
            var t = [],
                n = Object(a.d)(document.querySelectorAll("*"), (function(n) {
                    var r = n.getAttribute("tabindex") || "";
                    e !== n && (n.tabIndex = -1), t.push({
                        element: n,
                        tabIndex: r
                    })
                })),
                o = Object(r.c)((function() {
                    s(n, t)
                }));
            return {
                lockedPromise: n,
                lockedElements: t,
                restoreFocus: o
            }
        }
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return r
    })), n.d(t, "b", (function() {
        return a
    }));
    var r = {
            margin: "0",
            padding: "0",
            border: "none",
            display: "block",
            background: "transparent",
            position: "relative",
            opacity: "1"
        },
        a = {
            border: "none",
            display: "block",
            position: "absolute",
            height: "1px",
            top: "-1px",
            left: "0",
            padding: "0",
            margin: "0",
            width: "100%",
            opacity: "0",
            background: "transparent",
            "pointer-events": "none",
            "font-size": "16px"
        }
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return a
    }));
    var r = n(41);

    function a(e, t) {
        if (e) {
            if ("string" == typeof e) return Object(r.a)(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? Object(r.a)(e, t) : void 0
        }
    }
}, function(e, t, n) {
    "use strict";

    function r(e, t) {
        return (r = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";
    t.a = function(e, t) {
        return e ? window.getComputedStyle(e, t) : null
    }
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return c
    }));
    var r = n(25),
        a = n(37);
    var o = n(43);

    function i(e, t, n) {
        return (i = Object(o.a)() ? Reflect.construct : function(e, t, n) {
            var r = [null];
            r.push.apply(r, t);
            var o = new(Function.bind.apply(e, r));
            return n && Object(a.a)(o, n.prototype), o
        }).apply(null, arguments)
    }

    function c(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (c = function(e) {
            if (null === e || (n = e, -1 === Function.toString.call(n).indexOf("[native code]"))) return e;
            var n;
            if ("function" != typeof e) throw new TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, o)
            }

            function o() {
                return i(e, arguments, Object(r.a)(this).constructor)
            }
            return o.prototype = Object.create(e.prototype, {
                constructor: {
                    value: o,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), Object(a.a)(o, e)
        })(e)
    }
}, function(e, t, n) {
    "use strict";
    n.d(t, "b", (function() {
        return i
    })), n.d(t, "a", (function() {
        return c
    }));
    var r = n(1),
        a = (n(8), n(4)),
        o = n(14),
        i = function(e) {
            var t, n = e.controllerId,
                i = e.frameId,
                c = e.targetOrigin,
                s = e.type,
                u = c;
            "controller" === s ? t = Object(o.e)(i) : "group" === s ? t = Object(o.e)(n) : "outer" === s || "hosted" === s ? t = window.frames[i] : "inner" === s && (u = u || "*", t = window.parent), u = u || a.k, t && "function" == typeof t.postMessage && t.postMessage(JSON.stringify(Object(r.a)(Object(r.a)({}, e), {}, {
                __stripeJsV3: !0
            })), u)
        },
        c = function(e) {
            try {
                var t = "string" == typeof e ? JSON.parse(e) : e;
                return t.__stripeJsV3 ? t : null
            } catch (e) {
                return null
            }
        }
}, function(e, t, n) {
    "use strict";

    function r(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
        return r
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";

    function r(e) {
        if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";

    function r() {
        if ("undefined" == typeof Reflect || !Reflect.construct) return !1;
        if (Reflect.construct.sham) return !1;
        if ("function" == typeof Proxy) return !0;
        try {
            return Date.prototype.toString.call(Reflect.construct(Date, [], (function() {}))), !0
        } catch (e) {
            return !1
        }
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";

    function r(e) {
        if (Array.isArray(e)) return e
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";

    function r() {
        throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
    }
    n.d(t, "a", (function() {
        return r
    }))
}, function(e, t, n) {
    "use strict";
    n.d(t, "b", (function() {
        return a
    })), n.d(t, "a", (function() {
        return o
    }));
    var r = n(5),
        a = [r.a.checkout_beta_2, r.a.checkout_beta_3, r.a.checkout_beta_4],
        o = [r.a.checkout_beta_2, r.a.checkout_beta_3, r.a.checkout_beta_4, r.a.checkout_beta_locales, r.a.checkout_beta_testcards]
}, function(e, t, n) {
    "use strict";
    n.d(t, "a", (function() {
        return o
    }));
    var r = n(14),
        a = n(28),
        o = function() {
            var e = Object(r.a)(),
                t = e.style.overflow;
            e.style.overflow = "hidden";
            var n = {
                    passive: !1
                },
                o = function(e) {
                    return e.preventDefault()
                },
                i = function() {};
            return window.addEventListener("touchmove", i, n), e.addEventListener("touchstart", i, n), e.addEventListener("touchmove", o, n), Object(a.c)((function() {
                e.style.overflow = t || "", window.removeEventListener("touchmove", i, n), e.removeEventListener("touchstart", i, n), e.removeEventListener("touchmove", o, n)
            }))
        }
}, function(e, t, n) {
    "use strict";
    var r = n(62);

    function a() {}
    var o = null,
        i = {};

    function c(e) {
        if ("object" != typeof this) throw new TypeError("Promises must be constructed via new");
        if ("function" != typeof e) throw new TypeError("not a function");
        this._45 = 0, this._81 = 0, this._65 = null, this._54 = null, e !== a && f(e, this)
    }

    function s(e, t) {
        for (; 3 === e._81;) e = e._65;
        if (c._10 && c._10(e), 0 === e._81) return 0 === e._45 ? (e._45 = 1, void(e._54 = t)) : 1 === e._45 ? (e._45 = 2, void(e._54 = [e._54, t])) : void e._54.push(t);
        ! function(e, t) {
            r((function() {
                var n = 1 === e._81 ? t.onFulfilled : t.onRejected;
                if (null !== n) {
                    var r = function(e, t) {
                        try {
                            return e(t)
                        } catch (e) {
                            return o = e, i
                        }
                    }(n, e._65);
                    r === i ? l(t.promise, o) : u(t.promise, r)
                } else 1 === e._81 ? u(t.promise, e._65) : l(t.promise, e._65)
            }))
        }(e, t)
    }

    function u(e, t) {
        if (t === e) return l(e, new TypeError("A promise cannot be resolved with itself."));
        if (t && ("object" == typeof t || "function" == typeof t)) {
            var n = function(e) {
                try {
                    return e.then
                } catch (e) {
                    return o = e, i
                }
            }(t);
            if (n === i) return l(e, o);
            if (n === e.then && t instanceof c) return e._81 = 3, e._65 = t, void p(e);
            if ("function" == typeof n) return void f(n.bind(t), e)
        }
        e._81 = 1, e._65 = t, p(e)
    }

    function l(e, t) {
        e._81 = 2, e._65 = t, c._97 && c._97(e, t), p(e)
    }

    function p(e) {
        if (1 === e._45 && (s(e, e._54), e._54 = null), 2 === e._45) {
            for (var t = 0; t < e._54.length; t++) s(e, e._54[t]);
            e._54 = null
        }
    }

    function d(e, t, n) {
        this.onFulfilled = "function" == typeof e ? e : null, this.onRejected = "function" == typeof t ? t : null, this.promise = n
    }

    function f(e, t) {
        var n = !1,
            r = function(e, t, n) {
                try {
                    e(t, n)
                } catch (e) {
                    return o = e, i
                }
            }(e, (function(e) {
                n || (n = !0, u(t, e))
            }), (function(e) {
                n || (n = !0, l(t, e))
            }));
        n || r !== i || (n = !0, l(t, o))
    }
    e.exports = c, c._10 = null, c._97 = null, c._61 = a, c.prototype.then = function(e, t) {
        if (this.constructor !== c) return function(e, t, n) {
            return new e.constructor((function(r, o) {
                var i = new c(a);
                i.then(r, o), s(e, new d(t, n, i))
            }))
        }(this, e, t);
        var n = new c(a);
        return s(this, new d(e, t, n)), n
    }
}, function(e, t, n) {
    "use strict";
    var r = n(48);
    e.exports = r;
    var a = l(!0),
        o = l(!1),
        i = l(null),
        c = l(void 0),
        s = l(0),
        u = l("");

    function l(e) {
        var t = new r(r._61);
        return t._81 = 1, t._65 = e, t
    }
    r.resolve = function(e) {
        if (e instanceof r) return e;
        if (null === e) return i;
        if (void 0 === e) return c;
        if (!0 === e) return a;
        if (!1 === e) return o;
        if (0 === e) return s;
        if ("" === e) return u;
        if ("object" == typeof e || "function" == typeof e) try {
            var t = e.then;
            if ("function" == typeof t) return new r(t.bind(e))
        } catch (e) {
            return new r((function(t, n) {
                n(e)
            }))
        }
        return l(e)
    }, r.all = function(e) {
        var t = Array.prototype.slice.call(e);
        return new r((function(e, n) {
            if (0 === t.length) return e([]);
            var a = t.length;

            function o(i, c) {
                if (c && ("object" == typeof c || "function" == typeof c)) {
                    if (c instanceof r && c.then === r.prototype.then) {
                        for (; 3 === c._81;) c = c._65;
                        return 1 === c._81 ? o(i, c._65) : (2 === c._81 && n(c._65), void c.then((function(e) {
                            o(i, e)
                        }), n))
                    }
                    var s = c.then;
                    if ("function" == typeof s) return void new r(s.bind(c)).then((function(e) {
                        o(i, e)
                    }), n)
                }
                t[i] = c, 0 == --a && e(t)
            }
            for (var i = 0; i < t.length; i++) o(i, t[i])
        }))
    }, r.reject = function(e) {
        return new r((function(t, n) {
            n(e)
        }))
    }, r.race = function(e) {
        return new r((function(t, n) {
            e.forEach((function(e) {
                r.resolve(e).then(t, n)
            }))
        }))
    }, r.prototype.catch = function(e) {
        return this.then(null, e)
    }
}, function(e, t, n) {
    var r;
    ! function() {
        "use strict";
        var n = function() {
            function e() {}

            function t(e, t) {
                for (var n = t.length, r = 0; r < n; ++r) a(e, t[r])
            }
            e.prototype = Object.create(null);
            var n = {}.hasOwnProperty;
            var r = /\s+/;

            function a(e, a) {
                if (a) {
                    var o = typeof a;
                    "string" === o ? function(e, t) {
                        for (var n = t.split(r), a = n.length, o = 0; o < a; ++o) e[n[o]] = !0
                    }(e, a) : Array.isArray(a) ? t(e, a) : "object" === o ? function(e, t) {
                        for (var r in t) n.call(t, r) && (e[r] = !!t[r])
                    }(e, a) : "number" === o && function(e, t) {
                        e[t] = !0
                    }(e, a)
                }
            }
            return function() {
                for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                var o = new e;
                t(o, r);
                var i = [];
                for (var c in o) o[c] && i.push(c);
                return i.join(" ")
            }
        }();
        e.exports ? (n.default = n, e.exports = n) : void 0 === (r = function() {
            return n
        }.apply(t, [])) || (e.exports = r)
    }()
}, function(e, t) {
    e.exports = function(e) {
        var t = e.split("").map((function(e) {
            return e.charCodeAt(0)
        })).reduce((function(e, t) {
            return (e << 5) - e + t & (e << 5) - e + t
        }), 0).toString();
        return "_".concat(t.replace(/[-.]/g, "_"))
    }
}, function(e, t, n) {
    e.exports = n.p + "fingerprinted/img/visa-b1580729a2f0ebb76db531ee66978189.svg"
}, function(e, t, n) {
    e.exports = n.p + "fingerprinted/img/amex-bc298baf2331b6045de5da05c2a6fdeb.svg"
}, function(e, t, n) {
    e.exports = n.p + "fingerprinted/img/mastercard-1e417c41e64b33895cf3437aa7a3c6a5.svg"
}, function(e, t, n) {
    e.exports = n.p + "fingerprinted/img/unionpay-9b59a572fd6306d853d1820e9f9551cb.svg"
}, function(e, t, n) {
    e.exports = n.p + "fingerprinted/img/visa-26b2bbeb7b91fa6fa7e73a18f41a0f09.svg"
}, function(e, t, n) {
    e.exports = n.p + "fingerprinted/img/amex-24dd6400a664547ee483a91c3f25c6bb.svg"
}, function(e, t, n) {
    e.exports = n.p + "fingerprinted/img/mastercard-b7631d947a47b09699b5bc129b7ecf7f.svg"
}, function(e, t, n) {
    "use strict";
    (function(e) {
        n.d(t, "a", (function() {
            return u
        }));
        var r = n(1),
            a = n(10),
            o = n(60),
            i = n(15),
            c = (n(2), n(27)),
            s = function(t, n) {
                var r = n;
                return Boolean(e.env.STRIPE_JS_COMPILE_DEVAPP) && window.__STRIPE_CHECKOUT_URL_OVERRIDE__ && (r = n.replace(/^https?:\/\/[^/]+\//, window.__STRIPE_CHECKOUT_URL_OVERRIDE__)), Object(c.a)(r).then((function(e) {
                    return Object(c.b)(t, "redirectToCheckout", e), {
                        error: e.error
                    }
                }))
            },
            u = function(e, t, n, c, u) {
                var l = Object(o.a)(t, c, u, e.keyMode());
                if (e.report("redirect_to_checkout.options", {
                        betas: t,
                        options: Object(i.e)(l, ["mode", "sessionId"]),
                        globalLocale: c
                    }), "session" === l.tag) {
                    var p = l.sessionId;
                    return e.action.createPaymentPageWithSession({
                        betas: t,
                        mids: n(),
                        sessionId: p
                    }).then((function(t) {
                        if ("error" === t.type) return {
                            error: t.error
                        };
                        var n = t.object.url;
                        return s(e, n)
                    }))
                }
                var d = l,
                    f = (d.tag, d.items),
                    m = d.lineItems,
                    _ = d.mode,
                    h = d.successUrl,
                    y = d.cancelUrl,
                    b = d.clientReferenceId,
                    v = d.customerEmail,
                    g = d.billingAddressCollection,
                    O = d.submitType,
                    j = d.allowIncompleteSubscriptions,
                    E = d.shippingAddressCollection,
                    w = Object(a.a)(d, ["tag", "items", "lineItems", "mode", "successUrl", "cancelUrl", "clientReferenceId", "customerEmail", "billingAddressCollection", "submitType", "allowIncompleteSubscriptions", "shippingAddressCollection"]),
                    k = [];
                if (m && f) throw new Error("Only one of items, lineItems can be passed in.");
                if (m) {
                    if (!_) throw new Error("Expected `mode`");
                    k = m.map((function(e) {
                        if (e.price) return {
                            type: "price",
                            id: e.price,
                            quantity: e.quantity
                        };
                        throw new Error("Unexpected item shape.")
                    }))
                } else {
                    if (!f) throw new Error("An items field must be passed in.");
                    k = f.map((function(e) {
                        if (e.sku) return {
                            type: "sku",
                            id: e.sku,
                            quantity: e.quantity
                        };
                        if (e.plan) return {
                            type: "plan",
                            id: e.plan,
                            quantity: e.quantity
                        };
                        throw new Error("Unexpected item shape.")
                    }))
                }
                return e.action.createPaymentPage(Object(r.a)({
                    betas: t,
                    mids: n(),
                    items: k,
                    mode: _,
                    success_url: h,
                    cancel_url: y,
                    client_reference_id: b,
                    customer_email: v,
                    billing_address_collection: g,
                    submit_type: O,
                    allow_incomplete_subscriptions: j,
                    shipping_address_collection: E && {
                        allowed_countries: E.allowedCountries
                    }
                }, w)).then((function(t) {
                    if ("error" === t.type) return {
                        error: t.error
                    };
                    var n = t.object.url;
                    return s(e, n)
                }))
            }
    }).call(this, n(66))
}, function(e, t, n) {
    "use strict";
    var r = n(10),
        a = n(1),
        o = n(7),
        i = {
            bg: "bg",
            cs: "cs",
            da: "da",
            de: "de",
            el: "el",
            en: "en",
            "en-GB": "en-GB",
            es: "es",
            "es-419": "es-419",
            et: "et",
            fi: "fi",
            fil: "fil",
            fr: "fr",
            "fr-CA": "fr-CA",
            hr: "hr",
            hu: "hu",
            id: "id",
            it: "it",
            ja: "ja",
            ko: "ko",
            lt: "lt",
            lv: "lv",
            ms: "ms",
            mt: "mt",
            nb: "nb",
            nl: "nl",
            pl: "pl",
            pt: "pt",
            "pt-BR": "pt-BR",
            ro: "ro",
            ru: "ru",
            sk: "sk",
            sl: "sl",
            sv: "sv",
            th: "th",
            tr: "tr",
            vi: "vi",
            zh: "zh",
            "zh-HK": "zh-HK",
            "zh-TW": "zh-TW"
        },
        c = {
            "pt-PT": "pt-PT"
        },
        s = Object.keys(i),
        u = Object.keys(c),
        l = n(46),
        p = n(0),
        d = n(15),
        f = n(5),
        m = n(3),
        _ = n(24),
        h = {
            sku: Object(p.s)(p.x),
            plan: Object(p.s)(p.x),
            clientReferenceId: Object(p.s)(p.x),
            locale: Object(p.s)(p.q.apply(void 0, ["auto"].concat(Object(o.a)(s)))),
            customerEmail: Object(p.s)(p.x),
            billingAddressCollection: Object(p.s)(Object(p.q)("required", "auto")),
            submitType: Object(p.s)(Object(p.q)("auto", "pay", "book", "donate")),
            allowIncompleteSubscriptions: Object(p.s)(p.b),
            shippingAddressCollection: Object(p.s)(Object(p.d)({
                allowedCountries: Object(p.a)(p.x)
            }))
        },
        y = /cs_(test|live)_.+/,
        b = function(e, t) {
            var n = Object(p.d)(Object(a.a)(Object(a.a)({}, h), {}, {
                    items: Object(p.s)(Object(p.t)(Object(p.a)(Object(p.d)({
                        type: Object(p.q)("plan"),
                        quantity: Object(p.o)(0),
                        id: p.x
                    })), Object(p.a)(Object(p.d)({
                        type: Object(p.q)("sku"),
                        quantity: Object(p.o)(0),
                        id: p.x
                    })))),
                    successUrl: p.x,
                    cancelUrl: p.x
                })),
                o = Object(p.E)(n, t, "stripe.redirectToCheckout").value,
                i = o.sku,
                c = o.plan,
                s = o.items,
                u = Object(r.a)(o, ["sku", "plan", "items"]),
                l = function(e, t, n) {
                    if (e && t || (e || t) && n) throw new m.a("stripe.redirectToCheckout: Expected only one of sku, plan, or items.");
                    if ("string" == typeof e) return [{
                        sku: e,
                        quantity: 1
                    }];
                    if ("string" == typeof t) return [{
                        plan: t,
                        quantity: 1
                    }];
                    if (n) return n.map((function(e) {
                        return "sku" === e.type ? {
                            sku: e.id,
                            quantity: e.quantity
                        } : {
                            plan: e.id,
                            quantity: e.quantity
                        }
                    }));
                    throw new m.a("stripe.redirectToCheckout: You must provide either sku, plan, or items.")
                }(i, c, s);
            return Object(a.a)({
                tag: "no-session",
                items: l
            }, u)
        },
        v = function(e, t, n) {
            var i = Object(p.d)(Object(a.a)(Object(a.a)({}, h), {}, {
                    sessionId: Object(p.s)(p.x),
                    successUrl: Object(p.s)(p.x),
                    cancelUrl: Object(p.s)(p.x),
                    mode: Object(p.s)(Object(p.q)("subscription", "payment")),
                    items: Object(p.s)(Object(p.t)(Object(p.a)(Object(p.d)({
                        quantity: Object(p.o)(0),
                        plan: p.x
                    })), Object(p.a)(Object(p.d)({
                        quantity: Object(p.o)(0),
                        sku: p.x
                    })))),
                    lineItems: Object(p.s)(Object(p.a)(Object(p.d)({
                        quantity: Object(p.o)(0),
                        price: p.x
                    })))
                }, -1 !== e.indexOf("checkout_beta_locales") ? {
                    locale: Object(p.s)(p.q.apply(void 0, ["auto"].concat(Object(o.a)(s), Object(o.a)(u))))
                } : {})),
                c = Object(p.E)(i, t, "stripe.redirectToCheckout").value;
            if (c.sessionId) {
                var l = c.sessionId;
                if (Object.keys(c).length > 1) throw new m.a("stripe.redirectToCheckout: Do not provide other parameters when providing sessionId. Specify all parameters on your server when creating the CheckoutSession.");
                if (!/^cs_/.test(l)) throw new m.a("stripe.redirectToCheckout: Invalid value for sessionId. You specified '".concat(l, "'."));
                if ("live" === n && /^cs_test_/.test(l)) throw new m.a("stripe.redirectToCheckout: the provided sessionId is for a test mode Checkout Session, whereas Stripe.js was initialized with a live mode publishable key.");
                if ("test" === n && /^cs_live_/.test(l)) throw new m.a("stripe.redirectToCheckout: the provided sessionId is for a live mode Checkout Session, whereas Stripe.js was initialized with a test mode publishable key.");
                return {
                    tag: "session",
                    sessionId: l
                }
            }
            c.sessionId, c.sku, c.plan;
            var d = c.items,
                f = c.lineItems,
                _ = c.successUrl,
                y = c.cancelUrl,
                b = c.mode,
                v = Object(r.a)(c, ["sessionId", "sku", "plan", "items", "lineItems", "successUrl", "cancelUrl", "mode"]);
            if (!f && !d) throw new m.a("stripe.redirectToCheckout: You must provide one of lineItems, items, or sessionId.");
            if (!_ || !y) throw new m.a("stripe.redirectToCheckout: You must provide successUrl and cancelUrl.");
            return Object(a.a)({
                tag: "no-session",
                items: d,
                lineItems: f,
                successUrl: _,
                cancelUrl: y,
                mode: b
            }, v)
        },
        g = function(e, t, n) {
            var r = v(e, t, n);
            if ("no-session" === r.tag) {
                var a = r.successUrl,
                    o = r.cancelUrl;
                if (!Object(_.b)(a)) throw new m.a("stripe.redirectToCheckout: successUrl must start with either http:// or https://.");
                if (!Object(_.b)(o)) throw new m.a("stripe.redirectToCheckout: cancelUrl must start with either http:// or https://.");
                return r
            }
            return r
        },
        O = function(e, t) {
            return "session" === t.tag || null == e || t.locale || -1 === ["auto"].concat(Object(o.a)(s)).indexOf(e) ? t : Object(a.a)(Object(a.a)({}, t), {}, {
                locale: e
            })
        },
        j = function(e, t, n) {
            var r = Object(d.a)(l.b, (function(t) {
                return Object(f.d)(e, t)
            }));
            if (t && t.lineItems && r) throw new m.a("Prices cannot be used with ".concat(r));
            if ("string" == typeof t && y.test(t)) throw new m.a("stripe.redirectToCheckout: Checkout Session IDs must be passed in as an object with a key of `sessionId` and the Session ID as the value.");
            switch (r) {
                case "checkout_beta_2":
                    return b(0, t);
                case "checkout_beta_3":
                    return v(e, t, n);
                case "checkout_beta_4":
                default:
                    return g(e, t, n)
            }
        };
    t.a = function(e, t, n) {
        var r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "unknown";
        return O(t, j(e, n, r))
    }
}, function(e, t, n) {
    e.exports = n(71)
}, function(e, t, n) {
    "use strict";
    (function(t) {
        function n(e) {
            a.length || (r(), !0), a[a.length] = e
        }
        e.exports = n;
        var r, a = [],
            o = 0;

        function i() {
            for (; o < a.length;) {
                var e = o;
                if (o += 1, a[e].call(), o > 1024) {
                    for (var t = 0, n = a.length - o; t < n; t++) a[t] = a[t + o];
                    a.length -= o, o = 0
                }
            }
            a.length = 0, o = 0, !1
        }
        var c, s, u, l = void 0 !== t ? t : self,
            p = l.MutationObserver || l.WebKitMutationObserver;

        function d(e) {
            return function() {
                var t = setTimeout(r, 0),
                    n = setInterval(r, 50);

                function r() {
                    clearTimeout(t), clearInterval(n), e()
                }
            }
        }
        "function" == typeof p ? (c = 1, s = new p(i), u = document.createTextNode(""), s.observe(u, {
            characterData: !0
        }), r = function() {
            c = -c, u.data = c
        }) : r = d(i), n.requestFlush = r, n.makeRequestCallFromTimer = d
    }).call(this, n(63))
}, function(e, t) {
    var n;
    n = function() {
        return this
    }();
    try {
        n = n || new Function("return this")()
    } catch (e) {
        "object" == typeof window && (n = window)
    }
    e.exports = n
}, function(e, t, n) {
    "use strict";
    var r = n(48);
    e.exports = r, r.prototype.finally = function(e) {
        return this.then((function(t) {
            return r.resolve(e()).then((function() {
                return t
            }))
        }), (function(t) {
            return r.resolve(e()).then((function() {
                throw t
            }))
        }))
    }
}, function(e, t) {}, function(e, t) {
    var n, r, a = e.exports = {};

    function o() {
        throw new Error("setTimeout has not been defined")
    }

    function i() {
        throw new Error("clearTimeout has not been defined")
    }

    function c(e) {
        if (n === setTimeout) return setTimeout(e, 0);
        if ((n === o || !n) && setTimeout) return n = setTimeout, setTimeout(e, 0);
        try {
            return n(e, 0)
        } catch (t) {
            try {
                return n.call(null, e, 0)
            } catch (t) {
                return n.call(this, e, 0)
            }
        }
    }! function() {
        try {
            n = "function" == typeof setTimeout ? setTimeout : o
        } catch (e) {
            n = o
        }
        try {
            r = "function" == typeof clearTimeout ? clearTimeout : i
        } catch (e) {
            r = i
        }
    }();
    var s, u = [],
        l = !1,
        p = -1;

    function d() {
        l && s && (l = !1, s.length ? u = s.concat(u) : p = -1, u.length && f())
    }

    function f() {
        if (!l) {
            var e = c(d);
            l = !0;
            for (var t = u.length; t;) {
                for (s = u, u = []; ++p < t;) s && s[p].run();
                p = -1, t = u.length
            }
            s = null, l = !1,
                function(e) {
                    if (r === clearTimeout) return clearTimeout(e);
                    if ((r === i || !r) && clearTimeout) return r = clearTimeout, clearTimeout(e);
                    try {
                        r(e)
                    } catch (t) {
                        try {
                            return r.call(null, e)
                        } catch (t) {
                            return r.call(this, e)
                        }
                    }
                }(e)
        }
    }

    function m(e, t) {
        this.fun = e, this.array = t
    }

    function _() {}
    a.nextTick = function(e) {
        var t = new Array(arguments.length - 1);
        if (arguments.length > 1)
            for (var n = 1; n < arguments.length; n++) t[n - 1] = arguments[n];
        u.push(new m(e, t)), 1 !== u.length || l || c(f)
    }, m.prototype.run = function() {
        this.fun.apply(null, this.array)
    }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = _, a.addListener = _, a.once = _, a.off = _, a.removeListener = _, a.removeAllListeners = _, a.emit = _, a.prependListener = _, a.prependOnceListener = _, a.listeners = function(e) {
        return []
    }, a.binding = function(e) {
        throw new Error("process.binding is not supported")
    }, a.cwd = function() {
        return "/"
    }, a.chdir = function(e) {
        throw new Error("process.chdir is not supported")
    }, a.umask = function() {
        return 0
    }
}, , , , , function(e, t, n) {
    "use strict";
    n.r(t);
    var r = n(1),
        a = n(7),
        o = n(9),
        i = n(16),
        c = n(6),
        s = n(10),
        u = n(2),
        l = n(0),
        p = n(4),
        d = n(22),
        f = "00".concat(Math.floor(1e3 * Math.random())).slice(-3),
        m = 0,
        _ = function(e) {
            return "".concat(e).concat(f).concat(m++)
        },
        h = function e() {
            var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
            return t ? (parseInt(t, 10) ^ 16 * Math.random() >> parseInt(t, 10) / 4).toString(16) : "00000000-0000-4000-8000-000000000000".replace(/[08]/g, e)
        },
        y = n(20),
        b = n(21),
        v = n(32),
        g = n(40),
        O = n(3),
        j = (n(65), /https?:\/\/([^/]*)\/[^:]*/g),
        E = function(e, t, n, r) {
            var a, o, i, c = e._isUserError || "IntegrationError" === e.name;
            throw t && !c && t.report("fatal.uncaught_error", {
                iframe: !1,
                name: e.name,
                element: "outer",
                message: e.message || e.description,
                fileName: e.fileName,
                lineNumber: e.lineNumber,
                columnNumber: e.columnNumber,
                stack: e.stack && (a = e.stack, o = a.match(j), i = a, o && o.forEach((function(e) {
                    -1 === e.indexOf("https://js.stripe.com") && (i = i.replace(e, "<external url>"))
                })), i.substring(0, 1e3)),
                inPromise: n,
                apiMethodName: r
            }), e
        },
        w = function(e, t, n) {
            return function(r) {
                try {
                    return e.call(this, r)
                } catch (e) {
                    return E(e, t || this && this._controller, !1, n)
                }
            }
        },
        k = function(e, t, n) {
            return function(r, a) {
                try {
                    return e.call(this, r, a)
                } catch (e) {
                    return E(e, t || this && this._controller, !1, n)
                }
            }
        },
        P = function(e, t, n) {
            return function(r) {
                var a = this;
                try {
                    return e.call(this, r).catch((function(e) {
                        return E(e, t || a && a._controller, !0, n)
                    }))
                } catch (e) {
                    return E(e, t || this && this._controller, !1, n)
                }
            }
        },
        S = function(e, t, n) {
            return function(r, a) {
                var o = this;
                try {
                    return e.call(this, r, a).catch((function(e) {
                        return E(e, t || o && o._controller, !0, n)
                    }))
                } catch (e) {
                    return E(e, t || this && this._controller, !1, n)
                }
            }
        },
        A = function(e, t, n) {
            return function(r, a, o) {
                var i = this;
                try {
                    return e.call(this, r, a, o).catch((function(e) {
                        return E(e, t || i && i._controller, !0, n)
                    }))
                } catch (e) {
                    return E(e, t || this && this._controller, !1, n)
                }
            }
        },
        T = function e() {
            var t = this;
            Object(o.a)(this, e), this._emit = function(e) {
                for (var n = arguments.length, r = new Array(n > 1 ? n - 1 : 0), a = 1; a < n; a++) r[a - 1] = arguments[a];
                var o = t._callbacks[e] || [];
                return o.forEach((function(e) {
                    var t = e.fn;
                    if (t._isUserCallback) try {
                        t.apply(void 0, r)
                    } catch (e) {
                        throw e._isUserError = !0, e
                    } else t.apply(void 0, r)
                })), t
            }, this._once = function(e, n) {
                return t._on(e, (function r() {
                    t._off(e, r), n.apply(void 0, arguments)
                }), n)
            }, this._removeAllListeners = function() {
                return t._callbacks = {}, t
            }, this._on = function(e, n, r) {
                return t._callbacks[e] = t._callbacks[e] || [], t._callbacks[e].push({
                    original: r,
                    fn: n
                }), t
            }, this._validateUserOn = function(e, t) {}, this._userOn = function(e, n) {
                if ("string" != typeof e) throw new O.a("When adding an event listener, the first argument should be a string event name.");
                if ("function" != typeof n) throw new O.a("When adding an event listener, the second argument should be a function callback.");
                return t._validateUserOn(e, n), n._isUserCallback = !0, t._on(e, n)
            }, this._hasRegisteredListener = function(e) {
                return t._callbacks[e] && t._callbacks[e].length > 0
            }, this._off = function(e, n) {
                if (n) {
                    for (var r, a = t._callbacks[e], o = 0; o < a.length; o++)
                        if ((r = a[o]).fn === n || r.original === n) {
                            a.splice(o, 1);
                            break
                        }
                } else delete t._callbacks[e];
                return t
            }, this._callbacks = {};
            var n, r, a, i = k(this._userOn),
                c = k(this._off),
                s = k(this._once),
                u = w(this._hasRegisteredListener),
                l = w(this._removeAllListeners),
                p = (n = this._emit, function() {
                    try {
                        for (var e = arguments.length, t = new Array(e), o = 0; o < e; o++) t[o] = arguments[o];
                        return n.call.apply(n, [this].concat(t))
                    } catch (e) {
                        return E(e, r || this && this._controller, !1, a)
                    }
                });
            this.on = this.addListener = this.addEventListener = i, this.off = this.removeListener = this.removeEventListener = c, this.once = s, this.hasRegisteredListener = u, this.removeAllListeners = l, this.emit = p
        },
        I = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n(e) {
                var r, a = e.type,
                    i = e.controllerId,
                    c = e.listenerRegistry,
                    s = e.betas,
                    l = e.appParams;
                return Object(o.a)(this, n), (r = t.call(this))._sendFAReq = function(e) {
                    var t = _(e.tag);
                    return new u.a((function(n, a) {
                        r._requests[t] = {
                            resolve: n,
                            reject: a
                        }, r._send({
                            message: {
                                action: "stripe-frame-action",
                                payload: {
                                    nonce: t,
                                    faReq: e
                                }
                            },
                            type: "outer",
                            frameId: r.id,
                            controllerId: r._controllerId
                        })
                    }))
                }, r.action = {
                    perform3DS2Challenge: function(e) {
                        return r._sendFAReq({
                            tag: "PERFORM_3DS2_CHALLENGE",
                            value: e
                        })
                    },
                    perform3DS2Fingerprint: function(e) {
                        return r._sendFAReq({
                            tag: "PERFORM_3DS2_FINGERPRINT",
                            value: e
                        })
                    },
                    performOneClickWebauthnAuthentication: function(e) {
                        return r._sendFAReq({
                            tag: "PERFORM_ONE_CLICK_WEBAUTHN_AUTHENTICATION",
                            value: e
                        })
                    },
                    show3DS2Spinner: function(e) {
                        return r._sendFAReq({
                            tag: "SHOW_3DS2_SPINNER",
                            value: e
                        })
                    },
                    checkCanMakePayment: function(e) {
                        return r._sendFAReq({
                            tag: "CHECK_CAN_MAKE_PAYMENT",
                            value: e
                        })
                    },
                    closeLightboxFrame: function(e) {
                        return r._sendFAReq({
                            tag: "CLOSE_LIGHTBOX_FRAME",
                            value: e
                        })
                    },
                    openLightboxFrame: function(e) {
                        return r._sendFAReq({
                            tag: "OPEN_LIGHTBOX_FRAME",
                            value: e
                        })
                    },
                    setFocusTarget: function(e) {
                        return r._sendFAReq({
                            tag: "SET_FOCUS_TARGET",
                            value: e
                        })
                    }
                }, r.type = a, r.loaded = !1, r._controllerId = i, r._persistentMessages = [], r._queuedMessages = [], r._requests = {}, r._listenerRegistry = c, r.id = r._generateId(), r._iframe = r._createIFrame(a, s, l), r._on("load", (function() {
                    r.loaded = !0, r._ensureMounted(), r.loaded && (r._persistentMessages.forEach((function(e) {
                        return r._send(e)
                    })), r._queuedMessages.forEach((function(e) {
                        return r._send(e)
                    })), r._queuedMessages = [])
                })), r._on("title", (function(e) {
                    var t = e.title;
                    r._iframe.setAttribute("title", t)
                })), r
            }
            return Object(i.a)(n, [{
                key: "_generateId",
                value: function() {
                    return _("__privateStripeFrame")
                }
            }, {
                key: "send",
                value: function(e) {
                    this._send({
                        message: e,
                        type: "outer",
                        frameId: this.id,
                        controllerId: this._controllerId
                    })
                }
            }, {
                key: "sendPersistent",
                value: function(e) {
                    this._ensureMounted();
                    var t = {
                        message: e,
                        type: "outer",
                        frameId: this.id,
                        controllerId: this._controllerId
                    };
                    this._persistentMessages = [].concat(Object(a.a)(this._persistentMessages), [t]), this.loaded && Object(g.b)(t)
                }
            }, {
                key: "resolve",
                value: function(e, t) {
                    this._requests[e] && this._requests[e].resolve(t)
                }
            }, {
                key: "reject",
                value: function(e, t) {
                    this._requests[e] && this._requests[e].reject(t)
                }
            }, {
                key: "_send",
                value: function(e) {
                    this._ensureMounted(), this.loaded ? Object(g.b)(e) : this._queuedMessages = [].concat(Object(a.a)(this._queuedMessages), [e])
                }
            }, {
                key: "appendTo",
                value: function(e) {
                    this._emit("mount", {
                        anchor: e
                    }), e.appendChild(this._iframe)
                }
            }, {
                key: "unmount",
                value: function() {
                    this.loaded = !1, this._emit("unload")
                }
            }, {
                key: "destroy",
                value: function() {
                    this.unmount();
                    var e = this._iframe.parentElement;
                    e && e.removeChild(this._iframe), this._emit("destroy")
                }
            }, {
                key: "_ensureMounted",
                value: function() {
                    this._isMounted() || this.unmount()
                }
            }, {
                key: "_isMounted",
                value: function() {
                    return !!document.body && document.body.contains(this._iframe)
                }
            }, {
                key: "_createIFrame",
                value: function(e, t, n) {
                    var a = window.location.href.toString(),
                        o = "string" == typeof n ? n : Object(v.a)(Object(r.a)(Object(r.a)({}, n || {}), {}, {
                            referrer: a,
                            controllerId: this._controllerId
                        })),
                        i = document.createElement("iframe");
                    i.setAttribute("name", this.id);
                    var c = Object(p.d)(e);
                    return Object.keys(c).forEach((function(e) {
                        i.setAttribute(e, c[e])
                    })), (null == n ? void 0 : n.allowCamera) && i.setAttribute("allow", "camera"), i.src = "".concat(Object(p.e)(e)).concat(o ? "#" : "").concat(o), i
                }
            }]), n
        }(T),
        C = n(26),
        N = n(25);

    function R(e, t, n) {
        return (R = "undefined" != typeof Reflect && Reflect.get ? Reflect.get : function(e, t, n) {
            var r = function(e, t) {
                for (; !Object.prototype.hasOwnProperty.call(e, t) && null !== (e = Object(N.a)(e)););
                return e
            }(e, t);
            if (r) {
                var a = Object.getOwnPropertyDescriptor(r, t);
                return a.get ? a.get.call(n) : a.value
            }
        })(e, t, n || e)
    }
    var x = n(14),
        M = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n(e) {
                var r;
                if (Object(o.a)(this, n), (r = t.call(this, e)).autoload = e.autoload || !1, "complete" === document.readyState) r._ensureMounted();
                else {
                    var a = r._ensureMounted.bind(Object(C.a)(r));
                    r._listenerRegistry.addEventListener(document, "DOMContentLoaded", a), r._listenerRegistry.addEventListener(window, "load", a), setTimeout(a, 5e3)
                }
                return r
            }
            return Object(i.a)(n, [{
                key: "_ensureMounted",
                value: function() {
                    R(Object(N.a)(n.prototype), "_ensureMounted", this).call(this), this._isMounted() || this._autoMount()
                }
            }, {
                key: "_autoMount",
                value: function() {
                    var e = document.body;
                    if (e) {
                        var t = document.querySelector("#stripe-hidden-frames-container") || e;
                        this.appendTo(t)
                    } else if ("complete" === document.readyState || "interactive" === document.readyState) throw new O.a("Stripe.js requires that your page has a <body> element.");
                    this.autoload && (this.loaded = !0)
                }
            }, {
                key: "_createIFrame",
                value: function(e, t, r) {
                    var a = R(Object(N.a)(n.prototype), "_createIFrame", this).call(this, e, t, r);
                    return a.setAttribute("aria-hidden", "true"), a.setAttribute("tabIndex", "-1"), Object(x.c)(a), a
                }
            }]), n
        }(I),
        L = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n() {
                return Object(o.a)(this, n), t.apply(this, arguments)
            }
            return Object(i.a)(n, [{
                key: "_generateId",
                value: function() {
                    return this._controllerId
                }
            }]), n
        }(M),
        D = function(e) {
            return /Edge\//i.test(e)
        },
        q = function(e) {
            return /Edg\//i.test(e)
        },
        B = function(e) {
            return /(MSIE ([0-9]{1,}[.0-9]{0,})|Trident\/)/i.test(e)
        },
        F = function(e) {
            return /SamsungBrowser/.test(e)
        },
        U = function(e) {
            return /iPad|iPhone/i.test(e) && !B(e)
        },
        Y = function(e) {
            return /^((?!chrome|android).)*safari/i.test(e) && !F(e)
        },
        G = function(e) {
            return /Android/i.test(e) && !B(e)
        },
        H = window.navigator.userAgent,
        z = D(H),
        W = q(H),
        K = (/Edge\/((1[0-6]\.)|0\.)/i.test(H), B(H)),
        V = (function(e) {
            /MSIE ([0-9]{1,}[.0-9]{0,})/i.test(e)
        }(H), U(H)),
        J = (function(e) {
            /iPad/i.test(e) && B(e)
        }(H), function(e) {
            U(e) || G(e)
        }(H), G(H)),
        $ = (function(e) {
            /Android 4\./i.test(e) && !/Chrome/i.test(e) && G(e)
        }(H), Y(H)),
        Z = (function(e) {
            Y(e) && U(e)
        }(H), function(e) {
            return /Firefox\//i.test(e)
        }(H)),
        X = (function(e) {
            /Firefox\/(50|51|[0-4]?\d)([^\d]|$)/i.test(e)
        }(H), F(H)),
        Q = function(e) {
            return /Chrome\//i.test(e)
        }(H),
        ee = (function(e) {
            /Chrome\/(6[6-9]|[7-9]\d+|[1-9]\d{2,})/i.test(e)
        }(H), function(e) {
            return /AppleWebKit/i.test(e) && !/Chrome/i.test(e) && !D(e) && !B(e)
        }(H)),
        te = function(e) {
            return /Chrome/i.test(e) && !D(e)
        }(H),
        ne = (function(e) {
            /CriOS/i.test(e)
        }(H), $ && "download" in document.createElement("a")),
        re = (!!window.navigator.brave && window.navigator.brave.isBrave, {
            border: "none",
            margin: "0",
            padding: "0",
            width: "1px",
            "min-width": "100%",
            overflow: "hidden",
            display: "block",
            "user-select": "none",
            transform: "translate(0)"
        }),
        ae = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n(e) {
                var r;
                return Object(o.a)(this, n), r = t.call(this, e), $ && r._listenerRegistry.addEventListener(document, "transitionstart", (function(e) {
                    switch (e.propertyName) {
                        case "opacity":
                        case "transform":
                        case "visibility":
                            var t = e.target;
                            r._isMounted() && t.contains(r._iframe) && r._forceRepaint()
                    }
                }), {
                    passive: !0
                }), r
            }
            return Object(i.a)(n, [{
                key: "update",
                value: function(e) {
                    this.send({
                        action: "stripe-user-update",
                        payload: e
                    })
                }
            }, {
                key: "updateStyle",
                value: function(e) {
                    var t = this;
                    Object.keys(e).forEach((function(n) {
                        t._iframe.style[n] = e[n]
                    }))
                }
            }, {
                key: "focus",
                value: function() {
                    this.loaded && ($ ? this._iframe.focus() : this.send({
                        action: "stripe-user-focus",
                        payload: {}
                    }))
                }
            }, {
                key: "blur",
                value: function() {
                    this.loaded && (this._iframe.contentWindow.blur(), this._iframe.blur(), document.activeElement === this._iframe && (window.focus(), document.activeElement && "function" == typeof document.activeElement.blur && document.activeElement.blur()))
                }
            }, {
                key: "clear",
                value: function() {
                    this.send({
                        action: "stripe-user-clear",
                        payload: {}
                    })
                }
            }, {
                key: "collapse",
                value: function() {
                    this.send({
                        action: "stripe-user-collapse",
                        payload: {}
                    })
                }
            }, {
                key: "_createIFrame",
                value: function(e, t, r) {
                    var a = R(Object(N.a)(n.prototype), "_createIFrame", this).call(this, e, t, r);
                    return a.setAttribute("title", "Secure payment input frame"), Object(x.d)(a, re), a
                }
            }, {
                key: "_forceRepaint",
                value: function() {
                    var e = this._iframe,
                        t = e.style.display;
                    e.style.display = "none";
                    var n = e.offsetHeight;
                    return e.style.display = t, n
                }
            }]), n
        }(I),
        oe = n(47),
        ie = n(34),
        ce = {
            display: "block",
            position: "fixed",
            "z-index": "2147483647",
            background: "rgba(40,40,40,0)",
            transition: "background 400ms ease",
            "will-change": "background",
            top: "0",
            left: "0",
            right: "0",
            bottom: "0"
        },
        se = Object(r.a)(Object(r.a)({}, ce), {}, {
            background: "rgba(40,40,40,0.75)"
        }),
        ue = function e(t) {
            var n = this,
                r = t.lockScrolling,
                a = t.lockFocus,
                i = t.lockFocusOn,
                c = t.listenerRegistry;
            Object(o.a)(this, e), this.domElement = document.createElement("div"), this._runOnHide = [], this.mount = function() {
                var e = Object(x.a)();
                n.domElement.style.display = "none", e.contains(n.domElement) || e.insertBefore(n.domElement, e.firstChild)
            }, this.show = function() {
                if (Object(x.d)(n.domElement, ce), n._lockScrolling) {
                    var e = Object(oe.a)();
                    n._runOnHide.push(e)
                }
                if (n._lockFocus) {
                    var t = Object(ie.a)(n._lockFocusOn).restoreFocus;
                    n._runOnHide.push(t)
                }
            }, this.fadeIn = function() {
                setTimeout((function() {
                    Object(x.d)(n.domElement, se)
                }))
            }, this.fadeOut = function() {
                return new u.a((function(e) {
                    Object(x.d)(n.domElement, ce), setTimeout(e, 500), n._listenerRegistry.addEventListener(n.domElement, "transitionend", e)
                })).then((function() {
                    for (n.domElement.style.display = "none"; n._runOnHide.length;) n._runOnHide.pop()()
                }))
            }, this.unmount = function() {
                Object(x.a)().removeChild(n.domElement)
            }, this._lockScrolling = !!r, this._lockFocus = !!a, this._lockFocusOn = i || null, this._listenerRegistry = c
        },
        le = {
            position: "absolute",
            left: "0",
            top: "0",
            height: "100%",
            width: "100%"
        },
        pe = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n(e) {
                var r, a, i, c = e.type,
                    s = e.controllerId,
                    u = e.listenerRegistry,
                    l = e.options;
                return Object(o.a)(this, n), (i = t.call(this, {
                    type: c,
                    controllerId: s,
                    listenerRegistry: u,
                    appParams: l
                }))._autoMount = function() {
                    i.appendTo(i._backdrop.domElement), i._backdrop.mount()
                }, i.show = function() {
                    i._backdrop.show(), Object(x.d)(i._iframe, le), i.isVisible = !0
                }, i.fadeInBackdrop = function() {
                    i._backdrop.fadeIn()
                }, i._backdropFadeoutPromise = null, i.fadeOutBackdrop = function() {
                    return i._backdropFadeoutPromise || (i._backdropFadeoutPromise = i._backdrop.fadeOut()), i._backdropFadeoutPromise.then((function() {
                        i._backdropFadeoutPromise = null
                    }))
                }, i.destroy = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                        t = i.fadeOutBackdrop().then((function() {
                            i._backdrop.unmount(), e || R((r = Object(C.a)(i), Object(N.a)(n.prototype)), "destroy", r).call(r)
                        }));
                    return e && R((a = Object(C.a)(i), Object(N.a)(n.prototype)), "destroy", a).call(a), i.isVisible = !1, t
                }, i._backdrop = new ue({
                    lockScrolling: !0,
                    lockFocus: !0,
                    lockFocusOn: i._iframe,
                    listenerRegistry: u
                }), i._autoMount(), i.isVisible = !1, i
            }
            return n
        }(I),
        de = {
            display: "block",
            position: "absolute",
            "z-index": "1000",
            width: "1px",
            "min-width": "100%",
            margin: "2px 0 0 0",
            padding: "0",
            border: "none",
            overflow: "hidden"
        },
        fe = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n() {
                return Object(o.a)(this, n), t.apply(this, arguments)
            }
            return Object(i.a)(n, [{
                key: "updateStyle",
                value: function(e) {
                    var t = this;
                    Object.keys(e).forEach((function(n) {
                        t._iframe.style[n] = e[n]
                    }))
                }
            }, {
                key: "update",
                value: function(e) {
                    this.send({
                        action: "stripe-user-update",
                        payload: e
                    })
                }
            }, {
                key: "_createIFrame",
                value: function(e, t, a) {
                    var o = R(Object(N.a)(n.prototype), "_createIFrame", this).call(this, e, t, a && "object" == typeof a ? Object(r.a)(Object(r.a)({}, a), {}, {
                        isSecondaryFrame: !0
                    }) : a);
                    return Object(x.d)(o, de), o.style.height = "0", o
                }
            }]), n
        }(I),
        me = n(31),
        _e = ["button", "checkbox", "file", "hidden", "image", "submit", "radio", "reset"],
        he = function(e) {
            var t = e.tagName;
            if (e.isContentEditable || "TEXTAREA" === t) return !0;
            if ("INPUT" !== t) return !1;
            var n = e.getAttribute("type");
            return -1 === _e.indexOf(n)
        },
        ye = n(17),
        be = function(e) {
            var t = e.name,
                n = e.value,
                r = e.expiresIn,
                a = e.path,
                o = e.domain,
                i = e.protocol,
                c = e.sameSite,
                s = void 0 === c ? "Lax" : c,
                u = new Date,
                l = r || 31536e6;
            u.setTime(u.getTime() + l);
            var p = a || "/",
                d = (n || "").replace(/[^!#-+\--:<-[\]-~]/g, encodeURIComponent),
                f = "".concat(encodeURIComponent(t), "=").concat(d, ";expires=").concat(u.toGMTString(), ";path=").concat(p, ";SameSite=").concat(s);
            return o && (f += ";domain=".concat(o)), "https:" === i && (f += ";secure"), document.cookie = f, f
        },
        ve = function(e) {
            var t = Object(ye.a)(document.cookie.split("; "), (function(t) {
                var n = t.indexOf("=");
                return decodeURIComponent(t.substr(0, n)) === e
            }));
            if (t) {
                var n = t.indexOf("=");
                return decodeURIComponent(t.substr(n + 1))
            }
            return null
        },
        ge = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        },
        Oe = function(e) {
            var t = {};
            return e.replace(/\+/g, " ").split("&").forEach((function(e, n) {
                var r, a = e.split("="),
                    o = decodeURIComponent(a[0]),
                    i = t,
                    c = 0,
                    s = o.split("]["),
                    u = s.length - 1;
                if (/\[/.test(s[0]) && /\]$/.test(s[u]) ? (s[u] = s[u].replace(/\]$/, ""), u = (s = s.shift().split("[").concat(s)).length - 1) : u = 0, !(s.indexOf("__proto__") >= 0))
                    if (2 === a.length)
                        if (r = decodeURIComponent(a[1]), u)
                            for (; c <= u; c++) {
                                if (o = "" === s[c] ? i.length : s[c], !ge(i, o) && i[o]) return;
                                i[o] = c < u ? i[o] || (s[c + 1] && isNaN(s[c + 1]) ? {} : []) : r, i = i[o]
                            } else if (Array.isArray(t[o])) t[o].push(r);
                            else if (void 0 !== t[o]) {
                    if (!ge(t, o)) return;
                    t[o] = [t[o], r]
                } else t[o] = r;
                else o && (t[o] = "")
            })), t
        },
        je = n(51),
        Ee = n.n(je),
        we = n(15),
        ke = p.n.replace(/\/$/, "");
    var Pe, Se, Ae, Te, Ie = "_1776170249",
        Ce = "__1104211103",
        Ne = function(e) {
            var t, n = (t = {}, Object(c.a)(t, Ie, !0), Object(c.a)(t, Ce, !1), t);
            try {
                var r = Oe(e.slice(e.indexOf("?") + 1));
                Object.keys(r).forEach((function(e) {
                    var t = Ee()(e),
                        a = r[e];
                    switch (t) {
                        case Ie:
                            "false" === a && (n[t] = !1);
                            break;
                        case Ce:
                            "true" === a && (n[t] = !0)
                    }
                }))
            } catch (e) {}
            return n
        }(function(e) {
            try {
                if (e.currentScript) return e.currentScript.src;
                var t = e.querySelectorAll('script[src^="'.concat(ke, '"]')),
                    n = Object(we.a)(t, (function(e) {
                        var t = (e.getAttribute("src") || "").split("?")[0];
                        return new RegExp("^".concat(ke, "/?$")).test(t)
                    }));
                return n && n.getAttribute("src") || ""
            } catch (e) {
                return ""
            }
        }(document)),
        Re = Ne._1776170249,
        xe = Ne[Ce],
        Me = n(18),
        Le = function() {
            var e = [];
            return {
                addEventListener: function(t, n, r, a) {
                    t.addEventListener(n, r, a), e.push([t, n, r, a])
                },
                removeEventListener: function(t, n, r, a) {
                    t.removeEventListener(n, r, a), e = e.filter((function(e) {
                        return function(e, t) {
                            var n = Object(Me.a)(e, 4),
                                r = n[0],
                                a = n[1],
                                o = n[2],
                                i = n[3],
                                c = Object(Me.a)(t, 4),
                                s = c[0],
                                u = c[1],
                                l = c[2],
                                p = c[3];
                            return s !== r || u !== a || l !== o || !0 === ("object" == typeof i && i ? i.capture : i) != (!0 === ("object" == typeof p && p ? p.capture : p))
                        }([t, n, r, a], e)
                    }))
                }
            }
        },
        De = "__privateStripeMetricsController",
        qe = "merchant",
        Be = "session",
        Fe = "NA",
        Ue = function(e) {
            return 42 === e.length
        },
        Ye = function(e, t, n) {
            return n ? !e || !Ue(e) && Ue(t) ? t : e : h()
        },
        Ge = function() {
            function e() {
                var t = this,
                    n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                if (Object(o.a)(this, e), this._controllerFrame = null, this._latencies = [], this._handleMessage = function(e) {
                        return function(n) {
                            var r = n.data,
                                a = n.origin;
                            if (Object(me.c)(a) && "string" == typeof r) try {
                                var o = JSON.parse(r),
                                    i = o.originatingScript,
                                    c = o.payload;
                                if ("m2" === i) {
                                    var s = c.guid,
                                        u = c.muid,
                                        l = c.sid;
                                    t._guid = s, t._muid = t._getID(qe, u), t._sid = t._getID(Be, l), e()
                                }
                            } catch (e) {}
                        }
                    }, n.checkoutIds) {
                    var r = n.checkoutIds,
                        a = r.muid,
                        i = r.sid;
                    this._guid = Fe, this._muid = a, this._sid = i, this._doNotPersist = "NA" !== a && "NA" !== i
                } else this._guid = Fe, this._muid = this._getID(qe), this._sid = this._getID(Be), this._doNotPersist = !1;
                this._listenerRegistry = Le(), this._idsPromise = new u.a((function(e) {
                    t._establishMessageChannel(e)
                })), this._id = _(De), Re && (this._controllerFrame = new L({
                    type: p.c.METRICS_CONTROLLER,
                    controllerId: this._id,
                    listenerRegistry: this._listenerRegistry,
                    autoload: !0,
                    appParams: this._buildFrameQueryString()
                }), this._startIntervalCheck(), setTimeout(this._testLatency.bind(this), 2e3 + 500 * Math.random()))
            }
            return Object(i.a)(e, [{
                key: "ids",
                value: function() {
                    return {
                        guid: this._guid,
                        muid: this._muid,
                        sid: this._sid
                    }
                }
            }, {
                key: "idsPromise",
                value: function() {
                    var e = this;
                    return this._idsPromise.then((function() {
                        return e.ids()
                    }))
                }
            }, {
                key: "_establishMessageChannel",
                value: function(e) {
                    if (!Re) return this._guid = h(), void e();
                    this._listenerRegistry.addEventListener(window, "message", this._handleMessage(e))
                }
            }, {
                key: "_startIntervalCheck",
                value: function() {
                    var e = this,
                        t = window.location.href;
                    setInterval((function() {
                        var n = window.location.href;
                        n !== t && (e.send((function(e) {
                            return {
                                action: "ping",
                                payload: {
                                    sid: e.sid,
                                    muid: e.muid,
                                    title: document.title,
                                    referrer: document.referrer,
                                    url: document.location.href,
                                    version: 6
                                }
                            }
                        })), t = n)
                    }), 5e3)
                }
            }, {
                key: "report",
                value: function(e, t) {
                    this.send((function(n) {
                        return {
                            action: "track",
                            payload: {
                                sid: n.sid,
                                muid: n.muid,
                                url: document.location.href,
                                source: e,
                                data: t,
                                version: 6
                            }
                        }
                    }))
                }
            }, {
                key: "send",
                value: function(e) {
                    var t = this;
                    this._idsPromise.then((function() {
                        try {
                            t._controllerFrame && t._controllerFrame.send(e(t.ids()))
                        } catch (e) {}
                    }))
                }
            }, {
                key: "_testLatency",
                value: function() {
                    var e = this,
                        t = new Date;
                    this._listenerRegistry.addEventListener(document, "mousemove", (function n() {
                        try {
                            var r = new Date;
                            e._latencies.push(r - t), e._latencies.length >= 10 && (e.report("mouse-timings-10", e._latencies), e._listenerRegistry.removeEventListener(document, "mousemove", n)), t = r
                        } catch (e) {}
                    }))
                }
            }, {
                key: "_extractMetaReferrerPolicy",
                value: function() {
                    var e = document.querySelector("meta[name=referrer]");
                    return null != e && e instanceof HTMLMetaElement ? e.content.toLowerCase() : null
                }
            }, {
                key: "_extractUrl",
                value: function(e) {
                    var t = document.location.href;
                    switch (e) {
                        case "origin":
                        case "strict-origin":
                        case "origin-when-cross-origin":
                        case "strict-origin-when-cross-origin":
                            return document.location.origin;
                        case "unsafe-url":
                            return t.split("#")[0];
                        default:
                            return t
                    }
                }
            }, {
                key: "_buildFrameQueryString",
                value: function() {
                    var e = this._extractMetaReferrerPolicy(),
                        t = this._extractUrl(e),
                        n = {
                            url: t,
                            title: document.title,
                            referrer: document.referrer,
                            muid: this._muid,
                            sid: this._sid,
                            version: 6,
                            preview: Object(me.c)(t)
                        };
                    return null != e && (n.metaReferrerPolicy = e), Object.keys(n).map((function(e) {
                        return null != n[e] ? "".concat(e, "=").concat(encodeURIComponent(n[e].toString())) : null
                    })).join("&")
                }
            }, {
                key: "_getID",
                value: function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : Fe;
                    switch (e) {
                        case qe:
                            if (this._doNotPersist) return Ye(this._muid, t, Re);
                            try {
                                var n = "__stripe_mid",
                                    r = Ye(ve(n), t, Re);
                                return Ue(r) && be({
                                    name: n,
                                    value: r,
                                    domain: ".".concat(document.location.hostname),
                                    protocol: document.location.protocol,
                                    sameSite: "Strict"
                                }), r
                            } catch (e) {
                                return Fe
                            }
                            case Be:
                                if (this._doNotPersist) return Ye(this._sid, t, Re);
                                try {
                                    var a = "__stripe_sid",
                                        o = Ye(ve(a), t, Re);
                                    return Ue(o) && be({
                                        name: a,
                                        value: o,
                                        domain: ".".concat(document.location.hostname),
                                        protocol: document.location.protocol,
                                        sameSite: "Strict",
                                        expiresIn: 18e5
                                    }), o
                                } catch (e) {
                                    return Fe
                                }
                                default:
                                    throw new Error("Invalid ID type specified: ".concat(e))
                    }
                }
            }]), e
        }(),
        He = null,
        ze = function() {
            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return He = new Ge(e)
        },
        We = !1,
        Ke = function() {
            var e = He;
            e && (We || (We = !0, e.send((function(e) {
                return {
                    action: "ping",
                    payload: {
                        v2: 2,
                        sid: e.sid,
                        muid: e.muid,
                        title: document.title,
                        referrer: document.referrer,
                        url: document.location.href,
                        version: 6
                    }
                }
            })), e.send((function(t) {
                return {
                    action: "track",
                    payload: {
                        sid: t.sid,
                        muid: t.muid,
                        url: document.location.href,
                        source: "mouse-timings-10-v2",
                        data: e._latencies,
                        version: 6
                    }
                }
            }))))
        },
        Ve = n(13),
        Je = !1,
        $e = function(e) {
            Je || "null" === (null != e ? e : window.origin) && (Je = !0, console.error("Stripe.js requires 'allow-same-origin' if sandboxed."))
        },
        Ze = n(29),
        Xe = !1,
        Qe = {},
        et = function(e, t) {
            return document.activeElement === e._iframe || e._iframe.parentElement && document.activeElement === t
        },
        tt = function(e) {
            return "object" == typeof e && null !== e && "IntegrationError" === e.name ? new O.a("string" == typeof e.message ? e.message : "") : e
        },
        nt = function() {
            function e(t) {
                var n = this;
                Object(o.a)(this, e), this._sendCAReq = function(e) {
                    var t = _(e.tag);
                    return new u.a((function(r, a) {
                        n._requests[t] = {
                            resolve: r,
                            reject: a
                        }, n._controllerFrame.send({
                            action: "stripe-safe-controller-action-request",
                            payload: {
                                nonce: t,
                                caReq: e
                            }
                        })
                    }))
                }, this.keyMode = function() {
                    return Object(d.c)(n._apiKey)
                }, this.action = {
                    retrievePaymentIntent: function(e) {
                        return n._sendCAReq({
                            tag: "RETRIEVE_PAYMENT_INTENT",
                            value: e
                        })
                    },
                    confirmPaymentIntent: function(e) {
                        return n._sendCAReq({
                            tag: "CONFIRM_PAYMENT_INTENT",
                            value: e
                        })
                    },
                    createConsumerPaymentDetails: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_CONSUMER_PAYMENT_DETAILS",
                            value: e
                        })
                    },
                    completeLinkPayment: function(e) {
                        return n._sendCAReq({
                            tag: "COMPLETE_LINK_PAYMENT",
                            value: e
                        })
                    },
                    completeLinkSetup: function(e) {
                        return n._sendCAReq({
                            tag: "COMPLETE_LINK_SETUP",
                            value: e
                        })
                    },
                    createBankPaymentDetails: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_BANK_PAYMENT_DETAILS",
                            value: e
                        })
                    },
                    cancelPaymentIntentSource: function(e) {
                        return n._sendCAReq({
                            tag: "CANCEL_PAYMENT_INTENT_SOURCE",
                            value: e
                        })
                    },
                    confirmSetupIntent: function(e) {
                        return n._sendCAReq({
                            tag: "CONFIRM_SETUP_INTENT",
                            value: e
                        })
                    },
                    retrieveSetupIntent: function(e) {
                        return n._sendCAReq({
                            tag: "RETRIEVE_SETUP_INTENT",
                            value: e
                        })
                    },
                    cancelSetupIntentSource: function(e) {
                        return n._sendCAReq({
                            tag: "CANCEL_SETUP_INTENT_SOURCE",
                            value: e
                        })
                    },
                    lookupLocale: function(e) {
                        return n._sendCAReq({
                            tag: "LOOKUP_LOCALE",
                            value: e
                        })
                    },
                    fetchLocale: function(e) {
                        return n._sendCAReq({
                            tag: "FETCH_LOCALE",
                            value: e
                        })
                    },
                    updateCSSFonts: function(e) {
                        return n._sendCAReq({
                            tag: "UPDATE_CSS_FONTS",
                            value: e
                        })
                    },
                    createApplePaySession: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_APPLE_PAY_SESSION",
                            value: e
                        })
                    },
                    retrieveSource: function(e) {
                        return n._sendCAReq({
                            tag: "RETRIEVE_SOURCE",
                            value: e
                        })
                    },
                    tokenizeWithElement: function(e) {
                        return n._sendCAReq({
                            tag: "TOKENIZE_WITH_ELEMENT",
                            value: e
                        })
                    },
                    tokenizeCvcUpdate: function(e) {
                        return n._sendCAReq({
                            tag: "TOKENIZE_CVC_UPDATE",
                            value: e
                        })
                    },
                    tokenizeWithData: function(e) {
                        return n._sendCAReq({
                            tag: "TOKENIZE_WITH_DATA",
                            value: e
                        })
                    },
                    createSourceWithElement: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_SOURCE_WITH_ELEMENT",
                            value: e
                        })
                    },
                    createSourceWithData: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_SOURCE_WITH_DATA",
                            value: e
                        })
                    },
                    createPaymentMethodWithElement: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_PAYMENT_METHOD_WITH_ELEMENT",
                            value: e
                        })
                    },
                    createPaymentMethodWithData: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_PAYMENT_METHOD_WITH_DATA",
                            value: e
                        })
                    },
                    createPaymentPage: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_PAYMENT_PAGE",
                            value: e
                        })
                    },
                    createPaymentPageWithSession: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_PAYMENT_PAGE_WITH_SESSION",
                            value: e
                        })
                    },
                    createRadarSession: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_RADAR_SESSION",
                            value: e
                        })
                    },
                    authenticate3DS2: function(e) {
                        return n._sendCAReq({
                            tag: "AUTHENTICATE_3DS2",
                            value: e
                        })
                    },
                    verifyMicrodepositsForPayment: function(e) {
                        return n._sendCAReq({
                            tag: "VERIFY_MICRODEPOSITS_FOR_PAYMENT",
                            value: e
                        })
                    },
                    verifyMicrodepositsForSetup: function(e) {
                        return n._sendCAReq({
                            tag: "VERIFY_MICRODEPOSITS_FOR_SETUP",
                            value: e
                        })
                    },
                    retrieveIssuingCardWithoutNonce: function(e) {
                        return n._sendCAReq({
                            tag: "RETRIEVE_ISSUING_CARD_WITHOUT_NONCE",
                            value: e
                        })
                    },
                    retrieveIssuingCard: function(e) {
                        return n._sendCAReq({
                            tag: "RETRIEVE_ISSUING_CARD",
                            value: e
                        })
                    },
                    createEphemeralKeyNonce: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_EPHEMERAL_KEY_NONCE",
                            value: e
                        })
                    },
                    updatePaymentIntent: function(e) {
                        return n._sendCAReq({
                            tag: "UPDATE_PAYMENT_INTENT",
                            value: e
                        })
                    },
                    createAcssDebitSession: function(e) {
                        return n._sendCAReq({
                            tag: "CREATE_ACSS_DEBIT_SESSION",
                            value: e
                        })
                    },
                    confirmReturnIntent: function(e) {
                        return n._sendCAReq({
                            tag: "CONFIRM_RETURN_INTENT",
                            value: e
                        })
                    },
                    refreshPaymentIntent: function(e) {
                        return n._sendCAReq({
                            tag: "REFRESH_PAYMENT_INTENT",
                            value: e
                        })
                    },
                    refreshSetupIntent: function(e) {
                        return n._sendCAReq({
                            tag: "REFRESH_SETUP_INTENT",
                            value: e
                        })
                    },
                    attachLinkAccountSessionForPayment: function(e) {
                        return n._sendCAReq({
                            tag: "ATTACH_LINK_ACCOUNT_SESSION_FOR_PAYMENT",
                            value: e
                        })
                    },
                    attachLinkAccountSessionForSetup: function(e) {
                        return n._sendCAReq({
                            tag: "ATTACH_LINK_ACCOUNT_SESSION_FOR_SETUP",
                            value: e
                        })
                    },
                    localizeError: function(e) {
                        return n._sendCAReq({
                            tag: "LOCALIZE_ERROR",
                            value: e
                        })
                    },
                    retrieveElementsSession: function(e) {
                        return n._sendCAReq({
                            tag: "RETRIEVE_ELEMENTS_SESSION",
                            value: e
                        })
                    },
                    updateElementsOptions: function(e) {
                        return n._sendCAReq({
                            tag: "UPDATE_ELEMENTS_OPTIONS",
                            value: e
                        })
                    },
                    completeWalletConfirm: function(e) {
                        return n._sendCAReq({
                            tag: "COMPLETE_WALLET_CONFIRM",
                            value: e
                        })
                    }
                }, this.createElementFrame = function(e, t, a, o) {
                    var i = n._betas,
                        c = new ae({
                            type: e,
                            betas: i,
                            controllerId: n._id,
                            listenerRegistry: n._listenerRegistry,
                            appParams: Object(r.a)(Object(r.a)({}, o), {}, {
                                componentName: t,
                                keyMode: Object(d.c)(n._apiKey),
                                apiKey: n._apiKey
                            })
                        });
                    return n._setupFrame(c, e, a)
                }, this.createSecondaryElementFrame = function(e, t, a, o, i) {
                    var c = n._betas,
                        s = new fe({
                            type: e,
                            betas: c,
                            controllerId: n._id,
                            listenerRegistry: n._listenerRegistry,
                            appParams: Object(r.a)(Object(r.a)({}, i), {}, {
                                componentName: t,
                                primaryElementType: a,
                                keyMode: Object(d.c)(n._apiKey)
                            })
                        });
                    return n._setupFrame(s, e, o)
                }, this.createHiddenFrame = function(e, t) {
                    var r = new M({
                        type: e,
                        betas: n._betas,
                        controllerId: n._id,
                        listenerRegistry: n._listenerRegistry,
                        appParams: t
                    });
                    return n._setupFrame(r, e)
                }, this.getCredentials = function() {
                    return {
                        publishableKey: n._apiKey,
                        stripeAccount: n._stripeAccount,
                        apiVersion: n._apiVersion
                    }
                }, this.createLightboxFrame = function(e) {
                    var t = e.type,
                        a = e.options,
                        o = new pe({
                            type: t,
                            controllerId: n._id,
                            listenerRegistry: n._listenerRegistry,
                            options: Object(r.a)(Object(r.a)({}, a), {}, {
                                betas: n._betas
                            })
                        }),
                        i = "LINK_AUTOFILL_MODAL" === e.type ? e.groupId : null;
                    return n._setupFrame(o, t, i)
                }, this._setupFrame = function(e, t, r) {
                    return n._frames[e.id] = e, n._controllerFrame.sendPersistent({
                        action: "stripe-user-createframe",
                        payload: {
                            newFrameId: e.id,
                            frameType: t,
                            groupId: r
                        }
                    }), e._on("unload", (function() {
                        n._controllerFrame.sendPersistent({
                            action: "stripe-frame-unload",
                            payload: {
                                unloadedFrameId: e.id
                            }
                        })
                    })), e._on("destroy", (function() {
                        delete n._frames[e.id], n._controllerFrame.sendPersistent({
                            action: "stripe-frame-destroy",
                            payload: {
                                destroyedFrameId: e.id
                            }
                        })
                    })), e._on("load", (function() {
                        n._controllerFrame.sendPersistent({
                            action: "stripe-frame-load",
                            payload: {
                                loadedFrameId: e.id
                            }
                        }), n._controllerFrame.loaded && e.send({
                            action: "stripe-controller-load",
                            payload: {}
                        })
                    })), e
                }, this.report = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    n._controllerFrame.send({
                        action: "stripe-controller-report",
                        payload: {
                            event: e,
                            data: t
                        }
                    })
                }, this.warn = function() {
                    for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    n._controllerFrame.send({
                        action: "stripe-controller-warn",
                        payload: {
                            args: t
                        }
                    })
                }, this.controllerFor = function() {
                    return "outer"
                }, this._setupPostMessage = function() {
                    n._listenerRegistry.addEventListener(window, "message", (function(e) {
                        var t = e.data,
                            r = e.origin,
                            a = e.source,
                            o = Object(g.a)(t);
                        o && (Object(me.a)(p.k, r) ? n._handleMessage(o, a) : $e(r))
                    }))
                }, this._nodeIsKnownElement = function(e) {
                    return e && "IFRAME" === e.nodeName && !!n._frames[e.getAttribute("name") || ""]
                }, this._handleMessage = function(e, t) {
                    var a = e.controllerId,
                        o = e.frameId,
                        i = e.message,
                        c = n._frames[o];
                    if (a === n._id) switch (i.action) {
                        case "stripe-frame-event":
                            var s = i.payload.event,
                                u = i.payload.data;
                            if (c) {
                                if (V) {
                                    var l = c._iframe.parentElement,
                                        p = l && l.querySelector(".".concat(Ze.c));
                                    if ("focus" === s && !Xe && p && !et(c, p) && !Qe[o]) {
                                        p.focus(), Xe = !0, Qe[o] = !0, setTimeout((function() {
                                            Qe[o] = !1
                                        }), 1e3);
                                        break
                                    }
                                    if ("blur" === s && Xe) {
                                        Xe = !1;
                                        break
                                    }
                                    "blur" === s && ne && setTimeout((function() {
                                        var e = document.activeElement;
                                        if (e && !et(c, p) && !he(e) && !n._nodeIsKnownElement(e)) {
                                            var t = l && l.querySelector(".".concat(Ze.d));
                                            if (t) {
                                                var r = t;
                                                r.disabled = !1, r.focus(), r.blur(), r.disabled = !0
                                            }
                                            e.focus()
                                        }
                                    }), 400)
                                }
                                "load" === s && (u = Object(r.a)(Object(r.a)({}, u), {}, {
                                    source: t
                                })), c._emit(s, u)
                            }
                            break;
                        case "stripe-frame-action-response":
                            c && c.resolve(i.payload.nonce, i.payload.faRes);
                            break;
                        case "stripe-frame-action-error":
                            c && c.reject(i.payload.nonce, tt(i.payload.faErr));
                            break;
                        case "stripe-frame-error":
                            throw new O.a(i.payload.message);
                        case "stripe-integration-error":
                            c && c._emit("__privateIntegrationError", {
                                message: i.payload.message
                            });
                            break;
                        case "stripe-controller-load":
                            n._controllerFrame._emit("load", {
                                source: t
                            }), n._loadCount++, Object.keys(n._frames).forEach((function(e) {
                                return n._frames[e].send({
                                    action: "stripe-controller-load",
                                    payload: {}
                                })
                            }));
                            var d = n._createTimestamp.getAsPosixTime(),
                                f = {
                                    stripeJsLoad: n._stripeJsLoadTimestamp.getAsPosixTime(),
                                    stripeCreate: d,
                                    create: d
                                };
                            n._mountTimestamp && (f.mount = n._mountTimestamp.getAsPosixTime()), n._controllerFrame.send({
                                action: "stripe-user-mount",
                                payload: {
                                    timestamps: f,
                                    loadCount: n._loadCount,
                                    matchFrame: t === n._controllerFrame._iframe.contentWindow,
                                    rtl: !1,
                                    paymentRequestButtonType: null
                                }
                            });
                            break;
                        case "stripe-safe-controller-action-response":
                            n._requests[i.payload.nonce] && n._requests[i.payload.nonce].resolve(i.payload.caRes);
                            break;
                        case "stripe-safe-controller-action-error":
                            n._requests[i.payload.nonce] && n._requests[i.payload.nonce].reject(tt(i.payload.caErr));
                            break;
                        case "stripe-api-call":
                            Ke();
                            break;
                        case "show-wallet":
                            var m = n._frames[i.payload.frameId];
                            m && m._emit("show-wallet", i.payload.wallet)
                    }
                };
                var a = t.listenerRegistry,
                    i = t.stripeJsLoadTimestamp,
                    c = t.stripeCreateTimestamp,
                    l = t.onFirstLoad,
                    f = t.betas,
                    m = Object(s.a)(t, ["listenerRegistry", "stripeJsLoadTimestamp", "stripeCreateTimestamp", "onFirstLoad", "betas"]),
                    h = m.apiKey,
                    y = m.apiVersion,
                    b = m.stripeAccount,
                    v = m.stripeJsId,
                    j = m.locale;
                this._id = _("__privateStripeController"), this._stripeJsId = v, this._apiKey = h, this._apiVersion = y, this._stripeAccount = b, this._listenerRegistry = a, this._betas = f, this._controllerFrame = new L({
                    type: p.c.CONTROLLER,
                    betas: f,
                    controllerId: this._id,
                    listenerRegistry: a,
                    appParams: Object(r.a)(Object(r.a)({}, m), {}, {
                        betas: f,
                        stripeJsLoadTime: i.getAsPosixTime()
                    })
                }), this._stripeJsLoadTimestamp = i, this._createTimestamp = c, this._loadCount = 0;
                var E = function(e) {
                    var t = e.anchor;
                    n._mountTimestamp = new Ve.a, t !== document.body && n.report("controller.mount.custom_container")
                };
                this._controllerFrame._isMounted() ? E({
                    anchor: this._controllerFrame._iframe.parentElement
                }) : this._controllerFrame._once("mount", E), l && this._controllerFrame._once("load", l), this._frames = {}, this._requests = {}, this._setupPostMessage(), this._handleMessage = k(this._handleMessage, this), this.action.fetchLocale({
                    locale: j || "auto"
                })
            }
            return Object(i.a)(e, [{
                key: "registerWrapper",
                value: function(e) {
                    this._controllerFrame.send({
                        action: "stripe-wrapper-register",
                        payload: {
                            stripeWrapperLibrary: e
                        }
                    })
                }
            }, {
                key: "registerAppInfo",
                value: function(e) {
                    this._controllerFrame.send({
                        action: "stripe-app-info-register",
                        payload: {
                            wrapperLibrary: e
                        }
                    })
                }
            }]), e
        }(),
        rt = function() {
            var e = document.querySelectorAll("meta[name=viewport][content]"),
                t = e[e.length - 1];
            return t && t instanceof HTMLMetaElement ? t.content : ""
        },
        at = function(e) {
            return rt().match(e)
        },
        ot = n(24),
        it = n(5),
        ct = n(39),
        st = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n(e) {
                var r;
                return Object(o.a)(this, n), (r = t.call(this, e)).name = "NetworkError", r.type = "network_error", r.requestUrl = e, r
            }
            return n
        }(Object(ct.a)(Error)),
        ut = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n(e, r) {
                var a;
                return Object(o.a)(this, n), (a = t.call(this)).name = "FetchError", a.type = "fetch_error", a.message = "Error fetching ".concat(r), a.requestUrl = r, "string" == typeof e ? a.message += ": ".concat(e) : (a.originalError = e, a.message += ": ".concat(e.message)), a
            }
            return n
        }(Object(ct.a)(Error)),
        lt = function e(t) {
            return new u.a((function(n, a) {
                var o = t.method,
                    i = t.url,
                    c = t.data,
                    s = t.headers,
                    l = t.withCredentials,
                    p = t.contentType,
                    d = void 0 === p ? "application/x-www-form-urlencoded" : p,
                    f = "";
                c && "application/x-www-form-urlencoded" === d ? f = Object(v.a)(c) : c && "application/json" === d && (f = JSON.stringify(c));
                var m = "GET" === o && f ? "".concat(i, "?").concat(f) : i,
                    _ = "GET" === o ? "" : f,
                    h = new XMLHttpRequest;
                l && (h.withCredentials = l), h.open(o, m, !0), h.setRequestHeader("Accept", "application/json"), h.setRequestHeader("Content-Type", d), h.json = function() {
                    return new u.a((function(e, t) {
                        try {
                            e(JSON.parse(h.responseText))
                        } catch (e) {
                            t(new ut(e, m))
                        }
                    }))
                }, s && Object.keys(s).forEach((function(e) {
                    var t = s[e];
                    "string" == typeof t && h.setRequestHeader(e, t)
                })), h.onreadystatechange = function() {
                    4 === h.readyState && (h.onreadystatechange = function() {}, 0 === h.status ? l ? a(new st(m)) : e(Object(r.a)(Object(r.a)({}, t), {}, {
                        withCredentials: !0
                    })).then(n, a) : n(h))
                };
                try {
                    h.send(_)
                } catch (e) {
                    a(new ut(e, m))
                }
            }))
        },
        pt = function(e, t) {
            var n = e.reduce((function(e, n) {
                var a = function(e, t) {
                        var n = e.indexOf(":");
                        if (-1 === n) throw new O.a("Invalid css declaration in file from ".concat(t, ': "').concat(e, '"'));
                        var r = e.slice(0, n).trim(),
                            a = p.a[r];
                        if (!a) throw new O.a("Unsupported css property in file from ".concat(t, ': "').concat(r, '"'));
                        return {
                            property: a,
                            value: e.slice(n + 1).trim()
                        }
                    }(n, t),
                    o = a.property,
                    i = a.value;
                return Object(r.a)(Object(r.a)({}, e), {}, Object(c.a)({}, o, i))
            }), {});
            return ["family", "src"].forEach((function(e) {
                if (!n[e]) throw new O.a("Missing css property in file from ".concat(t, ': "').concat(p.h[e], '"'))
            })), n
        },
        dt = function(e) {
            return lt({
                url: e,
                method: "GET"
            }).then((function(e) {
                return e.responseText
            })).then((function(t) {
                return function(e, t) {
                    var n = e.match(/@font-face[ ]?{[^}]*}/g);
                    if (!n) throw new O.a("No @font-face rules found in file from ".concat(t));
                    return n
                }(t, e).map((function(t) {
                    var n, r = function(e, t) {
                        var n = e.replace(/\/\*.*\*\//g, "").trim(),
                            r = (n.length && /;$/.test(n) ? n : "".concat(n, ";")).match(/((([^;(]*\([^()]*\)[^;)]*)|[^;]+)+)(?=;)/g);
                        if (!r) throw new O.a("Found @font-face rule containing no valid font-properties in file from ".concat(t));
                        return r
                    }((n = t.match(/@font-face[ ]?{([^}]*)}/)) ? n[1] : "", e);
                    return pt(r, e)
                }))
            }))
        },
        ft = (Pe = [], function(e, t) {
            return Object(it.d)(t, it.a.stripe_js_beta_locales) || -1 === Pe.indexOf(e) ? e : "auto"
        }),
        mt = n(23),
        _t = function(e, t) {
            var n, r = "string" == typeof(n = e) && Object(ye.a)(Object.keys(mt.b), (function(e) {
                return e === n
            })) || null;
            if (!r || ! function(e, t) {
                    var n = it.b[e];
                    return !n || Object(it.d)(t, n)
                }(r, t)) {
                var a = "string" == typeof e ? e : typeof e;
                throw new O.a("A valid Element name must be provided. Valid Elements are:\n  ".concat(Object.keys(mt.b).filter((function(e) {
                    return !mt.b[e].beta
                })).join(", "), "; you passed: ").concat(a, "."))
            }
        },
        ht = n(8),
        yt = "1.2em",
        bt = "14px",
        vt = function(e) {
            var t = e.split(" ").map((function(e) {
                return parseInt(e.trim(), 10)
            }));
            return 1 === t.length || 2 === t.length ? 2 * t[0] : 3 === t.length || 4 === t.length ? t[0] + t[2] : 0
        },
        gt = function() {
            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : yt,
                t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : bt,
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "0",
                r = vt(n);
            if ("string" == typeof e && /^[0-9.]+px$/.test(e)) {
                var a = parseFloat(e.toString().replace(/[^0-9.]/g, ""));
                return "".concat(a + r, "px")
            }
            var o, i = parseFloat(e.toString().replace(/[^0-9.]/g, "")),
                c = parseFloat(bt.replace(/[^0-9.]/g, "")),
                s = parseFloat(t.toString().replace(/[^0-9.]/g, ""));
            if ("string" == typeof t && /^(\d+|\d*\.\d+)px$/.test(t)) o = s;
            else if ("string" == typeof t && /^(\d+|\d*\.\d+)em$/.test(t)) o = s * c;
            else if ("string" == typeof t && /^(\d+|\d*\.\d+)%$/.test(t)) o = s / 100 * c;
            else {
                if ("string" != typeof t || !/^[\d.]+$/.test(t) && !/^\d*\.(px|em|%)$/.test(t)) return "100%";
                o = c
            }
            var u = i * o + r,
                l = "".concat(u, "px");
            return /^[0-9.]+px$/.test(l) ? l : "100%"
        },
        Ot = n(38),
        jt = function(e, t) {
            return e.reduce((function(e, n) {
                return e.then((function(e) {
                    return "SATISFIED" === e.type ? e : n().then((function(e) {
                        return t(e) ? {
                            type: "SATISFIED",
                            value: e
                        } : {
                            type: "UNSATISFIED"
                        }
                    }))
                }))
            }), u.a.resolve({
                type: "UNSATISFIED"
            }))
        },
        Et = "40px",
        wt = {
            success: "success",
            fail: "fail",
            invalid_shipping_address: "invalid_shipping_address"
        },
        kt = {
            shipping: "shipping",
            delivery: "delivery",
            pickup: "pickup"
        },
        Pt = Object(r.a)({
            success: "success"
        }, {
            fail: "fail",
            invalid_payer_name: "invalid_payer_name",
            invalid_payer_email: "invalid_payer_email",
            invalid_payer_phone: "invalid_payer_phone",
            invalid_shipping_address: "invalid_shipping_address"
        }),
        St = {
            merchantCapabilities: ["supports3DS"],
            displayItems: []
        },
        At = Object(l.u)({
            amount: l.k,
            label: l.x,
            pending: Object(l.s)(l.b)
        }),
        Tt = Object(l.u)({
            amount: l.c,
            label: l.x,
            pending: Object(l.s)(l.b)
        }),
        It = Object(l.u)({
            amount: l.c,
            label: l.x,
            pending: Object(l.s)(l.b),
            id: Object(l.G)(l.x, (function() {
                return _("shippingOption")
            })),
            detail: Object(l.G)(l.x, (function() {
                return ""
            }))
        }),
        Ct = l.q.apply(void 0, Object(a.a)(Object.keys(kt))),
        Nt = Object(l.u)({
            origin: l.x,
            name: l.x
        }),
        Rt = Object(l.u)({
            displayItems: Object(l.s)(Object(l.a)(Tt)),
            shippingOptions: Object(l.s)(Object(l.C)("id")(Object(l.a)(It))),
            wallets: Object(l.s)(Object(l.a)(l.A)),
            disableWallets: Object(l.s)(Object(l.a)(l.A)),
            total: At,
            requestShipping: Object(l.s)(l.b),
            requestPayerName: Object(l.s)(l.b),
            requestPayerEmail: Object(l.s)(l.b),
            requestPayerPhone: Object(l.s)(l.b),
            shippingType: Object(l.s)(Ct),
            currency: l.z,
            country: l.y,
            jcbEnabled: Object(l.s)(l.b),
            __billingDetailsEmailOverride: Object(l.s)(l.x),
            __minApplePayVersion: Object(l.s)(l.n),
            __merchantDetails: Object(l.s)(Nt),
            __isCheckout: Object(l.s)(l.b),
            __betas: Object(l.s)(Object(l.a)(l.r.apply(void 0, Object(a.a)(it.c))))
        }),
        xt = Object(l.d)({
            currency: Object(l.s)(l.z),
            displayItems: Object(l.s)(Object(l.a)(Tt)),
            shippingOptions: Object(l.s)(Object(l.C)("id")(Object(l.a)(It))),
            total: Object(l.s)(At)
        }),
        Mt = Object(l.u)({
            displayItems: Object(l.s)(Object(l.a)(Tt)),
            shippingOptions: Object(l.s)(Object(l.C)("id")(Object(l.a)(It))),
            total: Object(l.s)(At),
            status: function(e, t) {
                return l.q.apply(void 0, Object(a.a)(Object.keys(wt)))(-1 !== ["invalid_payer_name", "invalid_payer_email", "invalid_payer_phone"].indexOf(e) ? "fail" : e, t)
            }
        }),
        Lt = l.q.apply(void 0, Object(a.a)(Object.keys(Pt))),
        Dt = n(30),
        qt = function() {
            return window.ApplePaySession ? ["APPLE_PAY"] : ["GOOGLE_PAY", "BROWSER"]
        },
        Bt = function(e) {
            var t = [];
            return window.ApplePaySession ? Object(Dt.b)(e, Dt.a.applePay) && t.push("APPLE_PAY") : (Object(Dt.b)(e, Dt.a.googlePay) && (t.push("GOOGLE_PAY"), J && t.push("BROWSER")), Object(Dt.b)(e, Dt.a.browserCard) && -1 === t.indexOf("BROWSER") && t.push("BROWSER")), t
        },
        Ft = n(28),
        Ut = function() {
            try {
                return window.location.origin === window.top.location.origin
            } catch (e) {
                return !1
            }
        },
        Yt = Object(Ft.b)((function(e) {
            return window.ApplePaySession.canMakePaymentsWithActiveCard(e)
        })),
        Gt = function() {
            return u.a.resolve(window.ApplePaySession.canMakePayments())
        },
        Ht = function(e) {
            if (!window.ApplePaySession) return !1;
            try {
                return window.ApplePaySession.supportsVersion(e)
            } catch (e) {
                return !1
            }
        },
        zt = ["mastercard", "visa"],
        Wt = ["AT", "AU", "BE", "CA", "CH", "DE", "DK", "EE", "ES", "FI", "FR", "GB", "GR", "HK", "IE", "IT", "JP", "LT", "LU", "LV", "MX", "NL", "NO", "NZ", "PL", "PT", "SE", "SG", "US"],
        Kt = function(e, t) {
            var n = "US" === e || t ? ["discover", "diners", "jcb"].concat(zt) : zt;
            return -1 !== Wt.indexOf(e) ? ["amex"].concat(Object(a.a)(n)) : n
        },
        Vt = {
            bif: 1,
            clp: 1,
            djf: 1,
            gnf: 1,
            jpy: 1,
            kmf: 1,
            krw: 1,
            mga: 1,
            pyg: 1,
            rwf: 1,
            vnd: 1,
            vuv: 1,
            xaf: 1,
            xof: 1,
            xpf: 1,
            bhd: 1e3,
            jod: 1e3,
            kwd: 1e3,
            omr: 1e3,
            tnd: 1e3
        },
        Jt = function(e, t) {
            var n = function(e) {
                    var t = Vt[e.toLowerCase()] || 100;
                    return {
                        unitSize: 1 / t,
                        fractionDigits: Math.ceil(Math.log(t) / Math.log(10))
                    }
                }(t),
                r = n.unitSize,
                a = n.fractionDigits;
            return (e * r).toFixed(a)
        },
        $t = function(e, t) {
            return {
                amount: Jt(e.amount, t.currency),
                label: e.label,
                type: e.pending ? "pending" : "final"
            }
        },
        Zt = function(e, t) {
            return new window.ApplePayError(e, t)
        },
        Xt = function(e) {
            return function(t) {
                return t[e] && "string" == typeof t[e] ? t[e].toUpperCase() : null
            }
        },
        Qt = (Se = {}, Object(c.a)(Se, Pt.success, 0), Object(c.a)(Se, Pt.fail, 1), Object(c.a)(Se, Pt.invalid_payer_name, 2), Object(c.a)(Se, Pt.invalid_shipping_address, 3), Object(c.a)(Se, Pt.invalid_payer_phone, 4), Object(c.a)(Se, Pt.invalid_payer_email, 4), Se),
        en = (Ae = {}, Object(c.a)(Ae, Pt.success, (function() {
            return null
        })), Object(c.a)(Ae, Pt.fail, (function() {
            return null
        })), Object(c.a)(Ae, Pt.invalid_payer_name, (function() {
            return Zt("billingContactInvalid", "name")
        })), Object(c.a)(Ae, Pt.invalid_shipping_address, (function() {
            return Zt("shippingContactInvalid", "postalAddress")
        })), Object(c.a)(Ae, Pt.invalid_payer_phone, (function() {
            return Zt("shippingContactInvalid", "phoneNumber")
        })), Object(c.a)(Ae, Pt.invalid_payer_email, (function() {
            return Zt("shippingContactInvalid", "emailAddress")
        })), Ae),
        tn = (Te = {}, Object(c.a)(Te, kt.pickup, "storePickup"), Object(c.a)(Te, kt.shipping, "shipping"), Object(c.a)(Te, kt.delivery, "delivery"), Te),
        nn = {
            total: function(e) {
                return $t(e.total, e)
            },
            lineItems: function(e) {
                return e.displayItems ? e.displayItems.map((function(t) {
                    return $t(t, e)
                })) : []
            },
            shippingMethods: function(e) {
                return e.shippingOptions ? e.shippingOptions.map((function(t) {
                    return function(e, t) {
                        return {
                            amount: Jt(e.amount, t.currency),
                            label: e.label,
                            detail: e.detail,
                            identifier: e.id
                        }
                    }(t, e)
                })) : []
            },
            applicationData: function(e) {
                return e.applicationData || null
            }
        },
        rn = {
            shippingType: function(e) {
                var t = e.shippingType;
                if (!t) return null;
                var n = tn[t];
                if (void 0 !== n) return n;
                throw new O.a("Invalid value for shippingType: ".concat(t))
            },
            requiredBillingContactFields: function(e) {
                return e.requestPayerName ? ["postalAddress"] : null
            },
            requiredShippingContactFields: function(e) {
                var t = [];
                return e.requestShipping && t.push("postalAddress"), e.requestPayerEmail && t.push("email"), e.requestPayerPhone && t.push("phone"), t.length ? t : null
            },
            countryCode: Xt("country"),
            currencyCode: Xt("currency"),
            merchantCapabilities: function(e) {
                var t = e.merchantCapabilities || St.merchantCapabilities;
                return e.__betas && Object(it.d)(e.__betas, "cup_apple_pay_beta_1") && t.push("supportsEMV"), t
            },
            supportedNetworks: function(e) {
                var t, n, r = (t = e.country, n = e.jcbEnabled || !1, Kt(t, n).reduce((function(e, t) {
                    return "mastercard" === t ? [].concat(Object(a.a)(e), ["masterCard"]) : "diners" === t ? e : [].concat(Object(a.a)(e), [t])
                }), []));
                return Ht(4) && r.push("maestro"), e.__betas && Object(it.d)(e.__betas, "cup_apple_pay_beta_1") && r.push("chinaUnionPay"), r
            }
        },
        an = {
            status: function(e) {
                var t = Qt[e.status];
                return Ht(3) && t > 1 ? 1 : t
            },
            error: function(e) {
                return Ht(3) ? en[e.status]() : null
            }
        },
        on = Object(r.a)(Object(r.a)({}, nn), rn),
        cn = Object(r.a)(Object(r.a)({}, nn), an),
        sn = function(e) {
            return Object.keys(cn).reduce((function(t, n) {
                var a = (0, cn[n])(e);
                return null !== a ? Object(r.a)(Object(r.a)({}, t), {}, Object(c.a)({}, n, a)) : t
            }), {})
        },
        un = function(e) {
            return "string" == typeof e ? e : null
        },
        ln = function(e) {
            return e ? un(e.phoneNumber) : null
        },
        pn = function(e) {
            return e ? un(e.emailAddress) : null
        },
        dn = function(e) {
            return e ? [e.givenName, e.familyName].filter((function(e) {
                return e && "string" == typeof e
            })).join(" ") : null
        },
        fn = function(e) {
            var t = e.addressLines,
                n = e.countryCode,
                r = e.postalCode,
                o = e.administrativeArea,
                i = e.locality,
                c = e.phoneNumber,
                s = un(n);
            return {
                addressLine: Array.isArray(t) ? t.reduce((function(e, t) {
                    return "string" == typeof t ? [].concat(Object(a.a)(e), [t]) : e
                }), []) : [],
                country: s ? s.toUpperCase() : "",
                postalCode: un(r) || "",
                recipient: dn(e) || "",
                region: un(o) || "",
                city: un(i) || "",
                phone: un(c) || "",
                sortingCode: "",
                dependentLocality: "",
                organization: ""
            }
        },
        mn = function(e, t) {
            var n = e.identifier,
                r = e.label;
            return t.filter((function(e) {
                return e.id === n && e.label === r
            }))[0]
        },
        _n = function(e, t) {
            var n = e.shippingContact,
                r = e.shippingMethod,
                a = e.billingContact;
            return {
                shippingOption: r && t.shippingOptions && t.shippingOptions.length ? mn(r, t.shippingOptions) : null,
                shippingAddress: n ? fn(n) : null,
                payerEmail: pn(n),
                payerPhone: ln(n),
                payerName: dn(a),
                walletName: "applePay",
                methodName: "apple-pay"
            }
        },
        hn = {
            austria: "AT",
            sterreich: "AT",
            csterreich: "AT",
            au: "AU",
            australia: "AU",
            belgium: "BE",
            br: "BR",
            brasil: "BR",
            brazil: "BR",
            ca: "CA",
            canada: "CA",
            ch: "CH",
            schweiz: "CH",
            switzerland: "CH",
            china: "CN",
            czechrepublic: "CZ",
            de: "DE",
            deutschland: "DE",
            germany: "DE",
            danmark: "DK",
            denmark: "DK",
            es: "ES",
            espaa: "ES",
            spain: "ES",
            finland: "FI",
            suomi: "FI",
            fr: "FR",
            hk: "HK",
            hongkong: "HK",
            england: "GB",
            gb: "GB",
            uk: "GB",
            unitedkingdom: "GB",
            scotland: "GB",
            wales: "GB",
            it: "IT",
            italy: "IT",
            italia: "IT",
            japan: "JP",
            lietuva: "LT",
            luxembourg: "LU",
            netherlands: "NL",
            nederland: "NL",
            norway: "NO",
            poland: "PL",
            polska: "PL",
            russia: "RU",
            saudiarabia: "SA",
            se: "SE",
            sweden: "SE",
            sverige: "SE",
            singapore: "SG",
            us: "US",
            usa: "US",
            unitedstatesofamerica: "US",
            unitedstates: "US",
            estadosunidos: "US"
        },
        yn = function(e, t) {
            return e && "object" == typeof e ? t(e) : null
        },
        bn = function() {
            function e(t) {
                var n = this;
                Object(o.a)(this, e), this._onEvent = function() {}, this.setEventHandler = function(e) {
                    n._onEvent = e
                }, this.canMakePayment = function(e) {
                    var t = e.skipEnrollmentChecks;
                    return function(e, t, n, r) {
                        var a = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : 2,
                            o = arguments.length > 5 ? arguments[5] : void 0,
                            i = Math.max(2, a);
                        if (window.ApplePaySession) {
                            if (Ut()) {
                                if (window.ApplePaySession.supportsVersion(i)) {
                                    var c = "merchant.".concat((t ? [e, t] : [e]).join("."), ".stripe");
                                    return o ? Gt() : Yt(c).then((function(a) {
                                        if (r("pr.apple_pay.can_make_payment_native_response", {
                                                available: a
                                            }), n && !a && window.console) {
                                            var o = t ? "or stripeAccount parameter (".concat(t, ") ") : "";
                                            window.console.warn("Either you do not have a card saved to your Wallet or the current domain (".concat(e, ") ").concat(o, "is not registered for Apple Pay. Visit https://dashboard.stripe.com/account/apple_pay to register this domain."))
                                        }
                                        return a
                                    }))
                                }
                                return n && window.console && window.console.warn("This version of Safari does not support ApplePay JS version ".concat(i, ".")), u.a.resolve(!1)
                            }
                            return u.a.resolve(!1)
                        }
                        return u.a.resolve(!1)
                    }(window.location.hostname, n._authentication.accountId, Object(d.c)(n._authentication.apiKey) === d.a.test, n._report, n._minimumVersion, t)
                }, this.update = function(e) {
                    n._initialPaymentRequest = Object(we.d)(n._paymentRequestOptions, e), n._initializeSessionState()
                }, this.show = function() {
                    var e, t, a;
                    n._initializeSessionState();
                    try {
                        e = new window.ApplePaySession(n._minimumVersion, (t = n._paymentRequestOptions, a = Object(r.a)(Object(r.a)({}, St), t), Object.keys(on).reduce((function(e, t) {
                            var n = (0, on[t])(a);
                            return null !== n ? Object(r.a)(Object(r.a)({}, e), {}, Object(c.a)({}, t, n)) : e
                        }), {})))
                    } catch (e) {
                        throw "Must create a new ApplePaySession from a user gesture handler." === e.message ? new O.a("show() must be called from a user gesture handler (such as a click handler, after the user clicks a button).") : e
                    }
                    n._privateSession = e, n._setupSession(e, n._usesButtonElement()), e.begin(), n._isShowing = !0
                }, this.abort = function() {
                    n._privateSession && n._privateSession.abort()
                }, this._warn = function(e) {}, this._report = function(e, t) {
                    n._controller.report(e, Object(r.a)(Object(r.a)({}, t), {}, {
                        backingLibrary: "APPLE_PAY",
                        usesButtonElement: n._usesButtonElement()
                    }))
                }, this._validateMerchant = function(e, t) {
                    return function(r) {
                        n._controller.action.createApplePaySession({
                            data: {
                                validation_url: r.validationURL,
                                domain_name: window.location.hostname,
                                display_name: n._paymentRequestOptions.total.label
                            },
                            usesButtonElement: t
                        }).then((function(t) {
                            if (n._isShowing) switch (t.type) {
                                case "object":
                                    e.completeMerchantValidation(JSON.parse(t.object.session));
                                    break;
                                case "error":
                                    n._handleValidationError(e)(t.error);
                                    break;
                                default:
                                    Object(ht.a)(t)
                            }
                        }), n._handleValidationError(e))
                    }
                }, this._handleValidationError = function(e) {
                    return function(t) {
                        n._report("error.pr.apple_pay.session_creation_failed", {
                            error: t
                        }), e.abort();
                        var r = t.message;
                        "string" == typeof r && n._controller.warn(r)
                    }
                }, this._paymentAuthorized = function(e) {
                    return function(t) {
                        var a = t.payment,
                            o = n._usesButtonElement() ? p.b.paymentRequestButton : null;
                        n._controller.action.tokenizeWithData({
                            type: "apple_pay",
                            elementName: o,
                            tokenData: Object(r.a)(Object(r.a)({}, a), {}, {
                                billingContact: yn(a.billingContact, n._normalizeContact)
                            }),
                            mids: n._mids
                        }).then((function(t) {
                            if ("error" === t.type) e.completePayment(window.ApplePaySession.STATUS_FAILURE), n._report("error.pr.create_token_failed", {
                                error: t.error
                            });
                            else {
                                var o = yn(a.shippingContact, n._normalizeContact),
                                    i = yn(a.billingContact, n._normalizeContact);
                                o && n._paymentRequestOptions.requestShipping && !o.countryCode && e.completePayment(window.ApplePaySession.STATUS_INVALID_SHIPPING_POSTAL_ADDRESS);
                                var c = _n({
                                    shippingContact: o,
                                    billingContact: i
                                }, n._paymentRequestOptions);
                                n._onToken(e)(Object(r.a)(Object(r.a)({}, c), {}, {
                                    shippingOption: n._privateShippingOption,
                                    token: t.object
                                }))
                            }
                        }))
                    }
                }, this._normalizeContact = function(e) {
                    if (e.country && "string" == typeof e.country) {
                        var t, a = e.country.toLowerCase().replace(/[^a-z]+/g, "");
                        return e.countryCode ? "string" == typeof e.countryCode && (t = e.countryCode.toUpperCase()) : (t = hn[a]) || n._report("warn.pr.apple_pay.missing_country_code", {
                            country: e.country
                        }), Object(r.a)(Object(r.a)({}, e), {}, {
                            countryCode: t
                        })
                    }
                    return e
                }, this._onToken = function(e) {
                    return function(t) {
                        n._onEvent({
                            type: "paymentresponse",
                            payload: Object(r.a)(Object(r.a)({}, t), {}, {
                                complete: w(n._completePayment(e))
                            })
                        })
                    }
                }, this._completePayment = function(e) {
                    return function(t) {
                        n._paymentRequestOptions = Object(we.d)(n._paymentRequestOptions, {
                            status: t
                        });
                        var r = sn(n._paymentRequestOptions),
                            a = r.status,
                            o = r.error;
                        n._isShowing && (o ? e.completePayment({
                            status: a,
                            errors: [o]
                        }) : e.completePayment(a)), (0 === a || 1 === a && null == o) && (n._isShowing = !1, n._onEvent && n._onEvent({
                            type: "close"
                        }))
                    }
                }, this._shippingContactSelected = function(e) {
                    return function(t) {
                        n._onEvent({
                            type: "shippingaddresschange",
                            payload: {
                                shippingAddress: fn(n._normalizeContact(t.shippingContact)),
                                updateWith: w(n._completeShippingContactSelection(e))
                            }
                        })
                    }
                }, this._completeShippingContactSelection = function(e) {
                    return function(t) {
                        var r;
                        n._paymentRequestOptions = Object(we.d)(n._paymentRequestOptions, t), (null === (r = n._paymentRequestOptions.shippingOptions) || void 0 === r ? void 0 : r.length) && (n._privateShippingOption = n._paymentRequestOptions.shippingOptions[0]);
                        var a = sn(n._paymentRequestOptions),
                            o = a.status,
                            i = a.shippingMethods,
                            c = a.total,
                            s = a.lineItems;
                        e.completeShippingContactSelection(o, i, c, s)
                    }
                }, this._shippingMethodSelected = function(e) {
                    return function(t) {
                        if (n._paymentRequestOptions.shippingOptions) {
                            var r = mn(t.shippingMethod, n._paymentRequestOptions.shippingOptions);
                            n._privateShippingOption = r, n._onEvent({
                                type: "shippingoptionchange",
                                payload: {
                                    shippingOption: r,
                                    updateWith: w(n._completeShippingMethodSelection(e))
                                }
                            })
                        }
                    }
                }, this._completeShippingMethodSelection = function(e) {
                    return function(t) {
                        n._paymentRequestOptions = Object(we.d)(n._paymentRequestOptions, t);
                        var r = sn(n._paymentRequestOptions),
                            a = r.status,
                            o = r.total,
                            i = r.lineItems;
                        e.completeShippingMethodSelection(a, o, i)
                    }
                };
                var a = t.controller,
                    i = t.authentication,
                    s = t.mids,
                    l = t.options,
                    f = t.usesButtonElement,
                    m = t.listenerRegistry;
                this._controller = a, this._authentication = i, this._mids = s, this._minimumVersion = l.__minApplePayVersion || 2, this._usesButtonElement = f, this._listenerRegistry = m, this._initialPaymentRequest = l, this._isShowing = !1, this._initializeSessionState()
            }
            return Object(i.a)(e, [{
                key: "_initializeSessionState",
                value: function() {
                    var e = btoa(this._authentication.accountId ? "".concat(this._authentication.apiKey, ":").concat(this._authentication.accountId) : this._authentication.apiKey);
                    this._paymentRequestOptions = Object(r.a)(Object(r.a)(Object(r.a)({}, St), this._initialPaymentRequest), {}, {
                        status: Pt.success,
                        applicationData: e
                    }), this._privateSession = null, this._privateShippingOption = null;
                    var t = this._paymentRequestOptions.shippingOptions;
                    (null == t ? void 0 : t.length) && (this._privateShippingOption = t[0])
                }
            }, {
                key: "_setupSession",
                value: function(e, t) {
                    var n = this;
                    this._listenerRegistry.addEventListener(e, "validatemerchant", w(this._validateMerchant(e, t))), this._listenerRegistry.addEventListener(e, "paymentauthorized", w(this._paymentAuthorized(e))), this._listenerRegistry.addEventListener(e, "cancel", w((function() {
                        n._isShowing = !1, n._onEvent({
                            type: "cancel"
                        }), n._onEvent({
                            type: "close"
                        })
                    }))), this._listenerRegistry.addEventListener(e, "shippingcontactselected", w(this._shippingContactSelected(e))), this._listenerRegistry.addEventListener(e, "shippingmethodselected", w(this._shippingMethodSelected(e)))
                }
            }]), e
        }(),
        vn = null;
    var gn, On = function(e) {
            return null !== vn ? u.a.resolve(vn) : e().then((function(e) {
                return vn = e
            }))
        },
        jn = function(e) {
            return !(!ee && !te) && (!W && (!(!e.isCheckout && !window.PaymentRequest) && !(!e.isCheckout && J)))
        },
        En = function e(t) {
            var n = this;
            Object(o.a)(this, e), this._mids = null, this._frame = null, this._initFrame = function(e) {
                var t = n._controller.createHiddenFrame(p.c.PAYMENT_REQUEST_GOOGLE_PAY, {
                    authentication: n._authentication,
                    mids: n._mids,
                    origin: n._origin
                });
                t.send({
                    action: "stripe-pr-initialize",
                    payload: {
                        data: e
                    }
                }), n._initFrameEventHandlers(t), n._frame = t
            }, this._initFrameEventHandlers = function(e) {
                e._on("pr-cancel", (function() {
                    n._onEvent({
                        type: "cancel"
                    })
                })), e._on("pr-close", (function() {
                    n._backdrop.fadeOut().then((function() {
                        n._backdrop.unmount()
                    })), n._onEvent({
                        type: "close"
                    })
                })), e._on("pr-error", (function(e) {
                    n._onEvent({
                        type: "error",
                        payload: {
                            errorMessage: e.errorMessage,
                            errorCode: e.errorCode
                        }
                    })
                })), e._on("pr-callback", (function(t) {
                    var r = t.event,
                        a = t.options,
                        o = t.nonce;
                    switch (r) {
                        case "paymentresponse":
                            n._handlePaymentResponse(e, a, o);
                            break;
                        case "shippingaddresschange":
                            n._handleShippingAddressChange(e, a, o);
                            break;
                        case "shippingoptionchange":
                            n._handleShippingOptionChange(e, a, o);
                            break;
                        default:
                            throw new Error("Unexpected event name: ".concat(r))
                    }
                }))
            }, this._handlePaymentResponse = function(e, t, a) {
                n._onEvent({
                    type: "paymentresponse",
                    payload: Object(r.a)(Object(r.a)({}, t), {}, {
                        complete: function(t) {
                            e.send({
                                action: "stripe-pr-callback-complete",
                                payload: {
                                    nonce: a,
                                    data: {
                                        status: t
                                    }
                                }
                            })
                        }
                    })
                })
            }, this._handleShippingAddressChange = function(e, t, a) {
                n._onEvent({
                    type: "shippingaddresschange",
                    payload: Object(r.a)(Object(r.a)({}, t), {}, {
                        updateWith: function(t) {
                            e.send({
                                action: "stripe-pr-callback-complete",
                                payload: {
                                    nonce: a,
                                    data: t
                                }
                            })
                        }
                    })
                })
            }, this._handleShippingOptionChange = function(e, t, a) {
                n._onEvent({
                    type: "shippingoptionchange",
                    payload: Object(r.a)(Object(r.a)({}, t), {}, {
                        updateWith: function(t) {
                            e.send({
                                action: "stripe-pr-callback-complete",
                                payload: {
                                    nonce: a,
                                    data: t
                                }
                            })
                        }
                    })
                })
            }, this.setEventHandler = function(e) {
                n._onEvent = e
            }, this.canMakePayment = function() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                        skipEnrollmentChecks: !1
                    },
                    t = e.skipEnrollmentChecks;
                if (!jn({
                        isCheckout: n._isCheckout
                    })) return u.a.resolve(!1);
                if (!n._frame) throw new Error("Frame not initialized.");
                var r = n._frame;
                return On((function() {
                    return r.action.checkCanMakePayment({
                        skipEnrollmentChecks: t
                    }).then((function(e) {
                        return !0 === e.available
                    }))
                }))
            }, this.show = function() {
                n._frame && (n._frame.send({
                    action: "stripe-pr-show",
                    payload: {
                        data: {
                            usesButtonElement: n._usesButtonElement()
                        }
                    }
                }), n._backdrop.mount(), n._backdrop.show(), n._backdrop.fadeIn())
            }, this.update = function(e) {
                n._frame && n._frame.send({
                    action: "stripe-pr-update",
                    payload: {
                        data: e
                    }
                })
            }, this.abort = function() {
                n._frame && n._frame.send({
                    action: "stripe-pr-abort",
                    payload: {}
                })
            }, this._controller = t.controller, this._authentication = t.authentication, this._mids = t.mids, this._origin = t.origin, this._usesButtonElement = t.usesButtonElement, this._backdrop = new ue({
                lockScrolling: !1,
                lockFocus: !0,
                lockFocusOn: null,
                listenerRegistry: t.listenerRegistry
            }), this._isCheckout = !!t.options.__isCheckout, jn({
                isCheckout: this._isCheckout
            }) && this._controller && (this._controller.action.fetchLocale({
                locale: "auto"
            }), this._initFrame(t.options))
        },
        wn = function() {
            if (!window.PaymentRequest) return null;
            if (/CriOS\/59/.test(navigator.userAgent)) return null;
            if (/.*\(.*; wv\).*Chrome\/(?:53|54)\.\d.*/g.test(navigator.userAgent)) return null;
            if (X) return null;
            var e = window.PaymentRequest;
            return e.prototype.canMakePayment || (e.prototype.canMakePayment = function() {
                return u.a.resolve(!1)
            }), e
        }(),
        kn = null,
        Pn = function e(t) {
            var n = this;
            Object(o.a)(this, e), this._onEvent = function() {}, this.setEventHandler = function(e) {
                n._onEvent = e
            }, this.canMakePayment = function(e) {
                var t = e.skipEnrollmentChecks;
                return function(e, t, n) {
                    return null !== kn ? u.a.resolve(kn) : wn && e ? e.action.checkCanMakePayment({
                        skipEnrollmentChecks: n
                    }).then((function(e) {
                        var t = e.available;
                        return kn = !0 === t
                    })) : u.a.resolve(!1)
                }(n._prFrame, (Object(d.c)(n._authentication.apiKey), d.a.test), t)
            }, this.update = function(e) {
                var t = n._prFrame;
                t && t.send({
                    action: "stripe-pr-update",
                    payload: {
                        data: e
                    }
                })
            }, this.show = function() {
                if (!n._prFrame) throw new O.a("Payment Request is not available in this browser.");
                n._prFrame.send({
                    action: "stripe-pr-show",
                    payload: {
                        data: {
                            usesButtonElement: n._usesButtonElement()
                        }
                    }
                })
            }, this.abort = function() {
                n._prFrame && n._prFrame.send({
                    action: "stripe-pr-abort",
                    payload: {}
                })
            }, this._setupPrFrame = function(e, t) {
                e.send({
                    action: "stripe-pr-initialize",
                    payload: {
                        data: t
                    }
                }), e._on("pr-cancel", (function() {
                    n._onEvent({
                        type: "cancel"
                    })
                })), e._on("pr-close", (function() {
                    n._onEvent({
                        type: "close"
                    })
                })), e._on("pr-error", (function(e) {
                    n._onEvent({
                        type: "error",
                        payload: {
                            errorMessage: e.message || "",
                            errorCode: e.code || ""
                        }
                    })
                })), e._on("pr-callback", (function(t) {
                    var a = t.event,
                        o = t.nonce,
                        i = t.options;
                    switch (a) {
                        case "token":
                            n._onEvent({
                                type: "paymentresponse",
                                payload: Object(r.a)(Object(r.a)({}, i), {}, {
                                    complete: function(t) {
                                        e.send({
                                            action: "stripe-pr-callback-complete",
                                            payload: {
                                                data: {
                                                    status: t
                                                },
                                                nonce: o
                                            }
                                        })
                                    }
                                })
                            });
                            break;
                        case "shippingaddresschange":
                            n._onEvent({
                                type: "shippingaddresschange",
                                payload: {
                                    shippingAddress: i.shippingAddress,
                                    updateWith: function(t) {
                                        e.send({
                                            action: "stripe-pr-callback-complete",
                                            payload: {
                                                nonce: o,
                                                data: t
                                            }
                                        })
                                    }
                                }
                            });
                            break;
                        case "shippingoptionchange":
                            n._onEvent({
                                type: "shippingoptionchange",
                                payload: {
                                    shippingOption: i.shippingOption,
                                    updateWith: function(t) {
                                        e.send({
                                            action: "stripe-pr-callback-complete",
                                            payload: {
                                                nonce: o,
                                                data: t
                                            }
                                        })
                                    }
                                }
                            });
                            break;
                        default:
                            throw new Error("Unexpected event from PaymentRequest inner: ".concat(a))
                    }
                }))
            };
            var a = t.authentication,
                i = t.controller,
                c = t.mids,
                s = t.origin,
                l = t.usesButtonElement,
                f = t.options;
            if (this._authentication = a, this._controller = i, this._usesButtonElement = l, wn && "https:" === window.location.protocol) {
                this._controller.action.fetchLocale({
                    locale: "auto"
                });
                var m = this._controller.createHiddenFrame(p.c.PAYMENT_REQUEST_BROWSER, {
                    authentication: a,
                    mids: c,
                    origin: s
                });
                this._setupPrFrame(m, f), this._prFrame = m
            } else this._prFrame = null
        },
        Sn = !1,
        An = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n(e) {
                var a;
                Object(o.a)(this, n), (a = t.call(this))._usedByButtonElement = null, a._showCalledByButtonElement = !1, a._isShowing = !1, a._backingLibraries = {
                    APPLE_PAY: null,
                    GOOGLE_PAY: null,
                    BROWSER: null
                }, a._activeBackingLibraryName = null, a._buttonTypeName = null, a._activeBackingLibrary = null, a._canMakePaymentAvailability = {
                    APPLE_PAY: null,
                    GOOGLE_PAY: null,
                    BROWSER: null
                }, a._canMakePaymentResolved = !1, a._validateUserOn = function(e, t) {
                    "string" == typeof e && ("source" === e && a._hasRegisteredListener("paymentmethod") || "paymentmethod" === e && a._hasRegisteredListener("source")) && (a._report("pr.double_callback_registration"), a._controller.warn("Do not register event listeners for both `source` or `paymentmethod`. Only one of them will succeed."))
                }, a._report = function(e, t) {
                    a._controller.report(e, Object(r.a)(Object(r.a)({}, t), {}, {
                        activeBackingLibrary: a._activeBackingLibraryName,
                        usesButtonElement: a._usedByButtonElement || !1
                    }))
                }, a._warn = function(e) {
                    a._controller.warn(e)
                }, a._registerElement = function() {
                    a._usedByButtonElement = !0
                }, a._elementShow = function() {
                    a._showCalledByButtonElement = !0, a.show()
                }, a._initBackingLibraries = function(e) {
                    a._queryStrategy.forEach((function(t) {
                        var n = {
                            controller: a._controller,
                            authentication: a._authentication,
                            mids: a._mids,
                            origin: window.location.origin,
                            options: e,
                            usesButtonElement: function() {
                                return !0 === a._usedByButtonElement
                            },
                            listenerRegistry: a._listenerRegistry
                        };
                        switch (t) {
                            case "APPLE_PAY":
                                a._backingLibraries.APPLE_PAY = new bn(n), a._backingLibraries.APPLE_PAY.setEventHandler(a._handleInternalEvent);
                                break;
                            case "GOOGLE_PAY":
                                a._backingLibraries.GOOGLE_PAY = new En(n), a._backingLibraries.GOOGLE_PAY.setEventHandler(a._handleInternalEvent);
                                break;
                            case "BROWSER":
                                a._backingLibraries.BROWSER = new Pn(n), a._backingLibraries.BROWSER.setEventHandler(a._handleInternalEvent);
                                break;
                            default:
                                Object(ht.a)(t)
                        }
                    }))
                }, a._handleInternalEvent = function(e) {
                    switch (e.type) {
                        case "paymentresponse":
                            a._emitPaymentResponse(e.payload);
                            break;
                        case "error":
                            a._report("error.pr.internal_error", {
                                error: e.payload
                            });
                            break;
                        case "close":
                            a._isShowing = !1;
                            break;
                        default:
                            a._emitExternalEvent(e)
                    }
                }, a._emitExternalEvent = function(e) {
                    switch (e.type) {
                        case "cancel":
                            a._emit("cancel");
                            break;
                        case "shippingoptionchange":
                        case "shippingaddresschange":
                            var t = e.type,
                                n = e.payload,
                                o = null,
                                i = !1,
                                c = !1,
                                u = function(r) {
                                    if (c && i) return a._report("pr.update_with_called_after_timeout", {
                                        event: t
                                    }), void a._controller.warn("Call to updateWith() was ignored because it has already timed out. Please ensure that updateWith is called within 30 seconds.");
                                    if (i) return a._report("pr.update_with_double_call", {
                                        event: t
                                    }), void a._controller.warn("Call to updateWith() was ignored because it has already been called. Do not call updateWith more than once.");
                                    o && clearTimeout(o), i = !0, a._report("pr.update_with", {
                                        event: t
                                    });
                                    var u = Object(l.E)(Mt, r || {}, "".concat(t, " callback")),
                                        p = u.value;
                                    u.warnings.forEach((function(e) {
                                        return a._controller.warn(e)
                                    }));
                                    var d = p,
                                        f = !1;
                                    if (a._initialOptions.__isCheckout && "APPLE_PAY" === a._activeBackingLibraryName && p.shippingOptions && 1 === p.shippingOptions.length && 0 === p.shippingOptions[0].amount) {
                                        p.shippingOptions;
                                        d = Object(s.a)(p, ["shippingOptions"]), f = !0
                                    }
                                    var m = p.shippingOptions || a._initialOptions.shippingOptions;
                                    if (!(f || "shippingaddresschange" !== e.type || p.status !== Pt.success || m && m.length)) throw new O.a("When requesting shipping information, you must specify shippingOptions once a shipping address is selected.\nEither provide shippingOptions in stripe.paymentRequest(...) or listen for the shippingaddresschange event and provide shippingOptions to the updateWith callback there.");
                                    n.updateWith(d)
                                };
                            a._hasRegisteredListener(e.type) ? (o = setTimeout((function() {
                                c = !0, a._report("pr.update_with_timed_out", {
                                    event: t
                                }), a._controller.warn('Timed out waiting for a call to updateWith(). If you listen to "'.concat(e.type, '" events, then you must call event.updateWith in the "').concat(e.type, '" handler within 30 seconds.')), u({
                                    status: "fail"
                                })
                            }), 29900), a._emit(t, Object(r.a)(Object(r.a)({}, n), {}, {
                                updateWith: u
                            }))) : u({
                                status: "success"
                            });
                            break;
                        case "token":
                        case "source":
                        case "paymentmethod":
                            var p = e.type,
                                d = e.payload,
                                f = null,
                                m = !1,
                                _ = !1,
                                h = function(e) {
                                    if (m && _) return a._report("pr.complete_called_after_timeout"), void a._controller.warn("Call to complete() was ignored because it has already timed out. Please ensure that complete is called within 30 seconds.");
                                    if (_) return a._report("pr.complete_double_call"), void a._controller.warn("Call to complete() was ignored because it has already been called. Do not call complete more than once.");
                                    f && clearTimeout(f), _ = !0;
                                    var t = Object(l.E)(Lt, e, "status for PaymentRequest completion"),
                                        n = t.value;
                                    t.warnings.forEach((function(e) {
                                        return a._controller.warn(e)
                                    })), d.complete(n)
                                };
                            f = setTimeout((function() {
                                m = !0, a._report("pr.complete_timed_out"), a._controller.warn('Timed out waiting for a call to complete(). Once you have processed the payment in the "'.concat(e.type, '" handler, you must call event.complete within 30 seconds.')), h("fail")
                            }), 29900), a._emit(p, Object(r.a)(Object(r.a)({}, d), {}, {
                                complete: h
                            }));
                            break;
                        default:
                            Object(ht.a)(e)
                    }
                }, a._maybeEmitPaymentResponse = function(e) {
                    a._isShowing && a._emitExternalEvent(e)
                }, a._emitPaymentResponse = function(e) {
                    a._report("pr.payment_authorized");
                    var t = e.token,
                        n = Object(s.a)(e, ["token"]),
                        o = n.payerEmail,
                        i = n.payerPhone,
                        c = n.complete,
                        u = a._showCalledByButtonElement ? p.b.paymentRequestButton : null;
                    a._hasRegisteredListener("token") && a._maybeEmitPaymentResponse({
                        type: "token",
                        payload: e
                    }), a._hasRegisteredListener("source") && a._controller.action.createSourceWithData({
                        elementName: u,
                        type: "card",
                        sourceData: {
                            token: t.id,
                            owner: {
                                email: a._initialOptions.__billingDetailsEmailOverride || o,
                                phone: i
                            }
                        },
                        mids: null
                    }).then((function(e) {
                        "error" === e.type ? e.error.code && "email_invalid" === e.error.code ? c("invalid_payer_email") : (a._report("fatal.pr.token_to_source_failed", {
                            error: e.error,
                            token: t.id
                        }), c("fail")) : a._maybeEmitPaymentResponse({
                            type: "source",
                            payload: Object(r.a)(Object(r.a)({}, n), {}, {
                                source: e.object
                            })
                        })
                    })), a._hasRegisteredListener("paymentmethod") && a._controller.action.createPaymentMethodWithData({
                        elementName: u,
                        type: "card",
                        paymentMethodData: {
                            card: {
                                token: t.id
                            },
                            billing_details: {
                                email: a._initialOptions.__billingDetailsEmailOverride || o,
                                phone: i
                            }
                        },
                        mids: null
                    }).then((function(e) {
                        "error" === e.type ? e.error.code && "email_invalid" === e.error.code ? c("invalid_payer_email") : (a._report("fatal.pr.token_to_payment_method_failed", {
                            error: e.error,
                            token: t.id
                        }), c("fail")) : a._maybeEmitPaymentResponse({
                            type: "paymentmethod",
                            payload: Object(r.a)(Object(r.a)({}, n), {}, {
                                paymentMethod: e.object
                            })
                        })
                    }))
                }, a._canMakePaymentForBackingLibrary = function(e, t) {
                    var n = a._backingLibraries[e];
                    if (!n) throw new Error("Unexpectedly calling canMakePayment on uninitialized backing library.");
                    return u.a.race([new u.a((function(e) {
                        return setTimeout(e, 1e4)
                    })).then((function() {
                        return !1
                    })), n.canMakePayment({
                        skipEnrollmentChecks: t
                    }).then((function(e) {
                        return !!e
                    }))]).then((function(t) {
                        return a._canMakePaymentAvailability = Object(r.a)(Object(r.a)({}, a._canMakePaymentAvailability), {}, Object(c.a)({}, e, t)), {
                            backingLibraryName: e,
                            available: t
                        }
                    }))
                }, a._isGooglePayOnAndroid = function() {
                    var e = a._initialOptions.wallets,
                        t = e && -1 === e.indexOf("googlePay");
                    return J && !t
                }, a._constructCanMakePaymentResponse = function() {
                    var e = a._isGooglePayOnAndroid() && !!a._canMakePaymentAvailability.BROWSER;
                    return {
                        applePay: !!a._canMakePaymentAvailability.APPLE_PAY,
                        googlePay: !!a._canMakePaymentAvailability.GOOGLE_PAY || e
                    }
                }, a.canMakePayment = w((function(e) {
                    var t = Boolean(null == e ? void 0 : e.skipEnrollmentChecks);
                    if (a._report("pr.can_make_payment"), a._canMakePaymentResolved) {
                        var n = null !== a._activeBackingLibrary ? a._constructCanMakePaymentResponse() : null;
                        return a._report("pr.can_make_payment_response", {
                            response: n,
                            cached: !0
                        }), u.a.resolve(n)
                    }
                    if ("https:" !== window.location.protocol) return Sn || (a._controller.warn("If you are testing Apple Pay or Google Pay, you must serve this page over HTTPS as it will not work over HTTP. Please read https://stripe.com/docs/stripe-js/elements/payment-request-button#html-js-prerequisites for more details."), Sn = !0), a._canMakePaymentResolved = !0, u.a.resolve(null);
                    var r = a._queryStrategy.map((function(e) {
                            return function() {
                                return a._canMakePaymentForBackingLibrary(e, !!a._initialOptions.__isCheckout && t)
                            }
                        })),
                        o = new Ve.a;
                    return jt(r, (function(e) {
                        var t = e.backingLibraryName,
                            n = e.available;
                        return n && (a._activeBackingLibraryName = t, a._activeBackingLibrary = a._backingLibraries[t], a._buttonTypeName = a._activeBackingLibraryName, a._isGooglePayOnAndroid() && (a._buttonTypeName = "GOOGLE_PAY")), n
                    })).then((function(e) {
                        var t = new Ve.a;
                        a._canMakePaymentResolved = !0;
                        var n = null;
                        return "SATISFIED" === e.type && (n = a._constructCanMakePaymentResponse()), a._report("pr.can_make_payment_response", {
                            response: n,
                            cached: !1,
                            duration: o.getElapsedTime(t)
                        }), n
                    }))
                })), a.update = w((function(e) {
                    if (a._isShowing) throw a._report("pr.update_called_while_showing"), new O.a("You cannot update Payment Request options while the payment sheet is showing.");
                    var t = Object(l.E)(xt, e, "PaymentRequest update()"),
                        n = t.value,
                        r = t.warnings;
                    a._report("pr.update"), r.forEach((function(e) {
                        return a._warn(e)
                    })), Object(we.g)(a._backingLibraries).forEach((function(e) {
                        e && e.update(n)
                    }))
                })), a.show = w((function() {
                    if (a._usedByButtonElement && !a._showCalledByButtonElement && (a._report("pr.show_called_with_button"), a._warn("Do not call show() yourself if you are using the paymentRequestButton Element. The Element handles showing the payment sheet.")), !a._canMakePaymentResolved) throw a._report("pr.show_called_before_can_make_payment"), new O.a("You must first check the Payment Request API's availability using paymentRequest.canMakePayment() before calling show().");
                    if (!a._activeBackingLibrary) throw a._report("pr.show_called_with_can_make_payment_false"), new O.a("Payment Request is not available in this browser.");
                    var e = a._activeBackingLibrary;
                    a._report("pr.show", {
                        listeners: Object.keys(a._callbacks).sort()
                    }), a._isShowing = !0, e.show()
                })), a.abort = w((function() {
                    if (a._activeBackingLibrary) {
                        var e = a._activeBackingLibrary;
                        a._report("pr.abort"), e.abort()
                    }
                })), a.isShowing = function() {
                    return a._isShowing
                }, a._controller = e.controller, a._authentication = e.authentication, a._mids = e.mids, a._listenerRegistry = e.listenerRegistry;
                var i = Object(l.E)(Rt, e.rawOptions || {}, "paymentRequest()"),
                    d = i.value,
                    f = i.warnings;
                if (a._report("pr.options", {
                        options: Object(we.e)(d, ["country", "currency", "jcbEnabled", "requestPayerEmail", "requestPayerName", "requestPayerPhone", "requestShipping", "disableWallets", "wallets"])
                    }), f.forEach((function(e) {
                        return a._warn(e)
                    })), d.__billingDetailsEmailOverride && d.requestPayerEmail) throw new O.a("When providing `__billingDetailsEmailOverride`, `requestPayerEmail` has to be `false` so that the customer is not prompted for their email in the payment sheet.");
                var m = d.disableWallets,
                    _ = m ? Dt.c.filter((function(e) {
                        return -1 === m.indexOf(e)
                    })) : d.wallets;
                return a._queryStrategy = _ ? Bt(_) : e.queryStrategyOverride || qt(), a._report("pr.query_strategy", {
                    queryStrategy: a._queryStrategy
                }), a._initialOptions = Object(r.a)(Object(r.a)({}, d), {}, {
                    __betas: e.betas,
                    wallets: _
                }), a._initBackingLibraries(a._initialOptions), a
            }
            return n
        }(T),
        Tn = {
            base: Object(l.s)(l.p),
            complete: Object(l.s)(l.p),
            empty: Object(l.s)(l.p),
            invalid: Object(l.s)(l.p),
            paymentRequestButton: Object(l.s)(l.p)
        },
        In = {
            classes: Object(l.s)(Object(l.u)({
                base: Object(l.s)(l.x),
                complete: Object(l.s)(l.x),
                empty: Object(l.s)(l.x),
                focus: Object(l.s)(l.x),
                invalid: Object(l.s)(l.x),
                webkitAutofill: Object(l.s)(l.x)
            })),
            hidePostalCode: Object(l.s)(l.b),
            hideIcon: Object(l.s)(l.b),
            showIcon: Object(l.s)(l.b),
            style: Object(l.s)(Object(l.u)(Tn)),
            iconStyle: Object(l.s)(Object(l.q)("solid", "default")),
            value: Object(l.s)(Object(l.t)(l.x, l.p)),
            __privateCvcOptional: Object(l.s)(l.b),
            __privateValue: Object(l.s)(Object(l.t)(l.x, l.p)),
            __privateEmitIbanValue: Object(l.s)(l.b),
            error: Object(l.s)(Object(l.u)({
                type: l.x,
                code: Object(l.s)(l.x),
                decline_code: Object(l.s)(l.x),
                param: Object(l.s)(l.x)
            })),
            locale: Object(l.j)("elements()"),
            fonts: Object(l.j)("elements()"),
            placeholder: Object(l.s)(l.x),
            disabled: Object(l.s)(l.b),
            placeholderCountry: Object(l.s)(l.x),
            paymentRequest: Object(l.s)(Object(l.h)(An, "stripe.paymentRequest(...)")),
            supportedCountries: Object(l.s)(Object(l.a)(l.x)),
            accountHolderType: Object(l.s)(Object(l.q)("individual", "company")),
            issuingCard: Object(l.s)(l.x),
            toCopy: Object(l.s)(Object(l.q)("number", "cvc", "expiry"))
        },
        Cn = Object(l.u)(In),
        Nn = n(12),
        Rn = n(19),
        xn = (gn = {}, Object(c.a)(gn, Nn.a.card, Rn.a.CARD_ELEMENT), Object(c.a)(gn, Nn.a.cardNumber, Rn.a.CARD_ELEMENT), Object(c.a)(gn, Nn.a.cardExpiry, Rn.a.CARD_ELEMENT), Object(c.a)(gn, Nn.a.cardCvc, Rn.a.CARD_ELEMENT), Object(c.a)(gn, Nn.a.postalCode, Rn.a.CARD_ELEMENT), Object(c.a)(gn, Nn.a.paymentRequestButton, Rn.a.PAYMENT_REQUEST_ELEMENT), Object(c.a)(gn, Nn.a.iban, Rn.a.IBAN_ELEMENT), Object(c.a)(gn, Nn.a.idealBank, Rn.a.IDEAL_BANK_ELEMENT), Object(c.a)(gn, Nn.a.p24Bank, Rn.a.P24_BANK_ELEMENT), Object(c.a)(gn, Nn.a.auBankAccount, Rn.a.AU_BANK_ACCOUNT_ELEMENT), Object(c.a)(gn, Nn.a.fpxBank, Rn.a.FPX_BANK_ELEMENT), Object(c.a)(gn, Nn.a.issuingCardNumberDisplay, Rn.a.ISSUING_CARD_NUMBER_DISPLAY_ELEMENT), Object(c.a)(gn, Nn.a.issuingCardCopyButton, Rn.a.ISSUING_CARD_COPY_BUTTON_ELEMENT), Object(c.a)(gn, Nn.a.issuingCardCvcDisplay, Rn.a.ISSUING_CARD_CVC_DISPLAY_ELEMENT), Object(c.a)(gn, Nn.a.issuingCardExpiryDisplay, Rn.a.ISSUING_CARD_EXPIRY_DISPLAY_ELEMENT), Object(c.a)(gn, Nn.a.epsBank, Rn.a.EPS_BANK_ELEMENT), Object(c.a)(gn, Nn.a.netbankingBank, Rn.a.NETBANKING_BANK_ELEMENT), Object(c.a)(gn, Nn.a.afterpayClearpayMessageModal, Rn.a.AFTERPAY_MESSAGE_MODAL_ELEMENT), gn),
        Mn = function(e) {
            var t = Object(Ot.a)(e, null);
            return !!t && "rtl" === t.getPropertyValue("direction")
        },
        Ln = n(35),
        Dn = function(e) {
            var t = document.createElement("input");
            return t.className = e, t.setAttribute("aria-hidden", "true"), t.setAttribute("aria-label", " "), t.setAttribute("autocomplete", "false"), t.maxLength = 1, t.disabled = !0, Object(x.d)(t, Ln.b), t
        },
        qn = ["test_id"],
        Bn = function(e) {
            switch (e.type) {
                case "object":
                    return qn.push(e.object.id), {
                        issuingCard: e.object
                    };
                case "error":
                    return {
                        error: e.error
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        Fn = function(e) {
            switch (e.type) {
                case "object":
                    return {
                        nonce: e.object.public_nonce
                    };
                case "error":
                    return {
                        error: e.error
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        Un = {
            base: "StripeElement",
            focus: "StripeElement--focus",
            invalid: "StripeElement--invalid",
            complete: "StripeElement--complete",
            empty: "StripeElement--empty",
            webkitAutofill: "StripeElement--webkit-autofill"
        },
        Yn = "#faffbd",
        Gn = function(e) {
            return parseFloat(e.toFixed(1))
        },
        Hn = function(e) {
            return /^\d+(\.\d*)?px$/.test(e)
        },
        zn = function() {
            function e(t) {
                var n = this;
                Object(o.a)(this, e), this.focus = function() {
                    if (n._isIssuingDisplayElement()) throw new O.a("Cannot call focus() on an ".concat(n._componentName, " Element."));
                    document.activeElement && document.activeElement.blur && document.activeElement.blur(), n._fakeInput.focus()
                }, this._formSubmit = function() {
                    for (var e = n._component.parentElement; e && "FORM" !== e.nodeName;) e = e.parentElement;
                    if (e) {
                        var t = document.createEvent("Event");
                        t.initEvent("submit", !0, !0), e.dispatchEvent(t)
                    }
                };
                var r = t.options,
                    a = t.component,
                    i = t.listenerRegistry,
                    c = t.elementTimings,
                    s = t.emitEvent,
                    u = t.getParent,
                    p = r.controller,
                    d = r.componentName,
                    f = r.publicOptions;
                this._componentName = d, this._component = a, this._controller = p, this._listenerRegistry = i, this._emitEvent = s, this._getParent = u;
                var m = Object(l.E)(Cn, f || {}, "create()"),
                    _ = m.value;
                m.warnings.forEach((function(e) {
                    return n._controller.warn(e)
                }));
                var h, y = _.paymentRequest,
                    b = _.classes,
                    v = _.issuingCard,
                    g = "paymentRequestButton" === this._componentName;
                if (g) {
                    if (!y) throw new O.a("You must pass in a stripe.paymentRequest object in order to use this Element.");
                    this._paymentRequest = y, this._paymentRequest._registerElement()
                }
                if (this._isIssuingDisplayElement()) {
                    if (!v) throw new Error("You must pass in an ID to the issuingCard option in order to use this Element.");
                    if (h = v, -1 === qn.indexOf(h)) throw new Error("Issuing card ".concat(v, " has not been retrieved."))
                }
                this._createElement(r, _, c), this._classes = Un, this._computeCustomClasses(b || {}), this._lastBackgroundColor = "", this._focused = !1, this._empty = !g, this._invalid = !1, this._complete = !1, this._autofilled = !1, this._lastSubmittedAt = null
            }
            return Object(i.a)(e, [{
                key: "update",
                value: function(e) {
                    var t = this,
                        n = Object(l.E)(Cn, e || {}, "element.update()"),
                        r = n.value;
                    if (n.warnings.forEach((function(e) {
                            return t._controller.warn(e)
                        })), r) {
                        var a = r.classes,
                            o = Object(s.a)(r, ["classes"]);
                        a && (this._removeClasses(), this._computeCustomClasses(a), this._updateClasses()), this._updateFrameHeight(r), Object.keys(o).length && (this._frame.update(o), this._secondaryFrame && this._secondaryFrame.update(o))
                    }
                }
            }, {
                key: "blur",
                value: function() {
                    if (this._isIssuingDisplayElement()) throw new O.a("Cannot call blur() on an ".concat(this._componentName, " Element."));
                    this._frame.blur(), this._fakeInput.blur()
                }
            }, {
                key: "clear",
                value: function() {
                    this._frame.clear()
                }
            }, {
                key: "unmount",
                value: function() {
                    var e = this._getParent(),
                        t = this._label;
                    e && (this._listenerRegistry.removeEventListener(e, "click", this.focus), this._removeClasses()), t && (this._listenerRegistry.removeEventListener(t, "click", this.focus), this._label = null), this._secondaryFrame && (this._secondaryFrame.unmount(), this._listenerRegistry.removeEventListener(window, "click", this._handleOutsideClick)), this._fakeInput.disabled = !0, this._frame.unmount()
                }
            }, {
                key: "mount",
                value: function() {
                    if (Object(x.b)(document, this._component)) {
                        this._controller.report("user_error.shadow_dom_mount", {
                            element: this._componentName
                        });
                        var e = function() {
                            throw new O.a("Elements cannot be mounted in a ShadowRoot. Please mount in the Light DOM.")
                        };
                        "test" === this._controller.keyMode() ? e() : setTimeout(e, 0)
                    }
                    if (this._paymentRequest) {
                        if (!this._paymentRequest._canMakePaymentResolved) throw new O.a("For the paymentRequestButton Element, you must first check availability using paymentRequest.canMakePayment() before mounting the Element.");
                        if (!this._paymentRequest._activeBackingLibraryName) throw new O.a("The paymentRequestButton Element is not available in the current environment.")
                    }
                    this._mountTimestamp = new Ve.a, this._findPossibleLabel(), this._updateClasses()
                }
            }, {
                key: "_isIssuingDisplayElement",
                value: function() {
                    return "issuingCardNumberDisplay" === this._componentName || "issuingCardCvcDisplay" === this._componentName || "issuingCardExpiryDisplay" === this._componentName
                }
            }, {
                key: "_updateClasses",
                value: function() {
                    var e = this._getParent();
                    e && Object(x.f)(e, [
                        [this._classes.base, !0],
                        [this._classes.empty, this._empty],
                        [this._classes.focus, this._focused],
                        [this._classes.invalid, this._invalid],
                        [this._classes.complete, this._complete],
                        [this._classes.webkitAutofill, this._autofilled]
                    ])
                }
            }, {
                key: "_removeClasses",
                value: function() {
                    var e = this._getParent();
                    e && Object(x.f)(e, [
                        [this._classes.base, !1],
                        [this._classes.empty, !1],
                        [this._classes.focus, !1],
                        [this._classes.invalid, !1],
                        [this._classes.complete, !1],
                        [this._classes.webkitAutofill, !1]
                    ])
                }
            }, {
                key: "_findPossibleLabel",
                value: function() {
                    var e = this._getParent();
                    if (e) {
                        var t, n = e.getAttribute("id");
                        if (n && (t = document.querySelector("label[for='".concat(n, "']"))), t) this._listenerRegistry.addEventListener(e, "click", this.focus);
                        else
                            for (t = t || e.parentElement; t && "LABEL" !== t.nodeName;) t = t.parentElement;
                        t ? (this._label = t, this._listenerRegistry.addEventListener(t, "click", this.focus)) : this._listenerRegistry.addEventListener(e, "click", this.focus)
                    }
                }
            }, {
                key: "_computeCustomClasses",
                value: function(e) {
                    var t = {};
                    return Object.keys(e).forEach((function(n) {
                        if (!Un[n]) throw new O.a("".concat(n, " is not a customizable class name.\nYou can customize: ").concat(Object.keys(Un).join(", ")));
                        var r = e[n] || Un[n];
                        t[n] = r.replace(/\./g, " ")
                    })), this._classes = Object(r.a)(Object(r.a)({}, this._classes), t), this
                }
            }, {
                key: "_setupEvents",
                value: function(e) {
                    var t = this,
                        n = e.stripeJsLoadTimestamp,
                        r = (e.stripeCreateTimestamp, e.groupCreateTimestamp),
                        o = e.createTimestamp,
                        i = 0,
                        c = 0,
                        s = {
                            stripeJsLoad: n.getAsPosixTime(),
                            stripeCreate: o.getAsPosixTime(),
                            groupCreate: r.getAsPosixTime(),
                            create: o.getAsPosixTime()
                        };
                    if (this._frame._on("load", (function(e) {
                            var n = e.source;
                            i++;
                            var r = t._getParent(),
                                a = Mn(r),
                                o = t._paymentRequest ? t._paymentRequest._buttonTypeName : null;
                            t._mountTimestamp && (s.mount = t._mountTimestamp.getAsPosixTime()), t._frame.send({
                                action: "stripe-user-mount",
                                payload: {
                                    timestamps: s,
                                    loadCount: i,
                                    matchFrame: n === t._frame._iframe.contentWindow,
                                    rtl: a,
                                    paymentRequestButtonType: o
                                }
                            })
                        })), this._secondaryFrame) {
                        var u = this._secondaryFrame;
                        u._on("load", (function(e) {
                            var n = e.source;
                            c++, t._mountTimestamp && (s.mount = t._mountTimestamp.getAsPosixTime()), u.send({
                                action: "stripe-user-mount",
                                payload: {
                                    timestamps: s,
                                    loadCount: c,
                                    matchFrame: n === u._iframe.contentWindow,
                                    rtl: !1,
                                    paymentRequestButtonType: null
                                }
                            })
                        }))
                    }
                    this._frame._on("redirectfocus", (function(e) {
                        var n = e.focusDirection,
                            r = Object(ie.b)(t._component, n);
                        r && r.focus()
                    })), this._frame._on("focus", (function() {
                        t._focused = !0, t._updateClasses()
                    })), this._frame._on("blur", (function() {
                        t._focused = !1, t._updateClasses(), t._lastSubmittedAt && "paymentRequestButton" === t._componentName && (t._controller.report("payment_request_button.sheet_visible", {
                            latency: t._lastSubmittedAt.getElapsedTime()
                        }), t._lastSubmittedAt = null)
                    })), this._frame._on("submit", (function() {
                        if ("paymentRequestButton" === t._componentName) {
                            t._lastSubmittedAt = new Ve.a;
                            var e = !1,
                                n = !1;
                            Ke(), t._emitEvent("click", {
                                preventDefault: function() {
                                    t._controller.report("payment_request_button.default_prevented"), e && t._controller.warn("event.preventDefault() was called after the payment sheet was shown. Make sure to call it synchronously when handling the `click` event."), n = !0
                                }
                            }), !n && t._paymentRequest && (t._paymentRequest._elementShow(), e = !0)
                        } else t._emitEvent("submit"), t._formSubmit()
                    })), ["ready", "focus", "blur", "escape", "click"].forEach((function(e) {
                        t._frame._on(e, (function() {
                            t._emitEvent(e)
                        }))
                    })), this._frame._on("change", (function(e) {
                        Ke();
                        var n = {},
                            r = mt.a[t._componentName] || [];
                        ["error", "value", "empty", "complete"].concat(Object(a.a)(r)).forEach((function(t) {
                            return n[t] = e[t]
                        })), t._emitEvent("change", n), t._empty = n.empty, t._invalid = !!n.error, t._complete = n.complete, t._updateClasses()
                    })), this._frame._on("__privateIntegrationError", (function(e) {
                        var n = e.message;
                        t._emitEvent("__privateIntegrationError", {
                            message: n
                        })
                    })), this._frame._on("dimensions", (function(e) {
                        var n = t._getParent();
                        if (n) {
                            var r = Object(Ot.a)(n, null);
                            if (r) {
                                var a = parseFloat(r.getPropertyValue("height")),
                                    o = e.height;
                                if ("border-box" === r.getPropertyValue("box-sizing")) {
                                    var i = parseFloat(r.getPropertyValue("padding-top")),
                                        c = parseFloat(r.getPropertyValue("padding-bottom"));
                                    a = a - parseFloat(r.getPropertyValue("border-top")) - parseFloat(r.getPropertyValue("border-bottom")) - i - c
                                }
                                var s = Gn(a),
                                    u = Gn(o);
                                0 !== a && s < u && t._controller.report("wrapper_height_mismatch", {
                                    height: u,
                                    outer_height: s
                                });
                                var l = t._component.getBoundingClientRect().height,
                                    p = Gn(l);
                                0 !== l && 0 !== o && p !== u && (t._frame.updateStyle({
                                    height: "".concat(o, "px")
                                }), t._controller.report("iframe_height_update", {
                                    height: u,
                                    calculated_height: p
                                }))
                            }
                        }
                    })), this._frame._on("autofill", (function() {
                        var e = t._getParent();
                        if (e) {
                            var n = e.style.backgroundColor,
                                r = n === Yn || "rgb(250, 255, 189)" === n;
                            t._lastBackgroundColor = r ? t._lastBackgroundColor : n, e.style.backgroundColor = Yn, t._autofilled = !0, t._updateClasses()
                        }
                    })), this._frame._on("autofill-cleared", (function() {
                        var e = t._getParent();
                        t._autofilled = !1, e && (e.style.backgroundColor = t._lastBackgroundColor), t._updateClasses()
                    })), this._frame._on("update-outer-style", (function(e) {
                        Object.keys(e).forEach((function(n) {
                            t._component.style.setProperty(n, e[n])
                        }))
                    }))
                }
            }, {
                key: "_handleOutsideClick",
                value: function() {
                    this._secondaryFrame && this._secondaryFrame.send({
                        action: "stripe-outside-click",
                        payload: {}
                    })
                }
            }, {
                key: "_updateFrameHeight",
                value: function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        n = e.style;
                    if ("paymentRequestButton" === this._componentName) {
                        var r = n && n.paymentRequestButton || {},
                            a = r.height,
                            o = "string" == typeof a ? a : void 0;
                        (t || o) && (this._frame.updateStyle({
                            height: o || this._lastHeight || Et
                        }), this._lastHeight = o || this._lastHeight)
                    } else {
                        var i = n && n.base || {},
                            c = i.lineHeight,
                            s = i.fontSize,
                            u = i.padding,
                            l = "string" != typeof c || isNaN(parseFloat(c)) ? void 0 : c,
                            d = "string" == typeof s ? s : void 0,
                            f = "string" == typeof u ? u : void 0;
                        if (d && !Hn(d) && this._controller.warn("The fontSize style you specified (".concat(d, ") is not in px. We do not recommend using relative css units, as they will be calculated relative to our iframe's styles rather than your site's.")), t || l || d) {
                            var m = -1 === p.l.indexOf(this._componentName) ? void 0 : f || this._lastPadding,
                                _ = gt(l || this._lastHeight, d || this._lastFontSize, m);
                            this._frame.updateStyle({
                                height: _
                            }), this._lastFontSize = d || this._lastFontSize, this._lastHeight = l || this._lastHeight, this._lastPadding = m
                        }
                    }
                }
            }, {
                key: "_createElement",
                value: function(e, t, n) {
                    var a = this,
                        o = (e.controller, e.publicOptions, e.componentName),
                        i = e.groupId,
                        c = Object(s.a)(e, ["controller", "publicOptions", "componentName", "groupId"]),
                        u = (t.classes, t.paymentRequest, Object(s.a)(t, ["classes", "paymentRequest"])),
                        l = this._component,
                        d = Dn(Ze.c);
                    Object(x.d)(l, Ln.a);
                    var f = Mn(document.body),
                        m = xn[o],
                        _ = Object(r.a)(Object(r.a)(Object(r.a)({}, c), u), {}, {
                            rtl: f
                        }),
                        h = this._controller.createElementFrame(m, o, i, _);
                    if (h._on("load", (function() {
                            d.disabled = !1
                        })), this._listenerRegistry.addEventListener(d, "focus", (function() {
                            h.focus()
                        })), h.appendTo(l), mt.c[o]) {
                        var y = mt.c[o].secondary,
                            b = this._controller.createSecondaryElementFrame(m, y, o, i, _);
                        b && b.on && b.on("height-change", (function(e) {
                            b.updateStyle({
                                height: "".concat(e.height, "px")
                            })
                        })), this._secondaryFrame = b, b.appendTo(l), this._listenerRegistry.addEventListener(window, "click", (function() {
                            return a._handleOutsideClick()
                        }))
                    }
                    if (l.appendChild(d), V && o !== p.b.paymentRequestButton) {
                        var v = function() {
                            var e = Dn(Ze.d);
                            return e.setAttribute("tabindex", "-1"), e
                        }();
                        l.appendChild(v)
                    }
                    this._frame = h, this._fakeInput = d, this._setupEvents(n), this._updateFrameHeight(t, !0)
                }
            }]), e
        }(),
        Wn = {
            amount: l.n,
            currency: Object(l.q)("USD"),
            logoColor: Object(l.s)(Object(l.q)("primary", "black", "white")),
            fontColor: Object(l.s)(l.x),
            fontSize: Object(l.s)(l.x),
            stripeMerchantId: Object(l.s)(l.x)
        },
        Kn = Object(l.u)(Wn),
        Vn = function(e) {
            var t = !1;
            window.Promise || (t = !0, window.Promise = u.a);
            var n = e();
            return t && window.Promise === u.a && delete window.Promise, n
        },
        Jn = function(e) {
            var t, o = e.options,
                i = Object(s.a)(e, ["options"]),
                c = e.emitEvent,
                p = e.listenerRegistry,
                d = o.controller,
                f = o.componentName,
                m = o.publicOptions,
                _ = o.groupId,
                h = new Ve.a,
                y = function(e) {
                    var t = Object(l.E)(Kn, e || {}, "create()"),
                        n = t.value,
                        r = t.warnings;
                    if (!Math.floor(n.amount) === n.amount) throw new O.a("'Amount' must be a whole integer number that represents the lowest denomination (cents).");
                    return r.forEach((function(e) {
                        return d.warn(e)
                    })), n
                },
                b = y(m),
                v = function(e, n) {
                    return e.apply(void 0, [t].concat(Object(a.a)(n)))
                },
                g = [],
                j = function(e) {
                    return function() {
                        for (var n = arguments.length, r = new Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                        t ? v(e, r) : g.push([e, r])
                    }
                },
                E = function() {};
            u.a.all([Vn((function() {
                return n.e(1).then(n.bind(null, 73))
            })), Vn((function() {
                return n.e(2).then(n.bind(null, 76))
            }))]).then((function(e) {
                var n = Object(Me.a)(e, 2),
                    a = n[0],
                    o = n[1],
                    c = a.default;
                E = o.unmountModal;
                var s = Object(r.a)(Object(r.a)({}, i), {}, {
                    options: {
                        groupId: _,
                        controller: d,
                        componentName: f,
                        publicOptions: b
                    },
                    mountModal: function(e) {
                        return o.mountModal({
                            controller: d,
                            listenerRegistry: p,
                            url: e
                        })
                    }
                });
                t = c(s), d.report("affirm_message.loaded", {
                        load_time: h.getElapsedTime(),
                        currency: b.currency
                    }),
                    function() {
                        for (; g.length;) {
                            var e = g.shift(),
                                t = Object(Me.a)(e, 2),
                                n = t[0],
                                r = t[1];
                            v(n, r)
                        }
                    }()
            }), (function(e) {
                d.report("affirm_message.import_error", {
                    error: e
                })
            }));
            var w = function(e) {
                return function() {
                    throw new O.a(e)
                }
            };
            return {
                mount: j((function(e) {
                    e.mount(b), c("mounted")
                })),
                unmount: j((function(e) {
                    E(), e.unmount()
                })),
                update: j((function(e, t) {
                    var n = Object(we.c)(b, t);
                    b = y(n), e.update(b)
                })),
                focus: w("Focus is not supported by affirmMessage."),
                blur: w("Blur is not supported by affirmMessage."),
                clear: w("Clear is not supported by affirmMessage.")
            }
        },
        $n = {
            amount: l.n,
            currency: Object(l.q)("USD", "AUD", "CAD", "GBP", "NZD", "EUR"),
            badgeTheme: Object(l.s)(Object(l.q)("black-on-mint", "black-on-white", "mint-on-black", "white-on-black")),
            introText: Object(l.s)(Object(l.q)("In", "in", "Or", "or", "Pay", "pay", "Pay in", "pay in")),
            isEligible: Object(l.s)(l.b),
            isCartEligible: Object(l.s)(l.b),
            lockupTheme: Object(l.s)(Object(l.q)("black", "white", "mint")),
            logoType: Object(l.s)(Object(l.q)("badge", "lockup")),
            max: Object(l.s)(l.n),
            min: Object(l.s)(l.n),
            modalLinkStyle: Object(l.s)(Object(l.q)("circled-info-icon", "more-info-text", "learn-more-text")),
            modalTheme: Object(l.s)(Object(l.q)("mint", "white")),
            showInterestFree: Object(l.s)(l.b),
            showLowerLimit: Object(l.s)(l.b),
            showUpperLimit: Object(l.s)(l.b),
            showWith: Object(l.s)(l.b)
        },
        Zn = Object(l.u)($n),
        Xn = function() {
            return Vn((function() {
                return n.e(4).then(n.bind(null, 77))
            }))
        },
        Qn = function(e) {
            var t, r = e.emitEvent,
                o = e.options,
                i = o.controller,
                c = o.locale,
                s = o.publicOptions,
                p = new Ve.a,
                d = function(e) {
                    var t = Object(l.E)(Zn, e || {}, "create()"),
                        n = t.value;
                    return t.warnings.forEach((function(e) {
                        return i.warn(e)
                    })), n
                },
                f = d(s),
                m = function(e, n) {
                    return e.apply(void 0, [t].concat(Object(a.a)(n)))
                },
                _ = [],
                h = function(e) {
                    return function() {
                        for (var n = arguments.length, r = new Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                        t ? m(e, r) : _.push([e, r])
                    }
                },
                y = function() {};
            u.a.all([Vn((function() {
                return n.e(3).then(n.bind(null, 75))
            })), Xn()]).then((function(n) {
                var a = Object(Me.a)(n, 2),
                    o = a[0],
                    s = a[1],
                    u = o.default;
                y = s.unmountModal;
                var l = e.component,
                    d = e.listenerRegistry;
                t = u({
                        component: l,
                        mountModal: function(e, t) {
                            return s.mountModal({
                                controller: i,
                                listenerRegistry: d,
                                locale: e,
                                modalTheme: t
                            })
                        },
                        locale: c,
                        listenerRegistry: d
                    }), i.report("afterpay_message.loaded", {
                        load_time: p.getElapsedTime(),
                        locale: c,
                        currency: f.currency
                    }),
                    function() {
                        for (; _.length;) {
                            var e = _.shift(),
                                t = Object(Me.a)(e, 2),
                                n = t[0],
                                r = t[1];
                            m(n, r)
                        }
                    }(), r("ready")
            }), (function(e) {
                i.report("afterpay_message.import_error", {
                    error: e
                })
            }));
            var b = function(e) {
                return function() {
                    throw new O.a(e)
                }
            };
            return {
                mount: h((function(e) {
                    e.mount(f)
                })),
                unmount: h((function(e) {
                    y(), e.unmount()
                })),
                update: h((function(e, t) {
                    var n = Object(we.c)(f, t);
                    f = d(n), e.update(f)
                })),
                focus: b("Focus is not supported by afterpayClearpayMessage."),
                blur: b("Blur is not supported by afterpayClearpayMessage."),
                clear: b("Clear is not supported by afterpayClearpayMessage.")
            }
        },
        er = n(33);

    function tr(e) {
        var t = function(e, t) {
            if ("object" !== Object(er.a)(e) || null === e) return e;
            var n = e[Symbol.toPrimitive];
            if (void 0 !== n) {
                var r = n.call(e, t || "default");
                if ("object" !== Object(er.a)(r)) return r;
                throw new TypeError("@@toPrimitive must return a primitive value.")
            }
            return ("string" === t ? String : Number)(e)
        }(e, "string");
        return "symbol" === Object(er.a)(t) ? t : String(t)
    }
    var nr, rr = {
            _componentName: l.x,
            _implementation: Object(l.u)({
                _frame: Object(l.u)({
                    id: l.x
                })
            })
        },
        ar = Object(l.u)(rr),
        or = function(e) {
            var t = Object(l.F)(ar, e, "");
            return "error" === t.type ? null : t.value
        },
        ir = {
            _elements: Object(l.a)(ar)
        },
        cr = Object(l.u)(ir),
        sr = {
            alipay: "alipay",
            affirm: "affirm",
            afterpay_clearpay: "afterpay_clearpay",
            au_becs_debit: "au_becs_debit",
            acss_debit: "acss_debit",
            bacs_debit: "bacs_debit",
            bancontact: "bancontact",
            blik: "blik",
            boleto: "boleto",
            card: "card",
            customer_balance: "customer_balance",
            eps: "eps",
            fpx: "fpx",
            giropay: "giropay",
            grabpay: "grabpay",
            ideal: "ideal",
            klarna: "klarna",
            konbini: "konbini",
            nz_bank_account: "nz_bank_account",
            oxxo: "oxxo",
            p24: "p24",
            paypal: "paypal",
            sepa_debit: "sepa_debit",
            sofort: "sofort",
            three_d_secure: "three_d_secure",
            upi: "upi",
            us_bank_account: "us_bank_account",
            wechat_pay: "wechat_pay",
            paynow: "paynow",
            pix: "pix",
            promptpay: "promptpay",
            netbanking: "netbanking",
            id_bank_transfer: "id_bank_transfer",
            link: "link",
            apple_pay: "apple_pay",
            google_pay: "google_pay"
        },
        ur = (nr = {}, Object(c.a)(nr, p.b.auBankAccount, sr.au_becs_debit), Object(c.a)(nr, p.b.card, sr.card), Object(c.a)(nr, p.b.cardNumber, sr.card), Object(c.a)(nr, p.b.cardExpiry, sr.card), Object(c.a)(nr, p.b.cardCvc, sr.card), Object(c.a)(nr, p.b.postalCode, sr.card), Object(c.a)(nr, p.b.iban, sr.sepa_debit), Object(c.a)(nr, p.b.idealBank, sr.ideal), Object(c.a)(nr, p.b.fpxBank, sr.fpx), Object(c.a)(nr, p.b.p24Bank, sr.p24), Object(c.a)(nr, p.b.netbankingBank, sr.netbanking), Object(c.a)(nr, p.b.epsBank, sr.eps), nr),
        lr = function(e) {
            return -1 === p.m.indexOf(e)
        },
        pr = function(e, t) {
            switch (e.type) {
                case "object":
                    return {
                        paymentIntent: e.object
                    };
                case "error":
                    var n = t ? {
                        payment_intent: t
                    } : {};
                    return {
                        error: Object(r.a)(Object(r.a)({}, n), e.error)
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        dr = function(e, t) {
            switch (e.type) {
                case "error":
                    return {
                        error: Object(r.a)(Object(r.a)({}, t ? {
                            setup_intent: t
                        } : {}), e.error)
                    };
                case "object":
                    return {
                        setupIntent: e.object
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        fr = function(e) {
            return "payment_intent" === e.object ? {
                id: e.id,
                clientSecret: e.client_secret,
                type: "PAYMENT_INTENT"
            } : {
                id: e.id,
                clientSecret: e.client_secret,
                type: "SETUP_INTENT"
            }
        },
        mr = function(e) {
            return "requires_source_action" === e || "requires_action" === e
        },
        _r = function(e) {
            return "requires_source_action" === e.status || "requires_action" === e.status ? e.next_action : null
        },
        hr = function(e, t) {
            if ("string" != typeof e) return Object(l.i)("a client_secret string", e, t);
            var n, r = (n = e.trim().match(/^((seti|pi)_[^_]+)_secret_[^-]+$/)) ? "pi" === n[2] ? {
                id: n[1],
                clientSecret: n[0],
                type: "PAYMENT_INTENT"
            } : {
                id: n[1],
                clientSecret: n[0],
                type: "SETUP_INTENT"
            } : null;
            return null === r ? Object(l.i)("a client secret of the form ${id}_secret_${secret}", e, t) : Object(l.D)(r, [])
        },
        yr = function(e, t) {
            var n = hr(e, t);
            return "error" === n.type ? n : n.value.type === p.g.SETUP_INTENT ? Object(l.f)(new O.a(Object(l.B)("a PaymentIntent client secret", "a SetupIntent client secret", t))) : Object(l.D)(n.value, [])
        },
        br = function(e, t) {
            var n = hr(e, t);
            return "error" === n.type ? n : n.value.type === p.g.PAYMENT_INTENT ? Object(l.f)(new O.a(Object(l.B)("a SetupIntent client secret", "a PaymentIntent client secret", t))) : Object(l.D)(n.value, [])
        },
        vr = function(e, t) {
            if (null === e) return Object(l.g)("object", "null", t);
            if ("object" != typeof e) return Object(l.g)("object", typeof e, t);
            var n = e.client_secret,
                r = e.status,
                a = e.next_action,
                o = hr(n, Object(l.e)(t, "client_secret"));
            if ("error" === o.type) return o;
            if ("string" != typeof r) return Object(l.g)("string", typeof r, Object(l.e)(t, "status"));
            if (("requires_source_action" === r || "requires_action" === r) && "object" != typeof a) return Object(l.g)("object", typeof a, Object(l.e)(t, "next_action"));
            if ("payment_intent" === e.object) {
                var i = e;
                return Object(l.D)(i, [])
            }
            var c = e;
            return Object(l.D)(c, [])
        },
        gr = function(e) {
            return function(t, n) {
                if ("object" != typeof t) return Object(l.g)("object", typeof t, n);
                if (null === t) return Object(l.g)("object", "null", n);
                var r, o = t.type,
                    i = Object(s.a)(t, ["type"]);
                if (null === e) {
                    if ("string" != typeof o) return Object(l.g)("a string such as 'card', 'ideal', or 'sepa_debit'", typeof o, Object(l.e)(n, "type"));
                    r = o
                } else {
                    if (void 0 !== o && o !== e) return "string" != typeof o ? Object(l.g)("a string such as 'card', 'ideal', or 'sepa_debit'", typeof o, Object(l.e)(n, "type")) : Object(l.g)('"'.concat(o, '"'), '"'.concat(e, '"'), Object(l.e)(n, "type"));
                    r = e
                }
                var c = i[r],
                    u = (i[r], Object(s.a)(i, [r].map(tr)));
                if (-1 !== ["acss_debit", "affirm", "afterpay_clearpay", "alipay", "bancontact", "customer_balance", "eps", "giropay", "grabpay", "klarna", "konbini", "oxxo", "p24", "paynow", "paypal", "us_bank_account", "wechat_pay", "paynow", "promptpay"].indexOf(r) && void 0 === c && (c = {}), "object" != typeof c) return Object(l.g)("an object or element", typeof t[r], Object(l.e)(n, r));
                if (null === c) return Object(l.g)("an object or element", "null", Object(l.e)(n, r));
                var p = or(c);
                if (p) {
                    var d = p._componentName;
                    if (ur[d] !== r) {
                        var f = [].concat(Object(a.a)(n.path), [r]).join("."),
                            m = n.label,
                            _ = new O.a("Invalid value for ".concat(m, ": ").concat(f, " was `").concat(d, "` Element, which cannot be used to create ").concat(r, " PaymentMethods."));
                        return Object(l.f)(_)
                    }
                    return Object(l.D)({
                        type: r,
                        element: p,
                        data: u
                    })
                }
                return Object(l.D)({
                    type: r,
                    element: null,
                    data: i
                })
            }
        },
        Or = Object(l.G)(Object(l.u)({
            handleActions: Object(l.G)(l.b, (function() {
                return !0
            }))
        }), (function() {
            return {
                handleActions: !0
            }
        })),
        jr = function(e) {
            return function(t, n) {
                return "object" != typeof t ? Object(l.g)("object", typeof t, n) : null === t ? Object(l.g)("object", "null", n) : Object(l.D)({
                    type: "".concat(e),
                    billing_details: t.billing_details
                })
            }
        },
        Er = function(e, t) {
            return function(n, o) {
                if (void 0 === n) return Object(l.D)({
                    paymentMethodData: null,
                    paymentMethodOptions: null,
                    source: null,
                    paymentMethod: null,
                    otherParams: {}
                });
                if ("object" != typeof n) return Object(l.g)("object", typeof n, o);
                if (null === n) return Object(l.g)("object", "null", o);
                var i = n.source,
                    c = n.source_data,
                    u = n.payment_method_data,
                    d = n.payment_method_options,
                    f = n.payment_method,
                    m = Object(s.a)(n, ["source", "source_data", "payment_method_data", "payment_method_options", "payment_method"]);
                if (null != c) throw new O.a("".concat(t, ": Expected payment_method, or source, not source_data."));
                if (null != u) throw new O.a("".concat(t, ": Expected payment_method, or source, not payment_method_data."));
                if (null != i && null != f) throw new O.a("".concat(t, ": Expected either payment_method or source, but not both."));
                if (null === e && null != f && "string" != typeof f) throw new O.a("".concat(t, ": Expected payment_method[type] to be set if payment_method is passed."));
                if (null != i) {
                    if ("string" != typeof i) return Object(l.g)("string", typeof i, Object(l.e)(o, "source"));
                    if ("updatePaymentIntent" === t) throw new O.a("".concat(t, ": Expected payment_method, not source to be passed."));
                    return Object(l.D)({
                        source: i,
                        paymentMethodData: null,
                        paymentMethodOptions: null,
                        paymentMethod: null,
                        otherParams: m
                    })
                }
                if (null != f && "string" != typeof f && "object" != typeof f) return Object(l.g)("string or object", typeof f, Object(l.e)(o, "payment_method"));
                var _, h = Object(l.F)((_ = e, function(e, t) {
                    if (null == e) return Object(l.D)(null);
                    if ("object" != typeof e) return Object(l.g)("object", typeof e, t);
                    var n = e.card,
                        a = Object(s.a)(e, ["card"]);
                    if (!n || "object" != typeof n) return Object(l.D)(e);
                    var o = n.cvc,
                        i = Object(s.a)(n, ["cvc"]);
                    if (null == o) return Object(l.D)(e);
                    var c = or(o),
                        u = c ? c._componentName : "";
                    return p.b.cardCvc !== u ? Object(l.g)("`".concat(p.b.cardCvc, "` Element"), u ? "`".concat(u, "` Element") : typeof o, Object(l.e)(t, "".concat(_ || "card", ".cvc"))) : Object(l.D)(Object(r.a)(Object(r.a)({}, a), {}, {
                        card: Object(r.a)(Object(r.a)({}, i), {}, {
                            cvc: c
                        })
                    }))
                }), d, t, {
                    path: [].concat(Object(a.a)(o.path), ["payment_method_options"])
                });
                if ("error" === h.type) return h;
                if ("string" == typeof f) return Object(l.D)({
                    source: null,
                    paymentMethodData: null,
                    paymentMethodOptions: h.value,
                    paymentMethod: f,
                    otherParams: m
                });
                if ("object" == typeof f && null !== f) {
                    var y = Object(l.F)(gr(e), f, t, {
                        path: [].concat(Object(a.a)(o.path), ["payment_method"])
                    });
                    if ("error" === y.type) return y;
                    var b = y.value;
                    return Object(l.D)({
                        source: null,
                        paymentMethod: null,
                        paymentMethodOptions: h.value,
                        paymentMethodData: b,
                        otherParams: m
                    })
                }
                return Object(l.D)({
                    source: null,
                    paymentMethodData: null,
                    paymentMethodOptions: null,
                    paymentMethod: null,
                    otherParams: m
                })
            }
        },
        wr = ["affirm", "afterpay_clearpay", "alipay", "au_becs_debit", "bancontact", "boleto", "card", "eps", "fpx", "giropay", "grabpay", "ideal", "klarna", "konbini", "link", "oxxo", "p24", "paynow", "paypal", "promptpay", "sepa_debit", "sofort", "us_bank_account", "wechat_pay", "nz_bank_account", "apple_pay", "google_pay"],
        kr = Object(l.u)({
            billingDetails: Object(l.s)(Object(l.t)(Object(l.q)("never", "auto"), Object(l.u)({
                name: Object(l.s)(Object(l.q)("never", "auto")),
                phone: Object(l.s)(Object(l.q)("never", "auto")),
                email: Object(l.s)(Object(l.q)("never", "auto")),
                address: Object(l.s)(Object(l.t)(Object(l.q)("never", "auto"), Object(l.u)({
                    country: Object(l.s)(Object(l.q)("never", "auto")),
                    postalCode: Object(l.s)(Object(l.q)("never", "auto")),
                    state: Object(l.s)(Object(l.q)("never", "auto")),
                    city: Object(l.s)(Object(l.q)("never", "auto")),
                    line1: Object(l.s)(Object(l.q)("never", "auto")),
                    line2: Object(l.s)(Object(l.q)("never", "auto"))
                })))
            })))
        }),
        Pr = Object(l.u)({
            bancontact: Object(l.s)(Object(l.q)("auto", "always", "never")),
            card: Object(l.s)(Object(l.q)("auto", "always", "never")),
            ideal: Object(l.s)(Object(l.q)("auto", "always", "never")),
            sepaDebit: Object(l.s)(Object(l.q)("auto", "always", "never")),
            sofort: Object(l.s)(Object(l.q)("auto", "always", "never")),
            auBecsDebit: Object(l.s)(Object(l.q)("auto", "always", "never")),
            usBankAccount: Object(l.s)(Object(l.q)("auto", "always", "never"))
        }),
        Sr = Object(l.u)({
            applePay: Object(l.s)(Object(l.q)("auto", "never")),
            googlePay: Object(l.s)(Object(l.q)("auto", "never"))
        }),
        Ar = {
            locale: Object(l.j)("elements()"),
            fonts: Object(l.j)("elements()"),
            defaultValues: Object(l.s)(Object(l.u)({
                email: l.x
            }))
        },
        Tr = Object(l.u)(Ar),
        Ir = {
            locale: Object(l.j)("elements()"),
            fonts: Object(l.j)("elements()"),
            business: Object(l.s)(Object(l.u)({
                name: l.x
            })),
            paymentMethodOrder: Object(l.s)(Object(l.a)(l.x)),
            fields: Object(l.s)(kr),
            readOnly: Object(l.s)(l.b),
            terms: Object(l.s)(Pr),
            wallets: Object(l.s)(Sr)
        },
        Cr = {
            locale: Object(l.j)("elements()"),
            fonts: Object(l.j)("elements()"),
            allowedCountries: Object(l.s)(Object(l.a)(l.x))
        },
        Nr = Object(l.u)(Cr),
        Rr = function(e, t, n, a, o) {
            switch (e) {
                case "linkAuthentication":
                    var i = Object(l.E)(Tr, t, n),
                        c = i.value;
                    c.locale, c.fonts;
                    return {
                        value: Object(s.a)(c, ["locale", "fonts"]), warnings: i.warnings
                    };
                case "payment":
                    var u = Object(l.E)(function(e, t) {
                            var n = Ir;
                            return Object(it.d)(t, it.a.payment_element_beta_1) && (n = Object(r.a)(Object(r.a)({}, n), {}, {
                                appearance: Object(l.s)(l.p),
                                clientSecret: hr
                            }), e && (n = Object(r.a)(Object(r.a)({}, n), {}, {
                                clientSecret: Object(l.s)(hr)
                            }))), Object(l.u)(n)
                        }(a, o), t, n),
                        p = u.value,
                        d = (p.locale, p.fonts, p.clientSecret),
                        f = void 0 === d ? void 0 : d,
                        m = Object(s.a)(p, ["locale", "fonts", "clientSecret"]),
                        _ = u.warnings;
                    return {
                        value: Object(r.a)({
                            parsedIntentSecret: f
                        }, m), warnings: _
                    };
                case "shippingAddress":
                    var h = Object(l.E)(Nr, t, n),
                        y = h.value;
                    y.locale, y.fonts;
                    return {
                        value: Object(s.a)(y, ["locale", "fonts"]), warnings: h.warnings
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        xr = n(27),
        Mr = "close",
        Lr = "complete",
        Dr = (Object(l.w)("bcsess_"), {
            test: "pk_test_51IRoVcAI0bnnJOjmMRHo1VmwhAhWw6hYu50LlvNiObGGwSGMWHHgJew4g7fD8JS6m0LZZeU4M4ADNU1fjNG4BrDF00NrfWM8Xp",
            live: "pk_live_51IRoVcAI0bnnJOjmkQjg7OxC4Yx4OTniNC6VZT2ufgCDenJDYdLVIoFjaZ5PpESYtt7pT1q12mYsKN9w9BN0RoM100GeMvV1N2"
        }),
        qr = function(e, t) {
            return new u.a((function(n) {
                var r;
                try {
                    r = t.createLightboxFrame({
                        type: p.c.LINKED_ACCOUNTS_INNER,
                        options: e
                    })
                } catch (e) {
                    return n({
                        error: {
                            message: e.message
                        }
                    })
                }
                return r.show(), r.fadeInBackdrop(), r._on(Mr, (function() {
                    r.fadeOutBackdrop()
                })), r._on(Lr, (function(e) {
                    r.destroy(!0).then((function() {
                        n(function(e) {
                            switch (e.type) {
                                case "object":
                                    var t = e.object,
                                        n = t.id,
                                        r = t.linked_accounts,
                                        a = t.payment_account,
                                        o = {
                                            id: n,
                                            linkedAccounts: r
                                        };
                                    return a && (o.paymentAccount = a), {
                                        linkAccountSession: o,
                                        linkedAccounts: r
                                    };
                                case "error":
                                    return {
                                        error: {
                                            message: e.error.message || "stripe.linkAccounts: an unknown error occurred.",
                                            type: e.error.type
                                        }
                                    };
                                default:
                                    return Object(ht.a)(e)
                            }
                        }(e))
                    }))
                })), null
            }))
        },
        Br = function(e) {
            var t, n = e.linkAccountSessionCreatorClientSecret,
                r = e.linkAccountSessionCreatorType,
                a = e.linkAccountSessionCreatorId,
                o = e.controller,
                i = e.consumerSessionSecret,
                c = e.redirect,
                s = e.data;
            t = o.warn, at("minimum-scale=1") || t('LinkedAccounts requires "minimum-scale=1" to be set in your page\'s viewport meta tag.');
            var u = o._stripeAccount,
                l = o._apiVersion,
                p = o._apiKey,
                f = Object(d.c)(p);
            return "link_payment_intent" === r && "unknown" !== f && (p = Dr[f], l = null), c ? function(e, t) {
                var n = "".concat("https://auth.stripe.com/", "link-accounts#").concat(Object(v.a)(e));
                return Object(xr.a)(n).then((function(e) {
                    Object(xr.b)(t, "linkAccounts redirect", e);
                    var n = e.error;
                    return {
                        error: {
                            message: n.message,
                            code: n.code,
                            type: n.type
                        }
                    }
                }))
            }({
                clientSecret: n,
                apiKey: p,
                stripeAccount: u,
                stripeVersion: l
            }, o) : qr({
                clientSecret: n,
                linkAccountSessionCreatorType: r,
                linkAccountSessionCreatorId: a,
                apiKey: p,
                consumerSessionSecret: i,
                stripeAccount: u,
                stripeVersion: l,
                data: s
            }, o)
        },
        Fr = function(e, t) {
            var n, r, a, o = "applePay" === t ? "googlePay" : "applePay",
                i = null !== (n = null !== (r = e.businessName) && void 0 !== r ? r : null === (a = Object(ot.d)(location.origin)) || void 0 === a ? void 0 : a.host) && void 0 !== n ? n : location.origin;
            return {
                currency: "PAYMENT_INTENT" === e.type ? e.paymentIntent.currency : "usd",
                country: e.merchantCountryCode,
                total: {
                    label: i,
                    amount: "PAYMENT_INTENT" === e.type ? e.paymentIntent.amount : 0
                },
                requestPayerName: !0,
                requestPayerEmail: !1,
                requestPayerPhone: !1,
                disableWallets: ["browserCard", o]
            }
        },
        Ur = function(e, t, n, r, a) {
            var o = new An({
                controller: t.controller,
                authentication: {
                    apiKey: t.controller._apiKey,
                    accountId: t.controller._stripeAccount || null
                },
                mids: t.mids,
                rawOptions: Fr(e, a),
                betas: t.betas,
                queryStrategyOverride: null,
                listenerRegistry: n
            });
            return o._on("token", (function(e) {
                t.controller.action.completeWalletConfirm({
                    type: "token",
                    token: e.token.id
                }).then((function() {
                    e.complete("success")
                })).catch((function() {
                    e.complete("unexpected failure")
                }))
            })), o._on("cancel", (function() {
                t.controller.action.completeWalletConfirm({
                    type: "cancelled"
                })
            })), o.canMakePayment().then((function(e) {
                e && e[a] && (r.send({
                    action: "should-list-wallet",
                    payload: {
                        wallet: a
                    }
                }), r._on("show-wallet", (function(e) {
                    (function(e) {
                        return e.replace(/_./g, (function(e) {
                            return e[1].toUpperCase()
                        }))
                    })(e) === a && o.show()
                })))
            })), o
        },
        Yr = function(e, t) {
            var n = e.createHiddenFrame(p.c.GOOGLE_MAPS_APP, {
                apiKey: "AIzaSyCuvGvOqj_eSUVyAu3Dwq47JBdpAN3r-5Y"
            });
            return n._on("get-google-maps-predictions", (function(e) {
                ! function(e, t) {
                    n.send({
                        action: "get-google-maps-predictions",
                        payload: {
                            data: {
                                search: e,
                                countryRestrictions: t
                            }
                        }
                    })
                }(e.search, e.countryRestrictions)
            })), n._on("get-google-maps-details", (function(e) {
                ! function(e) {
                    n.send({
                        action: "get-google-maps-details",
                        payload: {
                            data: {
                                placeId: e
                            }
                        }
                    })
                }(e.placeId)
            })), n._on("google-maps-callback", (function(e) {
                var n = e.event,
                    r = e.message;
                switch (n) {
                    case "gotPredictions":
                        ! function(e) {
                            t.send({
                                action: "google-maps-predictions",
                                payload: {
                                    data: e
                                }
                            })
                        }(r);
                        break;
                    case "gotDetails":
                        ! function(e) {
                            t.send({
                                action: "google-maps-details",
                                payload: {
                                    data: e
                                }
                            })
                        }(r)
                }
            })), n
        },
        Gr = function(e) {
            e.parsedIntentSecret;
            return Object(s.a)(e, ["parsedIntentSecret"])
        },
        Hr = function(e) {
            var t = e.component,
                n = e.listenerRegistry,
                a = e.elementTimings,
                o = e.getParent,
                i = e.emitEvent,
                c = e.options,
                s = e.selfDestruct,
                u = null,
                l = [],
                p = function(e) {
                    var t = e.controller,
                        n = e.componentName,
                        r = e.groupId,
                        a = e.locale,
                        o = e.betas,
                        i = e.fonts,
                        c = e.wait,
                        s = e.appearance,
                        u = e.publicOptions,
                        l = {
                            locale: a,
                            betas: o,
                            fonts: i,
                            wait: c,
                            appearance: s,
                            rtl: Mn(document.body),
                            publicOptions: Gr(u)
                        },
                        p = Ze.b[n];
                    return t.createElementFrame(p, n, r, l)
                }(c),
                f = function(e) {
                    if (e.elementsSessionPromise) return e.elementsSessionPromise;
                    if ("payment" === e.componentName && e.publicOptions.parsedIntentSecret) return e.controller.action.retrieveElementsSession({
                        intentSecret: e.publicOptions.parsedIntentSecret,
                        customerOptions: null,
                        locale: e.locale
                    });
                    throw new O.a("In order to create a ".concat(e.componentName, ' element, you must pass a valid PaymentIntent or SetupIntent client secret when creating the Elements group.\n\ne.g. stripe.elements({clientSecret: "{{CLIENT_SECRET}}"})'))
                }(c).then((function(e) {
                    return "error" === e.type ? (i("loaderror", {
                        error: e.error
                    }), s(), null) : function(e) {
                        var t = e.link_settings,
                            n = e.business_name,
                            a = e.merchant_country,
                            o = e.customer_info,
                            i = e.payment_method_preference,
                            c = i.country_code,
                            s = i.ordered_payment_method_types,
                            u = e.apple_pay_preference,
                            l = e.google_pay_preference,
                            p = e.ordered_payment_method_types_and_wallets,
                            d = e.unactivated_payment_method_types,
                            f = e.flags,
                            m = e.experiments,
                            _ = e.payment_method_preference,
                            h = "payment_intent" === _.type ? {
                                type: "PAYMENT_INTENT",
                                paymentIntent: _.payment_intent
                            } : {
                                type: "SETUP_INTENT",
                                setupIntent: _.setup_intent
                            };
                        return Object(r.a)(Object(r.a)({}, h), {}, {
                            linkSettings: t,
                            orderedPaymentMethodTypes: s,
                            customerInfo: o || null,
                            applePayPreference: u,
                            googlePayPreference: l,
                            orderedPaymentMethodTypesAndWallets: p,
                            merchantCountryCode: a || null,
                            businessName: n || null,
                            detectedCountryCode: c || null,
                            unactivatedPaymentMethodTypes: d || null,
                            featureFlags: f,
                            experiments: m
                        })
                    }(e.object)
                })),
                m = f.then((function(e) {
                    if (e) {
                        if (function(e, t, n) {
                                var r = e.unactivatedPaymentMethodTypes || [];
                                if (r.length > 0)
                                    if (t === d.a.test) {
                                        var a = "- ".concat(r.join("\n- "));
                                        n.warn("The following payment method types are not activated:\n\n".concat(a, "\n\nThey will be displayed in test mode, but hidden in live mode. Please activate the payment method types in your dashboard (https://dashboard.stripe.com/settings/payment_methods) and ensure your account is enabled for any preview features that you are trying to use."))
                                    } else e.orderedPaymentMethodTypes = e.orderedPaymentMethodTypes.filter((function(e) {
                                        return -1 === r.indexOf(e)
                                    })), e.orderedPaymentMethodTypesAndWallets = e.orderedPaymentMethodTypesAndWallets.filter((function(e) {
                                        return -1 === r.indexOf(e)
                                    }))
                            }(e, c.controller.keyMode(), c.controller), "shippingAddress" === c.componentName && Object(it.d)(c.betas, "shipping_address_element_beta_1")) {
                            var t = Yr(c.controller, p);
                            p._on("get-google-maps-predictions", (function(e) {
                                t._emit("get-google-maps-predictions", e)
                            })), p._on("get-google-maps-details", (function(e) {
                                t._emit("get-google-maps-details", e)
                            }))
                        }
                        if ("payment" === c.componentName) {
                            var r, a, o = c.publicOptions,
                                u = e.paymentIntent || e.setupIntent,
                                f = function(e, t) {
                                    if (e.payment_method_types.every((function(e) {
                                            return -1 === wr.indexOf(e)
                                        }))) {
                                        var n = wr.join(", ");
                                        return {
                                            type: "validation_error",
                                            code: "unsupported_parameter",
                                            param: "payment_method_types",
                                            message: "The PaymentIntent you passed doesn't have any payment_method_types that are supported by the Payment Element. Please use a PaymentIntent with a least one of the following payment_method_types: ".concat(n)
                                        }
                                    }
                                    var r = -1 !== e.payment_method_types.indexOf("card");
                                    return -1 === e.payment_method_types.indexOf("link") || r ? null : {
                                        type: "validation_error",
                                        code: "unsupported_parameter",
                                        param: "payment_method_types",
                                        message: "The PaymentIntent you passed has 'link' in the payment_method_types but not 'card'. To use 'link' with the PaymentElement, please pass both 'link' and 'card'"
                                    }
                                }(u, c.publicOptions);
                            f && (i("loaderror", {
                                error: f
                            }), s()); - 1 !== u.payment_method_types.indexOf(sr.afterpay_clearpay) && (y = Xn().then((function(e) {
                                var t = e.mountModal,
                                    n = e.unmountModal;
                                return l.push((function() {
                                    n()
                                })), t
                            })), p._on("mount-afterpay-modal", (function(e) {
                                var t = e.locale,
                                    r = e.modalTheme;
                                y.then((function(e) {
                                    e({
                                        controller: c.controller,
                                        listenerRegistry: n,
                                        locale: t,
                                        modalTheme: r
                                    })
                                }))
                            })));
                            var m = "never" === (null === (r = o.wallets) || void 0 === r ? void 0 : r.applePay),
                                _ = "never" === (null === (a = o.wallets) || void 0 === a ? void 0 : a.googlePay),
                                h = Object(it.d)(c.betas, "payment_element_beta_1") && !Object(it.d)(c.betas, "payment_element_apple_pay_beta_1");
                            h || m || "unknown" !== e.applePayPreference && "enabled" !== e.applePayPreference || Ur(e, c, n, p, "applePay"), h || _ || "unknown" !== e.googlePayPreference && "enabled" !== e.googlePayPreference || Ur(e, c, n, p, "googlePay"); - 1 !== u.payment_method_types.indexOf(sr.link) && p._on("link-launch", (function(e) {
                                var t, n, r, a, o = e.consumerClientSecret;
                                (t = u.client_secret, n = u.id, r = c.controller, a = o, Br({
                                    linkAccountSessionCreatorClientSecret: t,
                                    linkAccountSessionCreatorType: "link_payment_intent",
                                    linkAccountSessionCreatorId: n,
                                    controller: r,
                                    consumerSessionSecret: a
                                })).then((function(e) {
                                    !e.error && e.linkAccountSession.paymentAccount && c.controller.action.createBankPaymentDetails({
                                        bankAccount: e.linkAccountSession.paymentAccount.id,
                                        groupId: c.groupId
                                    })
                                }))
                            }))
                        }
                        var y
                    }
                }));
            Object(x.d)(t, Ln.a), p.appendTo(t), p.updateStyle(function(e) {
                switch (e) {
                    case "linkAuthentication":
                    case "payment":
                    case "shippingAddress":
                        return {
                            height: "2px"
                        };
                    default:
                        return Object(ht.a)(e)
                }
            }(c.componentName)), p._on("load", (function() {
                p.send({
                    action: "stripe-user-mount",
                    payload: {
                        timestamps: {
                            stripeJsLoad: a.stripeJsLoadTimestamp.getAsPosixTime(),
                            stripeCreate: a.stripeCreateTimestamp.getAsPosixTime(),
                            groupCreate: a.groupCreateTimestamp.getAsPosixTime(),
                            create: a.createTimestamp.getAsPosixTime(),
                            mount: u ? u.getAsPosixTime() : 0
                        },
                        rtl: Mn(o())
                    }
                })
            })), Ze.e.forEach((function(e) {
                p._on(e, (function(t) {
                    return i(e, t)
                }))
            })), p._on("set_styles", (function(e) {
                p.updateStyle(e)
            })), p._on("redirectfocus", (function(e) {
                var n, r = e.focusDirection;
                null === (n = Object(ie.b)(t, r)) || void 0 === n || n.focus()
            }));
            return {
                update: function(e) {
                    p.update(e)
                },
                focus: function() {
                    document.activeElement && document.activeElement.blur && document.activeElement.blur(), p.focus(), p.send({
                        action: "stripe-user-focus",
                        payload: {}
                    })
                },
                blur: function() {
                    p.blur()
                },
                clear: function() {
                    p.clear()
                },
                mount: function() {
                    f.then((function(e) {
                        e && p.send({
                            action: "stripe-intent-retrieved",
                            payload: e
                        })
                    })), u = new Ve.a;
                    var e = o();
                    e && (Object(x.f)(e, [
                        [Ze.a, !0]
                    ]), l.push((function() {
                        Object(x.f)(e, [
                            [Ze.a, !1]
                        ])
                    })))
                },
                unmount: function() {
                    for (; l.length;) l.pop()();
                    p.unmount()
                },
                collapse: function() {
                    p.collapse()
                },
                _frame: p,
                __setupDonePromise: m
            }
        },
        zr = function(e) {
            var t = e.options,
                n = Object(s.a)(e, ["options"]),
                a = t.controller,
                o = t.componentName,
                i = t.publicOptions,
                c = Object(s.a)(t, ["controller", "componentName", "publicOptions"]),
                u = function(e) {
                    switch (e) {
                        case "linkAuthentication":
                        case "payment":
                        case "shippingAddress":
                            return e;
                        default:
                            throw new Error("Unexpected element type for implementation")
                    }
                }(o),
                l = Rr(u, i || {}, "elements.create('".concat(u, "')"), !1, t.betas);
            l.warnings.forEach((function(e) {
                return a.warn(e)
            }));
            var p = Hr(Object(r.a)(Object(r.a)({}, n), {}, {
                    options: Object(r.a)(Object(r.a)({}, c), {}, {
                        controller: a,
                        componentName: u,
                        publicOptions: l.value
                    })
                })),
                d = p.update,
                f = Object(s.a)(p, ["update"]);
            return Object(r.a)({
                update: function(e) {
                    var n = Rr(u, e || {}, "".concat(u, ".update()"), !0, t.betas);
                    n.warnings.forEach((function(e) {
                        return a.warn(e)
                    })), d(n.value)
                }
            }, f)
        },
        Wr = function(e, t) {
            var n = function(e) {
                if (!mt.b[e]) throw new Error("Unexpected Element type: ".concat(e, "."));
                return mt.b[e].implementation
            }(e);
            switch (n) {
                case "legacy":
                    return new zn(t);
                case "affirm_message":
                    return Jn(t);
                case "afterpay_message":
                    return Qn(t);
                case "frame":
                    return zr(t);
                default:
                    return Object(ht.a)(n, "Unexpected implementation type: ".concat(n, "."))
            }
        },
        Kr = function(e) {
            Object(y.a)(n, e);
            var t = Object(b.a)(n);

            function n(e, a, i) {
                var c;
                Object(o.a)(this, n), (c = t.call(this)).mount = w((function(e) {
                    var t;
                    if (c._checkDestroyed(), !e) throw new O.a("Missing argument. Make sure to call mount() with a valid DOM element or selector.");
                    if ("string" == typeof e) {
                        var n = document.querySelectorAll(e);
                        if (n.length > 1 && c._controller.warn("The selector you specified (".concat(e, ") applies to ").concat(n.length, " DOM elements that are currently on the page.\nThe Stripe Element will be mounted to the first one.")), !n.length) throw new O.a("The selector you specified (".concat(e, ") applies to no DOM elements that are currently on the page.\nMake sure the element exists on the page before calling mount()."));
                        t = n[0]
                    } else {
                        if (!e.appendChild) throw new O.a("Invalid DOM element. Make sure to call mount() with a valid DOM element or selector.");
                        t = e
                    }
                    if ("INPUT" === t.nodeName) throw new O.a("Stripe Elements must be mounted in a DOM element that\ncan contain child nodes. `input` elements are not permitted to have child\nnodes. Try using a `div` element instead.");
                    t.children.length && c._controller.warn("This Element will be mounted to a DOM element that contains child nodes."), c._mountToParent(t)
                })), c.update = w((function(e) {
                    return c._checkDestroyed(), c._implementation.update(e), Object(C.a)(c)
                })), c.focus = w((function(e) {
                    return c._checkDestroyed(), e && e.preventDefault(), c._implementation.focus(), Object(C.a)(c)
                })), c.blur = w((function() {
                    return c._checkDestroyed(), c._implementation.blur(), Object(C.a)(c)
                })), c.clear = w((function() {
                    return c._checkDestroyed(), c._implementation.clear(), Object(C.a)(c)
                })), c.collapse = w((function() {
                    if (c._checkDestroyed(), !c._implementation.collapse) throw new O.a("Collapse is not supported by the ".concat(c._componentName, " Element."));
                    return c._implementation.collapse(), Object(C.a)(c)
                })), c.unmount = w((function() {
                    return c._checkDestroyed(), c._unmount(), Object(C.a)(c)
                })), c.destroy = w((function() {
                    return c._checkDestroyed(), c.unmount(), c._destroyed = !0, c._emitEvent("destroy"), Object(C.a)(c)
                })), c._getParent = function() {
                    return c._parent
                }, c._emitEvent = function(e, t) {
                    return "loaderror" !== e || c._hasRegisteredListener("loaderror") || c._controller.keyMode() !== d.a.test || console.error("Unhandled ".concat(c._componentName, " Element loaderror"), t), c._emit(e, Object(r.a)({
                        elementType: c._componentName
                    }, t))
                };
                var s = e.controller,
                    u = e.componentName,
                    l = e.mids;
                c._controller = s, c._componentName = u, c._destroyed = !1, c._mids = l;
                var p = document.createElement("div");
                return p.className = mt.d, c._component = p, c._implementation = Wr(c._componentName, {
                    options: e,
                    component: p,
                    listenerRegistry: a,
                    elementTimings: i,
                    emitEvent: c._emitEvent,
                    getParent: c._getParent,
                    selfDestruct: function() {
                        c.destroy()
                    }
                }), c
            }
            return Object(i.a)(n, [{
                key: "_checkDestroyed",
                value: function() {
                    if (this._destroyed) throw new O.a("This Element has already been destroyed. Please create a new one.")
                }
            }, {
                key: "_isMounted",
                value: function() {
                    return !!document.body && document.body.contains(this._component)
                }
            }, {
                key: "_unmount",
                value: function() {
                    var e = this._component.parentElement;
                    e && e.removeChild(this._component), this._implementation.unmount(), this._parent = null
                }
            }, {
                key: "_mountToParent",
                value: function(e) {
                    var t = this._component.parentElement,
                        n = this._isMounted();
                    if (e === t) {
                        if (n) return;
                        this.unmount(), this._mountTo(e)
                    } else if (t) {
                        if (n) throw new O.a("This Element is already mounted. Use `unmount()` to unmount the Element before re-mounting.");
                        this.unmount(), this._mountTo(e)
                    } else this._mountTo(e)
                }
            }, {
                key: "_mountTo",
                value: function(e) {
                    for (this._parent = e; e.firstChild;) e.removeChild(e.firstChild);
                    e.appendChild(this._component), this._controller.report("mount", {
                        element: this._componentName
                    }), this._implementation.mount()
                }
            }]), n
        }(T),
        Vr = function(e, t) {
            e._controller.report("legacy_private_property_used", {
                prop: t,
                componentName: e._componentName
            })
        };
    ["_autofilled", "_classes", "_complete", "_empty", "_fakeInput", "_focused", "_frame", "_invalid", "_lastBackgroundColor", "_lastFontSize", "_lastHeight", "_lastPadding", "_lastSubmittedAt", "_listenerRegistry", "_paymentRequest"].forEach((function(e) {
        Object.defineProperty(Kr.prototype, e, {
            enumerable: !1,
            get: function() {
                return Vr(this, e), this._implementation[e]
            }
        })
    }));
    ["_formSubmit", "_isIssuingDisplayElement"].forEach((function(e) {
        Object.defineProperty(Kr.prototype, e, {
            enumerable: !1,
            writable: !1,
            value: function() {
                return Vr(this, e), this._implementation[e]()
            }
        })
    }));
    var Jr = Kr,
        $r = Object(l.u)({
            locale: Object(l.s)(l.x),
            appearance: Object(l.s)(l.p)
        }),
        Zr = function e(t, n, i, c, u, p) {
            var d = this;
            Object(o.a)(this, e), this.getElement = w((function(e) {
                var t, n = (null != (t = e) && t.__elementType && "string" == typeof t.__elementType && "function" == typeof t ? t.__elementType : null) || e;
                return _t(n, d._betas), Object(we.a)(d._elements, (function(e) {
                    return e._componentName === n
                })) || null
            })), this.update = w((function(e) {
                var t = Object(l.E)($r, e || {}, "elements.update()"),
                    n = t.value;
                t.warnings.forEach((function(e) {
                    return d._controller.warn(e)
                }));
                var r = n.locale,
                    a = n.appearance,
                    o = void 0 === a ? void 0 : a,
                    i = ft(r, d._betas);
                i && d._controller.action.fetchLocale({
                    locale: i
                }), (o || i) && d._controller.action.updateElementsOptions({
                    locale: i,
                    appearance: o,
                    groupId: d._id
                })
            })), this.create = k((function(e, t) {
                var n = new Ve.a;
                ! function(e, t, n) {
                    if (_t(e, n), mt.b[e].unique && -1 !== t.indexOf(e)) throw new O.a("Can only create one Element of type ".concat(e, "."));
                    var r = mt.b[e].conflict,
                        a = Object(we.f)(t, r);
                    if (a.length) {
                        var o = a[0];
                        throw new O.a("Cannot create an Element of type ".concat(e, " after an Element of type ").concat(o, " has already been created."))
                    }
                }(e, d._elements.map((function(e) {
                    return e._componentName
                })), d._betas);
                var o = Object(r.a)(Object(r.a)(Object(r.a)({}, t), d._commonOptions), {}, {
                        componentName: e,
                        groupId: d._id
                    }),
                    i = (o.paymentRequest, Object(s.a)(o, ["paymentRequest"])),
                    c = (z || K) && Object(v.a)(i).length > 2e3,
                    u = !!d._pendingFonts || c,
                    l = new Jr(Object(r.a)(Object(r.a)({
                        publicOptions: t
                    }, d._commonOptions), {}, {
                        elementsSessionPromise: d._elementsSessionPromise,
                        componentName: e,
                        groupId: d._id,
                        fonts: c ? null : d._commonOptions.fonts,
                        controller: d._controller,
                        wait: u,
                        mids: d._mids
                    }), d._listenerRegistry, Object(r.a)(Object(r.a)({}, d._timings), {}, {
                        createTimestamp: n
                    }));
                return d._elements = [].concat(Object(a.a)(d._elements), [l]), l._on("destroy", (function() {
                    d._elements = d._elements.filter((function(t) {
                        return t._componentName !== e
                    }))
                })), c && l._implementation.update({
                    fonts: d._commonOptions.fonts
                }), l
            }));
            var f, m = new Ve.a,
                h = Object(l.E)(function(e) {
                    var t = {
                        locale: Object(l.s)(l.x),
                        fonts: Object(l.s)(Object(l.a)(l.p)),
                        appearance: Object(l.s)(l.p),
                        clientSecret: Object(l.s)(hr)
                    };
                    return Object(it.d)(e, it.a.elements_customers_beta_1) ? Object(l.u)(Object(r.a)(Object(r.a)({}, t), {}, {
                        customerOptions: Object(l.s)(Object(l.u)({
                            customer: l.x,
                            ephemeralKey: l.x
                        }))
                    })) : Object(l.u)(t)
                }(c), p || {}, "elements()"),
                y = h.value;
            h.warnings.forEach((function(e) {
                return t.warn(e)
            })), f = t.warn, at("width=device-width") || f('Elements requires "width=device-width" be set in your page\'s viewport meta tag.\n       For more information: https://stripe.com/docs/js/appendix/viewport_meta_requirements'), t.report("elements", {
                options: y
            });
            var b = y.fonts,
                g = void 0 === b ? [] : b,
                j = y.locale,
                E = y.customerOptions,
                P = void 0 === E ? null : E,
                S = Object(s.a)(y, ["fonts", "locale", "customerOptions"]),
                A = y.appearance ? y.appearance : {};
            this._elements = [], this._id = _("elements"), this._timings = Object(r.a)(Object(r.a)({}, i), {}, {
                groupCreateTimestamp: m
            }), this._controller = t, this._betas = c, this._listenerRegistry = n, this._mids = u;
            var T = ft(j, c);
            this._controller.action.fetchLocale({
                locale: T || "auto"
            });
            var I = g.filter((function(e) {
                    return !e.cssSrc || "string" != typeof e.cssSrc
                })).map((function(e) {
                    return Object(r.a)(Object(r.a)({}, e), {}, {
                        __resolveFontRelativeTo: window.location.href
                    })
                })),
                C = g.map((function(e) {
                    return e.cssSrc
                })).reduce((function(e, t) {
                    return "string" == typeof t ? [].concat(Object(a.a)(e), [t]) : e
                }), []).map((function(e) {
                    return Object(ot.b)(e) ? e : Object(ot.c)(window.location.href, e)
                }));
            return this._pendingFonts = C.length, this._elementsSessionPromise = S.clientSecret && t.action.retrieveElementsSession({
                intentSecret: S.clientSecret,
                customerOptions: P,
                locale: j
            }), this._commonOptions = Object(r.a)(Object(r.a)({}, S), {}, {
                betas: c,
                appearance: A,
                locale: T,
                fonts: I
            }), C.forEach((function(e) {
                if ("string" == typeof e) {
                    var t = new Ve.a;
                    dt(e).then((function(n) {
                        d._controller.report("font.loaded", {
                            load_time: t.getElapsedTime(),
                            font_count: n.length,
                            css_src: e
                        });
                        var o = n.map((function(t) {
                            return Object(r.a)(Object(r.a)({}, t), {}, {
                                __resolveFontRelativeTo: e
                            })
                        }));
                        d._controller.action.updateCSSFonts({
                            fonts: o,
                            groupId: d._id
                        }), d._commonOptions = Object(r.a)(Object(r.a)({}, d._commonOptions), {}, {
                            fonts: [].concat(Object(a.a)(d._commonOptions.fonts ? d._commonOptions.fonts : []), Object(a.a)(o))
                        })
                    })).catch((function(n) {
                        d._controller.report("error.font.not_loaded", {
                            load_time: t.getElapsedTime(),
                            message: n && n.message && n.message,
                            css_src: e
                        }), d._controller.warn("Failed to load CSS file at ".concat(e, "."))
                    }))
                }
            })), this
        },
        Xr = function(e, t, n, r, a, o, i) {
            return new An({
                controller: e,
                authentication: t,
                mids: n,
                rawOptions: r,
                betas: a,
                queryStrategyOverride: o,
                listenerRegistry: i
            })
        },
        Qr = Object(l.u)({
            name: Object(l.q)("react-stripe-js", "stripe-js", "react-stripe-elements"),
            version: Object(l.m)(l.x),
            startTime: Object(l.s)(l.n)
        }),
        ea = Object(l.d)({
            name: Object(l.v)(1, 30),
            partner_id: Object(l.s)(Object(l.w)("pp_partner_")),
            version: Object(l.s)(Object(l.v)(5, 15)),
            url: Object(l.s)(Object(l.v)(4, 60))
        }),
        ta = "publishable",
        na = "secret",
        ra = "ephemeral",
        aa = "restricted",
        oa = "unknown",
        ia = function(e) {
            if ("" === e) throw new O.a("Please call Stripe() with your publishable key. You used an empty string.");
            switch (function(e) {
                    switch (e.split("_", 1)[0]) {
                        case "pk":
                            return ta;
                        case "sk":
                            return na;
                        case "ek":
                            return ra;
                        case "rk":
                            return aa;
                        default:
                            return oa
                    }
                }(e)) {
                case na:
                    throw new O.a("You should not use your secret key with Stripe.js.\n          Please pass a publishable key instead.");
                case ra:
                    throw new O.a("You should not use an ephemeral key with Stripe.js.\n          Please pass a publishable key instead.");
                case aa:
                    throw new O.a("You should not use a restricted key with Stripe.js.\n          Please pass a publishable key instead.")
            }
        },
        ca = ["elements", "createToken", "createPaymentMethod"],
        sa = ["elements", "createSource", "createToken", "createPaymentMethod"],
        ua = function() {
            function e(t) {
                var n = this;
                Object(o.a)(this, e), this._gets = [], this._didDetect = !1, this._onDetection = function(e) {
                    n._didDetect = !0, t(e)
                }, window.Stripe && window.Stripe.__cachedInstances && this._onDetection("react-stripe-elements")
            }
            return Object(i.a)(e, [{
                key: "got",
                value: function(e) {
                    this._didDetect || ("elements" === e ? this._gets = ["elements"] : this._gets.push(e), this._checkForWrapper())
                }
            }, {
                key: "called",
                value: function(e) {
                    this._didDetect || (this._gets = this._gets.filter((function(t) {
                        return t !== e
                    })))
                }
            }, {
                key: "_checkForWrapper",
                value: function() {
                    Object(we.b)(this._gets, ca) ? this._onDetection("react-stripe-js") : Object(we.b)(this._gets, sa) && this._onDetection("react-stripe-elements")
                }
            }]), e
        }(),
        la = function(e) {
            if (!e || "object" != typeof e) return null;
            var t = e.type;
            return {
                type: "string" == typeof t ? t : null,
                data: Object(s.a)(e, ["type"])
            }
        },
        pa = function(e) {
            switch (e.type) {
                case "object":
                    return {
                        source: e.object
                    };
                case "error":
                    return {
                        error: e.error
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        da = {
            source: Object(l.u)({
                id: Object(l.w)("src_"),
                client_secret: Object(l.w)("src_client_secret_")
            })
        },
        fa = Object(l.u)(da),
        ma = function(e) {
            switch (e.type) {
                case "object":
                    return {
                        paymentMethod: e.object
                    };
                case "error":
                    return {
                        error: e.error
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        _a = function(e, t, n, r, a) {
            if ("string" == typeof n) return function(e, t, n, r, a) {
                var o = or(r),
                    i = la(o ? a : r),
                    c = i || {
                        type: null,
                        data: {}
                    },
                    s = c.type,
                    l = c.data;
                if (s && n !== s) return u.a.reject(new O.a("The type supplied in payment_method_data is not consistent."));
                if (o) {
                    var p = o._implementation._frame.id,
                        d = o._componentName;
                    return e.action.createPaymentMethodWithElement({
                        frameId: p,
                        elementName: d,
                        type: n,
                        paymentMethodData: l,
                        mids: t
                    }).then(ma)
                }
                return i ? e.action.createPaymentMethodWithData({
                    elementName: null,
                    type: n,
                    paymentMethodData: l,
                    mids: t
                }).then(ma) : u.a.reject(new O.a("Please provide either an Element or PaymentMethod creation parameters to createPaymentMethod."))
            }(e, t, n, r, a);
            try {
                var o = (f = n, Object(l.E)(gr(null), f, "createPaymentMethod").value),
                    i = o.element,
                    c = o.type,
                    s = o.data;
                if (i) {
                    var p = i._implementation._frame.id,
                        d = i._componentName;
                    return e.action.createPaymentMethodWithElement({
                        frameId: p,
                        elementName: d,
                        type: c,
                        paymentMethodData: s,
                        mids: t
                    }).then(ma)
                }
                return e.action.createPaymentMethodWithData({
                    elementName: null,
                    type: c,
                    paymentMethodData: s,
                    mids: t
                }).then(ma)
            } catch (e) {
                return u.a.reject(e)
            }
            var f
        },
        ha = function(e) {
            var t = e.split(/(?=[A-Z])/).join("-").toLowerCase();
            return "https://stripe.com/docs/stripe-js/reference#stripe-".concat(t)
        },
        ya = function(e, t) {
            return Object(l.E)(yr, e, "stripe.".concat(t, " intent secret")).value
        },
        ba = function(e, t) {
            return Object(l.E)(br, e, "stripe.".concat(t, " intent secret")).value
        },
        va = function(e, t) {
            return Object(l.E)(Or, t, e).value
        },
        ga = function(e, t, n, r) {
            if ("valid" === Object(l.F)(ar, n, t).type) throw new O.a("Do not pass an Element to stripe.".concat(t, "() directly.\n") + "For more information: ".concat(ha(t)));
            var a = Object(l.E)(Er(e, t), n, t).value,
                o = a.source,
                i = a.paymentMethodData,
                c = a.paymentMethodOptions,
                s = a.paymentMethod,
                u = a.otherParams;
            if (null != o && (null != i || null != s)) throw new O.a("".concat(t, ": Expected either source or payment_method, but not both."));
            if (i) {
                if (i.element) return {
                    mode: {
                        tag: "paymentMethod-from-element",
                        type: e,
                        elementName: i.element._componentName,
                        frameId: i.element._implementation._frame.id,
                        data: i.data,
                        options: c,
                        intentSecret: r
                    },
                    otherParams: u
                };
                if (e) return {
                    mode: {
                        tag: "paymentMethod-from-data",
                        type: e,
                        data: i.data,
                        options: c,
                        intentSecret: r
                    },
                    otherParams: u
                }
            } else {
                if (s) return {
                    mode: {
                        tag: "paymentMethod",
                        paymentMethod: s,
                        options: c,
                        intentSecret: r
                    },
                    otherParams: u
                };
                if (o) return {
                    mode: {
                        tag: "source",
                        source: o,
                        intentSecret: r
                    },
                    otherParams: u
                }
            }
            return {
                mode: {
                    tag: "none",
                    intentSecret: r
                },
                otherParams: u
            }
        },
        Oa = function(e, t) {
            var n = e.split("#"),
                r = Object(Me.a)(n, 2),
                a = r[0],
                o = r[1],
                i = a.split("?"),
                c = Object(Me.a)(i, 2),
                s = c[0],
                u = c[1],
                l = "?",
                p = "payment_intent" === t.object ? ["payment_intent", "payment_intent_client_secret", "redirect_status"] : ["setup_intent", "setup_intent_client_secret", "redirect_status"];
            (u || "").split("&").forEach((function(e, t) {
                var n = e.split("="),
                    r = Object(Me.a)(n, 1)[0]; - 1 === p.indexOf(r) && (l += "".concat("?" === l ? "" : "&").concat(e))
            }));
            var d = "payment_intent" === t.object ? "payment" : "setup";
            l += "".concat("?" === l ? "" : "&").concat(d, "_intent=").concat(t.id), l += "&".concat(d, "_intent_client_secret=").concat(t.client_secret);
            var f = s + (l += "&redirect_status=succeeded");
            return o ? "".concat(f, "#").concat(o) : f
        },
        ja = {
            type: "validation_error",
            code: "incomplete_payment_details"
        },
        Ea = {
            type: "instant_verification_error",
            code: "instant_verification"
        },
        wa = {
            type: "validation_error",
            code: "unexpected"
        },
        ka = function(e, t) {
            var n = {
                skipFingerprint: !1,
                sandboxFingerprintFrame: !1,
                sandboxChallengeFrame: !1
            };
            return -1 !== e.indexOf("Y") && (t.report("3ds2.optimization.Y"), n.skipFingerprint = !0), -1 !== e.indexOf("k") && (t.report("3ds2.optimization.k"), n.sandboxFingerprintFrame = !0), -1 !== e.indexOf("5") && (t.report("3ds2.optimization.5"), n.sandboxChallengeFrame = !0), n
        },
        Pa = function(e) {
            return e ? {
                amount: e.amount,
                instrument: {
                    cardBrand: e.instrument.card_brand,
                    cardName: e.instrument.card_name,
                    cardLast4: e.instrument.card_last4
                },
                merchant: {
                    name: e.merchant.name,
                    origin: e.merchant.origin
                },
                credentials: e.credentials,
                authenticationChallenge: e.authentication_challenge,
                configuration: e.configuration,
                layout: e.layout
            } : null
        },
        Sa = function(e) {
            return {
                american_express: "amex",
                visa: "visa",
                mastercard: "mastercard",
                discover: "discover",
                unionpay: "unionpay"
            } [e] || "unknown"
        },
        Aa = function(e, t, n) {
            if (!e) return null;
            if ("use_stripe_sdk" === e.type) {
                var r = e.use_stripe_sdk;
                switch (r.type) {
                    case "intent_confirmation_challenge":
                        return {
                            type: "captcha-challenge", site_key: r.stripe_js.site_key, verification_url: r.stripe_js.verification_url
                        };
                    case "stripe_3ds2_fingerprint":
                        return {
                            type: "3ds2-fingerprint", threeDS2Source: r.three_d_secure_2_source, merchant: r.merchant, cardBrand: Sa(r.directory_server_name), transactionId: r.server_transaction_id, optimizations: ka(r.three_ds_optimizations, n), methodUrl: r.three_ds_method_url, oneClickAuthn: Pa(r.one_click_authn)
                        };
                    case "stripe_3ds2_challenge":
                        return {
                            type: "3ds2-challenge", threeDS2Source: r.stripe_js.three_d_secure_2_source, cardBrand: Sa(r.stripe_js.directory_server_name), transactionId: r.stripe_js.server_transaction_id, optimizations: ka(r.stripe_js.three_ds_optimizations, n), acsTransactionId: r.stripe_js.acs_transaction_id, acsUrl: r.stripe_js.acs_url, oneClickAuthn: Pa(r.stripe_js.one_click_authn), creq: r.stripe_js.creq
                        };
                    case "three_d_secure_redirect":
                        return {
                            type: "3ds1-modal", url: r.stripe_js, source: r.source
                        }
                }
            }
            if ("redirect_to_url" === e.type) return {
                type: "redirect",
                redirectUrl: e.redirect_to_url.url
            };
            if ("alipay_handle_redirect" === e.type) return {
                type: "redirect",
                redirectUrl: e.alipay_handle_redirect.url
            };
            if ("blik_authorize" === e.type) return {
                type: "blik_authorize"
            };
            if ("boleto_display_details" === e.type) return {
                type: "boleto-display",
                hostedVoucherUrl: e.boleto_display_details.hosted_voucher_url
            };
            if ("display_oxxo_details" === e.type) return {
                type: "oxxo-display",
                hostedVoucherUrl: e.display_oxxo_details.hosted_voucher_url
            };
            if ("konbini_display_details" === e.type) return {
                type: "konbini-display",
                hostedVoucherUrl: e.konbini_display_details.hosted_voucher_url
            };
            if ("oxxo_display_details" === e.type) return {
                type: "oxxo-display",
                hostedVoucherUrl: e.oxxo_display_details.hosted_voucher_url
            };
            if ("authorize_with_url" === e.type) {
                n.report("unexpected_action_type", {
                    action: "authorize_with_url"
                });
                var a = e.authorize_with_url.url;
                if (!t) return {
                    type: "redirect",
                    redirectUrl: a
                };
                switch (t) {
                    case sr.card:
                        return {
                            type: "3ds1-modal", url: a, source: null
                        };
                    case sr.ideal:
                        return {
                            type: "redirect", redirectUrl: a
                        }
                }
            }
            return "upi_await_notification" === e.type ? {
                type: "upi_await_notification"
            } : "verify_with_linked_account" === e.type ? {
                type: "us_bank_account_link"
            } : "link_authenticate_account" === e.type ? {
                type: "link_authenticate_account"
            } : "wechat_pay_display_qr_code" === e.type ? {
                type: "wechat_pay_display_qr_code",
                qrCodeUrl: e.wechat_pay_display_qr_code.image_data_url
            } : "paynow_display_qr_code" === e.type ? {
                type: "paynow_display_qr_code",
                qrCodeUrl: e.paynow_display_qr_code.image_data_url
            } : "pix_display_qr_code" === e.type ? {
                type: "pix_display_qr_code",
                qrCodeUrl: e.pix_display_qr_code.image_data_url
            } : "promptpay_display_qr_code" === e.type ? {
                type: "promptpay_display_qr_code",
                qrCodeUrl: e.promptpay_display_qr_code.image_url
            } : null
        },
        Ta = function(e) {
            switch (e.type) {
                case "error":
                    return {
                        error: e.error
                    };
                case "object":
                    switch (e.object.object) {
                        case "payment_intent":
                            return {
                                paymentIntent: e.object
                            };
                        case "setup_intent":
                            return {
                                setupIntent: e.object
                            };
                        default:
                            return Object(ht.a)(e.object)
                    }
                    default:
                        return Object(ht.a)(e)
            }
        },
        Ia = function(e, t, n, r, a) {
            return t === p.g.PAYMENT_INTENT ? n.action.retrievePaymentIntent({
                hosted: false,
                intentSecret: e,
                locale: r,
                asErrorIfNotSucceeded: true,
                expandParam: a || []
            }).then(Ta) : n.action.retrieveSetupIntent({
                hosted: false,
                intentSecret: e,
                locale: r,
                asErrorIfNotSucceeded: true,
                expandParam: a || []
            }).then(Ta)
        },
        Ca = function(e, t, n, r, a) {
            return t === p.g.PAYMENT_INTENT ? n.action.cancelPaymentIntentSource({
                intentSecret: e,
                locale: a,
                sourceId: r
            }).then(Ta) : n.action.cancelSetupIntentSource({
                intentSecret: e,
                locale: a,
                sourceId: r
            }).then(Ta)
        },
        Na = function(e) {
            return (e.error ? e.error.payment_intent || e.error.setup_intent : e.paymentIntent || e.setupIntent) || null
        },
        Ra = function(e, t, n, a, o, i) {
            var c = rt(),
                s = new Ve.a,
                l = function(e, t, n, a, o) {
                    return e.createLightboxFrame({
                        type: p.c.AUTHORIZE_WITH_URL,
                        options: Object(r.a)({
                            url: t,
                            locale: o,
                            intentId: n
                        }, a ? {
                            source: a
                        } : {})
                    })
                }(a, e.url, t.id, e.source, o);
            return l.show(), a.report("authorize_with_url.loading", {
                viewport: c,
                intentId: t.id
            }), l._on("load", (function() {
                a.report("authorize_with_url.loaded", {
                    loadDuration: s.getElapsedTime(),
                    intentId: t.id
                }), l.fadeInBackdrop()
            })), l._on("challenge_complete", (function() {
                l.fadeOutBackdrop()
            })), new u.a((function(r, c) {
                var p = e.source;
                p && l._once("cancel", (function() {
                    u.a.all([Ca(t, n, a, p, o), l.destroy()]).then((function(e) {
                        var t = Object(Me.a)(e, 1)[0];
                        return r(t)
                    }))
                })), l._once("authorize_with_url_done", (function() {
                    var e = l.destroy();
                    ! function(e, t, n, r, a, o) {
                        var i, c = !0,
                            s = 3,
                            u = 0;
                        (function l() {
                            u += 1, Ia(e, t, n, r, a).then((function(e) {
                                if (c) {
                                    var t = Na(e);
                                    if (null !== t) switch (s = 3, t.status) {
                                        case "requires_action":
                                        case "requires_source_action":
                                            return void(i = setTimeout(l, 5e3));
                                        case "processing":
                                            return void(i = setTimeout(l, 1e3));
                                        default:
                                            o(e, u)
                                    } else if (s > 0) {
                                        var n = 500 * Math.pow(2, 3 - s);
                                        i = setTimeout(l, n), s -= 1
                                    } else o(e, u)
                                }
                            }))
                        })()
                    }(t, n, a, o, i, (function(n, o) {
                        e.then((function() {
                            a.report("authorize_with_url.done", {
                                shownDuration: s.getElapsedTime(),
                                success: !("error" in n),
                                intentId: t.id,
                                iterations: o
                            }), r(n)
                        }))
                    }))
                }))
            }))
        },
        xa = n(11),
        Ma = function(e, t) {
            var n = t.intentSecret,
                r = t.controller,
                a = t.locale,
                o = t.hosted,
                i = r.createLightboxFrame({
                    type: p.c.STRIPE_3DS2_CHALLENGE,
                    options: {
                        intentId: n.id,
                        hosted: o,
                        locale: a
                    }
                });
            r.report("3ds2.challenge_frame.loading", {
                intentId: n.id,
                hosted: o
            }), i._on("challenge_complete", (function() {
                i.fadeOutBackdrop()
            }));
            var c = function(e) {
                return new u.a((function(t) {
                    e._on("load", (function() {
                        return t(e)
                    }))
                }))
            }(i);
            return c.then((function() {
                return r.report("3ds2.challenge_frame.loaded", {
                    intentId: n.id,
                    hosted: o
                })
            })), o && (i.show(), i.action.show3DS2Spinner({
                cardBrand: e.cardBrand
            })), c
        },
        La = function(e, t, n) {
            var a = n.oneClickAuthnDeviceSupport,
                o = n.challengeFrame,
                i = t.controller,
                c = t.intentSecret,
                l = t.intentType,
                p = t.locale;
            return new u.a((function(t) {
                o.then((function(n) {
                    n._once("cancel", (function() {
                        n.fadeOutBackdrop(), Ca(c, l, i, e.threeDS2Source, p).then(t)
                    })), n.isVisible || (n.show(), n.fadeInBackdrop());
                    e.type;
                    var o = e.optimizations,
                        u = (e.oneClickAuthn, Object(s.a)(e, ["type", "optimizations", "oneClickAuthn"]));
                    n.action.perform3DS2Challenge(Object(r.a)(Object(r.a)({}, u), {}, {
                        shouldSandbox: o.sandboxChallengeFrame,
                        oneClickAuthnDeviceSupport: a,
                        oneClickWebauthnEnrollmentAppUrl: Object(xa.a)("one-click-webauthn-enrollment-e786afda41bf6b947eb27c736d166b23.html")
                    })).then((function() {
                        return t()
                    }))
                }))
            }))
        },
        Da = function(e) {
            if (!e || "object" != typeof e || !e.type && !e.code) return e;
            var t = function(t) {
                return e[t] && "string" == typeof e[t] ? Object(c.a)({}, "".concat(t, "_id"), e[t]) : e[t] && "object" == typeof e[t] && "string" == typeof e[t].id ? Object(c.a)({}, "".concat(t, "_id"), e[t].id) : null
            };
            return Object(r.a)(Object(r.a)(Object(r.a)(Object(r.a)({
                type: e.type,
                code: e.code,
                param: e.param
            }, t("payment_intent")), t("setup_intent")), t("payment_method")), t("source"))
        },
        qa = function(e, t, n) {
            var a = t.existingPayload,
                o = t.challengeFrame,
                i = t.startTimestamp,
                c = e.intentSecret,
                s = e.intentType,
                l = e.controller,
                p = e.locale,
                d = e.hosted,
                f = a ? u.a.resolve(a) : Ia(c, s, l, p, n);
            return u.a.all([f, o.then((function(e) {
                return e.destroy()
            }))]).then((function(e) {
                var t = Object(Me.a)(e, 1)[0];
                return l.report("3ds2.done", Object(r.a)({
                    intentId: c.id,
                    hosted: d,
                    totalDuration: i.getElapsedTime()
                }, t.error ? {
                    error: Da(t.error),
                    success: !1
                } : {
                    success: !0
                })), t
            }))
        },
        Ba = function(e) {
            var t = e.intentSecret,
                n = e.controller,
                r = e.hosted,
                a = e.locale,
                o = n.createHiddenFrame(p.c.STRIPE_3DS2_FINGERPRINT, {
                    intentId: t.id,
                    locale: a,
                    hosted: r
                });
            n.report("3ds2.fingerprint_frame.loading", {
                hosted: r,
                intentId: t.id
            });
            var i = function(e) {
                return new u.a((function(t) {
                    e._on("load", (function() {
                        return t(e)
                    }))
                }))
            }(o);
            return i.then((function() {
                n.report("3ds2.fingerprint_frame.loaded", {
                    hosted: r,
                    intentId: t.id
                })
            })), i
        },
        Fa = function(e, t) {
            var n = t.intentSecret,
                r = t.controller,
                a = t.hosted;
            return e.optimizations.skipFingerprint ? u.a.resolve({
                fingerprintAttempted: !1,
                fingerprintData: null
            }) : "" === e.methodUrl ? (r.report("3ds2.fingerprint.no_method_url", {
                hosted: a,
                intentId: n.id
            }), u.a.resolve({
                fingerprintAttempted: !1,
                fingerprintData: null
            })) : Ba(t).then((function(t) {
                return t.action.perform3DS2Fingerprint({
                    threeDS2Source: e.threeDS2Source,
                    merchant: e.merchant,
                    transactionId: e.transactionId,
                    methodUrl: e.methodUrl,
                    shouldSandbox: e.optimizations.sandboxFingerprintFrame
                }).then((function(e) {
                    return t.destroy(), e
                }))
            }))
        },
        Ua = function() {
            return void 0 === window.PublicKeyCredential || function() {
                if (!/CrOS/i.test(window.navigator.userAgent)) return !1;
                var e = window.navigator.userAgent.match(/Chrome\/\d+\.\d+\.(\d+)\.(\d+)/) || [],
                    t = Number(e[1]),
                    n = Number(e[2]);
                return !(4389 === t && n >= 82 || 4430 === t && n >= 11 || t >= 4431)
            }() ? u.a.resolve(!1) : window.PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable().catch((function() {
                return !1
            }))
        },
        Ya = n(52),
        Ga = n.n(Ya),
        Ha = n(53),
        za = n.n(Ha),
        Wa = n(54),
        Ka = n.n(Wa),
        Va = n(55),
        Ja = n.n(Va),
        $a = n(56),
        Za = n.n($a),
        Xa = n(57),
        Qa = n.n(Xa),
        eo = n(58),
        to = n.n(eo),
        no = function(e, t) {
            switch (e) {
                case "visa":
                    return {
                        logo: Ga.a, icon: Za.a
                    } [t];
                case "amex":
                    return {
                        logo: za.a, icon: Qa.a
                    } [t];
                case "mastercard":
                    return {
                        logo: Ka.a, icon: to.a
                    } [t];
                case "unionpay":
                    return {
                        logo: Ja.a, icon: null
                    } [t];
                case "discover":
                case "jcb":
                case "diners":
                case "unknown":
                case "elo":
                    return null;
                default:
                    return Object(ht.a)(e)
            }
        },
        ro = function() {
            if (void 0 === window.PaymentRequest) return u.a.resolve(!1);
            if (!/Chrome\/(9[5-9]|[1-9]\d\d)/.test(window.navigator.userAgent)) return u.a.resolve(!1);
            try {
                var e = [{
                    supportedMethods: "secure-payment-confirmation",
                    data: {
                        action: "authenticate",
                        credentialIds: [new Uint8Array(1)],
                        challenge: new Uint8Array(1),
                        fallbackUrl: window.location,
                        payeeOrigin: "https://stripe.com",
                        instrument: {
                            displayName: "Mock ····1234",
                            icon: no("visa", "icon")
                        }
                    }
                }];
                return new window.PaymentRequest(e, {
                    total: {
                        label: "Total",
                        amount: {
                            currency: "USD",
                            value: "0"
                        }
                    }
                }).canMakePayment().catch((function() {
                    return !1
                }))
            } catch (e) {
                return u.a.resolve(!1)
            }
        },
        ao = "stripe-js-one-click-authn",
        oo = function(e) {
            return btoa(String.fromCharCode.apply(null, new Uint8Array(e))).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, "")
        },
        io = function(e) {
            return atob(e.replace(/-/g, "+").replace(/_/g, "/"))
        },
        co = function(e) {
            var t = io(e);
            return Uint8Array.from(t, (function(e) {
                return e.charCodeAt(0)
            }))
        },
        so = function(e, t, n) {
            var a = e.threeDS2Source,
                o = e.oneClickAuthn,
                i = t.controller,
                c = n.startTimestamp;
            if (!o) return u.a.resolve(null);
            var s = o.credentials.filter((function(e) {
                return "spc" === e.type
            }));
            if (0 === s.length) return i.report("one_click_authn.request_spc_authn.empty_credentials_list", {
                client_id: ao,
                source: a
            }), u.a.resolve(null);
            try {
                var l = o.merchant.origin;
                return l ? new window.PaymentRequest(function(e, t, n) {
                    var r = n.authenticationChallenge,
                        a = n.instrument,
                        o = a.cardBrand,
                        i = a.cardName,
                        c = a.cardLast4;
                    return n.merchant, [{
                        supportedMethods: "secure-payment-confirmation",
                        data: {
                            action: "authenticate",
                            credentialIds: e.map((function(e) {
                                return co(e.id)
                            })),
                            challenge: co(r),
                            timeout: 6e4,
                            fallbackUrl: window.location.toString(),
                            instrument: {
                                displayName: "".concat(i, " ····").concat(c),
                                icon: no(o, "icon")
                            },
                            payeeOrigin: t
                        }
                    }]
                }(s, l, o), {
                    total: {
                        label: "Total",
                        amount: o.amount
                    }
                }).show().then((function(e) {
                    var t;
                    return e.complete("success"), i.report("one_click_authn.request_spc_authn.completed", {
                        client_id: ao,
                        source: a,
                        timeToComplete: c.getElapsedTime()
                    }), {
                        type: "spc",
                        assertion: (t = e.details, {
                            type: "public-key",
                            id: t.id,
                            raw_id: t.id,
                            response: {
                                authenticator_data: oo(t.response.authenticatorData),
                                client_data_json: oo(t.response.clientDataJSON),
                                signature: oo(t.response.signature)
                            }
                        }),
                        payment_data: {
                            merchant_data: {
                                merchant_origin: l,
                                total: o.amount
                            },
                            network_data: o.authenticationChallenge
                        }
                    }
                })).catch((function(e) {
                    var t = {
                        AbortError: "request_aborted",
                        InvalidStateError: "payment_already_shown",
                        NotSupportedError: "payment_method_not_supported",
                        SecurityError: "security_error"
                    } [e.name] || "unexpected_error";
                    return i.report("one_click_authn.request_spc_authn.error", {
                        reason: t,
                        client_id: ao,
                        source: a,
                        timeToError: c.getElapsedTime(),
                        error: Object(r.a)({
                            name: e.name,
                            message: e.message
                        }, e)
                    }), null
                })) : (i.report("one_click_authn.request_spc_authn.empty_merchant_origin", {
                    client_id: ao,
                    source: a
                }), u.a.resolve(null))
            } catch (e) {
                i.report("one_click_authn.request_spc_authn.error", {
                    client_id: ao,
                    reason: "unexpected_error",
                    source: a,
                    timeToError: c.getElapsedTime(),
                    error: Object(r.a)({
                        name: e.name,
                        message: e.message
                    }, e)
                })
            }
            return u.a.resolve(null)
        },
        uo = function(e, t) {
            var n = e.threeDS2Source,
                a = e.oneClickAuthn,
                o = t.controller,
                i = {
                    spc: !1,
                    webauthn: !1
                };
            if (a) {
                try {
                    var c = $ ? "safari" : Z ? "firefox" : Q ? J ? "chrome_android" : "chrome" : z || W ? "edge" : null;
                    if (c) {
                        var s = new URLSearchParams(io(a.configuration)).get(c) || "";
                        i.spc = -1 !== s.indexOf("S"), i.webauthn = -1 !== s.indexOf("W")
                    } else o.report("one_click_authn.configuration.error", {
                        client_id: ao,
                        reason: "browser_not_found",
                        source: n
                    })
                } catch (e) {
                    o.report("one_click_authn.configuration.error", {
                        client_id: ao,
                        reason: "unexpected_error",
                        source: n,
                        error: Object(r.a)({
                            name: e.name,
                            message: e.message
                        }, e)
                    })
                }
            }
            return i
        },
        lo = function() {
            var e = document.featurePolicy;
            if (!e) return !1;
            try {
                return -1 !== e.allowedFeatures().indexOf("publickey-credentials-get")
            } catch (e) {
                return !1
            }
        },
        po = function(e, t) {
            var n = uo(e, t);
            return u.a.all([ro(), Ua()]).then((function(e) {
                var t = Object(Me.a)(e, 2),
                    r = t[0],
                    a = t[1];
                return {
                    spcEligible: r,
                    webauthnEligible: a,
                    publickeyCredentialsGetAllowed: lo(),
                    spcTypeEnabled: n.spc && r,
                    webauthnTypeEnabled: n.webauthn && a
                }
            }))
        },
        fo = function(e, t, n) {
            var r = n.challengeFrame,
                a = n.startTimestamp;
            return po(e, t).then((function(n) {
                return n.spcTypeEnabled ? so(e, t, {
                    startTimestamp: a
                }).then((function(e) {
                    return {
                        deviceSupport: n,
                        authenticationAPIParam: e
                    }
                })) : n.webauthnTypeEnabled ? function(e, t, n) {
                    var r = t.controller,
                        a = n.deviceSupport,
                        o = n.challengeFrame,
                        i = n.startTimestamp,
                        c = e.oneClickAuthn;
                    return c ? c.credentials.some((function(e) {
                        return "webauthn" === e.type
                    })) ? o.then((function(t) {
                        return t.isVisible || (t.show(), t.fadeInBackdrop()), t.action.performOneClickWebauthnAuthentication({
                            threeDS2Source: e.threeDS2Source,
                            cardBrand: e.cardBrand,
                            appUrl: Object(xa.a)("one-click-webauthn-authentication-dbc4da1030f83168ba5bdddd3cb48d12.html"),
                            deviceSupport: a,
                            requestData: c,
                            startPosixTime: i.getAsPosixTime()
                        })
                    })) : (r.report("one_click_authn.request_webauthn_authn.empty_credentials_list", {
                        client_id: ao,
                        source: e.threeDS2Source
                    }), u.a.resolve(null)) : u.a.resolve(null)
                }(e, t, {
                    deviceSupport: n,
                    challengeFrame: r,
                    startTimestamp: a
                }).then((function(e) {
                    return {
                        deviceSupport: n,
                        authenticationAPIParam: e
                    }
                })) : {
                    deviceSupport: n,
                    authenticationAPIParam: null
                }
            }))
        },
        mo = function(e, t, n) {
            var r = new Ve.a,
                a = Ma(e, t);
            switch (e.type) {
                case "3ds2-challenge":
                    return po(e, t).then((function(o) {
                        return La(e, t, {
                            oneClickAuthnDeviceSupport: o,
                            challengeFrame: a
                        }).then((function(e) {
                            return qa(t, {
                                existingPayload: e,
                                challengeFrame: a,
                                startTimestamp: r
                            }, n)
                        }))
                    }));
                case "3ds2-fingerprint":
                    return u.a.all([Fa(e, t), fo(e, t, {
                        challengeFrame: a,
                        startTimestamp: r
                    })]).then((function(n) {
                        var r = Object(Me.a)(n, 2),
                            o = r[0],
                            i = r[1];
                        return function(e, t, n) {
                            var r = n.fingerprintResult,
                                a = n.oneClickAuthn,
                                o = t.controller,
                                i = t.hosted,
                                c = t.intentSecret;
                            return o.report("3ds2.authenticate", {
                                hosted: i,
                                intentId: c.id
                            }), o.action.authenticate3DS2({
                                threeDS2Source: e.threeDS2Source,
                                outerWindowWidth: window.innerWidth,
                                hosted: i,
                                fingerprintResult: r,
                                oneClickAuthnDeviceSupportAPIParam: {
                                    spc_eligible: a.deviceSupport.spcEligible,
                                    webauthn_eligible: a.deviceSupport.webauthnEligible
                                },
                                oneClickAuthnAuthenticationAPIParam: a.authenticationAPIParam
                            }).then((function(e) {
                                return "error" === e.type ? o.report("3ds2.authenticate.error", {
                                    error: e.error,
                                    hosted: i,
                                    intentId: c.id
                                }) : o.report("3ds2.authenticate.success", {
                                    hosted: i,
                                    intentId: c.id
                                }), e
                            }))
                        }(e, t, {
                            fingerprintResult: o,
                            oneClickAuthn: i
                        }).then((function(n) {
                            return function(e, t, n) {
                                var r = n.authenticateResponse,
                                    a = n.oneClickAuthnDeviceSupport,
                                    o = n.challengeFrame,
                                    i = t.controller,
                                    c = t.hosted,
                                    s = t.intentSecret;
                                if ("error" === r.type) return u.a.resolve();
                                var l = r.object,
                                    p = l.state,
                                    d = l.ares,
                                    f = l.creq;
                                return "delegated" === p || null === d ? u.a.resolve() : "C" !== d.transStatus || null == f ? (i.report("3ds2.frictionless", {
                                    hosted: c,
                                    intentId: s.id
                                }), u.a.resolve()) : La({
                                    type: "3ds2-challenge",
                                    threeDS2Source: e.threeDS2Source,
                                    cardBrand: e.cardBrand,
                                    transactionId: e.transactionId,
                                    acsUrl: d.acsURL,
                                    acsTransactionId: d.acsTransID,
                                    optimizations: e.optimizations,
                                    oneClickAuthn: e.oneClickAuthn,
                                    creq: f
                                }, t, {
                                    oneClickAuthnDeviceSupport: a,
                                    challengeFrame: o
                                })
                            }(e, t, {
                                authenticateResponse: n,
                                oneClickAuthnDeviceSupport: i.deviceSupport,
                                challengeFrame: a
                            })
                        }))
                    })).then((function(e) {
                        return qa(t, {
                            existingPayload: e,
                            challengeFrame: a,
                            startTimestamp: r
                        }, n)
                    }));
                default:
                    return Object(ht.a)(e)
            }
        },
        _o = function(e, t) {
            var n = e.createLightboxFrame({
                type: p.c.LIGHTBOX_APP,
                options: t
            });
            return n.show(), n._on("nested-frame-loaded", (function() {
                n.fadeInBackdrop(), setTimeout((function() {
                    n.action.openLightboxFrame()
                }), 200)
            })), n
        },
        ho = function(e) {
            return e.action.closeLightboxFrame(), e.destroy()
        };
    var yo = function(e) {
            return e ? "payment_intent" === e.object ? e.last_payment_error : e.last_setup_error : null
        },
        bo = function(e, t, n, r) {
            return new u.a((function(a, o) {
                var i = new Ve.a,
                    c = n.createLightboxFrame({
                        type: p.c.HCAPTCHA_APP,
                        options: {
                            intentId: t.id,
                            clientSecret: t.client_secret,
                            locale: r,
                            sitekey: e.site_key,
                            verifyUrl: e.verification_url,
                            startTime: i.getAsPosixTime()
                        }
                    }),
                    s = function(e) {
                        var t = wa;
                        return null != e && (t = e), n.action.localizeError(t).then((function(e) {
                            return {
                                error: e
                            }
                        }))
                    };
                n.report("intent_confirmation_challenge.start"), c._on("load", (function() {
                    n.report("intent_confirmation_challenge.stripe_js_frame_loaded", {
                        duration_since_start_ms: i.getElapsedTime()
                    }), c.fadeInBackdrop()
                })), c.show(), c._on("request-cancel", (function(e) {
                    c.fadeOutBackdrop(), c.destroy(!0), n.report("intent_confirmation_challenge.cancel"), a(s(yo(null == e ? void 0 : e.intent)))
                })), c._on("request-close", (function(e) {
                    c.fadeOutBackdrop(), c.destroy(!0);
                    var t = null == e ? void 0 : e.intent;
                    if (t) {
                        var r = yo(t);
                        r ? /Captcha/.test(r.message || "") ? (n.report("intent_confirmation_challenge.verification_failed"), a(s(r))) : (n.report("intent_confirmation_challenge.success"), a(s(r))) : (n.report("intent_confirmation_challenge.success"), function(e, t) {
                            "payment_intent" === t.object ? e({
                                paymentIntent: t
                            }) : e({
                                setupIntent: t
                            })
                        }(a, t))
                    } else n.report("intent_confirmation_challenge.verification_error"), a(s(wa))
                }))
            }))
        },
        vo = function e(t) {
            var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 3,
                r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 250;
            return new u.a((function(a, o) {
                t().then(a).catch((function(i) {
                    1 === n ? o(i) : setTimeout((function() {
                        e(t, n - 1, r).then(a, o)
                    }), r)
                }))
            }))
        },
        go = function(e) {
            var t = e.controller,
                n = e.intentSecret,
                r = e.intentType,
                a = (e.locale, function(e) {
                    return t.action.localizeError(e).then((function(e) {
                        return u.a.resolve({
                            error: e
                        })
                    }))
                }),
                o = function(e, t) {
                    switch (t) {
                        case "requires_action":
                            return e;
                        case "requires_payment_method":
                            return a(ja);
                        default:
                            return e
                    }
                };
            return "PAYMENT_INTENT" === r ? function(e, t, n) {
                return Br({
                    linkAccountSessionCreatorClientSecret: e,
                    linkAccountSessionCreatorType: "payment_intent",
                    linkAccountSessionCreatorId: t,
                    controller: n
                })
            }(n.clientSecret, n.id, t).then((function(e) {
                return e.error ? a(Ea) : vo((function() {
                    return t.action.refreshPaymentIntent({
                        intentSecret: n
                    }).then((function(e) {
                        if ("error" === e.type && 429 === e.error.status) return u.a.reject(new Error(e.error.message));
                        var t = pr(e);
                        return t.paymentIntent ? o(t, t.paymentIntent.status) : t
                    }))
                }), 5, 500)
            })) : function(e, t, n) {
                return Br({
                    linkAccountSessionCreatorClientSecret: e,
                    linkAccountSessionCreatorType: "setup_intent",
                    linkAccountSessionCreatorId: t,
                    controller: n
                })
            }(n.clientSecret, n.id, t).then((function(e) {
                return e.error ? a(Ea) : vo((function() {
                    return t.action.refreshSetupIntent({
                        intentSecret: n
                    }).then((function(e) {
                        if ("error" === e.type && 429 === e.error.status) return u.a.reject(new Error(e.error.message));
                        var t = dr(e);
                        return t.setupIntent ? o(t, t.setupIntent.status) : t
                    }))
                }), 5, 500)
            }))
        },
        Oo = function(e) {
            var t = e.controller,
                n = e.intentSecret,
                r = e.intentType,
                a = e.locale;
            return new u.a((function(e, o) {
                setTimeout((function o() {
                    Ia(n, r, t, a).then((function(n) {
                        var r, a = Na(n);
                        null !== a ? "requires_action" !== a.status || "blik_authorize" !== a.next_action.type ? e(n) : setTimeout(o, 5e3) : e((r = wa, t.action.localizeError(r).then((function(e) {
                            return {
                                error: e
                            }
                        }))))
                    }))
                }), 8e3)
            }))
        },
        jo = function(e) {
            switch (e.type) {
                case "error":
                    var t = e.error;
                    if ("payment_intent_unexpected_state" === t.code && "object" == typeof t.payment_intent && null != t.payment_intent && "string" == typeof t.payment_intent.status && mr(t.payment_intent.status)) {
                        var n = t.payment_intent;
                        return {
                            type: "object",
                            locale: e.locale,
                            object: n
                        }
                    }
                    return e;
                case "object":
                    return e;
                default:
                    return Object(ht.a)(e)
            }
        },
        Eo = function(e, t, n, r, a, o) {
            var i = Aa(_r(t), n, e),
                c = fr(t);
            if (!i) return u.a.resolve({
                paymentIntent: t
            });
            switch (i.type) {
                case "captcha-challenge":
                    return bo(i, t, e, r);
                case "3ds1-modal":
                    return Ra(i, c, p.g.PAYMENT_INTENT, e, r, o);
                case "3ds2-fingerprint":
                case "3ds2-challenge":
                    return mo(i, {
                        intentSecret: c,
                        intentType: p.g.PAYMENT_INTENT,
                        controller: e,
                        locale: r,
                        hosted: a
                    }, o);
                case "redirect":
                    return function(e, t, n) {
                        return Object(xr.a)(t).then((function(t) {
                            return Object(xr.b)(n, "next_action redirect", t), pr(t, e)
                        }))
                    }(t, i.redirectUrl, e);
                case "blik_authorize":
                    return Oo({
                        controller: e,
                        intentSecret: c,
                        intentType: p.g.PAYMENT_INTENT,
                        locale: r
                    });
                case "boleto-display":
                    if (void 0 === i.hostedVoucherUrl) throw new O.a("Expect `next_action.boleto_display_details.hosted_voucher_url` of `PaymentIntent` to be not undefined. Please refer to \n\nhttps://stripe.com/docs/api/payment_intents/object#payment_intent_object-next_action-boleto_display_details-hosted_voucher_url");
                    return function(e) {
                        var t = e.controller,
                            n = e.url,
                            r = e.intent,
                            a = e.locale,
                            o = _o(t, {
                                url: n,
                                size: "600x700",
                                locale: a,
                                frameTitle: "boleto.voucher_frame_title",
                                useLightboxHostedCloseButton: !1
                            });
                        return new u.a((function(e) {
                            o._on("request-close", (function() {
                                ho(o).then((function() {
                                    e({
                                        paymentIntent: r
                                    })
                                }))
                            }))
                        }))
                    }({
                        controller: e,
                        locale: r,
                        url: i.hostedVoucherUrl,
                        intent: t
                    });
                case "konbini-display":
                    if (void 0 === i.hostedVoucherUrl) throw new O.a("Expected option `handleActions` to be `false`. The Konbini pilot does not handle the next actions for you automatically yet (e.g. displaying Konbini payment details). Please refer to the Stripe Konbini integration guide for more info: \n\nhttps://stripe.com/docs/payments/konbini");
                    return function(e) {
                        var t = e.controller,
                            n = e.url,
                            r = e.intent,
                            a = e.locale,
                            o = _o(t, {
                                url: n,
                                size: "600x900",
                                locale: a,
                                frameTitle: "konbini.voucher_frame_title",
                                useLightboxHostedCloseButton: !1
                            });
                        return new u.a((function(e) {
                            o._on("request-close", (function() {
                                ho(o).then((function() {
                                    e({
                                        paymentIntent: r
                                    })
                                }))
                            }))
                        }))
                    }({
                        controller: e,
                        locale: r,
                        url: i.hostedVoucherUrl,
                        intent: t
                    });
                case "oxxo-display":
                    if (void 0 === i.hostedVoucherUrl) throw new O.a("To handle the next actions automatically, set the API version to oxxo_beta=v2. Please refer to the Stripe OXXO integration guide for more info: \n\nhttps://stripe.com/docs/payments/oxxo");
                    return function(e) {
                        var t = e.controller,
                            n = e.url,
                            r = e.intent,
                            a = e.locale,
                            o = _o(t, {
                                url: n,
                                size: "600x700",
                                locale: a,
                                frameTitle: "oxxo.voucher_frame_title",
                                useLightboxHostedCloseButton: !1
                            });
                        return new u.a((function(e) {
                            o._on("request-close", (function() {
                                ho(o).then((function() {
                                    e({
                                        paymentIntent: r
                                    })
                                }))
                            }))
                        }))
                    }({
                        controller: e,
                        locale: r,
                        url: i.hostedVoucherUrl,
                        intent: t
                    });
                case "upi_await_notification":
                    return function(e) {
                        var t = e.controller,
                            n = e.intentSecret,
                            r = e.intentType,
                            a = e.locale;
                        return new u.a((function(e) {
                            setTimeout((function o() {
                                Ia(n, r, t, a).then((function(t) {
                                    var n = Na(t);
                                    if (null !== n) switch (n.status) {
                                        case "requires_action":
                                            return void setTimeout(o, 1e4);
                                        default:
                                            e(t)
                                    }
                                }))
                            }), 5e3)
                        }))
                    }({
                        controller: e,
                        intentSecret: c,
                        intentType: p.g.PAYMENT_INTENT,
                        locale: r
                    });
                case "us_bank_account_link":
                    return go({
                        controller: e,
                        intentSecret: c,
                        intentType: p.g.PAYMENT_INTENT,
                        locale: r
                    });
                case "link_authenticate_account":
                    return e.action.completeLinkPayment({
                        intentSecret: t.client_secret,
                        intentId: t.id,
                        expandParam: o
                    }).then((function(e) {
                        return e ? u.a.resolve(pr(e)) : u.a.resolve({
                            paymentIntent: t
                        })
                    }));
                case "wechat_pay_display_qr_code":
                    return function(e) {
                        var t = e.controller,
                            n = e.intent,
                            r = e.intentType,
                            a = e.intentSecret,
                            o = e.locale,
                            i = _r(n);
                        if (!i || "wechat_pay_display_qr_code" !== i.type) throw new Error("Expected next_action.wechat_pay_display_qr_code");
                        var c = t.createLightboxFrame({
                                type: p.c.WECHAT_PAY_INNER,
                                options: {
                                    qrCodeImageDataUrl: i.wechat_pay_display_qr_code.image_data_url,
                                    qrCodeUrl: i.wechat_pay_display_qr_code.data,
                                    locale: o
                                }
                            }),
                            s = null;
                        return new u.a((function(e, i) {
                            c._on("load", (function() {
                                c.show(), c.fadeInBackdrop()
                            })), c._once("request-close", (function() {
                                ho(c).then((function() {
                                    s && clearTimeout(s), e({
                                        paymentIntent: n
                                    })
                                }))
                            })), c._on("complete", (function(t) {
                                ho(c).then((function() {
                                    s && clearTimeout(s), e(t)
                                }))
                            })), s = setTimeout((function n() {
                                Ia(a, r, t, o).then((function(t) {
                                    var r = Na(t);
                                    if (null !== r) switch (r.status) {
                                        case "requires_action":
                                            return void(s = setTimeout(n, 2e3));
                                        default:
                                            c.destroy(!0).then((function() {
                                                "payment_intent" === r.object ? e({
                                                    paymentIntent: r
                                                }) : e({
                                                    setupIntent: r
                                                })
                                            }))
                                    }
                                }))
                            }), 5e3)
                        }))
                    }({
                        controller: e,
                        locale: r,
                        intent: t,
                        intentSecret: c,
                        intentType: p.g.PAYMENT_INTENT
                    });
                case "paynow_display_qr_code":
                    return function(e) {
                        var t = e.controller,
                            n = e.intent,
                            r = e.intentType,
                            a = e.intentSecret,
                            o = e.locale,
                            i = _r(n);
                        if (!i || "paynow_display_qr_code" !== i.type) throw new Error("Expected next_action.paynow_display_qr_code");
                        var c = t.createLightboxFrame({
                                type: p.c.PAYNOW_INNER,
                                options: {
                                    qrCodeImageDataUrl: i.paynow_display_qr_code.image_data_url,
                                    qrCodeUrl: i.paynow_display_qr_code.data,
                                    locale: o
                                }
                            }),
                            s = null;
                        return new u.a((function(e, i) {
                            c._on("load", (function() {
                                c.show(), c.fadeInBackdrop()
                            })), c._once("request-close", (function() {
                                ho(c).then((function() {
                                    s && clearTimeout(s), e({
                                        paymentIntent: n
                                    })
                                }))
                            })), c._on("complete", (function(t) {
                                ho(c).then((function() {
                                    s && clearTimeout(s), e(t)
                                }))
                            })), s = setTimeout((function n() {
                                Ia(a, r, t, o).then((function(t) {
                                    var r = Na(t);
                                    if (null !== r) switch (r.status) {
                                        case "requires_action":
                                            return void(s = setTimeout(n, 2e3));
                                        default:
                                            c.destroy(!0).then((function() {
                                                "payment_intent" === r.object ? e({
                                                    paymentIntent: r
                                                }) : e({
                                                    setupIntent: r
                                                })
                                            }))
                                    }
                                }))
                            }), 5e3)
                        }))
                    }({
                        controller: e,
                        locale: r,
                        intent: t,
                        intentSecret: c,
                        intentType: p.g.PAYMENT_INTENT
                    });
                case "pix_display_qr_code":
                    throw new O.a("Expected option `handleActions` to be `false`. The Pix pilot does not handle the next action for you automatically yet (e.g. displaying Pix QR Code). Please refer to the Stripe Pix integration guide for more info: \n\nhttps://stripe.com/docs/payments/pix");
                case "promptpay_display_qr_code":
                    return function(e) {
                        var t = e.controller,
                            n = e.intent,
                            r = e.intentType,
                            a = e.intentSecret,
                            o = e.locale,
                            i = _r(n);
                        if (!i || "promptpay_display_qr_code" !== i.type) throw new Error("Expected next_action.promptpay_display_qr_code");
                        var c = t.createLightboxFrame({
                                type: p.c.PROMPTPAY_INNER,
                                options: {
                                    qrCodeImageDataUrl: i.promptpay_display_qr_code.image_url,
                                    qrCodeUrl: i.promptpay_display_qr_code.data,
                                    locale: o
                                }
                            }),
                            s = null;
                        return new u.a((function(e, i) {
                            c._on("load", (function() {
                                c.show(), c.fadeInBackdrop()
                            })), c._once("request-close", (function() {
                                ho(c).then((function() {
                                    s && clearTimeout(s), e({
                                        paymentIntent: n
                                    })
                                }))
                            })), c._on("complete", (function(t) {
                                ho(c).then((function() {
                                    s && clearTimeout(s), e(t)
                                }))
                            })), s = setTimeout((function n() {
                                Ia(a, r, t, o).then((function(t) {
                                    var r = Na(t);
                                    if (null !== r) switch (r.status) {
                                        case "requires_action":
                                            return void(s = setTimeout(n, 2e3));
                                        default:
                                            c.destroy(!0).then((function() {
                                                "payment_intent" === r.object ? e({
                                                    paymentIntent: r
                                                }) : e({
                                                    setupIntent: r
                                                })
                                            }))
                                    }
                                }))
                            }), 5e3)
                        }))
                    }({
                        controller: e,
                        locale: r,
                        intent: t,
                        intentSecret: c,
                        intentType: p.g.PAYMENT_INTENT
                    });
                default:
                    return u.a.resolve({
                        paymentIntent: t
                    })
            }
        },
        wo = function e(t, n, r, a, o, i) {
            var c = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : 0;
            if (p.i < c) throw new Error("max action recursion depth reached");
            return Eo(t, n, r, a, o, i || []).then((function(n) {
                if (n.setupIntent) throw new Error("Got unexpected SetupIntent response");
                if (n.paymentIntent && null != n.paymentIntent.next_action && "use_stripe_sdk" === n.paymentIntent.next_action.type && -1 !== p.j.indexOf(n.paymentIntent.next_action.use_stripe_sdk.type)) {
                    var s = c;
                    return e(t, n.paymentIntent, r, a, o, i, ++s)
                }
                return n
            }))
        },
        ko = function(e, t, n, r, a) {
            return function(o) {
                var i = jo(o);
                switch (i.type) {
                    case "error":
                        var c = i.error,
                            s = c.payment_intent;
                        return n && s && "payment_intent_unexpected_state" === c.code && ("succeeded" === s.status || "requires_capture" === s.status) ? u.a.resolve({
                            paymentIntent: s
                        }) : u.a.resolve(pr(o));
                    case "object":
                        var l = i.object;
                        return wo(e, l, t, i.locale, r, a || []);
                    default:
                        return Object(ht.a)(i)
                }
            }
        },
        Po = {
            clientSecret: Object(l.s)(l.x),
            redirect: Object(l.s)(Object(l.q)("always", "if_required")),
            confirmParams: Object(l.s)(l.p)
        },
        So = Object(r.a)(Object(r.a)({}, Po), {}, {
            element: Object(l.s)(l.p)
        }),
        Ao = Object(r.a)(Object(r.a)({}, Po), {}, {
            elements: Object(l.s)(l.p)
        }),
        To = function(e, t, n) {
            var r = t.rawSecret,
                a = t.rawElement,
                o = t.rawElements;
            if (Object(it.d)(e, it.a.payment_element_beta_1)) {
                var i = or(a);
                if (!i) throw new O.a("Invalid value for ".concat(n, ": `element` should be a Payment Element. You specified: ").concat(typeof a, "."));
                return {
                    type: "element",
                    element: i
                }
            }
            if (r && o) throw new O.a("".concat(n, ": expected either `elements` or `clientSecret`, but not both."));
            if (!r && !o) throw new O.a("".concat(n, ": expected either `elements` or `clientSecret`, but got neither."));
            if (r) return {
                type: "clientSecret",
                clientSecret: r
            };
            var c, s, u = (c = o, "error" === (s = Object(l.F)(cr, c, "")).type ? null : s.value);
            if (!u) throw new O.a("Invalid value for ".concat(n, ": elements should be an Elements group. You specified: ").concat(typeof o, "."));
            var p = Object(we.a)(u._elements, (function(e) {
                return "payment" === e._componentName
            }));
            if (!p) throw new O.a("Invalid value for ".concat(n, ": elements should have a mounted Payment Element."));
            return {
                type: "element",
                element: p
            }
        },
        Io = function(e, t, n, r, a) {
            var o, i, c = Object(it.d)(n, it.a.payment_element_beta_1) ? So : Ao,
                u = Object(l.E)(Object(l.u)(c), r, a),
                p = u.value,
                d = p.element,
                f = void 0 === d ? void 0 : d,
                m = p.elements,
                _ = void 0 === m ? void 0 : m,
                h = p.confirmParams,
                y = p.clientSecret,
                b = p.redirect,
                v = u.warnings,
                g = To(n, {
                    rawSecret: y,
                    rawElement: f,
                    rawElements: _
                }, a);
            if ("clientSecret" === g.type) throw new O.a("".concat(a, " with a `clientSecret` is not supported yet. Please use the Payment Element."));
            var j = g.element;
            if ("payment" !== j._componentName) throw new O.a("".concat(a, ' only works with the "payment" element'));
            var E = Object(l.E)(Object(l.s)(Object(l.u)({
                return_url: Object(l.s)(l.x),
                payment_method_data: Object(l.s)(l.p),
                payment_method_options: Object(l.s)(l.p),
                setup_future_usage: Object(l.l)("".concat(a, ": do not pass setup_future_usage at confirm time. Instead, pass setup_future_usage when the PaymentIntent is created."))
            })), h, a, {
                path: ["confirmParams"]
            }).value;
            v.forEach((function(t) {
                return e.warn(t)
            }));
            var w = null != h ? h : {},
                k = (w.payment_method_data, w.payment_method_options, Object(s.a)(w, ["payment_method_data", "payment_method_options"])),
                P = {
                    mode: {
                        tag: "payment-element",
                        frameId: j._implementation._frame.id,
                        data: null !== (o = null == E ? void 0 : E.payment_method_data) && void 0 !== o ? o : {},
                        options: null !== (i = null == E ? void 0 : E.payment_method_options) && void 0 !== i ? i : {}
                    },
                    otherParams: k,
                    expectedType: null,
                    mids: t,
                    options: {
                        handleActions: !0
                    }
                },
                S = b || "always",
                A = null == E ? void 0 : E.return_url;
            if ("if_required" === S) return {
                intentMutationRequest: P,
                redirect: S,
                returnUrl: null
            };
            if ("always" === S && A) return {
                intentMutationRequest: P,
                redirect: S,
                returnUrl: A
            };
            throw new O.a("".concat(a, ": the `confirmParams.return_url` argument is required unless passing `redirect: 'if_required'`"))
        },
        Co = function(e, t) {
            return function(n, a, o, i, c) {
                var s = ya(o, e),
                    u = ga(t, e, i, s),
                    l = va(e, c),
                    p = "none" === u.mode.tag,
                    d = n.action.confirmPaymentIntent(Object(r.a)(Object(r.a)({}, u), {}, {
                        expectedType: t,
                        options: l,
                        mids: a
                    }));
                return l.handleActions ? d.then(ko(n, t, p, !1, u.otherParams.expand)) : d.then(pr)
            }
        },
        No = Co("confirmAcssDebitPayment", sr.acss_debit),
        Ro = Co("confirmAffirmPayment", sr.affirm),
        xo = Co("confirmAfterpayClearpayPayment", sr.afterpay_clearpay),
        Mo = Co("confirmAuBecsDebitPayment", sr.au_becs_debit),
        Lo = Co("confirmBacsDebitPayment", sr.bacs_debit),
        Do = Co("confirmBancontactPayment", sr.bancontact),
        qo = Co("confirmBoletoPayment", sr.boleto),
        Bo = Co("confirmCardPayment", sr.card),
        Fo = Co("confirmEpsPayment", sr.eps),
        Uo = Co("confirmFpxPayment", sr.fpx),
        Yo = Co("confirmGiropayPayment", sr.giropay),
        Go = Co("confirmGrabPayPayment", sr.grabpay),
        Ho = Co("confirmIdealPayment", sr.ideal),
        zo = Co("confirmKlarnaPayment", sr.klarna),
        Wo = Co("confirmKonbiniPayment", sr.konbini),
        Ko = Co("confirmOxxoPayment", sr.oxxo),
        Vo = Co("confirmAlipayPayment", sr.alipay),
        Jo = Co("confirmP24Payment", sr.p24),
        $o = Co("confirmPayPalPayment", sr.paypal),
        Zo = Co("confirmSepaDebitPayment", sr.sepa_debit),
        Xo = Co("confirmSofortPayment", sr.sofort),
        Qo = Co("confirmIdBankTransferPayment", sr.id_bank_transfer),
        ei = Co("confirmUpiPayment", sr.upi),
        ti = Co("confirmUsBankAccountPayment", sr.us_bank_account),
        ni = Co("confirmNzBankAccountPayment", sr.nz_bank_account),
        ri = Co("confirmBlikPayment", sr.blik),
        ai = function(e, t, n, r, a) {
            if (!a || !1 !== a.handleActions) throw new O.a("Expected option `handleActions` to be `false`.");
            return Co("confirmCustomerBalancePayment", sr.customer_balance)(e, t, n, r, a)
        },
        oi = function(e, t, n, a, o) {
            if (o && !0 === o.handleActions) throw new O.a("Expected option `handleActions` to be `false`.");
            var i = Object(r.a)(Object(r.a)({}, a), {}, {
                payment_method: Object(r.a)({}, a && a.payment_method || {}),
                payment_method_options: Object(r.a)(Object(r.a)({}, a && a.payment_method_options || {}), {}, {
                    wechat_pay: Object(r.a)(Object(r.a)({}, a && a.payment_method_options && a.payment_method_options.wechat_pay || {}), {}, {
                        client: "web"
                    })
                })
            });
            return Co("confirmWechatPayPayment", sr.wechat_pay)(e, t, n, i, o)
        },
        ii = function(e, t, n, a, o) {
            if (!a || !a.payment_method_options || !a.payment_method_options.wechat_pay || "web" !== a.payment_method_options.wechat_pay.client && "mobile_web" !== a.payment_method_options.wechat_pay.client) throw new O.a("Expected client value `web` or `mobile_web` in payment_method_options.");
            var i = {};
            "string" == typeof a.payment_method && (i = a.payment_method), "object" == typeof a.payment_method && (i = Object(r.a)({}, a.payment_method || {}));
            var c = Object(r.a)(Object(r.a)({}, a), {}, {
                payment_method: i,
                payment_method_options: Object(r.a)(Object(r.a)({}, a && a.payment_method_options || {}), {}, {
                    wechat_pay: Object(r.a)({}, a && a.payment_method_options && a.payment_method_options.wechat_pay || {})
                })
            });
            return Co("confirmWechatPayPayment", sr.wechat_pay)(e, t, n, c, o)
        },
        ci = ii,
        si = Co("confirmPayNowPayment", sr.paynow),
        ui = Co("confirmPixPayment", sr.pix),
        li = Co("confirmPromptPayPayment", sr.promptpay),
        pi = Co("confirmNetbankingPayment", sr.netbanking),
        di = function(e, t, n, a) {
            var o = ya(n, "updatePaymentIntent"),
                i = function(e) {
                    if (!e || !e.payment_method || !e.payment_method.type || "string" != typeof e.payment_method.type) return null;
                    var t = e.payment_method.type;
                    return sr[t] || null
                }(a),
                c = ga(i, "updatePaymentIntent", a, o);
            return e.action.updatePaymentIntent(Object(r.a)(Object(r.a)({}, c), {}, {
                expectedType: i,
                mids: t,
                options: null
            })).then(pr)
        },
        fi = function(e, t, n) {
            var r = ya(t, "verifyMicrodepositsForPayment"),
                a = Object(l.E)(l.p, n, "stripe.verifyMicrodepositsForPayment");
            return e.action.verifyMicrodepositsForPayment({
                intentSecret: r,
                data: a.value
            }).then(pr)
        },
        mi = function(e, t, n) {
            var r = ya(t, "collectUsBankAccountForPayment"),
                a = Object(l.E)(jr("us_bank_account"), n, "stripe.collectUsBankAccountForPayment");
            return function(e, t, n, r) {
                return Br({
                    linkAccountSessionCreatorClientSecret: e,
                    linkAccountSessionCreatorType: "payment_intent",
                    linkAccountSessionCreatorId: t,
                    controller: n,
                    data: r
                })
            }(r.clientSecret, r.id, e, a.value).then((function(t) {
                return t.error ? e.action.localizeError(Ea).then((function(e) {
                    return u.a.resolve({
                        error: e
                    })
                })) : t.linkAccountSession.paymentAccount ? e.action.attachLinkAccountSessionForPayment({
                    intentSecret: r,
                    linkAccountSessionId: t.linkAccountSession.id
                }).then((function(e) {
                    return pr(e)
                })) : e.action.retrievePaymentIntent({
                    intentSecret: r,
                    hosted: !1
                }).then(pr)
            }))
        },
        _i = function(e, t) {
            var n = ya(e, "handleCardAction");
            return t.action.retrievePaymentIntent({
                intentSecret: n,
                hosted: !1
            }).then((function(e) {
                var n = jo(e);
                switch (n.type) {
                    case "error":
                        return u.a.resolve(pr(e));
                    case "object":
                        var r = n.object;
                        if (mr(r.status)) {
                            if ("manual" !== r.confirmation_method) throw new O.a("handleCardAction: The PaymentIntent supplied does not require manual server-side confirmation. Please use confirmCardPayment instead to complete the payment.");
                            return wo(t, r, sr.card, n.locale, !1)
                        }
                        throw new O.a("handleCardAction: The PaymentIntent supplied is not in the requires_action state.");
                    default:
                        return Object(ht.a)(n)
                }
            }))
        },
        hi = function(e, t) {
            if ("object" == typeof e && null !== e && void 0 !== e.handleActions) throw new O.a("stripe.".concat(t, " does not support a handleActions option. For more information, see ").concat(ha(t)))
        },
        yi = function(e) {
            var t = e.mode;
            return !("paymentMethod-from-data" === t.tag && t.data.acss_debit)
        },
        bi = function(e) {
            return null !== e && "object" == typeof e && !0 === e.skipMandate
        },
        vi = function(e) {
            return null !== e && "object" == typeof e && !!e.shouldCreatePaymentMethod
        },
        gi = function(e) {
            var t = e.controller,
                n = e.shouldCreatePaymentMethod,
                r = e.intentSecret,
                a = e.mode,
                o = e.confirmIntentData;
            return t.action.createAcssDebitSession({
                intentSecret: r,
                shouldCreatePaymentMethod: n,
                confirmIntentData: o,
                mode: a
            }).then((function(e) {
                if ("error" === e.type) return {
                    type: "error",
                    error: e.error
                };
                var n = _o(t, {
                    url: e.object.url,
                    size: "400x600",
                    locale: e.locale,
                    frameTitle: "acss.dialog_frame_title",
                    useLightboxHostedCloseButton: !1
                });
                return new u.a((function(e) {
                    n._on("request-close", (function() {
                        ho(n).then((function() {
                            return t.action.localizeError(ja)
                        })).then((function(t) {
                            e({
                                type: "error",
                                error: t
                            })
                        }))
                    })), n._on("session-complete", (function(t) {
                        var r = t.paymentMethod;
                        ho(n).then((function() {
                            e({
                                type: "success",
                                paymentMethod: r
                            })
                        }))
                    }))
                }))
            }))
        },
        Oi = function(e, t, n, a, o) {
            var i = "confirmAcssDebitPayment",
                c = sr.acss_debit,
                s = ya(n, i),
                u = ga(c, i, a, s),
                l = vi(o);
            return hi(o, i), bi(o) || !yi(u) ? e.action.confirmPaymentIntent(Object(r.a)(Object(r.a)({}, u), {}, {
                expectedType: c,
                options: {
                    handleActions: !1
                },
                mids: t
            })).then(pr) : gi({
                controller: e,
                shouldCreatePaymentMethod: l,
                intentSecret: s,
                mode: "payment",
                confirmIntentData: u
            }).then((function(n) {
                switch (n.type) {
                    case "error":
                        return {
                            error: n.error
                        };
                    case "success":
                        return e.action.confirmPaymentIntent({
                            mode: {
                                tag: "paymentMethod",
                                paymentMethod: n.paymentMethod,
                                options: u.mode.options || {},
                                intentSecret: s
                            },
                            otherParams: u.otherParams,
                            expectedType: c,
                            options: {
                                handleActions: !1
                            },
                            mids: t
                        }).then(pr);
                    default:
                        return Object(ht.a)(n.type)
                }
            }))
        },
        ji = function(e, t, n, a, o) {
            var i = "confirmAcssDebitSetup",
                c = sr.acss_debit,
                s = ba(n, i),
                u = ga(c, i, a, s),
                l = vi(o);
            return hi(o, i), bi(o) || !yi(u) ? e.action.confirmSetupIntent(Object(r.a)(Object(r.a)({}, u), {}, {
                expectedType: c,
                options: {
                    handleActions: !1
                },
                mids: t
            })).then(dr) : gi({
                controller: e,
                shouldCreatePaymentMethod: l,
                intentSecret: s,
                mode: "setup",
                confirmIntentData: u
            }).then((function(n) {
                switch (n.type) {
                    case "error":
                        return {
                            error: n.error
                        };
                    case "success":
                        return e.action.confirmSetupIntent({
                            mode: {
                                tag: "paymentMethod",
                                paymentMethod: n.paymentMethod,
                                options: u.mode.options || {},
                                intentSecret: s
                            },
                            otherParams: u.otherParams,
                            expectedType: c,
                            options: {
                                handleActions: !1
                            },
                            mids: t
                        }).then(dr);
                    default:
                        return Object(ht.a)(n.type)
                }
            }))
        },
        Ei = {
            type: "validation_error",
            code: "errors.code.unexpected"
        },
        wi = {
            type: "validation_error",
            code: "errors.code.incomplete_payment_details"
        },
        ki = function(e, t, n, a, o) {
            var i = "confirmInstantDebitsPilotPayment",
                c = ya(n, i),
                s = va(i, o),
                l = ga(null, i, a, c),
                d = e.createLightboxFrame({
                    type: p.c.INSTANT_DEBITS_APP,
                    options: {
                        intentId: c.id,
                        clientSecret: c.clientSecret,
                        apiKey: e._apiKey,
                        returnOnConfirm: !1 === s.handleActions
                    }
                });
            return d.show(), d.fadeInBackdrop(), new u.a((function(n) {
                var a = function(e) {
                    d.fadeOutBackdrop().then((function() {
                        n(e)
                    }))
                };
                d._once("cancel", (function() {
                    d.fadeOutBackdrop(), e.action.localizeError(wi).then((function(e) {
                        a({
                            error: e
                        })
                    }))
                })), d._on("instant-debits-fetch-payment-intent", (function() {
                    e.action.retrievePaymentIntent({
                        intentSecret: c,
                        hosted: !1
                    }).then((function(t) {
                        if (t.object) {
                            var r = t.object;
                            d.send({
                                action: "stripe-instant-debits-received-payment-intent",
                                payload: {
                                    paymentIntent: r
                                }
                            }), !1 === s.handleActions && setTimeout((function() {
                                d.fadeOutBackdrop(), a(pr(t))
                            }), 2e3)
                        } else {
                            var o = t.error;
                            e.action.localizeError(o).then((function(e) {
                                n({
                                    error: e
                                })
                            }))
                        }
                    }))
                })), d._on("instant-debits-attempt-payment", (function(n) {
                    e.action.confirmPaymentIntent(Object(r.a)(Object(r.a)({}, l), {}, {
                        mode: {
                            tag: "none",
                            intentSecret: c
                        },
                        expectedType: null,
                        options: s,
                        mids: t
                    })).then((function(t) {
                        t.object ? (d.send({
                            action: "stripe-instant-debits-successful-payment-intent",
                            payload: {
                                paymentIntent: t.object
                            }
                        }), setTimeout((function() {
                            a(pr(t))
                        }), 2e3)) : e.action.localizeError(t.error).then((function(e) {
                            a({
                                error: e
                            })
                        }))
                    }))
                })), d._on("instant-debits-flow-error", (function(t) {
                    e.action.localizeError(Ei).then((function(e) {
                        a({
                            error: e
                        })
                    }))
                }))
            }))
        },
        Pi = function(e, t) {
            if (null == e) return Object(l.D)(null);
            var n = e.type,
                r = Object(s.a)(e, ["type"]),
                a = Object(l.G)(l.x, (function() {
                    return null
                }))(n, Object(l.e)(t, "type"));
            return "error" === a.type ? a : Object(l.D)({
                type: a.value,
                data: r
            })
        },
        Si = function(e, t, n, r) {
            if (null === e) {
                if (null === t) {
                    var a = r ? "source_data" : "payment_method_data";
                    throw new O.a("".concat(n, ": you must additionally specify the type of payment method to create within ").concat(a, "."))
                }
                return t
            }
            if (null === t) return e;
            if (t !== e) throw new O.a("".concat(n, ": you specified `type: ").concat(t, "`, but ").concat(n, " will create a ").concat(e, " payment method."));
            return e
        },
        Ai = function(e) {
            return function(t, n) {
                if ("object" == typeof t && null !== t) {
                    var a = t.source,
                        o = t.source_data,
                        i = t.payment_method,
                        c = t.payment_method_data,
                        u = Object(s.a)(t, ["source", "source_data", "payment_method", "payment_method_data"]);
                    if (null != a && "string" != typeof a) return Object(l.g)("string", typeof a, Object(l.e)(n, "source"));
                    if (null != i && "string" != typeof i) return Object(l.g)("string", typeof i, Object(l.e)(n, "payment_method"));
                    if (null != o && "object" != typeof o) return Object(l.g)("object", typeof o, Object(l.e)(n, "source_data"));
                    if (null != c && "object" != typeof c) return Object(l.g)("object", typeof c, Object(l.e)(n, "payment_method_data"));
                    var p = Pi(o, Object(l.e)(n, "source_data"));
                    if ("error" === p.type) return p;
                    var d = p.value,
                        f = Pi(c, Object(l.e)(n, "payment_method_data"));
                    if ("error" === f.type) return f;
                    var m = f.value;
                    return Object(l.D)({
                        sourceData: d,
                        source: null == a ? null : a,
                        paymentMethodData: m,
                        paymentMethod: null == i ? null : i,
                        otherParams: Object(r.a)(Object(r.a)({}, e), u)
                    })
                }
                return null === t ? Object(l.g)("object", "null", n) : Object(l.g)("object", typeof t, n)
            }
        },
        Ti = function(e) {
            return function(t, n) {
                if (void 0 === t) return Object(l.D)({
                    sourceData: null,
                    paymentMethodData: null,
                    source: null,
                    paymentMethod: null,
                    otherParams: {}
                });
                if ("object" != typeof t) return Object(l.g)("object", typeof t, n);
                if (null === t) return Object(l.g)("object", "null", n);
                if (e) {
                    if (!t.payment_intent) {
                        var a = Object(l.E)(Object(l.u)({
                                return_url: Object(l.s)(l.x),
                                expand: Object(l.s)(Object(l.a)(l.x)),
                                shipping: Object(l.s)(Object(l.d)({
                                    name: l.x,
                                    address: Object(l.d)({
                                        line1: Object(l.s)(l.x),
                                        line2: Object(l.s)(l.x),
                                        city: Object(l.s)(l.x),
                                        state: Object(l.s)(l.x),
                                        postal_code: Object(l.s)(l.x),
                                        country: Object(l.s)(l.x)
                                    })
                                }))
                            }), t, "validate otherParams").value,
                            o = Object(r.a)(Object(r.a)({}, t), a);
                        return Object(l.D)({
                            sourceData: null,
                            paymentMethodData: null,
                            source: null,
                            paymentMethod: null,
                            otherParams: o
                        })
                    }
                    var i = t.payment_intent,
                        c = Object(s.a)(t, ["payment_intent"]);
                    return Ai(c)(i, Object(l.e)(n, "payment_intent"))
                }
                return t.payment_intent ? Object(l.f)(new O.a("The payment_intent parameter has been removed. To fix, move everything nested under the payment_intent parameter to the top-level object.")) : Ai({})(t, n)
            }
        },
        Ii = function(e, t, n, a, o, i, c) {
            var s = Object(l.F)(ar, o, a);
            if ("error" === s.type) return null;
            var u = s.value,
                p = Object(l.E)(Ti(t), i, a).value,
                d = p.sourceData,
                f = p.source,
                m = p.paymentMethodData,
                _ = p.paymentMethod,
                h = p.otherParams;
            if (!e && d) throw new O.a("".concat(a, ": Expected payment_method_data, not source_data."));
            if (null != f) throw new O.a("When calling ".concat(a, " on an Element, you can't pass in a pre-existing source ID, as a source will be created using the Element."));
            if (null != _) throw new O.a("When calling ".concat(a, " on an Element, you can't pass in a pre-existing PaymentMethod ID, as a PaymentMethod will be created using the Element."));
            var y = u._componentName,
                b = u._implementation._frame.id,
                v = d || m || {
                    type: null,
                    data: {}
                },
                g = v.type,
                j = v.data,
                E = function(e, t) {
                    return null != t ? t : lr(e) ? null : ur[e] || null
                }(y, g),
                w = e && !m,
                k = {
                    elementName: y,
                    frameId: b,
                    type: Si(n, E, a, w),
                    data: j
                };
            return w ? {
                mode: Object(r.a)({
                    tag: "source-from-element",
                    intentSecret: c
                }, k),
                otherParams: h
            } : {
                mode: Object(r.a)({
                    tag: "paymentMethod-from-element",
                    options: null,
                    intentSecret: c
                }, k),
                otherParams: h
            }
        },
        Ci = function(e, t, n, r, a) {
            return function(o, i) {
                var c = Ii(e, t, n, r, o, i, a);
                if (c) return c;
                var s = function(e, t, n, r, a, o, i) {
                    var c = Object(l.E)(Ti(t), a, r).value,
                        s = c.sourceData,
                        u = c.source,
                        p = c.paymentMethodData,
                        d = c.paymentMethod,
                        f = c.otherParams;
                    if (!e && s) throw new O.a("".concat(r, ": Expected payment_method, source, or payment_method_data, not source_data."));
                    if (null !== u && null !== s) throw new O.a("".concat(r, ": Expected either source or source_data, but not both."));
                    if (null !== d && null !== p) throw new O.a("".concat(r, ": Expected either payment_method or payment_method_data, but not both."));
                    if (null !== d && null !== u) throw new O.a("".concat(r, ": Expected either payment_method or source, but not both."));
                    if (s || p) {
                        var m = s || p || {},
                            _ = m.type,
                            h = m.data,
                            y = e && !p,
                            b = Si(n, _, r, y);
                        return y ? {
                            mode: {
                                tag: "source-from-data",
                                intentSecret: i,
                                type: b,
                                data: h
                            },
                            otherParams: f
                        } : {
                            mode: {
                                tag: "paymentMethod-from-data",
                                type: b,
                                data: h,
                                intentSecret: i,
                                options: null
                            },
                            otherParams: f
                        }
                    }
                    return null !== u ? {
                        mode: {
                            tag: "source",
                            intentSecret: i,
                            source: u
                        },
                        otherParams: f
                    } : null !== d ? {
                        mode: {
                            tag: "paymentMethod",
                            paymentMethod: d,
                            intentSecret: i,
                            options: null
                        },
                        otherParams: f
                    } : {
                        mode: {
                            tag: "none",
                            intentSecret: i
                        },
                        otherParams: f
                    }
                }(e, t, n, r, o, 0, a);
                if (s) return s;
                throw new O.a("Expected: stripe.".concat(r, "(intentSecret, element[, data]) or stripe.").concat(r, "(intentSecret[, data]). Please see the docs for more usage examples https://stripe.com/docs/payments/dynamic-authentication"))
            }
        },
        Ni = function(e, t, n, a, o, i) {
            var c = Object(l.E)(yr, a, "stripe.confirmPaymentIntent intent secret").value,
                s = Ci(e, !1, null, "confirmPaymentIntent", c)(o, i);
            return t.action.confirmPaymentIntent(Object(r.a)(Object(r.a)({}, s), {}, {
                expectedType: null,
                options: {
                    handleActions: !1
                },
                mids: n
            })).then(pr)
        },
        Ri = function(e, t, n, a, o, i, c) {
            var s = Object(l.E)(yr, o, "stripe.handleCardPayment intent secret").value,
                u = sr.card,
                p = Ci(e, a, u, "handleCardPayment", s)(i, c),
                d = !i && !c;
            return t.action.confirmPaymentIntent(Object(r.a)(Object(r.a)({}, p), {}, {
                expectedType: u,
                options: {
                    handleActions: !0
                },
                mids: n
            })).then(ko(t, u, d, !1))
        },
        xi = function(e, t, n, a, o, i) {
            var c = Object(l.E)(yr, a, "stripe.handleSepaDebitPayment intent secret").value,
                s = sr.sepa_debit,
                u = Ci(!1, n, s, "handleSepaDebitPayment", c)(o, i),
                p = !o && !i;
            return e.action.confirmPaymentIntent(Object(r.a)(Object(r.a)({}, u), {}, {
                expectedType: s,
                options: {
                    handleActions: !0
                },
                mids: t
            })).then(ko(e, s, p, !1))
        },
        Mi = function(e, t, n, a, o, i, c) {
            var s = Object(l.E)(yr, o, "stripe.handleIdealPayment intent secret").value,
                u = sr.ideal,
                p = Ci(e, a, u, "handleIdealPayment", s)(i, c),
                d = !i && !c;
            return t.action.confirmPaymentIntent(Object(r.a)(Object(r.a)({}, p), {}, {
                expectedType: u,
                options: {
                    handleActions: !0
                },
                mids: n
            })).then(ko(t, u, d, !1))
        },
        Li = function(e, t, n, a, o, i) {
            var c = Object(l.E)(yr, a, "stripe.handleFpxPayment intent secret").value,
                s = sr.fpx,
                u = Ci(!1, n, s, "handleFpxPayment", c)(o, i),
                p = !o && !i;
            return e.action.confirmPaymentIntent(Object(r.a)(Object(r.a)({}, u), {}, {
                expectedType: s,
                options: {
                    handleActions: !0
                },
                mids: t
            })).then(ko(e, s, p, !1))
        },
        Di = function(e) {
            switch (e.type) {
                case "object":
                    return {
                        returnIntent: e.object
                    };
                case "error":
                    return {
                        error: e.error
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        qi = function(e, t, n) {
            return e.action.confirmReturnIntent({
                returnIntentId: t,
                data: n
            }).then(Di)
        },
        Bi = function(e, t, n, r, a, o) {
            var i = Aa(_r(t), n, e),
                c = fr(t);
            if (!i) return u.a.resolve({
                setupIntent: t
            });
            switch (i.type) {
                case "captcha-challenge":
                    return bo(i, t, e, r);
                case "3ds1-modal":
                    return Ra(i, c, p.g.SETUP_INTENT, e, r, o);
                case "3ds2-fingerprint":
                case "3ds2-challenge":
                    return mo(i, {
                        intentSecret: c,
                        intentType: p.g.SETUP_INTENT,
                        controller: e,
                        locale: r,
                        hosted: a
                    }, o);
                case "redirect":
                    return function(e, t, n) {
                        return Object(xr.a)(t).then((function(t) {
                            return Object(xr.b)(n, "next_action redirect", t), dr(t, e)
                        }))
                    }(t, i.redirectUrl, e);
                case "us_bank_account_link":
                    return go({
                        controller: e,
                        intentSecret: c,
                        intentType: p.g.SETUP_INTENT,
                        locale: r
                    });
                case "link_authenticate_account":
                    return e.action.completeLinkSetup({
                        intentSecret: t.client_secret,
                        intentId: t.id,
                        expandParam: o
                    }).then((function(e) {
                        return e ? u.a.resolve(dr(e)) : u.a.resolve({
                            setupIntent: t
                        })
                    }));
                default:
                    return u.a.resolve({
                        setupIntent: t
                    })
            }
        },
        Fi = function e(t, n, r, a, o, i) {
            var c = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : 0;
            if (p.i < c) throw new Error("max action recursion depth reached");
            return Bi(t, n, r, a, o, i || []).then((function(n) {
                if (n.paymentIntent) throw new Error("Got unexpected PaymentIntent response");
                if (n.setupIntent && null != n.setupIntent.next_action && "use_stripe_sdk" === n.setupIntent.next_action.type && -1 !== p.j.indexOf(n.setupIntent.next_action.use_stripe_sdk.type)) {
                    var s = c;
                    return e(t, n.setupIntent, r, a, o, i, ++s)
                }
                return n
            }))
        },
        Ui = function(e, t, n, r, a) {
            return function(o) {
                switch (o.type) {
                    case "error":
                        var i = o.error,
                            c = i.setup_intent;
                        return n && c && "succeeded" === c.status ? u.a.resolve({
                            setupIntent: c
                        }) : u.a.resolve({
                            error: i
                        });
                    case "object":
                        var s = o.object;
                        return Fi(e, s, t, o.locale, r, a);
                    default:
                        return Object(ht.a)(o)
                }
            }
        },
        Yi = function(e, t) {
            return function(n, a, o, i, c) {
                var s = ba(o, e),
                    u = ga(t, e, i, s),
                    l = va(e, c),
                    p = "none" === u.mode.tag,
                    d = n.action.confirmSetupIntent(Object(r.a)(Object(r.a)({}, u), {}, {
                        expectedType: t,
                        options: l,
                        mids: a
                    }));
                return l.handleActions ? d.then(Ui(n, t, p, !1, u.otherParams.expand)) : d.then(dr)
            }
        },
        Gi = Yi("confirmAcssDebitSetup", sr.acss_debit),
        Hi = Yi("confirmAfterpayClearpaySetup", sr.afterpay_clearpay),
        zi = Yi("confirmCardSetup", sr.card),
        Wi = Yi("confirmSepaDebitSetup", sr.sepa_debit),
        Ki = Yi("confirmAuBecsDebitSetup", sr.au_becs_debit),
        Vi = Yi("confirmBacsDebitSetup", sr.bacs_debit),
        Ji = Yi("confirmIdealSetup", sr.ideal),
        $i = Yi("confirmAlipaySetup", sr.alipay),
        Zi = Yi("confirmSofortSetup", sr.sofort),
        Xi = Yi("confirmBancontactSetup", sr.bancontact),
        Qi = Yi("confirmIdBankTransferSetup", sr.id_bank_transfer),
        ec = Yi("confirmPayPalSetup", sr.paypal),
        tc = Yi("confirmUsBankAccountSetup", sr.us_bank_account),
        nc = Yi("confirmNzBankAccountSetup", sr.nz_bank_account),
        rc = function(e, t, n) {
            var r = ba(t, "verifyMicrodepositsForSetup"),
                a = Object(l.E)(l.p, n, "stripe.verifyMicrodepositsForSetup");
            return e.action.verifyMicrodepositsForSetup({
                intentSecret: r,
                data: a.value
            }).then(dr)
        },
        ac = function(e, t, n) {
            var r = ba(t, "collectUsBankAccountForSetup"),
                a = Object(l.E)(jr("us_bank_account"), n, "stripe.collectUsBankAccountForSetup");
            return function(e, t, n, r) {
                return Br({
                    linkAccountSessionCreatorClientSecret: e,
                    linkAccountSessionCreatorType: "setup_intent",
                    linkAccountSessionCreatorId: t,
                    controller: n,
                    data: r
                })
            }(r.clientSecret, r.id, e, a.value).then((function(t) {
                return t.error ? e.action.localizeError(Ea).then((function(e) {
                    return u.a.resolve({
                        error: e
                    })
                })) : t.linkAccountSession.paymentAccount ? e.action.attachLinkAccountSessionForSetup({
                    intentSecret: r,
                    linkAccountSessionId: t.linkAccountSession.id
                }).then((function(e) {
                    return dr(e)
                })) : e.action.retrieveSetupIntent({
                    intentSecret: r,
                    hosted: !1
                }).then(dr)
            }))
        },
        oc = function(e, t, n, a, o) {
            var i = Object(l.E)(br, n, "stripe.handleCardSetup intent secret").value,
                c = sr.card,
                s = Ci(!1, !1, c, "handleCardSetup", i)(a, o),
                u = !a && !o;
            return e.action.confirmSetupIntent(Object(r.a)(Object(r.a)({}, s), {}, {
                expectedType: c,
                options: {
                    handleActions: !0
                },
                mids: t
            })).then(Ui(e, c, u, !1, s.otherParams.expand))
        },
        ic = function(e, t, n, a, o) {
            var i = Object(l.E)(br, n, "stripe.handleSepaDebitSetup intent secret").value,
                c = sr.sepa_debit,
                s = Ci(!1, !1, c, "handleSepaDebitSetup", i)(a, o),
                u = !a && !o;
            return e.action.confirmSetupIntent(Object(r.a)(Object(r.a)({}, s), {}, {
                expectedType: c,
                options: {
                    handleActions: !0
                },
                mids: t
            })).then(Ui(e, c, u, !1))
        },
        cc = function(e, t, n, a, o) {
            var i = Object(l.E)(br, n, "stripe.confirmSetupIntent intent secret").value,
                c = Ci(!1, !1, null, "confirmSetupIntent", i)(a, o);
            return e.action.confirmSetupIntent(Object(r.a)(Object(r.a)({}, c), {}, {
                otherParams: Object(r.a)({}, c.otherParams),
                expectedType: null,
                options: {
                    handleActions: !1
                },
                mids: t
            })).then(dr)
        },
        sc = function(e, t) {
            var n = function(e) {
                    if ("string" == typeof e) {
                        var t = e.trim().match(/^((vi|vs)_[0-9a-zA-Z]+)_secret_([0-9a-zA-Z]+)$/);
                        if (!t) throw new O.a("stripe.verifyIdentity: Could not parse client secret.");
                        return {
                            identityClientSecret: t[0],
                            id: t[1],
                            token: t[3]
                        }
                    }
                    throw new O.a("stripe.verifyIdentity: Could not parse client secret.")
                }(e),
                r = n.id;
            return function(e) {
                var t = e.controller,
                    n = e.url,
                    r = (e.id, e.locale),
                    a = _o(t, {
                        url: n,
                        size: "1100x800",
                        frameTitle: "identity.verification_frame_title",
                        locale: void 0 === r ? "en-US" : r,
                        useLightboxHostedCloseButton: !0,
                        allowCamera: !0,
                        appType: "identity"
                    });
                return new u.a((function(e) {
                    var t = {
                        type: "user_action",
                        code: "session_cancelled"
                    };
                    a._on("identity-frame-close", (function() {
                        ho(a).then((function() {
                            e({
                                error: t
                            })
                        }))
                    })), a._on("identity-frame-error", (function(e) {
                        var n = e.type,
                            r = e.code;
                        t = {
                            type: n,
                            code: r
                        }
                    })), a._on("identity-frame-session-complete", (function() {
                        t = null
                    })), a._on("request-close", (function(n) {
                        ho(a).then((function() {
                            e({
                                error: t
                            })
                        }))
                    }))
                }))
            }({
                controller: t,
                url: function(e) {
                    return "".concat(p.f, "start/").concat(e)
                }(n.token),
                id: r
            })
        },
        uc = function(e, t) {
            if ("string" != typeof e) return Object(l.i)("an Issuing card ID of the form ic_xxx", e, t);
            var n, r = (n = e.trim().match(/ic_[a-zA-Z0-9_]+$/)) ? n[0] : null;
            return null === r ? Object(l.i)("an Issuing card ID of the form ic_xxx", e, t) : Object(l.D)(r, [])
        },
        lc = function(e, t) {
            return Object(l.E)(uc, e, "stripe.".concat(t, " cardId")).value
        },
        pc = function(e, t) {
            if ("string" != typeof e) return Object(l.i)("an ephemeral key secret of the form ek_xxx", e, t);
            var n, r = (n = e.trim().match(/ek_[a-zA-Z0-9_]+$/)) ? n[0] : null;
            return null === r ? Object(l.i)("an ephemeral key secret of the form ek_xxx", e, t) : Object(l.D)(r, [])
        },
        dc = function(e, t) {
            return Object(l.E)(pc, e, "stripe.".concat(t, " ephemeral key secret")).value
        },
        fc = function(e, t) {
            if ("string" != typeof e) return Object(l.i)("an ephemeral key nonce of the form ephkn_xxx", e, t);
            var n, r = (n = e.trim().match(/ephkn_[a-zA-Z0-9_]+$/)) ? n[0] : null;
            return null === r ? Object(l.i)("an ephemeral key nonce of the form ephkn_xxx", e, t) : Object(l.D)(r, [])
        },
        mc = function(e) {
            var t, n;
            if ("object" == typeof e && e && e.ephemeralKeySecret && e.nonce) return {
                ephemeralKeySecret: dc(e.ephemeralKeySecret, "retrieveIssuingCard"),
                publicNonce: (t = e.nonce, n = "retrieveIssuingCard", Object(l.E)(fc, t, "stripe.".concat(n, " ephemeral key nonce")).value)
            };
            throw new O.a("When retrieving an Issuing card, you must specify an ephemeral key secret and an ephemeral key nonce in the options argument of stripe.retrieveIssuingCard.")
        },
        _c = function(e, t) {
            var n = function(e) {
                if ("object" == typeof e && e && e.issuingCard) return {
                    issuingCard: lc(e.issuingCard, "createEphemeralKeyNonce")
                };
                throw new O.a("When creating an ephemeral key nonce, you must specify an Issuing card ID in the options argument of stripe.createEphemeralKeyNonce.")
            }(e);
            return t.action.createEphemeralKeyNonce({
                cardId: n.issuingCard
            }).then(Fn)
        },
        hc = n(46),
        yc = n(59),
        bc = function(e) {
            switch (e.type) {
                case "object":
                    return {
                        token: e.object
                    };
                case "error":
                    return {
                        error: e.error
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        vc = function(e) {
            return "object" == typeof e && null !== e ? e : {}
        },
        gc = function(e) {
            switch (e.type) {
                case "object":
                    return {
                        radarSession: e.object
                    };
                case "error":
                    return {
                        error: e.error
                    };
                default:
                    return Object(ht.a)(e)
            }
        },
        Oc = "securitypolicyviolation",
        jc = window,
        Ec = /^require-trusted-types-for/,
        wc = "LOAD_ERROR",
        kc = "REPORT_ONLY",
        Pc = "BLOCKED",
        Sc = new Ve.a,
        Ac = document ? document.readyState : "unknown",
        Tc = !1;
    switch (Ac) {
        case "loading":
            Tc = !0;
            break;
        case "interactive":
            try {
                var Ic = function() {
                    Tc = !0
                };
                setTimeout((function() {
                    document.removeEventListener("DOMContentLoaded", Ic)
                }), 0), document.addEventListener("DOMContentLoaded", Ic)
            } catch (e) {}
    }
    var Cc, Nc = !1,
        Rc = function e(t, a, o, i) {
            if (!Nc || i) {
                Nc = !0;
                var s = i || new Ve.a;
                if ("complete" === document.readyState) {
                    var l = null,
                        p = null,
                        d = null,
                        f = null,
                        m = null;
                    if (window.performance) {
                        if (window.performance.timing) {
                            var _ = window.performance.timing,
                                h = _.fetchStart;
                            l = _.domLoading - h, p = _.domInteractive - h, d = _.domComplete - h, f = Ve.a.fromPosixTime(h).getElapsedTime(Sc)
                        }
                        if (window.performance.getEntriesByType) {
                            var y = window.performance.getEntriesByType("resource"),
                                b = "https://js.stripe.com/v3/".replace(/\/$/, "");
                            m = y.reduce((function(e, t) {
                                if (0 === t.name.indexOf(b)) {
                                    var n = t.name.match(/\/([^/#?]*)\/?(?:$|[#?])/);
                                    if (n && n[1]) {
                                        var a = n[1].replace(/-[0-9a-f]{32}\./, ".");
                                        return "v3" === a && (a = "stripe.js"), Object(r.a)(Object(r.a)({}, e), {}, Object(c.a)({}, a, {
                                            transfer_size: t.transferSize,
                                            duration: Math.round(t.duration)
                                        }))
                                    }
                                }
                                return e
                            }), {})
                        }
                    }
                    t.report("timings", {
                        element: t.controllerFor(),
                        dom_loading: l,
                        dom_interactive: p,
                        dom_complete: d,
                        since_fetch: f,
                        load_count: 1,
                        load_before_dom_content_loaded: Tc,
                        load_ready_state: Ac,
                        first_create_ready_state: a,
                        first_mount_readyState: o,
                        until_first_create: Sc.getElapsedTime(t._createTimestamp),
                        until_first_mount: t._mountTimestamp ? Sc.getElapsedTime(t._mountTimestamp) : null,
                        until_first_load: Sc.getElapsedTime(s),
                        resource_timings: m
                    }), setTimeout((function() {
                        new u.a((function(e) {
                            if (jc.trustedTypes && jc.Promise) {
                                var t, r = !1,
                                    a = function(e) {
                                        (Ec.test(e.effectiveDirective) || Ec.test(e.violatedDirective)) && (Object(me.b)(e.blockedURI) || Object(me.b)(e.sourceFile)) && (r = !0)
                                    },
                                    o = function() {
                                        return r ? Pc : wc
                                    };
                                jc.addEventListener(Oc, a);
                                try {
                                    t = n.e(7).then(n.bind(null, 74)).then((function(e) {
                                        return (e.loaded && r ? kc : "ALLOWED") || wc
                                    }), o)
                                } catch (e) {
                                    t = new u.a((function(e) {
                                        return setTimeout(e, 0)
                                    })).then(o)
                                }
                                t.then((function() {
                                    jc.removeEventListener(Oc, a)
                                })), e(t)
                            } else e("NOT_SUPPORTED")
                        })).then((function(e) {
                            t.report("trusted_types_check", {
                                    result: e
                                }),
                                function(e) {
                                    switch (e) {
                                        case kc:
                                        case Pc:
                                            return !0
                                    }
                                    return !1
                                }(e) && t.warn("We noticed that you are using Trusted Types. Nothing has broken, but we plan to add dynamic loading to parts of Stripe.js. Please allow scripts from 'https://js.stripe.com' in your default Trusted Types policy. For more information: https://stripe.com/docs/security/guide#content-security-policy")
                        }))
                    }), 5e3)
                } else window.addEventListener("load", (function() {
                    try {
                        e(t, a, o, s)
                    } catch (e) {}
                }))
            }
        },
        xc = Object(l.u)({
            apiKey: l.x,
            stripeAccount: Object(l.s)(l.x),
            locale: Object(l.s)(l.x),
            apiVersion: Object(l.s)(l.x),
            __privateApiUrl: Object(l.s)(l.x),
            __checkout: Object(l.s)(Object(l.u)({
                mids: Object(l.u)({
                    muid: l.x,
                    sid: l.x
                })
            })),
            __hosted3DS: Object(l.s)(l.b),
            canCreateRadarSession: Object(l.s)(l.b),
            betas: Object(l.s)(Object(l.a)(l.x))
        }),
        Mc = function(e) {
            return "You have an in-flight ".concat(e, "! Please be sure to disable your form submit button when ").concat(e, " is called.")
        },
        Lc = function(e) {
            return function() {
                throw new O.a("You cannot call `stripe.".concat(e, "` without supplying an appropriate beta flag when initializing Stripe.js."))
            }
        },
        Dc = function(e) {
            return function() {
                throw new O.a("You cannot call `stripe.".concat(e, "` without supplying an Issuing beta flag when initializing Stripe.js."))
            }
        },
        qc = function() {
            function e(t, n) {
                var a = this;
                Object(o.a)(this, e), this._listenerRegistry = Le(), this.elements = w((function(e) {
                    return new Zr(a._controller, a._listenerRegistry, {
                        stripeJsLoadTimestamp: Sc,
                        stripeCreateTimestamp: a._controller._createTimestamp
                    }, a._betas, a._mids(), Object(r.a)(Object(r.a)({}, a._locale ? {
                        locale: a._locale
                    } : {}), e))
                }), void 0, "elements"), this.createToken = S((function(e, t) {
                    var n = a._mids();
                    return "cvc_update" === e ? function(e, t, n) {
                        var r = or(t);
                        if (r && "cardCvc" === r._componentName) {
                            var a = r._implementation._frame.id;
                            return e.action.tokenizeCvcUpdate({
                                frameId: a,
                                mids: n
                            }).then(bc)
                        }
                        throw new O.a("You must provide a `cardCvc` Element to create a `cvc_update` token.")
                    }(a._controller, t, n) : function(e, t) {
                        return function(n, r) {
                            var a = or(n);
                            if (a) {
                                var o = a._implementation._frame.id,
                                    i = a._componentName,
                                    c = vc(r);
                                return e.action.tokenizeWithElement({
                                    frameId: o,
                                    elementName: i,
                                    tokenData: c,
                                    mids: t
                                }).then(bc)
                            }
                            if ("string" == typeof n) {
                                var s = n,
                                    u = vc(r);
                                return e.action.tokenizeWithData({
                                    elementName: null,
                                    type: s,
                                    tokenData: u,
                                    mids: t
                                }).then(bc)
                            }
                            throw new O.a("You must provide a Stripe Element or a valid token type to create a Token.")
                        }
                    }(a._controller, n)(e, t)
                }), void 0, "createToken"), this.createSource = S((function(e, t) {
                    var n = or(e),
                        r = la(n ? t : e),
                        o = r || {
                            type: null,
                            data: {}
                        },
                        i = o.type,
                        c = o.data;
                    if (n) {
                        var s = n._implementation._frame.id,
                            l = n._componentName;
                        return !r && lr(l) ? u.a.reject(new O.a("Please provide Source creation parameters to createSource.")) : a._controller.action.createSourceWithElement({
                            frameId: s,
                            elementName: l,
                            type: i,
                            sourceData: c,
                            mids: a._mids()
                        }).then(pa)
                    }
                    return r ? i ? a._controller.action.createSourceWithData({
                        elementName: null,
                        type: i,
                        sourceData: c,
                        mids: a._mids()
                    }).then(pa) : u.a.reject(new O.a("Please provide a source type to createSource.")) : u.a.reject(new O.a("Please provide either an Element or Source creation parameters to createSource."))
                }), void 0, "createSource"), this.retrieveSource = P((function(e) {
                    var t = Object(l.E)(fa, {
                            source: e
                        }, "retrieveSource"),
                        n = t.value;
                    return t.warnings.forEach((function(e) {
                        return a._controller.warn(e)
                    })), a._controller.action.retrieveSource(n).then(pa)
                }), void 0, "retrieveSource"), this.paymentRequest = k((function(e, t) {
                    Object(d.b)(a._keyMode);
                    var n = a._isCheckout && t ? t : null;
                    return Xr(a._controller, {
                        apiKey: a._apiKey,
                        accountId: a._stripeAccount
                    }, a._mids(), e, a._betas, n, a._listenerRegistry)
                }), void 0, "paymentRequest");
                var i = new Ve.a,
                    c = Object(l.E)(xc, t || {}, "Stripe()"),
                    s = c.value,
                    p = c.warnings,
                    f = s.apiKey,
                    m = s.stripeAccount,
                    _ = s.apiVersion,
                    h = s.locale,
                    y = s.__privateApiUrl,
                    b = s.__checkout,
                    v = s.__hosted3DS,
                    g = s.canCreateRadarSession,
                    j = function(e) {
                        var t = [],
                            n = [];
                        if (e && e.forEach((function(e) {
                                it.c.indexOf(e) > -1 ? t.push(it.a[e]) : n.push(e)
                            })), n.length > 0) {
                            var r = "The following betas are unrecognized for Stripe() parameter:\n\n- ".concat(n.join("\n- "), "\n\n They are either invalid or expired betas, please remove these beta flags to prevent future integration issues.");
                            return {
                                validBetas: t,
                                betaWarning: r
                            }
                        }
                        return {
                            validBetas: t
                        }
                    }(s.betas || null),
                    E = j.validBetas,
                    A = j.betaWarning;
                A && p.push(A), ia(f), (null == b ? void 0 : b.mids) && (e._ec = ze({
                    checkoutIds: b.mids
                })), this._apiKey = f.trim(), this._keyMode = Object(d.c)(this._apiKey), this._betas = E, this._locale = ft(h, this._betas) || null, this._stripeAccount = m || null, this._isCheckout = !!b, this._attachControllerGetter(_, y, m, i), p.forEach((function(e) {
                    return a._controller.warn(e)
                })), $e(), this._ensureHTTPS(), this._ensureStripeHosted(n), this._attachPaymentIntentMethods(this._betas, !!v), this._attachLegacyPaymentIntentMethods(this._betas), this._attachCheckoutMethods(this._betas), this._attachPrivateMethodsForCheckout(this._isCheckout), this._attachPrivateMethodsForConsumer(xe), this._attachCreateRadarSession(g || !1), this._attachGetters(), this._attachIssuingCardMethods(this._betas), this._attachIdentityMethods(this._betas), this._attachLinkedAccounts(this._betas), this._attachAppInfo()
            }
            return Object(i.a)(e, [{
                key: "_attachCreateRadarSession",
                value: function(e) {
                    var t, n, r, a = this;
                    e && (this.createRadarSession = (t = function() {
                        return a._midsPromise().then((function(e) {
                            return t = a._controller, n = e, t.action.createRadarSession({
                                mids: n
                            }).then(gc);
                            var t, n
                        }))
                    }, function() {
                        var e = this;
                        try {
                            return t.call(this).catch((function(t) {
                                return E(t, n || e && e._controller, !0, r)
                            }))
                        } catch (e) {
                            return E(e, n || this && this._controller, !1, r)
                        }
                    }))
                }
            }, {
                key: "_attachPaymentIntentMethods",
                value: function(e, t) {
                    var n, r, a, o = this,
                        i = function() {
                            return o._mids()
                        };
                    this.createPaymentMethod = (n = function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return _a.apply(void 0, [o._controller, i()].concat(t))
                    }, r = void 0, a = "createPaymentMethod", function(e, t, o) {
                        try {
                            return n.call(this, e, t, o)
                        } catch (e) {
                            return E(e, r || this && this._controller, !1, a)
                        }
                    }), this._createPaymentMethod = this.createPaymentMethod, this.retrievePaymentIntent = P((function(e) {
                        return function(e, t) {
                            var n = ya(e, "retrievePaymentIntent");
                            return t.action.retrievePaymentIntent({
                                intentSecret: n,
                                hosted: !1
                            }).then(pr)
                        }(e, o._controller)
                    }), void 0, "retrievePaymentIntent"), this.retrieveSetupIntent = P((function(e) {
                        return function(e, t) {
                            var n = ba(e, "retrieveSetupIntent");
                            return t.action.retrieveSetupIntent({
                                intentSecret: n,
                                hosted: !1
                            }).then(dr)
                        }(e, o._controller)
                    }), void 0, "retrieveSetupIntent"), this.updatePaymentIntent = Lc("updatePaymentIntent"), (Object(it.d)(this._betas, it.a.line_items_beta_1) || Object(it.d)(this._betas, it.a.tax_product_beta_1)) && (this.updatePaymentIntent = S((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return di.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "updatePaymentIntent"));
                    var c = Object(Ft.a)(_i, Mc("handleCardAction"));
                    this.handleCardAction = P((function(e) {
                        return c(e, o._controller)
                    }), void 0, "handleCardAction");
                    var s = Object(Ft.a)(Bo, Mc("confirmCardPayment"));
                    this.confirmCardPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return s.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmCardPayment");
                    var u = Object(Ft.a)(zi, Mc("confirmCardSetup"));
                    this.confirmCardSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return u.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmCardSetup"), this.confirmIdealPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Ho.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmIdealPayment"), this.confirmSepaDebitPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Zo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmSepaDebitPayment"), this.confirmSepaDebitSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Wi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmSepaDebitSetup"), this.confirmFpxPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Uo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmFpxPayment"), this.confirmAlipayPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Vo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAlipayPayment"), this.confirmAlipaySetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return $i.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAlipaySetup"), this.confirmAuBecsDebitPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Mo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAuBecsDebitPayment"), this.confirmAuBecsDebitSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Ki.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAuBecsDebitSetup"), this.confirmBacsDebitPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Lo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmBacsDebitPayment"), this.confirmBacsDebitSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Vi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmBacsDebitSetup"), this.confirmBancontactPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Do.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmBancontactPayment"), this.confirmBoletoPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return qo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmBoletoPayment"), this.confirmEpsPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Fo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmEpsPayment"), this.confirmGiropayPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Yo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmGiropayPayment"), this.confirmOxxoPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Ko.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmOxxoPayment"), this.confirmP24Payment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Jo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmP24Payment"), this.confirmSofortPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Xo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmSofortPayment"), this.confirmIdealSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Ji.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmIdealSetup"), this.confirmSofortSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Zi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmSofortSetup"), this.confirmBancontactSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Xi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmBancontactSetup"), this.confirmGrabPayPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Go.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmGrabPayPayment"), this.confirmAfterpayClearpayPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return xo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAfterpayClearpayPayment"), this.verifyMicrodepositsForPayment = S((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return fi.apply(void 0, [o._controller].concat(t))
                    }), void 0, "verifyMicrodepositsForPayment"), this.verifyMicrodepositsForSetup = S((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return rc.apply(void 0, [o._controller].concat(t))
                    }), void 0, "verifyMicrodepositsForSetup"), this.confirmPayment = P((function(e) {
                        return function(e, t, n, r) {
                            var a = Io(e, t, n, r, "stripe.confirmPayment()"),
                                o = a.intentMutationRequest;
                            return e.action.confirmPaymentIntent(o).then(ko(e, null, !1, !1, o.otherParams.expand)).then((function(t) {
                                return t.error || "always" !== a.redirect ? t : Object(xr.a)(Oa(a.returnUrl, t.paymentIntent)).then((function(n) {
                                    return Object(xr.b)(e, "confirmPayment redirect", n), pr(n, t.paymentIntent)
                                }))
                            }))
                        }(o._controller, i(), o._betas, e)
                    }), void 0, "confirmPayment"), this.confirmSetup = P((function(e) {
                        return function(e, t, n, r) {
                            var a = Io(e, t, n, r, "stripe.confirmSetup()"),
                                o = a.intentMutationRequest;
                            return e.action.confirmSetupIntent(o).then(Ui(e, null, !1, !1, o.otherParams.expand)).then((function(t) {
                                return t.error || "always" !== a.redirect ? t : Object(xr.a)(Oa(a.returnUrl, t.setupIntent)).then((function(n) {
                                    return Object(xr.b)(e, "confirmSetup redirect", n), dr(n, t.setupIntent)
                                }))
                            }))
                        }(o._controller, i(), o._betas, e)
                    }), void 0, "confirmSetup"), this.confirmKlarnaPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return zo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmKlarnaPayment"), Object(it.d)(this._betas, it.a.us_bank_account_beta_2) && (this.collectUsBankAccountForPayment = S((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return mi.apply(void 0, [o._controller].concat(t))
                    }), void 0, "collectUsBankAccountForPayment"), this.collectUsBankAccountForSetup = S((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ac.apply(void 0, [o._controller].concat(t))
                    }), void 0, "collectUsBankAccountForSetup")), Object(it.d)(this._betas, it.a.acss_debit_beta_1) ? (this.confirmAcssDebitPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return No.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAcssDebitPayment"), this.confirmAcssDebitSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Gi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAcssDebitSetup")) : (this.confirmAcssDebitPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Oi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAcssDebitPayment"), this.confirmAcssDebitSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ji.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAcssDebitSetup")), this.confirmAfterpayClearpaySetup = Lc("confirmAfterpayClearpaySetup"), Object(it.d)(this._betas, it.a.afterpay_clearpay_setup_intents_beta) && (this.confirmAfterpayClearpaySetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Hi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAfterpayClearpaySetup")), this.confirmBlikPayment = Lc("confirmBlikPayment"), Object(it.d)(this._betas, it.a.blik_beta_1) && (this.confirmBlikPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ri.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmBlikPayment")), this.confirmCustomerBalancePayment = Lc("confirmCustomerBalancePayment"), Object(it.d)(this._betas, it.a.customer_balance_beta_1) && (this.confirmCustomerBalancePayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ai.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmCustomerBalancePayment")), Object(it.d)(this._betas, it.a.return_intents_beta_1) && (this.confirmReturnIntent = S((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return qi.apply(void 0, [o._controller].concat(t))
                    }), void 0, "confirmReturnIntent")), this.confirmAffirmPayment = Lc("confirmAffirmPayment"), Object(it.d)(this._betas, it.a.affirm_pilot_beta_1) && (this.confirmAffirmPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Ro.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmAffirmPayment")), this.confirmKonbiniPayment = Lc("confirmKonbiniPayment"), Object(it.d)(this._betas, it.a.konbini_pm_beta_1) && (this.confirmKonbiniPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Wo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmKonbiniPayment")), Object(it.d)(this._betas, it.a.oxxo_pm_beta_1) && (this.confirmOxxoPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Ko.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmOxxoPayment")), this.confirmWechatPayPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ci.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmWechatPayPayment"), Object(it.d)(this._betas, it.a.wechat_pay_pm_beta_1) && (this.confirmWechatPayPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return oi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmWechatPayPayment")), Object(it.d)(this._betas, it.a.wechat_pay_pm_beta_2) && (this.confirmWechatPayPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ii.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmWechatPayPayment")), this.confirmPayNowPayment = Lc("confirmPayNowPayment"), Object(it.d)(this._betas, it.a.paynow_beta_1) && (this.confirmPayNowPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return si.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmPayNowPayPayment")), this.confirmPixPayment = Lc("confirmPixPayment"), Object(it.d)(this._betas, it.a.pix_beta_1) && (this.confirmPixPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ui.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmPixPayment")), this.confirmPromptPayPayment = Lc("confirmPromptPayPayment"), Object(it.d)(this._betas, it.a.promptpay_beta_1) && (this.confirmPromptPayPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return li.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmPromptPayPayment")), this.confirmPayPalPayment = Lc("confirmPayPalPayment"), Object(it.d)(this._betas, it.a.paypal_pm_beta_1) && (this.confirmPayPalPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return $o.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmPayPalPayment")), Object(it.d)(this._betas, it.a.paypal_pm_beta_1) && (this.confirmPayPalSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ec.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmPayPalSetup")), this.confirmUpiPayment = Lc("confirmUpiPayment"), Object(it.d)(this._betas, it.a.upi_beta_1) && (this.confirmUpiPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ei.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmUpiPayment")), (Object(it.d)(this._betas, it.a.us_bank_account_beta_1) || Object(it.d)(this._betas, it.a.us_bank_account_beta_2)) && (this.confirmUsBankAccountPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ti.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmUsBankAccountPayment"), this.confirmUsBankAccountSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return tc.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmUsBankAccountSetup")), Object(it.d)(this._betas, it.a.nz_bank_account_beta_1) && (this.confirmNzBankAccountPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ni.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmNzBankAccountPayment"), this.confirmNzBankAccountSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return nc.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmNzBankAccountSetup")), this.confirmNetbankingPayment = Lc("confirmNetbankingPayment"), Object(it.d)(this._betas, it.a.netbanking_beta_1) && (this.confirmNetbankingPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return pi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmNetbankingPayment")), this.confirmInstantDebitsPilotPayment = Lc("confirmInstantDebitsPilotPayment"), Object(it.d)(this._betas, it.a.instant_debits_beta_1) && (this.confirmInstantDebitsPilotPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return ki.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmInstantDebitsPilotPayment")), this.linkAutofillModal = Lc("linkAutofillModal"), Object(it.d)(this._betas, it.a.link_autofill_modal_beta_1) && (this.linkAutofillModal = w((function(e) {
                        return function(e, t) {
                            var n = function(e) {
                                    throw new O.a("stripe.linkAutofill.".concat(e, " can only be called when the user is logged-in."))
                                },
                                r = !1,
                                a = !1,
                                o = e.createLightboxFrame({
                                    type: p.c.LINK_AUTOFILL_MODAL,
                                    options: {
                                        apiKey: e._apiKey,
                                        locale: "en-GB"
                                    },
                                    groupId: t._id
                                }),
                                i = function() {
                                    r = !0, o.show(), o.fadeInBackdrop()
                                },
                                c = function() {
                                    r = !1, o.fadeOutBackdrop()
                                };
                            o._on("open", (function() {
                                i()
                            })), o._on("cancel", (function() {
                                c()
                            }));
                            var s = [];
                            o._on("link-autofill-modal-authenticated", (function(e) {
                                a = !0, s.forEach((function(t) {
                                    t({
                                        value: {
                                            email: e.emailAddress
                                        }
                                    })
                                }))
                            }));
                            var u = [];
                            return o._on("link-autofill-modal-autofill-info", (function(e) {
                                c(), u.forEach((function(t) {
                                    t({
                                        value: {
                                            shippingAddress: e.info.shippingAddress,
                                            billingAddress: e.info.billingAddress
                                        }
                                    })
                                }))
                            })), {
                                on: function(t, n) {
                                    if ("function" != typeof n) throw new O.a("stripe.linkAutofill.on: Expected the handler to be a function.");
                                    switch (t) {
                                        case "authenticated":
                                            s.push(w(n, e, "authenticationHandler"));
                                            break;
                                        case "autofill":
                                            u.push(w(n, e, "autofillHandler"));
                                            break;
                                        default:
                                            throw new O.a("stripe.linkAutofill.on: Expected either 'authenticated' or 'autofill' as an event name.")
                                    }
                                },
                                launch: function(e) {
                                    var t = e.email;
                                    o.send({
                                        action: "stripe-link-autofill-modal-email-attempt",
                                        payload: {
                                            email: t
                                        }
                                    })
                                },
                                show: function() {
                                    a || n("show"), r || i()
                                },
                                logout: function() {
                                    if (a || n("logout"), r) throw new O.a("stripe.linkAutofill.logout can only be called when the modal is closed. Did you call it from outside a click event?");
                                    a = !1, o.send({
                                        action: "stripe-link-autofill-modal-logout",
                                        payload: {}
                                    })
                                }
                            }
                        }(o._controller, e)
                    }), void 0, "linkAutofillModal")), this.confirmIdBankTransferPayment = Lc("confirmIdBankTransferPayment"), this.confirmIdBankTransferSetup = Lc("confirmIdBankTransferSetup"), Object(it.d)(this._betas, it.a.id_bank_transfer_beta_1) && (this.confirmIdBankTransferPayment = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Qo.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmIdBankTransferPayment"), this.confirmIdBankTransferSetup = A((function() {
                        for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return Qi.apply(void 0, [o._controller, i()].concat(t))
                    }), void 0, "confirmIdBankTransferSetup")), t && (this.handleHosted3DS2Payment = P((function(e) {
                        return function(e, t) {
                            var n = ya(e, "handleHosted3DS2Setup [internal]");
                            return t.action.retrievePaymentIntent({
                                intentSecret: n,
                                hosted: !0
                            }).then(ko(t, sr.card, !1, !0))
                        }(e, o._controller)
                    })), this.handleHosted3DS2Setup = P((function(e) {
                        return function(e, t) {
                            var n = ba(e, "handleHosted3DS2Setup [internal]");
                            return t.action.retrieveSetupIntent({
                                intentSecret: n,
                                hosted: !0
                            }).then(Ui(t, sr.card, !1, !0))
                        }(e, o._controller)
                    })))
                }
            }, {
                key: "_attachLegacyPaymentIntentMethods",
                value: function(e) {
                    var t = this,
                        n = Object(it.d)(this._betas, it.a.payment_intent_beta_1) || Object(it.d)(this._betas, it.a.payment_intent_beta_2),
                        r = function() {
                            return t._mids()
                        },
                        a = A((function() {
                            for (var e = arguments.length, n = new Array(e), a = 0; a < e; a++) n[a] = arguments[a];
                            return Ni.apply(void 0, [!0, t._controller, r()].concat(n))
                        }), void 0, "confirmPaymentIntent"),
                        o = A((function() {
                            for (var e = arguments.length, n = new Array(e), a = 0; a < e; a++) n[a] = arguments[a];
                            return Ni.apply(void 0, [!1, t._controller, r()].concat(n))
                        }), void 0, "confirmPaymentIntent"),
                        i = Object(Ft.a)(Ri, Mc("handleCardPayment")),
                        c = A((function() {
                            for (var e = arguments.length, a = new Array(e), o = 0; o < e; o++) a[o] = arguments[o];
                            return i.apply(void 0, [!0, t._controller, r(), n].concat(a))
                        }), void 0, "handleCardPayment"),
                        s = A((function() {
                            for (var e = arguments.length, a = new Array(e), o = 0; o < e; o++) a[o] = arguments[o];
                            return i.apply(void 0, [!1, t._controller, r(), n].concat(a))
                        }), void 0, "handleCardPayment"),
                        u = Object(Ft.a)(oc, Mc("handleCardSetup")),
                        l = A((function() {
                            for (var e = arguments.length, n = new Array(e), a = 0; a < e; a++) n[a] = arguments[a];
                            return u.apply(void 0, [t._controller, r()].concat(n))
                        }), void 0, "handleCardSetup"),
                        p = A((function() {
                            for (var e = arguments.length, n = new Array(e), a = 0; a < e; a++) n[a] = arguments[a];
                            return cc.apply(void 0, [t._controller, r()].concat(n))
                        }), void 0, "confirmSetupIntent"),
                        d = A((function() {
                            for (var e = arguments.length, a = new Array(e), o = 0; o < e; o++) a[o] = arguments[o];
                            return xi.apply(void 0, [t._controller, r(), n].concat(a))
                        }), void 0, "handleSepaDebitPayment"),
                        f = A((function() {
                            for (var e = arguments.length, n = new Array(e), a = 0; a < e; a++) n[a] = arguments[a];
                            return ic.apply(void 0, [t._controller, r()].concat(n))
                        }), void 0, "handleSepaDebitSetup"),
                        m = A((function() {
                            for (var e = arguments.length, a = new Array(e), o = 0; o < e; o++) a[o] = arguments[o];
                            return Mi.apply(void 0, [!0, t._controller, r(), n].concat(a))
                        }), void 0, "handleIdealPayment"),
                        _ = A((function() {
                            for (var e = arguments.length, a = new Array(e), o = 0; o < e; o++) a[o] = arguments[o];
                            return Mi.apply(void 0, [!1, t._controller, r(), n].concat(a))
                        }), void 0, "handleIdealPayment"),
                        h = A((function() {
                            for (var e = arguments.length, a = new Array(e), o = 0; o < e; o++) a[o] = arguments[o];
                            return Li.apply(void 0, [t._controller, r(), n].concat(a))
                        }), void 0, "handleFpxPayment");
                    this.handleCardPayment = s, this.confirmPaymentIntent = o, this.handleCardSetup = l, this.confirmSetupIntent = p, this.fulfillPaymentIntent = Lc("fulfillPaymentIntent"), this.handleSepaDebitPayment = Lc("handleSepaDebitPayment"), this.handleSepaDebitSetup = Lc("handleSepaDebitSetup"), this.handleIdealPayment = Lc("handleIdealPayment"), this.handleFpxPayment = Lc("handleFpxPayment"), Object(it.d)(this._betas, it.a.payment_intent_beta_1) ? this.fulfillPaymentIntent = c : (Object(it.d)(this._betas, it.a.payment_intent_beta_3) || Object(it.d)(this._betas, it.a.payment_intent_beta_2)) && (this.handleCardPayment = c), Object(it.d)(this._betas, it.a.payment_intent_beta_3) && (this.confirmPaymentIntent = a, this.handleIdealPayment = m, this.handleSepaDebitPayment = d), Object(it.d)(this._betas, it.a.fpx_bank_beta_1) && (this.handleFpxPayment = h), Object(it.d)(this._betas, it.a.ideal_pm_beta_1) && (this.handleIdealPayment = _), Object(it.d)(this._betas, it.a.sepa_pm_beta_1) && (this.handleSepaDebitPayment = d, this.handleSepaDebitSetup = f)
                }
            }, {
                key: "_attachPrivateMethodsForCheckout",
                value: function(e) {
                    var t = this;
                    e && (this.sendInteractionEvent = Ke, this.tryNextAction = S((function(e, n) {
                        var r = Object(l.E)(vr, e, "Payment Intent").value,
                            o = Object.keys(sr).map((function(e) {
                                return sr[e]
                            })),
                            i = Object(l.E)(l.q.apply(void 0, Object(a.a)(o)), n, "Source type").value;
                        return "payment_intent" === r.object ? wo(t._controller, r, i, "auto", !1) : Fi(t._controller, r, i, "auto", !1)
                    })))
                }
            }, {
                key: "_attachCheckoutMethods",
                value: function(e) {
                    var t = this,
                        n = function() {
                            return t._mids()
                        },
                        r = e.reduce((function(e, t) {
                            var n = Object(we.a)(hc.a, (function(e) {
                                return e === t
                            }));
                            return n ? [].concat(Object(a.a)(e), [n]) : e
                        }), []);
                    this.redirectToCheckout = function(e) {
                        return Object(yc.a)(t._controller, r, n, t._locale, e)
                    }
                }
            }, {
                key: "_attachPrivateMethodsForConsumer",
                value: function(e) {
                    var t = this;
                    e && (this.__createConsumerPaymentDetails = S((function(e, n) {
                        var r, a = {};
                        if (!n.email) return u.a.reject(new O.a("You must pass email"));
                        if (!e) return u.a.reject(new O.a("You must pass a clientSecret"));
                        if (n.cardElement) {
                            if (!n.billing_details || !n.billing_details.country_code) return u.a.reject(new O.a("You must pass in billing_details.country_code if you are using the Card Element"));
                            var o = or(n.cardElement);
                            if (!o) return u.a.reject(new O.a("Card Element is invalid"));
                            var i = o._implementation._frame.id,
                                c = o._componentName;
                            if ("card" !== c && "cardNumber" !== c) return u.a.reject(new O.a("Please provide a Card Element to __createConsumerPaymentDetails"));
                            a = {
                                frameId: i,
                                elementName: c,
                                billingDetails: n.billing_details
                            }
                        } else if (n.elements) {
                            var s;
                            a = {
                                elementsId: null == n || null === (s = n.elements) || void 0 === s ? void 0 : s._id,
                                billingDetails: (null == n ? void 0 : n.billing_details) || {}
                            }
                        }
                        return a.elementsId ? t._controller.action.createConsumerPaymentDetails({
                            email: n.email,
                            clientSecret: e,
                            billingDetails: a.billingDetails,
                            isDefault: !!n.is_default,
                            elementsId: a.elementsId
                        }) : a.frameId && a.elementName && (null == n || null === (r = n.billing_details) || void 0 === r ? void 0 : r.country_code) ? t._controller.action.createConsumerPaymentDetails({
                            email: n.email,
                            clientSecret: e,
                            billingDetails: a.billingDetails,
                            isDefault: !!n.is_default,
                            frameId: a.frameId,
                            elementName: a.elementName
                        }) : u.a.reject(new O.a("Please provide either an Elements or Card Element creation parameters to __createConsumerPaymentDetails."))
                    }), void 0, "__createConsumerPaymentDetails"))
                }
            }, {
                key: "_attachGetters",
                value: function() {
                    var e = this,
                        t = new ua((function(t) {
                            e._registerWrapper({
                                name: t,
                                version: null
                            })
                        }));
                    ["elements", "createToken", "createSource", "createPaymentMethod"].forEach((function(n) {
                        if (e.hasOwnProperty(n)) {
                            var r = e[n],
                                a = function() {
                                    t.called(n);
                                    for (var e = arguments.length, a = new Array(e), o = 0; o < e; o++) a[o] = arguments[o];
                                    return r.apply(this, a)
                                };
                            Object.defineProperty(e, n, {
                                enumerable: !0,
                                get: function() {
                                    return t.got(n), a
                                }
                            })
                        }
                    }))
                }
            }, {
                key: "_attachIssuingCardMethods",
                value: function(e) {
                    var t = this;
                    this.retrieveIssuingCard = Dc("retrieveIssuingCard"), this.createEphemeralKeyNonce = Dc("createEphemeralKeyNonce"), Object(it.d)(this._betas, it.a.issuing_elements_1) ? this.retrieveIssuingCard = S((function(e, n) {
                        return function(e, t, n) {
                            var r = lc(e, "retrieveIssuingCard"),
                                a = dc(t, "retrieveIssuingCard");
                            return n.action.retrieveIssuingCardWithoutNonce({
                                cardId: r,
                                ephemeralKeySecret: a
                            }).then(Bn)
                        }(e, n, t._controller)
                    })) : Object(it.d)(this._betas, it.a.issuing_elements_2) && (this.retrieveIssuingCard = S((function(e, n) {
                        return function(e, t, n) {
                            var r = lc(e, "retrieveIssuingCard"),
                                a = mc(t);
                            return n.action.retrieveIssuingCard({
                                cardId: r,
                                ephemeralKeySecret: a.ephemeralKeySecret,
                                publicNonce: a.publicNonce
                            }).then(Bn)
                        }(e, n, t._controller)
                    })), this.createEphemeralKeyNonce = P((function(e) {
                        return _c(e, t._controller)
                    })))
                }
            }, {
                key: "_attachIdentityMethods",
                value: function(e) {
                    var t = this;
                    this.verifyIdentity = P((function(e) {
                        return sc(e, t._controller)
                    }))
                }
            }, {
                key: "_attachControllerGetter",
                value: function(t, n, a, o) {
                    var i, c = this,
                        s = [],
                        u = document.readyState;
                    Object.defineProperties(this, {
                        _registerWrapper: {
                            enumerable: !1,
                            configurable: !0,
                            writable: !1,
                            value: function(e) {
                                s.push(e)
                            }
                        },
                        _controller: {
                            enumerable: !0,
                            configurable: !0,
                            get: function() {
                                return function() {
                                    if (i) return i;
                                    var l = document.readyState;
                                    return i = new nt(Object(r.a)({
                                        apiKey: c._apiKey,
                                        apiVersion: c._injectBetaHeader(t),
                                        __privateApiUrl: n,
                                        stripeAccount: a,
                                        betas: c._betas,
                                        stripeJsId: e.stripeJsId,
                                        stripeJsLoadTimestamp: Sc,
                                        stripeCreateTimestamp: o,
                                        onFirstLoad: function() {
                                            try {
                                                Rc(i, u, l)
                                            } catch (e) {}
                                        },
                                        listenerRegistry: c._listenerRegistry
                                    }, c._locale ? {
                                        locale: c._locale
                                    } : {})), Object.defineProperties(c, {
                                        _registerWrapper: {
                                            value: Bc,
                                            writable: !1,
                                            enumerable: !1,
                                            configurable: !0
                                        },
                                        _controller: {
                                            value: i,
                                            writable: !0,
                                            enumerable: !0,
                                            configurable: !0
                                        }
                                    }), s.forEach((function(e) {
                                        return c._registerWrapper(e)
                                    })), s.splice(0), i
                                }()
                            }
                        }
                    })
                }
            }, {
                key: "_attachLinkedAccounts",
                value: function(e) {
                    var t = this;
                    this.linkAccounts = function() {
                        throw new O.a("You cannot call `stripe.linkAccounts` without supplying a LinkedAccounts beta flag when initializing Stripe.js.")
                    }, Object(it.d)(e, it.a.linked_accounts_beta_1) && (this.linkAccounts = S((function(e, n) {
                        return function(e, t, n) {
                            return Br(Object(r.a)({
                                linkAccountSessionCreatorClientSecret: e,
                                linkAccountSessionCreatorType: "link_account_session",
                                controller: t
                            }, n))
                        }(e, t._controller, n)
                    })))
                }
            }, {
                key: "_attachAppInfo",
                value: function() {
                    var e = this;
                    this.registerAppInfo = w((function(t) {
                        var n = Object(l.F)(ea, t, "WrapperLibrary");
                        "error" !== n.type ? e._controller.registerAppInfo(n.value) : e._controller.warn("Failed to register your library: ".concat(n.error.message))
                    }))
                }
            }, {
                key: "_injectBetaHeader",
                value: function(e) {
                    if (Object(it.d)(this._betas, it.a.us_bank_account_beta_1) || Object(it.d)(this._betas, it.a.us_bank_account_beta_2)) {
                        var t = Object(it.d)(this._betas, it.a.us_bank_account_beta_1) ? "v1" : "v2";
                        return e ? -1 !== e.indexOf("us_bank_account_beta") ? e : "".concat(e, "; us_bank_account_beta=").concat(t) : "2020-08-27; us_bank_account_beta=".concat(t)
                    }
                    return e
                }
            }, {
                key: "_ensureHTTPS",
                value: function() {
                    var e = window.location.protocol,
                        t = -1 !== ["localhost", "127.0.0.1", "0.0.0.0"].indexOf(window.location.hostname),
                        n = !0 === window.isSecureContext && !t || -1 !== ["https:", "file:", "ionic:", "httpsionic:", "chrome-extension:", "moz-extension:"].indexOf(e),
                        r = this._keyMode === d.a.live,
                        a = "Live Stripe.js integrations must use HTTPS. For more information: https://stripe.com/docs/security/guide#tls";
                    if (!n) {
                        if (r && !t) throw this._controller.report("user_error.non_https_error", {
                            protocol: e
                        }), new O.a(a);
                        !r || t ? window.console && console.warn("You may test your Stripe.js integration over HTTP. However, live Stripe.js integrations must use HTTPS.") : window.console && console.warn(a)
                    }
                }
            }, {
                key: "_ensureStripeHosted",
                value: function(e) {
                    if (!e) throw this._controller.report("user_error.self_hosted"), new O.a("Stripe.js must be loaded from js.stripe.com. For more information https://stripe.com/docs/stripe-js/reference#including-stripejs")
                }
            }, {
                key: "_mids",
                value: function() {
                    return e._ec ? e._ec.ids() : null
                }
            }, {
                key: "_midsPromise",
                value: function() {
                    return e._ec ? e._ec.idsPromise() : u.a.resolve(this._mids())
                }
            }]), e
        }();
    qc.version = 3, qc.stripeJsId = h(), qc._ec = (Cc = new RegExp("".concat(document.location.protocol, "//").concat(document.location.host)), "https://checkout.stripe.com/".match(Cc) ? null : ze());
    var Bc = function(e) {
            var t = Object(l.F)(Qr, e, "StripeWrapperLibrary");
            if ("error" !== t.type) {
                var n = t.value,
                    r = n.name,
                    a = n.version,
                    o = n.startTime;
                this._controller.registerWrapper({
                    name: r,
                    version: a,
                    startTime: o
                })
            } else this._controller.report("register_wrapper.error", {
                error: t.error.message
            })
        },
        Fc = qc,
        Uc = function() {
            if (document.currentScript) {
                var e = Object(ot.d)(document.currentScript.src);
                return !e || Object(me.c)(e.origin)
            }
            return !0
        }(),
        Yc = function(e, t) {
            return new Fc(Object(r.a)({
                apiKey: e
            }, t && "object" == typeof t ? t : {}), Uc)
        };
    Yc.version = Fc.version, window.Stripe && 2 === window.Stripe.version && !window.Stripe.StripeV3 ? window.Stripe.StripeV3 = Yc : window.Stripe ? window.console && console.warn("It looks like Stripe.js was loaded more than one time. Please only load it once per page.") : window.Stripe = Yc;
    t.default = Yc
}]);