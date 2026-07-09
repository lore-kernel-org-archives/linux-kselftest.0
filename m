Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D43F375F65
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610033; cv=pass; b=azw5fKMdV7X9d2TnjDp84mMJsq2rmJvpSN6K/QAs9AlFJX0nx/sh9jY9dYrbc18Is5vuItLQySv+9E5JeUZLaAFV++1LjsjafNDX3vEWG99CFcECV6p3kPbBo/2HPW/Ukfzn4BhRUtoMOjJoRzxPndd99qEuGg3LOeD5vCQZ/OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610033; c=relaxed/simple;
	bh=lm+iwZuldvNfgm8Lzbku/fwQXnHvxwIB+0za3JCHtHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dt0vpwVjQUBijgtE/TUQoXMUE+BLSaztMDYZmWIoiDNRo1vab61YwDuXyCOVkb/8RrxfMUCDv7zd0+M7WuT2pJLOMABsLkuI7OWHcO1D+bldSu8qXZpB8SLRde4tJkW2VhEGs/cMGN6zj9hrygr3+eUGC4ynwg+Sw1BKUm1K1h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZShSS8r; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZShSS8r"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15f47e6297so2373566b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 08:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783610030; cv=none;
        d=google.com; s=arc-20260327;
        b=HPQhdKUJNtah5UHVrhNgdMAGj86YgHQu7emhZiCBMzOCrP+NyVklYQNRBFleywzbAB
         t8AHwReULXXi56+MZB7yKLA3CSquy9zOxfEOGJKJnEIgOyVlFW/oYXqdCzvcozQl6enW
         GpNNbjpX3zGLHchpAPF6cmMr9LrUaBk7KRdqDsRMmrLzaXmB/vraSVyixKhGIWiy62BN
         rcRHe6mwdiuI/7wHsgj11t5p71kky5JS3wdFH2KMitfFRIBRRypBdaE3q9b3Rlxdfi+7
         NSDGTa7g2RzWUG1WIUI1NdGQ4yiljHqRi8rWHqGHrDwLuwP3H2PDimguzyF1RNENB/wH
         OcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lm+iwZuldvNfgm8Lzbku/fwQXnHvxwIB+0za3JCHtHk=;
        fh=x0HoQvV2wthJg7xh/Al50YqfyxL0Hg7JZMcYPJSLxgc=;
        b=TwHQxAZ6sRMT7EhUOesh2LP5OqxsRCN7M3VaiDxGGBXWkf56xrz6uf+hcYo2jxIrac
         o8R4uEAISafDM47NpxxwwV8vBlCmQikuThU2t9HJL3BT4hjr9xntsQC/q4eFGOQdCTek
         i3r7wYMXyOCOZ0p7xB4wdGD0Aja+OR+vE7L61WYLHrsNkH+giRG+VgNbWU0jcvp/Zh+g
         E9zC4j6sDeJxtXXDbsFn9vKnKMSbTw4Fp9/vJNqslvYVMvHE9t4f3KDQ1xUOCl2cr1PA
         Mm9smLw1LZqNDTtNWgLePGeCF7XbleFFsMA+pGEtJZJzqvHyDLGmgLZygE3N77x04I6W
         Coag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783610030; x=1784214830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lm+iwZuldvNfgm8Lzbku/fwQXnHvxwIB+0za3JCHtHk=;
        b=cZShSS8ro0THpxKUvnqocyUpAo9soBXcXvDp47ckLhenrBhPQ4tyd8EgkuJyqEpedz
         Oqy8pQnBufM2azAaXoVITXgjgXjm5gIRGUUctc3JpFFFt4lxLafzDe/H/TZPlx9P/9f5
         MKacuUcSnVUzfgRrbScM/zrSNXAw+G0+JCAwxID5SKn47zNpFcuB5R67QtMe6fugaxjW
         vzNrVUyE3/O4N/f4kQA/I3Aw3sm5YnTU4tWoHydMSFE/7T1ngHtUncDPtlvYVaz5oIq/
         XaiqR3rdwn7uMOTnzFX1ba4h+KnthRIOTFc+jdn4avr8ApxEuTrBZrt1XzHuYprYhRjU
         z5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610030; x=1784214830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lm+iwZuldvNfgm8Lzbku/fwQXnHvxwIB+0za3JCHtHk=;
        b=hyNLB6xa0Y84v9KmYL7Tm0pRyN13EKBeO/YHtrLukhdj57fRoICXvCBqZqkWD2V+P9
         qBUIEpGEDQtx2MkYqU0+4RzZQ8cQLJGZBWofB/h5dgWOlRfQcui0TKWPo90fd+CKJTU9
         q+JTSIav1cQD4pSycSp65oa2O5gp+caVOBA/DM52Si0XgWtLgUPXfNDpIq376CndptY5
         WXYSELFV8sTlVvooT/6x72yDLaK4BLwHqZjl5FqDvh0HknVCugmuqvYzGawjKdEKlrF9
         eBHS6sy60nnJbDc0XhqpshRNItqBXjLulRFrnYb9jYJGvRfFMXO1qdD43NucYABvwUds
         FP5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpGuhrA8ZZJYNmECnLQu1iGmPVrjKCqqG7HwA9zxLwTn6s4C/NAPYqzbm+THXQsMo8DJMNagWeyKmaMEAk0XlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEd2TDg77slKtzleXfnxQkuYsiANjfCVecX/4JAL1clHCLE3fE
	hE76yCCr5KO9Ka7Y3QD286CE2S5X0xXPBRC6ew7bU5PLvvEqwsrJa8U3lRj6WkdOssQlism3Qbc
	bgYZY+LsjQpPAn8Kh+w1A5GrazF9ilrc=
X-Gm-Gg: AfdE7ckHGZgi7gkhd70DmnAHfCjc0e+LmIjDCUH68Rcl1qinBaBfEmYbJhc9WJD3IUR
	XftEYP/IX/Vpo4zy+KffKhe94aVvpeuN1LWGsRVtZoZ5heaoVdsxJP3/hbqBbcPjSZ8QHFglFRo
	Ex2g46LarnGOR0KUeECgcrTFzxBS3XLunmPkRTdGIUfCbjEoXUUQBV98N8UtqXFZv1HOX+lH3DA
	sLcS5mBfFBcm//0V7gDZkWRAhbom2zF3Q/D+kADrMdrm+BgovcDg1lvSZJAqIXprXNf8lw=
X-Received: by 2002:a17:907:1b1c:b0:bed:19af:f89a with SMTP id
 a640c23a62f3a-c15cde8c84dmr329373166b.7.1783610029787; Thu, 09 Jul 2026
 08:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709101327.9508-1-royujjal@gmail.com> <2026070925-delay-gauntlet-bc7c@gregkh>
 <CAE2MWk=mm8_bkd54Gv1mdox6rfvx85Dd3AjOCxPz0fPAfyuWYA@mail.gmail.com>
 <2026070954-activist-left-8303@gregkh> <CAE2MWkmcQdhGp3LTMtpgAse3AFcfKcAcpQe89+iijfP5e0w_QQ@mail.gmail.com>
 <2026070948-lively-exchange-a458@gregkh>
In-Reply-To: <2026070948-lively-exchange-a458@gregkh>
From: Ujjal Roy <royujjal@gmail.com>
Date: Thu, 9 Jul 2026 20:43:37 +0530
X-Gm-Features: AVVi8CfKbtzcJnRxXIx3ULOTra4r8qYMzKp7zTKSzETyFRYKJOujtPr221wvxYo
Message-ID: <CAE2MWkn3L7V3x8i0F-soGLxsBBo_Umgs1pJ3FwCw1OW7=U55zg@mail.gmail.com>
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

On Thu, Jul 9, 2026 at 7:52=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Jul 09, 2026 at 06:35:04PM +0530, Ujjal Roy wrote:
> > On Thu, Jul 9, 2026 at 6:23=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Thu, Jul 09, 2026 at 06:12:40PM +0530, Ujjal Roy wrote:
> > > > On Thu, Jul 9, 2026 at 4:34=E2=80=AFPM Greg KH <gregkh@linuxfoundat=
ion.org> wrote:
> > > > >
> > > > > On Thu, Jul 09, 2026 at 10:13:27AM +0000, Ujjal Roy wrote:
> > > > > > Hi Greg,
> > > > > >
> > > > > > Please consider backporting the following bridge multicast fix =
series to 6.1.y, 6.6.y, 6.12.y, 6.18.y and 7.0.y.
> > > > > >
> > > > > > 726fa7da2d8c ("ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and sim=
plify calculation")
> > > > > > 12cfb4ecc471 ("ipv6: mld: rename mldv2_mrc() and add mldv2_qqi(=
)")
> > > > > > 95bfd196f0dc ("ipv4: igmp: encode multicast exponential fields"=
)
> > > > > > e51560f4220a ("ipv6: mld: encode multicast exponential fields")
> > > > > > 529dbe762de0 ("selftests: net: bridge: add MRC and QQIC field e=
ncoding tests")
> > > > >
> > > > > Why is any of this needed in older kernels?
> > > > >
> > > > > And 7.0.y is long end-of-life.
> > > > >
> > > > > And why, if this does fix issues, was it not tagged for stable to=
 start
> > > > > with?
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > >
> > > > I already explained this in the email thread, "Please backport brid=
ge
> > > > multicast exponential field encoding fix series to stable kernels".
> > >
> > > Sorry, but that's not here (remember, some of us get 1000+ emails a
> > > day.)
> > >
> > > Please explain why patches need to be backported when asking for them=
 to
> > > be backported.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Sorry for breaking the thread. I understand your point, I will
> > maintain this in the future.
> > How should I send the patchset that addresses the conflicts on 5.10.y
> > and 7.1.y? Shall I send the conflicts patchset as a series via a
> > different thread or how? I've never done this before, so I'm asking.
> >
> > Here is the explanation for why the patches need to be backported:
> >
> > History: The multicast stack currently supports decoding of IGMPv3 and
> > MLDv2 exponential timer field encodings, but lacks the corresponding
> > encoding logic when generating multicast query packets. As a result,
> > query intervals and response codes exceeding the linear encoding range
> > can be transmitted incorrectly. This can cause multicast queriers and
> > listeners to interpret different timing values, resulting in protocol
> > interoperability issues, membership timeouts, and premature multicast
> > group expiration.
> >
> > Testing: The series adds the missing encoding support for both IGMPv3
> > and MLDv2 and includes selftests that validate the behavior.
> > I backported the series to v6.6.123.2 and verified the accompanying
> > selftests. The selftests fail on the unpatched kernel and pass after
> > applying the series, demonstrating both the bug and the effectiveness
> > of the fix.
> >
> > Given that this is a protocol correctness issue affecting multicast
> > query generation, please consider backporting the complete series to
> > all applicable stable kernels.
> >
>
> But this really seems like a new feature being added, it's not fixing a
> regression of something that previously worked, right?
>
> WHy can't people just update to the latest kernel release to get this if
> they need it for their environments?
>
> thanks,
>
> greg k-h

This is a corner case when people set the query timer value higher
than 128. People usually use the default value and don't change it, so
they may not encounter this issue. But I found it when I changed the
value during some extensive validation of protocol timeouts.

If one host doesn't have this fix, clients will observe premature
multicast group expiration. For example, a set-top box channel might
disconnect early.

But we can ignore this until few more people request this fix for older ker=
nels.
