Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829048;
	b=QiY/rSpRTX7dWcXVgmoLTZ4Gve1DXn/ErtB2sXf8FrAWGn1R2ifLOgQHacgQU0FIXggz
	 URMecabT+4LTE1yhjmOk815+EE952ky68zo8JWGxrIxjompPnT8w1cOu2Usg3hJudI1+T
	 mfeMCGCwSS83Jg2kBuaP550cOicdH9ec2I2VKnZvCTd2WllM9MYkjkn6LSLPqyc0AOPyC
	 FwEyBs6mfQUsvT7vpPL4sbrqjOYY00/DN4xtTcm0DKCCoHkt6aTRaGlpkSvWFbu9NnH+P
	 oMkf5NPrnudgYB8SDNMarxtF6DPew7LeCCL/o894/ny8TJYHGFY3vv/yvhSC1LNKsng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dFChQ0mLr2TKcvvcevcbTzUnz/dF2dQnZUL2ZukNc7M=;
	b=YBxyBgaqYNKGddRx9lXy5PP348bTY9+jQ2xz8FvqJ5XFeuaSA7ZFZJx5ctPnvEkQia9i
	 3h/Cr3GlwTE6IZCgVAYPWVkMlhAlm50Iah1RT+RmyjvTzMqHnaqO9f2PNdXFlwR+VF7K5
	 lDW86vS4C6s0eBUVrBEgQuxtJqQ5WsexSOex8NOJY5/g20gMNJ0ELXhh1WlvEMOgWlslf
	 IMAq6U8DBB/y4awyi0uny2VO4EsPX2z/vKglQm2VvkOvbDSeTpyynETEWfWJw6EuHZPB+
	 kNhRgdbRNxOnycfeQ5N0bu6ZziYhjGKJ+Vl9hxkZ0pbF9nSMQi1i0z0pkB3HYloUuPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M9S0tvwz;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4DC6070771
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4DC6070771
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M9S0tvwz
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb2437d752so16977075ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793829048; x=1794433848; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFChQ0mLr2TKcvvcevcbTzUnz/dF2dQnZUL2ZukNc7M=;
        b=M9S0tvwzc3cQs/jygskQ5D8xUmXs1a229U7+1Z0I98bqqBjLA/pme3j2jrHJ/tu3dg
         WXusFODXXGOllpNsB2M2bk++eeUlT5C/w6TJ8QxTlcWEVdsqHbnrTTwUeU/s3EZJREwQ
         vz9ebxujUXuZPxkwjDmh45JnUTNAOsh6QgzIMILNDcRqrVURkI75NvEvHq0RMj7K4etr
         PevPKnVPUQXSkiwaBr1C8NkgfhIYiMEcg77e78qhI9pZ5mF8LtDKZeNErJDulCMYsk4q
         62/Fhyk5Pc3R6YSq8BzBkUxAbD6dM3rPXfV+iHgXBsHecd37xPL98lsIWlMNeS99nYSJ
         hSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829048; x=1794433848;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFChQ0mLr2TKcvvcevcbTzUnz/dF2dQnZUL2ZukNc7M=;
        b=LwMSLfYkW3f3rT8Ctl3PJHrfGhWKD5RCVLjKGWW2sRRwGeHelO7tIS4H29ufQeUoSB
         /9Pgm9a55K13wHdzkApsK90dto62jQZjN93aJmKAePhjMs8u5YWlA2dPhhK92vBDbcWj
         6bzj7E9lcd6np0Xuh/SLjBO+FrHEN9W06ya+5JUBRYF1RJuuIP8/faUrfsjqaJbIMl4n
         xwlLxhQx4RUzhYmBzngs8KikQpftYR1j/C39b2bXaH1e5wF1pnifNIcQ3g6xoAC9HhK5
         5+7gdFC8NcSNoaOOR4Mo7G7i5dDWEEkp0qdF4RDNXYR/BVoI0MUi4CGWCHv7VjcbOlrN
         Hp5A==
X-Forwarded-Encrypted: i=1; AKwUvBzpNCoJyRRUZcmvB61f4Jwd1o7/ClHWKXH+4WhJ7O6ciy5/evPU+xswUgaDqv0MugQaeRgnjXJQe6pTL7LECnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EtPDrfGwWdkzElkUqdClQEKA+9MMTkIrW/ee1JU8SemegMh73
	R9GRUklQezx2sl7IfrPW59uatTT8ZZmQ9HHCAIhLIad0ojhp/VqdVJP3cB2UPg4PNNJI+9oowHg
	4ZZrnrQ==
X-Received: from pleo5.prod.google.com ([2002:a17:903:2105:b0:2eb:15a2:31f2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef03:b0:2d9:216a:cdd3
 with SMTP id d9443c01a7336-2eb3649be94mr173739735ad.18.1793829047606; Wed, 04
 Nov 2026 13:50:47 -0800 (PST)
Date: Wed, 4 Nov 2026 13:50:46 -0800
In-Reply-To: <auue7S_vdnGtTM3c@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103002205.3348519-1-dmatlack@google.com> <20261103002205.3348519-6-dmatlack@google.com>
 <autHA6aNrg4s5PkV@google.com> <auue7S_vdnGtTM3c@google.com>
Message-ID: <auuotv1vFpocCSeW@google.com>
Subject: Re: [PATCH v2 5/5] KVM: selftests: List the known IOMMU modes in
 irq_test's help output
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 04, 2026, David Matlack wrote:
> On 2026-11-04 06:53 AM, Sean Christopherson wrote:
> > const char *iommu_mode_names(void)
> > {
> > 	return __iommu_mode_names(false);
> > }
> 
> How about listing both? That keeps -h consistent with how other KVM
> selftests list the options for their arguments (e.g. backing_src_help()
> lists every backing src type), while also showing which modes can
> actually be used. e.g. on a system with only the legacy VFIO container:
> 
>   # ./irq_test -h
>   ...
>   -t	Override the IOMMU mode to use
>   	Options: iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1
>   	Available: vfio_type1v2_iommu, vfio_type1_iommu

That'd be awesome!

> The available modes also get printed when the requested mode is not
> available, i.e. when the __TEST_REQUIRE() fails:
> 
>   # ./irq_test -d 0000:01:00.0 -t iommufd
>   1..0 # SKIP - IOMMU mode 'iommufd' is not available.  Available modes: vfio_type1v2_iommu, vfio_type1_iommu.
> 
> libvfio exposes iommu_mode_names_all() and iommu_mode_names_available()
> for this, built on your helper for juggling all vs. available.
