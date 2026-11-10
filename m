Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335712;
	b=2q34mTo4zXg+jwfhgzwnQ1YIqCWpYPyZTb2eei/mhPD+cJ107R6dEkGo0Zh4UXA5APMg
	 jNjsbEbk62jp28jzrxaN44t+Yw4o5Jg6G+DRXChUo+BOp47EnDAYF5ljYBTK7axlajhgr
	 raDmK1a3FJdM/cZtctQgMZq/sL7MUCcyPCDXVfIwpvxPPY6Lytght8trbhqcKGjJGxezo
	 cd2RPkn3CV9bSbFUENekLkg3oIDSfThVDvQhIXtQ66bIVCMO2K5cmT5TNdl+eMG6w45Az
	 7QYkaIErdMAY4xhPG0rmB+ZrFGKVwqBFsoESzpeXxORjTDAes9aii5/2xYbHtNtavlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dCp0Db26sWh4sAbqSPzWp1M0J6ydStL+IzHoLsVEdug=;
	b=Qi9uRChs47RMaKoqmVG3yx/imLJtNeU4TfmSHJqp6Eqq8lAcZenjkJYYSUleNl3wA/rc
	 FIE1V28tZxRI03rMW/YQRQgYUl7pjLmd6cVEYn4+c/D0pcVmHUzN7ro6RGJkyI6dI+fYM
	 XxmJ4a47LNPNBw+YsQi335Y/2gByvrkkp8XESFiKqLfuqNe3RsukJGxGjxs4064z6gTkG
	 O73Eszl4ImUBgjmD1NhnZmbXe7jKeLSUwIjZ/Kd0pmNFSg5onRZztApRASjEvzYiPjgcR
	 kzKZNNcq843/SBDKwWuDrffMGa4Yh7e9rPqm8bujXfoB8/AK+YCGNwmb4wuOKoBqVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ctx22OId;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FEA606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 18:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FEA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ctx22OId
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb869327e7so2011728a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794335711; x=1794940511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCp0Db26sWh4sAbqSPzWp1M0J6ydStL+IzHoLsVEdug=;
        b=ctx22OId3b1A89h+/g0DLFFIvF1rE/LJiVCOg314dN1i0WsgjGNLUdr9g5ogDUofXQ
         iTytv8eWhKYvvAc1PGv3tO469SZSEgiiM8pzHozoBPZ+JLjj4U60kg4GE7ooJgxxgMLD
         yYkNR/2PgzAqsrdBgcDkGmqae2glgyxhphW8A59/68tE1XL5f9uZe+BYr1Q+iDODYe5d
         DYjN8zKbWgC5M1atPcdss9TOVd98YuPqehqpzIzO8IOUKFSKplq5o47oSsn2tnQxaxmm
         uT0VRNaOVvoGtA5U6P1PyJMJR89m+mn5fyW1gkyhmmAlacc90Jj+otaDm3KCwrVsse/H
         ntQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335711; x=1794940511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCp0Db26sWh4sAbqSPzWp1M0J6ydStL+IzHoLsVEdug=;
        b=O2hwi8NyM8zOFsHo3dLGgSY+mTN9C+lJPSmCYJ9pT+Q9l2iR7xTLfy1+BZC//pwT61
         5V0dVQfCmx9Nve/cMiYMycnRIyQvi63QnUB4Zp7a6hYRm85/FNVx8CY5GJ1phwDhYob7
         Z3/R+u/m5EwyrUS7DBBEocJCMnGcPvV8wUCLxrq8WcgBDn3JHmLW97/iLD94v3zjMFjm
         4ZdmcsChO7ZbDdjwGM9AjJqR90/vtDNEIZl2eXzKmh3u4JnZNuICGeifHFR9bkLfTZ0r
         rN+ZNTy2ss6/Gpnecg7Fjl5CzjpQeqNYuxtNSl2HPJKNit0kZwlhp+cZOr/AYrskIpzL
         CygQ==
X-Forwarded-Encrypted: i=1; AL+hErF5asooDv51PO4y2bM1IwEtjBbP3bEsGZe+vGgaiv8XG0eWWBXG8zGoLL7Ee7KqPHN1NWAmzPeP+w2DqyD27y0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E9Wmq2MAiEzldc/z3j8R3PfyXO7ktNUFhT3QVoGdXkI2SWQSz
	jKGYKp/5aarnsnSihBJAwhmf5KCMzMgyJ5a8h9DZqB5i9JVnICk/OvN7IFOk2jkDt4dvVfYDXR2
	YduZCYg==
X-Received: from pgbbo3.prod.google.com ([2002:a05:6a02:383:b0:cd8:ba74:813f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7907:b0:3e1:bcb:1d19
 with SMTP id adf61e73a8af0-3f1901885e4mr3216153637.67.1794335711215; Tue, 10
 Nov 2026 10:35:11 -0800 (PST)
Date: Tue, 10 Nov 2026 10:35:10 -0800
In-Reply-To: <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-2-fuad.tabba@linux.dev> <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
 <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
Message-ID: <avNj3kdnvQiY_ity@seanjc-mac.roam.internal>
Subject: Re: [PATCH 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty
 ring is full
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 10, 2026, Fuad Tabba wrote:
> Hi Sean,
> 
> On Tue, 10 Nov 2026 15:48:37 +0000, Sean Christopherson
> <seanjc@google.com> wrote:
> > On Tue, Nov 10, 2026, Fuad Tabba wrote:
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> [...]
> > > @@ -4461,6 +4461,12 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> > >                          break;
> > >                  }
> > >
> > > +                /* Like KVM_RUN: only the iteration crossing the soft limit uses the reserve. */
> >
> > Please don't include AI comments verbatim.
> 
> The series is LLM-assisted, but the comment was actually me.

LOL, I think all of us are getting a bit corrupted.  :-)
