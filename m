From: jmattson@google.com (Jim Mattson)
Date: Fri, 27 Jul 2018 14:03:52 -0700
Subject: [PATCH v14 8/9] KVM: x86: virtualize cpuid faulting
In-Reply-To: <6F48D384-B29C-41B4-83F1-B02FC2480205@amacapital.net>
References: <20170208080917.24320-1-khuey@kylehuey.com>
 <20170208080917.24320-9-khuey@kylehuey.com>
 <CALCETrVS8ch-1harGv2NUy83ZLna8Vde1zNLxPTPaxuMexQMjw@mail.gmail.com>
 <CALMp9eSyJep6UPxeiZRWPrdzwvvcqJEbPPZ6C61EeHsvdyhMLg@mail.gmail.com>
 <6F48D384-B29C-41B4-83F1-B02FC2480205@amacapital.net>
Message-ID:
 <CALMp9eQDWWAgmwnzZ0iTa2w+7-d_MjyOByOdfN0MjiHzaQWyEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727210352.tvRxsBSyc_ZTvH6cV-5OSGfuJmEatuSQtY_2_ZI61_4@z>

On Fri, Jul 27, 2018@1:46 PM, Andy Lutomirski <luto@amacapital.net> wrote:
>> On Jul 27, 2018,@1:28 PM, Jim Mattson <jmattson@google.com> wrote:
>> Initializing this bit to zero helps with migration, but then if the
>> CPUID faulting bits in both MSRs are set, userspace has to take pains
>> to ensure that MSR_PLATFORM_INFO is restored first, or the
>> MSR_MISC_FEATURES_ENABLES value will be rejected.
>
> The code could drop the constraint and just let the entry possibly fail if the MSRs are set wrong

That would be an improvement, I think.

>> I'm also concerned about the 0 in the "Maximum Non-Turbo Ratio" field
>> feeding into someone's calculated TSC frequency.
>
> Hmm. I don’t have a good answer to that. Are there any real CPUs that have this MSR but don’t have that field?

No. The reason I bring this up is that a customer has code that
expects to be able to derive the TSC frequency from this MSR (per
Intel's instructions in SDM volume 3, section 18.7.3), and they were
surprised to find that the MSR raises #GP on our platform. We're
looking into cherry-picking this support from upstream as a start, but
I know the customer would be unhappy to read zero from bits 15:8.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
