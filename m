Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341695;
	b=nWvrEvTA5a4jgF19+P/D0D2oXiMFgpIVy63IgLQJWkloenL7W65yh/5+Yhs1KepWemwh
	 cKowmEpQqfyXcq7Iq3bF1xz9kaxliyAFsqWWWhB17VcgPkpdoQrMdd/XGp+6bFCuuCda5
	 /A99CBEM1wr1qqUS99hemdVpgLSrd0Q+G0wk/2/MhMrnCUkd7W9Hr4k7vOiqPyg6Zwdj9
	 T3Bmgo4BP47W8QuvR2gQkvsIRrlv0NQQgwk8K0uT9Y9sg/Cg/oSUPu/JNhvOEqPLQHk4K
	 OcL+L515vPq+XX9nK6kfS5BL22PbD3Wi1IrGJpOT7pKgkMsMDr44rDhp9Gu63Nar2nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=14T1p32+VtvUlhSErH4xscJ3EXnpusJwKW/S5Km45yo=;
	b=PSyTyzJ4kpklemUFPv8IRrYSR/7uz08ImQXSmdt105ZxZmkQ+3nnnHYHoh95ZTaUvHxa
	 oSvy7/P9DAkypXGWYlePYkjxI59kbRl5UxLekzNqtfubLxWYVjTjlqHT8F0XGZJaj6Fbg
	 4rZFOO0BjiML1kK7zwvJHkhqymc3ZaOEzT7tdySwveuCCcf0EWD1RRIRSBcsh9JU5b9BN
	 woq37qH1C883KUMcOL8FL3pVh21j8TvMhW36oQLU6FnAT3vTQaZM5KidGaAuaVMO7OEGl
	 vYYI09/RcEfKF9PHKE31QzBBoXR0w+a1/f4MEXdR8TrZPNfhYYNIPmg1fVENqYQfrUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LwiHVhPi;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3B606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 20:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D3B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LwiHVhPi
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08904845so35940445ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794341694; x=1794946494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=14T1p32+VtvUlhSErH4xscJ3EXnpusJwKW/S5Km45yo=;
        b=LwiHVhPi4e5g2jJg7nU1IvdqBzyzYhNnzRG143klAGsgg4KHx0IBXebsdt84Xu5Wib
         pbMwqJaPfbwnguC+Mk7Hu3177pzJha7j+Y4TK2uP5Y7okUMxO4ta7nITVUPnHABZumeg
         T+wn42JzHhCRHQee7bZsxmBKWD6nQCMAMg4lQUlnz6OHbvFnMZKaCk56W56QHoYY4wP+
         iZocqzGgiPMwgfKo/aw2+eU4rJAV5XwrBOh9Vte7vRub8IzOZBgupShNuriPaxh5E901
         WUyjRGkBqGpcuqaCMUGMygsykzGNluKAO+h9nIzTMTaG66Ma0ZSMUslT9ux5MlM560ku
         qcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341694; x=1794946494;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14T1p32+VtvUlhSErH4xscJ3EXnpusJwKW/S5Km45yo=;
        b=xWop70mYpizUTtQLWsCgcD4a7cWCYfO+w4K1YO9/CGzuCMe8WsjH2ZN1lSfCBnJbFP
         UK0QOofbibCxGtpPIeufxAcgMnAa9BsOlt4CY2dxIy5kDOFEBruNsqsd/6Do3k5TXuLC
         Vm1r4C5jfgt4WmzNv1TGVdajtRsLiC41RajnXRBVZ53j2nWsHzD+jKr6LByT7HE1GbxN
         ywAFCD/2mbLuHfZWbZUiOb6yoqhj6wHOCgBIdxWaPPdO8nSY2ylL9ivqBAffmcfK5CiC
         444fCDYgVczNZPQhjSvNYUjP3tru9civAr3X8kqdOZvJjXm1aMIHQLww/XvKIkLAq3mZ
         f90A==
X-Forwarded-Encrypted: i=1; AL+hErH8UVuVZG8M+jAt5nXU+Fycfh5E0dSuqf91/nSuq8yO1PPWxl2qHD0ORxLwz07RoHzsXyajZaA4gCOJ8QNaw/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QFZXtV8SOoU9/KltVdijianiVFjnz1rn9XeGnyWv0gpoSun6P
	otADTgqy6BY/hvFt0G8PyfDGKez560kEMQWwLQoKHRtY+4SzmPrnCHEej6HdMoL46g+jjzswQGm
	xf1tAvg==
X-Received: from plim16.prod.google.com ([2002:a17:903:3b50:b0:2e3:bd2:38ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:904:b0:2e9:4048:3031
 with SMTP id d9443c01a7336-2edd7a1102dmr2284595ad.39.1794341693808; Tue, 10
 Nov 2026 12:14:53 -0800 (PST)
Date: Tue, 10 Nov 2026 12:14:53 -0800
In-Reply-To: <cd458ee9a0c2405349cd2aaecb180f0b2e757aa3.camel@infradead.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105020104.2507083-1-dwmw2@infradead.org> <cd458ee9a0c2405349cd2aaecb180f0b2e757aa3.camel@infradead.org>
Message-ID: <avN7PfMdfZcYl7Gt@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2 00/20] KVM: Use atomic SRCU for gfn-to-pfn cache,
 reinstate guest mode for x86 nesting
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rcu@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Durrant <paul@xen.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Fred Griffoul <fgriffo@amazon.co.uk>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Kunwu Chan <kunwu.chan@gmail.com>, 
	syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026, David Woodhouse wrote:
> On Thu, 2026-11-05 at 02:00 +0000, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > Based on v7.4-rc1 (kvm/next doesn't have the atomic SRCU flavour yet),
> > this series:
> >=20
> > =C2=A0=E2=80=A2 Converts the GPC to use atomic SRCU, ditching the rwloc=
k which was a
> > =C2=A0=C2=A0 scaling and latency problem, and which PREEMPT_RT hated be=
cause it
> > =C2=A0=C2=A0 turned the rwlock into a sleeping lock=C2=B9.
> >=20
> > =C2=A0=E2=80=A2 Fixes the pre-existing bugs which torture-testing that =
conversion
> > =C2=A0=C2=A0 shook out: a guest-reachable dirty ring overflow from the =
hypercall
> > =C2=A0=C2=A0 page write (128 pushes of the same gfn against 64 reserved=
 entries,
> > =C2=A0=C2=A0 without PML), and a lost TLB flush request in record_steal=
_time().
> >=20
> > =C2=A0=E2=80=A2 Adds KVM_XEN_VCPU_ATTR_TYPE_WRITE_HYPERCALL_PAGE, for V=
MMs which
> > =C2=A0=C2=A0 intercept the guest's MSR write and need to replay it from=
 host
> > =C2=A0=C2=A0 context=C2=B2.
> >=20
> > =C2=A0=E2=80=A2 Cleans up the intentional lack of dirty-tracking of Xen=
 shinfo and
> > =C2=A0=C2=A0 vcpu_info pages (Sean).
> >=20
> > =C2=A0=E2=80=A2 Converts steal-time / preempted status to use gfn_to_pf=
n_cache.
> > =C2=A0=C2=A0 (Carsten)
> >=20
>=20
> I love it when sashiko-bot finds things which my own local runs don't.
> I'm still iterating on the latter part of the series; I think it
> probably makes sense to merge the first half (patches 1-9 above), and
> the nested parts (below) can come later.
>=20
> Sean, what do you think?

Ya, I'm definitely in favor of that.  Even if Sashiko didn't find anything,=
 I
think I'd want to grab the GUEST_USES_PFN stuff separately.
