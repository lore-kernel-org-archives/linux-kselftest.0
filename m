Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793310391;
	b=GnIlarzv+GKwi+LM4xDmY090WzoO2nUQTUROJTcJ+GbaqdKCymImbI5MMXh/kfI++uZt
	 nfzK8GFdUbxebkEQrzPrLJA8Ej4s4LW0KaJEm9HomAnPHAgDP08WqSll/88ab1lbcK3gJ
	 adVLY4/7wbH0ICdnADtvhmMRhMx8J4Z5IibNZPzhw6B3t6BoBUKOPDntLSWVbRbtHXcDM
	 LvSWSmaePoU5Ve09JIFnGaAlzXREvGmQImmovtLV73iDSys9N41C7S0t37jFMtTRGrnzv
	 n7DbFf19PB4fWQBNtUaNNs8WhV/oGwqQo9Lf6/JuaNyuwFHspzhrWPS3q8uC3hX4KbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JYWLRbAAA76l2zIS8Fp/p/vFZPUiy9vOWrroeHgM1YQ=;
	b=fDcje8fn8OVkGgPRTzcxUzd0hyWifqK7Bgmmw6Dt93ksQ+210ViwHLGr1tHgEzJ6MvsI
	 mvE3WtzDe7XvxLDaI3MfSZHQv/n8BRJ4FIMyiS+5RydR4pzlbFT3PZVlPc7LvO7sDUovd
	 lVXu7l+m3WAKBbsBPmDersI9tkNF0gGTvhnay+WxS0RLYJYjBVxCRnbmhP8A6uP0yE2uI
	 4A8vLZI3XuiZ4dJbKdEsLgP6UKdczR8GB7rlIraS4ZhYsiIISR1ruKarg1fs+pSk4K4ax
	 +Euu/pPpcvsW3a8HaXGQ8ZKGMZV1ODFaVxOAeb07uWp5Jg84usNOV+sYChS06ld8Z+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I4dlR2qi;
	arc=fail smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEEB606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 21:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEEB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I4dlR2qi
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1770a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 14:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793310389; cv=none;
        d=google.com; s=arc-20260327;
        b=HhckTvhQ6Ow2gaYOJn++/WstDVNAh16lZZUiBpQGt3+8EzBj2JHWuxw3XlkJYAdEjh
         m//se7Y9ntM9GyDX99i2Sb7fpTVIIoBTx/eQPqe4FIDN5oTrnIbhTkJqyduJQTb/k0oV
         gEnW0sB0qfVqof1/e7ffukATIJLeGndXqhTpHhCzijAjusZUJHjaZF+g63QltuTPG7sI
         6baS2OZqcqT6YGjB/2XMcXB320R4U8pegYsRwYQCYI/9LwNTMSFXNsKx0xQhFHbagLPD
         l09nathJ8N0oCsyzm+BLd/C1Bxa0ioppcEbq5j2rUKcxThuK87+fcC+YG0wzY0tdc+LO
         VjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JYWLRbAAA76l2zIS8Fp/p/vFZPUiy9vOWrroeHgM1YQ=;
        fh=imRqstGJhSN1LC2gwOkTMgMTqyPFXLA4m3xM+wjUv6g=;
        b=i3HZdHd1/+A+xbHUnjgYaobrXwKbpC/NgYko0Hvxw+N/SRtW5hQExb2DPlWUfrJ7Ei
         XipxNwML9U+5PQL0vt1EDuv2Hag+mTI1qExoewYIMdFiE5QpJyJTTj7Fh7QWAor4OLkC
         wR5KUSfOTojxokmxEqNRpWTW7l4WMjFVBYCCeIrvJ5NR7KA7bHx2UFQvYUtHjPvpWTCy
         CuV1fTCU8TdyGxQsrV5mIJ7Ctzx6IS0ZWyH5QnNIVz3r9D8Vq/v/lIiQP15PmE5GmeBW
         3WP8uDaiW+ffHERxRJ3sfM6zKlv09xoxAU1t2jWYoeut5cuuZNg8/2Xy0yScYwRUG/wE
         W88g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793310389; x=1793915189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JYWLRbAAA76l2zIS8Fp/p/vFZPUiy9vOWrroeHgM1YQ=;
        b=I4dlR2qix7SJc+PKkii8t3EDI4Z1KNkJtuR7HIXzCQGlrGjd05cDkYsOP1Hy2gc8SL
         Dx7ws/yC2WOhs1JcQ3A/N0YeCBWkN7koRnbZPiPgDxgasN4XOxyJYID4szwRS1IMVvYi
         LaC+kGQz0BCU1J8SCGHJ7uht81XdB5VOtE9MRTvRUBv19uHqFg+20+xsNnBIBA1kJrhZ
         t5LN2BTVIfjEHC6wfin9bGH+9zy99Wrm26cqz09K2LpPwUMS4L4NB6MPSeeHCrx1/aBn
         mkYwEkxU8/LNldnQ74li+oujcyRvQLfzMfjQVjOj+Z2pk8M5iQUcYSy7EA9TwI03aV0H
         UoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793310389; x=1793915189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYWLRbAAA76l2zIS8Fp/p/vFZPUiy9vOWrroeHgM1YQ=;
        b=aRvNpeKVkfb6O7qtjNAtROdL0fN6gAnoFM8slbh8RA8hbgO9JHxr1Wyi2O7BeQkw3c
         UHkd51vjWeZgBDqXcBoSkd0xcEBHVqTwlkCU5cfacU1gZeGdIf6a9Hnq6IiSIMINKaR8
         5TuWX9yUJIScCc890tbdbfreq9QKSkiekkOpq6zRf8NW3BlsVOkUUfuFCxFUFxS8usTU
         tEfCuzNNKlSBc4WfHYAmoPxENT3o1CsTUSd8PPhKU3sKfwlyEwNV0mKsLD0brCCA2+zs
         r0PkE7fPgeuGhDo2KyC+6lfr2OfqEAr1D+zS/8VzLZgJTo9VugPyUU4b8sb1JJS7aGkL
         4lnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY+u3ZF3+H8dE0FsYx2G2FJVKtLM5wRMtiANTPxjepkfYOAlMO591ayO5d7+mq++0a1FYyWWD06wv6yPbmE9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5VqCvDcnWanUz76JQ3cir5F9xPa+DwRw4pRb7fZcogcXRsYWW
	V8xOrjm7984dCEC9QJpEyH3u4XgABn/RTr8y0hWhDcns0zO9dZYsKRMI+IRkqewvADq35R7XTWC
	m5Wna7uMLxUc2hyjriO6Vo2rT5ueq/6eIUf1eUdFP
X-Gm-Gg: AYBFou3PaDlZyeDHgzxoeM9knk8m2zXTFDCUBE1r30wUoBrwFDNUfNKEUOqZAFlwsEr
	OWznm+lUJuGBcl9//gMW8eifgGywpMsBB0OG/I8NpoAja+wQpnnPmwNbbmaWmCaNZoimf/nDkEG
	eoNwgGleX0Qln25Ji2tUjLhOhAH0fDzfb8peOc76/JP6DpZHgpCbNIxwylTJEh1IPrFO9VNsFnS
	943dZgBZ6mbMwwo4cdfPc/6zrY+EaLmikrli/G2VOwDqyzYwV7UsJ4bfMChA0OpPf4QWO5aiF4S
	Bbdgq+Prb4opEZfpSP/QDiFXj94zT1u5gP6vRbd5Q4wUc7Eq7g2J7hx29cbAxj+mWlmTeSzPGNk
	iQXmnGPn51Ipt0DTPOdAc5CUaGBX1qhloj/8h
X-Received: by 2002:a05:6402:44ce:b0:6aa:b72b:d762 with SMTP id
 4fb4d7f45d1cf-6b4b0e8158emr110491a12.1.1793310388718; Thu, 29 Oct 2026
 14:46:28 -0700 (PDT)
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
In-Reply-To: <auO4UueaV0mTVzzB@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 29 Oct 2026 14:46:16 -0700
X-Gm-Features: AclHuK8NZLJIX8QRthineYRqVAWzP1LKOquD4mrybMuUOVfeI9RwEH1_rstJFFw
Message-ID: <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Oct 29, 2026, Jim Mattson wrote:
> > (Host- initiated writes are allowed to set any valid MSR_VM_CR bits.)
>
> Eww.  Why?  If we allow this, then we'll end up with the mess where the g=
uest
> can't write back the current value (if userspace is being weird).  I get =
that
> we want to avoid ordering issues, but there's *already* a required order =
here,
> unless userspace ignores the failure from svm_set_vm_cr() and continues o=
n.
>
> KVM doesn't advertise the MSR as something to be saved/restored, and none=
 of
> QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why make tro=
uble
> for ourselves?

OMG! I didn't look any farther than the obviously broken svm_set_vm_cr().

It looks like svm->nested.vm_cr_msr controls nothing other than itself.

It's just 5 bits of storage with some weird locking rules, and it
resets to 0 on suspend/resume.

What is the point of such half-baked support?
