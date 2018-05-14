From: mingo.kernel.org@gmail.com (Ingo Molnar)
Date: Mon, 14 May 2018 11:30:15 +0200
Subject: [PATCH 2/2] tools/testing/selftests/x86: fix error: conflicting
 types for 'pkey_get|pkey_set'
In-Reply-To: <125eb810-1d48-394d-9665-40da64326fbb@intel.com>
References: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
 <1525770870-19067-2-git-send-email-lizhijian@cn.fujitsu.com>
 <125eb810-1d48-394d-9665-40da64326fbb@intel.com>
Message-ID: <20180514093015.GA27428@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180514093015.UmSfGQGW_vjZTeZBWeO1fVRMOhui0Q5qgZamnMy0tdI@z>


* Dave Hansen <dave.hansen@intel.com> wrote:

> On 05/08/2018 02:14 AM, Li Zhijian wrote:
> > -u32 pkey_get(int pkey, unsigned long flags)
> > +u32 _pkey_get(int pkey, unsigned long flags)
> >  {
> >  	u32 mask = (PKEY_DISABLE_ACCESS|PKEY_DISABLE_WRITE);
> >  	u32 pkru = __rdpkru();
> > @@ -422,7 +426,7 @@ u32 pkey_get(int pkey, unsigned long flags)
> >  	return masked_pkru;
> >  }
> 
> I'm not a huge fan of random underscores for undocumented reasons.  But,
> oh well.
> 
> Acked-by: Dave Hansen <dave.hansen at intel.com>

So I saw these too late, fixed them already, and did it slightly differently:
I used a hw_*() prefix which I think is cleaner and more obvious than underscores.

Thanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
