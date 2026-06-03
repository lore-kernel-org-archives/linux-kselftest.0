Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B472A26D4C3
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473778; cv=none; b=FgsE5Ulv/w81XgCFu34u8reFxF76sRR3chS7/GDsSXHjlBJQHVEmcobRVXDojHj1gszushirbPieJaR6spEFwtY/SZsNaqxrQdsCI1kvRLun4bHci7og+dwVA45/ZfJgFShWMNWbaoU1i8EkNrN0tVEpUvWXRG5mHAsNuRHEcm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473778; c=relaxed/simple;
	bh=CUdxL2GR7o7ESdxlvLNeuY25sGeQO0E/Cs7P2N2ze6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pb/JzXTjkbt1G29TDwJHWUiFyDKaa8VzqfNd7buQvS6gAU3bBsY4+vseTsDcRY8ApDjlHPMckCt1OdmxzcgmA/3pQ26WcYNLg+onkEyeBT4k2oai5meOlfiIxGcjRAZly9HojmFIh4ReGYOfTzsU3yVQIm13suxhv2BeoPB3nzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=redB96i4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="redB96i4"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso2009997a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780473775; x=1781078575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MuF+yWJKjzDQs0kKZtPPTCGk9WmA5u/lg0Mr9iL+po=;
        b=redB96i4IoIWjKQkEou4hGT+62PH2deHP8oZe2sjYtkJBQ4DC7IKbnJehh1KE25Yje
         iKxmeIXWqHoQzdxenTgktacq8nD4CEEwxrmF+OKAc081SADNd2hfK89k1dRgThWDqrFt
         yRSzaYvoAcXR188CLUIDjEKKc0AkpKJV3AxB3f+PuAgTtC6ta4vfaFuLNeXd3wRhwhp+
         k7Ow1fDsCYhsyzSa9fj9FpIXrPxta6iqWcez4jEBCFkfjpZJBB7NC+ZgdWIZu6s7li0o
         AbnFFhUL5KjAbDjh22DgoeVEF1AThligVvNCdqd26c+qx+NkNRhu8bhacKvxyskMOS+q
         pV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473775; x=1781078575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MuF+yWJKjzDQs0kKZtPPTCGk9WmA5u/lg0Mr9iL+po=;
        b=WouODR6tRzZkfsKNaO2dB4575oOFkPdfuOsEW1Cb5z4D/QtPyu7vaFcpatd6NXensf
         X3UM/Ar5S5Wq4T215fu5eqd/qiMaZ/dBESFm2N61M0WvEqZiP2zmC9HZ56+qFQK+NPgG
         WCdFWE41I9D1IcXBmq28BHcQ7PS59pRbz/oYN7lMPMdU0qPz08vnXWbdCCyetcOz8DYB
         YsMTOama5BT9bMmjr3kggpRcfV45iUqJjyjxaUPDVWhxKaIZmw+gBDX/+zIQ0dCSLnpP
         hIksZck/OuJOkf+DWtacSNWnIP5rmZlQE+5XWonQE3gQy3P88fZV2TBV9rLUBzi8Ba6m
         KQUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9P6Eq5/Lry8fC2hsmXHVAnvEo3PJ+oeVIr0GOIKgHUnxHk8i1isUoc3lbOv44MtH9al8IR3rtixwWkBhgq8MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx83cz6b83Ajde29CbT9uPdewRfPZOCw2OFu4ayAn2lbWxPaDx
	FPBc44+sfYzq9f3DZpq1mTmL4QQg1c+leJEZCwQd6s28gLx4wfMCnOUI
X-Gm-Gg: Acq92OGzBM/QS815vvbi0sTR/3QIqgjtF7x2ZtfbFgRMivDehxNk7YrrrS80oCp1AbF
	4o+6l+5DhRnivZdcRv7MdNpI4imJhvXWcasASD/DJmSQ3hAYUJG6BewlOKtAKIPrcirMEALh83D
	j1CouJ/H30nYPvPvEBIdXO4fxkAo8bi+LPyx/zDj9wM3GCHmT+/yvYTzD8EZV5EbkS8EjMBW69d
	4GWcWbasW82EUB4x6PHGoV2yMCRsfXXYNoMfrhlcMLtH3u5v4CykGWax6u1JV5yP8On2eL0uHD9
	WeJtnUvnV1u6RHHZOi+P0M4sJadjEoeaEFdlAwDY1NXgWlE2hN6Pyv+PGC4OtfvuDT+ScoTvtOk
	9pVdIUutj5HPdLIZAdQXAIpXCTzgSp81qfP9q0k3NPW4Nox0nNLxI+71HpYoM43FcgtXajNOZRW
	Y47MYG7+Yzb3U9gXVOZ0R0AHpUo9Jxlx0SbQ==
X-Received: by 2002:a17:90b:5610:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-36e30d1c00fmr2269817a91.8.1780473774886;
        Wed, 03 Jun 2026 01:02:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd98797fesm5144475a91.13.2026.06.03.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:02:54 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:02:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for
 Guest/VM
Message-ID: <ah_fkXOLpNHvnmNM@inochi.infowork>
References: <20260601084336.2601675-1-inochiama@gmail.com>
 <20260601084336.2601675-5-inochiama@gmail.com>
 <ah1pgb4S-UoSWhC_@inochi.infowork>
 <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>

On Wed, Jun 03, 2026 at 01:16:14PM +0530, Anup Patel wrote:
> On Mon, Jun 1, 2026 at 4:46 PM Inochi Amaoto <inochiama@gmail.com> wrote:
> >
> > On Mon, Jun 01, 2026 at 04:43:32PM +0800, Inochi Amaoto wrote:
> > > Extend the KVM ISA extension array to allow KVM userspace to
> > > detect and enable Zicfiss/Zicfilp extensions for Guest/VM.
> > >
> > > Assisted-by: YuanSheng:claude-4.7-opus
> > > Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > > Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  arch/riscv/include/uapi/asm/kvm.h | 2 ++
> > >  arch/riscv/kvm/isa.c              | 2 ++
> > >  2 files changed, 4 insertions(+)
> > >
> >
> > I have forgot to add CSR_SSP to the context, will add in the next
> > version. But I have a small question for it: could I reuse the
> > generic subtype or use a new CSR subtype?
> >
> 
> Add another CSR subtype for Zicfiss.
> 
> Regards,
> Anup

Thanks, I will do it.

Regards,
Inochi
