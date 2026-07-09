Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9059B23C50A
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602320; cv=pass; b=SGSsFW1lxNj1XQKgG8YFSCJQdmHyPNdbDHlM+Oy8vR2IlmbN8QTXAjS3bauNmucBaRuE1eJWgp2WUjK9wfKxX+1KqDil+ZpTgtsU0GJpvapik0sdRv4PA/8EQIYL8anfNpimiQzdRSSBsFda6qPkWHzdLfCPTfg8i0C5wfu/Ahk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602320; c=relaxed/simple;
	bh=w2zFUzgmtAuk8hs2S7KZhdwkyppPnKoB5X6Mdgo9p/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvbDI8aSKyR7rehoGopsAFB3/Mgdg0XIjqh5+ixHOcd7O/3Z7qFkblWXhwKOoumjgEL4DkLxY7BXVDj2b7n/WCVTF0E4UdgsiWZ5si4/CZ0ocUoKyE/D1YAJo12m4iBRdEkqh2JV0V21Z4VumPPbAZbg1blMCjek5DsPsPI/fk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IShI0upr; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IShI0upr"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c029505b389so146486266b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 06:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783602317; cv=none;
        d=google.com; s=arc-20260327;
        b=R8paKEH2BmggRR6vyckrRcGbtEGYBeCyFVRUgYm2jA5I/c1CrK/cvC6UUi9dWdXga/
         5pLroJCgBDmQv40fU46ZDjnzGItlFLK+u7eZ+N+Bb3J5pxqxo6MC8e3a/rXqxahenKFk
         j4ywmCf73R6y6vOeD9GGyH5lMqGFUQUqIxkd7dBlCEOyZIZThij6VdPOv2p1GUmcoPNi
         4I/dfw1NWydPrnqwqTSIVSre8snlbo2P35uINKBzbNTmrXxyvHWD/q0bV7sydBgHGZtI
         PEQ1Zbh2aJHalQY+T/ACzuERE7cSw43JLHpLm/BxbKp2jV7ea9FwaYfHLf7ueF3h/djo
         W+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w2zFUzgmtAuk8hs2S7KZhdwkyppPnKoB5X6Mdgo9p/8=;
        fh=OcyI7KH3iUegT9nTc2FUnNa+y3lK1Hzd8gMQT4687Qg=;
        b=e3V/KVD412YpuqRSfTy1LV3lG5FBTs6kZjPX4j9201SaSfqHobFwPN1X5ZxrCFAHuy
         PpRHRq1MaoSFTI8WzmGPZiT3LZSO6vjUpD5sjQm5S1vLXTvDojLmYdg4sk/qk4Ix4DMf
         JhTKYu+CSNRMxzRCH+fQAROja3Uh3Z1R8RG10WqmBQy5rxpDMS/iliioB0ZzugpCODeQ
         4hBJT3shfOhvFpHZoZI3Y7ySHE9Dgnom7SRiWolLnzYNl5p4sCrWxmokr0S+buDEoElY
         K7SNw/QEsHn/IqouLIBSKCL5nknfPVPQmJgUMv5Hnx3P/Lf93iameVJNrNcH2XFEANAf
         /5gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783602317; x=1784207117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w2zFUzgmtAuk8hs2S7KZhdwkyppPnKoB5X6Mdgo9p/8=;
        b=IShI0uprFbe7kJ58S81204LrdNUpadM0QEWf1oeBRHmDRrOGgLGbwPYNyepVlqGj0C
         c2dj/56IBfIXJBT0rX2e9WU7UH4o9HgjJGVMavhDlm9//zxswr0RKAGKSI+v9KOK7q1F
         dTvMZlgag8NhcTlobH2veQ4PLjFEbjcZIKETddW1SmAT1DHj8jiuZI3cQ2qcPtd0QLWd
         ks5i6CRCdVbSUJcLbdd6hweDcrjbIzmEKq15ecTDW+ZGfLbZ1YgYMAJQMoFYOIzdzx2C
         XlIpTKvv9zVv7hbbFZqX8He2BZp3J3Vcodj8r9XtjIZtTsaNlHgTbufJCPX81YIdnpzk
         OMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602317; x=1784207117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2zFUzgmtAuk8hs2S7KZhdwkyppPnKoB5X6Mdgo9p/8=;
        b=cCWPx9OnaSa+KIi3pRGe41hPBkxa5hwyL/xud4BsAC8UkUDXsM3a5rlf8ssDSUqWvl
         E8RPMMB8KLSyq5iJqeYnwahf03tMXUq0kU14XwJxcbiznhRRYYsHfdPYTTswZREfM1uf
         87NXH967EICdgvjIEfF0hpUa0IZ2eYrA39gR0nAdiU58qOIK8U1XcWoXFPAY2T1beOmf
         JLON0gHaGn+bIavw8nOcUek64CgXsgrdkffxusBszFrKM6bEpw5nqnfGt5tsyg0MPlzP
         UIftD74CdSBptIHPrArFFCm/Ax9769jZp15fzzLD6abeYGHE6f/dA6U3/G41wzzF+FyC
         tvfQ==
X-Forwarded-Encrypted: i=1; AHgh+Ropgp+4icA3b2IssXPINRVWj6s4ceOeow2glawSJduX1BRTvh9cvotfJBPfyKKj4EPadKmnV49uGufJOfNoLu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLBS5ytRP63kagc/B2RIJFMljx3tBLEPBEvAiXR8TVlnw87RV
	3vqgLxow1rtfsHZdbN9+OT9JjC0WwsuCpXbDe5WoSBjJDTSFoLTG9vMa3t/acbckASnXsGSSx/d
	C2GYqQG5W9lh5rCLfsYhIaY6Gh1iMR28=
X-Gm-Gg: AfdE7cnk3IQ1rWTL8r94dltzRs8vM2zWy3XX6vkUiYXr0gh+oiLLm3+Ak8Ru6/B2fWs
	UZLF+x/6KVNEfiV1edXiXq6PhgtTfIJ1bCwhkrIyDwxDlSC92Iihi64Y+7x+hbO/td+k5GCGLKP
	jcOKyznVtcoexpdsNVQQyORNSmsDQG5zwpfMtpKJ6oKg8+q9kgPuPR9Yokg9uJT54Uc4tFtLNvk
	QgS+6TbOJBPHz+NghE+HyKNfuEy1luMZxj0PdTCoGzpRdWLvFw9trXy2euuoFcbFX0wr0fD0mWN
	DX+xhg==
X-Received: by 2002:a17:907:268e:b0:c12:4b0f:5d12 with SMTP id
 a640c23a62f3a-c15e77d185cmr145016966b.23.1783602316748; Thu, 09 Jul 2026
 06:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709101327.9508-1-royujjal@gmail.com> <2026070925-delay-gauntlet-bc7c@gregkh>
 <CAE2MWk=mm8_bkd54Gv1mdox6rfvx85Dd3AjOCxPz0fPAfyuWYA@mail.gmail.com> <2026070954-activist-left-8303@gregkh>
In-Reply-To: <2026070954-activist-left-8303@gregkh>
From: Ujjal Roy <royujjal@gmail.com>
Date: Thu, 9 Jul 2026 18:35:04 +0530
X-Gm-Features: AVVi8Cf41M_ijpHkKYz8M_XktE0qZUV9t_0z2x75RapbDuAjnTo52sPGA365USE
Message-ID: <CAE2MWkmcQdhGp3LTMtpgAse3AFcfKcAcpQe89+iijfP5e0w_QQ@mail.gmail.com>
Subject: Re: Please backport bridge multicast exponential field encoding fix
 series to 6.1.y/6.6.y/6.12.y/6.18.y/7.0.y
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux Stable <stable@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, 
	bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 6:23=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Jul 09, 2026 at 06:12:40PM +0530, Ujjal Roy wrote:
> > On Thu, Jul 9, 2026 at 4:34=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Thu, Jul 09, 2026 at 10:13:27AM +0000, Ujjal Roy wrote:
> > > > Hi Greg,
> > > >
> > > > Please consider backporting the following bridge multicast fix seri=
es to 6.1.y, 6.6.y, 6.12.y, 6.18.y and 7.0.y.
> > > >
> > > > 726fa7da2d8c ("ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplif=
y calculation")
> > > > 12cfb4ecc471 ("ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()")
> > > > 95bfd196f0dc ("ipv4: igmp: encode multicast exponential fields")
> > > > e51560f4220a ("ipv6: mld: encode multicast exponential fields")
> > > > 529dbe762de0 ("selftests: net: bridge: add MRC and QQIC field encod=
ing tests")
> > >
> > > Why is any of this needed in older kernels?
> > >
> > > And 7.0.y is long end-of-life.
> > >
> > > And why, if this does fix issues, was it not tagged for stable to sta=
rt
> > > with?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > I already explained this in the email thread, "Please backport bridge
> > multicast exponential field encoding fix series to stable kernels".
>
> Sorry, but that's not here (remember, some of us get 1000+ emails a
> day.)
>
> Please explain why patches need to be backported when asking for them to
> be backported.
>
> thanks,
>
> greg k-h

Sorry for breaking the thread. I understand your point, I will
maintain this in the future.
How should I send the patchset that addresses the conflicts on 5.10.y
and 7.1.y? Shall I send the conflicts patchset as a series via a
different thread or how? I've never done this before, so I'm asking.

Here is the explanation for why the patches need to be backported:

History: The multicast stack currently supports decoding of IGMPv3 and
MLDv2 exponential timer field encodings, but lacks the corresponding
encoding logic when generating multicast query packets. As a result,
query intervals and response codes exceeding the linear encoding range
can be transmitted incorrectly. This can cause multicast queriers and
listeners to interpret different timing values, resulting in protocol
interoperability issues, membership timeouts, and premature multicast
group expiration.

Testing: The series adds the missing encoding support for both IGMPv3
and MLDv2 and includes selftests that validate the behavior.
I backported the series to v6.6.123.2 and verified the accompanying
selftests. The selftests fail on the unpatched kernel and pass after
applying the series, demonstrating both the bug and the effectiveness
of the fix.

Given that this is a protocol correctness issue affecting multicast
query generation, please consider backporting the complete series to
all applicable stable kernels.
