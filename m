Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198286;
	b=ZLqOQGRGg/cUmE9GysunZcg3sXY6HiNXIHM0tpasaCUpuz8lxHj190cZkq97Jy3vMPyX
	 lOff3tggkWNspOLeT9NWXct6VdDjZkxFpC2mZOTRYe6TiMsKlANzaYYmwufc4zzfAwkyL
	 MYFVbzqmPwWlfOMzYkG/81A8O/GmTzXqBLPcDcgKaQ1yDtGLqzvfThBRn1VUlA8W5DiUT
	 p2/ZvNofKfYAcsKdaaf+YUQ7jgZvNw6Rqfojf3MtL0u4UtrzgYB0CH7K+zYXMs+YY9nQr
	 J8Z3pi6+Lq58doTcKO2EUq/WTtL/UL6766NkdxzQwIgbegsx/UQu3M77slmqur8yLFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=JDzbhiCoFBsB1LUGSE+FNJ8fs+B+4L9p62TVlpx0yJ4=;
	b=ViRTMYO0i6F3oAt5rY94EBaBNKN7CU0X3KEgKyv6wnWkjfMEf5EhNViDlNw9tGV/kIyy
	 uNsbG5QcP100lAMeoEqGv2AEOiBB/puTrE54xqsJSQYOkrgVIYmARgSuzIkZGz/s37BYL
	 J2SYEazBm1m8MoVVRk0O20IGrVlTpIk+hfiSzcdYzts3kBTRRAWA31y+95CNnVpe4ebbl
	 KtGrojY1iuXcgcXZw7svvenA0yF/lR474VHV31TuF+gtVgqVQZhyUqylMOd5NaJn2xUrO
	 x4pOoERVvVg9afNi6n0u/L0KqCKEa0aPOJSqKQWoj8TgptAjLIEelCtTyXGqvaaTIRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PVGHrCoa;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6620607A0DB
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 18:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6620607A0DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PVGHrCoa
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f05c68629cso1876415ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795198285; x=1795803085; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDzbhiCoFBsB1LUGSE+FNJ8fs+B+4L9p62TVlpx0yJ4=;
        b=PVGHrCoaAP/5w1paicQ+hrt9379ckz/YstH15fDT/2OfPNc3NuS+VgVBK31Y4KWR1c
         6PEILfGm8mXVSYnE+ShXHiGg2+cjwadNYr6CVRAtBkojKCy3wAzMBHiN/hgp9Fr8I0rw
         pVTVrnraiWylu9/TACtXKP/yfxDi0m6zABmX4xVo2kPJHlkl/y54aRsSc9U/9fMEB2PJ
         esMW2rw0ckWd4dJpkMIpx7R4IXIDSCQJYl5yEpK1fzu07+gEa1XoH+hwVcUZ/VsnRp4j
         ChOPqNE4+HHfBFewHGbf5rwxwTNCY+3Zt+DtgYKz0OqIEnlWRHpodKCpTGesETGHl6Vc
         6OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198285; x=1795803085;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDzbhiCoFBsB1LUGSE+FNJ8fs+B+4L9p62TVlpx0yJ4=;
        b=MHcqr8QKSOHfVpWHsZi/sTpzCWe4tspKR9maSDrcTKbQX1h4rbLsv2til9FbCOFxzK
         Au+Ccyn3x1f984l9wiDpJhSbzwzRUoE5JfFDwdoW0f0xXJXSilhSICgBmsIox6Qqa1qM
         aIahFVnUwcs5jxEZWWMYryDlZrrnNZ9RtUBYK/09mqc92vUfySnVdWvz0dMPuwfpcoJO
         EK1mYjcNPtzhdIZKw4HYpca9rqK8N+cc1RtOWDqFlgofIJGYguZ4EzezXxevaG93dn2i
         cp2wdQ7BZwtbqtWgPGmHZq0uWtkcY6ozYp8t3aCQ3UIZJuBk7SrkKkRk1Dm1eXBiuIvl
         pFyQ==
X-Forwarded-Encrypted: i=1; AL+hErEHxtnaREYmA8EVjx72IcCHR5dz8yIyG7McxCf8VafdNT98DzkJAuJ72ayXNINlj0s3lLtjK6yb+IcNHb76YB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bsBzfTPGlLBN7plCdcFF7ZIANuD5FHpcI5pOt1jlb0IX9h4Sn
	+1SOgImJ7gdxCsESHT2PkaxHowe8sSTjhgq8XrGwNUYkLJoBYkqtfZdCoVqzTql600GH543u1E9
	uygGWPA==
X-Received: from plup11.prod.google.com ([2002:a17:903:4b2b:b0:2ed:e056:7a80])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf08:b0:2f0:59dd:4d07
 with SMTP id d9443c01a7336-2f059dd50f7mr8708795ad.38.1795198285056; Fri, 20
 Nov 2026 10:11:25 -0800 (PST)
Date: Fri, 20 Nov 2026 10:11:24 -0800
In-Reply-To: <5F8F490B-BC93-41EA-B77E-9EC108C09DBE@infradead.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113170535.79246-1-dwmw2@infradead.org> <avdEkNbqPWamMErl@google.com>
 <5F8F490B-BC93-41EA-B77E-9EC108C09DBE@infradead.org>
Message-ID: <awCNTITOOiS1JEod@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2 0/4] KVM: x86: hyper-v: Forward unimplemented
 hypercalls to userspace
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Thara Gopinath <tgopinath@linux.microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Michael Kelley <mhklinux@outlook.com>, Nicolas Saenz Julienne <nsaenz@amazon.com>, 
	Nikolas Wipper <nik.wipper@gmx.de>, Mushahid Hussain <hmushi@amazon.co.uk>, 
	Sriram Nambakam <snambakam@linux.microsoft.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, 
	"Radim =?utf-8?B?S3LEjW3DocWZ?=" <rkrcmar@ventanamicro.com>, Liran Alon <liran.alon@oracle.com>, 
	Arbel Moshe <arbel.moshe@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 13, 2026, David Woodhouse wrote:
> On 13 November 2026 10:10:40 GMT-07:00, Sean Christopherson <seanjc@google.com> wrote:
> >On Fri, Nov 13, 2026, David Woodhouse wrote:
> >> From: David Woodhouse <dwmw@amazon.co.uk>
> >> 
> >> KVM implements a fixed set of Hyper-V hypercalls and fails every other
> >> code with HV_STATUS_INVALID_HYPERCALL_CODE. A VMM that wants to
> >> implement more of the TLFS, such as the VSM hypercalls Windows uses for
> >> Virtualization Based Security, never sees them.
> >> 
> >> This series adds KVM_CAP_HYPERV_FORWARD_HCALL. As with KVM_CAP_XEN_HVM
> >> and KVM_CAP_EXIT_HYPERCALL, KVM_CHECK_EXTENSION returns a bitmask of
> >> features and KVM_ENABLE_CAP takes the subset to enable, rejecting any
> >> bit the kernel does not report. The first feature,
> >> KVM_HYPERV_HCALL_FORWARD_UNKNOWN, sends the hypercalls KVM does not
> >> implement, and extended hypercalls in fast form, out through the
> >> existing KVM_EXIT_HYPERV_HCALL exit, whose format does not change at
> >> all.
> >
> >I'm not a fan of fowarding unknown hypercalls.  It seems like it would be quite
> >easy to end up with a mess where it's difficult for KVM to implement "native"
> >support without breaking userspace.
> >
> >How much code (and ongoing churn) would it be to add an allowlist of hypercalls
> >to forward to userspace?  And then obviously require userspace to configure its
> >forwarding "intercepts".
> 
> I'm following the model we used for Xen support, where the default assumption
> is that we do everything in userspace, then accelerate only what's absolutely
> necessary in the kernel.

Oh, right.  I was worried about people getting clever and abusing the Hyper-V
handling to implement bespoke, out-of-tree hypercalls, but that ship has sailed.

> Userspace can opt *in* to having the kernel support certain hypercalls, and
> later patches waiting in the wings already add the in-kernel VTL switching
> enabled via a bitmask when enabling the capability. 

Oh yeah, duh.  We need a capability either way.
