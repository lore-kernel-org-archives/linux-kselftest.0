From: yhs@fb.com (Yonghong Song)
Date: Wed, 20 Mar 2019 22:45:39 +0000
Subject: [PATCHv2 bpf-next 1/3] bpf, tests: tweak endianness selection
In-Reply-To: <20190320222759.GQ7431@mini-arch.hsd1.ca.comcast.net>
References: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
 <20190320171332.GJ7431@mini-arch.hsd1.ca.comcast.net>
 <4c6db4e5-8e77-2e01-a4ab-25808df2b857@fb.com>
 <20190320222759.GQ7431@mini-arch.hsd1.ca.comcast.net>
Message-ID: <55387960-b50a-2f5f-1083-da2377558c2b@fb.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320224539.HNjSvHXLpox--_DH4Rn7dDTKGHEqx0TmOPrXh8pHCrg@z>



On 3/20/19 3:27 PM, Stanislav Fomichev wrote:
> On 03/20, Yonghong Song wrote:
>>
>>
>> On 3/20/19 10:13 AM, Stanislav Fomichev wrote:
>>> On 03/20, Sergey Senozhatsky wrote:
>>>> Not all compilers have __builtin_bswap16() and __builtin_bswap32(),
>>>> thus not all compilers are able to compile the following code:
>>>>
>>>>           (__builtin_constant_p(x) ? \
>>>>                   ___constant_swab16(x) : __builtin_bswap16(x))
>>>>
>>>> That's the reason why bpf_ntohl() doesn't work on GCC < 4.8, for
>>>> instance:
>>>>
>>>>           error: implicit declaration of function '__builtin_bswap16'
>>>>
>>>> We can use __builtin_bswap16() only if compiler has this built-in,
>>>> that is, only if __HAVE_BUILTIN_BSWAP16__ is defined. Standard UAPI
>>>> __swab16()/__swab32() take care of that, and, additionally, handle
>>>> __builtin_constant_p() cases as well:
>>>>
>>>>    #ifdef __HAVE_BUILTIN_BSWAP16__
>>>>    #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
>>>>    #else
>>>>    #define __swab16(x)                             \
>>>>            (__builtin_constant_p((__u16)(x)) ?     \
>>>>            ___constant_swab16(x) :                 \
>>>>            __fswab16(x))
>>>>    #endif
>>>>
>>>> So we can tweak selftests/bpf/bpf_endian.h and use UAPI
>>>> __swab16()/__swab32().
>>>>
>>>> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
>>>> ---
>>>>
>>>> v2: fixed build error, reshuffled patches (Stanislav Fomichev)
>>> Tested them locally with the compiler I saw the initial issues with - all
>>> fine, I don't see any errors with the older gcc.
>>>
>>> One last question I have is: what happens in the llvm+bpf case? Have
>>> you tested that? I think LLVM has all the builtins required, but since
>>> we are relying on the swab.h now (and it relies on
>>> __HAVE_BUILTIN_BSWAP16__), I wonder whether this detection works
>>> correctly on the llvm when targeting bpf. (sidenote: bpf_endian.h can be
>>> used from both userspace and bpf programs).
>>
>> Inside kernel clang compiler header (linux/compiler-clang.h) does not
>> define __HAVE_BUILTIN_BSWAP16__. So it will go to the "else" branch in
>> the above. So I think it should work with clang + bpf.
> Hm, isn't it the opposite of what we want then? I think for llvm+bpf we always
> want to use the builtins to make it properly generate
> BPF_TO_BE/BPF_TO_LE instructions.

Okay, I see. Then this patch will not achieve that.
The following are two common ways to compile a bpf program:
   - "clang -target bpf ...", maybe add macro __BPF__ somewhere
     to indicate builtin_bswap16 always available?
   - "clang <host target> ..." and then "llc -march=bpf ..."
     in this case, __BPF__ macro is not available and
     we will not be able to use builtin swap for bpf program.

Maybe use __clang__ macro (or gcc macro) to distinguish between clang 
and gcc. If it is gcc we will check builtin availability, otherwise,
we assume builtin always available? This not pretty though.

> 
>>>
>>>>
>>>>    tools/testing/selftests/bpf/bpf_endian.h | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/bpf/bpf_endian.h b/tools/testing/selftests/bpf/bpf_endian.h
>>>> index b25595ea4a78..1ed268b2002b 100644
>>>> --- a/tools/testing/selftests/bpf/bpf_endian.h
>>>> +++ b/tools/testing/selftests/bpf/bpf_endian.h
>>>> @@ -20,12 +20,12 @@
>>>>     * use different targets.
>>>>     */
>>>>    #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
>>>> -# define __bpf_ntohs(x)			__builtin_bswap16(x)
>>>> -# define __bpf_htons(x)			__builtin_bswap16(x)
>>>> +# define __bpf_ntohs(x)			__swab16(x)
>>>> +# define __bpf_htons(x)			__swab16(x)
>>>>    # define __bpf_constant_ntohs(x)	___constant_swab16(x)
>>>>    # define __bpf_constant_htons(x)	___constant_swab16(x)
>>>> -# define __bpf_ntohl(x)			__builtin_bswap32(x)
>>>> -# define __bpf_htonl(x)			__builtin_bswap32(x)
>>>> +# define __bpf_ntohl(x)			__swab32(x)
>>>> +# define __bpf_htonl(x)			__swab32(x)
>>>>    # define __bpf_constant_ntohl(x)	___constant_swab32(x)
>>>>    # define __bpf_constant_htonl(x)	___constant_swab32(x)
>>>>    #elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
>>>> -- 
>>>> 2.21.0
>>>>
