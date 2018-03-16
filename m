From: dave.hansen at intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:32:38 -0700
Subject: [PATCH v12 20/22] selftests/vm: testcases must restore
 pkey-permissions
In-Reply-To: <1519264541-7621-21-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-21-git-send-email-linuxram@us.ibm.com>
Message-ID: <6f45e32f-a18c-9b33-efaa-aab3c095720f@intel.com>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> Generally the signal handler restores the state of the pkey register
> before returning. However there are times when the read/write operation
> can legitamely fail without invoking the signal handler.  Eg: A
> sys_read() operaton to a write-protected page should be disallowed.  In
> such a case the state of the pkey register is not restored to its
> original state.  The test case is responsible for restoring the key
> register state to its original value.

Oh, that's a good point.

Could we just do this in a common place, though?  Like reset the
register after each test?  Seems more foolproof.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
