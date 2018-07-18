From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 18 Jul 2018 08:32:10 -0700
Subject: [PATCH v14 06/22] selftests/vm: typecast the pkey register
In-Reply-To: <1531835365-32387-7-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
 <1531835365-32387-7-git-send-email-linuxram@us.ibm.com>
Message-ID: <8c468c61-615a-dd0d-2b73-d3218f38e3e4@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180718153210.ynMRwCPw2hmur5h8l9Sj50KFvOwtxbefeJO91Sgoq2o@z>

On 07/17/2018 06:49 AM, Ram Pai wrote:
> This is in preparation to accomadate a differing size register
> across architectures.

This is pretty fugly, and reading it again, I wonder whether we should
have just made it 64-bit, at least in all the printk's.  Or even

	prink("pk reg: %*llx\n", PKEY_FMT_LEN, pkey_reg);

But, I don't _really_ care in the end.

Acked-by: Dave Hansen <dave.hansen at intel.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
