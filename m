Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4913BD22E
	for <linux-kselftest@vger.kernel.org>; Sun, 30 Aug 2026 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114553; cv=none; b=ReG+di2Fu3dwtCBAf8BdkBtF2kDLX44CF6ZRwZ82dXam/heAZMKaYZi+baYdi09kL/ZU+1idN1FPK98WuXtxbsJ1E0wcpvPtGgFz8YiukOIej4+rNw1kxGgIVL64w+HJlJU3/WlMFPfmojz1D1GAyzsH3Z+7DgIBPZaA2yjBr0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114553; c=relaxed/simple;
	bh=9NKDnSEWfPvKPtUsA/Wf/uYwNlKYFsZ8Y0VhVrZy9KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8CFSCYOfk0NBnlltu5AHtD7BRlWKZnb2ILcrHn6v4brqB3l/X9GMsoCXyh/ZRgu/+cV/9AOEKqHJZK3/TB0f8o7ISPbP6OcDoY1ldN0yDOX0AxSdki8P5+QQTAiHsawiayNlXpAlX9PK5CaBrdfDrJKXedKoIf2ubKQzyIgWDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYkHBna8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYkHBna8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso26142395e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 30 Aug 2026 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114550; x=1788719350; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Ptf7lkzRK2cEQa7tXSLbtyDvUDpbM17dkTmOc5wvcM=;
        b=NYkHBna84dMwXwcWaO6eUatLipedsBp/SSvLivwWHR2urS2QxlcpIo5ptWpFS+ulgX
         ZeZ/PEnrCltO/iLCv6gP3Amw3B807ZN+kCHB5sbIi5VyzeTKGP3RjL+Ksp9j4zaN0O2D
         DI71T2BWqdDJzNbFjgHudIytYWLTJphGx9Vrpejd/h/BV1YqV8DF4fBh8NVPWfQTfqZj
         ajix9JtxC5p/D+61A3txbAEeLsKTwfH1bm9oB9Pa24BxJjmYJpMTkVLmdFFvmsWeo9oa
         mG6lIIuQ+ii2gckr2FTUjlX178q8EXDejGc/XITj91+9WemyZDdkluIYnylK4s5b5VSJ
         OWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114550; x=1788719350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Ptf7lkzRK2cEQa7tXSLbtyDvUDpbM17dkTmOc5wvcM=;
        b=Kt8p7c0VbJe0mQanKkBGJLev/jvDRxItGS0cS3HSMXcQg2mQ4Xsb4su00UniVz5tXJ
         BEJ449Vq/PaI4lu3Qgg2X66dK4WZW6bjtsDV8rrAmJqKd0kOuKNr89BP1bNQ9IzfvHXc
         nYDJgDoKB4AFUnuuAgaCBA2lTawWp5DQGgJzd1inMQaJnVS1bjKox6p4nm9MPDFkRPcq
         CVnLsF0XqWgy1MO2vbrS2tOc3nDDnVSm5Xrz/bS2oNPHWVG3ZtMr75zYmVkndtKkA9vI
         rSVR1S1hTCMP3EtC4qt44W0uBWONoC3daBBwRX7+Nbi1GOkul54bzYZt6D55LPWH8Sct
         aq1g==
X-Forwarded-Encrypted: i=1; AHgh+RrcRtADph5YQ03M9USbn3UW7FGlBEVUyYzl+aiUZ5azRSgXppQdL7NAGMYoITV841gKmKCx+RYwqg31pR4GH1o=@vger.kernel.org
X-Gm-Message-State: AFuF++mUxeL0SgjGbCROTLUqWA27mwhtHxQ3GwWq+sTYqe1V3BlIbb2v
	+fiqsIM+xgbcSkoqJFzcjCXvLBhJ3eX/gPjWoXdeLhA5P9eg0dpSySKA
X-Gm-Gg: AR+sD12RYb4V1w21/6FSlmN6H86y/gu7UrhJf0jzdj11MtEoXK0cDi2RuabbRzE3791
	Htc3HY48EIzXjBVxM0MyEcPAOT3FI/b4fWgA7lNqcHwzzORVwgt6VEjJ64jZRx1alLOZ9A6aqUs
	OQ0zeI8bppz+VYtAkcvWHExryKNpy4lvDsgwcBVVtq+qr3ziY5nv7ZjhMg0w7jSEKWiyyq7xRq9
	sWgRSIlgEG+n8yC8BoI1FtA+enk1qa68mpYDK03QRmy6i5r+K59itJAEtuEwwRvrzBOm9lm/VPa
	DgmxxCkl649lVEmHomMmIZdcBDTa4ZcmTbmvvJFkFUBy5nTc0CHNSKzb6GMV71Bj4DahpYlfNlc
	v9weng/FIZY3MCMr2wwssDK63bYu/xPhvZgI2fHCMz6WMVpR9jZ82CjRZ+Xyizj3rgaNjrNj8j2
	XWEPCb5IBUZQmia5NkKpHvo9w3qA8tdCLQof/f0cVgQU1/RSpftlFp7iKob5l8i53iBNKniHqzN
	MTIMI5jc82OyEjDDsB20IDoO0Mog6WJ0+e7jrHWiBkgti+mJyP8DTpFX8uwYLDDeriOnAI3Zguv
	m7bDvqMGiR2rVV+H0i4rdBCQwGJVOC8xWP3Rx77pSo5iIEuseZsD3VecjA99NibGGZEYqDwzhwV
	PfeQpcqQuPbQ=
X-Received: by 2002:a05:600c:4744:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49b91c2479amr317299235e9.4.1788114549893;
        Sun, 30 Aug 2026 11:29:09 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adda-dc01-edc7-8a6f-c6f3-73e0.310.pool.telefonica.de. [2a02:3100:adda:dc01:edc7:8a6f:c6f3:73e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961939ddsm102089915e9.4.2026.08.30.11.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:29:09 -0700 (PDT)
Date: Sun, 30 Aug 2026 20:29:07 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/5] KVM: arm64: fix VGICv3 redistributor rollback
Message-ID: <apR2SFrwBa9tCS5y@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
 <87zey4m2qy.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zey4m2qy.wl-maz@kernel.org>

On Sun, Aug 30, 2026 at 09:28:05AM +0100, Marc Zyngier wrote:
> I really don't understand why this is such a massive departure from
> v2, which was pretty close to what I wanted to see.
> 
> Honestly, you are making things harder for everyone by over-designing
> (or more probably under-filtering) things that should be *fixes*, and
> just that.
> 
> If you want to rework all of the vgic init/destroy, fine by me. Do
> that as a separate series. But for fixes that carry a Cc stable and
> require backporting to 6 year old kernels, that's not on.
> 
> The hack below is what I have against your v2 to make it acceptable.

Okay, thanks. I’ll adapt your suggestion and send a much more minimal v4.

Karl
