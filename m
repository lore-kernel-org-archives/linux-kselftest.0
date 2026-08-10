Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F24433031
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 17:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384083; cv=none; b=HWdsoxPgErZBRyPhYSgAfV+F006ogy1jzbR0xrpBu724kt+FH9YpxBQLOYWU7LwsPRsBooOnLasMoasvyrLHFX0JZewZr5o9Zj27TvH5G7qezWzVywPk0cBL51yWXBZ7kGTTOAhmsh3ldIjfLbGqnjbPFq6oScLikT4liCP8zDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384083; c=relaxed/simple;
	bh=WV2Q9fWMiiBE2quaCNFLiWKbqMDhCIs+TWHSaxt0ih0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sJrz+gqcWVkpCKzUb6vQ2dVDfKBV1FelxcKcY4ad+kQVZJXq0TXv2m7dZVrtb/vb9ZZ6cdodBvBGqyYwOxZtQyKXhL0fFBuiUCfiR8P2nQjF9rANl7RHel/lqo5qtZN0ukO3muKkwPS65eGpd9BSrvVoF4oA7wlhX+uBQG0sSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XX/TmtLz; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XX/TmtLz"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so33924785ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 10:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786384081; x=1786988881; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SniDEAr8Q0oZEkC+DBXZ7AH2ONN7iandHQRV9KjayUM=;
        b=XX/TmtLzDVVI1lTUIBFQP5LCdvuwQcPy14AE09qrvA1Dij50/+VanqUJKPvHmbapoz
         ngGHI6q/bpYMezJ2nPrcmr5PSNV11iGrwYNu5wSwG4XhFyHFKvUnppZQne2J4RgoweUo
         5yTCDyz/zv4Qvv9De8qeY7BFHDiHa4J6HuwQc0cX7wZEVjV2N6x5VA63YyoduT92brzZ
         67twIlA7IWATvZtznIjJI9H/c7H7EBlTxnSt64cRT9E7UzLLDpOD/tCeawGJqX7DrR7T
         h6Dix8D29WPZCcnHreTYg/ZSjrm9XJ0XcnvCm5UEk6IPAUUrWSpC9Kl4ZZgZDle4Yo8K
         DwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786384081; x=1786988881;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SniDEAr8Q0oZEkC+DBXZ7AH2ONN7iandHQRV9KjayUM=;
        b=CmDjWQYI15xxuSRrqgAYs2i6QRdvrtRu5k1L2BvbyZibxIY7g43YPiQIVFTw2jCSNU
         Pyp83EDaIlRNMxgYT5dgFqQIsPS2c7tVyHh0WAy1Gu1h31GAQPVIDbT0LydFF4BrBJqw
         YWqkG8mkMNraXipEfDQoO7hdVJG+/X5Gj72GlNxsjkB+Pkds4xDaC4qiaACdNEeXqJGZ
         G+8+vYim1eILl/lmHh3YCtLSxPIuMvFo+3idsj/no9uLdCWstd59gCc1uQeKRk8nW2v6
         F+nG2vSwsf+r59TlwFP45tDv3DgQrWRJceBHx94WTtUge87fEDs0dtj+RFXWP28J5c1X
         tz0g==
X-Forwarded-Encrypted: i=1; AHgh+Rqcqa8PMxXiRPR+kvPPgusPJW34rcGvteCnMheWBXkxgJ5kpqypXL4QivEFQcJWKwcqIRvWvXSNi5C5SgMB8ew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9RmhngX8URDpS7luKneYDIlZw5t6KMdALAhnwpgLJaqWyczy5
	gV1YGPkuZ/MklYg1v59IbGmKPNYInCKC2PV489TOr6n5h9E1OdT6G0Pq2/1pPQw7CoSGo/7PSYK
	/CVvBmQ==
X-Received: from plof2.prod.google.com ([2002:a17:902:8602:b0:2ca:f171:2082])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea0d:b0:2c6:a012:6241
 with SMTP id d9443c01a7336-2d106a7e616mr344060945ad.6.1786384080573; Mon, 10
 Aug 2026 10:48:00 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:47:59 -0700
In-Reply-To: <20260728144954.355376-18-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-18-dwmw2@infradead.org>
Message-ID: <anoOz2rZ02KFk1l-@google.com>
Subject: Re: [PATCH v7 17/36] KVM: x86: Allow KVM master clock mode when TSCs
 are offset from each other
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 28, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Previously, a guest writing different TSC values on different vCPUs could
> force KVM out of master clock mode. With this change, only a frequency
> mismatch disables master clock. The only ways for non-master-clock mode
> to happen now are archaic hardware without a TSC-based clocksource, a
> VMM that sets different TSC frequencies across vCPUs, or a guest using
> the legacy MSR_KVM_SYSTEM_TIME (which could be addressed in future by
> simply updating tsc_timestamp more frequently rather than falling out of
> master clock mode entirely).
> 
> Running at a different frequency would lead to a systemic skew between
> the clock(s) as observed by different vCPUs due to arithmetic precision
> in the scaling. So that should indeed force the clock to be based on the
> host's CLOCK_MONOTONIC_RAW instead of being in masterclock mode where it
> is defined by the guest TSC.
> 
> But when the vCPUs merely have a different TSC *offset*, that's not a
> problem. The offset is applied to that vCPU's kvmclock->tsc_timestamp
> field, and it all comes out in the wash.

It's not though?  The value stored in kvmclock->tsc_timestamp is per-VM, not
per-vCPU, when using the master clock.  It's a little easier to see once the
master clock TSC isn't shoved into host_tsc:

	do {
		seq = read_seqcount_begin(&ka->pvclock_sc);
		use_master_clock = ka->use_master_clock;
		if (!use_master_clock)
			continue;

		if (!kvm_get_time_and_clockread(&kernel_ns, &host_tsc)) {
			use_master_clock = false;
			continue;
		}

		master_tsc = ka->master_cycle_now;
		master_ns = ka->master_kernel_ns;
	} while (read_seqcount_retry(&ka->pvclock_sc, seq));

	...

	if (use_master_clock) {
		hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, master_tsc);
		hv_clock.system_time = master_ns + v->kvm->arch.kvmclock_offset;
	} else {
		hv_clock.tsc_timestamp = tsc_timestamp;
		hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
	}

To allow different offsets, KVM would need to track a per-vCPU offset to the
master clock and apply that in kvm_guest_time_update() (and maybe other places?).
Which is doable, but it's not clear to me why we'd want to support that (though
I haven't fully processed the back half ot his series, so it's very possible I'm
missing something obvious).
