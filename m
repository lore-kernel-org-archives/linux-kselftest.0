Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793914619;
	b=EEEuM4O3hkdDDFQO/3CxrkgIMQNtrkOLyArnpk4Q3Esz4DViS6f5Wo9iAXh8KjscRRHR
	 Vg9CL7t5KDbumW/uac3k4as0Fg5biGzTDcRppUMhdH+CcMgbHfVDQS19pj1Be2dppcG3Y
	 DJuH5uw+z4jdNh37UZ+6iUIjkOiYqyHro1p2Jnf2M2s1A7CVF2UYt6y9y3tisuDGY1GeW
	 20nX9vZ81aN/U3aIErRFCSOLxWOYQYe7p4dIoMugomqavacMFVNZPKFzkCoyyqeP09Jdu
	 p24YTsIKNZgHEtMyy/lrRL5fkD6Tdf02p5O/QdpuakeAGzR5q2zFkLwpU9EdCV9KDZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
	b=zXFUe940gl80o2ms71VFZKGEOfvOzKx4f6mxL5OzaAWMwh90JtVlSDGyAA1od02BbagS
	 0hcihGp0dSXjYveGh7lPtqj/LD3HiAu59Bvb/YHOBWfTvITTPffsu0OxZOsuXrvugZbR+
	 Auj0ZgZMkAXeWmzkMio7Lg11w5LW3CM241fSsL5GNEBII+ZkEGmzXjmL6JumdGmm8xaM5
	 ZehNLligTj0R3svewIzdsslfFip1m8vY63dwhnLokSr6DV/YrcGe4YT6biK5wT/vu0U3M
	 QOGfoPagx1t6XRHjo6ppf4nr8CPH5cxRWnBPuhkfk+e+JUhrfi++j3JRawIMD0SeR2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qNV3YK2A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA95606A33C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 21:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA95606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qNV3YK2A
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40f29667e6so374095566b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 13:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793914612; cv=none;
        d=google.com; s=arc-20260327;
        b=RK0/0OaEXqFxshMre4tgZZhB21vyj4MnnO5746BPCjnLoaTt6/ZGXofCe9ZacBMNqI
         0AJ7P21nzANSOhCnREH+Ofo88jqX8zfNHeCzr02N9qunFkNEANqirUpAa94VM2CNpaU+
         BFAjiwTtj4EWe8rxitNnoiFZOx1Oy5jDnomAT+LTV4Mxui524k1oyL3orrWnZJw0oA11
         6yJDVkZq6xImHrfoQ2mkpHGH3ZrBQzNk8a0Gral56qOic31a8fIsPXgAnOBFOgQq5Wbf
         +Iuo1+HuS+OrV65/7RwMdD+w7O823yqEbQ90fYa17i43xsUmGzjmbqdiX+g7humGYJOE
         VMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        fh=Jz5hvbyGjtBeCqhatqfoFZK+rfog7RYL0Z6E/Cq+MYM=;
        b=rRHOuuvLlMop3nkNkOQGbWtEFVas84cU6w8bHCOOQFhLoenjmxajVcdsRhvzEuCUJw
         kbWnG1wVH4pf96T6h8agwh2v+yfRGkbmEdgh3BWuRHCvzzz4hYqB/NGW43SkOWrl+vVX
         dLH9YLqlE3UzXkqDQNdnyGGnGTczQYfCMY8cfh8FyosvVBDZEBqpqbtRaj+rzlz25VtX
         Uv3IVYSatNqdoMkjmdC4ebLwIpUAek26f5wGl0FSB/ukcyfIqtaKOuk1mQAo75iBShje
         x5aORiSCAhtCLh6+AGX4Bt+tlVNWZ4F9vN2skUcTfi7gWYVcVNZiqFAhGfbdjER3JrVU
         n2YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793914612; x=1794519412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        b=qNV3YK2AvifU1tOsCQ8wk4axq2Bpnp9T4w05lcq35MoN1lflDph5Y1IYtTpLN9oiu1
         oljv6zhoDl0Vdx6KwOE+YZ2XrvF12KIBahqeuzL0AI1Ihf1xglBIFGRlNFmbLRw1BvGj
         cHOsnpHe5ExcVUNebf5XytYqgD/im+o9YfI2/bO5gRjiKXBfTL4w9S2eMuvmZ4trc6CA
         kCNJxMHTFWh4eiUO3KMPLUXRVAjTsqzWtt3brnLtM+MWPucllL2IlplxbMf3C29B/5Fm
         Zq9m93kWEpns5SBYbYB5Q3+CTVkb/fUXg2wz7C4TsaW16nXsgwuTB3NnvQNvu0l335c9
         ZYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914612; x=1794519412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        b=GQqYqLWKIxT1VRYXZ12QInDlc83rTinagtcLceKnjhjGno7x52Pm6lRpdRWJQnu3bE
         BJEKCTMrY938pjW+PYV3hfQzMLgJIQVVbVkUdrEDUpKRDzptJyCi4mbdxm7kNUHrwaO0
         ROggyVEthanOfvFcxzPywuQJxSVdxpy5ZWDvpBWD0rzYyJiLT0/y670Kt/2/9U2C+XwI
         GbyGMc/6pi6s8OW+0sCAp+k2Nsdslpi4DgkNR/N5GnPfCrNCRQ7IojteCJwixbY9oOkV
         /aQG0IlnKtgpe2fkwRZQlZsCc7TUeJ+y8qCjVzv12kNjpkLKKlKIkPYEqAtBklzV6iC/
         z7AQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2tSgn0fsGMsfMLBziPEHsjjv1KK6/0QXk/mCzdGGbIHzRaRcyKpFD94ngk7S3ySnOhTL9S/33Xwr/I4WgTjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X+VxSfzT6DczT5lUIGDAVH32oMx0GmuYgAePWZV3or8wolTuc
	pnyoniAxsu4Go/nVMCFneaz5fxx+Q0FOcUkvX6ZgdqSrtmGvwCtobXe1GvTM7kZsVx6xs/vrP2H
	yA2ktSpgRH5e6wl/2fXGLcI2lTAu4sgu+w8azoXA9
X-Gm-Gg: AYBFou2OirYNU7wLffOYkude+Kuu8bX/yeplfSNl4WL6XznKfamCpKDfg7vPkZaYN6l
	Gd42IY3vAkqIL1ubzteQvATv9wtnSxF6qIrMRyovIT2yR95MViPc9P6C+h3CCjX9RchgKcGqHks
	8xrXN+KhAG934/Al0ymljNsCOy2RNgkeT76JIPT2HKF47OPZj9kipwSg0PVeEGmWeSm6q+2ics8
	LMVVRZhtx2ac0l4mqCppGLUkKZlAaTNJiKUTsI3IbMROugw6FM+gjnD6lWh7qTqef4k28BfExRC
	QqqcJvOalBYzJI1ShKK2oBsjjAc+njY6F3fN/rta+wOm7/w28cLP4JdFmx5bEkwFhZDqAa1DtMb
	o41oGG+KhhTobyH6gJBctw5+/i/uuRlXfAuii5V3wVD3XTBL/JzLmwSX6y3wFb0zgrBbuEjQ=
X-Received: by 2002:a17:906:9f89:b0:c46:645f:cedf with SMTP id
 a640c23a62f3a-c4d3546bf6emr55329366b.15.1793914611758; Thu, 05 Nov 2026
 13:36:51 -0800 (PST)
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
 <20261105083712.14847dcf@pumpkin>
In-Reply-To: <20261105083712.14847dcf@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 5 Nov 2026 13:36:40 -0800
X-Gm-Features: AclHuK-4-3cdEVpuwe7ZR8h4IzWEsLs5z4V7r2FIsMuL4z-PpEQaIZ0fXLkqICE
Message-ID: <CAG2KctocE=kj2CO29D0tVmrBeWmCDYA6FhpHr-7ZbD63GM1CsQ@mail.gmail.com>
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

On Thu, Nov 5, 2026 at 12:37=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 4 Nov 2026 16:05:52 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > > I think it might be more sensible (less pitfalls later on) to return
> > > the symbol number - not that of the next one.
> >
> > What pitfalls were you anticipating? If the current symbol's position
> > is returned, userspace needs another ioctl() call and an -ENOENT
> > check, to learn that there are no more matches. Alternatively,
> > returning the next position means every call pays for a look-ahead,
> > which for an unfiltered query walks the module symbols even when
> > userspace only wants the first match.
>
> I was thinking more of the kernel api.

Ahh ok, makes more sense now. I misunderstood your previous reply to
be about the ioctl(), not the internal kernel functions.

> The 'position' is just an array index.
> So a 'read by symbol name' would return the array index of that symbol.
> A 'read by symbol name index' would return the name (uncompressed) and
> do the lookup (binary search and linear scan) to find the value.
>
> I've used a bit in the 'sorted by name array' to indicate that the
> symbol is a duplicate of the previous one.
> So checking an 'exact match' for being a duplicate is cheap.
> But for a partial match you start needing the name buffer to be in-out
> on the read-by position request.
> So you start needing 'read by position' and 'read by position with
> name compare'.
> It is likely that the caller will need to validate the name anyway.

Got it, thanks for clarifying! That works with QUERY_BY_NAME in v3:
- In the UAPI, the input query string
(kallsyms_query_by_name.sym_name) and the output matched name
(kallsyms_query_by_name ->kallsyms_sym.sym_name) are separate buffers,
so the name buffer is not in-out.
- In kernel/kallsyms.c, the vmlinux lookup only needs the two helpers
you described:
1. lookup by name/prefix -> index
2. index -> uncompressed name + address

> An 'interesting' idea would be an ioctl that returned the value of
> the nth symbol along with the name of the n+1th.
> That might get confusing though.

Agreed, it's simpler to have the ioctl() return a single symbol.
