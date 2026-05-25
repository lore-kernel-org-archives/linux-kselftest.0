Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7588837CD35
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707144; cv=none; b=nSGbUBovvA0/vlf0URuvTSfOoWqSpnDKTsdpcntkHg/DTWnZP5Cn/6X1EEfzLgrYVJ3jVokTMY1QS2eGnSzDCeVS4UNuttiwcWK0+on70oIlxrJMJ3Xz2X+6BGJi0Xb8RAzlCM1obRb9DWYSU1SFT+pqEAvJkNgJutDPXeQ1hL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707144; c=relaxed/simple;
	bh=SZ+zUNudkrt096Gdz0iDF1lErT6brB3WPLiFOP//PhM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K1S9FiSrIUVFwIOPIjzhCZXlG++bbe2AUSmsUXpNxFGfJ51zBWh9vRY77mhwMaTkCOxz9jHI9e2BnC2mAb1IWio572D2uuwBVjyTWypLT0upjAKWAl/rLIUvE9ks1yxd5jM7KzYvVjlP61uFcWzSdcQilKQbRmzkk/n2DNYvfaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyhRt6ah; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyhRt6ah"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso32243575e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 04:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779707141; x=1780311941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0xl3Y4FrPDJv34h/nBHUjimDrSoScpcNKErJrkWDkA=;
        b=dyhRt6ahx5PaNUVYvE8dhdacq7OIitg2aQaWl/baTAIU27SXzomRELHtsY1lIqLBTY
         blFrNQyHcUSMZAGBRttp4Xu3oC/ly+B7V7/LGvXLTk9CusGiBw/DhJdp6w96bkIrPFt6
         OS8wPnJEX4l0vaNEcANZYGciNO2RYbCSSmja89NgxFW3f10wfovSvBaRV8dPJzpxU8Bz
         nf3Y04Wr++qyjC/5dG2qmTGdRTns+fWMXAyODQdgvfFoNEFt9xD1nyiJgABvtCSUsDYp
         uZeKHifJQYCHSMO0LWrQtJngHQQco/8NzKicpaLMzBA4YjPNtVm+666yy4u51A35HTnX
         SJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707141; x=1780311941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N0xl3Y4FrPDJv34h/nBHUjimDrSoScpcNKErJrkWDkA=;
        b=VR3nhjJbQ3OYQ6gvd+nd1m/iZhgfGMd1+fefygCjdvcsqhxTL69Ev3k24/XWR8kLrE
         kEFhaoubwPTHrH0oZ8rmqL20bJ9AIgs/CdDSv/tpAGlABY/ODHeMHiHxJqMCIGrfhsek
         EeYoQo6rI+Qp3A/d9xN+l7oaz4C5zUddP/eL4vVpZ6XecA7jEUvHjV2AwaXp6BtmOY/E
         3Ds/04v/4vPY62mb21L4uDkcOtR+H9+75FW26n9uRzEeXKRKRUuXP0St1xPfxwBeIzpV
         pkFHmNUyNyFGU4bXC6HcAiiaxryiOZGRkwBytiKsLdyncQ84NFYGs8GBqqvWrwyl7nFj
         ZPZw==
X-Forwarded-Encrypted: i=1; AFNElJ+Au6lZZDcCnx3VPgEiZwihDsFUEwPGwiDsLDticjmX+zz8n4zzOx1tnUCz/cqluo8sCjbyeuSzrBgejfFrxbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRPFKQLn0ec6UzWHKoLKuLFra35I+yDdYB3rPL1bdrE3WHFgcy
	T65T0fcUj4pWsxFy8wZGJVQgBa97WwAyMC8QxCMiVfpq8u+lBxH9GbGI
X-Gm-Gg: Acq92OHTq4bIRgo6o+tPNMWbYpPCtNxWIw0d0WdaambVcNCWgDIVvYJ/wk3hgQgMa/6
	7aYU8zFlY7xthAgr2qOk+qqFFbonmMWSOQN1Z/v0+ctSPPd3WkQ4aGNMYQxcnM6ZM007LeB5tn0
	pd0Z60d0Ig97BPqI5ndlQZx4K1gUADEeAzrWxfAvXNiK4Qvw8mXBcWJxxTv4bjVFWY4thA1yvkJ
	LfXi20h+iImuHoYctMZ+Y/L/VJ2K9v+PzvQAt/8/QBSdSft7UjufdkmV2xZbYe8ktwC4DTgdtQR
	57J5q2Epkfe43wRi3rqjXjJqHu/0cMEvozhyB45XqSWfajqEDbLykJKI0vO/DJGjlFGr4SYwRIM
	e6EgxzW/X0kV5cUieqs/bGJeX0QDrv4USvxVCav5EqZls2pGHsBXx+xH4IrLsFBIbC8FatiJtQx
	OOahKf3z+/w0doDKdXyy6EgM3izdqf/Bc7UBjSHB5WwNp5gkTxFRfu7hPSsi/ZP6Th
X-Received: by 2002:a05:600c:1393:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490428e0bf3mr230908635e9.31.1779707140700;
        Mon, 25 May 2026 04:05:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm235940845e9.4.2026.05.25.04.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:05:40 -0700 (PDT)
Date: Mon, 25 May 2026 12:05:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Richard Patel <ripatel@wii.dev>
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy
 Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] x86: ban 32-bit sigreturn when user IBT enabled
Message-ID: <20260525120538.1f52bee3@pumpkin>
In-Reply-To: <ahNzRYro0gOkaXDZ@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
	<20260517183024.16292-5-ripatel@wii.dev>
	<F10D66BF-C851-4B14-81D7-E5F1E15A325B@zytor.com>
	<ahNzRYro0gOkaXDZ@wii.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 24 May 2026 21:53:09 +0000
Richard Patel <ripatel@wii.dev> wrote:

> On Mon, May 18, 2026 at 01:22:19PM -0700, H. Peter Anvin wrote:
> > On May 17, 2026 11:30:21 AM PDT, Richard Patel <ripatel@wii.dev> wrote:=
 =20
> > >diff --git a/arch/x86/kernel/signal_32.c b/arch/x86/kernel/signal_32.c
> > >index e55cf19e68fe..7cb76d794366 100644
> > >--- a/arch/x86/kernel/signal_32.c
> > >+++ b/arch/x86/kernel/signal_32.c
> > >@@ -143,6 +143,11 @@ static bool ia32_restore_sigcontext(struct pt_reg=
s *regs,
> > > 	regs->ds =3D fixup_rpl(sc.ds);
> > > #endif
> > >=20
> > >+#ifdef CONFIG_X86_USER_IBT
> > >+	if (current->thread.ibt)
> > >+		return false;
> > >+#endif
> > >+
> > > 	return fpu__restore_sig(compat_ptr(sc.fpstate), 1);
> > > }
> > >  =20
> >=20
> > Dumb question: is there any reason not to just enable it for 32 bits? I=
t doesn't seem that it would be that big of a delta to Just Do It.=E2=84=A2
> >=20
> > That being said, I suspect the number of users will be very small if an=
y. =20
>=20
> Hello Peter,
>=20
> I researched 32-bit user IBT support a bit more.
>=20
> Intel's original patches used uc_flags, which is not available in the
> legacy 32-bit frame (breaks sigreturn(2)).
>=20
> But you could also store Intel CET state via XSAVE into sigframe
> fpstate, like for Arm64 BTI.
>=20
> Unfortunately though, this includes both CET control flags ("is IBT
> enabled?") and user state (WAIT_FOR_ENDBR). Since fpstate is writable,
> XFEATURE_USER_CET is in XFEATURE_MASK_SUPERVISOR_ALL.
>=20
> So, we have 3 options:
>=20
> 1. Include CET in both XSAVE and XRSTOR, but revert user changes to
>    control bits before restoring.
>=20
> 2. Include CET in XSAVE, exclude CET from XRSTOR.
>    Parse XSAVE and restore IBT state "by hand".
>    * Breaking XSAVE/XRSTOR symmetry seems like a bad idea?
>      But the user can already remove xfeatures bits, I think.
>=20
> 3. No CET in XSAVE, instead abuse uc_flags to save this state bit
>    (this patch series).
>    * uc_flags does not exist in sigframe_ia32, which hasn't been touched
>      in 10 years
>=20
> IMO: Option 1 seems crazy. Option 2 worth a sketch. Option 3 is ugly.
>=20
> Really curious what you think.  I'm going to send out v2 today with
> option 2 (CET XSAVE, software restore), and if anyone hates it,
> I will revert to option 3 (CET software backup and restore), and at
> least add rt_sigreturn ia32 support.
>=20
> Btw, OpenBSD doesn't do any of these and discards IBT state.
> So, if you spam signals on OpenBSD, you can bypass their IBT.
> That is, uh, option 4, I guess.

That is still better than IBT disabled.
Wouldn't you crash the program when the signal 'missed'.
So there are probably easier ways to break things.

I think that would have the side effect that code would run when
single-stepped by gdb, but fail otherwise.
If true that would confuse things.

-- David

>=20
> Thanks,
> -Richard
>=20

