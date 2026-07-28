Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC517A2E8
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 00:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785199780; cv=none; b=jzQvVeLBx9WzuIEIojQM91w2pCXePklolizRmJenXxahscqhnxbzgwqSfT0t2G9wSMCwD/j8GSaiavBaN5XALCM8YT/OSPC+YMbmMTaxPAEF+uYoqE5mMWDdrTGFQrrY4I+/oASb5sOacRpXlRGC6i4fETfHsnt/6mFBeIHE+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785199780; c=relaxed/simple;
	bh=Avss/Th/eHcXGtQaqJoRk/xBH7J6kl9mUhB0SVTtack=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gcegMBj82jqwKtpYRUeogahjXqgxvgWh7dfs7OSQNEEO3ESrX+W5s/CkcchPDA5odOEEcYhW/RyG/8N8fPg5nlRdDQrm9dpuRZ/Oqsmd4LEVBVek8o2ToKl/nymH+3O5CbpLh0p7JOl1T+ev+ANN9mKsZOgkKVeD0HBpLV6550A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A3s+DuDV; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A3s+DuDV"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so4006097b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 17:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785199779; x=1785804579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rh58w/CoC195RwMUiGs5mRBV6pN+0fX10aJLkQo2qUM=;
        b=A3s+DuDV1P4t/ObTHfVgzroSfdGHRpCQPzyh/OKzQt5Qcjw1r+AiPKjrlKvnWt7HHo
         eF6L1LJefqu5Wt6U9UjnhdR1mhrZTFKorv2TUeYvQts+e4mHYNMqI8hFI6xB0cxU9Lw+
         atLZee2JNMpa7OkXQwWmkqg33FUsgkdSJTqpwkOty0pJsL6GUPLxmiGISo2h5EhmFJEs
         9eS/EN0nJACM70HmW6RktOxx/8E0GlzAW4gP6F8BEWenJLE+d0DBOX54nCmJJ3npFDCH
         KDQLe2k0eNz5W5ZixNy7EEVfDOdj9jqY49lJIXfrdTHyuh7/KGLyH/6E5RIr4IOLIFdj
         3CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785199779; x=1785804579;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rh58w/CoC195RwMUiGs5mRBV6pN+0fX10aJLkQo2qUM=;
        b=XfNm8jCv+NvdPamxB7CnvSrQmFsCTPHsEbahmAc7jlY1FnlV/T9vd2AaPcDG+El7lH
         8rxlRlAsOSXvHUI+FO3+4fM18qmolM6/Dxtp/SU+MfG6wQSEhjzUxEtTD4ll7YEyEQ9Y
         AZgT1GxTunFgq4QlPioi49LZ4bPjNNfObL62EyyVhRnx+tXjSciPQjsySNHIW2JO4AaU
         eQ6sqhUSxEAoVWUhJErHFPjPWZ7Rx8CEc7FTFC4wHE3iKCNydk3tVlcZ8mKWJZ/sSUjb
         +yh1eMRbQm926EF8F0ni8FBZDoPHHWPKUSoW6zYYTEydtxwXeT775MEiWyftsl7I4Vy2
         P3Ag==
X-Forwarded-Encrypted: i=1; AHgh+RqiPLY68gHm7qNIPacgiDNgQgXAN9HG4pcf1Gs9k1gcc61YAwpoloAxh66E8aHsGVa7Ns+KiSZGrtD7TpnoHaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqrnVta35aJpgtfax8GTmFCOo6iHcaNNg3m250eILh4yVOznCY
	7vuN2pI8VJzipqzunvwHgpHveFRMhxQ2B/fzUG4MJt0C5aa7kpl1OV7o9miPi71k6aXRq6kAHUy
	Dyu+gvQ==
X-Received: from pfjd8.prod.google.com ([2002:a05:6a00:2448:b0:848:416d:e7f3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1743:b0:84a:2d5c:528c
 with SMTP id d2e1a72fcca58-84e93338791mr163480b3a.61.1785199778667; Mon, 27
 Jul 2026 17:49:38 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:49:38 -0700
In-Reply-To: <19ec3f984a494a0d5e97b8d2fa843668b953a212.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-13-dwmw2@infradead.org>
 <amPZRkxTLE-rZcJf@google.com> <19ec3f984a494a0d5e97b8d2fa843668b953a212.camel@infradead.org>
Message-ID: <amf8okZRWIL2mds7@google.com>
Subject: Re: [PATCH v6 12/36] KVM: x86: Restructure get_kvmclock()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026, David Woodhouse wrote:
> On Fri, 2026-07-24 at 14:29 -0700, Sean Christopherson wrote:
> > =C2=A0
> > > Given that, the get_cpu()/put_cpu() pinning is not needed either: bot=
h
> > > the TSC read and get_cpu_tsc_khz() are CPU-independent when the maste=
r
> > > clock is in use, so drop them.
> > >=20
> > > Wrap the entire use_master_clock block in #ifdef CONFIG_X86_64, since
> > > use_master_clock is never true on 32-bit (host_tsc_clocksource is onl=
y
> > > set under CONFIG_X86_64), and declare hv_clock inside the block so it=
 is
> > > not left as an unused variable on 32-bit.
> > >=20
> > > Use 'continue' on the master-clock success path so the non-master-clo=
ck
> > > computation becomes the common tail, avoiding a goto and label. When =
the
> > > clock read fails (e.g. clocksource transitioning away from TSC), fall
> > > back to that path rather than proceeding with uninitialised data or
> > > spinning in the seqcount loop.
> >=20
> > Please split this up.=C2=A0 The changelog suggests there are at least t=
hree logical
> > changes here.=C2=A0 Yeah, the series is big, but smaller patches helps =
with review,
> > even if it results in more total patches.
>=20
> I don't think the latter two are separable; the refactoring of the
> ifdef and the loop and the way it breaks out to the tail are all
> intertwined. I may be able to pull the get_cpu()/get_cpu_tsc_khz() part
> out into a preliminary commit though. I'll take a look.

Yeah, that's totally fine.  I specifically want to isolate the removal
of get_cpu()/put_cpu() and the removal of __this_cpu_read(cpu_tsc_khz), if =
the
rest is an interwined mess, then so be it.

