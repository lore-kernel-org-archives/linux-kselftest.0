Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793318458;
	b=IIvgQxG4x3cDZpN0a6NdzTXIw7Qacf8keecZwR80EfYdNQI2po+qnd1VAiQoVMu3NjkB
	 LUYoN4ZcqnXEC+waXZebu074oELmAIVSz1ZudzeBQODjg7PQMDsA2XazeelJ5NuVuLGUc
	 W7j1UMh4jnhXr/xuE0FP+3sAMQd2Tb1Mv69eP3hMFm96jKXs3enHcG/0iwtMGjL+Rpxj8
	 2v2ZzcSL7tKR1Tj/Zi5+LO2yuFaOpZEDfgjoXcnKjXsf8ulnfHnAbID93XdsLexbGNKGu
	 ENGG78rOWHjMQ4t6Q8FiOWak8ooicaRlQr3EvccOkcgFCex2abjNcIT1y0PXOsBc/5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793318458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6AajOicrvuRgSKCOUIMtr9ZDlZu1f1csRJX+CeX/PXg=;
	b=rjj9zU71tMSDgitvIpxLlbnMzMqNrS8220ETHnR3QHddv06eVDeSY3OFwldO1Fa81IdS
	 F4pvMtR/m132GzOWuhkQf2/n8vg9FzdUgrksMaqH4CX0Vrj3zAh+9yMlh8NWcvVbOTGgL
	 3tORr7RUhMJcvqqo/PB/Pb6EhPrYROmqdm8I5FUQye90Bh2qLT43fLXkMlyzUCuE9vrR1
	 778FV7CAPXnfh3qHxMHClhK/byaCJlBPH3+wUaEis4e13dBpNz4ekSoqaWts9hFrBTW7z
	 IEsD9tXueSPa4iMbyMu8hMrucP+EXavsNDD6dDxFPAzyOXxXaaxyUnMq8fZYBAYkr2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AW1HInfw;
	arc=fail smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB714606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 00:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB714606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AW1HInfw
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso5773a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 17:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793318456; cv=none;
        d=google.com; s=arc-20260327;
        b=abxAfUgXOGM06HcJlfQuN4LbTsrUFFbxwdT52zJV/76GLapjrZ64hUwpApCMrWmvla
         quu3efiqLg00RIeJfbhUB0Vdznij4rQcJ27obvZ/DD2x3EVF1PqkE6x48LXd9TyzTKcN
         aT+CGYhQnjDSmvJRQpWqK2D1N20djBP4ZI5KEJd2MCwmhgPEuiiSrLIG7qj2vOk7S82o
         PeSqTTIZBGxEprBbXaxc/DVNtDtFClVlkrTjsTTRsWXB/cQzDvQf9ykRSW7KPkiFhUGS
         e5nDEGE8hnzrVzIfZ+qDBIVH5xP8l20Ox+sLM8rZ5TG6gOHobvvJifaRJei70T7l1xL3
         ZnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6AajOicrvuRgSKCOUIMtr9ZDlZu1f1csRJX+CeX/PXg=;
        fh=Xw/Gl3tCndsjZG/PsC3S743sVxaY3aCo11/gXJlJSdA=;
        b=iRrKYgjHC92c+6pMuPXfAAa8q+ht+YhQV0CTIrm0DGaGRKgIk5+lhyDwoupE8IL2yG
         MthHY7kelJ3x1MeaPofYsbS9qU85rIquRsTr3zT6kdHyi5VWzkNgdoZ5OpQdlQl58Egx
         vGktt1Aiyi6BTuqCoMJrP74XbJrCPwA9KK+TwZE/pDlJXKjEh0s9zVGjLymrl70QWfhS
         0nM+Rskip/vOukKdXg2vXFq7bvGmZMhZmibGMINtz+fgsJFcVCS/GWuIiHOXHRHU/s2O
         I+RdGNw2E4zZDQHFSecuhspK8NCghogbweMhfzAZtpLOaMvzbyXJx5fVMbsOOCi9BtrR
         xjkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793318456; x=1793923256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6AajOicrvuRgSKCOUIMtr9ZDlZu1f1csRJX+CeX/PXg=;
        b=AW1HInfw6hVPfoRvD736sYB3zTE0cSDxnVw6yygthKUGTF4onkFNlGmz4/caAqgUU3
         SDwEL5QPayGRF6LFj2d2Yvse1adS39hRumxe2SFEHm5nGZYUo5Ma7D/hvm5HOuoTJYxH
         vLMH4gHyoAjN2cMOL+tNZbe/vcN1I4XdQN+B+dnDclu1g6hPdtWxTTLKHVX6SOhbm1nq
         WDci24T9Kih9hvtVH4F/Oc1Cu+7+rDtAxm1UfsuTZs/TNYHzzBx2cCIZE/LARAvKGlQi
         lJb9LxGzIlOhDcTPXT9GBq2MgmvebgHNmW93Xdp7GyGMYeaCS7FMN4Roth16XZtyV6me
         TI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793318456; x=1793923256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AajOicrvuRgSKCOUIMtr9ZDlZu1f1csRJX+CeX/PXg=;
        b=XUTIjh5UlAUWHah1xG/5YUauSnDSYuM2mYq0qtcJjMdYSvrf04loikp1lldA26aphF
         8s2qXHj+Zwd/IcyfoGoWeKwg4WaFoElSkws9uRnBgwwG5lV+WE8kmQmzHQW3RRXJLqVE
         NyB+09u7d5J6W8hzR+6GGMje/bLC9YNj/T59DwSORLcWQvLpMftOOJP+oAYjZ62WQsJr
         +Dg6D6n5gS+9zfoVnoNZE9dXOobl+sC58PU3JyWykBHJyTSJiuHuwGixSsMVqupKv19C
         HI+goLGLiJb2CU+a9MWcyslOK5WvPP447Cp5/VsXNobDg1k0ipzBw/ZBuVK4pXPCUicX
         4B8g==
X-Forwarded-Encrypted: i=1; AKwUvByHe1a+XrvtwPMtC491Fr5vofsU8Wl4Wdv1lj5gbY/UF+SjR4S5ZtzETw0DYqNVq0MNiEY+CrQgCOqcujPoUvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG/vmSy+lz3G706MFWN470UbjSFhZ5kcNPco35ev9pSO5t5t1M
	zdGg4QxWQHmdGMQ1yOv6AQNrrxxrMR5trygnuaQYmPduVxUryOc0ll8bYHLoCRL8yZftPCPZcvy
	tOu0ncx6dsWAG03qG6bCYL62MK7oo+mvPaDscJunL
X-Gm-Gg: AYBFou23MZqya6AzWkZEF2jmo+0er8o2EFO33HMXkCFpUIvBhRcm60hzP19DWqT9RVe
	tAfLnyCPV4SpUKOBqIoNGJPWv7wdzB1/q5f2vd+ErD4cRGm4Mp3YveTiRT/jMcNwB/jHHv33dzw
	O5yEy/t8X39qeFvm5e1Y0Ns7nVEA311ywqAXIANPv3ueSnHI2beRMQMiPTLg1vt8rGzX0CmCbTV
	c+wxUYDIGP/pziyyiqmByZMfcqGRw+gU4kzL/kUobdECbE0MkjhGHaDtTuKmn/CoKZ4s0WM/2aR
	skfHVUgqGQwMzYehFabYRH160Rl7ZVgvY8XFaZsAMP81Wd0HtC9MOqN/kuZTypgkTElv3EgNJdY
	G5t+aMwT5aZ9slHm8UXX0UBu/Fdggqn8EIgoeiEzDc4TVqI01U8Vd9bpeRg==
X-Received: by 2002:a05:6402:641:b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b4b10ef524mr124485a12.5.1793318455914; Thu, 29 Oct 2026
 17:00:55 -0700 (PDT)
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
 <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com>
 <auPAFxXy4ulcK_jq@google.com> <CALMp9eQdtvjQkdgnJ_NTt=2ArdzUtqqzieXLccv9Vb_My5G+fQ@mail.gmail.com>
In-Reply-To: <CALMp9eQdtvjQkdgnJ_NTt=2ArdzUtqqzieXLccv9Vb_My5G+fQ@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 29 Oct 2026 17:00:43 -0700
X-Gm-Features: AclHuK9Gf9FXwfveb_3CfkAO_qfPf7-qk20lAd5kJcyEb-CP0c5NZ2eSdTbAAeE
Message-ID: <CALMp9eSgWhTFi1vxxnN=1zV4mRVsKD55F=37yg4LmT_xUAc_Pw@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:04=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> On Thu, Oct 29, 2026 at 2:52=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Thu, Oct 29, 2026, Jim Mattson wrote:
> > > On Thu, Oct 29, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > > >
> > > > On Thu, Oct 29, 2026, Jim Mattson wrote:
> > > > > (Host- initiated writes are allowed to set any valid MSR_VM_CR bi=
ts.)
> > > >
> > > > Eww.  Why?  If we allow this, then we'll end up with the mess where=
 the guest
> > > > can't write back the current value (if userspace is being weird).  =
I get that
> > > > we want to avoid ordering issues, but there's *already* a required =
order here,
> > > > unless userspace ignores the failure from svm_set_vm_cr() and conti=
nues on.
> > > >
> > > > KVM doesn't advertise the MSR as something to be saved/restored, an=
d none of
> > > > QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why ma=
ke trouble
> > > > for ourselves?
> > >
> > > OMG! I didn't look any farther than the obviously broken svm_set_vm_c=
r().
> > >
> > > It looks like svm->nested.vm_cr_msr controls nothing other than itsel=
f.
> >
> > LOL, nice.
> >
> > > It's just 5 bits of storage with some weird locking rules, and it
> > > resets to 0 on suspend/resume.
> > >
> > > What is the point of such half-baked support?
> >
> > More than likely, so that older kernels didn't crash when writing an MS=
R KVM
> > didn't emulate. :-(
>
> You're not going to let me get rid of it, are you?

LOL! Even the 'LOCK' check is wrong:

 if (svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK)
        chg_mask &=3D ~(SVM_VM_CR_SVM_LOCK_MASK | SVM_VM_CR_SVM_DIS_MASK);

The condition should be checking SVM_VM_CR_SVM_LOCK_MASK.

Well, at least it can be used as a sentinel you can poll to see if
your VM has live-migrated. :)
