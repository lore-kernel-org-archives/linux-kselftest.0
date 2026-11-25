Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638315;
	b=tctWQbelMHXIw9onAt4xhpAUAqVgst6xGztbRTRm6Ze0QQPl/R1P+Sk1M0605a0iS9Ba
	 ui51V9z6lZTit3pTEyIJlrpzR6PO2RJ4joX7oVF2E4oWdCYvd7WNFo4ajWlcT1HAcUyB8
	 xhqa5KZR8RWK+CiX2YhU2OfbZMzMhvjuigH3xGka3zS+XkcP8sDeNz56aY7q5YOE0JGes
	 +QyKfYU+phQk561kqo8bgFXP45cZb65cnnG1Iz2onqol24jCg/TsWnofumYyYHNW+Q5Xk
	 NzC0X0ebuGokapzhTGYKZifz/zQgsPNIxt4I6HVwPpSFAUha3WPEzUd3qsumA9F2DcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
	b=ylgncWPGBGiQIAC6eccCky2TbRnNt4nynmOWYED2edDQ63uX5CvYjtGfZb4wb7mh1pud
	 L9JWUoTU3c9IfMsCRi3tH4YvUfdj7kOZq2yFOABJlGpS4WWOtFJHiGZMwFqcnToHFZnYQ
	 Tckioz41t6+ZNqA5UT9NUE6BlAD4weuEWMasysJqlCR7vIMhWlWb/qj0W521nYf5AM1tZ
	 LupPO2aqJUc2ASa8E7ZKv2LYi3E+Ru3yHXFj1Y6T0wrdF0K1jqku9Yo1+nJJS+VIFDgfn
	 k8pN+nKarY6gC4O1sezEyVumPO9V/KNvTY3jtHuAP4uQa2synVXO9E0MFRfUdu7mlyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsVUFq4K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C248F606A33A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 20:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C248F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsVUFq4K
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4104032f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 12:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638313; cv=none;
        d=google.com; s=arc-20260327;
        b=fI1XqA8UK1K9nQCFiI9dRo8xiPxpeUVPC6ciqm1fWltBCZMER9ou9Rk9uv4+p8OlRX
         fhlkep/Y30+LyI7loKWfctbD/XRm845FJD+bca791a/34sMoAy55IyEJVqF4SbgGXG7X
         OZQjbmfgDoVWWtc7c/w/dt07/uoGzINwSzcKWd84nh1l/PgNQTLoLvy/SgBw0NwCu01H
         Hhk4MbDmw39CqQQuQKeVEjQMazWLOcNQnJa7juvGzuLSjQu+WrT4EaED4Zre9henHlFC
         L0CiwQYtB/gfUfhEDkQEdP9I7uYGjectMwdjphPuQEKtuWqzLReTnGx1VnolQdimlEZZ
         /jtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        fh=TM4mwQqrXNcGp0DEHRQDWIJZ5BU7aSZPIxZbVYFK+Tk=;
        b=P2QxXTIKELei82E9e1TfxHm82jmsddGnRAphLfNuilStUDDWKHO4NSkf/dapl7e376
         Y74iSgudiUIjEFVi4df6uUcXxnN/ZzQszF+dCZHaUslnFMwKE45Fs/nlTKwQqdWy1c77
         JrOxE0mU3IwjWKS3PHS2tW6CJS2Z4eGNSwYQds9fNtjv+tVGSy11LotTIJ8IABw8dDxv
         KuJOWVeLb51lUBQpcyC3H8ME0aJ5x3Pe9chdEOJCJGkdKkWGYm6NsBJyiLDVM0ZBoXZn
         Q4A9Q105Cd8m18Jzm9PfS4V0M9qOcwdA5WjuRrPXKk2xZGFXWpISgxy6i4XiVZgIDUcV
         TBHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638313; x=1796243113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        b=FsVUFq4Kxydr5a/GRpviIjKPXJDEjD+WqAdPZ1XWo1WKh6FISDbmtggw9Zb9JFW3df
         my0mKvhcR7rXcURvxIiyLaU0x8G53jEG3RdWyadxD5Sjrd3S3bRm9m2X9eRmHdgcwpBt
         kJEx19iUSOYIvPsz94vQNgXJI2BVbCnizYEbhclF+Ay+piUCPYbizA3IKKECYAyth31c
         1cycvaj0oJ30o2SFzRwfoCqCkfAxS5IRdiXE6Aygof4B197kFd92a26XgWumaMHu5NwL
         j2GNWzFlP3MDK3hmVarn2zbz/A34WRbObbIdjkRH2C2OpDhJyhYRxAmTFIj0Zm516Hlh
         0Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638313; x=1796243113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        b=MZX3KwgWsEHc2Gyu22QSYVAo5xsAz+DJJnvpkjKlE8zN5sDQsAbCv9oHFf08WbQZuw
         9JyKI84DDA7CyLGWa84YHTvtK4rAbkfWYhbbT9pVFoZoZEwUpoWgkWSk0ouQLGUSOTq0
         3bQ68virB4fl5v0VAwWza3+HtiFRv1S3Vh47ErzY0h7DpG5b0m6F+41GnNUHuPHu99Ag
         v+AMT0NrI30YN1RqvQZVsV3DS04guIv03LSlJ8uNrNQcpup9GEZTjuho+c5Kh5tR1sLv
         VCN7NnlnVMjrSk57SWO/jusPX5NMZ4SALAkGTOJC2wJ0jpAGTki1et2JT6qOIR6K7zdk
         Kduw==
X-Forwarded-Encrypted: i=1; AL+hErGsptnuKwGueUfKVYXAj7hAzKrr8je77vOXMAxyBwAOB+dGCX9idcNn+mMVva4WVtbjuxwOj9IkEfcdFGmzL1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QTCbtiyP6MbDYC5ip+6YqoIl0/DBhTnDNTmAfKs0Z8/qldkvy
	7lJbfiZGe/gCTlveC00DgG7/qjVpnZXXioSmrJ9qluLkHg3n3dCMK4k2iVECjdo9AFtFDy6FCCD
	NDITMRVIg/GLfUGx+LGYMGtR1tIOg5e0=
X-Gm-Gg: AZFdTZccg6GvBn9lZWvPQ38LyUUSLNiK22hs23KG9WjE9G/rHiwaZcVEwB2xKt6b1oD
	ADbqQhKBYGEkjhO0M2rbBNHmxTlF/z1CbuJezarzXuKfENJNLvFaCxGpesbNvFWUiHfdtQED5lo
	vHC7x0+REqoiRcPs5PK0MDOlOwTPMJvuX5RrjO7XzI1YMbn7iNJj0Po2rfu0WibbX1eKeBptbTd
	Qn6wAD9B9mdgqt3vJFS8kiQNvuruV9ueNXDdY2RsWg6QmzNY9Sa75qwrg1f5LVcg9qPbv0DwZCM
	87XAGPEESXOhxyQMdZPKfejaytaBwztz5VfLEnwuFX5Emnfu8gvCSWeQCOk8MUqP62B1i3epyAk
	fb+ldlhAGdnNij4AWeeVmYEcU1u1OoBVOs9kPi5yyxx8dSmEj63Ny/J12rY5eDJl8B02S1Nd8sE
	9F5aVVfr4NBpVZyWOcH1lJ6wLvEj+WhjUe+MLEAD4=
X-Received: by 2002:adf:e010:0:10b0:4a7:518f:bea6 with SMTP id
 ffacd0b85a97d-4abb3a4d2b1mr26580561f8f.28.1795638312899; Wed, 25 Nov 2026
 12:25:12 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-14-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-14-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:25:01 -0800
X-Gm-Features: Aa3M54pvd_ufUhqcRiZwrOrjoyqqBDQhM2r6c2QuhvkGt5RO4ZEh7lWEiXzteDk
Message-ID: <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
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
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> To find a few kernel symbols, users such as libbpf parse all of
> /proc/kallsyms, which is several MB and text based.
>
> Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name or
> by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> and optionally in a single module with module_filter, or all modules by
> default. Each call returns one match and its position; pos + 1 continues
> the search, until -ENOENT. The output returns the address, the size, and
> optional name and module buffers. A buffer that is too small gives
> -ENAMETOOLONG and the required size.
>
> vmlinux symbols are found with a lower-bound binary search on the sorted
> names, module symbols in one pass, and ftrace, BPF, and kprobe symbols
> with the per-index getters that read() uses.
>
> For versioning, the struct carries their sizes, so the command does not
> change when the struct grows.
>
> The command uses 'f' 0x30; register 0x30 in ioctl-number.rst.
>
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  include/uapi/linux/fs.h                       |  43 +++
>  kernel/kallsyms.c                             | 319 ++++++++++++++++++
>  3 files changed, 363 insertions(+)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index fbc3537fc9ee..f5dbb597257a 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -250,6 +250,7 @@ Code  Seq#    Include File                           =
                  Comments
>  'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       c=
onflict!
>  'f'   10-11  linux/fs.h                                                c=
onflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   13-27  linux/fscrypt.h
> +'f'   30     linux/fs.h                                                p=
rocfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   81-8F  linux/fsverity.h
>  'g'   00-0F  linux/usb/gadgetfs.h
>  'g'   20-2F  linux/usb/g_printer.h
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index a46c33692aa2..987569dcdbea 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -674,6 +674,49 @@ struct procmap_query {
>         __u64 build_id_addr;            /* in */
>  };
>
> +/* /proc/kallsyms ioctls. -EPERM if the opener cannot see kernel address=
es. */
> +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL=
_MAGIC, 48, 0)
> +
> +enum kallsyms_query_flags {
> +       /* Match query_name as a prefix. */
> +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> +};
> +
> +/*
> + * Symbol returned by a query. Each buffer pointer and its *_len must bo=
th be
> + * set or both be 0. When set, the kernel sets *_len to the string size
> + * including the NUL, even if the buffer is too small and the ioctl fail=
s with
> + * -ENAMETOOLONG. The module name of a vmlinux symbol is "".
> + */
> +struct kallsyms_query_sym {
> +       __u64 sym_addr;         /* out - start address */
> +       __u64 sym_size;         /* out - bytes to next symbol, 0 if unkno=
wn */
> +       __u64 sym_name;         /* in - user ptr to name buffer, or 0 */
> +       __u64 sym_name_len;     /* in/out - buffer size / string size */
> +       __u64 sym_module;       /* in - user ptr to module name buffer, o=
r 0 */
> +       __u64 sym_module_len;   /* in/out - buffer size / string size */
> +};
> +
> +/*
> + * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PR=
EFIX,
> + * in the entries of /proc/kallsyms, except undefined module symbols. vm=
linux
> + * matches come first. A module_filter of "vmlinux" selects the core ker=
nel.
> + *
> + * Each call returns one match and sets pos to its position, even on
> + * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, u=
ntil
> + * -ENOENT. Use pos only with the same query. Matches can be skipped or
> + * repeated if symbols change between calls.
> + */
> +struct kallsyms_query_by_name {
> +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_n=
ame) */
> +       __u64 query_flags;      /* in - enum kallsyms_query_flags */
> +       __u64 query_name;       /* in - user ptr to name or prefix */
> +       __u64 module_filter;    /* in - user ptr to loaded module name, o=
r 0 */

similar to the comment on the previous patch, how does the user
express that it only wants to search vmlinux image and not consult
module?

and naming nit: query_module to be consistent with "query_name"?

> +       __u64 pos;              /* in/out - start position / match positi=
on */
> +       __u64 sym;              /* in - user ptr to struct kallsyms_query=
_sym */
> +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym)=
 */

I'd name it "sym_size" for consistency with "sym" naming, and the
comment/doc here is unambiguous about what that is (struct size, not
the symbol's recorded size). seems fine as far as UX goes


other than nits, this API looks great

[...]

> +/* On -ENAMETOOLONG, *ksym is still copied, to return the required sizes=
. */
> +static int kallsyms_copy_sym_to_user(u64 usym, u64 usym_size,
> +                                    struct kallsyms_query_sym *ksym,
> +                                    const struct kallsyms_sym_match *m)
> +{
> +       size_t copy_sz =3D min_t(size_t, usym_size, sizeof(*ksym));
> +       bool too_long =3D false;
> +       int err;
> +
> +       ksym->sym_addr =3D m->addr;
> +       ksym->sym_size =3D m->size;
> +       err =3D kallsyms_copy_str_to_user(ksym->sym_name, &ksym->sym_name=
_len,
> +                                       m->name);
> +       if (err =3D=3D -EFAULT)
> +               return -EFAULT;
> +       too_long |=3D (err =3D=3D -ENAMETOOLONG);

nit: if (err =3D=3D -ENAMETOOLONG) too_long =3D true; is just as short

but also you are eating any other error, maybe write it so that
original err is preserved as is, not special-casing ENAMETOOLONG? if
you get EFAULT later, original error still takes precedence

> +
> +       err =3D kallsyms_copy_str_to_user(ksym->sym_module, &ksym->sym_mo=
dule_len,
> +                                       m->modname);
> +       if (err =3D=3D -EFAULT)
> +               return -EFAULT;
> +       too_long |=3D (err =3D=3D -ENAMETOOLONG);
> +
> +       if (copy_to_user(u64_to_user_ptr(usym), ksym, copy_sz))
> +               return -EFAULT;
> +
> +       return too_long ? -ENAMETOOLONG : 0;
> +}
> +

[...]
