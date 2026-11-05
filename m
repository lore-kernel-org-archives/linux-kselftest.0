Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793917931;
	b=TWibeynPITXuq+qx6r/P3IDpgiDuwtSd+TJYjd5tLH79YNy0QvGs+Vr5g/IMEr5YNu2E
	 2MuPvTZ1S7B/y33fZYnljgZoCU0Y45fhQEIz9mTFUXDZAwCCVgjPc4FvkVn1uFovypdgb
	 qKAaNfE94BOL6uNqAAbw9VSWxycQEa2OPyKi4V52F1TKxAjIyQ2daI9gc6xIkd/W8A/ac
	 h9XkmZuamu3vhIM/8rvr/XRqloRRaBNIcYdCQEXbA/a30Hh+TT6IjOovvu1a+ESgHHCzS
	 Pka51H+7tIhUMOVfE3pRUkF3YG6WIhQ2fdPRlmGMrMVVQggmzRprilUubKGQY+LpD7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
	b=BE9WMyMLz6FAj68/OSvNG+CfIxZJlKdIsWih1VL/pnnOPqz52ZHfZRcwQ7A3HmNXdEwU
	 JdFhF5lTcEvBtoLYFfI/z0aX/HxZpDDgMHGQt1/pAV0ijYeSV4PiognUCN99bKv6A+zEJ
	 eljZ8aEm74+heyT2Su3qKVQEDZA0Y/yA4wM4JwOQM/gMmWWxgpoxJvoyjC5clswjWXvx8
	 8bdzgh65F1uwrtwezmR24d0+bJwfTbMR/8mE9PaIU7lxj3EihmC3SRM+jW4Ixi9ajEv92
	 Y4U0ej2BKoThprocLBEyPaSEXiyvswRReVnjSAlStvwBNRvIFL0hw0skNEuBI8nGAoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh+RrIwy;
	arc=fail smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C275606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C275606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh+RrIwy
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b2382bf051so661056b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793917930; cv=none;
        d=google.com; s=arc-20260327;
        b=GvtmEOimBIiIiTmFF/2EnVwfnfAvU/ql6LXoryzAHOgmNwSSzcMM8U4ykwZvgEYr8d
         hh/dtzkaRXhzOkvAXVB59DNKxi+TiU4KcAi69HJlOyxsNB3A+kuD7gsG/yfQ4xyywp8l
         NIvZKyN+0J81GpVV6ZxTJijOlXzc+uH7Ll38a6MyuaXqmIoyww6QgHsObSToxJ5DNdWu
         hQGxZhxEXsOkX40C25XNAyz4dwoAMWdJqnOMokDG/VuGbrF4MoMd7HupvarA9OwDEx1/
         mv0rAnbi/fhVcVkjCR46Cmkty8LSzfI/psuLvHB2DYy1+5oGtyB4yw4yfd7V62y1f4xf
         JpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        fh=iDTyxlelTpsSS+jYp+k0iSu1AmEMF34s4coqe8DdgPY=;
        b=o5JIlHhxf3UgOQryE0bpCrDXZBgOgDf55VZULYczptM5QkSg56U2urgemvEanxXtIt
         vodzsP4wikhwMyE7vbWaSM7R5LF2qetrRJ99aSyj2Vsszfk0mVwMY9pHjhMgWSC1mOvn
         TCKhsBjgQWqMNF4mselMnLb96b4vR8Mp2VVHF0ppx3Ej5dVMhjgOVXMU4rISSrGKgNVX
         5G53r38Pi182S0DrPDK09tUPo4+K51K51UnMkOAGMRlOWLC1MCn6QWZ3wCX8T6xYw3TV
         OZCLB4S5lYw66WXw9KWcVPnKucZfFdN/ETniTGIRV4Zmd82zlBKXfsaaJ5TjBIW3rbSJ
         a72A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917930; x=1794522730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        b=Eh+RrIwyRW2pLFAckDF0MHCbB39wfpgowwsx1EjCEg4TjglDCPKN/+7ORVBplodNEl
         jPsuezn9sp+54nY0YFIN5id6tKlbCmtePGeBOzUEgEtD3zRu4wGuAGpQI9AU5O9H/OG2
         BPrZhYK4c4JMn8PnVzz5wZtQIKJrYDSceGNLApikgEpvL+Cm5kmuYnC7eHy1JGXZFMxb
         f758muqYNnvb4aLtbgJMg7+gE4B3HhSKAGYRVp57kx0wCQq7XDhPMG4nfMdkf23f4ouv
         mOvK402Ka+ie5oiUrYTV9bgBNPGKvXrkXueKKPphc1LciwU9R0c1CRCypkNY+ZaDHYvD
         3AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917930; x=1794522730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        b=yHU19AMphhUIvt5IeOH62MGkcQdegNBG+RE5E9vRcushDBhenoS4WBiCteyBhxr9aW
         S9E3dp1aLhBcLqgqwL+gzHQjzZTn/Z+5BELvd9sJPf7/eTmCq+OBTzey5eZU4h4eS7Px
         FGVRfVLfj02NWBJA9eWGrUh2j5v19VQ00yWkohOAzMNxmMCbMIUltH1vs3d358LiQnTc
         JF3fr3UXxndcnlf66J648uk0FRXXvjqly8qyD3TG6f/XLSCCcIq0Rgv+CBUfk5D8/ZML
         VdBZDOiMHICYL2U1h77WrLJpBu/OEOP09svnufFTaP/sGQR6o8WYATv6bvucfm5QMU8P
         4zeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4/gqIjCIUP67sKLv96Zt0U9omDd6wi7oPXWnIsxxFbs2HBOb/Nny2Iq1rCAo57aBxpIR5tomlPhuf6qyKzI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mKKoa5BqnVp30XoIX9rBPTv5fQy4BsiXLqAmJGUGQyHEgXP3h
	VTG5QdJVvUk8dCTGax7EbkJKK1sKE7LLX82XnnNyFhhoopuRdiBWu1vFPNoyVjznM1G9XoaEliy
	uBSjANFwpf6EsexH31R3ydMFkl88r30o=
X-Gm-Gg: AYBFou3+o/wkJFtBFx5UlXFa7RVLbyxs9w9KdalQ57zpFSTHKB8Tw+OWH5Z9cG3LZxY
	i1WaKlTDitFk4U952fgfvXFVUEwrZ1Dp+kHFLe/k4CCVI0exi3DtpvQ+G7vpZ/hdADG0Hn99ezX
	o/w+lyY/jtO2roTZeMngJ5oge7hDcPundA9pbhVKrUZ8boV41rndJjtpY+I/V0+dK9oi+6qUkJ/
	ttfokHRP4RA2LXFDadwLkNvU2tQ4588qwgKM25nT319emK6CwEANFQicE8TF/t/hkM+RvGe/4kL
	617mfObVLtYMERKzvqU9wzc0T5BAP3frVfcqTuGhLz//JD46jRvKZc235A2qkiU3jOhXQ86IDPc
	dqFM8LL7qXS59B+mWsrFaWK/Odb8mLWrxuPUqc4qIxwmTSOJxAOV7H61yuPDUa4A/kAhXP9ME2U
	czKbeyGbZaRS2Ii1I7Xi9ADKPLtRA+sI8Alg==
X-Received: by 2002:a17:903:2304:b0:2ed:1f0c:d31 with SMTP id
 d9443c01a7336-2ed40e688c7mr9370095ad.59.1793917930400; Thu, 05 Nov 2026
 14:32:10 -0800 (PST)
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
In-Reply-To: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:31:58 -0800
X-Gm-Features: AclHuK8BPGpbYIUoL0zJXTIzG60i-gPbL3KKgBgfTHwRc2VAS0UUrPKJVoGciTA
Message-ID: <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
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

On Wed, Nov 4, 2026 at 4:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wrot=
e:
>
> On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 3 Nov 2026 17:14:26 -0800
> > Samuel Wu <wusamuel@google.com> wrote:
> >
> > > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > > <david.laight.linux@gmail.com> wrote:
> > > >
> > > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > > Samuel Wu <wusamuel@google.com> wrote:
> > > [...]
> > > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so th=
ey
> > > > > would be different symbols at different addresses. Please correct=
 me
> > > > > if I'm missing something here!
> > > >
> > > > Only that the user might really want one of the copies.
> > > > Sometimes there is only the copy.
> > >
> > > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > > pagination to cover these. A prefix query for "foo." also finds the
> > > copies when plain foo does not exist (expanded on this in my reply to
> > > Andrii's Oct 30 mail in this thread).
> >
> > I'm busy rebasing my patches - they got stamped all over :-(
> > I should get a v3 that applies by the end of the week.
> >
> > I will add a 'prefix' variant for you.
> > The 'next symbol matches' flag is exactly that (actually it is a
> > this symbol is a duplicate to avoid issues at the start of the array).
> > So in this case that application would always need to read
> > the next symbol (by name).
>
> Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
> approach so the two series stay independent, but I can switch over
> once your series lands, so there is only one search over the name
> table.
>
> > I think it might be more sensible (less pitfalls later on) to return
> > the symbol number - not that of the next one.
>
> What pitfalls were you anticipating? If the current symbol's position
> is returned, userspace needs another ioctl() call and an -ENOENT
> check, to learn that there are no more matches. Alternatively,
> returning the next position means every call pays for a look-ahead,
> which for an unfiltered query walks the module symbols even when
> userspace only wants the first match.
>
> Andrii, do you have a preference between the two?

no perfect solution, but given you don't always care about duplicates,
I'd probably return the found symbol's position, which can be used for
further pagination (if necessary, user just does +1). so, let's return
current symbol index, and have way to say "find by name/prefix 'blah'
starting from position X", where X will be previous symbol index + 1?

but tbh, you have to write some code on how to do these "typical"
queries and see whether API is convenient and meaningful, hard to know
upfront what makes the most sense
