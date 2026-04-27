Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F663B7778
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 23:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777334251; cv=none; b=qJYty9TEYfz8DhLA7x3XD8saUY535j+xIX7LfGQRMsae1td6Re6UUtUUMb8dj6x5pObhXKmwj5SK0GOFbL/reP9+vNE4UT6RRYVPuMt8y9m8cX6SFYabZujDkF8mETOLblSo8QumPIF0Rwkfc4xM6DvI3hWA3eajepn4xNvU6o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777334251; c=relaxed/simple;
	bh=86DrBS62pVYvlVqPazZF8WmjJYiZ2Z/t6aa8S1r0X3w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T5s6MLML6v62VYD91tNzJ8/HWuHhQsChiaqphwr7ZpDnAPCiSmPBIw8DsjDsSsugEpS0gaoiXszR/82qEPxjX/hNei68h3196Y1h/ClQn+Kmyoicu8wE+/mZWN1KdHStnBuSCmuESvxDh99v/f/tcYGH8Z6zI/MNaJNL2EANvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9VHBvKw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9VHBvKw"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso12982384a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 16:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777334250; x=1777939050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/RnEqD3499secxRAPp9I9KKYomN5qQi1oKzwuOX5gA=;
        b=D9VHBvKwitU4nJ1n5/c/uZ/me8tC5so4C2bAqNz9NzkXy5QjZmdpeRzFpEuIgmwx4h
         YF2QBRb0kSQjlW6w1rJx8lkOSUSauofdmEQXKrsfJRRajt6yoWYaN9NKetshG/dq2ouX
         Flq2xLObhAcdc7yL4ko31C2bqQUFsdjIcOlj+/rP/mTf2Hxd6Lhmu66gkgVkj4oTDKRh
         unNGjnhZ9f0GZRBsbXwkt8XF/K2gt46t46Fmxi7fi3DpUBGyZHCNxKSUVyXZrcEkJ2PP
         JXehv3vIuaWMDYbNeJbOgIuCZU7+q50paFFjGlr8EZV1OY5dNzMMWWTmn9iCPUPLaU0M
         WbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777334250; x=1777939050;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r/RnEqD3499secxRAPp9I9KKYomN5qQi1oKzwuOX5gA=;
        b=N/FYredn8HnjXRDHVQ+hGBLM2GdDU8HOqQh6yWflN33hOAZwLEYUfMSkPAPhyvAMwi
         E+a8YGeFthHwbKDUV+DdlWyVYFmcJFOYFjozjkU2gtvOksv4XEXBpgY0gY04Fe2GtpkG
         eBInBVtHiqyHc7HHaUATGFYnlhsDxjPbCliK9eciNbIFMfKDPfxnqp6Q8+tLdRx+OibH
         1UiCyyDfgL3R/u8iWxeiL/3V6l8CWhIIjcpNJW4ELicAjKtIDvqBC9npgpo8xpEzt1Ik
         BMnVbbSmGflc/+LJ4FpCDaN7oQDXcJ6QUBUnLnpTYJ/seEuPSMCej2daD9G+MstagFr+
         yQFA==
X-Forwarded-Encrypted: i=1; AFNElJ+2AK+4YUbgjQsOC3OKI6ZmQ4zlu76qpgfZTFxTlzTwHtYD3vvuCMPAN9KK9K9asAIOrt6XdgbLfmHFaVvjr6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/aBBwWKK0N6Q+e2AizFcAFIIi9kYsKG4a1iPg3D++PxHtQgU
	K3ohz5s8EzNjll2CEFX+Oug44k5Iq1OmJxGoiYkukbihcSwsDlDo9DcEzAyQQVJPcM9tOX0dbHm
	tOQgIHw==
X-Received: from pgcl22.prod.google.com ([2002:a63:7016:0:b0:c79:22b6:a345])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:210b:b0:398:7256:3c0
 with SMTP id adf61e73a8af0-3a39c12aa43mr912602637.13.1777334249978; Mon, 27
 Apr 2026 16:57:29 -0700 (PDT)
Date: Mon, 27 Apr 2026 16:57:28 -0700
In-Reply-To: <34e88a990e667ee402238a13a63b224dea1bcfa0.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260427204313.50741-1-rick.p.edgecombe@intel.com>
 <ae_zx9cRf8HQwvpX@google.com> <34e88a990e667ee402238a13a63b224dea1bcfa0.camel@intel.com>
Message-ID: <ae_36Po7n6JDrkxU@google.com>
Subject: Re: [PATCH] KVM: selftests: Include linux version of mman.h
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026, Rick P Edgecombe wrote:
> On Mon, 2026-04-27 at 16:39 -0700, Sean Christopherson wrote:
> > However, for mman.h, we actually need both.=C2=A0 linux/mman.h provides=
 the bleeding
> > header flags and definitions, but sys/mman.h proves the syscall wrapper=
s that
> > selftests expect/use.=C2=A0 The below builds because sys/mman.h is gett=
ing included
> > elsewhere, more than likely by tools/testing/selftests/kvm/include/test=
_util.h.
> >=20
> > Rather than updating individual tests on an ad hoc basis, what if we tr=
y our
> > best to handle this once?
>=20
> Sounds reasonable to me. But I couldn't find the base commit that let me =
apply
> this in order to test it.

LOL, it's probably a good thing you can't, because it'd be a bit embarrassi=
ng on
my end.  The shortlogs I have locally are a mix of "tmp" and NSFW exclamati=
ons of
frustration :-)

> Do you want me to turn it into a patch?

I can just send it as a patch?  It'll probably be more work for you get it =
applied.
