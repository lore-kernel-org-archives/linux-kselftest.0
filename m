Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374533;
	b=mPzzr09jCTDon7QkF5ehu2qKenP+321CeOmip+gQGZqyFikYAwx4zgNKMlca39F3GrQ1
	 jyvZTrJu0FypseuwM3jQlAY+13Rbj3Yd8fSBil4SxZWZ3qrjXEKiCOGxTsp8dvEPYB/RR
	 kpy9Hlx7VWFl5Mp6Uy0rtz7XyHhTUgQXqRXA3v+S5iWYabspcSfDDXIyDZ1aJJYTf7auE
	 6DnDRqqYwwfHwPuwfbzDoWCpXZn5jiANoyPeWpSytSZ2KLK/2CZDvplPJXCwtXoWBBFin
	 eN9kDYm97Y3xKm7FrWE9n+SJO4112po6XFTfWyLWtLhoelANUlQZexsdILfPf7YZlcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RFd8QlUF/2f8EIujxTa2mmugUe04z4PT62Q1oHJNdgA=;
	b=ct8ErO8Q30c8jav8hctsf6O4Dm7EtiUN6L3TAAh5BCeICwRH8pr/7qjLo/Vzzs4DMxVK
	 OXQL0iwHmUDsVc30AiqjPq3WyFUtdpDxY4L51GM/1+HGeCZ302+WPrxX07FRBxLaDgqKG
	 ByqmnFhEekuZphkjhGqyAuTcED83lGioNUDEBVLTlvY952eyBSld49WWUkGm3fvEnLwE4
	 rRsXPOVNHZeYQfjksYOIhzdE2vQeLe0VgmaCHSTEaoa8sHD6vtFOKsj3HrW0YN0ynxcia
	 OED2lD8NQ7hiHM+vvvS33zY7+Ax+UshDwn4/59pALIEv11tjAPjx7D3+JGmteJCRN6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjGbbE3X;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C5606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 15:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjGbbE3X
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a208d93758so8893095e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374531; x=1793979331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RFd8QlUF/2f8EIujxTa2mmugUe04z4PT62Q1oHJNdgA=;
        b=RjGbbE3X8BPclL0e72nIXlgY9hYoB3XaopldJs3l7cp6GLmip8FPSNV6VGCzcTSu2T
         bJfC0sWgzYmHCLlD5CShQg0a48xOaPVY65ALbgjvFv7y5y4OyjfMrFZLeFok70kdKqvJ
         9Lh2Ix8F152sdvnrSY5XZRMZde2U7ksobftizu3b3zCbfyvl+VU8o1WBAfUao0aZS5i0
         BONczumcBtnudzqXOBSk+HZr2Hg9qV0E9p2nhcBGrw6Hg3ql+L/ilNvi6sxNDA04JU7L
         bkz3cQ1uWupdjMbFiJzT9luwq5GQXyjs3Sg1mnhLt8AezCWy67N1bhlRjGaeT79xFjVw
         Q6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374531; x=1793979331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFd8QlUF/2f8EIujxTa2mmugUe04z4PT62Q1oHJNdgA=;
        b=df/Us5ZQ5JfxxS0VxFewNPcXZkdMjdl5vbceEtGymmf/phUZLRvigJ3FAkwhepGdJp
         3MTUJnlFLXabozN5bL0FxB+R5zqEci5CQiymgqQjYeVE5PMc4kY4Y2XgnjifjqZmeoAm
         dNe+0uhwQ3HLRW8R7wxEGuJacVCUvDtZSLnyF8BXaV+JKdk1sURJJa8f1+7E8EaVz0bc
         JiNQoYkoSGykQQoBnOna6wswuwpjfYR9jbuIS91+MCBfUQ0QDzUeosLp3bQjS7Inx6JA
         ODQNoqRJUbR1qAuHYlZHIYWDoVa9g+rS6BZd1AjOfxggpiU0TdjWIw03hT1rH6uuMgnh
         0HFw==
X-Forwarded-Encrypted: i=1; AKwUvBxvkZj9iHnAhCKPMbb8pSyA1o/0nPR3Jw1SXf/ZVlon5Hcj6mwau1NQNK9UyF6peWTGClA+RKrsvh0L1ZrsZ1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp1t71hCZV9BzBCkvjjBu/Iyd8s5c1Bhh3GpK3ia5rQAd98aqj
	Orf2uZOJV6hUhDfv3pIjF1WB7z6wgxGKCYea5Dp4fX/CmJCerqlZ6aLa
X-Gm-Gg: AYBFou1+4nLwZbfTIEnBKhxvngtgnkfwvuo8w7MwIDFtFbQnb2ibmQFzAqFMIfvXydG
	VYZrVfVoYZZ8BACxokxEvpQZmqX70Gx7X3dzv9bZQniVsPdQnEOOFTAs6ouuG1+VUPw7RPxmwAC
	PkBTgZbU3UwOpkBXZXAmsQiDuKJvTeRdkMX9oK8WR/+C4rOfpK0Xl99zHYygT31gUbu0kQMjKYS
	zM9M7K0kqCxbSuRWbt+RyzhUen1TBL1LAOmlOp2ZTgKJAKn1amWCImLSgiKCJ9j9B3wl1/BvglG
	nZhrmDfarV0iHsEHlDRrKQCmiTGn7JRBTzhPV4Zza/zazmP5c1ixb94lnmZiZlxPVVDqctUEIun
	Op3sN+83Hv7CJWqUMftCmyVpj5b885WyMhsBJC8ng4rRUMosZWGKsX7jx3BKa+cHXwmxfan725Z
	xIWTRCMfqXNKG35DgYeQTfeveiLfWn70fxQM5eUsHeOXALwIoZ1zAK3SnYpBQ9kbBjo3oXHeye2
	OpH95GUh5EGQwLlWz6NufwyFdekvGVW8Ruiq2Hg1mOluFK3kuBuYSMsmiOGcXXKMIq1F6O6Hh6W
	L1wQJ1E/z3dFWGkc8d0L0Yv+0YiUxCtwHO+EW0G2QlEQytCYIWH/ebGDjkbKM5w/Pg==
X-Received: by 2002:a05:600c:8b85:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4ac14fbdcf7mr54356935e9.4.1793374531121;
        Fri, 30 Oct 2026 08:35:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm70755145e9.10.2026.10.30.08.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:35:29 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:35:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Samuel Wu <wusamuel@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261030153528.0d5113e7@pumpkin>
In-Reply-To: <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
	<CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
	<CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
	<CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
	<CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2026 15:54:01 -0700
Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:

> On Thu, Oct 29, 2026 at 3:36=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
...
> > > > Makes sense, but I'm thinking v3 doesn't need pagination or batchin=
g.
> > > > I didn't see any performance wins when profiling libbpf, and it can=
 be
> > > > added later without breaking UAPI.
> > > > =20
> > > > > on input I'd also add module name as optional input argument, with
> > > > > "vmlinux" limiting to just vmlinux, set module name to just that =
name,
> > > > > and NULL/zero meaning "we don't care" =20
> > > >
> > > > Makes sense, so here is a possible plan for QUERY_BY_NAME:
> > > > - Optional module filter: NULL =3D any, "vmlinux", or a module name
> > > > - Returns the first match by default (vmlinux first, then modules).=
 An
> > > > ALL_MATCHES flag searches everything and reports the number of matc=
hes =20
> > >
> > > searches everything as in all modules, or you mean just full linear s=
can? =20
> >
> > I envision ALL_MATCHES to do some form of lower_bound() +
> > upper_bound() on vmlinux since it's sorted, and then linear scan of
> > all modules. Of course, just one of the two or both aforementioned
> > things depending on the module filter (any, vmlinux, module). =20
>=20
> no point in upper_bound() if it's sorted, you just start at
> lower_bound and go linearly from there. I don't think it's realistic
> to assume large number of duplicates, so I wouldn't optize for that,
> one log(N) lower bound + linear scan will be faster in most cases,
> probably

Doing a system call for each symbol is probably fine and scales nicely.
Just return the symbol number (in the by-address list or by-name list)
so that the application can request the next one.
While the application probably isn't interested in symbols with a
lot of duplicates, some symbols get duplicated thousands of times.
So you have to allow for them.

(My kallsyms patches get scripts/kallsyms to mark when a symbol is a duplic=
ate
of the previous one, but after a short linear scan for the first it falls
back on the binary search otherwise looking up some symbols takes a long ti=
me.)

...
> > > > =20
> > > > > tl;dr, this is the right direction, but I think we should polish =
API a
> > > > > bit more to be more universally useful and extensible =20
> > > > > > +
> > > > > > +#define KALLSYMS_QUERY_SIZE_VER0       40 /* sizeof first publ=
ished struct */
> > > > > > + =20
> > >
> > > [...]
> > > =20
> > > > >
> > > > > PROCMAP_QUERY uses offsetofend() for the last defined field, any
> > > > > reason to have this #define and BUILD_BUG_ON here? =20
> > > >
> > > > David pointed out that the size field in struct kallsyms_query is
> > > > redundant. In v3, I can drop the size field and use _IOC_SIZE(cmd),
> > > > keep the *_SIZE_VER0 define (since we need minimum size). Perfectly
> > > > fine to switch to the PROCMAP_QUERY style though if preferred. =20
> > >
> > > I'm not sure how size is redundant, I don't see ioctl subsystem
> > > accepting argument size as a separate parameter, so the size has to
> > > come from the user and be embedded in user-provided structure, if we
> > > want any sort of backward/forward compatibility. At least looking at
> > > PROCMAP_QUERY I don't see how we could have avoided it, so not sure
> > > how we can do that here. =20
> >
> > My understanding is that the size is encoded in the ioctl command
> > itself: _IOWR() puts sizeof(struct) into the command number when
> > userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
> > header the caller was built against.

Yep, I think that was added by the BSD kernels (but not SYSV) when they
changed from 16bit to 32bit.
Linux mostly uses it, but not always.
If it were used consistently (or the high two direction bits are guaranteed
unset) then the ioctl syscall wrapper can do the user copies.

You'll find that _IOC_SIZE() is used in many places.
Amongst other things it can select between 64bit and 32bit compat structure=
s.

> oh, interesting, I didn't realize we embed struct size into ioctl cmd
> and match it exactly. I see that pm_scan_arg has the same __u64 size
> in the struct approach, I'd stick to that, and when we extend any of
> them we'd need to make sure to either ignore or hard-code the size
> part, hm..
>=20
> > That said, either way is fine. We could mirror PROCMAP_QUERY style for
> > consistency.

There is nothing to be consistent with.
These are the first ioctls for /proc/kallsyms.

I'd also point out the _IOC_SIZE() is limited to 14 bits.
There is much less scope for applications causing grief with very out
of range values - indeed you don't get past the switch statement.

David

> > =20
> > > >
> > > > Thanks Andrii for all the thoughtful feedback!
> > > > =20
> > > > > > +               return -EINVAL;
> > > > > > +
> > > > > > +       err =3D copy_struct_from_user(&karg, sizeof(karg), uarg=
, usize);
> > > > > > +       if (err)
> > > > > > +               return err;
> > > > > > + =20
> > > > >
> > > > > [...] =20
>=20

