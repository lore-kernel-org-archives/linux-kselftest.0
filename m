Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794885328;
	b=0aZyMYgWrsTY6WnDNE3rQ3LPX3JTWRsz2YsKfNtGyQCFx2O8vMP4EEnvHGCDspWhJfON
	 rxghrbQC2K+Uyf1w+NzfQxAPBhHmh+KfocRpPwklJp5T2p/Vtg55n6eqemNLBUlfGDF5B
	 7GGA7S03b2rzeF4QAI/LpL/s7M64zSrONRZI1FH1W/OrQ0BCnVm7ZpqvfUZI0XxMrD77Y
	 ttYPJx4Tq1g80XS2t62rC46ZT6TsoUWCU97WwZqPJlQtBlLLmOTMv2ke22GD0GjyDEdxa
	 iFzOYFJ3AOSlri+77v2tShdZGFR8Mp601HTs0O/ySiz+ZKS8VeTtroh64YY++LPQaFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
	b=yylyJPgJGZFXW+GnbviaPj456c+sOMtdfCBOIOXeroOhSUbqX9gZid7QA64yN97+HG7O
	 Nl0BO7zFBpS4f5SjgiT4+2ZJRk6uZVZw6XbrsLYB4dXMj74Tufut72iJB2mHcjnqBmP6h
	 8H7o0YZCMvCTTnf0LJ+l0DMXNbr4jSPAfR62wa1v7wknUtBDaqlxzntYei0msVfJrQ/EA
	 Et+irQXWYYzQdjma/r295kDLAFqOvkzQhqbboXtYpPAkfVkI6DFJMGVyBDNsJ418Xiacm
	 EIMZgJs9rapESzP8CACehiU3XUToPbKpOzQKc3TtkpiyyaEUbaTKpPMlEpawm4HH4lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UWuE0zna;
	arc=fail smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D83606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 03:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D83606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UWuE0zna
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso739290266b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 19:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885327; cv=none;
        d=google.com; s=arc-20260327;
        b=pxgLJRkctAFDTeDmBpGCfMAGRHcJ7Ce7tVW/veMEvxXUjin1glKts+yN5htpwApxbz
         VC9m9PBk7SeCc1wvOvSaOWFJkymradP6olJ/TImLHz6qvjl59Cp5L4u4lmyP5+r7RHVR
         RAdowTYX/6mVgmPE4favKCaWcsknkr2WKK2bn7gamt3vUGjlj8auYOJ6IZHXFiajya7n
         WbFsEzEUZ886UGD3UuFMtMBvvd+GpWmwu8s4GOt2EQ8uia/daptaJNOpl032oMgok3t6
         scfEip09hIVOCUyFT6qnWaGfAlnAr94Zd16JrnnHg5vqSvjQbGUD0mzjCH3p8CW9A2e0
         yPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        fh=Lezktgm4uTSVUYYeKSleg9Im5xR8MDHDyjmwGF8zznI=;
        b=pMV7PcmtU7pfRrXZQ436pFSKQDhEC4s5HXQPWRmTabdm1TnnOGPJlP1dq6DmMHoqTn
         HvIwcQERlsZxLoeeUwVUbO4aHOPvfSRT2OUmsmwy8tli34EkBCZgxcf0qjg9hPvgYa5N
         c52VQn2lT2TZdZSVztkavnyVNQr9xztFHfWsNMmSDa4yEZvuO8nSByurHViZ3RxsIKrY
         c+Mi2fNPiUPbyoA3meNXGY4r9i1eKnU6uVqm3dncPb3tsUFJqq8wa27MmpmFjyQFGtwp
         JOP57pKv9kiNQzF2sqAWX67mbr6hZF6Xxo2klGCmhdVp+RP5sOM4rQiKrZmRe9rIbtnA
         LvKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794885327; x=1795490127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        b=UWuE0zna/Kej6vRfmnnkBRPiB7MtRAOmWnZDUwfDZnARnTtWa0lZ918fHjZc6mu5UO
         /2+zJyxEYftdneZsscW0DL8Fvl081Y38tQO4Pv5tUIPYfcIIYe6CjwGLqcKBSst9Gk21
         HyjrRa3A/10hlqRod0LbCztyuvg1+0RmyX0gzRFwGRR3oqb5tPu6tQU03asd4m3tC1Ly
         2jBUNoTFraXXJMf5dSQasvoZ/LajiRGFP3fxeQbTALoTqP2ZEYO+PCEtWNT6HsCG/4y2
         Qq35/dZdjfO2Tkf3aMOsAIjY43RWuC/9l+8ADKlIptRxOOPmsxJVEZSYuAL1Y41KbuEX
         BlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885327; x=1795490127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        b=V4zkblwbrQfK0lmIbs7AKzre+QFoWu8u88pdYTTur/nQt25lqrq79uBPjGEex2dWbJ
         LA18r523kvdJHGtT+OCRi++31oHbbIlwZVHKD3X82cQgWgIQ83aOVKb+2or249NO3fz+
         2Q9Sjbs7b6A4h/wGVa5lfEIq2CvXycTJ6rtRC8P1MCAu+JQBKDhbiDRPBi8SIhDlVV+z
         HxfvYbdUeof42ENcJ+qJGvx4IkEjlA/YTK68mimG1eK5z0CV097XuULcttNqw588RQAk
         FaxqfJn4PpO0hZvt6OaVE1IMCLs57S7BJtRdvc+wQFoQvbXgggFF7FwAy3zKRJgQcDxw
         hMnQ==
X-Forwarded-Encrypted: i=1; AL+hErFcx6dk/2ObV8T/+wijiFb4b3o4jn14rUx3oOIzRGyiUOTAvY9Qm0bD4FGmygot/jyRcUMKoI4Vnz0Hpue/loc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D5DV5l5sy9oWH/JldqgQUkV4KRqbtRctXD8mr526G21Rgd9fl
	tNMDrSduIIek6Zg6xNsULsXpI+DKWhA2QZIBzNlOQgSN8ljoHabRK6IYv5M6fy+8fK6vpbirEJ2
	qAAA4eMKJFeKVX5zeOR9pXy4sQGGX4l++v9SULuJv
X-Gm-Gg: AYBFou1SfrLe4ww980e2oDuvfZI+bc2RSHXLq+GTwbI2RX6iiF/Q9wMziA1MsznkPrY
	um1RwwhASOFqrAB1nZ7p0ZMvvl8aKJ1U15PEEszW07UGjiQm/BA1FFRpwh68qZL90u+o2trf8W3
	WxIfKgu0MmBV172YmCvSeO91jhYukP4iNCg3+UBXs0TJdq8H//+DHtnzyvcsWUuMTRD9/GU3sRP
	IyST+AnjJzhtoSwS5Hz9PQWNc+2GQwK51p76d9MKB9XaKJTYZ6pSO5XbS1Nyq01w/ZpIHzxt9kC
	GXfhhyhg1yqxzM4D7gy6ONvqDYACDjZTP2gKAvBh2T1VDCtkTvvrGk3UIKbzqfLDP5Q1wp46ohF
	tkK+onMOnKYZtkzhsp5R6ckjT14zSplTqDeXaKXoLNip2KwQKjzek9pwTTzkYi8YpfQ1p+Qc=
X-Received: by 2002:a17:907:60d3:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c50968355eemr1101863766b.48.1794885326369; Mon, 16 Nov 2026
 19:15:26 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261115142431.1587690a@pumpkin>
In-Reply-To: <20261115142431.1587690a@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 16 Nov 2026 19:15:11 -0800
X-Gm-Features: AclHuK-iBEn00_VVuz6qjGQnwYZ5FRJ6bny3VEMRskBOJf02b9BDmwbxXueDduo
Message-ID: <CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME and
 KALLSYMS_QUERY_BY_ADDR ioctls
To: David Laight <david.laight.linux@gmail.com>
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
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:24=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 13 Nov 2026 14:12:45 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > /proc/kallsyms is the primary interface for userspace to query the kern=
el
> > symbol table. However, resolving even a handful of symbols or addresses
> > requires reading and parsing the entire text file, which is often sever=
al
> > megabytes and takes thousands of read() syscalls.
>
> Separate from this, I've wondered about separating out the /proc/kallsyms
> code from the code that actually handles the symbol table itself.
> The two parts are pretty much separate.
> IIRC it uses a static function to get the symbol type (which does most
> of the work of getting the name - which it also wants) so it isn't
> completely trivial.
>
> I'm pretty sure all (well almost all) the changes will be lower down
> the file than my changes and won't cause (hard) conflicts.
>
> I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
> in userspace for testing both, but had to cut the bottom off kallsyms.c
> to get it to compile with a sane number of definitions.
>
> David

You mean separating the core symbol code (top of file) from the procfs
interface (bottom of file) into two separate files, right? If so,
seems reasonable to me, especially since the file is approaching 1000
lines even before our changes.

And agree, even with both our patches, most functions can remain
static in their new homes.
