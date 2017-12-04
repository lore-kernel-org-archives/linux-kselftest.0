From: elfring at users.sourceforge.net (SF Markus Elfring)
Date: Mon, 4 Dec 2017 10:00:54 +0100
Subject: [Linux-kselftest-mirror] Difficulties for compilation without
	extra optimisation
In-Reply-To: <20171203162256.4ea0750d@vmware.local.home>
References: <7f072f78-eef4-6d87-d233-cee71dac5a32@users.sourceforge.net>
 <a2ac6d05-fdd6-82bb-075e-b7eb81b516fe@users.sourceforge.net>
 <1512314250.3673.6.camel@primarydata.com>
 <20171203162256.4ea0750d@vmware.local.home>
Message-ID: <c834d3ed-3da3-e2b5-7f4b-9e36bfcb388b@users.sourceforge.net>

> Why would you compile the kernel without optimization?

Can another reason be occasionally still relevant?

Will the compilation be a bit quicker when extra data processing
could be omitted?


> There's many places in the kernel that WILL NOT BUILD without optimization.

Would you like to keep the software situation in this way?


> In fact, we do a lot of tricks to make sure that things work the way
> we expect it to, because we add broken code that only gets compiled out
> when gcc optimizes the code the way we expect it to be,
> and the kernel build will break otherwise.

* Can this goal be also achieved without the addition of “broken code”?

* How do you think about to improve the error handling there?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
