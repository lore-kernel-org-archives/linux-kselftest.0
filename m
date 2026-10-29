Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793310750;
	b=AFRy8kCxMjy8pxWmTUhhsj9SqcasTipQwOYfhTAHkzOUV6sQDfyv8Bd1jIphUPuVR0Le
	 wRvlCjaUAiUYH463Upy1kueqNjliuH64/QbQemCItROOELWtXQZGRQVGdTJMksD3XQKLd
	 pjOcuz3haZtKacB6X5HcpAjrU3wTenx7y8vFOROUz9O2+IsU01CwnHKiulvmZ1nR5Yaz5
	 synn6IwFDw7Ach8K0zTxec9/SeOHsP8+j97d5ueUw1XHksX0hH6JRwePKRkiHcFP+9bNv
	 3l87I8ueJtQXkD8AvfWxzOXBJMN8bIVXO6Usjo2fFjEhLjOocSiTdPuTkDLF5j7uOMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=9hubGuaWBIVJLpBbvvkgCy68Va0Ble3qI+p4rrOMI8U=;
	b=nQ2ySaPqot5hoWy8jBDNm4fzrtp6N3v39D7dp2Z2fGJGvwMYq/FVrQCQrT/47R7zTFud
	 eHqPlHtTLGGj8tN+nYUOPvxYM7/Kj4L3obDbV94ndkPs2UzKKY7wEnSCESY38XLptv14l
	 3oWKIBLsYufRCN6tBysgUNYVsejOeXJHh7e6pCLix/YoLQR6SxRAsMrpagkJvab12jWxU
	 hchCq0RiVgILIRqgwfx+OVBTxJqbsI8KfsGqTFjhtlGdLRw4ukEVM70kEZDbzxsPnGukB
	 y95/mdN+W7w35sshMSstLFmjsQIX1G5/T0Pwt+41dh/l+npPwlGzryt5fLfOn2lOwIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UoxpmelK;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E0606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 21:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 422E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UoxpmelK
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8dd9b9743so1173775ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793310744; x=1793915544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9hubGuaWBIVJLpBbvvkgCy68Va0Ble3qI+p4rrOMI8U=;
        b=UoxpmelKpm9qa5OtKA90jq22WU41dhObIzezb/KbNxjp4D01x9arfXHeALX1Iu6dUA
         qh4EzHDCOPu6kRFUE5b/yVwfE00nZv41AIa4b0fL5/NS/C+6pxNJhLq4aH93SsHR/yQE
         MDpIhRbMfbmWOgMS7H2m3C86V0PEVq0mnr0Mx9ar5jQaY+p2HmFbT2U8mCAMopjeKueD
         tdn4mdb1JX6FN/7BTE9RUjs/eNtWXR9F7E+RFhmtUGBo+lddAmiWJZWP6ULgdIe50p8e
         iC4QZXXNIsF6pMajwI/5v8chznRe3nKCEUyKjq1NSJC68qOFe67YRDEUCXbVp+qUNvh6
         poJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793310744; x=1793915544;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hubGuaWBIVJLpBbvvkgCy68Va0Ble3qI+p4rrOMI8U=;
        b=sMkLNWGLaH2kbdIh3w67uEy8x9YvcUGjtlqDIlo/q+FgVTAP8lBI8Gm7JpwHe02xZB
         9pz4E7es4GfH8rkwJH8RPiqei0l/Dbmg4f0jne5H8y6g3dJV0Wbn6Lcn/eX1DJOYx5kr
         9qLT5ePCXGRMNUTOhMMZ+yZyRM15+ehplTpVjPbEBwyzAH/3toz1lMv9yCSdLf4xuCEs
         OdKk3o6gvXu0ob45MecP6HGNcmbz0+3rsxG5JukC0Vz5VC+mOHj+Z76y26SaTqekM0Lu
         pUFwtynkuoKDKRVvIWsaho6oU7QSCOVpTa6XfHvTQTw4A40/kZNiLUu0Q+fZeE3BiYBZ
         hmfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK/6G7ZWg5Vu3exXszAY/s3SBc8BjOUag73RxEUdMc05K38dCRyVStyBEfVkqqYnoXTEvOXjsPqSiVsWI84Rw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1/XJmvdLIWtecIUklIcX4iZDuYXOGDpM9d6el5y1PgRlGX+F+
	+YMHHB90JNb8VFcQ9ZSNEFShDBwa6659WV9gyHWL79HOgUfv1aPxSCfSDOUer9rVHd218+MKRR3
	pb8QMaw==
X-Received: from plrb5.prod.google.com ([2002:a17:902:a9c5:b0:2e8:8642:f035])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:986:b0:2e9:7719:40f0
 with SMTP id d9443c01a7336-2eb364962ffmr5977675ad.19.1793310744369; Thu, 29
 Oct 2026 14:52:24 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:52:23 -0700
In-Reply-To: <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com> <auO4UueaV0mTVzzB@google.com>
 <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com>
Message-ID: <auPAFxXy4ulcK_jq@google.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026, Jim Mattson wrote:
> On Thu, Oct 29, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Thu, Oct 29, 2026, Jim Mattson wrote:
> > > (Host- initiated writes are allowed to set any valid MSR_VM_CR bits.)
> >
> > Eww.  Why?  If we allow this, then we'll end up with the mess where the=
 guest
> > can't write back the current value (if userspace is being weird).  I ge=
t that
> > we want to avoid ordering issues, but there's *already* a required orde=
r here,
> > unless userspace ignores the failure from svm_set_vm_cr() and continues=
 on.
> >
> > KVM doesn't advertise the MSR as something to be saved/restored, and no=
ne of
> > QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why make t=
rouble
> > for ourselves?
>=20
> OMG! I didn't look any farther than the obviously broken svm_set_vm_cr().
>=20
> It looks like svm->nested.vm_cr_msr controls nothing other than itself.

LOL, nice.

> It's just 5 bits of storage with some weird locking rules, and it
> resets to 0 on suspend/resume.
>=20
> What is the point of such half-baked support?

More than likely, so that older kernels didn't crash when writing an MSR KV=
M
didn't emulate. :-(
