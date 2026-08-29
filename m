Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48F3B6362
	for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018786; cv=none; b=CAYKnHs5aeBhu58pnpcA/cI1O0nYJK68f66l+PSC6pdfXAAxzJ79Gf2ET8dL8ZpZPCVSMjMI6Zi/7bjcv7I0X9hkBl+PVNXX+ExfJnleUyw6N5WNWBoma53mj2GzQ63f8wr2UDHmbKpepVAMIryS0oqaguGsnJUkqinzWT1CtWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018786; c=relaxed/simple;
	bh=u/QcdMTFyvL/N8kNdZkXvPw5nH3ZXvrAXroaB5kwYPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNDW8xC5ABGiPYF8Ui9eZjthLLpO3Pl17yRUo9SJw35QKPbs+J80oVSiuP9PsfhVscukkAdgqlP3/fNKi8bpbHN7sUQ9NcSqrlJSNb4lCacw1FdB3Ll7rWf3fpbz2eWaUzAoTVwCJxrBy/juQAE8M8YMpwppsZxszwbq/Xj+OEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFI8qlPJ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFI8qlPJ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1154465f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788018783; x=1788623583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kqxt2pJA79TUQhxHKJFLWKa2wf0Abmgu0fLyjHQBRCk=;
        b=lFI8qlPJ6V2ZjAKioi4Q+RhnIlFDQ7LXTv4LzWnXJa2JHUtTzQL5E+qjXSGWLhnOSK
         SSkeT2zmb71LCwDhflFfmvP2vPkQdBWg/3V9DhSRDiulX09BTD1p3i7kTSjzX4SMNmdj
         gxA8xaQxibtBq6ARAkbKuZYokNtW44QTXZqBQ9GMho64wORLOShoQgHHwz+6mRu4L8kZ
         pcfSX/BwDO3RZpH5wm8dgIKBSu4elMAuaWNyiA1WVwPEjrBTaPXsHtmZQg/BoLVhtNuQ
         7QvrLdSkicsaeuFbBygrGq96eD7hpXtz9W3lWMeYlV54kaTJF83QwAYKPUZA/Z+2ezLY
         VhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018783; x=1788623583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kqxt2pJA79TUQhxHKJFLWKa2wf0Abmgu0fLyjHQBRCk=;
        b=EjaTRafPPRBlM3ztuRTTbaq+ZRUbmcMdagfpuT2JH3DTdoa0nB2oAJ6eJscCVgiNJu
         eOfbkdFd9EmImHF4psyBxlZAGxJN8PAKcbNYSu17KWuJOz1cGgNW34hkQUygNPpDBIn6
         im2gV5X0gK4k48y6UHr2yiG/tugH4RCvoEJK8IssSjgWRnI8KbjsyXR1QRmIOqLB6qW2
         Ym9NElA/2h6o1JR7DSztFoPGA63jmrN82ecwR8zgum8RGjGu97MfxXUF9FjZratpgPLs
         N4NYZuEDg8APFDK0yZRAYPUhJmS4Mey8ywPnQCauIaqhcDRbaKXpijnBTF/ur6TIEyxH
         oSvA==
X-Forwarded-Encrypted: i=1; AKwUvBwykbZ2OCTN8Jo8RX2LRrov8lh4bpVpuA+OIfKJ8HV54nC0pHscpDjVUyNxvLSTsL68fTXHkWELw2Y59m8Z25E=@vger.kernel.org
X-Gm-Message-State: AFuF++lqB993kg+HJYi094VU3wr3bre40D4awkaDeTsGPcn0bX0KoZG8
	tGiVQamB3B0ttIbtMxdvrNBrBb74RhPXAh3A/9xmzLhltOPd3BvkxRXj
X-Gm-Gg: AYBFou2HzfswoIShbXSbuDh+dw3f7+ngobELXjl/JeMwRg+tf2jNu798d09ABn34UKo
	Fim7lsvePP9yI+biCMD9S4jNhSmSuAS536yONRG0uDUXEh58ofbaJDiQwcKuTbJeyiI3SKNQgqZ
	GpOCNII+xReTFRs8e1vGe0KcBeO0JWNYatr2LPUmteorGZC+8/cC/MOY+CakbtJ48mZt4ok/qUG
	mk9zYk9ea85oHYei7LwhDZQ5VKNME0qPF3BaFkHwBEZG9S5NO05wkGaeF7Iz5O3sq8gIN+9cPjk
	XQETC3YHTJrSMyCHn490snwhW/DVLptS/9coF41BsqoIn4ond9TNtHUrHx/BivnyE0VoZmUUtb2
	QpZ+pxz4qpWdmDQxfbLZ1QRlafh0TYEMsa1M3qsA98NLUyOnBDXoOTr+Tka/aTlTHM4mJB7HsVd
	7lPFDmv+p732xlRNkPMdXmFU3OHd76zLBkFdjAb7YpwXN4LIdeUYoV3nYPlPIGYPAdMgbWRHzZ7
	p8rl7/YLdzcp+/5dyd/fxQIja4hSQ+Gy8yjl/tEWes4QFaDVtfV5IGxeVD7SGJ0tBxgHSZp/pt+
	gdw37KK5jVawXClHJA1Mdcb7uyHtdQl1pLByGdCUuMS/QVWHyiIJarVWAedGx3jC3zF3Xg==
X-Received: by 2002:a05:6000:2287:b0:484:3310:f399 with SMTP id ffacd0b85a97d-4843310f41cmr3869418f8f.26.1788018782440;
        Sat, 29 Aug 2026 08:53:02 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm10864679f8f.20.2026.08.29.08.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:53:02 -0700 (PDT)
Date: Sat, 29 Aug 2026 17:53:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter
 range at base 0
Message-ID: <apL9jzg-KM_n3Vv2@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
 <20260829054856.70549-2-kmehltretter@gmail.com>
 <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>

On Sat, Aug 29, 2026 at 04:04:01PM +0100, Fuad Tabba wrote:
> > Fixes: 821d935c87bc ("KVM: arm64: Introduce support for userspace SMCCC filtering")
> > Assisted-by: LLM
> 
> nit: this should be `Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1]
> [TOOL2]` rather than LLM
> 

When I first saw 'LLM' in a patch I thought so too.

But it is now allowed, see recent discussion and merge: 

  https://lore.kernel.org/r/87qzkuahlr.fsf@trenco.lwn.net/

  816d9992d9ed ("coding-assistants: simplify attribution")
 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Thanks for the review and also testing!

Karl
