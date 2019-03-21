From: sergey.senozhatsky.work at gmail.com (Sergey Senozhatsky)
Date: Thu, 21 Mar 2019 09:22:01 +0900
Subject: [PATCHv2 bpf-next 1/3] bpf, tests: tweak endianness selection
In-Reply-To: <20190320171332.GJ7431@mini-arch.hsd1.ca.comcast.net>
References: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
 <20190320171332.GJ7431@mini-arch.hsd1.ca.comcast.net>
Message-ID: <20190321002201.GA2097@jagdpanzerIV>

On (03/20/19 10:13), Stanislav Fomichev wrote:
> Tested them locally with the compiler I saw the initial issues with - all
> fine, I don't see any errors with the older gcc.

Thanks!

> One last question I have is: what happens in the llvm+bpf case? Have
> you tested that? I think LLVM has all the builtins required, but since
> we are relying on the swab.h now (and it relies on
> __HAVE_BUILTIN_BSWAP16__), I wonder whether this detection works
> correctly on the llvm when targeting bpf. (sidenote: bpf_endian.h can be
> used from both userspace and bpf programs).

Honestly, I haven't, but I think we should be fine.

For !__HAVE_BUILTIN_BSWAP16__ compilers we still do constant folding.
swab16/swab32 turn into

	__builtin_constant_p((__u16)(x)) ? ___constant_swab16(x) : __fswab16(x))
and
	__builtin_constant_p((__u32)(x)) ? ___constant_swab32(x) : __fswab32(x))

clang/llvm support __builtin_constant_p GCC extension [1]:

 : Clang supports a number of builtin library functions with the same
 : syntax as GCC, including things like __builtin_nan, __builtin_constant_p,
 : __builtin_choose_expr, __builtin_types_compatible_p,
 : __builtin_assume_aligned, __sync_fetch_and_add, etc.

So clang should be able to detect swab on a compile time constant and
optimize it.

[1] https://clang.llvm.org/docs/LanguageExtensions.html

	-ss
