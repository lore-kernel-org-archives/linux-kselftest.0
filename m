Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960234;
	b=OpSwmcbYgTS6Bm0rusgOdQfdgdxKt0GstQxZV4F+0dXwqtRtnu6kPG9qfqP5O09bkkEI
	 dgRUjWLOKHmzmwSxBxpymrG0EV+RYTUuw1nMB7smAz02TlNgG3Ul2pLOEI1dMqfnGMVBQ
	 5lxK9Owjyn7PMYDyykupuOoJxOIIDjCBRpbKzdrgOuWk5oI8uuTpqjRXZtbJDU/HJP/A6
	 p+kdOdfYvSEAKFd0fbNR8y14z4okjLZC+ygvZubnJFuwIAl76O39EtnuAoFpxPceHSYFv
	 Al1vVLqdnj4buxQqRk8LpKnhxe876pD5zBqQ9b1/29ogSCv2hi5FcUkrDVOFeaAMhlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=;
	b=qYqznAoIiClggls+nzOeTTyXp7TOWfL0Ds6MdOcFSt2umaWpuv5qFM/5xK8lScB8X2qd
	 /UOtsJ+FSypRjbXsf4e7Nd8r0MRTkmTfveNYuSIR0+mzsJBYN2n9olcfR9/xWtwNhpHZA
	 2Lcr5uliDdIz+s5Sv3PncoEdCLaYlcPb/0qNuoUGNlo9Mgwddb5R0QU1RNzhYzohG3CHN
	 UDX4o0A70LmJ82W2vq6c5tc/voDEB/+mQctO3mBq1gSJWO0CUhR8GddLT8c2i6YYeGnWu
	 rnTIcchUGC/WZScdN4eIWMGBQpQzaryCfni/5aH/Mf1R+IPKbf/U4GG7DinKFCHqsoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hDS/99aC";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64C606A31E
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 20:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA64C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hDS/99aC
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16082105e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 13:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960232; x=1793565032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=;
        b=hDS/99aCeF7CJxsoTTpZ0+zronkwQywQHbjg0mGFpMqPy+P33plzbb03DSSh3yWcFE
         XdokAJchxaBwkz1TGf7v1Gs0AnodKhKfLIPwCMU/jCH/+DUiIpraVT7SZv3j1rnWdIZ+
         CWKSD7mo/0UxzGlOMn8LKZtslmb/kPKp1WGmrz8q2kjdCkJgANiCoAjh1iK5k9MJXUdB
         ReeG6l/aUIsPWkG4MRK1QRz2l4gspNxWA2cEf5A7Mn/2ViokXWssTASVkm6mYDVm4giP
         uVDtfai7MqPXeUsoS/ww2h35N8E8p/6jY49tQGi6mPliQE/8W1aCSdPnV4V29mt8S4pP
         IjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960232; x=1793565032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=;
        b=WGpaDMvC21FS6ky2YwkHMJAOv7tG/ZOhkOIROeUeWam/HHUIpj4CLb+tY7H5LNs69C
         Ajnhc1dEgutga82+ndAoGn7mgMTQAPjFu/vNzooKUv+AaTeAJd/wiK/ekXnUTUIe1f1R
         WHnn2/lGu80x3OeJ/wygd7cCA0oHF4T0H5Nfbh5xlCDNQpc8xckFgnc9kFTtIZztz37m
         nWQ7I+iV5XhtLAKawBXzQZy3jtzA5FmS4vFpWg/HMMlnL6XPbmcb98lQXyo1Ufs21o2q
         g1wBRk9BaH7HXVmf/YVIcA0Q8lgFgMUwa5c8r8uP2ZhxYlKxkcVBkLeKoK/qrhmc5qXQ
         nHeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxdJm2SH3kc8BhB2uVu6+w/qVYXllomx1+kt557teu0w4+TK7vIkD+JzCzdE+7FSF0lyKTr57BzafULIqszcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6E23oaWvUsRypsz9qY9GMvuHOTwBZZiPji+0MXwcZgg1KIpG/
	RicmCnlb8O8hhYXFSVm53aBxAvxRT/RyD3uEhJLad+8s/3E4MPuYfY28
X-Gm-Gg: AYBFou2VuUFUIzVOSr2Q8dRSfqB+eYvZq2sLUxRsyrLWA9vZP85jtJhKcpPwnnLDfmD
	O4PYzvL3EoD16bSbiFr/uNHhk8ZphT5deOv3M9xCuVdg+ZwCADorQnPkgr2pSt7u4ElvPBI+3eF
	6XVHGdMNJGpJNFPPLVOu5/Xu/1hR3FqqIhxsDpZNXNHCqCj5DpoP4snOtawsvsdlJIuJL4jfLRU
	REKmGg9BKdCiY6b94ATby2/kBjCqQ43zyLxYgYOx547ydfqxB2X7Ku8quRZ7HB8AhEfED4NtbAe
	cHNkXJc4YrpjkJx3+GIndwHFCUEpBdPdZAZtIb/IvikdA8gnT9he3nKuekCZFNqiXQSwsc7X5oP
	uh/E/MHF7F4r78VTA3dk7Qh8bQKjf8O7M3Xt5ZUdd0gBvZgcB0xebcQJn8mTpDatF40JBsSZP2a
	5XnqqcO4XwSkvlB6KIazb3bZTT9YkAdsgixpyrndQlxwGvieKJVpUq0rS/N3D+pr2r2nG5zW1c8
	MYB6DR9d5JdN5OzGC+6mw/4GYTgjZ3BjL3Fw3wE8/Yre8JWQfJnMZkOuPTnA321T87ZMSB+2HNa
	Md6J38hZW8s5DJbVnFUPQfvgwEtymEFviWNXcKrTBq/vAwL2/sC81DQj+zzGo3lGBW4YzMQGqTw
	lUzqmgexYPTvsk1UvsdN1VX0P/A667hA2OAh/lrRcsupRZ/MBDaule5K7o9w2pFfWsBc78Rcfno
	g5
X-Received: by 2002:a05:600c:4583:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a35acc2773mr98426965e9.32.1792960232061;
        Sun, 25 Oct 2026 13:30:32 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a9cc-4401-09c3-9199-30c4-c6a3.310.pool.telefonica.de. [2a02:3100:a9cc:4401:9c3:9199:30c4:c6a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm12003158f8f.17.2026.10.25.13.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:30:31 -0700 (PDT)
Date: Sun, 25 Oct 2026 21:30:29 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Eric Auger <eric.auger@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] KVM: arm64: Preserve level IRQ re-pending
Message-ID: <at5k-_Ign30fPuHE@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
 <atxWfRsNNK8vdeSr@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atxWfRsNNK8vdeSr@kernel.org>

On Fri, Oct 23, 2026 at 11:55:57PM +0100, Oliver Upton wrote:
> > The exact alternative is to stop and synchronize the target vCPU
> > before applying such a write, as the active-state accessors do. Is the
> > conservative replay acceptable here, or should ISPENDR pay that
> > synchronization cost?
> 
> Yes, just kick the target vCPU out and sync the LRs back into the VGIC
> state. That's consistent with the approach we're taking everywhere else
> where this sort of issue arises.
> 
> If we're lucky the vCPU is just poking at its own redistributor and the
> synchronization is free.

That makes sense. In my current v2, vgic_mmio_write_spending() uses
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock, and drops the extra struct vgic_irq flag.

> 
> > The issue was reproduced with Zephyr, NuttX and RT-Thread guests. On a
> > Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
> > once before the fix and twice afterwards.
> 
> Have you configured these guests in such a way to reproduce the issue?
> What exactly are they doing that is susceptible to this issue?
> 

Yes, the runs used a small test harness in each guest. Each test
configures unused SPI 150 as level-sensitive, pends it from thread
context, and pends it once more from the ISR before deactivation:

- Zephyr (qemu_cortex_a53): k_irq_set_pending() -> GICD_ISPENDR.
- NuttX (qemu-armv8a): up_set_irq_type(IRQ_HIGH_LEVEL) and
  up_trigger_irq() -> GICD_ISPENDR.
- RT-Thread (qemu-virt64-aarch64, pic.gicv2_eoimode=1):
  rt_pic_irq_set_state_raw() -> GICD_ISPENDR.

A driver that hits the same pattern is RT-Thread's
components/drivers/mailbox/mailbox-pic.c, which amp.dtsi configures with
level-high SPIs and rings via GICD_ISPENDR. 

pic_mbox_isr() reads MAILBOX_ISTATE once at entry and clears only those
bits at exit.

Sending on another channel while pic_mbox_isr() is active sets the new
MAILBOX_ISTATE bit and writes GICD_ISPENDR. Without this RFC fix,
deactivation drops the second pending state on both GICv2 and GICv3 and
leaves the new channel bit stuck.

Thanks,
Karl
