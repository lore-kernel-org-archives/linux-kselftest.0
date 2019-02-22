From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 22 Feb 2019 14:54:51 -0800
Subject: [PATCH v10 00/12] arm64: untag user pointers passed to the kernel
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
Message-ID: <2ad5f897-25c0-90cf-f54f-827876873a0a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190222225451.LjP2GBGTApsyJTpFSn8ofY2doRfbjNYCfTJMERN0Hnk@z>

On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> The following testing approaches has been taken to find potential issues
> with user pointer untagging:
> 
> 1. Static testing (with sparse [3] and separately with a custom static
>    analyzer based on Clang) to track casts of __user pointers to integer
>    types to find places where untagging needs to be done.

First of all, it's really cool that you took this approach.  Sounds like
there was a lot of systematic work to fix up the sites in the existing
codebase.

But, isn't this a _bit_ fragile going forward?  Folks can't just "make
sparse" to find issues with missing untags.  This seems like something
where we would ideally add an __tagged annotation (or something) to the
source tree and then have sparse rules that can look for missed untags.
