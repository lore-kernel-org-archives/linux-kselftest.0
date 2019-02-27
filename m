From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 27 Feb 2019 14:30:47 -0800
Subject: [PATCH] x86/selftests/xsave: Introduce XSAVE tests
In-Reply-To: <6be796c64cb4ba21ef879facc65f5b3b476cacfd.camel@intel.com>
References: <20190227212422.11845-1-yu-cheng.yu@intel.com>
 <67fa7d2a-31e2-efdf-7ffe-39c3e2a9b4a2@intel.com>
 <6be796c64cb4ba21ef879facc65f5b3b476cacfd.camel@intel.com>
Message-ID: <0b58fa72-73f1-b3d8-73e9-254f42f0fa08@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190227223047._D4I0nRtV6msCfA1u9xYq5SalOnV6Y2LS4sNe5iICGQ@z>

On 2/27/19 2:19 PM, Yu-cheng Yu wrote:
> I am hoping that, should any test fail, one can easily modify the test to find
> out why.

Yeah, but that's what error messages are for.  If we did this for
protection_keys, we would have about 30 .c files. :)
