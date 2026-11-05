Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793837167;
	b=SIC2qjmMkvYSmbMver1wt94xQhYgcQJZqvWBq3WyHfx3T42QBsrriPlOR+Djf3WQsd89
	 BZQc13BVuxUXGoBXlg8hCQtFvA5K0hlmmPUzP2/7R1WnSYbEujSjH1BJEDPqQzJ7zFRJi
	 S6yrosgiCaBvdLCRBRhb/64c0pjkElXR+SRtY2k+Q7a3LaJZo22o0bIu+0A2yrEe0nzGr
	 1ZbqB8gSnl/yj25fjIqbC9otPLxchduRatIcl7ICsFSRgGZdUHyVyv8R4tC3cu8CV9VtC
	 fQmPozTOLcfZiGhj/qkzNU9dhVfLP+zRKQ6OFdF2hCwyEq3vR0q/8EdW59yKAMWzoFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
	b=d2MjER45Hh8Ws2FcY+QcynaYJzU+1roCqDyPKQ0AKmYkZktGSMIcGKo7PKNDdQyxhPl0
	 mrBHXt/Xwbo2dtM1G38KM6TARQlut3s7sMywJhETQjBJJrldtlzk9sjoSwx9vftV0bZ5C
	 ftQkYxKHJr/CLcAowzkcY5eFyu38xr4w48PsLehGIoDSTckN1fpe1b5POQbBLwxIEbtAi
	 c+WNooBuci91HFmSwRhsEqj3oVSCk02olrjIJmnYSrYY8imSU1qWES0spEnC/hyIcWohr
	 MQyn/qcSJ2KruqXu0WC10cQL4vo19kyQ5otEOC9w8fDaBB8JCqH/Eoqpn7FBf+IhCVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UW7+Lg7r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0518606A32C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 00:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0518606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UW7+Lg7r
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso218045466b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 16:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793837165; cv=none;
        d=google.com; s=arc-20260327;
        b=E8BAAhOo4MIk4vaXxizUenSvE7sAhCcasReu8udlc9YETPZavlZnjBKhIVBkKrchA4
         sbecWpQgFidi8+hpXH6TVbbTUzfZqpxRPj0MX57/rjvZ3uE2/KR9yFqTuUKGn9HgiRZ5
         2WnWARtBHL+W+0i/DFZTskBtDV9M7UzDZbe0SNxbCdIJwcpxRWmRNe8rJfPknkPRuFTQ
         3oYcPPocc+969dXIBy9O+QBSq8irn4pUTeXSnKkAZ86Dfnla7JWNkWv/87YaBt34wPrl
         w2fc+trjMlHaWEjNU/PVq3llGzTCiQ7jOfGCQWn0L4y5vrYr+PzBCm801fOzOTA0FbuE
         hAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        fh=GdhI3zGLpzXsDe4aY5L9UliuMSnAfou9sCj90FD8xPA=;
        b=NcU2UyG6KlLbplb38oAy+ZmXiMXg2/RUfDrHg8VGdJAoCFwTJ878DH5MZwB2Ui6/cj
         OyFoz60/dAJDdIuiJmOoLJbffSfnE+33OzWniNGDG+uiKwA9JTFlGJ1XSQLd0DFqd7+q
         G13BifC9wJ3kGhMDTvFgUHu717Zx1quw63CamXzu2IOQ9mADplGlr9LGlTCg8Has2B7W
         MeQsjTJI63qIGfVY2+azdfC0kO3F767oxZNyp5Hzao0W+rvUpCM1OgeWIjgesZTDdozT
         dqsumgXyob4HeDiimUOYIfMFMSXMPGm8Nr3+/R/UbIQnJzpYnwfqCXhFAXNyu3SAaTFD
         tFJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793837165; x=1794441965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        b=UW7+Lg7rFdK2cPOSHdibyhfqd0mNfE52oRphbaahRpCOHjIZJidko9tTbllyzCryjy
         siNubT2yNT8UsddMzx39cRlaaf4u9pnE+6dIm/dTOyiVwyDFMyx/T503O/SAkgV4IgXs
         efUG5InyQPdPjXkVj3FyrgQw8Tp3Uwud4aaLkD2TGlBzm2pE66Yo0XieOJu07M7lI+DV
         gUkNX9hygDXotIY7g19Ob5YY4jcsnCTMlsFTY/Azp5LW+ukD9CKA5AAnTO8zpTJXxWqx
         5Vgp8TB7FfNb2pRMsONUAcd0wfnBxqAeiMrEDvVnn/35z4BZWsrn2RkRHETiQqHGP/C3
         KXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837165; x=1794441965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        b=nKtBNFKGhQoCns4bpXglzLiR2L9vORXMM2AFbbpxBnbHL8MXCTyv4SMKevjg4O+SnJ
         uuNV4JcSmRPXXBBau14s+kHLrJq6J57VOXnZjSG7RZdxdQLzeQdFSoM2+rVizduPwulT
         nauA/O/LPnR8ApuV4Rpli3fGJ4q2cKlA6i/ZjrcTjmi/Hndsqk2pXjba7TF5HpJEN6Qq
         tBR69FK1qeg6L2ixpBX58y6ksZcumRHoSFqY2Gg45cWjkj4XK9K1te1i51LJn8BB2ugy
         HfyII+V6WZTBimLdkoREsspPZDGFdi0ZjzdGGMS3c4YCC5ogMZHoicOMCskJv7IV4tQD
         gJbg==
X-Forwarded-Encrypted: i=1; AKwUvByhE8eQad3nQYi3THiSlU4664uO4E39yiezoIrJcxbTCUHycTko7FOPY/t9DJD7tc+qI6s/4ZtGWczN7Sbx1fE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q2DucRAZ8grw6jP5RjmmeKPLfkbWLJkS9CalMLt3n0reg7Wge
	0iL+pDookt3/DtA0n9WNjU1/VEw4VnPPXWiPPOJ7CTwpoHSX/QmBSzodeiMFDLzoYEJZZsPyk0J
	9BmK/xpRp9TVl1FQKxJoGt95RDlbUnNoEpuxQdGap
X-Gm-Gg: AYBFou1TYczT47xp6Ubqb15Vj5F90qrkgZdwMl4ZinPmJDvWaJe3qvxyvQXYoHTZ+vz
	IiX9iNUHFdrYgg7/ljANBsyXq+KfLA6y1VJbbNij7zpNZAIdPj0wfs3Hq+dSQBoND06VmOtsSlo
	3Tr7NXjsH+Zq3EjMca90SEmNQEqcsKO/K3jOIFd4f8Ft7ujHi3N6dzKiHg39NxLnXfi9G/zCh2A
	5csZ9VTVesSPHDEqvXuUjC7D/nArjzXSt/Mu2KJXB47P+/puS2rEh5byP5ABEFTVRyS1B+9hKeD
	26WIfSrd25HzjlODNJAt1j7UqgDn5rFx1TRKBH4XkUint71fKHOqHp1k45h5daoSV872P8U09we
	3FYtNoH5AhENthNRulDCtBFwZDC/ATpHX4zYwG2s5kEFU0UiXAAFVGRj3ggOVoEP/ux2nW+A=
X-Received: by 2002:a17:907:3351:b0:c4c:b560:2a71 with SMTP id
 a640c23a62f3a-c4cb5603d9emr979541566b.36.1793837164883; Wed, 04 Nov 2026
 16:06:04 -0800 (PST)
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
 <20261104142307.431fc12f@pumpkin>
In-Reply-To: <20261104142307.431fc12f@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 4 Nov 2026 16:05:52 -0800
X-Gm-Features: AclHuK8Z7yNuvzdyvQXTyXXmXbvszi-XVmOSWc_IPj379xX-z3zgWWYR8Kt4UgU
Message-ID: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
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

On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 3 Nov 2026 17:14:26 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > Samuel Wu <wusamuel@google.com> wrote:
> > [...]
> > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > > would be different symbols at different addresses. Please correct m=
e
> > > > if I'm missing something here!
> > >
> > > Only that the user might really want one of the copies.
> > > Sometimes there is only the copy.
> >
> > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > pagination to cover these. A prefix query for "foo." also finds the
> > copies when plain foo does not exist (expanded on this in my reply to
> > Andrii's Oct 30 mail in this thread).
>
> I'm busy rebasing my patches - they got stamped all over :-(
> I should get a v3 that applies by the end of the week.
>
> I will add a 'prefix' variant for you.
> The 'next symbol matches' flag is exactly that (actually it is a
> this symbol is a duplicate to avoid issues at the start of the array).
> So in this case that application would always need to read
> the next symbol (by name).

Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
approach so the two series stay independent, but I can switch over
once your series lands, so there is only one search over the name
table.

> I think it might be more sensible (less pitfalls later on) to return
> the symbol number - not that of the next one.

What pitfalls were you anticipating? If the current symbol's position
is returned, userspace needs another ioctl() call and an -ENOENT
check, to learn that there are no more matches. Alternatively,
returning the next position means every call pays for a look-ahead,
which for an unfiltered query walks the module symbols even when
userspace only wants the first match.

Andrii, do you have a preference between the two?
