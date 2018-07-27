From: jmattson at google.com (Jim Mattson)
Date: Fri, 27 Jul 2018 14:30:24 -0700
Subject: [PATCH v14 8/9] KVM: x86: virtualize cpuid faulting
In-Reply-To: <CALCETrVzH+9cJtxTHj300jDWx7S1bLxYCGX==7zHish9J5aFAQ@mail.gmail.com>
References: <20170208080917.24320-1-khuey@kylehuey.com>
 <20170208080917.24320-9-khuey@kylehuey.com>
 <CALCETrVS8ch-1harGv2NUy83ZLna8Vde1zNLxPTPaxuMexQMjw@mail.gmail.com>
 <CALMp9eSyJep6UPxeiZRWPrdzwvvcqJEbPPZ6C61EeHsvdyhMLg@mail.gmail.com>
 <6F48D384-B29C-41B4-83F1-B02FC2480205@amacapital.net>
 <CALMp9eQDWWAgmwnzZ0iTa2w+7-d_MjyOByOdfN0MjiHzaQWyEw@mail.gmail.com>
 <CALCETrVzH+9cJtxTHj300jDWx7S1bLxYCGX==7zHish9J5aFAQ@mail.gmail.com>
Message-ID: <CALMp9eQ3VOOdQpZ2=rqB1W3=RnyZXDxrqXgADsDZ0eSH_8r9tQ@mail.gmail.com>

On Fri, Jul 27, 2018 at 2:05 PM, Andy Lutomirski <luto at kernel.org> wrote:
> Does KVM *have* a concept of "maximum non-turbo frequency" of the
> guest that it would make sense to expose here?  If so, presumably the
> right solution is to expose it.

KVM has the concept of a guest's invariant TSC frequency. The Maximum
Non-Turbo Ratio is just some fraction of that. Sadly, the fraction is
100 MHz, 133.33MHz, or the "scalable bus frequency" from some other
MSR, depending on microarchitecture.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
