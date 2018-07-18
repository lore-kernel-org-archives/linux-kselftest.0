From: dave.hansen at intel.com (Dave Hansen)
Date: Wed, 18 Jul 2018 08:27:08 -0700
Subject: [PATCH v14 04/22] selftests/vm: move arch-specific definitions to
 arch-specific header
In-Reply-To: <1531835365-32387-5-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
 <1531835365-32387-5-git-send-email-linuxram@us.ibm.com>
Message-ID: <cbe905d6-bff5-cbe0-831b-13c76334ff1a@intel.com>

On 07/17/2018 06:49 AM, Ram Pai wrote:
> In preparation for multi-arch support, move definitions which have
> arch-specific values to x86-specific header.

Acked-by: Dave Hansen <dave.hansen at intel.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
