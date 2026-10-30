Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793385762;
	b=znkZLICLPQCOPTYJPGDjttD4WdrCLU+rMKksXqu81WNExzO7YfF/iPx9jfH9qdWthQ67
	 EzSBlDJbOjxdc3cpXTPEk/g0bZhNkVJtXWB1/+aNsuLP3K1QQ3E/NY1nSIZgMSriiRCNF
	 8QKSweZv7TBlP0/W8u2UA8Mt3k83zgr5uZqtxU0QiwSgwnIXmMDQDQ1s0Qliq9RBVSVEG
	 /Y5q4g6EdV681pY46N85im3TXhBbjqFjbty3D0/PwAKN9AmIPcxa/MIShVt/gfw1woXUu
	 gCbc4wS2+X1G075r+FukI205FyaghsG+v830qKlD3nShU4Xms0+Bp9fFJaoMAYtin0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ArYrG0SZmM4/M6BZSvCDJn/YoiUDh8QaQvrAG71KqZI=;
	b=n1i22Fk75Z+xvxbhM94xPLn0M4Ef8mG25jRvd2LwZhKqss5nuHPcV8qemmxjzRXtnVey
	 vdR5AVf5VmY1WdCVZYWq4JD+xPHErrnnJr/Espn0Miwcx1Z0vhL9Bp7MM1Y8jRsTBbNMr
	 Anx/HORyJaOQPO+/pV5FgMB48VUxlsT+uwLiNqgdfH0fS/UX/BGEdVpbgUh0ECNLhmziI
	 Hxw8H6UUmWg6UMkMKieW1n1T7zIV3mvlYpW1jzI8a6NKhanLOeagyq9yO7fAsePOkPSFy
	 boPoDpH/EprqFH/iv4Si3fFT9DRJlpP5al4SW9VKls+OjQ0kqOaF84h12QHAfcfJgpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilhiRFdm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7E606A320
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 18:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED7E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilhiRFdm
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso523719a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793385761; cv=none;
        d=google.com; s=arc-20260327;
        b=YTiWU0Q3qetiY4Zk3Qw4MWInhni4G+P2HhHhUN4YUnbJJu4aQScOMTSwKPfTgdPUck
         CBy5b1kZ0ZXa9VjvRpvJ8drIy6tTlDGeIcoNqcRMnQVnVsQhC7sBaumb0dWSA16PIaRv
         iKB19LnZWEJHm+346SXRqyM0lTBPeqQOEa9vX56krTZ1Sq81KM0Dc3DSYwEOZK9u+9U7
         /R3ui4vQl/WShvRaylcSrkSqdGKcHhofC6aILdXvdKhruAaMiy1bakXnID0oHpsp+8Ei
         vPkLT7rrWHRoBwfhKt63b7vltBL7wVs/tobzJW1VmbSHcK0aiSUzlgvnMH+pxHrSO7NV
         A1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArYrG0SZmM4/M6BZSvCDJn/YoiUDh8QaQvrAG71KqZI=;
        fh=GqhsD5jenMJ2nvCKlq34EICxaaGS5HP9ZhC4B/SlWv0=;
        b=ASop6UHVm7Cg6y5rpOedVCNQZjn4yO52pOnAncZJQDNvDRzLeXxsdmpxr8UnKKWH5f
         xTWn1opZ90AtkBrY7SiZxKwZb63V+1lyTWBj66wFUIYb/7A4z/GWskKqDycwZt8mdxug
         c3hhIutUJoN2iquw4aHgSp7xCnHM3BYoQbtg65V9IrXUFd23oo8fCiX/tT+KGy2NASE6
         sS5i+tNdhQ5hJ4sz2NthMHgcLfmUsLTufUl3UIqY/sF0qSzlWj22lN7Lf1ZWeGzpCcbD
         Zb/azHn6jA9HNmaliZ6em/khFTD84RcLfJs+tjlCi3Y55QFiGt4NxGbW0gibnqMoqn45
         yWoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385761; x=1793990561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ArYrG0SZmM4/M6BZSvCDJn/YoiUDh8QaQvrAG71KqZI=;
        b=ilhiRFdmDF7b2CCOVYg3yrhn1I/DSoWRa475WOgAruostyli6ZMqjZ8ESu/yy5CChS
         ORPsHXhLPSB1d8qNrTp62GpyH8yrD+KcK/Sl4X0TBIun9uQC8HbkSLeOQxdSLJiYuFMf
         XQv6Iyxweil5+vEvXvkSgud6DAU4epItDzW6UJ1rlDcLV2A5Mbef3YHl3NS1jQUpnBCz
         cXtS2Y1FhBsB8+HetmFOuYCQG3xb3XiaIZrXChQ1r6BwCboqJU6zWBFLaNgS9KhzrizS
         BIhSTD4xZXL4O7bpS/UEY3kl5bLzYJWvjxr8L2bxTLch81x4AItH1ByoYLZFjTdsOMix
         sxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385761; x=1793990561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArYrG0SZmM4/M6BZSvCDJn/YoiUDh8QaQvrAG71KqZI=;
        b=eDG8wEBYpATE01mmhxxVbLT9sPw80JNgql1drtUtSNVsM1nlErIvfcAAHtwVhUakYn
         uomBA3bYFKDmz2WuAIn27m9f6pPsLzIyskhUv2MzXuEMaLQJ2bs4rcNUk+MXlRpxhTst
         38obx6LWLa9Wr/Rwy2HctvCZA4j5oedE7o0+A45qNIuUpfYCVRg0V/pzO4SpF2fm/GbH
         2vXzgrsoUrMEJoGbDN37Levm0cyBTNSuDRSt1loMGIkqijlAMGDjTxS5/pDZu0GUjPOC
         HLwTTAbySZACkYle+wrcDpUHRWLvGCSi41i5JUeYZa0E/PdeHQbzH29bOxsDlCsPLhAJ
         VFkw==
X-Forwarded-Encrypted: i=1; AKwUvBwnVML2cDgBiBTKoV3qtNLL2h3XQxEaoOJHGExjDLjvZYEdZRcVNc7k9gtD7g5WBvV8LzA98rvu0sjyiMq3Eqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQTRuqu9zE6JmSLYhJP/t7y4BAHvACgjK6QOwtE7KID6RBh0QB
	dv9gG9LHiAD3jCCgE7p2/D5Ftyqw3PJznK4m1fQ+LK+qwnq1NigbrEyDKhshlVVTK6eWGbJmQ0P
	wLT7eVCiI6QAtq5vnefOSUmq51nfz4RQ=
X-Gm-Gg: AYBFou2FiqbgKTsYSgZFrBlXbGZZuWtByyGMo1b0BDo2b7Y3sQJtknCp1mhdIDjzLzh
	z0d9rqPPJmMbQGTRd00UetV7aHQsa9GRGjBTL2qho7V0FlUBN5vB4PcdJ1IPKexqw06cSvmtEk+
	OmtU6LnzE4vpFjcRB2w7XFJr/0cGNayQnMI3uchrOKZtQSQr+PwZgkDv8zeJh/uc6SFBPP2xXT0
	P7ncpCVpFc1jVVdyz+AzIFrxkuVjqKcozzd8m/gOupaieHZH9G3GJchTuGQfiLRKZVHOUziMlOW
	IRMeheXWAi9SffiCbIaaFSXC1dlWs5zl+V3R5fW5A+SCDoQp/Xnh5Wh0qH7tt7aQCWSDhA3k1QW
	tMNurwpy2g2mWZ6reU/aP1+rfcpWPcBF6DODymAHGeooifGJEDA7we88xGt+fxQFs5w1gGfYJrS
	WcM0EeK7lNWGdti4W9ITNZC/BaYAkkOA//wzwb+kfX8VaRe+x/ZZssikA=
X-Received: by 2002:a17:90b:54cd:b0:3ab:2737:3392 with SMTP id
 98e67ed59e1d1-3ae897a87admr2747287a91.53.1793385761164; Fri, 30 Oct 2026
 11:42:41 -0700 (PDT)
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
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
 <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
 <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com> <20261030153528.0d5113e7@pumpkin>
In-Reply-To: <20261030153528.0d5113e7@pumpkin>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Oct 2026 11:42:28 -0700
X-Gm-Features: AclHuK-VjFk5niMzo0il-rDmeKs0ZQg3btwvPCyolGTPblfqirktPQXtvuort7I
Message-ID: <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
Cc: Samuel Wu <wusamuel@google.com>, Jonathan Corbet <corbet@lwn.net>, 
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

On Fri, Oct 30, 2026 at 8:35=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Oct 2026 15:54:01 -0700
> Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
>
> > On Thu, Oct 29, 2026 at 3:36=E2=80=AFPM Samuel Wu <wusamuel@google.com>=
 wrote:
> ...
> > > > > Makes sense, but I'm thinking v3 doesn't need pagination or batch=
ing.
> > > > > I didn't see any performance wins when profiling libbpf, and it c=
an be
> > > > > added later without breaking UAPI.
> > > > >
> > > > > > on input I'd also add module name as optional input argument, w=
ith
> > > > > > "vmlinux" limiting to just vmlinux, set module name to just tha=
t name,
> > > > > > and NULL/zero meaning "we don't care"
> > > > >
> > > > > Makes sense, so here is a possible plan for QUERY_BY_NAME:
> > > > > - Optional module filter: NULL =3D any, "vmlinux", or a module na=
me
> > > > > - Returns the first match by default (vmlinux first, then modules=
). An
> > > > > ALL_MATCHES flag searches everything and reports the number of ma=
tches
> > > >
> > > > searches everything as in all modules, or you mean just full linear=
 scan?
> > >
> > > I envision ALL_MATCHES to do some form of lower_bound() +
> > > upper_bound() on vmlinux since it's sorted, and then linear scan of
> > > all modules. Of course, just one of the two or both aforementioned
> > > things depending on the module filter (any, vmlinux, module).
> >
> > no point in upper_bound() if it's sorted, you just start at
> > lower_bound and go linearly from there. I don't think it's realistic
> > to assume large number of duplicates, so I wouldn't optize for that,
> > one log(N) lower bound + linear scan will be faster in most cases,
> > probably
>
> Doing a system call for each symbol is probably fine and scales nicely.

Yep, I agree, for BY_NAME case it should be totally adequate. And I
agree about not needing to do full count, just whether there is more
is good enough, good suggestion!

> Just return the symbol number (in the by-address list or by-name list)
> so that the application can request the next one.
> While the application probably isn't interested in symbols with a
> lot of duplicates, some symbols get duplicated thousands of times.
> So you have to allow for them.
>
> (My kallsyms patches get scripts/kallsyms to mark when a symbol is a dupl=
icate
> of the previous one, but after a short linear scan for the first it falls
> back on the binary search otherwise looking up some symbols takes a long =
time.)
>
> ...
> > > > >
> > > > > > tl;dr, this is the right direction, but I think we should polis=
h API a
> > > > > > bit more to be more universally useful and extensible
> > > > > > > +
> > > > > > > +#define KALLSYMS_QUERY_SIZE_VER0       40 /* sizeof first pu=
blished struct */
> > > > > > > +
> > > >
> > > > [...]
> > > >
> > > > > >
> > > > > > PROCMAP_QUERY uses offsetofend() for the last defined field, an=
y
> > > > > > reason to have this #define and BUILD_BUG_ON here?
> > > > >
> > > > > David pointed out that the size field in struct kallsyms_query is
> > > > > redundant. In v3, I can drop the size field and use _IOC_SIZE(cmd=
),
> > > > > keep the *_SIZE_VER0 define (since we need minimum size). Perfect=
ly
> > > > > fine to switch to the PROCMAP_QUERY style though if preferred.
> > > >
> > > > I'm not sure how size is redundant, I don't see ioctl subsystem
> > > > accepting argument size as a separate parameter, so the size has to
> > > > come from the user and be embedded in user-provided structure, if w=
e
> > > > want any sort of backward/forward compatibility. At least looking a=
t
> > > > PROCMAP_QUERY I don't see how we could have avoided it, so not sure
> > > > how we can do that here.
> > >
> > > My understanding is that the size is encoded in the ioctl command
> > > itself: _IOWR() puts sizeof(struct) into the command number when
> > > userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
> > > header the caller was built against.
>
> Yep, I think that was added by the BSD kernels (but not SYSV) when they
> changed from 16bit to 32bit.
> Linux mostly uses it, but not always.
> If it were used consistently (or the high two direction bits are guarante=
ed
> unset) then the ioctl syscall wrapper can do the user copies.
>
> You'll find that _IOC_SIZE() is used in many places.
> Amongst other things it can select between 64bit and 32bit compat structu=
res.

I see the trend to stick to fixed sized __u64 and __u32, which allows
to not worry about compat. I'd go with that (we have used that
appraoch extensively in BPF syscall and it has never backfired, as far
as I know)

>
> > oh, interesting, I didn't realize we embed struct size into ioctl cmd
> > and match it exactly. I see that pm_scan_arg has the same __u64 size
> > in the struct approach, I'd stick to that, and when we extend any of
> > them we'd need to make sure to either ignore or hard-code the size
> > part, hm..
> >
> > > That said, either way is fine. We could mirror PROCMAP_QUERY style fo=
r
> > > consistency.
>
> There is nothing to be consistent with.
> These are the first ioctls for /proc/kallsyms.

consistency in the sense of these ioctl-based interfaces into
otherwise historically text-based interfaces.

I'm intending to fix PROCMPA_QUERY's embedded size (so that to
user-space it stays the same no matter the evolution of PROCMAP_QUERY
interface). I really think we should start with embedded size zero
here and have size embedded in query struct itself. This is another
thing that we've been doing in bpf() syscall for a really long while,
and given how dynamic and complex that syscall is, we had a great
success in building and evolving API in such a way that user-space
code doesn't have to care all that much about multitude of different
versions.

I'd really-really want us to not have
KALLSYMS_QUERY_BY_NAME_{V1,V2,V3}, it's just a pain for user space.
The evolution logic for versioning is simple: if user space provides
too large struct, unrecognized (by kernel) fields should be zero. If
user space provides too short struct (for initial version we can
enforce minimal supported version from the get go), then we just not
touch any fields added after that size. That's all there is to it.
User space, on its part, just provides its knowledge of struct size,
and then kernel will implicitly assume zeros where appropriate.

really, this is a good way to evolve API

>
> I'd also point out the _IOC_SIZE() is limited to 14 bits.
> There is much less scope for applications causing grief with very out
> of range values - indeed you don't get past the switch statement.
>
> David
>
> > >
> > > > >
> > > > > Thanks Andrii for all the thoughtful feedback!
> > > > >
> > > > > > > +               return -EINVAL;
> > > > > > > +
> > > > > > > +       err =3D copy_struct_from_user(&karg, sizeof(karg), ua=
rg, usize);
> > > > > > > +       if (err)
> > > > > > > +               return err;
> > > > > > > +
> > > > > >
> > > > > > [...]
> >
>
