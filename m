Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845367;
	b=UrQgUgnMRHKnntyrTNDI/f025WBMK2dC20MkLo7AbrrZzJHvGS1I76Idv6yTWSYMmUV+
	 5xw8YJidzoWC90n31nVJvs93HU0j/WMPFNpev+ZB0HEXW7BF+2+pzndgm6cDX9O0uhQT7
	 Osbn7347Z9+wBiaJzlbgpPBF8qe2gzW/EuGeeS82MO0O0Gi+WztaOCqSHEuhZE9CMz5G/
	 PFTC1w+Xy5MEkW91BELAIxOhSHMETqeGvUD2rdK21Bk2HLQ1A1gXZ7PYzlRtRfFLWRBjq
	 GGUS/nXXOG8tGleIt2H9L67Pi3YrVjD8ZVmhqQYgteQ1z73KrSv0dAzX1e8YJ/iPcog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845367;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xuWJrrizIQaSrZTQFgUO3V0HL4ic1BmuoACdN3FzMhU=;
	b=tN2jcJ/j/uPk6i+rJQyVEBHj4GyHcV8gAMuxqqYpQsNwNPr/hlJL91++CWLtaKIgowck
	 czTB7UeraMUc9d1SvCZT5jku1JDLAMZK35vmV6zZfNd/B55JhgU20yr70C6vKPNFXqOQq
	 8rs8x1JECmyn3oqzBCUu2gfMpRu+qFikg6unUwU1crp3T87utLbwEBqo3cS13V2+DumaZ
	 8/NEZKm3OEkG8eJ/ap8jzvhCddhFgMsU16/zXcN8odm6s/E1murHk1+74Gyc+pTTP/OIQ
	 2juk1eHHi1eXZpQAQZfXRHmg7GnkMPdb0/07JWcx2cdEbQJq2G0PPaCkvrnTZ5S+CSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MWgeacYg;
	arc=none smtp.remote-ip=95.215.58.243
Received: from mta1.migadu.com (out-243.mta1.migadu.com [95.215.58.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D1606A322
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 16:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4D1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MWgeacYg
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xuWJrrizIQaSrZTQFgUO3V0HL4ic1BmuoACdN3FzMhU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794845364; v=1; x=1795450164;
 b=MWgeacYgaru9efJolT6kBToK2hT0DibHV0eF6vuzRodm9xIlji4/ycamOihaLx5Od3ltDDqO
 qAf8pB2Ig0FhTy3sp2sa1NyGXzCVhdBj7/cDdj+NM0s3RQHyR/qBGlmPVfpWudk1vtFC79SDX70
 ZxRiC35IVo0jkYtEHQedtfUo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8c5547934e24e28d;
	Mon, 16 Nov 2026 16:09:24 +0000
X-Mizu-Trace-ID: 8c5547934e24e28d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12520e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:09:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHO+rOIu8mzf1AQoVtkoioXN/LXHQfraReS0Hic002F++F2tber5SWzLtr6aacddKvq72HzZMANg7dYoi5J/Hk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+th2MXQ3G3JRSPXhI/JKwqMkugzQqlshFxYQTSIJaBB3ExlH9u
	tac9QhYlRtknmQgEwqcHTA7rkbHrQOM43Fs9MVTAPJNllzRZEgRyRmdFsflKZx0aC57JcSyIrrW
	2IOJf6tkC40XQpbFh5wcdH9rksfhbg/1G19AIxJiY
X-Received: by 2002:a05:6512:1304:b0:5c1:4cc8:2f22 with SMTP id
 2adb3069b0e04-5c17e4b9f86mr221482e87.8.1794845363481; Mon, 16 Nov 2026
 08:09:23 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-2-fuad.tabba@linux.dev> <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
 <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
In-Reply-To: <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:08:47 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyqJfGS+5UajX=RYTAG-qfhZ-vmGi=1SixXydWhwGHLUA@mail.gmail.com>
X-Gm-Features: Aa3M54pa7DZ_uBY7ynCUhZPG35ZaG2vJ1bC6E24f7r2YagR26_2vzli-PPKoWqQ
Message-ID: <CA+EHjTyqJfGS+5UajX=RYTAG-qfhZ-vmGi=1SixXydWhwGHLUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty
 ring is full
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Tue, 10 Nov 2026 17:18:22 +0000, Fuad Tabba <fuad.tabba@linux.dev> wrote:
[...]
> > Eh, I vote to just use kvm_dirty_ring_check_request(), I don't see any harm in
> > clobbering vcpu->run->exit_reason.
>
> Will do.

After taking a closer look, the clobber is problematic on arm64, where
KVM_RUN completes a pending MMIO exit only if run->exit_reason is
still KVM_EXIT_MMIO. If a pre-fault stops on a full ring after an MMIO
exit, the helper overwrites exit_reason, so the next KVM_RUN doesn't
complete the exit and the guest repeats the MMIO access. The ring can
be full at that point if the pre-fault dirties pages, or with NV, if
the stage-2 walk for the MMIO access does.

I don't think changing how arm64 completes an MMIO exit should be in a
fix for stable, so should I keep testing kvm_dirty_ring_soft_full()
directly in v2, or do you have another suggestion?

Cheers,
/fuad
