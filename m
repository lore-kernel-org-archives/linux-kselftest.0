From: karim.yaghmour at opersys.com (Karim Yaghmour)
Date: Tue, 12 Mar 2019 08:15:18 -0700
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAMuHMdVw=b_oS70F1LhXV0b9fn_p6OuCo2RDUQC=49PdJVW7xA@mail.gmail.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com>
 <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
 <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
 <20190308140251.GC25768@kroah.com>
 <CAMuHMdUmnrJtu8bBeUgtiU6y_TLHM27z1WxpPia4dXMpApeijw@mail.gmail.com>
 <20190309071648.GE3882@kroah.com>
 <CAMuHMdUT+UGt9p2QhOXzAtCUmqy-a8YN-ceDa-0qANJE53pWBA@mail.gmail.com>
 <20190309121141.GA30173@kroah.com>
 <b7296377-9e0c-aed7-61f0-93d24d1ceddd@opersys.com>
 <CAMuHMdV8+XTyGf1ZJ+gMf=zQpzqh3-+b7wgi+gAmXQ6HpUAw3A@mail.gmail.com>
 <3e84e1ef-e266-e983-5874-6c26ac7f38b8@opersys.com>
 <CAMuHMdVw=b_oS70F1LhXV0b9fn_p6OuCo2RDUQC=49PdJVW7xA@mail.gmail.com>
Message-ID: <a034919f-d4ca-b8f2-b80b-5de3d4606b97@opersys.com>


Hi Geert,

On 3/11/19 4:03 AM, Geert Uytterhoeven wrote:
[ snip ]
> OK.
> 
> Now about the actual solution: what is your opinion on embedding e.g.
> a squashfs image in the kernel instead, which would be a more generic
> solution, not adding more ABI to /proc?

I'm not familiar enough with the intricacies of squashfs to have an 
educated opinion, but I hear that it's got its quirks (need for 
user-space tools, etc.) and possibly security issues. Also, I wonder 
whether it's a generalized solution that still kicks the ABI can down 
the road -- ultimately the kernel would still have a path/format/foo for 
making kheaders available in that squashfs image and that convention 
would become ABI. The only "benefit" being that said ABI wouldn't appear 
under /proc, and, tbh, I'm not sure that that's actually a benefit or is 
even idiomatic since kconfig.gz is already under /proc. To an extent, 
the precedent set by kconfig favors kheaders to also be available in the 
same location using a similar mechanism ... i.e. bonus points for 
consistency.

But that's my hand-wavy gut-reaction response to your question. I'm sure 
others on this thread have far more informed opinions about the 
specifics than I could have. My priority was to clarify the basis for 
the need being addressed.

Cheers,

-- 
Karim Yaghmour
CEO - Opersys inc. / www.opersys.com
http://twitter.com/karimyaghmour
