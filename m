From: dave.hansen at intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:30:50 -0700
Subject: [PATCH v12 18/22] selftests/vm: associate key on a mapped page
 and detect write violation
In-Reply-To: <1519264541-7621-19-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-19-git-send-email-linuxram@us.ibm.com>
Message-ID: <cf9ccf32-724c-e25c-4226-3c9c670bc4aa@intel.com>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> detect write-violation on a page to which write-disabled
> key is associated much after the page is mapped.

The more tests the merrier.

Acked-by: Dave Hansen <dave.hansen at intel.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
