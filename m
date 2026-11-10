Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341995;
	b=VDI8MYwbXWdsqp3enWG8uLCTGg5ZmYJoYpOvYeps3XoA1yjGrGdib2eHegS1F+xAbdW1
	 P70E+zWvY5BCKLLl2yMzdcjsRJsCK7epSzcN/4yz4NSL2R6zMQfyj874F5gLkgGJ39daI
	 Kl9vjS72aqotL2d2FVm40tg7F1PyHIgO6WlQBhbDlI3XnsHpeJScfZahtp7Ocsnz3Is+U
	 XTE6ZPocVfpiIkx4guHPrcMJR0L60z5c74IooFRfjUbNts/+CHVQc5H8YyZCJca/b3zIR
	 fMnHDnKZGp6R2Poj/ILrccxwNs6pHyOYtnHFsxQE8iDjwtHYzlho5LSz64zOobNZphA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=sA+c0y1gtg/3n5Y+gL1JpZOKDFrA6DPjieeMuAQE0Nw=;
	b=lg/t9W2SM2QzOWK+/aXtScLaCId7aqOc2RDJS2bh2vxbsbg7twbvHWW8bRvj0RoIuwDz
	 x+2MEh0XyVKMhzDqowqDo+D72eum+R+rvP2fVvQhs1PzH2Fx2kOsxL1LVAN1h+CdHru6S
	 BVinI1x9Ib7BZiRJ+C+Rh4cMJsqnKpKmUKEiuxduQvvhAPfmHWc9CL0ymRn558HOfuBs1
	 ngfvfiwGJuqp6RK8Sy37U5KeoUm3k5D3wMP7JEMczEY3NlotqZ8QAskLZ6z3lBhkBB3fY
	 9mNiB6Uy/hHw5GPCcuH9MD4wnY+GArJ+aFC7KtvKv8dEJ6ceOhWg4ZlxFSx6qVkzOqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aP0X0iPt;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D3606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 20:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5D3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aP0X0iPt
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1583052a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 12:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794341994; x=1794946794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sA+c0y1gtg/3n5Y+gL1JpZOKDFrA6DPjieeMuAQE0Nw=;
        b=aP0X0iPtBrwNmhdMirAtRHYzTNScUoza0tcUi09jz2/7DAeJrq2GSp2y1EWXDpGpf6
         t+FoZ+jWY3xcdigvRR/oe2vxrnJcsD4GDSMCFvmqwGcoTb+b6x8Uoo4YcSTE5EbqIEy7
         nv2NJyNk6nyHPmxgiZ8MY0JHInxmm2+tw1OeAmv7GtSi2+neoYEKw5vzF4+z9DL+nZT4
         i0/2fS3s7Mz1VtKSFUpC/6CopEGZDoAtbP2KkTakh1JcZqkqFX5yRjhL7X74J2MxRE14
         zwXfLstdzwXLoaEI+e7hSKHqRsz4B2JSJWP+dLjpApkiNS/p5JPglF1s+krjd0gNRv8T
         2O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341994; x=1794946794;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sA+c0y1gtg/3n5Y+gL1JpZOKDFrA6DPjieeMuAQE0Nw=;
        b=P5TFI+z3LyC22QnABMifchDan/9JQTPTpubHlziQCCcCiAE29RGPr6OGabBuFDfsTC
         nGgIr9cNfC5zr5FtnLMhCJK8LrKus8K+shP7fS5ubvY/qOrYT2J3e3mDXiiCWYslsKw6
         mz+LiGFUC+W/o8YQMLsB7pQbFT3+dNWxriy2NCNU0IQpYhbD/8jWesIggIvR0EgvIHbB
         r9fbH45REfAj3Gxm9brvCxXGwaRUxgHcyzuGtcrjD8qDB+sOMxnCiVR69GSppD9oKclF
         F2GHLpNAaqaLTRvD1/aC4GniFs39dpiWej2vQz/wPOmLnj/1nqO6nbk5G3ZJ7nEhkFV/
         2Rtw==
X-Forwarded-Encrypted: i=1; AL+hErEwq4PDFFZOhYx9TnilSbUMnh/E6MxNggIU9AWvc7wbTwGouJB/BaegOZiWXw0HTrjWMaZwpegcTe/nVkHo2UM=@vger.kernel.org
X-Gm-Message-State: APuU4Z99mcy60lCswRZf2MqTNjuyAqwdfFyrGPCdhpa+04vzGL594Wh+
	uUF7DKgq7Th6onn8ehSCZ45CoWsL3S/uyBzo+iVl0qdJfi36Fw/LvFjViKlCrQjv0YiOJZWQsbj
	EIRLD/g==
X-Received: from pghf7.prod.google.com ([2002:a63:e307:0:b0:cd7:f985:396d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1446:b0:3e2:a849:64c5
 with SMTP id adf61e73a8af0-3f2fc99f9aamr241125637.19.1794341993521; Tue, 10
 Nov 2026 12:19:53 -0800 (PST)
Date: Tue, 10 Nov 2026 12:19:52 -0800
In-Reply-To: <20261105020104.2507083-7-dwmw2@infradead.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105020104.2507083-1-dwmw2@infradead.org> <20261105020104.2507083-7-dwmw2@infradead.org>
Message-ID: <avN8aJIHiX4xyTNO@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2 06/20] KVM: x86: Request the guest TLB flush from record_steal_time()
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rcu@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Durrant <paul@xen.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Fred Griffoul <fgriffo@amazon.co.uk>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Kunwu Chan <kunwu.chan@gmail.com>, 
	syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>=20
> record_steal_time() performs a TLB flush on the guest's behalf when the
> guest sets KVM_VCPU_FLUSH_TLB. With shadow paging,
> kvm_vcpu_flush_tlb_guest() ends up in mmu_sync_children(), which can
> reschedule via cond_resched_rwlock_write(). That is why the flush
> currently sits between a user_access_end() and a fresh
> user_access_begin(): it cannot be done while the guest page is mapped
> for access.
>=20
> Raise KVM_REQ_TLB_FLUSH_GUEST instead of flushing inline, and move the
> processing of KVM_REQ_STEAL_UPDATE ahead of where the TLB flush requests
> are serviced in vcpu_enter_guest() so that the flush still happens before
> the vCPU enters the guest. There is no requirement for it to complete any
> earlier than that.
>=20
> kvm_make_request() on the vCPU which is running is nothing more than a
> barrier and a set_bit(), so unlike the flush itself it can be done from
> any context =E2=80=94 which lets the surrounding access be simplified lat=
er.
>=20
> Note that the xchg() must stay where it is: it atomically consumes any
> KVM_VCPU_FLUSH_TLB which the guest has set, as required by commit
> b043138246a4 ("x86/KVM: Make sure KVM_VCPU_FLUSH_TLB flag is not missed")=
.
>=20
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260530061932.7849D1F00893@smtp.kern=
el.org
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 6a1f0404f029..3c26c0eb9865 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -2117,8 +2117,22 @@ static void record_steal_time(struct kvm_vcpu *vcp=
u)
> =20
>  		trace_kvm_pv_tlb_flush(vcpu->vcpu_id,
>  				       st_preempted & KVM_VCPU_FLUSH_TLB);
> +		/*
> +		 * Request the flush instead of performing it inline. With
> +		 * shadow paging kvm_vcpu_flush_tlb_guest() can reschedule
> +		 * (via mmu_sync_children()), so it could not be called while
> +		 * the user access above was open. Requesting is just a bit
> +		 * set on the running vCPU, and the request is serviced
> +		 * before the vCPU enters the guest; nothing requires the
> +		 * flush to have completed any earlier than that.

Argh, I completely forgot about this.  It throws a big wrench in my plans t=
o fix
a mishandled TLB flush without using a deferred mechanism[1].  I really don=
't like
having to re-introduce deferred flags, but the diff is a lot smaller[2].  O=
n the
other hand, I still don't like the idea of delaying the MMU sync until the =
nested
VM-Exit.

I think I'll see how gross it is to do something like add a KVM_REQ_PV_TLB_=
FLUSH.

[1] https://lore.kernel.org/all/au0R41xbEJ_9W_9z@google.com
[2] https://lore.kernel.org/all/auDkX94UTjrLNmqp@google.com
