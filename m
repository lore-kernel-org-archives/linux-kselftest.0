From: dave.hansen@intel.com (Dave Hansen)
Date: Tue, 8 May 2018 09:25:53 -0700
Subject: [PATCH 1/2] tools/testing/selftests/x86: fix warning:
 "SEGV_PKUERR|SEGV_BNDERR" redefined
In-Reply-To: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <8f91739f-5d63-e6c9-7bf9-4c970237bcf8@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508162553.bU2a71Epe9Z1Y4zkmDy76GZeMYKLRu5KDHDYjHLzqwc@z>

On 05/08/2018 02:14 AM, Li Zhijian wrote:
> SEGV_PKUERR and SEGV_BNDERR are defined since glibc-2.27


Acked-by: Dave Hansen <dave.hansen at intel.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
