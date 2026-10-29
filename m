Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793311495;
	b=QqdsXfXaG1aYl4C08lCZea8Gsx8A1F65NcM9RDw19eQipX20ltjINl7hEhqG4OErrH9N
	 9NXy7qEVgGiIqOZyrElDCc1ZN0CBj7gCkLd9seogowBhFs9s1yIr4Avp/E79ohXGGyCy6
	 ocRj1CLNuJ31cP60KTPWNZoMxnZwBZUmJVyrXRrs1z9l4Kh2IsYU1UBPk5YeqFMP+mihX
	 +bQaYxUYo9IcqvyxuZDNg3oUpjeVKZ2htJFQ/tRcwG/tRNl76QHlDczFkoTSo17Egw6hW
	 cMolmSNH3eayp4PgxLnNRDUxou6amIWhyvdSVYIuOsVuAx7DYqhRkFN+MLcJYM3GWRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vcjS2XWAO2PVPZ4E8IA6fWD7RE9agLKIkmYjROKzQ6c=;
	b=fVAedlRkOCmzr9VRb1xYiYaPgqbK7VYWezYJX66uylFBp/YYUiNInoxjcFbAPnBG1+Of
	 Tz/fzuePRIF9mkJa+FQPKvIcisE6PWQMHDVi0s0B6tPl+fPJ3CeXAOJpWENHIjaj0oH0y
	 smm48H8hVYTQkwMxWbz9zf5/NRCNMrFKz1u7meBdY2UQWsgdsBlgZSiXz+WoSj0c6/243
	 ZiBHNv9TNhJ4Rb6D46hfzoa+WSnDMYHa78QvyRaY4CRp0FrRJUQt9vqNOwueEfOqNq9nP
	 C1Ic5T2sulcE+jfsz2VWFTT4rqdqABmal41RJskW1tsJ91oaxHpWDUs7l7oChGyL8iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EoZYrDRq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D713606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D713606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EoZYrDRq
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1765a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 15:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311494; cv=none;
        d=google.com; s=arc-20260327;
        b=WVTWOHu8KThuccQi3MK61cClAcvAGBdWJC+n2vN6wv0A18BzN9lgpo+XK3FO8kUfpE
         WZC3Uh8VfE+jc3Z4CjKPUzR5tgGFSZX6kAv4i1z/jPbu0gaH/GapG4SnCWhWu+BHVXCO
         9fcVjcKpt7lCPrIAzTmX4NeVco1evdDrzXDURWSNcPV93Vs2qa8GRcnbAkvlbx8J2JTl
         B0zegJoeLkKy0+YEi3ljnaFEI85gqPLhRWszUCdmnYNQXjho4svp7aEs/o08Lao43uFd
         3mIfiV/suwsvbX0+VrWlBFuUuZDOPOyCiJ5SoKtYrwzBvtl21LYQOLx3n/dDS1fW6VpD
         /8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vcjS2XWAO2PVPZ4E8IA6fWD7RE9agLKIkmYjROKzQ6c=;
        fh=w6HEzw5Rw3OSoAOJpY5L0LjESkoHD897tUIbfa2p5co=;
        b=scKNItINcU3WbmdJsPD4xYRaxDOGELAdrkDRU6HxP2QZNHbxRlU9H+3ECHgbW5z91c
         XEQv6dA8dIDQBmwszCDSJW01S810/E9pwG/I+tHDa+9MHNrG/Gq2RTTcP0KLbrJpQsLa
         BlIei+M4kKxr5IuOgEcwnZFE0qZh66DQpGe6GNUm6C8hFA2UtlRcntSQgwrXo0oT+7mf
         d+tcx0qG43cfAMRCY0kOdGpZCjfiwgraf34PdPtXGeMgqVpz/pkO8QmSCpioxx/v8H1G
         WhS740vGi0+WfdkJp3E/QOG52qKVd1fg7PXpergymAZluNmRteBO6NpGZ0EVctd/jCjc
         d8tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793311494; x=1793916294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcjS2XWAO2PVPZ4E8IA6fWD7RE9agLKIkmYjROKzQ6c=;
        b=EoZYrDRq09IAHfGFnB6PhfFCC8BohHQL3muqXimashHCmHChePNgkWhfxO9y5MpA9Q
         Y/Ry0dNNIBodVgVAZvKmaTm05tvUuLIjs8k515ashbM6WctShEhMk1OOh8+B4xfpDNgW
         S0qWb2UfXumsusqqhYlwb9ewzluD1G/lQhSIDJyX4BcREmyCJzBUacg/A3GSFBa3fdy6
         kHGqSR1gEJzIWieotrGcwpdTnXERAC41+PfmfXz5k6Ugc+2qygD9Mqy82uV2mVMyyJ+A
         38lipn9hFrNT9H/JgkUTQWTvL59P2MzRKm9Ww2Oo1t8S6keL75vN9AVGmi02y+Ler8aJ
         xKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311494; x=1793916294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcjS2XWAO2PVPZ4E8IA6fWD7RE9agLKIkmYjROKzQ6c=;
        b=Mb+NfAGycuQvfR9usobMI0fdoSH4hBPs/BrOdMNXaeNxK9e6K7Yz+YUZ4NsP0LoWbV
         /VuMlyr8UpR8ok47/BKXTo07vz3aFK03EWp438yGplbW7mlMwNjGmjzxJWX6X2GEPJEA
         smDbbjw1HhCtz95enqn6JbmulbqP2QDx0g5jqkzsXGdefX8b0RUbug4u61nQnN1ShUc5
         QIaSx+LY5O3zPuYtdi2n9Jxcz8Gxplt8GWLsETUAk0q7y4sIm/QLHtjCoZycpb0p7gu+
         VxTLkV2Wbdvakvkq/AglK4MpcXG7qblsewUdFFnylp9NHQw2v0NYvFYgpTfAxXM3Ig8U
         I+0A==
X-Forwarded-Encrypted: i=1; AKwUvBx2drNBskAg4KaEch1PJS5t7YUNh4i26dQKp8HjcoZG/56vpn1ElMDBVvuu2D+sTSNInI/K7ShUMSWW0OoK8eE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKASHvtlgqJ+ZcfVMxygGao40uKvcmcuwOMBx4ryzgBRH3CvHI9
	N3gMaGgmZKzKjueUYAXqFOpmgYjr7uH01sEyLS2HwjwZpzkgCMAH1HL845N3jmwtjUu4tQrXRct
	xXNQ6vz0udhBo27V8pQB6vWaUWoND8/WauXiGw0G9
X-Gm-Gg: AYBFou26GEVYv4VTTI+THZhAs9zpbodxgDPNzaOU3bV5XbeV7ZsYIGWtDxDNL9Wji0k
	jeHsTPePgi/1+HHIj9QCF2vnAFOzILFDh1D84mrdnigHMi1HcoW5e9JPC5xwGsxvP6HuV7XyIir
	8xpmttnbVM29NuZELkoOcwZfDq0XKtI9sSkbaQY8kLTJHkq8cR/5vzO+T/PIYtMKCkyiECYL5QU
	5SLH6HECB5aT+ieLQ5xgqeLgHZ5TsNr1Urslja4twSryHIUfbjKlIiPs910X2ot9Si4CApMYBgM
	r7UkvrKtuixWHRueYvqpSvoy1AwQctPnTOGmwlL2WhQRGHNwgKijct5AWwch1+54xtxoextw6aN
	YAnCZXLv7KTs6M9be0kHKt2zmfDWlayFCRzWUMJOjoGYwjaPCkTsGlSXe0g==
X-Received: by 2002:aa7:d3ce:0:b0:6b1:c6fc:aba0 with SMTP id
 4fb4d7f45d1cf-6b4b38e3229mr100799a12.7.1793311493406; Thu, 29 Oct 2026
 15:04:53 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com> <auO4UueaV0mTVzzB@google.com>
 <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com> <auPAFxXy4ulcK_jq@google.com>
In-Reply-To: <auPAFxXy4ulcK_jq@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 29 Oct 2026 15:04:39 -0700
X-Gm-Features: AclHuK_ENQe2XaR80YT1-r3wPysVO9nAq8MWJ4g7grxHkMKrLjeivCR9yTj8Qmg
Message-ID: <CALMp9eQdtvjQkdgnJ_NTt=2ArdzUtqqzieXLccv9Vb_My5G+fQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 2:52=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Oct 29, 2026, Jim Mattson wrote:
> > On Thu, Oct 29, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Thu, Oct 29, 2026, Jim Mattson wrote:
> > > > (Host- initiated writes are allowed to set any valid MSR_VM_CR bits=
.)
> > >
> > > Eww.  Why?  If we allow this, then we'll end up with the mess where t=
he guest
> > > can't write back the current value (if userspace is being weird).  I =
get that
> > > we want to avoid ordering issues, but there's *already* a required or=
der here,
> > > unless userspace ignores the failure from svm_set_vm_cr() and continu=
es on.
> > >
> > > KVM doesn't advertise the MSR as something to be saved/restored, and =
none of
> > > QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why make=
 trouble
> > > for ourselves?
> >
> > OMG! I didn't look any farther than the obviously broken svm_set_vm_cr(=
).
> >
> > It looks like svm->nested.vm_cr_msr controls nothing other than itself.
>
> LOL, nice.
>
> > It's just 5 bits of storage with some weird locking rules, and it
> > resets to 0 on suspend/resume.
> >
> > What is the point of such half-baked support?
>
> More than likely, so that older kernels didn't crash when writing an MSR =
KVM
> didn't emulate. :-(

You're not going to let me get rid of it, are you?
