From: dave.hansen at intel.com (Dave Hansen)
Date: Wed, 27 Feb 2019 13:45:15 -0800
Subject: [PATCH] x86/selftests/xsave: Introduce XSAVE tests
In-Reply-To: <20190227212422.11845-1-yu-cheng.yu@intel.com>
References: <20190227212422.11845-1-yu-cheng.yu@intel.com>
Message-ID: <67fa7d2a-31e2-efdf-7ffe-39c3e2a9b4a2@intel.com>

On 2/27/19 1:24 PM, Yu-cheng Yu wrote:
> In the past there were some issues resulting from additions to
> XSAVE/XSAVES.  Introduce a few tests to help detect issues early.

Thanks for doing this!

I wonder, though, if you can spend a little more time on these.  They
look a little "raw".  They're virtually free of comments and there is no
explanation of what the tests do or why they do them.  I honestly forget
things like what XSAVE has to do with fork() failing, for instance.

I'd question why we need 5 different .c files.  It also seems like
things like set_ymm() could be trivially factored into a .h rather than
making 5 copies of them.

selftests don't need to be perfect, but I think these could use a _bit_
more polish before merging.
