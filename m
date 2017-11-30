From: dave.hansen@intel.com (Dave Hansen)
Date: Thu, 30 Nov 2017 07:15:23 -0800
Subject: [Linux-kselftest-mirror] selftests: x86_64: kselftest
 mpx-mini-test_64 - no MPX support - failed - 3869 Aborted (core dumped)
In-Reply-To: <CA+G9fYsc5PPgduSJKQy7HkJUVHqXMUHW10K=BrU8UUe5970p+Q@mail.gmail.com>
References: <CA+G9fYvishojFT=nAJ-ejrOo9KfsDKFOa=3Nzjep0H4E88fPJg@mail.gmail.com>
 <20171124111141.GA14922@kroah.com> <20171124111242.GA25106@kroah.com>
 <CA+G9fYuco-vArAVrNhzPZiOza7LNboM7c6qrZJ_q=_fMsGHidQ@mail.gmail.com>
 <20171124114635.GB1916@kroah.com>
 <CA+G9fYsc5PPgduSJKQy7HkJUVHqXMUHW10K=BrU8UUe5970p+Q@mail.gmail.com>
Message-ID: <5e1acb60-3143-1d05-49e1-1c80ba978987@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171130151523.sYeP58pRN1ODjFe4AZqgySNvmiEQcbeI9mT2M-uxC3A@z>

On 11/29/2017 09:18 PM, Naresh Kamboju wrote:
> (For MPX to work, changes are required in the kernel, binutils and compiler.)
> (GCC with -fmpx:  * enables annotation of code with MPX instructions
> and prefixes)
> Do the kernel to be re-compiled with -fmpx ?

No, that test was specifically written not to require support in the
compiler or binutils.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
