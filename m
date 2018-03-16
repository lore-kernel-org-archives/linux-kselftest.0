From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:30:10 -0700
Subject: [PATCH v12 17/22] selftests/vm: associate key on a mapped page
 and detect access violation
In-Reply-To: <1519264541-7621-18-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-18-git-send-email-linuxram@us.ibm.com>
Message-ID: <bec09b77-ca65-5724-1191-a21f4cfa7cd3@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316223010.cwrAk0pJQAFgwI1MULjpgTeCwLnd70v5h0Qfh75celk@z>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> detect access-violation on a page to which access-disabled
> key is associated much after the page is mapped.

Looks fine to me.  Did this actually find a bug for you?

Acked-by: Dave Hansen <dave.hansen at intel.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
