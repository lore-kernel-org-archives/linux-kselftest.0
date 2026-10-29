Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793313363;
	b=t2xaXIuKv5LF8wUw4TFQqSaBzQY0rUj5rsXfvHq9y5LxiCw4N/S2Lo7eL+5VzpCXbjBB
	 3XO+014o0ySn/QBnQ4gQmQkoD7y+s0EqpmbyhDpdACq6XdUYOF13lmziRIt9M+k1+0fR5
	 woPFPVThUJWqcRi0JRSldAvxYQ92/P5pFJSpMNpieqScJE7Kk3S8IUlvj++Bi7TfLmS4x
	 h7ppRnRm2we+Azy0TfQKfIxejChEJpNB7YZpZ9qL6Q6wS/cona+RLn+k5UACP2sES4UeM
	 +t7j1IQkALVIEuJeVZ/l69+VigIl8yULQQtQVO+A4iNNP0LtjrCaBBbDe6hHrXn8pfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G8tCHOOGj/+N8fPdGSF2K18fSxDtFgxN/WAC+oLERQA=;
	b=sATFcGuZQ6TrIvn9rBvifPiBenygebx8dPgHXo9EN5ytIshPP9ROS/EQFeqkWoMqSMTp
	 p1zfSNJ62yKTE5dujSezul2pigh8P2qnf95jPDgYGlXCOi0RHIV6eK7a+Qc/4zy85NfYe
	 iBHu6XEYxsAmDFV8amJ1fp+BV4e5i7Bcpd8U+HqjbkY/sPWIEmpQ9dyNTz72lwfZmqm67
	 5Si9rei+/jmigJazTrx5rDDFPlWT7HW4F6MEewmPwZIOSTbh7+a9CtnduwsjZ7nQAqBl2
	 ZaN3G7fUr9bt/c7oT0YFclrpv5v2KdwkCUGlIGt+VYyKQIub3t5w5vf6po8zFS6pXFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CgxFMn1B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF042606A31F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF042606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CgxFMn1B
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c49b431f022so4989566b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 15:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793313361; cv=none;
        d=google.com; s=arc-20260327;
        b=MuYhvQhafKghIZKhwhX6J5E59s0OVVItdqNR25o/RxohUoeV/1rXGpzWpuWN7uraGK
         q0rGSXOmtrButLtVbAO6S6Z+hdwEnFJMnf7I1ifr6CSxahwuNwELHAew8MkCi4Uz05Vv
         QinHcbivyS29o+VZ9Daan3jpCHLnd4KAuxPkMC+gRSM0bGieTLD3Ve8oPWnyEssON2eD
         A6CXQglH5fGCWLN2RnIqDhHxDu6oZSah4yCr2xat9Y6SDe9Xyo278uanozekJ0wyH8+z
         njvQ9nTw1Eu6STbLgS3dIxdwJMrnXRfDKQ9WNopCBTAUoCUIg59IREFk+pul1Ihl00NX
         V2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G8tCHOOGj/+N8fPdGSF2K18fSxDtFgxN/WAC+oLERQA=;
        fh=B16/+4skrPF5uRrgcx0odgS92rV2hadTNwYU+7uWjeg=;
        b=PUhuAJuegs3H1hZUudA/b35s93fxibZoXAPdDgUKhgG76mO6Mf6h2B7GMtK6Gg8I8x
         5yoLp5SkYhlf3yuXlB6PEJm+9HPOwjGjOmUUjebwAUiO4VxGar1ooo4eW15MiWdKRyfA
         gfJnjE8MzT/GlhGvk3ylbNs1yCrs3kJXwfjV4RWnGzG1xS4HtLk/b0pKSV8JNrrmW61q
         A8PFEslfh+DCcHYrZKQV3M6N8NNOlr+Fj4KI/qak23u3RU1anUrxRXSolO++HljO0DI8
         dsEuJqrAPnylv41Zlft35CGXZIqTQ8xU0vz3tml43xeUWlKTrynamwlnadCoPyClONPY
         Dgxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793313361; x=1793918161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8tCHOOGj/+N8fPdGSF2K18fSxDtFgxN/WAC+oLERQA=;
        b=CgxFMn1BYb+w6v/KJidME3BfeZ77AO2XqGKCxWNtdwdXdfSy/qFHPVLhCrrCMuXSKc
         11CdbME9ji6j4II9lx1iEqnokHT6b+BXGlUb02sJfgLOQ7TfSvtHLj5r6obmN0bkT8If
         ydEYhv+ibz+/eyDMVEU2wj/BldheN+RJFBSQ3VhkskVe72P5EGytYZ1Q4GUMm5l58Ql2
         JLrE+k06ADPu60I4xmGS1RLf2qWivYqkd1NR5lZaryoNu1J/5ea14mVl5jFHIin+OmaI
         ghCclrTA8+Ie9zpNc2hUu1PQqzBQCmdz/O8Jjun1JNwbkxI2c/uhi07lot7+jbhC9KJg
         dZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313361; x=1793918161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8tCHOOGj/+N8fPdGSF2K18fSxDtFgxN/WAC+oLERQA=;
        b=BezrNqFh2TKJq3lBBfnjGpYiF2XiKGa6v0IJINclsBy7FoozgXwGQqTluZcKFH+3Aj
         Znrk9vr67KPhMKQolLbxhpVESFvNTDHlADovZbKSnhvNNCJ/cjew+4zmdf1gwwRCo7vD
         FRCngJxJuNNNWJKl6b312khjiFAm6hCJXmlKzDqVrbnZcW7uyQrTKBUmGyXjERfIGCMx
         3ax59mbsVozgUZnUZWYlUbG8JKADVkV9w+sTk23J/WhL7afPS8+Ts+7zfPxJGPJNkRlt
         +eOWS/RgAs5bL0W7RMFrxAG0ROkFhxWSXkpLNIZpOw5jkarI/N+kvOOX6LfXd3WFxK/6
         RMug==
X-Forwarded-Encrypted: i=1; AKwUvBwlboV/F0JiT4Cjctr6N2ABwUUOMkWUjRPUL9sXK3IkieW0Q4+X5hof2+6hj5UgsIFbXEIbTkeW9J2EsKqqFbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK96phd/s+pbSZCTGLXBbUHmgnmyuws2QMtmJbcMVGwmzN/nlQ0
	XSEp3Xb6zqQZeWOS31LdX2J9L29692vlc8gDTNbCTqbwYIMjqYzCxqw3EDgoOS7nlIw/d7AbmG9
	3sCWg2EWvY0VwPLFr9VD2O0Mf3QXUJtDC4zXiphdu
X-Gm-Gg: AYBFou3WQDYRCNpvpkAZoPUV2X1tqkFGKJAEO7mTvRGkfJsfdRJcwqdv87vagdW36Et
	vFvQPDOKZNHrjHoOFh/C0ykt1AwiyePeKcAvA37XrVrFXtHtVK69j4rsxEKPErYdxxwKKKE39gq
	nR7ev4yO81YrqsasW/cwPqSyhoO7SLhdcmHgL+WFYBVJM1dy3xbc+7xcYfJaldTL2XtMY9AAky/
	bR6dWe/acpiZx7JIUhGLZr9d6tOnaic1UQl7Bo6uQ6MNw6Pf5yQ1tL+PbQxucTRpKMVZf8K2U9i
	AVi+BL3xqBKm3cDab/09CIf4fbe8o4QySHhzLfHlsKDU7yI6Bxv54t3FmPu1qlAmx7I9pRgRuYD
	iqHTs1eyesG8tjgxUmhiRJMM1Iy9qZy4hJHhuRJQT1oD07eEWmMYhaFMk4exfwoDkYdibs78=
X-Received: by 2002:a17:907:3e1e:b0:c48:a838:c188 with SMTP id
 a640c23a62f3a-c4ca7a4b3b4mr47123766b.13.1793313360445; Thu, 29 Oct 2026
 15:36:00 -0700 (PDT)
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
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com> <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
In-Reply-To: <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 15:35:48 -0700
X-Gm-Features: AclHuK9Q2VdYK7NLuuR_HXG0hWT2XRH1-lodvxt5cVmONXOgPyaKx1O_WXmNwr4
Message-ID: <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
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

On Thu, Oct 29, 2026 at 3:09=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 2:58=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > On Tue, Oct 27, 2026 at 3:25=E2=80=AFPM Andrii Nakryiko
> > <andrii.nakryiko@gmail.com> wrote:
> > >
> > > On Thu, Oct 22, 2026 at 5:17=E2=80=AFPM Samuel Wu <wusamuel@google.co=
m> wrote:
> > > >
> > > > Add an extensible KALLSYMS_QUERY ioctl() interface to /proc/kallsym=
s
> > > > to support fast point queries without scanning the entire text file=
.
> > > > Exactly one query mode must be set in query_flags.
> > > >
> > > > When KALLSYMS_QUERY_BY_SYMBOL is set in query_flags, KALLSYMS_QUERY
> > > > resolves a NUL-terminated symbol name in vmlinux or loaded modules =
and
> > > > then populates sym_addr:
> > > > - Searches vmlinux first via kallsyms_lookup_names() (binary search=
),
> > > >   which takes precedence over loaded modules, and falls back to
> > > >   module_kallsyms_on_each_symbol() under module_mutex for module
> > > >   symbols
> > > > - Matches names exactly, like kallsyms_lookup_name(), disregarding =
the
> > > >   .llvm.<hash> matching, following precedent set by commit fb6a421f=
b615
> > > >   ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG")
> > > > - Resolves 0x0 symbol addresses in both vmlinux and modules
> > > > - Rejects ambiguous symbols (multiple entries with the same name at
> > > >   different addresses within vmlinux, or across loaded modules) wit=
h
> > > >   -EADDRNOTAVAIL, while allowing same-address aliases
> > > >
> > > > Userspace symbolizers resolve kernel addresses to symbol names with
> > > > /proc/kallsyms. This is typically done by reading the entire
> > > > /proc/kallsyms text file, and keeping a compressed sorted copy of i=
t in
> > > > order to resolve addresses at runtime.
> > > >
> > > > When KALLSYMS_QUERY_BY_ADDR is set in query_flags, KALLSYMS_QUERY
> > > > resolves one address to the symbol that contains it:
> > > > - sym_addr holds the address to resolve on input.
> > > > - sym_name_addr must point to a user buffer of sym_name_size bytes
> > > >   that receives the NUL-terminated symbol name. On output,
> > > >   sym_name_size holds the number of bytes written (including the
> > > >   terminating NUL). -ENAMETOOLONG is returned if the buffer is too
> > > >   small; a buffer of KSYM_NAME_LEN (512 at the time of writing) byt=
es
> > > >   is always large enough.
> > > > - Symbols are resolved via kallsyms_lookup(), the same lookup as %p=
S,
> > > >   covering vmlinux, loaded modules, BPF JIT images, and freed modul=
e
> > > >   init functions still tracked by ftrace.
> > > >
> > > > On an 8 CPU Cuttlefish (x86-64 VM), using this patchseries to load =
a BPF
> > > > program with 11 typeless ksyms has ~220x speedup (157ms -> 0.7ms).
> > > >
> > > > On an 8 CPU x86-64 VM with a 175k line kallsyms, there are broad
> > > > performance and memory savings for the symbolization and callstack
> > > > sampling tool, Perfetto:
> > > > - Init time: ~350x speedup (155.7ms -> 0.44ms)
> > > > - 50k symbolizations: ~12x speedup (25.2ms -> 2.2ms)
> > > > - VmRSS: -68% (15.1MB -> 4.8MB)
> > > >
> > > > Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> > > > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > > > ---
> > > >  include/uapi/linux/fs.h |  41 +++++++++++++
> > > >  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++=
++++
> > > >  2 files changed, 173 insertions(+)
> > > >
> > > > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > > > index 34c6f219462a..b43f227dad0e 100644
> > > > --- a/include/uapi/linux/fs.h
> > > > +++ b/include/uapi/linux/fs.h
> > > > @@ -674,6 +674,47 @@ struct procmap_query {
> > > >         __u64 build_id_addr;            /* in */
> > > >  };
> > > >
> > > > +/* /proc/kallsyms ioctl */
> > > > +#define KALLSYMS_QUERY _IOWR(PROCFS_IOCTL_MAGIC, 18, struct kallsy=
ms_query)
> > > > +
> > > > +/* Exactly one query mode must be set in query_flags. */
> > > > +enum kallsyms_query_flags {
> > > > +       /*
> > > > +        * Look up a symbol in vmlinux or loaded modules (vmlinux f=
irst; BPF
> > > > +        * and ftrace symbols are not searched) by exact NUL-termin=
ated name
> > > > +        * at sym_name_addr and return sym_addr. sym_addr and sym_n=
ame_size
> > > > +        * must be 0 on input.
> > > > +        */
> > > > +       KALLSYMS_QUERY_BY_SYMBOL =3D 0x01,
> > > > +       /*
> > > > +        * Look up the symbol covering sym_addr and write its NUL-t=
erminated
> > > > +        * name to the sym_name_addr buffer of sym_name_size bytes.=
 The same
> > > > +        * symbols as %pS are searched: vmlinux, loaded modules, BP=
F JIT
> > > > +        * images, and freed module init functions still tracked by=
 ftrace.
> > > > +        * A buffer of KSYM_NAME_LEN (512 at the time of writing) b=
ytes is
> > > > +        * always enough. On success, sym_name_size is set to the n=
umber of
> > > > +        * bytes written (including the terminating NUL).
> > > > +        */
> > > > +       KALLSYMS_QUERY_BY_ADDR =3D 0x02,
> > > > +};
> > > > +
> > > > +/*
> > > > + * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the nam=
e maps to
> > > > + * more than one address, -ENAMETOOLONG if the name does not fit i=
n
> > > > + * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size byt=
es, and
> > > > + * -EPERM if kallsyms addresses are hidden from the opener of /pro=
c/kallsyms
> > > > + * (e.g. kptr_restrict).
> > > > + */
> > > > +struct kallsyms_query {
> > > > +       __u64 size;             /* in - struct size for compatibili=
ty */
> > > > +       __u64 query_flags;      /* in - query mode (enum kallsyms_q=
uery_flags) */
> > > > +       __u64 sym_name_addr;    /* in - address of symbol name buff=
er */
> > > > +       __u64 sym_addr;         /* out (BY_SYMBOL) / in (BY_ADDR) *=
/
> > > > +       __u64 sym_name_size;    /* in/out - name buffer size / byte=
s written */
> > > > +};
> > >
> > > it might be smart to have QUERY_BY_ADDR and QUERY_BY_NAME to be two
> > > separate ioctl commands with its own query in/out struct. This would
> > > remove addr vs name ambiguity in sym_name_addr field, and will allow
> > > us to evolve APIs independently, if necessary. They should still
> > > probably reuse the same type to represent symbol information, and hav=
e
> > > kallsyms_query struct provide a pointer to that struct (and its
> > > maximum size), which the kernel will fill out and set the size it
> > > actually knows about.
> > >
> > > struct kallsyms_query_by_addr {
> > >     __u64 size;
> > >     __u64 query_flags;
> > >     __u64 sym_addr; /* in */
> > >     struct kallsyms_sym *sym; /* out */
> > >     __u64 sym_len;
> > > };
> > >
> > > struct kallsyms_sym {
> > >     __u64 sym_addr;
> > >     __u64 sym_name;
> > >     __u64 sym_name_len;
> > >     __u64 sym_module;
> > >     __u64 sym_module_len; /* if zero, no module requested/available *=
/
> > > };
> > >
> > > e.g. for symbol you'd want to return its name, address, but also
> > > module name. and we should leave a way to extend it further with more
> > > optional information (that's the kallsyms extensibility bit I was
> > > talking about).
> >
> > Agree, two ioctls with a shared symbol type is cleaner. v3 plan is to
> > have QUERY_BY_NAME and QUERY_BY_ADDR both fill a shared struct
> > kallsyms_sym (address, size, name, module), passed by pointer so it
> > can grow later.
> >
> > > aslo, we should think about adding ways to paginate (or at least leav=
e
> > > a possibility of that in the future) if there are multiple matches
> > > (e.g., for static functions with the same name resolving to multiple
> > > addresses); not sure how it should look like API wise, but it would b=
e
> > > good to still return "any" or "first" match, but let user know there
> > > are multiple, so user can decide how to proceed...
> >
> > Makes sense, but I'm thinking v3 doesn't need pagination or batching.
> > I didn't see any performance wins when profiling libbpf, and it can be
> > added later without breaking UAPI.
> >
> > > on input I'd also add module name as optional input argument, with
> > > "vmlinux" limiting to just vmlinux, set module name to just that name=
,
> > > and NULL/zero meaning "we don't care"
> >
> > Makes sense, so here is a possible plan for QUERY_BY_NAME:
> > - Optional module filter: NULL =3D any, "vmlinux", or a module name
> > - Returns the first match by default (vmlinux first, then modules). An
> > ALL_MATCHES flag searches everything and reports the number of matches
>
> searches everything as in all modules, or you mean just full linear scan?

I envision ALL_MATCHES to do some form of lower_bound() +
upper_bound() on vmlinux since it's sorted, and then linear scan of
all modules. Of course, just one of the two or both aforementioned
things depending on the module filter (any, vmlinux, module).

> >
> > And an open question I'm unsure about: Should libbpf keep the light
> > skeleton semantics (take the first match, no ambiguity check), or set
> > ALL_MATCHES to keep today's check that fails on names with multiple
> > addresses?
>
> I'd say fail on ambiguity

Ack

> >
> > > for QUERY_BY_ADDR we should have a flag saying whether an exact match
> > > by address is requested or we should find a symbol that covers the
> > > address (that's most useful for symbolization). maybe even "at or
> > > after" address mode, so you can paginate (though probably explicitly
> > > designed batch API would be even more useful later)
> >
> > For v3 I think we can keep BY_ADDR to the covering lookup only. The
> > result can fill in the covering symbol's (start address, size, name,
> > module), and callers can check for an exact match themselves by
> > comparing the start address with the queried address. A batch API can
> > be added later when there is a user for it.
>
> There is a user for batch API, that's blazesym, wprof, retsnoop and
> other applications that use kallsyms for symbolization. I didn't
> insist on adding it from the get go just to reduce the scope, but
> there is definitely a use case for having fast way to dump all or
> parts of kallsyms

Ahh, ok, hopefully reducing the scope for v3 is fine.

> >
> > > tl;dr, this is the right direction, but I think we should polish API =
a
> > > bit more to be more universally useful and extensible
> > > > +
> > > > +#define KALLSYMS_QUERY_SIZE_VER0       40 /* sizeof first publishe=
d struct */
> > > > +
>
> [...]
>
> > >
> > > PROCMAP_QUERY uses offsetofend() for the last defined field, any
> > > reason to have this #define and BUILD_BUG_ON here?
> >
> > David pointed out that the size field in struct kallsyms_query is
> > redundant. In v3, I can drop the size field and use _IOC_SIZE(cmd),
> > keep the *_SIZE_VER0 define (since we need minimum size). Perfectly
> > fine to switch to the PROCMAP_QUERY style though if preferred.
>
> I'm not sure how size is redundant, I don't see ioctl subsystem
> accepting argument size as a separate parameter, so the size has to
> come from the user and be embedded in user-provided structure, if we
> want any sort of backward/forward compatibility. At least looking at
> PROCMAP_QUERY I don't see how we could have avoided it, so not sure
> how we can do that here.

My understanding is that the size is encoded in the ioctl command
itself: _IOWR() puts sizeof(struct) into the command number when
userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
header the caller was built against.

That said, either way is fine. We could mirror PROCMAP_QUERY style for
consistency.

> >
> > Thanks Andrii for all the thoughtful feedback!
> >
> > > > +               return -EINVAL;
> > > > +
> > > > +       err =3D copy_struct_from_user(&karg, sizeof(karg), uarg, us=
ize);
> > > > +       if (err)
> > > > +               return err;
> > > > +
> > >
> > > [...]
