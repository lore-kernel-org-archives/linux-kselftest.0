From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 20 Jun 2018 08:20:22 -0700
Subject: [PATCH v13 22/24] selftests/vm: testcases must restore
 pkey-permissions
In-Reply-To: <1528937115-10132-23-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-23-git-send-email-linuxram@us.ibm.com>
Message-ID: <e4e63ab2-2830-9ade-3e5f-6d0f61efbcb6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180620152022.dy2OlD0dt2Dv7rBf3LONVHyodIh6RrtCmxVcB5eJIQo@z>

On 06/13/2018 05:45 PM, Ram Pai wrote:
> Generally the signal handler restores the state of the pkey register
> before returning. However there are times when the read/write operation
> can legitamely fail without invoking the signal handler.  Eg: A
> sys_read() operaton to a write-protected page should be disallowed.  In
> such a case the state of the pkey register is not restored to its
> original state.  The test case is responsible for restoring the key
> register state to its original value.

Seems fragile.  Can't we just do this in common code?  We could just
loop through and restore the default permissions.  That seems much more
resistant to a bad test case.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
