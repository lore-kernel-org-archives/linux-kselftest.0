From: mingo at kernel.org (Ingo Molnar)
Date: Mon, 14 May 2018 11:31:57 +0200
Subject: [PATCH 1/2] tools/testing/selftests/x86: fix warning:
 "SEGV_PKUERR|SEGV_BNDERR" redefined
In-Reply-To: <486b5b09-d45f-5d79-cb8a-9ea3537ae048@kernel.org>
References: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
 <8f91739f-5d63-e6c9-7bf9-4c970237bcf8@intel.com>
 <486b5b09-d45f-5d79-cb8a-9ea3537ae048@kernel.org>
Message-ID: <20180514093157.GB27428@gmail.com>


* Shuah Khan <shuah at kernel.org> wrote:

> On 05/08/2018 10:25 AM, Dave Hansen wrote:
> > On 05/08/2018 02:14 AM, Li Zhijian wrote:
> >> SEGV_PKUERR and SEGV_BNDERR are defined since glibc-2.27
> > 
> > 
> > Acked-by: Dave Hansen <dave.hansen at intel.com>
> > 
> 
> Thanks. Queuing this up for 4.17-rc5

Please drop these patches, I have fixed them slightly differently and there are 
dependencies with followup patches.

Tanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
