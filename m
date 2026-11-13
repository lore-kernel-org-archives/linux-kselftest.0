Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577768;
	b=wOVS4RPVss8bh98YIq6KYhhXtdMhUNMfYMeBu1wr0zbjAUZXmnnzNyzaQtV0eyvPYxbP
	 slNedRGAuPlNihTVsKI8LBmvlsWLHaeGyoeUQIACeVDA6PxPw/kPb9FcVsNJG0raM/gsL
	 BrzYHUU+vXA5vPk0cWSqBqb7Mrl2uxirtX/lxMyFUBOMJVSZlPle8wZe1BWIL/2AYOXDV
	 jNIUSRuc/71lGKVNbEGsUVnyunBjDSg89dIDv7GS9V6Med06MAiRXAXvuXREssJtNvlCS
	 mb9xGl9AF5a5CvpRSwvP9ICaJiUi1yJI6MJpjcFhnXMwCal4rFFZJBudPt7n3N0gLgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3v73r32eIAJAgWPi1LsXT3feGTevyTVBk7sdUb/TcA8=;
	b=4pxxzXbjJL/Ek9gKBxw6F8tz44FHQJQIbY3aRvO4c4hYNKTJibbu3Avt8SWhb+JtxduS
	 BZ4Bnu+pf+paZOuNeCl/nfVfF9wNAWhviZDSO8lCJgUlxxi/VaV6vnf8QREf98tQ0TA0Y
	 NzBeVja+8EFdtpmRNFb52p0/VYPxHE6am1n/4+1SZ5kGAWGQQeCPX90ShNVVb5ee/I9tR
	 IT2/dqWGDhY9d+BzJXd1auy7R4T7HhfKowY1+HKX7yODCarSWfMcIvj9XznjQgKGT2J0q
	 ie1x8VohbIFKt2NSUq2o8+pKiDXmXGpt2BbV3RVWS8Ukk/B34Xzj+wPzD2o5DrLZQ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iYprxckR;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC328606A8B3
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 13:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC328606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iYprxckR
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so750420a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 05:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577767; x=1795182567; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3v73r32eIAJAgWPi1LsXT3feGTevyTVBk7sdUb/TcA8=;
        b=iYprxckRt6x0jveQ7KIO6R+oa6tFiYQfSlMcbZeYNkZElf1SB6bHrK9uNemcL5oERW
         JhBhmjD7LEkzuwclSSGtFi8rLnFij9YqELQAndFPhuWI9gCQC10TQDtD8DoiOnpSH0j2
         HVjFKRqbxI13gzT/MYxeD/jL8356LwhFULpVEx6CDY8d5wA1hfQQpOq6O4L8pqpiDPp6
         HbI63zWl1Ozdh3NXXVXkDOnJO/DgRq1C2QmRF0R3mwzq5LUSDPowEpJb4meLFazbRWGf
         Ez8ljTE+47qpn1tkWgbwYUJo1cThf1QiMHn3kI1ljYZOpvksMa5d85Mf4VwYBml1Ckrq
         a5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577767; x=1795182567;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3v73r32eIAJAgWPi1LsXT3feGTevyTVBk7sdUb/TcA8=;
        b=K15FVyKu/0E2pPZ8Y/F/zsJECpovlzg/ps4ksF+gWe7hAzEhTLWivKwOPYSk+31cWf
         rl1BfCDseprUQIV0n04ySTXQkSJwib9hFJMJ5NTVz6Y7oyfpLpwgsfYkLME5aNrZHoiK
         y/MAhawXNQP7fFXbmQ9lu+xTiTvvR+dczMjZNS9xTzn3Nc/WYhMDBeZ0zEIshND2hjF6
         Bt9fBSRNG9HOfXPA58/6kYY6ZBZTDjBFD0AtMVd1l5zXEBH8DYmQq3aOGleC8rbYULKE
         541hNrJK+mf+vaC8bDn/oD3Df+Ne9H0FxxIZnNZOVoq2kO219/hyP+HFp7w8gx0hmkeq
         5YTg==
X-Forwarded-Encrypted: i=1; AL+hErGCTQtqB8mRv0bRnvSivcS6aTENbzgxaQVAm8XqPx5GALTrjFqXqU/78rrWmSh4Uuvhf19m3t7njEa9Ndu/uaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uTwlysQpNSHAA8MeqB2lpIoICBruiC4WH5BRYbxtm2OD3sQ7d
	iE8M6TheS8Tv2BWMaSyfgwFq+iEt8ReSEThDyrUtKUzECeWNEHPpPIm1BhMDKpd638Wr3t0CiX8
	CPdcyJw==
X-Received: from pga12.prod.google.com ([2002:a05:6a02:4f8c:b0:cca:d82:9104])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c8:b0:3ac:7842:bd50
 with SMTP id 98e67ed59e1d1-3b1b0a428admr2241920a91.15.1794577767011; Fri, 13
 Nov 2026 05:49:27 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:40 -0800
In-Reply-To: <20260731150846.1728164-1-dmaluka@chromium.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260731150846.1728164-1-dmaluka@chromium.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441846682.83214.17243719876978660073.b4-ty@b4>
Subject: Re: [PATCH v2 0/4] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Dmytro Maluka <dmaluka@chromium.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Mathias Krause <minipli@grsecurity.net>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Vineeth Pillai <vineeth@bitbyteword.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, 
	Aashish Sharma <aashish@aashishsharma.net>, Grzegorz Jaszczyk <jaszczyk@chromium.org>
Content-Type: text/plain; charset="utf-8"

On Fri, 31 Jul 2026 15:08:41 +0000, Dmytro Maluka wrote:
> max_vcpu_ids and KVM_CAP_MAX_VCPU_ID are exclusive, i.e. the maximum
> allowed vcpu_id value is max_vcpu_ids minus one, not max_vcpu_ids.
> 
> Fix the sanity checks for KVM_SET_BOOT_CPU_ID and KVM_CAP_MAX_VCPU_ID
> and the selftests for them (added in series [1]) to fail when
> bsp_vcpu_id is incorrectly set to max_vcpu_ids, not to a value below
> max_vcpu_ids.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/4] KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
      https://github.com/kvm-x86/linux/commit/9b04ebe5c085
[2/4] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
      https://github.com/kvm-x86/linux/commit/c36d436e7335
[3/4] KVM: selftests: Improve bsp_vcpu_id and max_vcpu_ids out-of-bound tests
      https://github.com/kvm-x86/linux/commit/201aaeb1df8f
[4/4] Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive
      https://github.com/kvm-x86/linux/commit/ea6d489ae6c2

--
https://github.com/kvm-x86/linux/tree/next
