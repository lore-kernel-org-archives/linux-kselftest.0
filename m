From: keescook@chromium.org (Kees Cook)
Date: Sat, 1 Jun 2019 22:06:10 -0700
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <20190528170244.GF32006@arrakis.emea.arm.com>
References: <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
 <201905221316.865581CF@keescook>
 <20190523144449.waam2mkyzhjpqpur@mbp>
 <201905230917.DEE7A75EF0@keescook>
 <20190523174345.6sv3kcipkvlwfmox@mbp>
 <201905231327.77CA8D0A36@keescook>
 <20190528170244.GF32006@arrakis.emea.arm.com>
Message-ID: <201906012156.55E2C45@keescook>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190602050610.gwRHSSWZJZuQAA_nEno8tJJIe6dMk05IgVi6TrDS3kU@z>

On Tue, May 28, 2019@06:02:45PM +0100, Catalin Marinas wrote:
> On Thu, May 23, 2019@02:31:16PM -0700, Kees Cook wrote:
> > syzkaller already attempts to randomly inject non-canonical and
> > 0xFFFF....FFFF addresses for user pointers in syscalls in an effort to
> > find bugs like CVE-2017-5123 where waitid() via unchecked put_user() was
> > able to write directly to kernel memory[1].
> > 
> > It seems that using TBI by default and not allowing a switch back to
> > "normal" ABI without a reboot actually means that userspace cannot inject
> > kernel pointers into syscalls any more, since they'll get universally
> > stripped now. Is my understanding correct, here? i.e. exploiting
> > CVE-2017-5123 would be impossible under TBI?
> > 
> > If so, then I think we should commit to the TBI ABI and have a boot
> > flag to disable it, but NOT have a process flag, as that would allow
> > attackers to bypass the masking. The only flag should be "TBI or MTE".
> > 
> > If so, can I get top byte masking for other architectures too? Like,
> > just to strip high bits off userspace addresses? ;)
> 
> Just for fun, hack/attempt at your idea which should not interfere with
> TBI. Only briefly tested on arm64 (and the s390 __TYPE_IS_PTR macro is
> pretty weird ;)):

OMG, this is amazing and bonkers. I love it.

> --------------------------8<---------------------------------
> diff --git a/arch/s390/include/asm/compat.h b/arch/s390/include/asm/compat.h
> index 63b46e30b2c3..338455a74eff 100644
> --- a/arch/s390/include/asm/compat.h
> +++ b/arch/s390/include/asm/compat.h
> @@ -11,9 +11,6 @@
>  
>  #include <asm-generic/compat.h>
>  
> -#define __TYPE_IS_PTR(t) (!__builtin_types_compatible_p( \
> -				typeof(0?(__force t)0:0ULL), u64))
> -
>  #define __SC_DELOUSE(t,v) ({ \
>  	BUILD_BUG_ON(sizeof(t) > 4 && !__TYPE_IS_PTR(t)); \
>  	(__force t)(__TYPE_IS_PTR(t) ? ((v) & 0x7fffffff) : (v)); \
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index e2870fe1be5b..b1b9fe8502da 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -119,8 +119,15 @@ struct io_uring_params;
>  #define __TYPE_IS_L(t)	(__TYPE_AS(t, 0L))
>  #define __TYPE_IS_UL(t)	(__TYPE_AS(t, 0UL))
>  #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
> +#define __TYPE_IS_PTR(t) (!__builtin_types_compatible_p(typeof(0 ? (__force t)0 : 0ULL), u64))
>  #define __SC_LONG(t, a) __typeof(__builtin_choose_expr(__TYPE_IS_LL(t), 0LL, 0L)) a
> +#ifdef CONFIG_64BIT
> +#define __SC_CAST(t, a)	(__TYPE_IS_PTR(t) \
> +				? (__force t) ((__u64)a & ~(1UL << 55)) \
> +				: (__force t) a)
> +#else
>  #define __SC_CAST(t, a)	(__force t) a
> +#endif
>  #define __SC_ARGS(t, a)	a
>  #define __SC_TEST(t, a) (void)BUILD_BUG_ON_ZERO(!__TYPE_IS_LL(t) && sizeof(t) > sizeof(long))

I'm laughing, I'm crying. Now I have to go look at the disassembly to
see how this actually looks. (I mean, it _does_ solve my specific case
of the waitid() flaw, but wouldn't help with pointers deeper in structs,
etc, though TBI does, I think still help with that. I have to catch back
up on the thread...) Anyway, if it's not too expensive it'd block
reachability for those kinds of flaws.

I wonder what my chances are of actually getting this landed? :)
(Though, I guess I need to find a "VA width" macro instead of a raw 55.)

Thanks for thinking of __SC_CAST() and __TYPE_IS_PTR() together. Really
made my day. :)

-- 
Kees Cook
