From: shuah@kernel.org (Shuah Khan)
Date: Tue, 8 May 2018 11:35:45 -0600
Subject: [PATCH 1/2] tools/testing/selftests/x86: fix warning:
 "SEGV_PKUERR|SEGV_BNDERR" redefined
In-Reply-To: <8f91739f-5d63-e6c9-7bf9-4c970237bcf8@intel.com>
References: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
 <8f91739f-5d63-e6c9-7bf9-4c970237bcf8@intel.com>
Message-ID: <486b5b09-d45f-5d79-cb8a-9ea3537ae048@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508173545.HvBWjk3yAhoobBZvx2jsS2sWo5loC4lDuPRzwNjwGcw@z>

On 05/08/2018 10:25 AM, Dave Hansen wrote:
> On 05/08/2018 02:14 AM, Li Zhijian wrote:
>> SEGV_PKUERR and SEGV_BNDERR are defined since glibc-2.27
> 
> 
> Acked-by: Dave Hansen <dave.hansen at intel.com>
> 

Thanks. Queuing this up for 4.17-rc5

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
