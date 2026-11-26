Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654102;
	b=hlNvGfrD2Z38DpsLPXQKgKf9UEf4Xf8mNE16NnmsACtd1Jb1INJB2iew5P6B2mvQnihn
	 5wRZbZRxyZHCDc5dlPNBOiBo8r+mn3eBMMQxXZqkgYBevA92bHQSIa+AaMiEF8EVtWRO3
	 9z+VG/eAdz0+6k8InhixILnKDCxPHjHdqobe35lT2CuDZFYuZeN013G2GWWaI1dEZu5cn
	 /wlzXFgoPBK8ncOR4MtMU/w3Rs34I5mBqBz9WhUa+8HU1YXlB7n1RdyhxoVE28LryFpah
	 XcuhmXLH2fddFQC18YiJ5wBKSZzgiy7SjqIO8wH2MxWZLRiiH8IrYM7Q7ej5aObhEzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
	b=AwzlmwiS47ryTGaTQXLk0a+mcWJVRCeWa0GyjISZHzUuFu2BFEzqIgXsYAkgSKw0K8d0
	 LsJ7zVS9ROKHHO/XzAVq0l1UX39LAR82fcMP8WVLc9xos34QBZKZLQi1sslGU2+u83u3B
	 b7pJ9vUQ/NWc9PXQrNjUSxnkxV55Pmxyw0RyTZ/AGpGDrpb6yHHHg4uwINl+WSr4Qfx/k
	 xY8c/fT8gwstQE0gPs+PwATL6OuxOlx9iKUaBCXcLHKJXHvOxz+y13vq3yQoM+S36+I+k
	 CRbIvVuCjRmpdzCNWKhIPo+kZlPH23bfqtXoC74ReOFFSKUkQcKDiFXDjGzkpOjcYWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QWMZ80Cz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DE7606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 00:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QWMZ80Cz
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso8516564a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 16:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654101; cv=none;
        d=google.com; s=arc-20260327;
        b=ACmgr1oZkwg4GB9HLomm3bO6evXOgSEoag9hEubJiSizpx8YhIvpBVOMd0QKZhEXJt
         DkloTIkQmwRo4nP3I0FYG2oRI3zaxPMQ7HL7ZW0rbGAlwXIrhzEzAGdsKh5/N9wP5boP
         nnsBxT6kqFuxffiWjSjDj0hBA8ms1Aq1ofjZUMAxsW/w6YcFYz4vzy2MpwBLsxuK475D
         p3KDFUTOguEVKePudK5E4IbKuzDZ3ff3WzI3qhChSURaoovqa6pcVnYbS9w6oHFvyEnz
         oqrBR83uLAYu0J3r7sMLP+ilGuoG4QfCr0AQDKyvRvlO4muc7/qdrb+e9O2GOuIPQBji
         +Wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        fh=TTKarBxGh/Qepe2xwQaZtxxdBNGHDtvFIgYzo0SgDhQ=;
        b=K/Pa+JjmTciFjahRGoPs6h1tp3ju5OlBqgnECxA13vq+JtXdEpxhcgTNwvEu+JWLzV
         7zrA19s6wuKABySceuFal56oUX7qi3ZJx/WU/NqaD/7Nudu2T7fUAHlO9ntQ/GGiAnk0
         PWEOweqD9pkayKXeaVQJDyBkl2wPUJ49E1QT+rfCo0PRjU3UgZjf6KP4WEX9kyINbGaE
         MuEWnz3/T0PQeLUL7+2xBz7FRNZUKlgnWXEn17GWH+PoFCuRJBNYwpH6eClcUvXLk0t1
         pTvAenkYgFd3kQTzGHa8ifyFkrMrwzaipLOxu+X8wB4W6Mg0QubCNJf1iXdppS/crvC2
         gh/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654101; x=1796258901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        b=QWMZ80CzZfH6yoH4sucNVvHTrwf1PIcC+Bp2zpQDOXhvTaLR5/Hb6aclEYP0GJ5EbO
         tJUXzbHm5a1lhC/Ax05U+ZOxJaUnTui2Rk4msdPfixijvZGIv/STMD8sdmvdk0JLoPML
         TqbI7e+F27OvNQ1L2QOdn33Qfg3eLkeqAwD6ryOf7vQH0q2dc2f1o0EKha9CE2cwglDJ
         7Sd/maZlmbFd2u6vfPe4Bc4+mGU0kS7nC1KhuBzJ0BY73ENkc4VuiMfat2qIpNB6JRsB
         QZjOMEBbuY0eBgGxKWFhpFa0ZVGml7Ayw5gVKKOPjRvn3VcvJm969BGQaiZe0I0XPK79
         1ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654101; x=1796258901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        b=uQwya4aFwr9ZZctTG+h82onmrz2E1+3uxcPBw+jrpKTm+U3VABn1e/l7i6QQYR30bD
         oaD+PfeaoR5hAW7VedaEhCLC9OHxX2cs3CG2y/WDu7wrnoiVVtjPe5yMhiQ3uHwiua4j
         aGyp8CFJP4Hn0rtCqEBD/QkRqpH/52iKd3jpvnXh6x8IL+EhOh0IKLeu8QukRSADCO4Q
         W+HowpWtFFvzdSCn2HYdU6t0ToifFtY39/ro/ESoEQ9gtlgEg6FfTQhWR8KEqKJxPA70
         HvPc4cuzbpgNCB/1x8YFEiWXRKiRUmMQVxgXdA1FP6U6D5df6oczfehqC2TcJm1mU8lo
         I4GQ==
X-Forwarded-Encrypted: i=1; AL+hErH+hFnN06uz4Olvcx+0cDX6lcPBQ0IRRHen6Xoru8rxNClHfIFpA/DMztNSWO/XPvIbCObllkNJb945dFK37jY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dCGjAnE5iXPQ8vCsIiYKKj6DLmdW4HWnBM6H7N1HT8nuc6No9
	/8rx+gf0jY+z4wGFRezsbZfLTqMHzqs+UH32ff7DwaVYoAIhS6cwdYNnNyG+JHD8FFZ2EfAoBIs
	PfiNkTsbZL/HqL2hdM/4CQkOoHlLforn0bPbiTYpV
X-Gm-Gg: AZFdTZcHcNd3zxc1ki7h0Nm6qC38LO5sfX2pbjSmB+zUcBzjVbouVmF7awRuzwFwIRv
	vdVmWn0DIuefX4lfRBmrRCPktF6EK1RHEPVQZvECqpXiaJ0uQuUUCxZFpSVc+t9pdALfy3bzr2J
	QVRekes4Q/RUrLzzemv678gltMZFHsaPhIR+rnvDIUaOlayQ+pGFYiI/qmKwTi/8nzLDifapnCT
	k5MiDb4oUnOprI7mTW1/8E0pEJJmhdo4BSTjvFYF1RlTIi0jXN3QZFWjtYGfFBc80AVv4UcSxrG
	pjpkbHKt1C9XXOW5tc0jOhwKdJEEPyt65lmMq2KKvsUscrx7+dQBmZA2OC/ZVB1XygnqioMbaxx
	Fm4CKrhpaD/uWR/qDeAAcfNV181GgDBYXNoLrWd8vDNprdcAraP4mZJR259dYIjy03sY=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:f106:3419 with SMTP id
 4fb4d7f45d1cf-6ba37ed40e7mr16523342a12.43.1795654100281; Wed, 25 Nov 2026
 16:48:20 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-14-wusamuel@google.com> <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
In-Reply-To: <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:48:08 -0800
X-Gm-Features: Aa3M54pWdHazBU-AqLK5TiYQKtZxCNreXkIezAAKXNEVmmWGCBCO_8U3jzAUf4c
Message-ID: <CAG2Kctp-XoiK-Ej3eHWnYyijydej6Bw5sLKNNi-S+xEGDB+mGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]

> > +/*
> > + * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PREFIX,
> > + * in the entries of /proc/kallsyms, except undefined module symbols. vmlinux
> > + * matches come first. A module_filter of "vmlinux" selects the core kernel.
> > + *
> > + * Each call returns one match and sets pos to its position, even on
> > + * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, until
> > + * -ENOENT. Use pos only with the same query. Matches can be skipped or
> > + * repeated if symbols change between calls.
> > + */
> > +struct kallsyms_query_by_name {
> > +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_name) */
> > +       __u64 query_flags;      /* in - enum kallsyms_query_flags */
> > +       __u64 query_name;       /* in - user ptr to name or prefix */
> > +       __u64 module_filter;    /* in - user ptr to loaded module name, or 0 */
>
> similar to the comment on the previous patch, how does the user
> express that it only wants to search vmlinux image and not consult
> module?
>
> and naming nit: query_module to be consistent with "query_name"?

Passing "vmlinux" selects only the core kernel (noted in the block
comment above, missing inline). Will rename to query_module and note
"vmlinux" inline.

>
> > +       __u64 pos;              /* in/out - start position / match position */
> > +       __u64 sym;              /* in - user ptr to struct kallsyms_query_sym */
> > +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym) */
>
> I'd name it "sym_size" for consistency with "sym" naming, and the
> comment/doc here is unambiguous about what that is (struct size, not
> the symbol's recorded size). seems fine as far as UX goes
>
Ack, will switch to sym_len
>
> other than nits, this API looks great
>
> [...]
>
> > +/* On -ENAMETOOLONG, *ksym is still copied, to return the required sizes. */
> > +static int kallsyms_copy_sym_to_user(u64 usym, u64 usym_size,
> > +                                    struct kallsyms_query_sym *ksym,
> > +                                    const struct kallsyms_sym_match *m)
> > +{
> > +       size_t copy_sz = min_t(size_t, usym_size, sizeof(*ksym));
> > +       bool too_long = false;
> > +       int err;
> > +
> > +       ksym->sym_addr = m->addr;
> > +       ksym->sym_size = m->size;
> > +       err = kallsyms_copy_str_to_user(ksym->sym_name, &ksym->sym_name_len,
> > +                                       m->name);
> > +       if (err == -EFAULT)
> > +               return -EFAULT;
> > +       too_long |= (err == -ENAMETOOLONG);
>
> nit: if (err == -ENAMETOOLONG) too_long = true; is just as short
>
> but also you are eating any other error, maybe write it so that
> original err is preserved as is, not special-casing ENAMETOOLONG? if
> you get EFAULT later, original error still takes precedence

Sounds good- I'll simplify this to preserve the first error via
something like `ret = ret ?: err` without any special handling for
ENAMETOOLONG.

[...]
