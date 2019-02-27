From: yu-cheng.yu at intel.com (Yu-cheng Yu)
Date: Wed, 27 Feb 2019 14:19:27 -0800
Subject: [PATCH] x86/selftests/xsave: Introduce XSAVE tests
In-Reply-To: <67fa7d2a-31e2-efdf-7ffe-39c3e2a9b4a2@intel.com>
References: <20190227212422.11845-1-yu-cheng.yu@intel.com>
 <67fa7d2a-31e2-efdf-7ffe-39c3e2a9b4a2@intel.com>
Message-ID: <6be796c64cb4ba21ef879facc65f5b3b476cacfd.camel@intel.com>

On Wed, 2019-02-27 at 13:45 -0800, Dave Hansen wrote:
> I wonder, though, if you can spend a little more time on these.  They
> look a little "raw".  They're virtually free of comments and there is no
> explanation of what the tests do or why they do them.  I honestly forget
> things like what XSAVE has to do with fork() failing, for instance.

I will add comments of what problems each test detects.

> I'd question why we need 5 different .c files.  It also seems like
> things like set_ymm() could be trivially factored into a .h rather than
> making 5 copies of them.

Each C file contains only one single test and can be built with one command,
e.g. "gcc xsave_check_exec.c", or as part of the whole selftest.

I am hoping that, should any test fail, one can easily modify the test to find
out why.

Yes, I will move set_ymm() to a header file.

Yu-cheng
