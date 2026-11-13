Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577746;
	b=rVVACSjmbTBxixbO48T5VDDITKwzgq9SiLPP6xC24+C/RgaMyABMO9zpKKaueAUMTpd/
	 go5zdnxWYRVCNhpHAayV3VHe00mBQ85LNhgvhrpSrdMUD/18+WOkv82lX0D0m1BTkySZA
	 MWycuctVo2kdPgARYlJ6aO+Df/J0WY50F5tBEIlNj8nfLxU/qCUyLfE5AqeNHj8n7SzFA
	 gpdJ2TXX0KUACJsBqDHSzHTqg5D3uQL2CYjPFPhhGR4nmDiW/K0mJr2kBrXRy1+Qmf5JI
	 99GhvcrIRUSTN7hCoELCtK2rqm3H/IaY/IO0Ctfm8wBjWVpU2i8NGiC7R81pM3IsgdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=grVGPzydbdmfpJ8vlKQ1lGDL1axSE+48g8mGBT9KboM=;
	b=VNVZ1MBzsqQqnLVnrkkxTktQDm49qS6tQ3B2LfDikORqsOrFFhvuwevxq2lP2pmNK/B3
	 odNcVu/ajr4Fts2r6jDLQUUkvgomRVbTiOy9DICP7uFD5gjGVizo1M0uq3OHP580E5JU7
	 NO8418OaSA9qgpDo/P1ac5IvMXx0mj1GgauxzvsxVPy73OUwfQLNco4G+Ic5zZy2Wfr5L
	 VL230bj2fIGbpztX+Gw7OSLDqsiMc0nqDUof14Pclejui2kpyj9xa9JbnLO7zgCe78Ypr
	 IsmfhoTKV6VFLIzPXRvtvFfM8hhMPrEcrVmdYSTgnY7glyZsokeLz6z8Y7SlpumfCIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mtszKlaE;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874CE606A33B
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 13:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 874CE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mtszKlaE
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed276af91dso17493735ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577745; x=1795182545; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grVGPzydbdmfpJ8vlKQ1lGDL1axSE+48g8mGBT9KboM=;
        b=mtszKlaE+mXwg2j8jwSWBq6bfVInX7Jz0gO8y6f5j7WlfX1lYOBwGBLXtiUT9e1s9/
         +gLm6EBwrEKgIX/JnepZARgLtLZoAbg32wt7rpN+C3/AjG/2KaRVeR8F3rIQrLv8RmtP
         XrZgcvLaQkcpcO5i7AbvjWva58q+DJMXl3XGpCu4GclObVXsSoxlZ73+UvXSUKmC+wD9
         E+xO8HV+OAiVpzeU+Go9glChei3r8kznD6Tnqem9qAj/sCnr7Z37NUdJ8W8z41sF4d9b
         XYm8neYGzRR1q2PanTLisCh6cN2XtJA37xDYHoeDHDXNMbM/80lZpK7qU15XRFUIDhv2
         lldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577745; x=1795182545;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grVGPzydbdmfpJ8vlKQ1lGDL1axSE+48g8mGBT9KboM=;
        b=SqKJv+kQnS0Wijqbh3poMHB550B4VBgVzALT7Kj8EOkMLpUVxlQEknXffVpFqR8vRU
         G6IW5BO9wdCH5wp9HZxe6c69YPI+AYTfgHoDTM0YhiKIvD6RgTgGS6EiXcuTcPErxe0h
         a66FaQptViUZkyOtjR9n9md+W3Yg9FhQplPQLdgLIr/qJpAersbhxei2s6eIq53RoFD8
         8vWnz+Z9mIc1IzR8h+3o/0Mk1PlAyDUEPsm9r/2F6ZZxs8ESgBQD3IRXacjLF2u/g8Hk
         /YLpVaonBwEp9lIs4rSAB3H0Kq9EirmKhOO5ntBhkLU4jTHEGC1BNEJdfbnFwtEiZXHz
         aC0w==
X-Forwarded-Encrypted: i=1; AL+hErEcMdISGz8cZsXc0BvFY7/EA0/tjNte8utC9InMJGOkmMtaKLfjiw+apy1/LZrLcCrITrdVxjf03tJU2T3oStM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gCWDYALjLgcwAIAvgvsmeMR2kfV9boZ9jKRis026r6Dg6zEgu
	5p7QYSdvx3TWD8u51dWyOY/jVUU0g1k60wEH91CE21NMVHF/GHosU+wNvS+QhmhUwJ8K2lfOHoq
	92o1zZg==
X-Received: from plwp1.prod.google.com ([2002:a17:903:2481:b0:2e8:1aeb:b4c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2283:b0:2e9:8b2f:3561
 with SMTP id d9443c01a7336-2ee0dcadc6fmr25461925ad.54.1794577744651; Fri, 13
 Nov 2026 05:49:04 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:36 -0800
In-Reply-To: <20261109212248.996736-1-alejandro.j.jimenez@oracle.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109212248.996736-1-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441797988.78239.10997618370883122888.b4-ty@b4>
Subject: Re: [PATCH v2 0/2] KVM: x86: Fix physical APIC map routing for
 aliased xAPIC IDs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	partha.satapathy@oracle.com
Content-Type: text/plain; charset="utf-8"

On Mon, 09 Nov 2026 21:22:46 +0000, Alejandro Jimenez wrote:
> Fix physical APIC map routing when an xAPIC-mode vCPU with an ID above 0xff is
> created before a vCPU whose ID matches its truncated xAPIC ID.
> With KVM_X2APIC_API_USE_32BIT_IDS enabled, the existing alias entry in the xAPIC
> range can prevent the lower-ID vCPU from being reached via its xAPIC ID, and
> result in incorrect delivery of INIT/SIPI during CPU hotplug.
> 
> Following Sean's proposal [1], always allow the vCPU whose ID exactly matches
> the aliased xAPIC ID to install an entry in the map, even if one is already
> present. The full-ID (i.e. x2APIC ID) routes are still used to reach the
> higher-ID vCPUs in xAPIC mode, preserving KVM hotplug behavior.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/2] KVM: x86: Prefer exact vCPU ID matches for physical APIC map aliases
      https://github.com/kvm-x86/linux/commit/a64b916ef22f
[2/2] KVM: selftests: Test exact vCPU ID matching for aliased xAPIC IDs
      https://github.com/kvm-x86/linux/commit/a6d590ba95ef

--
https://github.com/kvm-x86/linux/tree/next
