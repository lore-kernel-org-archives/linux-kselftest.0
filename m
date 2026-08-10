Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120AB21CC5A
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368945; cv=none; b=tAyFDFl56yfFrn0Tyjpdh4JrDAC9gQALImcC8iiGRc6kUpHnNkliAgPoGVSMewQW58ukcq0lCi5+Xpab3cLgZivpWKoodhFBeA5l6k32tJpD3v883sXb+swQZXcfw1ckCwvprFlH/aLSUOvkxa8syjAcH/8X/0xTa4SuKBIlndo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368945; c=relaxed/simple;
	bh=ERsyZ9sZLzOVP7R6tAaCm5UQsdEmR1MNZhZ8JlYPlxE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F68LpNOaD9nBo1HyigGYMsxS3r++cM5+8P1K1cwsdB4NHT9bk0Tb8MtqFwVk3N0Nc5lK/dd8DfE4+2ZNOUBBYkYUJwJ1wCOVn1GjbGGhvbzV0T1MRYPy29zFrkOGZESwweNpn84S9SpUwH4emorsmqNSGgcIUs23TnfM4FBelg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=heMKCL9C; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="heMKCL9C"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3347268a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786368943; x=1786973743; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXpwDS64ztWP/hp11+tNqbM2bLIJJ6CzSe5TtwpRSOg=;
        b=heMKCL9CaN4a/LIE+gyetMn8s7TE8A27xQDevQF4ZR54E4RCkrkjGsf3KZ3RQWDq/2
         /zFEZ2CYYs4Vde5+nF4mUhJmXuOn93jjgsGHIlM4+Cjy3vMk0Akq8v8ge0IONeO71RoH
         DSbF6BAX9eH297jFGt+MguqRbLJ5pD5vGJ0u+CUs/c2di5FUu4ZOVMMweh7jPQcHInLC
         vyoI57oa0QU1v7WH5paC1bYQ8zFfn8g9TDaCqqUfMUYK0jKOTuJRZvC/e4RtBPEY/YWF
         q72O4Y4y9SLx0LaYspsJ2HHDOcEju6y+/k+q9eRd2Sjg6+tLFMJ2kN5WbOvxR9/NEf5A
         FyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368943; x=1786973743;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXpwDS64ztWP/hp11+tNqbM2bLIJJ6CzSe5TtwpRSOg=;
        b=OcE/GXsSRy6PXw4Y3tWhNIX4WJUAE9bUPLnu7Nt9e1D/TqQ+CnkNiSWKro35Thxoke
         Ka6kuHzkgcGtxwNBnDjpOMzcj1u+vOvU0mywdyq9+/Mtnv0wkeSqi07zGDBssfaweQ0q
         CKUHZ9+0bSThcUrkXCd+NbfjR8ZsZ/tWbzN2URoMbt1vhpLzGxb+X2NBb02p+/i7o8Da
         A/HEenpRMLSUMMz9bpPw03Z7zhvCnc0OB0d6Qc+CoXzR5GNtVp1evHEP2fkSyxKZaLun
         ARB/xkd0IvXhjYXBiMw173RlyFadSuaK0AXeHydb2mk+Y/jMkBRekilTC6kpTPino1iK
         YLKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpm35MNht1jwiZLevGxkfvW20GM3V7+m5p6hEs6i6leWtpoRIieMkIF14yu02jCgD+vQPNlNcoXyY4Hosnr53M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqCmeVdjTChFAvbQfX479nkM+AtWXa3wVi9J+hd4cZBpUPAh2
	pg1w+HCv4Fqjbs/X8blbhzawc/nnoV6gW+LMc1YQJHDobInn1qhbZCGWD3fiFxI9X+ukwv93GZF
	wu66dCQ==
X-Received: from pgmk1.prod.google.com ([2002:a63:5a41:0:b0:c8b:2706:11a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:178a:b0:845:e97d:447e
 with SMTP id d2e1a72fcca58-84f2e040170mr45969220b3a.26.1786368943178; Mon, 10
 Aug 2026 06:35:43 -0700 (PDT)
Date: Mon, 10 Aug 2026 06:35:40 -0700
In-Reply-To: <20260808081050.408657-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260808081050.408657-1-gokul02k@gmail.com>
Message-ID: <annTrPQhUpbbX7ib@google.com>
Subject: Re: [PATCH 0/2] KVM: selftests: Fix two VMs leaked on early returns
From: Sean Christopherson <seanjc@google.com>
To: Gokul K <gokul02k@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Aug 08, 2026, Gokul K wrote:
> Two x86 selftests create a VM and then take an early return that skips the
> kvm_vm_free() at the end of the function.
> 
> Patch 1 is the plain-SEV path of sev_smoke_test(), which returns straight
> out of the UCALL_DONE case instead of leaving the loop.  The SEV-ES path
> next to it breaks out and frees correctly.
> 
> Patch 2 is nx_huge_pages_test, which returns as soon as it has confirmed
> that disabling NX huge pages is denied without CAP_SYS_BOOT.  This one is
> not an unusual error path: nx_huge_pages_test.sh runs the test without
> CAP_SYS_BOOT for any non-root user, so a normal run always takes it.
> 
> Neither leak causes a failure today, since the process exits shortly
> afterwards.  They do mean those paths never exercise VM teardown.

Eh, not really, they just exercise VM teardown at a different point in the
processes' lifecycle. 
