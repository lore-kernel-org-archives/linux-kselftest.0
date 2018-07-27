From: luto at kernel.org (Andy Lutomirski)
Date: Fri, 27 Jul 2018 14:05:40 -0700
Subject: [PATCH v14 8/9] KVM: x86: virtualize cpuid faulting
In-Reply-To: <CALMp9eQDWWAgmwnzZ0iTa2w+7-d_MjyOByOdfN0MjiHzaQWyEw@mail.gmail.com>
References: <20170208080917.24320-1-khuey@kylehuey.com>
 <20170208080917.24320-9-khuey@kylehuey.com>
 <CALCETrVS8ch-1harGv2NUy83ZLna8Vde1zNLxPTPaxuMexQMjw@mail.gmail.com>
 <CALMp9eSyJep6UPxeiZRWPrdzwvvcqJEbPPZ6C61EeHsvdyhMLg@mail.gmail.com>
 <6F48D384-B29C-41B4-83F1-B02FC2480205@amacapital.net>
 <CALMp9eQDWWAgmwnzZ0iTa2w+7-d_MjyOByOdfN0MjiHzaQWyEw@mail.gmail.com>
Message-ID: <CALCETrVzH+9cJtxTHj300jDWx7S1bLxYCGX==7zHish9J5aFAQ@mail.gmail.com>

On Fri, Jul 27, 2018 at 2:03 PM, Jim Mattson <jmattson at google.com> wrote:
> On Fri, Jul 27, 2018 at 1:46 PM, Andy Lutomirski <luto at amacapital.net> wrote:
>>> On Jul 27, 2018, at 1:28 PM, Jim Mattson <jmattson at google.com> wrote:
>>> Initializing this bit to zero helps with migration, but then if the
>>> CPUID faulting bits in both MSRs are set, userspace has to take pains
>>> to ensure that MSR_PLATFORM_INFO is restored first, or the
>>> MSR_MISC_FEATURES_ENABLES value will be rejected.
>>
>> The code could drop the constraint and just let the entry possibly fail if the MSRs are set wrong
>
> That would be an improvement, I think.

I personally don't know enough about the QEMU, kvmtool, etc
architecture to know whether this would be a good idea.

>
>>> I'm also concerned about the 0 in the "Maximum Non-Turbo Ratio" field
>>> feeding into someone's calculated TSC frequency.
>>
>> Hmm. I don’t have a good answer to that. Are there any real CPUs that have this MSR but don’t have that field?
>
> No. The reason I bring this up is that a customer has code that
> expects to be able to derive the TSC frequency from this MSR (per
> Intel's instructions in SDM volume 3, section 18.7.3), and they were
> surprised to find that the MSR raises #GP on our platform. We're
> looking into cherry-picking this support from upstream as a start, but
> I know the customer would be unhappy to read zero from bits 15:8.

Does KVM *have* a concept of "maximum non-turbo frequency" of the
guest that it would make sense to expose here?  If so, presumably the
right solution is to expose it.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
