Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868052;
	b=O0ga80/4hUF+uVsVcVZptyOglQavlt3FCDre+cLx0E5f3GgRTsGiTWSH+OFNxONy/rhi
	 0RkVRf5ra1ZPu1nSEhQbr9zHK0TLHHOpTje0DPx59dcLMSd1wtiumO/BbY4bNsXLO1O1C
	 GPpKnxaBy6+J25ryXu5UErSZHYYCJU3ZnlhnYxtZw8jTATz2tkWvdYePX/8BoMmPHt0TC
	 iEbomoRdnFefcYOr1RLTJ4aO+v/FwROXP23d3eceaEMA1qEVJgS1nbgsLh//APBnt0wWD
	 dJsN+9jlUll40Mqdckzohm6zPW+qX4OHQQuZ4WoLeSJE2G0uSHrVMrxitmJLpPyf5Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=RUvXiIcVm9hOpppwwCqg1ARGN5d5bhbmrIqkvTODPmQ=;
	b=zVkUuwrIWCRIUSkPe5q8iotlFGHjrERc5X/dTY56UCcoTKvXLfppf+dbfRWWiVsNf5Ze
	 evtYXGet2hyERX9zuRJGZMTRtzpRrv28WOpcN2FTqzWFO8nVHrNDOU66nEuHhI4ws5nuH
	 7snHwmGDLQ/Eep6MDWZJ07XV82BIGZeGQ7oYx88wcjn16qaGtko6opZ5KagseKB8ONO/y
	 ytXxKmYoTBS71U7FHte+EhEv63OCD2nJJC3P0RgDUm/4e6xWJ31UqLCu6QS9QwImz4jPQ
	 5xQoMHr6MVMAM/lR4B15BSOfhay1ZK4aomr2y1UGpZaPYLDRac9HOKfkdyB6S3QpBuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ni9kZ9z3;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CEE606A8A2
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 22:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85CEE606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ni9kZ9z3
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so3306972a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 14:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794868050; x=1795472850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RUvXiIcVm9hOpppwwCqg1ARGN5d5bhbmrIqkvTODPmQ=;
        b=ni9kZ9z3ndG3fR2W1CR/nXPGUaB4ZhicnRKeINuTayT2Oky75VTmjsp/DzFK86Cd9v
         cPuoexhvixBJyC7j96hyx+yJVVOr7VBMAk8TLQNJT8bkATeR0B7k0ge7nhaUGONn/UOb
         gEXkCJLiugSWUvSaIeV7WGRgINROsyHnlu/Fn50HVBM+HAJlzY/ll3zTYjoV/rYfHxxj
         Ltpok75OWasipSzWml+SR4Th8dijeW+FKWIGF6HtVq3JO2m2NZbMKiQRrwLFEpcL++E7
         RWLup/N/BkKUgkCU/Fe2e7Q57Ua0Yn4kx63U3lSePzsGhjAmmmW8lWZKaBAuuUSETbLk
         H8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868050; x=1795472850;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUvXiIcVm9hOpppwwCqg1ARGN5d5bhbmrIqkvTODPmQ=;
        b=JiUsAcH1w4fjr0vtwwoAG1txMwC+lWAwW+c48mgz5J3thsgIfCS9/W0tXBGIQc9yK5
         coIUui5CB629afjvh6dDnDVvstQ5D3xm1vKmpAtc2CN4LHpcYhrSk8gx0cHHn1b8cHKa
         M2Z7W9P0airghrl2wAITUSC0xuEhOJtIU153+OQDNf8o6H8AX/WRGDglfsIgVow06Xho
         aQkBnmbDt++hOJplh1O9HF7XeI0PJsPhEXkx150jPBDULOrlKHxoHSzIOtarw9AERq1P
         Q7K2foTgdcFvbPbHIrfLf32kRex0GQnCYJzua1NjzlaiUectIwMnr86ZdSQfg1eYb7Q2
         7yyg==
X-Forwarded-Encrypted: i=1; AL+hErGSdJ6SHMtCBiH+E1wYGmJ5bPe+1EbcGgwLGNC34zjCUSs1TSFStASClgwCBRHh4oW9kiuQ2RvefR40GnciyJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xu4Z443gayauJlSjEkpn9vr+5WrJvuxcNodv8ko+6I6IH6/RC
	c5Bd6nbLjUfFrKLgHFQK2+Xa99JeKc4i1LfC7WTS1+DiuPsEXMJY1HHBzxJazPKLBc8ejKyRbdl
	OpibQ8g==
X-Received: from ploh2.prod.google.com ([2002:a17:902:f702:b0:2e3:1b6e:33bb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:574b:b0:3ae:2969:903f
 with SMTP id 98e67ed59e1d1-3b1b0b8bcb7mr10699281a91.45.1794868049419; Mon, 16
 Nov 2026 14:27:29 -0800 (PST)
Date: Mon, 16 Nov 2026 14:27:28 -0800
In-Reply-To: <ca9dffb64656a392965f95d35b9d13d829f34076.camel@infradead.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
 <876c4f4fc442116c9bff8abd8c34f99fcfa65531.camel@infradead.org>
 <CABQX2QNd7DehBsH-pGL=EJK4b5vC60PymL_YP27xDxGT6_6=uQ@mail.gmail.com>
 <1bae109338ab6ff1ff14eac811f7e86ced785b22.camel@infradead.org>
 <CABQX2QNhRZP1Td_HQ6QpMzw-_TjqhbooipWYg3VTgTOq2_U9+w@mail.gmail.com> <ca9dffb64656a392965f95d35b9d13d829f34076.camel@infradead.org>
Message-ID: <avuDUNAU_a933zvp@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Zack Rusin <zack.rusin@broadcom.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Paul Durrant <paul@xen.org>, 
	Xin Li <xin@zytor.com>, Francesco Lavra <flavra@baylibre.com>, 
	"Radim =?utf-8?B?S3LEjW3DocWZ?=" <rkrcmar@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026, David Woodhouse wrote:
> On Fri, 2026-11-13 at 01:33 -0500, Zack Rusin wrote:
> > > Userspace *already* needed to
> > > know about those=C2=B9 because it can't migrate while those are pendi=
ng;
> > > it has to do at least one more run, even if it's with the immediate_e=
xit
> > > flag set.
> >=20
> > True, but, again afaict, that rule exists because those completions
> > have to run, so I don't think it tells us they can be dropped.
> >=20
> > > If it's deemed clearer, I'd also be OK with an explicit
> > > KVM_VCPUEVENT_CANCEL_HCALL which cancels *only* hypercalls. But I don=
't
> > > really see the point; userspace shouldn't be getting confused when it
> > > was actually some other kind of completion that was active anyway.
> > >=20
> > > =C2=B9 https://lore.kernel.org/all/20250111012450.1262638-1-seanjc@go=
ogle.com/
> > >=20
> > > Looks something like this in my Hyper-V hcall series (except I alread=
y
> > > shouted at the agent for stupid struct layout and made it go run paho=
le
> > > on everything it's working on).
> >=20
> > FWIW, restricting cancellation to explicitly marked completions looks
> > good to me.=C2=A0 If Sean/Paolo prefer that, I'm happy to mark our
> > completion cancellable and drop our exception fields.
>=20
> I posted that as
> https://lore.kernel.org/kvm/20261113170535.79246-3-dwmw2@infradead.org/T/=
#u
> and caught both Paolo and Sean here at KVM Forum and both seem OK with it
> (although acquiescence when badgered at a conference doesn't necessarily
> translate to applying the patch... :)

Heh, you jinxed yourself.

Adding something to KVM_SET_VCPU_EVENTS is complete overkill, and will crea=
te a
confusing ABI for hypercalls versus MSR exits.  For the latter, KVM lets us=
erspace
signal success/failure, and injects a #GP on failure.

The VMware case in particular is a bit different since that case needs to i=
nject
a variety of faults, with a payload, but the concept is the same: give user=
space
a way to cancel/reject the hypercall/action.  And that's dead simple, e.g.

  static int complete_vmware_hypercall_exit(struct kvm_vcpu *vcpu)
  {
	if (vcpu->run->vmware.ret)
		return 1;

	return kvm_skip_emulated_instruction(vcpu);
  }

For Hyper-V exits, from what I can tell, the plumbing already exists, i.e. =
I
suspect that this:

  A VMM implementing Hyper-V hypercalls behind KVM_EXIT_HYPERV_HCALL can on=
ly
  complete them: write a status, advance RIP.  The TLFS specifies some hype=
rcalls
  to raise an exception at the hypercall instruction instead, and the exit =
has no
  way to say that.

is partly wrong.  Presumably the TLFS provides a HV_STATUS_xxx flag or thre=
e to
indicate "exception", KVM just needs to honor those, e.g. if the behavior o=
nly
applies to userspace exits *and* userspace is responsible for injecting the=
 fault:

diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 5d2e3617c952..7933389731e6 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -2430,7 +2430,12 @@ static int kvm_hv_hypercall_complete(struct kvm_vcpu=
 *vcpu, u64 result)

 static int kvm_hv_hypercall_complete_userspace(struct kvm_vcpu *vcpu)
 {
-	return kvm_hv_hypercall_complete(vcpu, vcpu->run->hyperv.u.hcall.result);
+	u64 result =3D READ_ONCE(vcpu->run->hyperv.u.hcall.result);
+
+	if (hv_result_exception(result))
+		return 1;
+
+	return kvm_hv_hypercall_complete(vcpu, result);
 }

or if the type of fault is hardcoded and we want to apply the behavior to b=
oth
userspace exits and KVM-internal exits:

diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 5d2e3617c952..c726a707a7ca 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -2420,6 +2420,9 @@ static int kvm_hv_hypercall_complete(struct kvm_vcpu =
*vcpu, u64 result)
 	kvm_hv_hypercall_set_result(vcpu, result);
 	++vcpu->stat.hypercalls;

+	if (hv_result_exception(result))
+		return 1;
+
 	ret =3D kvm_skip_emulated_instruction(vcpu);

 	if (tlb_lock_count)

If it's a mix of those two, we can obviously sort that out.

If the exception is communicated through some other means, then (a) that ne=
eds
to be explained in detail, and (b) we should be able to use the same apprao=
ch,
just with new "ret" field or whatever in kvm_hyperv_exit.u.hcall.
