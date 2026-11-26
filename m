Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654409;
	b=dS1udcabEs5YFuin0npS/86lTUcgS0Utb78GEXOmYwKN0acUmhSQBMwmHuiLafMnTKwX
	 GwxOZM0jFMwXfcwaNPgXRLrVQL1ut+SYSnKG1UCwmzgHdrHFFCUwP0yJuCXWUuj7y6LNm
	 xayK8bw/M6FrWmt2WEQgqzENGuO6xM+Oizn+whba9Adpt+1ArvkmjleXNQLrFJP5IuiER
	 i9QxrIb3CvFyNdZvVAxUhS/iAkpiHX/9Ss6uDPi196bePpddabi46kWLoztsnlOJq4YVZ
	 /neSXvElziltiqQ/jT25WJuq6WBQm5EPg0yBrF26252VVAdLkQt3y7CCTZzRXJVOgXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
	b=gk7XpgQRYVPpLQH5RZcjiTaWtkqRv1js6Ft0Nyvwpus+cgUeXVAJfUpUw5F+2m2uKBZ1
	 HhGk5fQgGmZ/9+pZxJFUYQ7RiuDdGeIKTY+4rdON1BoVAIC1arAWl/29nLDTT7uhJu3yf
	 4BqeKl5Ad8kgYTgZslpYPVjXtAwFMEoJBwPbJrSiSefGJjJdUMvHz7R/TkmLv8I7aLQsg
	 /qmT0sO1qqs3+vmw+GElvmT3aHAjJhqHSuK5tLLAJngq/5NN2Enevk10a5N4USBZb3Ymv
	 CS+v52QwvUPKL3zGXj9o5sY1AroOXvVlG9ejUN2Ul1lPdfwr0fESp3VTplaX2XuiEcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMbLOmTg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F921606A337
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 00:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F921606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMbLOmTg
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1038065366b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 16:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654408; cv=none;
        d=google.com; s=arc-20260327;
        b=Q4It6JJ9Z4bOkO1YR9ZbKl1ABzp46bsB5yyAvQ88Y9lBV9LBmCzg4amo3dV40DAcza
         nGLjugijySHPZ/zyHcTZMPAgcvbOcxQBAzWw58il3SjARpM43hVqLWYG6lXZ94hF0dNB
         PtEsDFnYZqYwMK8vw7+45mLcHRy4GdL2jLcMthmAmBll3zqGRqvO19QfdYOpuv1ZzH8E
         5pIny7dJeXVD88KTWTu1McLz8vhI0aKauCFNEofLcUR/N9KUXn4Xd8KEfVao+cxTCqZS
         JJAxPYE1w2ncC5X00Hz7hHMjlsizLLiv1TrQB+/t70i0kA4v66g7pcdDQZ+MSLfGVZTM
         lQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        fh=gYdBgLKSatMq0j3QtYs0NNlZMzGqg/5uJ661VuuvJw4=;
        b=DII7MkYdU0T0HJVXr1mGqMWzlahHMRCrfD1RlMFUwxMbHVoEBQO5h97LMQov6l7hZ/
         k3XvlngnTnIrJdkJS55ENziBG053V0FqJkXNXfYsMWiIosGFGChG/e/xN64lv8r8zljV
         Uc04dBtpbwpHWy2CVPA3IJR3iD5zElTvRfTiWT/mtPyB6s8qAX0D6DnAwDYOaZDVj6t6
         lq98s/UUlvA3EjCoTSb/tyevVGaagUEdvnAwSCFjt2vWk9u47FYQojSUSsZ4zA8ChZHa
         e/avvnfxiCvfW7LvMYQCHTqy0IbVq18slZibliDRfysfM8oH9OilGqj0MTY8MyUpgZNz
         zjCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654408; x=1796259208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        b=OMbLOmTgwkBLdVF5EdkYSC2XrgccLIkkqOXgyFgiuHmBsv8YiKTp9E0NEIyhirgYwo
         BZ+ApH53YZ2KTVkaJNbDjcMue9DCSXid0Du4+70qfpSn/U6BPQcaO0rTHvaEKiMrhjq+
         cgrO6KnCn2xh6qE6NyajQBDq/7N3cmFb2502QyBeGyuN0J8TZ8STFtPa+xPXpE5PEied
         9EIDboORco4TC6wv1vXi5MBxzHo/qEkcV1RPpsCU6P4rl7yl2ijcQhep5KTjor4bMPiQ
         FloIu+x3tOotka6vXyHSWrSW9RsgR8EkvzFkVBto/arghTtNsJHfG3gnYoPBAaEQS9BY
         49RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654408; x=1796259208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        b=WNwz78dsVKJdCobgHCml13D8gzj5xksIn45V9BZhRzNQSYL42Lyxy8MH2OCcuiJ0ph
         gFGixKwtxTKsdDQqoBSQWYHXkRSBvsUAM360Z7ruHewn5bL4ejoG2SNSW5/6hCnPzlsm
         ToyCCosk005SBRuO55vzIr+6ToDq+YHiT/Uhlp4Ht2ynf3BTld6IHddDAnO6viWo4QFK
         5/yQaJLBeTMhRHXQm2QI1zoLV0c8f4vduTE+a6IvurOPRyBaNsiebIM3xNCfHjZXt6lx
         B80WgL7ThMC8132TSyxOpzg96B3kAxqiCCooU2jXW3R4C+M4Ed+vOYdAkT80JQy+X0Al
         cUCw==
X-Forwarded-Encrypted: i=1; AL+hErE05X2RPYXfQhJS1OygQaCsdpzad6AvQlAfxxBwcAHjyU7+OMIh4ZbQ9W1rvz1PHOtXXYM0PwjhKjfBp0B55e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bx0wGQJIEm0RTGQDmbXRqFZa5pw6ZrbEt5IG5aMTtfDL2xQDJ
	CpMaQNRu35mhj3O1PwTJguu6vec5XuV4wb98PRacvuCnY9zd6WQIfCWRDZ4Q90wFu5IukKBEyOy
	F/Ii5YpTd2ry3SiBpQAVEUzZ6QtwfzW0Y9VWVcUWP
X-Gm-Gg: AZFdTZeSvjprfbW5ZZXRkWSi2zMnnTYG7yIiZ6Er3ltCsQb+zk5cV+ZBZ6xjboOR4d/
	QiQO/pXTJEnfw2SWIrSYNVTFXfqG36P0EBzipGFP6L+xZNxLluHnpcPaGnRt/r53vpi9lh3YdJ2
	FwBQtXFrivcA8jpE/Esdr+ZrgZQ8teFNDwVRynuUyw+KuO/uTe/Z0Q7miKZIqtGKue89/1XIuc3
	3CJKElQn+Ow8i8rVlie98zMqH9bWeoDNBMvqb3ruppzNDkHF3W8yMvn3ycRTna3xGSa+lBA+NHS
	uhaMgtUNxCOKXUWj3lYqaaz+iz9BXI+euX44ZHtOeUwhm/6x5xc7Gvq2mi86tnbMHelpecf3jte
	Rz7V4QZLG114XxuVkUBzcPGJKiFXNRinIwsNxjGPorgSzZDUSvNFdwAGxfsxmC7SD49U=
X-Received: by 2002:a17:907:c643:10b0:c2e:4292:d27e with SMTP id
 a640c23a62f3a-c513a816d3amr1138026566b.22.1795654407168; Wed, 25 Nov 2026
 16:53:27 -0800 (PST)
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
 <20261113221248.3535369-19-wusamuel@google.com> <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
In-Reply-To: <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:53:16 -0800
X-Gm-Features: Aa3M54rfuKAHSB0QMI506grzDhwAStyJm9gAvy8QXVpNXfEJd-B8LId_HiOPEPc
Message-ID: <CAG2Kctq98pvyV=jmN0Di+p7m0AWQKg8+QF5YBvdLi79kTJaKoQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 8/9] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY_BY_NAME ioctl
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:25=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > libbpf parses all of /proc/kallsyms to resolve typeless ksyms.
> >
> > Use KALLSYMS_QUERY_BY_NAME instead: exact names, plus "<name>.llvm."
> > prefix matches. Ambiguous matches at different addresses fail the load.
> > A missing strong extern still fails and a missing weak extern is 0,
> > without a text scan.
> >
> > On any other error (e.g. -ENOTTY on older kernels, or -EPERM), fall bac=
k
> > to the text parser.
> >
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 99 +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 97 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index 44134421bd7d..f3f3475a64d3 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -59,6 +59,34 @@
> >  #define BPF_FS_MAGIC           0xcafe4a11
> >  #endif
> >
> > +#ifndef KALLSYMS_QUERY_BY_NAME
> > +/* 'f' is PROCFS_IOCTL_MAGIC */
> > +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, 'f', 48, 0=
)
> > +
> > +enum kallsyms_query_flags {
> > +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> > +};
> > +
> > +struct kallsyms_query_sym {
> > +       __u64 sym_addr;
> > +       __u64 sym_size;
> > +       __u64 sym_name;
> > +       __u64 sym_name_len;
> > +       __u64 sym_module;
> > +       __u64 sym_module_len;
> > +};
> > +
> > +struct kallsyms_query_by_name {
> > +       __u64 size;
> > +       __u64 query_flags;
> > +       __u64 query_name;
> > +       __u64 module_filter;
> > +       __u64 pos;
> > +       __u64 sym;
> > +       __u64 sym_struct_size;
> > +};
> > +#endif
> > +
>
> there is no need for this, libbpf in kernel can use kernels' most up
> to date UAPI headers directly, and on Github we sync necessary UAPI
> headers into include/ directory, so libbpf source code can be built
> with latest definitions of kernel UAPI. So you can drop this part

Ack, will drop entire #ifndef block
[...]

> > +
> > +       while (!ioctl(fd, KALLSYMS_QUERY_BY_NAME, &q)) {
> > +               if (!ext->is_set) {
> > +                       ext->is_set =3D true;
> > +                       ext->ksym.addr =3D sym.sym_addr;
> > +                       pr_debug("extern (ksym) '%s': set to 0x%llx\n",
> > +                                ext->name, ext->ksym.addr);
> > +               } else if (sym.sym_addr !=3D ext->ksym.addr) {
> > +                       pr_warn("extern (ksym) '%s': resolution is ambi=
guous: 0x%llx or 0x%llx\n",
> > +                               ext->name, ext->ksym.addr,
> > +                               (unsigned long long)sym.sym_addr);
> > +                       return -EADDRNOTAVAIL;
>
> I think there is ENOTUNIQ which we can utilize here

Ack
[...]

> > +               /* Check exact name and then LTO .llvm.<hash> prefix */
> > +               err =3D query_ksym_by_name(fd, ext, false);
> > +               if (!err)
> > +                       err =3D query_ksym_by_name(fd, ext, true);
>
> err =3D err ?: query_ksym_by_name(fd, ext, true /* lto_prefix */);

Ack- will update in v4. Thanks for the thoughtful review!
