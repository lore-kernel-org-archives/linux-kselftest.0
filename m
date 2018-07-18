From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 18 Jul 2018 08:45:26 -0700
Subject: [PATCH v14 10/22] selftests/vm: fix alloc_random_pkey() to make
 it really random
In-Reply-To: <1531835365-32387-11-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
 <1531835365-32387-11-git-send-email-linuxram@us.ibm.com>
Message-ID: <b33e0850-f3ec-86b8-69e8-9e6afb289058@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180718154526.UKJbk8VZ_qxMIsqVEtdz7L60WJ7VnrwowygsgJvyoLs@z>

On 07/17/2018 06:49 AM, Ram Pai wrote:
> alloc_random_pkey() was allocating the same pkey every time.
> Not all pkeys were geting tested. fixed it.

This fixes a real issue but also unnecessarily munges whitespace.  If
you rev these again, please fix the munging.  Otherwise:

Acked-by: Dave Hansen <dave.hansen at intel.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
