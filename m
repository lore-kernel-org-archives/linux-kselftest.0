From: elfring at users.sourceforge.net (SF Markus Elfring)
Date: Sun, 3 Dec 2017 22:56:51 +0100
Subject: [Linux-kselftest-mirror] Difficulties for compilation without
	extra optimisation
In-Reply-To: <20171203162256.4ea0750d@vmware.local.home>
References: <7f072f78-eef4-6d87-d233-cee71dac5a32@users.sourceforge.net>
 <a2ac6d05-fdd6-82bb-075e-b7eb81b516fe@users.sourceforge.net>
 <1512314250.3673.6.camel@primarydata.com>
 <20171203162256.4ea0750d@vmware.local.home>
Message-ID: <bd57d7d5-c8f5-0bc9-c96f-37550557dca3@users.sourceforge.net>

> Why would you compile the kernel without optimization?

I would like to see how big an effect finally is in such a build configuration
after specific source code adjustments.


> There's many places in the kernel that WILL NOT BUILD without optimization.

I did not really know this detail so far.

I noticed that the optimised build variants worked during my test comparisons.


> In fact, we do a lot of tricks to make sure that things work the way
> we expect it to, because we add broken code that only gets compiled out
> when gcc optimizes the code the way we expect it to be,
> and the kernel build will break otherwise.

Thanks for your information.

Can the software areas distinguished where such special handling matters?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
