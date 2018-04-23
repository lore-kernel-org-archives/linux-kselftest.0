From: daniel@iogearbox.net (Daniel Borkmann)
Date: Tue, 24 Apr 2018 00:31:42 +0200
Subject: [PATCH] selftests: bpf: update .gitignore with missing file
In-Reply-To: <CADYN=9KAorrGBh+2_LZ+6cxaf4yU-pOmU4BSzkMKT8sdU7hhUw@mail.gmail.com>
References: <20180423135057.951-1-anders.roxell@linaro.org>
 <5ea150a6-8af1-3aa8-7ff0-5fdb64054bab@iogearbox.net>
 <CADYN=9KAorrGBh+2_LZ+6cxaf4yU-pOmU4BSzkMKT8sdU7hhUw@mail.gmail.com>
Message-ID: <065a8bc2-6065-3d43-8b03-35ed693de7ce@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180423223142.n5oHBcTRE2gLlU_KFNFP2hJdWK9d79pxdJ9fY_iweRY@z>

On 04/24/2018 12:14 AM, Anders Roxell wrote:
> On 23 April 2018@23:34, Daniel Borkmann <daniel@iogearbox.net> wrote:
>> On 04/23/2018 03:50 PM, Anders Roxell wrote:
>>> Fixes: c0fa1b6c3efc ("bpf: btf: Add BTF tests")
>>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>>> ---
>>>  tools/testing/selftests/bpf/.gitignore | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
>>> index 5e1ab2f0eb79..3e3b3ced3f7c 100644
>>> --- a/tools/testing/selftests/bpf/.gitignore
>>> +++ b/tools/testing/selftests/bpf/.gitignore
>>> @@ -15,3 +15,4 @@ test_libbpf_open
>>>  test_sock
>>>  test_sock_addr
>>>  urandom_read
>>> +test_btf
>>
>> Against which tree is this? This doesn't apply to bpf-next. It would
>> apply against bpf tree, but c0fa1b6c3efc ("bpf: btf: Add BTF tests")
>> is part of bpf-next, so fits to neither of them.
> 
> I'm sorry,
> 
> I did it against this patch [1] that I thought was already applied to
> the bpf tree.

That was bpf tree since the original change already went to mainline; the
BTF is in bpf-next however, so you need to rebase your change against that.

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
