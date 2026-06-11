Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51032D593E
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193361; cv=none; b=XB3gnWECJNRatWrd1Py0nsLHEw2mY1zOrQqAeEeX9lzKr6wrh5HB/bnWSWrUflQgk/lOAEmKmXn/qAS8I4Ncpq8eKx1AlkAGcOY6RGA47uTCLUMF+0vFm3+Fv/Q2WsrqV66+bcHqdaNJu9yGTO+tL+NfVWf5q7OcwuxkShTKBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193361; c=relaxed/simple;
	bh=DkzbHjRhWyLIhZObZzEQ6rv+ZmkhQxYL+azMEAjGxFc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u5p72Oy5GX38VZVOJtCDwEVQNh9Zzwk/GoRopyHY/Jj7rdLypA2cWGYIUG9uB5iFawowX3DaZeauorUf08fxNeK5fdtxNPw38uP2ify4DoWMOBNSuhiaYBX4BclVFgPdBhVbHZZ7iOIHlI3gJuAELkdQyd7OOBBHP/Lr+hf+IQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K9nwwkLr; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K9nwwkLr"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c354050c34so4981795ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781193359; x=1781798159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+njslxGsjU9ovOWXP51cNMoTFVtjJDKCZoq+4hEp5pI=;
        b=K9nwwkLrRXFYN6qRvZcnjtPM8OinGoQaYYO6lSVxTh7RQ6jTt4N68BAlkQtnG/4BUd
         fKvvrqcRob8BIcENZ00mgKG31ZIi2RzRRtdegmIBLETc53hJNL68agr6yy9gEyIyPeuo
         O17DlQKqpu9yPgbtGpmLZIhnUb0yhF4sJc5fLs760Kx6VPyti9HP4t/9yRyWzav/kH4j
         /sDWOQqW4eQsrJ82avaACHTSE7TPaYGknRzDmEapZ65gAAinRG/KuzqMRaEZ6BMDPYth
         PgswiNJm74Odo9O81x+hBaViHXpn4p9w2Wa2KMjgjv/hUx4bYb2wuAZvRRsukUMMbfYD
         R7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193359; x=1781798159;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+njslxGsjU9ovOWXP51cNMoTFVtjJDKCZoq+4hEp5pI=;
        b=CrE3rWya3LRNirysoMJlu9/6ubMFSwY9KGjOJiKIwEq5KggZRG6DNHCdBF8iQONIeg
         GmxU92rmgZk0HDXky2vVscT6/9EmYlbQtVukSHoMOnwlX6wIqtGGv1/h6abMs48suOIM
         Xqcaqa7HyPIlf2iwh7WZbU43StOfjlJRFgBFJcxIZgtAcuJXBQPcjS3zLg9l8+eUh8QN
         FMySsdJhkrr20LdQq4PwH94oatOyenmA4ir6HIlv13sV/t8UD71+b6/BKqC6IBbXJ8a/
         GOXKxr2N1C+TwbNMTXxGq/Q2vySCLWVTzrVGlHsd9EV3S4Kgl8jjjnzAyKmR+dL1HFTu
         bGGw==
X-Forwarded-Encrypted: i=1; AFNElJ8F4iyI0bxzbAl3nanKCJ839EBIiSNADXfJywA+U0Z1/1KcHVbUaRFXPX4xBnFFPPgqIX+KejLLNbbafgkO8v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqxOSOFGHruq9dDVBRFQp3BCWNJTVO0GiKzTWQsyFVHwbeG7c5
	JJh94zEdmLUcsB9Ss/v8KIQxUWQphKyC3fUYXspABdBl5X1YeCDUO2UQITXH4uym4vmep/i1kvP
	HTC9s+Q==
X-Received: from plbmc11.prod.google.com ([2002:a17:903:2b0b:b0:2bf:32d1:a319])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f550:b0:2c0:dd75:e824
 with SMTP id d9443c01a7336-2c2f044033fmr38411955ad.4.1781193358972; Thu, 11
 Jun 2026 08:55:58 -0700 (PDT)
Date: Thu, 11 Jun 2026 08:55:58 -0700
In-Reply-To: <7428996952122d5943715c8682c6ad1c353566f9.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260102142429.896101-1-griffoul@gmail.com> <20260102142429.896101-3-griffoul@gmail.com>
 <7428996952122d5943715c8682c6ad1c353566f9.camel@infradead.org>
Message-ID: <airajin7CpO8HoSF@google.com>
Subject: Re: [PATCH v4 02/10] KVM: pfncache: Restore guest-uses-pfn support
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Fred Griffoul <griffoul@gmail.com>, kvm@vger.kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fred Griffoul <fgriffo@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026, David Woodhouse wrote:
> On Fri, 2026-01-02 at 14:24 +0000, Fred Griffoul wrote:
> >=20
> > @@ -55,6 +70,27 @@ void gfn_to_pfn_cache_invalidate_start(struct kvm *k=
vm, unsigned long start,
> > =C2=A0		read_unlock_irq(&gpc->lock);
> > =C2=A0	}
> > =C2=A0	spin_unlock(&kvm->gpc_lock);
> > +
> > +	if (evict_vcpus) {
> > +		/*
> > +		 * KVM needs to ensure the vCPU is fully out of guest context
> > +		 * before allowing the invalidation to continue.
> > +		 */
> > +		unsigned int req =3D KVM_REQ_OUTSIDE_GUEST_MODE;
> > +		bool called;
> > +
> > +		/*
> > +		 * If the OOM reaper is active, then all vCPUs should have
> > +		 * been stopped already, so perform the request without
> > +		 * KVM_REQUEST_WAIT and be sad if any needed to be IPI'd.
> > +		 */
>=20
> I am unconvinced of the veracity of that claim. We get here via
> __oom_reap_task_mm() which has explicit comments about 'might start
> racing with the dying task'.
>=20
> I think it's actually fine to use KVM_REQUEST_WAIT in theory...

Actually, it has to be "fine", because KVM already does KVM_REQUEST_WAIT fo=
r
literally every releavnt OOM kill thanks to the kvm_flush_remote_tlbs() in
kvm_mmu_notifier_invalidate_range_start() -> kvm_handle_hva_range().  So I =
would
say don't worry about KVM_REQUEST_WAIT here; if we need to fix anything for=
 the
OOM case, then we need a more generic fix.
