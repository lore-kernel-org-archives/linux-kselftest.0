From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Fri, 17 Nov 2017 16:17:56 +0000 (UTC)
Subject: [Linux-kselftest-mirror] [RFC PATCH for 4.15 23/24] membarrier:
 selftest: Test private expedited sync core cmd
In-Reply-To: <b529c741-dec1-0d02-ad4f-1059203b7b7c@osg.samsung.com>
References: <20171114200414.2188-1-mathieu.desnoyers@efficios.com>
 <20171114200414.2188-24-mathieu.desnoyers@efficios.com>
 <b529c741-dec1-0d02-ad4f-1059203b7b7c@osg.samsung.com>
Message-ID: <182547799.17141.1510935476057.JavaMail.zimbra@efficios.com>

----- On Nov 17, 2017, at 10:09 AM, Shuah Khan shuahkh at osg.samsung.com wrote:
> 
> Looks good to me. I am assuming this patch goes in with the rest of the
> series. For this patch:
> 
> Acked-by: Shuah Khan <shuahkh at osg.samsung.com>

Thanks for the Acked-by. I'll add it to the patch changelog.
The sync_core membarrier patches are now queued for 4.16 however.

Thanks,

Mathieu

> 
> thanks,
> -- Shuah

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
