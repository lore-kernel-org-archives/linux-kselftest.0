From: dave.hansen at intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:31:28 -0700
Subject: [PATCH v12 19/22] selftests/vm: detect write violation on a
 mapped access-denied-key page
In-Reply-To: <1519264541-7621-20-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-20-git-send-email-linuxram@us.ibm.com>
Message-ID: <f0468b51-6c2a-0317-2c5e-d48d8a12c374@intel.com>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> detect write-violation on a page to which access-disabled
> key is associated much after the page is mapped.

Acked-by: Dave Hansen <dave.hansen at intel.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
