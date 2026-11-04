Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821999;
	b=sGuXilEQz1eK9EMeehzUrqtqOmQXz4ZFjpI4bkcBdvftxsA77fHelBkMIL80RIYWx0lZ
	 RlxmnnRHvUd+WqH6Pd/iExT3X6Vi+y0S8KtFdLeiIPofGXTsbv7EIUQxyTku0pcelQd3H
	 ArzC5epP94tIML4d90PLZ1cjdKB1fgbLYoQ40Z1kz+Ux5uOPt/ujJ7WyAq7oEe7wi38r9
	 3xHbY+QMX/v7cHIhDEcf49aHtFIsgXenuNNZM4OYZp+gy4CXwAtk++/jpDE6eSIgvA2nD
	 Zg62eZvCkwEngwSKhClP15/XQCMbPSpAFL9J+Mrdu4lRyzzQfbWIyeizXqknhSk38xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=6/ZM+kSr71E5pYSORU1PeqM92yW7X1HiRlNL7QxACZg=;
	b=SU9QzgDjg+Qthl8J6Cv8hoXC+V7R4s8mxICg/+6c6w5JnkidfpnHLSo2fo4p53MMzERx
	 IX4yJpnjxgbv2W0ZdZ/Rxi16URtRhUnU0iZIdANBDfVsnUQ6X+wJgnEz+pLdJITeavHKz
	 Hct60Tv3g3Un3UB6ELNk8mVwkeVzinDs8I5LvghKCdDHQFyexNzljdQk/GgSIUjLO0JzO
	 Y1TELs8LKm51ITRw3zERVlnH5v8eugeYGeMaGaa+o8+iH1oDebS817awvTBzOa3Qb3UYO
	 WiqYzKBnT8fEZwT0dR6xaepDNTE1b7FzsUOPwsaHarfXlf9LqWZnsEmXFJW4SNYx/FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W6sYwyNA;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE406097316
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 19:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE406097316
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W6sYwyNA
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9501034c4so16873795ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793821998; x=1794426798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6/ZM+kSr71E5pYSORU1PeqM92yW7X1HiRlNL7QxACZg=;
        b=W6sYwyNAxuQUEpjWv8f1oH2vG0MBnCjpJ9/AtYQncZ2Z6jPn4xuWM3v4EYR9NVm6fT
         kJlsieHkxnP/R7cR9ZfvNqyDtA1hw7cpOXvlth6a53CQ+7SUHe9kQWqvewcdNmc+V2K8
         YkJzX7xmF5R8+nfSQXz1Wv02fKkr4DCgGIoMkC5SFKqhwAvFx5iclvD1DXFluqYSyFLa
         9UwJdbtqIQaZOOTIHQFg3IBgq7WEwFOhRnwBXNHXOfQ9Q8pNwCgwodm0SwRh0oQUTAzS
         B/jB52exYbrGZShO80FqS9oxSfEk1akmtFA/sBBzyb5AfhGfn1OuEP7ObIKAu8eCkk9w
         PBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821998; x=1794426798;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/ZM+kSr71E5pYSORU1PeqM92yW7X1HiRlNL7QxACZg=;
        b=0EXVMGDTvZ2+1fypXFCZ3gw6fh8LregtLVf7nz0Ipt3VJtQZlD8+S9uZrMshPeu1++
         WQJ+Q9uH8RcY6kOMHVcoBSBjDZ7fj4T6Ddr6A1MMabSPGBUsDZR88+dKcqgzP5lM11t/
         jt67oQqfTjFtPVE4uNqe6IN1LKQSsuiExtwyNXxmnpwILXtRlvUvaAMHI9D/KrWh2GtM
         IcAFs/1Bfp3fCLh4diCPSe87HEwudfaQN/eQVZaj308cr7x2UUXhRij3bhYAWxj8PWZ4
         0SjaylEd847Tg6CHGC2/ojrwjjpxloEmWI99EB+x021eQlgzfVOuTItHhRQPKOuyh0e1
         txbg==
X-Forwarded-Encrypted: i=1; AKwUvBy7P85NDKm/5drXxFajoTpYU5aa0IsceR/T5SSL8v/neZnZ/NQh9bF3R8Lq0XNycEykOV+EwNAzRsqwrFnK4kM=@vger.kernel.org
X-Gm-Message-State: APuU4Z80d7fqXDMtZ4nqjyZrnz5hQjR1BiME9Cs/qefZHHDx6tjs6fjv
	lizCRQ3387SpDXvlU9n1yJIHCq6wwLTDIwhgL7EVgrD+UYf4yp0UB09nlhZ3lJdKQsufCtky84Y
	6oR6+Dg==
X-Received: from plbkm6.prod.google.com ([2002:a17:903:27c6:b0:2ec:f25e:f5dd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db07:b0:2ea:cb4f:fd3
 with SMTP id d9443c01a7336-2eb36401dc1mr187678735ad.4.1793821997670; Wed, 04
 Nov 2026 11:53:17 -0800 (PST)
Date: Wed, 4 Nov 2026 11:53:16 -0800
In-Reply-To: <20261019162445.37219-1-dwmw2@infradead.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019162445.37219-1-dwmw2@infradead.org>
Message-ID: <auuNLC2BJRpJZKA6@google.com>
Subject: Re: [PATCH v4 00/12] KVM: x86/xen: Don't drop event deliveries which
 race memslot updates
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Durrant <paul@xen.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Fred Griffoul <fgriffo@amazon.co.uk>, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>=20
> Sashiko analysis and torture testing of the upcoming conversion of the
> gfn_to_pfn_cache from rwlock to atomic SRCU=C2=B9 highlighted a pre-exist=
ing
> problem: refreshing a cache can fail while a memslot is briefly marked
> KVM_MEMSLOT_INVALID during a memslot update, causing kvm_gpc_refresh() to
> return -EFAULT. The Xen event channel and timer delivery paths silently
> dropped events when this happened.

Gah, sorry for not reacting to versions 1-3, I completely misread the cover=
 letter's
subject or something.

KVM's de facto ABI is that userspace must "pause" vCPUs when modifying mems=
lots.
KVM obviously needs to ensure racing updates don't harm the host, but beyon=
d that,
it's userspace's responsibility to ensure vCPUs can't see mixed state.

> The first patch is a standalone fix which the same testing found: a guest
> parked in SCHEDOP_poll with a zero timeout halts holding vcpu_run's
> kvm->srcu read section =E2=80=94 unlike every other halt, which drops it =
=E2=80=94 so the
> VMM's next memslot update hangs, unkillably, in synchronize_srcu() until =
the
> guest deigns to be woken. A memslot add which normally completes in
> microseconds blocks forever.
>=20
> For the KVM_MEMSLOT_INVALID case, in some cases we don't really care very
> much: the VMM should really be using the KVM_XEN_ATTR_TYPE_SHARED_INFO_HV=
A
> mode which doesn't depend on memslots at all, and more faithfully represe=
nts
> the Xen semantics where the shared info page exists whether it's mapped i=
nto
> the guest at any given moment or not. But we can be more consistent, and
> more intentional about it. So...

I don't want to be more consistent or intentional though, because that risk=
s
signing KVM up for something it fundamentally can't support.

See also: https://lore.kernel.org/all/20220909104506.738478-1-eesposit@redh=
at.com
