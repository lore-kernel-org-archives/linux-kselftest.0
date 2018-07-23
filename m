From: daniel@iogearbox.net (Daniel Borkmann)
Date: Tue, 24 Jul 2018 00:36:00 +0200
Subject: [PATCH] bpf: Add Python 3 support to selftests scripts for bpf
In-Reply-To: <20180723173313.ri2uz7srtdtno2hl@linode.therub.org>
References: <20180718213610.19618-1-jcline@redhat.com>
 <1aa3dc98-2ab1-7386-d5d9-afd3dbb3fde9@iogearbox.net>
 <dd971e43-3148-5a54-788e-d89835d3638a@redhat.com>
 <20180723173313.ri2uz7srtdtno2hl@linode.therub.org>
Message-ID: <f26dda36-cbfe-00ec-6a17-b18487a856af@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180723223600.WcyDDJfxf0ySaVqKWgBHUfWFQPqFRAKOtUSFiXTzo-s@z>

On 07/23/2018 07:33 PM, Dan Rue wrote:
> On Mon, Jul 23, 2018@10:08:57AM -0400, Jeremy Cline wrote:
>> On 07/20/2018 04:45 PM, Daniel Borkmann wrote:
>>> On 07/18/2018 11:36 PM, Jeremy Cline wrote:
>>>> Adjust tcp_client.py and tcp_server.py to work with Python 3 by using
>>>> the print function, marking string literals as bytes, and using the
>>>> newer exception syntax. This should be functionally equivalent and
>>>> support Python 2.6 through Python 3.7.
>>>>
>>>> Signed-off-by: Jeremy Cline <jcline at redhat.com>
>>>
>>> Thanks for the patch, Jeremy! Given we also have test_offload.py in BPF
>>> kselftests and it is written for python 3 only, it would probably make
>>> sense to adapt the tcp_{client,server}.py towards python 3 as well, so
>>> we wouldn't need to keep extra compat for 2 and have a consistent version
>>> dependency. Lawrence / Jeremy, any objections?
>>
>> I certainly don't object to Python 3 only and I'm happy to drop the
>> Python 2 compatibility from this patch if that's okay.

Sounds good, lets do it, please respin with that.

> This (well, along with introducing python in the first place, which took
> me by surprise), sounds like a policy decision that should be made clear
> in the kselftest documentation (Documentation/dev-tools/kselftest.rst).
> Currently, that file does not mention any python requirement.

Right now each selftest subdir has a config file which lists dependencies,
perhaps it makes sense to have another standardized file there (e.g. 'deps')
which lists user space dependencies, so it's immediately visible what is
needed to run all tests from there. Thoughts?

> That said, I agree that python2 support is no longer necessary.
> 
> My use-case (which may be unusual?): We try to run all of kselftest
> against a variety of kernels and architectures for every push to next,
> mainline, and stable/lts branches. It seems that this is not a common
> usecase, but shouldn't it be?

As far as I'm aware the intel lkp-tests bot seems also to regularly run
the kselftests for x86, if also done from arm side e.g. on latest mainline,
even better.

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
