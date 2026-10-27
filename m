Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793139904;
	b=NviqBUn1H8+G1F5NvuWkMTtZS32M7N0Uwbx3nsz7fEw3n31+xMId1wQ1VX5iTpgOkCcT
	 tgJU+d98VnWC7JI6ZQpWO/9DtFgy/rmMO/aWpFneVIIuI0oOrqczteweSvSQ6yMLtTkW4
	 V6CeRfGXtgW4DbPzWyxLNYpcM0ZntOrqBQ5YSXaMuXaWHPrh9IxnEbBHqWxSL0RR0n/60
	 6zbkH+tZAC4iIjuxGYmR7OxU7fcUYSDfdvkY+D2V88y0fFyWWF1VqjbVHBEC04ngxnrPM
	 urrDX2Vvfx9dmBtH1OhIVmqRm5pVMsjyPeW5NzDU8H4f4zVoe8Y88KDzhpjZ26ncgWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZEKOi1PwMO6a+hswERjow4zduMtspY4e9rbrauVqOm4=;
	b=NoI7yx3UGYgSol3kSJnDiLc5rwZFo2AdLNxSveUIIUMxnqjiStNHkqYRWpToDMJznazr
	 YAo1RJx7KwChjsoui6zHkMVVy6fxDrImaZFlNpt7fDO4Byxqgo14G3Snr3FUaZ/OrmqOr
	 zavxI14/8j8R3Inn45if1GtDscUwLluAWwk6YcDiHCmbfianPH44jxVvvQ97mU3uNFJIH
	 WF3A15JW9eC3SYdwsGosR+WjKVt7ApWmViiqXJIQq4EZ9fVFBjdb8KLDRUfkphRGzvXZc
	 DCd1zwPbd8Ixy7Gy3TuDzqtCpgWLCDMkjb1CRsItHWbmv4kbEDeCdLgUgW3btfmFvrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UIVonWY7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE3606A31F
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 22:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBE3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UIVonWY7
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so86310a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 15:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793139902; cv=none;
        d=google.com; s=arc-20260327;
        b=m51aXYLShpwiuKCDBtgKMh05iDQM27dusl5BrrBcEE4KCU1QT3rzPeSE7xiud5YtDD
         mMuLHMfLRvB6TS7AQsiwby7klGBUa4dqkwld/xb3ZJij84yqOHH6TWS4cvWZVqzDuFTq
         P0bQrOlL4+MpC2ScN7PBc98QBdhlvvvDhavMpekuuu7v2BirqKfAONejWjk/Q0RH7dzt
         fLGlGIbz0SKtCxWF09vUr+TVuTRhSazSBzLHy9hs331lvsV3e7JXz5RVLObl6qXLAuYW
         FbqnM19xsv6RHtcJH+6ZHVnq9WPeR5Qlso9AP2IWLod+wylaHOFhcEES7DU0UMv59ppu
         Lwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEKOi1PwMO6a+hswERjow4zduMtspY4e9rbrauVqOm4=;
        fh=e6MVh5tj98I/dPXADUbjfRT/TczjZH2T1Z+wwZO+CHQ=;
        b=WCQHXPYbiVyrVRODR4s5J3ByZ5esYpgBZGZiUH7Fb62vg9cSB3OiUTvbhRj/7X62/q
         l2GYV1UeKIHx1TCnrh46FJH9FicUfeiZ4Ab7R3muShhdWY0h1OA2ufBSQVy/A2nBt99G
         QX6+yqn5PKTVnBdT59r4Ems5JOlA6Lbz696wttZAgzCw5hcDagFBwaU2XysBgkhjkFn1
         KlLuHi/R8T/Zhhh4xlD6uWAXzRiMJhPjy1Bymm3ll9GPqof+DPPGUzdipxMeOEN1N/J7
         b3HJiE9rqC8LsetqTxn0JK0SX0hT3PnvSiu+6jSlwa5Oqrai/4kp75snuo/UuMMZDUbo
         KFqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139902; x=1793744702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEKOi1PwMO6a+hswERjow4zduMtspY4e9rbrauVqOm4=;
        b=UIVonWY7/5Yge+0HZP1QKG9Zf85i9SU8Wrr6TMrhHLyCGP+B1P1bccPe9QeRW+5MEh
         8KqzqQ/8kzdJGas+RM8ZfOc/MkZFqx74V81oklhqNlhXgZp4xljFEdoc2z7U21yfY2Yh
         h9zbWAmHUzrANOG/4I3MACRmL+o/3YejoM+Hg7b2oMQ4OxQhdscgTGxKtE0XyITbYpTz
         5A4TXSeTnfe4x3HGu+WI0ZMq3FMyTfy7w17FlrCFRvW7yWIAnh6CMDZZK0Yl/oJk3hqi
         O168vP/JLZg/tDQCQXrLxXUrmZdPUJ1YfAKVFtSxOhSZ9KgLyPCsesca8cTN0RtESR0k
         kvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139902; x=1793744702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEKOi1PwMO6a+hswERjow4zduMtspY4e9rbrauVqOm4=;
        b=0PIGXPOqAKLNvUUYDSD/RL4wQgNjCgv7/QJ41BVt28XHnNXLwcJ9JpCduIMjELn+tv
         gZpnCKolXPKrXnXG+NGy0zbJpmCAETm6wwv+QA6xie40WZVaetM4U2hkcr2XmaHqRGKW
         1j2vZAEt41klepT2aYvo5FJyUiwUuE6yMAgngyy6nL8xO1LVAGnigfvwNxYRQWuqnNrT
         HO0F4rgP3qvuf0ILBIv/V33KGtna/edRSuIsU1ogM716UQl0aqy45/Vup0b2jEqcp99L
         4U9xs/++EzToO9tJZB5Gc7/rXwDVuX0uezJ+AEnrnkXxD9+ilnHRTp25jjg8zlzao9Cu
         ED2g==
X-Forwarded-Encrypted: i=1; AKwUvBx0+91v0r87a7gCmY1gJjorwWWDxu+rFl8nPL09ur/OX6C3wfNfaNjkclw187AcqFKR1UKxMaDuAGGs8/1LS0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgjc/41Nw4jDi4Vr1k+uu4zFSnRq+OoqqfYgKbZSC9A9N2QNOj
	h2rJJ+ksMtS9RA/vKw7f7fozgrdD/ctA8OqeWOyfo/6k5XLLaAolkL7BoF1cATYpB6pK50eoAqI
	uIs3/INuBoWqSWrwpVnhdOKaESfTguxE=
X-Gm-Gg: AYBFou0K8DcBMRnRhH2ePFP039Hli37nE1oPydQ7JgUHViaIsOKANI//uUWh8smwHHR
	mBzShvi2MSRjrvHPsysLwgrgcAWCPjm/V1Mx02C9FPMqiy9V1EmUKLYFodOzshRdFnaSboELB5o
	R3cc/EsQ08xkXRvhgpMDxQ1aDavFCWJ7yxaYov1saldNF4o4U0d+7HtLq8lm6ClZF9YRmDsEhnD
	puJ3v70TArU/wPBnSDFPPezFlbmJ5jvw0ux9/nZ08THQwEJiAm319N7TAVE5oGf/iuujXmYQqCX
	yJ8qZP0PQMWZ9GpBLyf+p55EgPIP9wQhQJIBbq3qIU5IfeNAC5NEf18uPWET7K9FUC67MHztWYD
	hT14WBcXs66xXzzPD1uV4Gx6kiKcevo/4AgHLwo+ER8USwegmLdnXnDEWFPpze72Nrv/ZrfUbpI
	E+yMYcq7Uk3hkGS1TgJRQU3lRAxpgvrgP6GQ==
X-Received: by 2002:a17:90b:3b85:b0:3ac:9259:122c with SMTP id
 98e67ed59e1d1-3ae58241dccmr307011a91.40.1793139902173; Tue, 27 Oct 2026
 15:25:02 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
In-Reply-To: <20261023001603.560210-9-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 27 Oct 2026 15:24:50 -0700
X-Gm-Features: AclHuK_SsI0sp6o_bhNEekYUJ22um4BFp-_z7npxEVXNceFMnfOEnPql-EZ_y5k
Message-ID: <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:17=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> Add an extensible KALLSYMS_QUERY ioctl() interface to /proc/kallsyms
> to support fast point queries without scanning the entire text file.
> Exactly one query mode must be set in query_flags.
>
> When KALLSYMS_QUERY_BY_SYMBOL is set in query_flags, KALLSYMS_QUERY
> resolves a NUL-terminated symbol name in vmlinux or loaded modules and
> then populates sym_addr:
> - Searches vmlinux first via kallsyms_lookup_names() (binary search),
>   which takes precedence over loaded modules, and falls back to
>   module_kallsyms_on_each_symbol() under module_mutex for module
>   symbols
> - Matches names exactly, like kallsyms_lookup_name(), disregarding the
>   .llvm.<hash> matching, following precedent set by commit fb6a421fb615
>   ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG")
> - Resolves 0x0 symbol addresses in both vmlinux and modules
> - Rejects ambiguous symbols (multiple entries with the same name at
>   different addresses within vmlinux, or across loaded modules) with
>   -EADDRNOTAVAIL, while allowing same-address aliases
>
> Userspace symbolizers resolve kernel addresses to symbol names with
> /proc/kallsyms. This is typically done by reading the entire
> /proc/kallsyms text file, and keeping a compressed sorted copy of it in
> order to resolve addresses at runtime.
>
> When KALLSYMS_QUERY_BY_ADDR is set in query_flags, KALLSYMS_QUERY
> resolves one address to the symbol that contains it:
> - sym_addr holds the address to resolve on input.
> - sym_name_addr must point to a user buffer of sym_name_size bytes
>   that receives the NUL-terminated symbol name. On output,
>   sym_name_size holds the number of bytes written (including the
>   terminating NUL). -ENAMETOOLONG is returned if the buffer is too
>   small; a buffer of KSYM_NAME_LEN (512 at the time of writing) bytes
>   is always large enough.
> - Symbols are resolved via kallsyms_lookup(), the same lookup as %pS,
>   covering vmlinux, loaded modules, BPF JIT images, and freed module
>   init functions still tracked by ftrace.
>
> On an 8 CPU Cuttlefish (x86-64 VM), using this patchseries to load a BPF
> program with 11 typeless ksyms has ~220x speedup (157ms -> 0.7ms).
>
> On an 8 CPU x86-64 VM with a 175k line kallsyms, there are broad
> performance and memory savings for the symbolization and callstack
> sampling tool, Perfetto:
> - Init time: ~350x speedup (155.7ms -> 0.44ms)
> - 50k symbolizations: ~12x speedup (25.2ms -> 2.2ms)
> - VmRSS: -68% (15.1MB -> 4.8MB)
>
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  include/uapi/linux/fs.h |  41 +++++++++++++
>  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 173 insertions(+)
>
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 34c6f219462a..b43f227dad0e 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -674,6 +674,47 @@ struct procmap_query {
>         __u64 build_id_addr;            /* in */
>  };
>
> +/* /proc/kallsyms ioctl */
> +#define KALLSYMS_QUERY _IOWR(PROCFS_IOCTL_MAGIC, 18, struct kallsyms_que=
ry)
> +
> +/* Exactly one query mode must be set in query_flags. */
> +enum kallsyms_query_flags {
> +       /*
> +        * Look up a symbol in vmlinux or loaded modules (vmlinux first; =
BPF
> +        * and ftrace symbols are not searched) by exact NUL-terminated n=
ame
> +        * at sym_name_addr and return sym_addr. sym_addr and sym_name_si=
ze
> +        * must be 0 on input.
> +        */
> +       KALLSYMS_QUERY_BY_SYMBOL =3D 0x01,
> +       /*
> +        * Look up the symbol covering sym_addr and write its NUL-termina=
ted
> +        * name to the sym_name_addr buffer of sym_name_size bytes. The s=
ame
> +        * symbols as %pS are searched: vmlinux, loaded modules, BPF JIT
> +        * images, and freed module init functions still tracked by ftrac=
e.
> +        * A buffer of KSYM_NAME_LEN (512 at the time of writing) bytes i=
s
> +        * always enough. On success, sym_name_size is set to the number =
of
> +        * bytes written (including the terminating NUL).
> +        */
> +       KALLSYMS_QUERY_BY_ADDR =3D 0x02,
> +};
> +
> +/*
> + * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the name maps=
 to
> + * more than one address, -ENAMETOOLONG if the name does not fit in
> + * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size bytes, an=
d
> + * -EPERM if kallsyms addresses are hidden from the opener of /proc/kall=
syms
> + * (e.g. kptr_restrict).
> + */
> +struct kallsyms_query {
> +       __u64 size;             /* in - struct size for compatibility */
> +       __u64 query_flags;      /* in - query mode (enum kallsyms_query_f=
lags) */
> +       __u64 sym_name_addr;    /* in - address of symbol name buffer */
> +       __u64 sym_addr;         /* out (BY_SYMBOL) / in (BY_ADDR) */
> +       __u64 sym_name_size;    /* in/out - name buffer size / bytes writ=
ten */
> +};

it might be smart to have QUERY_BY_ADDR and QUERY_BY_NAME to be two
separate ioctl commands with its own query in/out struct. This would
remove addr vs name ambiguity in sym_name_addr field, and will allow
us to evolve APIs independently, if necessary. They should still
probably reuse the same type to represent symbol information, and have
kallsyms_query struct provide a pointer to that struct (and its
maximum size), which the kernel will fill out and set the size it
actually knows about.

struct kallsyms_query_by_addr {
    __u64 size;
    __u64 query_flags;
    __u64 sym_addr; /* in */
    struct kallsyms_sym *sym; /* out */
    __u64 sym_len;
};

struct kallsyms_sym {
    __u64 sym_addr;
    __u64 sym_name;
    __u64 sym_name_len;
    __u64 sym_module;
    __u64 sym_module_len; /* if zero, no module requested/available */
};

e.g. for symbol you'd want to return its name, address, but also
module name. and we should leave a way to extend it further with more
optional information (that's the kallsyms extensibility bit I was
talking about).

aslo, we should think about adding ways to paginate (or at least leave
a possibility of that in the future) if there are multiple matches
(e.g., for static functions with the same name resolving to multiple
addresses); not sure how it should look like API wise, but it would be
good to still return "any" or "first" match, but let user know there
are multiple, so user can decide how to proceed...

on input I'd also add module name as optional input argument, with
"vmlinux" limiting to just vmlinux, set module name to just that name,
and NULL/zero meaning "we don't care"


for QUERY_BY_ADDR we should have a flag saying whether an exact match
by address is requested or we should find a symbol that covers the
address (that's most useful for symbolization). maybe even "at or
after" address mode, so you can paginate (though probably explicitly
designed batch API would be even more useful later)


tl;dr, this is the right direction, but I think we should polish API a
bit more to be more universally useful and extensible

> +
> +#define KALLSYMS_QUERY_SIZE_VER0       40 /* sizeof first published stru=
ct */
> +
>  /*
>   * Shutdown the filesystem.
>   */
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index aec2f06858af..7caaf3e421c7 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -31,6 +31,7 @@
>  #include <linux/kernel.h>
>  #include <linux/bsearch.h>
>  #include <linux/btf_ids.h>
> +#include <linux/uaccess.h>
>
>  #include "kallsyms_internal.h"
>
> @@ -922,11 +923,142 @@ const char *kdb_walk_kallsyms(loff_t *pos)
>  }
>  #endif /* CONFIG_KGDB_KDB */
>
> +struct kallsyms_mod_find_ctx {
> +       const char *name;
> +       unsigned long addr;
> +       bool found;
> +};
> +
> +static int kallsyms_mod_find_cb(void *data, const char *name, unsigned l=
ong addr)
> +{
> +       struct kallsyms_mod_find_ctx *ctx =3D data;
> +
> +       if (strcmp(name, ctx->name) !=3D 0)
> +               return 0;
> +       if (ctx->found && ctx->addr !=3D addr)
> +               return -EADDRNOTAVAIL;
> +       ctx->found =3D true;
> +       ctx->addr =3D addr;
> +       return 0;
> +}
> +
> +static int do_kallsyms_query(struct kallsym_iter *iter, void __user *uar=
g)
> +{
> +       char namebuf[KSYM_NAME_LEN];
> +       struct kallsyms_query karg;
> +       unsigned long addr;
> +       unsigned int start;
> +       unsigned int end;
> +       unsigned int i;
> +       __u64 usize;
> +       long len;
> +       int err;
> +
> +       BUILD_BUG_ON(sizeof(struct kallsyms_query) !=3D KALLSYMS_QUERY_SI=
ZE_VER0);
> +
> +       /*
> +        * The text interface shows zero addresses to openers without per=
mission.
> +        * A zeroed point query result is useless (and an address-to-symb=
ol query
> +        * would leak KASLR), so fail instead.
> +        */
> +       if (!iter->show_value)
> +               return -EPERM;
> +       if (copy_from_user(&usize, uarg, sizeof(usize)))
> +               return -EFAULT;
> +       if (usize > PAGE_SIZE)
> +               return -E2BIG;
> +       if (usize < KALLSYMS_QUERY_SIZE_VER0)

PROCMAP_QUERY uses offsetofend() for the last defined field, any
reason to have this #define and BUILD_BUG_ON here?

> +               return -EINVAL;
> +
> +       err =3D copy_struct_from_user(&karg, sizeof(karg), uarg, usize);
> +       if (err)
> +               return err;
> +

[...]
