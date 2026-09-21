Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C2489FDF
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990178; cv=pass; b=Knps+pTnyX8LzocNIw4CsKh17Bp1mmH/ZGXU3WcpQ2kj29QyJxpT/q6JtM4cexuUNLACxxNHREHb1TsF84NmcC4fO+Nr/I8BZENxkBY8DXlDNzNBxU7YT9Axo005jKShCUfLSA6zxXmZcUTPmoEKiCBu9yBvJ4+2Ugid8A5zyoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990178; c=relaxed/simple;
	bh=ptOPvpl8Jn4/467WKDIfcKUlrqRNuCJaQOy7TpWYDfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELUCDiqBIWgYf3K5ALRx9loAoWlvTCycBNxPpnZJMlG7LHjFfvwGKxDC8JaZKJNry44Q3BKNx1G3GRFGGRw84ChltZxnJRhN50ISFYLBuveWNorGLD/KCO8XE460AN0pAcygh44ZzdRtoEb6RdMM+popaoU7ucWo0EnSidOnE4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O6ageLli; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFjosavz; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O6ageLli";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFjosavz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789990175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptOPvpl8Jn4/467WKDIfcKUlrqRNuCJaQOy7TpWYDfM=;
	b=O6ageLlihfDB6076/yHJyZKSoLL3nKRi/zQLTHfzt81mczUIQ9IS0tgvRJ1NlCjqBb4DoF
	GZrYoV3RbM1da3b462HvAx/mn3gZn/RrTsYJoZiIFO2UQUxFL/1TZPIy0U7ZqqGb/oJSYY
	phAiGePIBp/H+zTMNVR59vJJTguhh7A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-5LWrs52wMO6RqnWj16Wslg-1; Mon, 21 Sep 2026 07:29:34 -0400
X-MC-Unique: 5LWrs52wMO6RqnWj16Wslg-1
X-Mimecast-MFC-AGG-ID: 5LWrs52wMO6RqnWj16Wslg_1789990173
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-486f3c0d896so1665431f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 04:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789990173; cv=none;
        d=google.com; s=arc-20260327;
        b=snJ5y1+AZIdFXsjENTJcZLmoCdYy0JksuGM4ERIWs3qEgO9Ncrun+j5Tg6TUR5Acfb
         nNiVxkXFLs+PV82CX6ykwLEVOdRDjLT4mKVLIqfxsoFrsWxjzFecUsIV5pij7ssvWE4V
         vjJTZ7LtJKRVMO3cJDTWr4JIztq2Q906gvzPJupoZi7B2gbiaFh7oNLm1bPw9Wx5gz4S
         JtvZ0nwta/5NY6K99Gh+q1NaIkv08qgDVw9P5s4Rt7iojTp81Xl9/0J3QtY7KFK2ygMJ
         sseREGNZN/X0OcTGulrvJCz90ElItzo+j+D4fKIaR326E/GRZB34hFGhDAj4PVnpcF/4
         9z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ptOPvpl8Jn4/467WKDIfcKUlrqRNuCJaQOy7TpWYDfM=;
        fh=U30w94/DrL46xw97v7C8uaQiRmiqFcndbE59xNvhTQE=;
        b=cSJlkruwssqz26CMhYEq+sP+lJmzcnouvNLVemgmK0XM9bKgaR1oXS4gNPa2VMKgK6
         pPG1N5pdBPaNhAqN1ha0UvEXfEHy1Hz96+Hd3ECQDzlhDbLaK+v3DHyye3g3ijdyasEz
         kLPkhDR1LNp++hqjSEMOthlaXC0a3KupG9KAWi7SRvWMz+uM5srl/EJZEDmgNwBAWYOo
         X7YhOIhegW9GsKNsn8Z+C2Bfrz3dy6WHhM3dzzCeI7JYcsfPga7WJfO9EMo08CONIgle
         ihxZ7ueL3HAJid8PsX6K9qD04KY9zUUwRieHEJ2ZkZWCHoleZkaZxSM98lsX6oSTEpLp
         6+uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789990173; x=1790594973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ptOPvpl8Jn4/467WKDIfcKUlrqRNuCJaQOy7TpWYDfM=;
        b=hFjosavzTEBg7sS+/amQKm0DVwQIeND1Et6uVLHGgp9oztjbPFCj1GSVjXpTtW1o4K
         Bc/WtO6t3w0BAV929yBDSAi710gt9i8vIG6G4IyZ6GylRBVB41jc975KGZ4C1vu8jtTJ
         x7xcrV9Z/Uk9xBkxBfaUqamjFEOwqtWIVJnzLrJGEKAvBb06h8yPiHXwvPyE6czoy7I2
         +8i/fivrjJ4mfrJsjj/GSjzW25mhmbFvGSLW+leI/NDqeBUQcrHQxaHhM2koGsHWO/cA
         SqniDp40toI3F8H6TS7Y1ucl7zgJL2l4gWnJOBTOA0JIIEQ+e05bwbUp/oqKz+wPpNep
         JPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990173; x=1790594973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptOPvpl8Jn4/467WKDIfcKUlrqRNuCJaQOy7TpWYDfM=;
        b=tTYTYGucj5uNHRgw++umMMxaPxo26eum3a63i93mnBuNLKAq155iJbFfWo4xI/T+Ce
         o7ew2lGN9+i/WfA9IbZoL2pxIPCAu7jet8u9XrMhZ4S3PIzjZ1iVZePbIDjBqU76JO0O
         fEWLPYgufSsiEDUoTzJLnLhux/nlx1W8NrS6+1Vn1+3n0e8r4OVU2j8wINfZ2xt1DNxe
         lDDvlgkM2W3jSR1MX2zunS8IPVoDpeZ75iB6fMRi5kGi/NRnc8ZGJ//DUgynrF7x83en
         jbaqgOAYtJ14+utbv5AM2Qtig/F3K+iZdPrw7Pq2e3LQRK8IFMGCojTwh9FD6UXz/+G+
         vjYw==
X-Forwarded-Encrypted: i=1; AKwUvByC/PPoI0Kkmj59pnTku2hOdJca2Cgj0L7eiijRo2l2/wwadsOuiIFftGdHSog9LJ+6tEMpZ4fpGtI/oQ+HpHw=@vger.kernel.org
X-Gm-Message-State: AFuF++k75xdLGbBSlnkQCTr/UQQHGsFCyZsz8lSt7GRzSv2w3fgj3RyJ
	Jeo6NVsJNQ49m/XT4qIsT34TBRpGfzeyioIqgc114UkM67qDwLXxLNDsRi7g4rLNGQSkYa/IecC
	01Fz2YdYo0ZhOg02tv4xta9ynU8qua3fmQXwHHDjYMhe0di8HdR9aImnourKiKEEzb+C2L+T3rL
	gGqqZ7vKIevcAojEzNFaAo7+B+LTPyrYOZrnRNcUugTzYD
X-Gm-Gg: AYBFou2b82cH7bEz96ROeGg71P+S8cfpFTfQJRNXVZbzcuscow7q8/IMXVc4IiS8Q2n
	JBV1zElWEEPW1NV20fgPxNq/lOJ9PatOwgWyULHjlL+vK2cvxEr4X4OcVYjK1HnN6LKimFtU8ym
	dBnCzAV/YtmFszdnVFh+JWAXQggY6e7Ftr5rZalPUo03lJ/wNxwTZHZydHvnORYMSQCI+weuPI1
	eM1HI7mmyMfdYPdQ0dD0Noj4CDUV0lkRk6og0kpvJrDLVUPxNdVkoJVy7vZqA==
X-Received: by 2002:a05:6000:491e:b0:487:84:96d7 with SMTP id ffacd0b85a97d-4871e373189mr14673929f8f.53.1789990172841;
        Mon, 21 Sep 2026 04:29:32 -0700 (PDT)
X-Received: by 2002:a05:6000:491e:b0:487:84:96d7 with SMTP id
 ffacd0b85a97d-4871e373189mr14673903f8f.53.1789990172510; Mon, 21 Sep 2026
 04:29:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <272c0fdf9e5eb9a1caf6a5c0bf674e3c006ac2ea.camel@infradead.org> <20260921112131.274-1-hdanton@sina.com>
In-Reply-To: <20260921112131.274-1-hdanton@sina.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 21 Sep 2026 13:29:21 +0200
X-Gm-Features: AcwNN1Xi_H7uo3XvFAj5sLWKjk7Urm5G8ShkD2xSWIid9H62cmytfHb-xU95uPA
Message-ID: <CABgObfYZKfSV=Ykmjkey+t1pA4rEEk8=a-VMho4=A0=xNLmKcA@mail.gmail.com>
Subject: Re: [PATCH 01/17] KVM: pfncache: Use atomic SRCU for readers instead
 of a rwlock
To: Hillf Danton <hdanton@sina.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	kvm@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 1:21=E2=80=AFPM Hillf Danton <hdanton@sina.com> wro=
te:
>
> On Mon, 21 Sep 2026 11:54:36 +0200 David Woodhouse wrote:
> > On Mon, 2026-09-21 at 09:42 +0800, Hillf Danton wrote:
> > > On Sun, 20 Sep 2026 21:49:29 +0100 David Woodhouse wrote:
> > > >
> > > > Replace the per-cache rwlock with a dedicated per-VM atomic SRCU
> > > > domain (kvm->gpc_srcu) for the read side. Readers now run under
> > > > srcu_read_lock_atomic() alone =E2=80=94 preemption disabled and non=
-blocking
> > > > enforced, which every GPC read-side section already satisfied as a
> > > > former rwlock critical section. It works in any context
> > > > (including hardirq and sched-out paths) and never fails or spins,
> > > > eliminating the
> > > > read_trylock() contortions in the atomic paths, the double-lock dan=
ce
> > > > with the lockdep subclass hack in the runstate update, and the
> > > > PREEMPT_RT problems inherent to taking an rwlock in those contexts.
> > > > In particular, kvm_xen_set_evtchn_fast() is called from hardirq
> > > > context (timer callback, kvm_arch_set_irq_inatomic()), where taking
> > > > gpc->lock is a sleeping-lock-in-atomic-context bug on PREEMPT_RT.
> > >
> > > Given the preempt_disable() in srcu_read_lock_atomic(), as PREEMPT_RT
> > > has no way of handling preempt_disable(), you need to add another
> > > version of srcu_read_lock_atomic() with preempt_disable() replaced wi=
th
> > > something like rcu_read_lock().
> >
> > Hm? What's wrong with preempt_disable()? It works OK, but is generally
>
> How is preempt_disable() handled by RT?

It disables preemption. :)

The difference is that *spinlocks* (by virtue of becoming sleeping
locks) do not disable it, but the low-level primitives preempt_disable
and get_cpu do not change their behavior.

Older PREEMPT_RT patches had get_cpu_light() which did
migrate_disable() instead of preempt_disable(), but then
migrate_disable() was deprecated.

Paolo

