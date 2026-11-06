Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793930452;
	b=jiCbQ8GMe0vtJvggLooCOOlt3CQyTCF6Vy7QPOtEp6wT+IDwyvOtlciodiJG0h4LQTAI
	 MFQkGhM4dYmw3LzJoyItxj3Tm445OTXh595vtCuousN4olzlYQhr5whxeLs/rVzlrY9Mt
	 dmqXiaAp3bJbngSSTsF66toqC8XCntf/Pw5ma5RjI9CVf20iYfx4tuyweO5lyykHOxv7b
	 oPd7EgzU/Lhr3RnWR1mNYPq5ZCJukWYA6KwUBHj42ticEMpQVyBkz2BAW+ufoRa/gpxVI
	 XXCFPZwzuER9Zh2IRZtQWLfY2Qr7V3piduV2cJosj4j+5ExpzglZUsauz1R+EO6bt5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
	b=SN0MPTACR+NYyWIgl2rSyhgYtwRe5KhRvgNyss3ahuVO1xCIqRxgrJXeTeGTExGPOhUH
	 QBBhT+HXHY4b/xiSdkLJPo5HXo+3Wnpi+dGcBbNHD2ajKQIhydib/vDnVs+mWFs5K2lAX
	 gUiRgS/xeoJLcKJ34ZGHXBN0mzk6mlvm3eMkk4NZIrtH0m4RMp+jXm7ehWAh46VnfEjtL
	 nLLD0iBYtRz30G8VyH1CWZch1staMOT7Uz4GYp3w/f86MUmZWl/F3Ah7drm46Pt9qzm7K
	 yzoZTzBDp4AutT9UpAhsleCGdwSbx/gz4imIF0V/bas8v/1ihgW3gAOkCSMq6ciVFAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n0sfVB8H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD0B606A328
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 02:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD0B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n0sfVB8H
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c34bff61551so20454366b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 18:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793930451; cv=none;
        d=google.com; s=arc-20260327;
        b=ry2QzPLJTyU8mW4L+JCXl6sxpKu1bw24aIKeh3LbH8WNsPtTBy2peg+yjPOckUGNIp
         gflM2Hp8amxrgGAguyL+lGy8S6gtpk3Z8Bz6aXlOpBQQclN8yfsvRwKQpVGXBDYR4MB6
         fbiDTeZo77E9fb2xhch+GKUMkjHMPd7Rr+y6wPL0UDyYSVM+0I+RB14/IaIP9rIeCVLK
         ZlMoz4859ygXD0xvZ73JmWgAGlq9j3dtEWNrdNXjSEtR0xjD590LPxp4F64V1pI7+EHs
         ttv4hvM29ITTPS+tdJ/VTdV0YYWiA1JV6QZMNkxqCGySvBK4nprxeA543EyyUlMuY7OX
         9tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        fh=vbkL/BvCxMlIow4lgJWhNJrN8JP/XIjpiGd4SqNn6kc=;
        b=FV1B7rqfWqMnthrp9BoUZMrIjAdBWln7pk8KpeqsVgn9wiQ558kL3q9KE3mZfx0fIO
         qKN8EPBIbXH12yEgtn5R7QvdCYF83r5I6F9bkl+9eVXeHPhaQUpqyXI+3HxRY3dHg0jY
         CbumqnKhAethSyol1fIjJW0bwMdPKUMmdoN8eWLyWd7wfNYOWXVtADQlwgRr5DY+O6im
         Xj+12NjG5JwQ0ls8hGJmBCoEw3BmmHVpsga45RcibxzCk4jfyqWX7jC+AV+Eqcjqflg3
         FOGmPEN3VNAbvMdiPQmmPpC2Jm1kGBzhIktrO+CjhQK51BsQYUhd2NOfCrDztPQWXHBc
         dw7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793930451; x=1794535251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        b=n0sfVB8HDMUIuXTocfcJVzoho8pZXk6bz0tzYjFzYmhSx1pFhTaSZo2yumVp+d748k
         EF4jR91ea7ibNEGxROUSMHM011PgzTAI8L1qWD0ISoyr1JcQCXHPqNvsMWVFxbt9wB8L
         pVWLUNSqw5HdxDBqekaiiz5oT5qSjOrJE5ODDKZ/VB3w6uZmeyx/0kQYDZapcUrltRdZ
         8fR0loS/DvGXRU6jX9KX9o6p1Ldw8G7WKpqq2NCoD45ROybfLxtqHAL0Tx2xU7De+KLh
         gi5zSg4xLzZZYLvuMhcffDFLNETBzEZCobr2lGt0WTB8BXHid6mc2feh+qdplGHJNBHS
         He+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930451; x=1794535251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        b=rBa+qgHqqxkiAP/clmem035HOmVOujiO3fMOtoY9ToGy7QRcSvqy7vlvoivw4lTpml
         18uf3JL4howtSOdW5INvmLYL5H0KjxrgAI5a0N7kn8TPJ7uzS+nHipciarPEczljgC9p
         wlHgw+6GmybZ0O0le1nXUm7NCZ1umbYefJhDdtpCfdT5WSL8WbGnMSnUgRzYrbUifZFm
         Dau3tWZhATv19qA9WlJTBZHoZ8y2rXaPmteGg8pPmVTC/jFGOxl8yEJDyZWVht748JLx
         a2qI/yj9zbx/P14t2JuFNBc7Mkjio3w7bIJgHblGuPECrc6Hozb8eDa1LJ5Z4thY7J5w
         3TkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEK/Cre2o1+F9uu/aT9CVUdLjq1GDrfdwIUJIEWxj7ddwdZP09RkywdlQY+kzJ6kr1oJcHFusc+cVaougf5Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9att3P8FIov5tE/8ijmY3g6EPa2Tz4EL/h5gVpJECCQuoDErQO
	3lC6bzTMHjJ9UaXLcBDd6LaYfEQZccNSqzFvxWQoGDfBLKpjWkAqwZ2Vo5/G/JbrouOlbgKEwbx
	AbG03tXH4RoPAUbFdWAwUHSoGPSOfK1lLEl253NbN
X-Gm-Gg: AYBFou2noL6AmXTXiYlDUvkZPQOuYIRtpNhZWVrdSjBFLlYmk5zRxVjOG14mE/oM1pJ
	RNrPpTop1eI4JhKpptvrgF6cn23ezKY/Bco8XsUgfyMQe8JSlcK7D9qW/cH1XWJjsqZgwgEoEdP
	1y0rBDxpTVPRFKDwJrsDwksYRTTJBwzxCQ1reYgSkZuu7YoyH4EhWkGZIP6Qlwp6TsPGOq9Rzcu
	WhdByom12t4hL/kysnuoSjfazKfA5+4VZvF3h3qJZD6Xr1erJfXIUCkc6ukuMiDzb5VXzOFWz5S
	mDacYyC48B5ZIb/OUF3k2DN+kcorkeHunUFF7L8SxOt+xdGyQyWZf3E38AvSc27FTNaJAKFVAJh
	spUmrDbE43WHx1VAphc//yH2OhvoXGqFh6jWKGAldreZAuDmxl+fRutGkQidqpge02mCPYCw=
X-Received: by 2002:a17:906:ef04:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c4d3468f9f2mr101330766b.7.1793930450357; Thu, 05 Nov 2026
 18:00:50 -0800 (PST)
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
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin> <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
 <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
In-Reply-To: <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 5 Nov 2026 18:00:37 -0800
X-Gm-Features: AclHuK_AXTODf6fbRoRayz3qqp4e-qEs_ls_rSieFkkllrojC2ZFyUBK4KHwxAM
Message-ID: <CAG2KctpBEtBxwb6Tayg8z5na39TVe9GQ1+Bk5ts6eL7VaKjKnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:32=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Wed, Nov 4, 2026 at 4:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wr=
ote:
> >
> > On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Tue, 3 Nov 2026 17:14:26 -0800
> > > Samuel Wu <wusamuel@google.com> wrote:
> > >
> > > > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > > > <david.laight.linux@gmail.com> wrote:
> > > > >
> > > > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > > > Samuel Wu <wusamuel@google.com> wrote:
> > > > [...]
> > > > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so =
they
> > > > > > would be different symbols at different addresses. Please corre=
ct me
> > > > > > if I'm missing something here!
> > > > >
> > > > > Only that the user might really want one of the copies.
> > > > > Sometimes there is only the copy.
> > > >
> > > > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > > > pagination to cover these. A prefix query for "foo." also finds the
> > > > copies when plain foo does not exist (expanded on this in my reply =
to
> > > > Andrii's Oct 30 mail in this thread).
> > >
> > > I'm busy rebasing my patches - they got stamped all over :-(
> > > I should get a v3 that applies by the end of the week.
> > >
> > > I will add a 'prefix' variant for you.
> > > The 'next symbol matches' flag is exactly that (actually it is a
> > > this symbol is a duplicate to avoid issues at the start of the array)=
.
> > > So in this case that application would always need to read
> > > the next symbol (by name).
> >
> > Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
> > approach so the two series stay independent, but I can switch over
> > once your series lands, so there is only one search over the name
> > table.
> >
> > > I think it might be more sensible (less pitfalls later on) to return
> > > the symbol number - not that of the next one.
> >
> > What pitfalls were you anticipating? If the current symbol's position
> > is returned, userspace needs another ioctl() call and an -ENOENT
> > check, to learn that there are no more matches. Alternatively,
> > returning the next position means every call pays for a look-ahead,
> > which for an unfiltered query walks the module symbols even when
> > userspace only wants the first match.
> >
> > Andrii, do you have a preference between the two?
>
> no perfect solution, but given you don't always care about duplicates,
> I'd probably return the found symbol's position, which can be used for
> further pagination (if necessary, user just does +1). so, let's return
> current symbol index, and have way to say "find by name/prefix 'blah'
> starting from position X", where X will be previous symbol index + 1?

Ack, seems reasonable to me. Thanks Andrii
