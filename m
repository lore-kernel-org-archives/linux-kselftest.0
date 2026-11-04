Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833367;
	b=M9UbdZaRIHqWLQlXe7J5H0SGQTrd/RhgGaqbgOSMn9gWHPTQxR+3iFIAxbc4PSDFa9iL
	 d9H0sgfrJjBFzDcDj6E8zQvy/4nxYSAFl9S4LD8xiHRXAeVoI/o6HII5iSTIz8uF3t1Qi
	 uHRtraXeeLFL/RDrxJKEdaO3ITr0GbvxKSAglN2YmNMzJ8OynWKK+5yrwRvmtkDFteZar
	 s18gQcsCVj+toYbbqvnbnIznnsP/JN/fwYpL3lvwKGiwcHPFttLDbFQLHp5zAshfIe2hx
	 vJwNktNT9wRS/nsdsIChq2JPDOlXUNaAVpHifyZrQ2jcj6uFylpfbcUku77LzQJyWQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=vyyO2xQK9gWshEcz/n+cFiGR1SxpAHdL0Hq3aJ/xFWg=;
	b=BwcpRO/qnU/llaDsEP1MSPgk15TD/14WXsxplOxFZXVWRRhzdA45WnNhW0kr5ageddT+
	 XguyZJVXkYUIH/OHrduivYIkObpVwXTNjMVoLzetVv6py2dSGPyrfBB17/gFO/AObaXQn
	 P85WVdDoRr5ump39vs+QwGPWgj7wO1njXDUWWF2+XukzZ8ezJkVppEegrNchOONLmVMxr
	 SgjYjHxyhVUUXNDioq4u4lyqHe9Qs/GuTSkdDspDlKWhX1rpHY1T2atz9kmiI8Ur3+8y2
	 CKzoiC+lWpOVWRVdl7MK9CCtW0zDPOvGG1BVnrQRknAGTe6zoI7Z1WhyNP8dt2U4PYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a+oxHKEw;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B004606EE93
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 23:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B004606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a+oxHKEw
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso806741a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 15:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793833367; x=1794438167; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyyO2xQK9gWshEcz/n+cFiGR1SxpAHdL0Hq3aJ/xFWg=;
        b=a+oxHKEwZrv75w7v6JN7rcgSeAAqtvc/PA3NHJk5l4FuvuHozMILWxVrbPVO0yGA3z
         02X/mNkPlyA8ROX2R7TQVPWKEex0wDVf3FXiYuCTRpilW0u5yEn4TTqGu2dPfc0KEPlf
         E32NzKWvcCbPmM8257xAoMbI+yU38XpkYECmBly//I2zDPCVMuQqwS0MZx1qC+j9Lgjj
         iZL5xQq+qqDSELZ83j2o9SPHAy2NaSYa3uKUljAkiPgfCl9LLPmZqQfgsYRkaSKQC8Iw
         YZJuXnFHnsN9HVvazcBdkSOjNuSKWWQjCqvLl6eNkOeUhPPiFGUFtAaaNpTer8eTJb2v
         HBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833367; x=1794438167;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyyO2xQK9gWshEcz/n+cFiGR1SxpAHdL0Hq3aJ/xFWg=;
        b=pIrFoy+3L+mF9DF88ydR5foEZQZD4gb8Z2vSqzyzWXaOxKvpDL1YgGhshs8bsfFHJZ
         ++mU3yjylbN1PEHvtb2altxRZCOwg9+AignRC/Hbd5U+ak4XMaWM8RKPzBgidUUVKDCZ
         obKQWZoqfTdi5mXBY91pS+MB8H49P5rtdcOw8VI58C2ZgRyDW5SMivLswAVpkHtoh0Aw
         mipWNc1MTiFuVlXehvC0gkZzTvicsJc3JMnoYsTePfdDtTKVKu/AQGFw1r46JE9xw9q5
         lw3iTTgHKxKIRbGZqJI8UGpkLgHJqTOMDhoVJh6GBTKTpg2g+R/krjhcc3Z7jtou9KFe
         I08A==
X-Forwarded-Encrypted: i=1; AKwUvBxNi+23Chh29HIWGMm0NDsSLsk+QhfJzorRk8Ges9Svu496ZJM7yRiN1H5ka+l3zpnNTbEOAv8DnPfEIwYohh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z94lk1VS7ijyBWrQjFNZO9bMmWOGvEARVJsI+tkC9mIs5HjO60S
	+12YY5n7VpTSr6vn2qRzW/dACLn4jjLqmfKE9ehWlCJHA/DmBbV+5X7KMDO201GqAYSdWFCY/bW
	hoBIHqw==
X-Received: from pjbqi10.prod.google.com ([2002:a17:90b:274a:b0:3b0:9569:4e9a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:5d17:b0:3ae:898e:a123
 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr10835418a91.14.1793833366550; Wed, 04
 Nov 2026 15:02:46 -0800 (PST)
Date: Wed, 4 Nov 2026 15:02:45 -0800
In-Reply-To: <20261104193635.333141-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104193635.333141-1-sashal@kernel.org>
Message-ID: <auu5lcHexLy6pBe-@google.com>
Subject: Re: [PATCH] KVM: selftests: add empty install and run_tests targets
 for unsupported ARCHs
From: Sean Christopherson <seanjc@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 04, 2026, Sasha Levin wrote:
> Commit 43fbd8cd389f ("KVM: selftests: Provide empty 'all' and 'clean'
> targets for unsupported ARCHs") gave the KVM selftests empty all and
> clean targets on architectures without KVM selftests, such as 32-bit
> arm and i386. The selftests Makefile also runs install and run_tests
> in each suite, and those still fail there:
> 
>   make[1]: *** No rule to make target 'install'.  Stop.
> 
> Add empty install and run_tests targets as well.
> 
> Fixes: 43fbd8cd389f ("KVM: selftests: Provide empty 'all' and 'clean' targets for unsupported ARCHs")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Deuling AIs?  The other patch seems like a superset.

https://lore.kernel.org/all/20261014200152.1365147-1-sashal@kernel.org

> Found with KernelCI-style TuxMake builds that record per-suite results
> with KSFT_BUILD_REPORT. 32-bit arm builds now succeed without installing
> anything.
> 
>  tools/testing/selftests/kvm/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 03d91f00092f4..3881df8d5b2b8 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -13,4 +13,6 @@ else
>  # Empty targets for unsupported architectures
>  all:
>  clean:
> +install:
> +run_tests:
>  endif
> -- 
> 2.53.0
> 
> 
