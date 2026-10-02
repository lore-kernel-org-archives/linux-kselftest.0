Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F14D2ECF
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963142; cv=none; b=IEihhEkbHb4FCBBAsV8O6imSrB3hBjMgB33yA1xvFjTnXkbEuvoVcOByRd/chgH97v4fIjyz3pUjADwx1dyZZrIdrho/0uSvXPXstGyIOACLKKJbB3Gm+6EC2Od6g86h7CJ0lyTYKsSmvg2Yk/Uq/7MfUP8BKeuKnF/muM+JhkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963142; c=relaxed/simple;
	bh=tuUKQXYkGnUCxDjJE1nQ+gDpYskdzNay7lbXkALLVfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWQKGZV6NAX+7FPFu454gL4k8ZCGP/kL3j6kMIi1gopGelxMdk/g8g8C3TgEeqqyLYhZNnzE89sGp7kZGZ9MmixKwlM5++bNQZFybE5bzdliUXHFslQHDKQ9WU1Psg9lJUrhJBQjkRLuV0zjadPVRHoW1jTvyTSCecLnULHrOYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPe35Kgy; arc=none smtp.client-ip=74.125.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPe35Kgy"
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so63452f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790963125; x=1791567925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1e269Lu4xtW2duTVHt20I/6VEWYe79hxf4w6LtBB3g=;
        b=QPe35KgyK+Gxw4mhW5bVABKyqTpTACMfdCdcK3+8MFTzVlTSZZH3fgy+SpIP/F2Wmr
         TcMpN5trX18Nc8ZVjnjyMqxbuH4CZPirvTLgRud3czi5e1sFv5W0c0qfUp1dSmEzMFQX
         ZbZBshmVFvcNreT+UbenThzeRuLsZG0QfvwINAgHCrY5fotVLTI54AdkqEFY8MgA3iu9
         RIlLT+W9R/LsSglYZDgqk/95yYgmADmRafwSwiZfnSLu2OKPwgpaxGHPSVp25DztLFFO
         IrIKY3d8uOHaXimDNVlrdRt5+qPw8ziIXP0q78BhPWtz33F6EdFGuM6y1JzuiNsI5SkT
         PnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963125; x=1791567925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1e269Lu4xtW2duTVHt20I/6VEWYe79hxf4w6LtBB3g=;
        b=xBxK/VNOfIBy37OfZ6ZyUl/wDJ736w+/iNYIWsIHMDEuS6VAOyUjkNd1/U0r2rXqTP
         lXsApoH9A519xBTGfx01ofQ0EtH6rJlhZ13Gvz4oeZu1Udxe/qtODbvRtR0CWgSYgBgw
         6KYGEXx154+BjAsFstETPMizagipAw3Cn9R7ZPXxJcP6NDg3ShYC5QYrQstyNKPyJFWn
         74rr9kh/QLi1WxrHfoV5qjmkniK5EskbKC7Lu8m9e/262fyWEmS1TVcSiLsI5oIfwdZR
         MW5rnCxrA3zMpZPd1UsZc272YhabpDoy6HRe9ECetYhSHQmbKO6n5MhxOTh+iK+yxpDl
         pjuQ==
X-Forwarded-Encrypted: i=1; AKwUvByqiLPFKvUh/WS14FDKfHJJ42Q0mhQCV6wtmkV1j/EzpPgaRbB2yRfJFTUaOcPdbAwsMt5B+Rp4cHt+kRedLX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2QMmIA6od8IgOtuLDfadU+KW+DQvPoDBhUj+P94vRRD7MUQlF
	qO1mR9A79pqgT1qhViumY92oXJC6Jt3W3Yc61smz5z8YY/2ISBuDfj5q
X-Gm-Gg: AYBFou2HbMOpZRYE1KxHm34RKPLNyeGocnJx+u2E9pVJUpYCRgFeWi8U2r+0FKbp9jR
	uMjN8ze308F264+EXG7gBmg4vhyD11IMsRKpoF4hRQi+cfn2xPPEsmKsYI6vthz2Yk+BY14ZHHL
	IVTdqFPQXKQMgNd1NOjnn7dlth5V5upiguRF055XbQbdHmLZbNYZdrrsAFaFo9OoEtUqKaEI6gk
	Lu1+vg7lK2Si/8PdHwjz7Tz8moF5d6sBqPQm4ObZkpQWRAPKv0EL4s3sY4tKiuFBLC64dLGSxDN
	WQdz+lhuVFn3B0UOuarYRKx26vGSpgj86gy9DgPsVznFoW0/1N+6kQ7TgqSAxr7ikCL51wfkg2J
	B6KPudDx5BWkQI6uZorACh1U6B068YiO7ptkLj+Vtjp9XVZ329MX5LQEj8CNC7Pw7kqqD1kXAjU
	cpHaWrCLkgIIloSWbO8AqMnsUFqDjDse5si2l4ki2K+K9MSMv1K2sFmTssNBPtG6K8ItMCkR7rR
	3wJg3kZvVMhB57Cgs0XSqiBAunMj+2j2p6hQ1uhUQ+JVUaoNpOL8O57JnZ6duEnmuSS8JTAVVFp
	puyTRSEJuPloaxFv7/yhiscC8bU8AFowa4qHdgJXIFWfBJsVW7CjlJ72+3f4Env+LSNLRk/BuvF
	PfROxEA==
X-Received: by 2002:a05:6000:260e:b0:48b:226:839 with SMTP id ffacd0b85a97d-48b1273bfcdmr6851497f8f.14.1790963124443;
        Fri, 02 Oct 2026 10:45:24 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-af35-1901-81da-eee8-c2d0-ee3b.310.pool.telefonica.de. [2a02:3100:af35:1901:81da:eee8:c2d0:ee3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0661sm6839400f8f.14.2026.10.02.10.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:45:23 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:45:21 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/4] KVM: arm64: fix VGICv3 redistributor rollback
Message-ID: <ar_tdaYQO-t1K2F_@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>

On Mon, Aug 31, 2026 at 10:10:00AM +0100, Karl Mehltretter wrote:
> Changes since v3:
> - Dropped the REDIST/REDIST_REGION serialization and VGIC init/destroy
>   rework, keeping the fix close to v2. (Marc)
> - Limited rollback to assignments from the new region so an older-region
>   assignment cannot be missed during concurrent vCPU creation.
> - Added Fuad's Reviewed-by tags to patches 1, 3 and 4. These are otherwise
>   unchanged from v3 (formerly patches 1, 4 and 5).
> 
> Previous version:
> v3: https://lore.kernel.org/r/20260822095346.53882-1-kmehltretter@gmail.com
> 
> Karl Mehltretter (4):
>   KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
>   KVM: arm64: vgic-v3: Roll back assignments from the new region
>   KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
>   KVM: arm64: selftests: Test VGICv3 redistributor region retry
> 
>  arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  54 ++++++--
>  tools/testing/selftests/kvm/arm64/vgic_init.c | 116 ++++++++++++++++--
>  2 files changed, 151 insertions(+), 19 deletions(-)

A friendly ping on v4. Patches 1, 3, and 4 have Fuad's Reviewed-by;
patch 2 was revised following Marc's feedback.

Thanks,
Karl
