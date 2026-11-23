Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795460157;
	b=4ATVEmSuyU5rPU8ocpH1XE9bxv65nmEpjnwoCK1ll5lGfUpA0uwuijgNapLWh2iqfVfw
	 ucvHDhXfUCPbbtDQn61MTz+5OGrmfcd8jV1oOI6cWweMCX/aTwlLqnuC2gWqdy0eX4ZLX
	 sm3VJib4IqCVFAM8HsAq7OWk0HXoqDbn9MoU/W3sVXxHAUcFLdUGCbdw0vrx8dCqxNOdB
	 4vBlu5L1mWCenOOuok0g9P3tyVK8yOTaw3X44w7FMRYWWbJJFuNDOdt7c+AW6UkyO+vy2
	 i8yjNrDds7AyZd5NweVecxifdL9JJaRswG0eQQJ+8kXSCoWnxGZjt3K3UQq3Ah1IdpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BNSwJg+0HhZxN5eag1txmGeKFOOyqEA8cbyAFIEA6yM=;
	b=vTMf+grb+2blDbVmaymr6OwbJJYxUVL2YCaLDlFNmsUnVBbeKju8+3Uugnmbe31jZRFs
	 mzIgTelF2CtET0/DRomrzbWbyd5iAnUyKSotRZGxgzGiWP9LcFmVcdGjzgIW1sxdVYGY6
	 ss/yZ3fHu3C4/OASDzmwhN5qBoEcy8qYB0ID5kmyjdPRLkg8rK+NBvErhqzOTADacPDXX
	 KHEJ083syTq+ZeBK/5ukwR5OM3Z61TlsSQ6EFcKhqhTVNhQ1yqOQ8J1BrVu6P+Z4mHHQP
	 CeLrYu6e37WKyRUoNK0VgOkigwQy3Jg65Ro1thdiKfcAtCxRcImjdbBRzQe4Ew3wtIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWjJFVer;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322E606A331
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 18:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A322E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWjJFVer
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5127c7abd5so581096966b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795460155; cv=none;
        d=google.com; s=arc-20260327;
        b=eEcrOHVQoTwBvGO68hzvJOf1t7ao44HKbtBtHxSABqbtwwGC6C/2p05p2d+dQkIUzQ
         B1wogtHoVvPTAo3QaQzCFRkTfDMGVi5LTGiyNfuhuKRgMtK9PladckrNH9dlroaYXG8I
         58lqA3yjeE6G7vKqw0mAgOsMilEM4tLpwyC6z5lbOtFu/B9xhpCcm0TKV27/YBlk9Rjs
         V7gCyM/YUC3Qlnwbmo7LqUrSbivLbJOPpOu9n02KLGVhtDDHWZAa5xtm+L2R6a+dGfgd
         RBPNg+v6IsSCcDdjgfHl4MJRk9kNG44jeImj3HoKnfuGLdYpYeheS2B+vOBzoganBZJO
         xSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNSwJg+0HhZxN5eag1txmGeKFOOyqEA8cbyAFIEA6yM=;
        fh=ahww0JjKdAkzdmSjCe9KE+OY83ajMRxYFhz6Svh/WPM=;
        b=RA2KC5ZvhXKmHb8kDryqN84jVQVJAzut6j+dp23LT/bauUnOx1EnYqz2wbe0K5T0u9
         +gHwA5t0iDrlCwI7kAqx6VTyK99jbIOvtRea7MXFfyAZ+DLB3x9oSKo/3WJ2rB3YB+E7
         bGhCm0hq/XWlFV741P/U99xV6M3ZdmCIGA0acLfogiYqNFfdCERIIRuIHzzLFQB7hYmK
         B6OldSaWlbAeUdM2eMLMAQpyPA+EBklFEm8xdq6G5DYoCPcOIjV7SGxN26niZHyETU/J
         iZ4BrtcmMj27bR1YChshjn7mXO5ZniPyC+lC6n0c4TNkvREaDRZY4aQeiWX/ejF87JbP
         yWVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795460155; x=1796064955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNSwJg+0HhZxN5eag1txmGeKFOOyqEA8cbyAFIEA6yM=;
        b=SWjJFVerFZwp5gdpwgSwsHCvH/MuBZwcTTCLGvQ2+MQp4fpwRO1TEnK3PIl5WkZa/U
         4PYBssodVjWkRVnC2iPkYD4laPHHByLLCScMdEpXN4Fcji3zhcktPBk3hTnNfJvWWx6i
         +xT/2XPzIryntCkoeUD40+jQ9uoeFBS1E4DsHtsDFb5r+ZMBj4ulQvwbkFCvxi/wsmef
         tYLPWBzGqaQWWib7PVsEorJgj25Ih2Bn+igCF6imMbkjrGjtnADAPJuPHJvIXnQXn8Et
         jP0ZfP/o/b9OqmZGm5854VD3POC/VDiGbANhdFn7ir5sxDaBdPzx2VSmKpsAU4dHgfOj
         h97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460155; x=1796064955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNSwJg+0HhZxN5eag1txmGeKFOOyqEA8cbyAFIEA6yM=;
        b=ye29zDkxto0q+DxVLoNtRqalVsoQDTUlGVvjMN1ScsQ/4Eo4fWHaE3YdeFhbGgLuXq
         X+gpln3tk3sbEDSW/Q/SMqEMEZUEWOViCIVxj6E4H9fLwQcUnq40wcUTNO/oCHb5aIbP
         dgzGK2O8jQT8jcq2Y+K3yxS0RiUDTfeYvQzu7besPnW81OGYNfjzA+bBQK+A6c9kLvPO
         3tgmYAE/0eXcAMVoF1tiP4TxlRALI5zzvM9ewIb4RXkjPkzrtCwWzWo5z92Ex9fSzbyf
         FzJhKI3jENzjkLQ5YG0xs0/p3nxRH6r3mMpK/Vn3KMKqtcNGyOix8pOHYKuuHWXo5YDK
         0IMQ==
X-Forwarded-Encrypted: i=1; AL+hErHUicNS/igFEyIMNKH/iti+cC9zdOHD5owwFOHijXU+c97sI2oFqhVHH2Dlc9stulOGhQl8cGNoqF8iVeEry/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8o1qeDq+K3lh/SWN0bTq253eimt2a49TQF/t2Rgpb7fEKK0cx
	FxMQMbgPjzUtH71jHDEohSes8Hd4HxqaCsAjTE624ETZWD2qgfuThCJl1dCpOTBrFR82A9soQUA
	8MPsdEhDJIh0DPl6bDunaBELMpHhYZNjDiNkGFT8n
X-Gm-Gg: AZFdTZeJsrKbEIdZMkzXlFUbiAwbgnkiE8C4gsS0CD51xtJO/TFqxCKE6xn+mYIa7sR
	UbM5fBrNGcoIXtghfotOTKjq+pSwEaJxSFyPBGWeX45ngcC7T1LTQNsstmJ+fra/bqyP4GF7RVz
	0XmOi8fjIJ+1O7vKaW7IFz6pcvLOfe57PFu0c75oD8KUGUnsldRJgKb7FCj4phH4Zf8kkpDyqQZ
	UqRcOExciAHrfQBqpjVlDV9p0jHx4uI8py5WACeG7zuCrNcrPzGDfw8EDgbln7J1BJIsp8kfw/H
	7q9LblMc6FJi0vXUdwoXHckfM16y2I0cDLbiFhI534crluge61Cu+AZz+Bml2pxyPi71RE6Cy3u
	zW5xGR5KEx5SUy2qTDUOksLZN8pxHuInxivsZbytguzVTOpAVD8P4nZ7lTO16rXGBiDRY8UDTmJ
	0ITtwXKstxQdgv5i3q+Va/7r03y74SnGHewBK9eZUwhUHmYXuaUzLB3j1sGre4boxgS+Gp+ZP1
X-Received: by 2002:a17:907:a890:b0:c50:9432:b7e3 with SMTP id
 a640c23a62f3a-c513aace654mr1151233566b.42.1795460154527; Mon, 23 Nov 2026
 10:55:54 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123153238.1036972-1-smish149@asu.edu> <20261123153238.1036972-2-smish149@asu.edu>
In-Reply-To: <20261123153238.1036972-2-smish149@asu.edu>
From: James Houghton <jthoughton@google.com>
Date: Mon, 23 Nov 2026 13:55:17 -0500
X-Gm-Features: Aa3M54o3BkLplxoImmTCvpPC5WgG3n0ZneGbPk_xxpY2ZYPc3HauVZVJB5o2TiI
Message-ID: <CADrL8HWj6qLSB4h_JC7qSr6+t6Z6p7zzL7fgVne-m8_cfrHwOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: Disable preemption while pushing to the dirty ring
To: Siddharth Mishra <smish149@asu.edu>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:33=E2=80=AFAM Siddharth Mishra <smish149@asu.edu=
> wrote:
>
> Disable preemption in kvm_dirty_ring_push() so that another push to the
> same dirty ring cannot run in the middle of it.
>
> kvm_dirty_ring_push() selects an entry with dirty_index, fills the entry,
> and only then increments dirty_index, all with preemption enabled, e.g.
> when vmx_flush_pml_buffer() pushes the logged GPAs on VM-Exit.  If the
> vCPU task is preempted in that window, kvm_sched_out() calls
> kvm_arch_vcpu_put() while kvm_running_vcpu still points at the vCPU, and
> kvm_steal_time_set_preempted() or kvm_xen_runstate_set_preempted() marks
> a page dirty, which pushes to the same ring.  That push fills the
> selected entry and increments dirty_index, then the interrupted push
> overwrites the entry and increments dirty_index again.  The entry after
> it is never written, its flags stay zero, and the entries after that one
> are dirty.
>
> Userspace harvests the ring in order and stops at the first entry that
> is not dirty, so it never harvests any later entry, and the GFN of the
> overwritten push is lost.  A VMM that tracks dirty memory with the dirty
> ring, e.g. for live migration or to restore a snapshot, then misses every
> page that the vCPU dirties afterwards.
>
> Fixes: fb04a1eddb1a ("KVM: X86: Implement ring-based dirty memory trackin=
g")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddharth Mishra <smish149@asu.edu>

Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  virt/kvm/dirty_ring.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
> index 572b854edf74..1ed8b8771c3e 100644
> --- a/virt/kvm/dirty_ring.c
> +++ b/virt/kvm/dirty_ring.c
> @@ -221,6 +221,8 @@ void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 s=
lot, u64 offset)
>         struct kvm_dirty_ring *ring =3D &vcpu->dirty_ring;
>         struct kvm_dirty_gfn *entry;
>
> +       guard(preempt)();
> +
>         /* It should never get full */
>         WARN_ON_ONCE(kvm_dirty_ring_full(ring));
>
> --
> 2.54.0
>
