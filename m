Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589796;
	b=qVtySilURt74ByzGSIgVbOGVtTsg8bghRdnmPYPQ6ds4H04sgpx/DwWkUMiB4gVM6rjM
	 xvvZXJA6DpSpI7/EQ36cQd8pTeOQvgL6iiJzRyOn7Zv2gxhGfRIVDXUKlwTPIDFJDavtZ
	 19EO910IVUa49E2j5m7RDbwAOopq+Kt9ULEB5tFVTnGmW9YGVOQtpFYhrD+G80QszcT+d
	 kmLk8o+dRCCLfsJbGyHWa3IddNWwhdnGMGFtFqllrx2+e8hE/8H9wZBJGgEQ4KIAcDXqc
	 Bqf24O/1aPKRH5B00w16apIg8hBpHh5PxPYpvadMx/27wd/aenx85ClWk65sjWzTVzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WQnd85yPB60bhdolGWcMJlVAtTrb9nbyVFLWQL59DRE=;
	b=qJutBjRaDSRkaDO7t1CZtgIOHC2niV0ajHdKZKxdbHeeqaFJQVx0w7EdrE0OfgduMMAc
	 mX55GroecgGEjG6F2gavXYRQTgw3XPJn+S8pgIU+l00fzdS3NLfLU8tMn+lq1W7UKKn+Z
	 RhAqgxRSyMp4QVJ3q+symzOI+SXXBVIwh6/k/j5BScWsfsyPfVN1qOi2t9OoMfjHdt8nM
	 cmJS9vM2g+ApB/Qhzo+nvX1ZMG2RjWrq8kKmq0IU9PuFiCpsnbmlzY1yml5n9geHUQ1Ve
	 iQE0P2AbtAvXplH1I/UYoUplzqqSJSZa5OaQB04zrGj+aW/nQrieCk/ZrtlcPzS67lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=M9cXuD2e;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB9606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDDB9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=M9cXuD2e
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso39514655e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589794; x=1796194594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WQnd85yPB60bhdolGWcMJlVAtTrb9nbyVFLWQL59DRE=;
        b=M9cXuD2e16YtiBuyCgCK5y4vErgs+z6SK5xnJwotqHno/AfUjPvKbgA19vHhFIlzm0
         CoEgT1A1ucZpKSv83wPyzLCRMhmNSvnKKvLHje7W1IoId+eGvlOXWNcO/LuWFJSF2oQ/
         3C1NHvYuzPb+9ZNPKRv/I9o4XlU42ogdA1sK8XIhFWrOmE7p5Gs0FNva2+CPFg57IuDv
         zx2vKk3GUUYuZdj0g/LoIuZqsT0GpUzoCR9yIk6Bu1330PrnaKiKdtIOC4AR7Lp/Pc8y
         r42fLnp1w0W87Wg4Mfbm3N8nf1eI221hr99iwK46F0BG2rXdWB5Pf02hDOFpZDgRXHaw
         lEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589794; x=1796194594;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQnd85yPB60bhdolGWcMJlVAtTrb9nbyVFLWQL59DRE=;
        b=hoLFUSvsfvSth1zo5Wv/QMFZl8+DnUoB6KmI8hJCe9p8d8cOKFupUttr60LF2GxQwu
         6lsH7oKrP7O/T8z/ZlpOzAxHXmDZ6bzKqYww5w6ZGn6w6FP8SNWKrUwJ3+qiSdP/igat
         fYzHBuj1wyKrOFnA0LP2Z+5uwTQ/gQ0rIMAH2/gbyHg1RxIBZ3PP6gaDQ/mEfSMtPl9p
         Sd8o982Tp3cxiyB0W7OmjtsP3bmGfdvcn/6tByKC4UtELTWEJiiHqK/dJosR97ZNvRJA
         cK8+czhrKc0XOAjsqh3c2N5DLg7DV/ZlrmSBnHZQMvWrwL+bF5GeJ69JQTtiXmysnuNZ
         2PTw==
X-Forwarded-Encrypted: i=1; AL+hErF8zMmreE3DDt5PdWWkEzgMuWcHLjZEdRQXMeYQHod0HQDbTSxYSiNTwhFfY1K6qyaa70Xfr7NffmCwN3HiBKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rep98nunPspbfdZzinjo3BVfiHq8rKzTYh0oKpb6kNEQ/cEwc
	SAgoinxjXQWYaEmE8fqpXd+VE9wmfSTSmib8NutQUNawPj2Fjt0JTY98layTNDmu33Y=
X-Gm-Gg: AZFdTZdT3Hpe19BzyPvR8jcZYa6PGOxDj+36JPIzN0CHcRF8KPmsNQ6EzQ/Z27uv7xR
	LcFTXI49fqqOlFekFrW3zJY5uynZm72qjaXlK+NjzI7Ztac9e4Vm9wrJwnEw33tAKcbcl5rJojy
	jJkjDsEux9ZXUbrFjU66g8uFv8R6ASpB549c1nH+iziVF+g7wBdQ6EGVL8dRKeT3TZfWXK5Bt4F
	0hzi/UqCm+k1JDvYo858F23TO3qY7FtMH/9Ms+fOJy6t4Eb4esUbsoLShmymesdwKmMpuyT6QpJ
	pO3qmDxba2gTduqgmhUoPqBVzi/skJiUcA7Rbw+feTaK1+mvFtfwIWqj+XBVFo3JYxV+7g7+iDa
	JxteqHE/SZ1OM19/dqCxgYpt1m/lIMbSpbra2JU3cw7pwYcRGqAI1sai1IjCbYFbjsScsKAhEe5
	dX7BAJpnY1966dDIl23vSarLnOYzu5CacehaigeTFgNhewOnnzyq1WLfgvQJZFDGdILy+liu4nV
	CuXP1AqLjSpiY062iaGdfw0SM8AZI+MkFWq3i57eObag76JY0m78CDZSrqbg+N/uh8B4dYarn5l
	RJksvUjHJdO0LPwFUTJt
X-Received: by 2002:a05:600c:530e:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb8880aba2mr330852995e9.8.1795589793909;
        Tue, 24 Nov 2026 22:56:33 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm777474785e9.14.2026.11.24.22.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:33 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Subject: [PATCH v2 0/8] KVM: arm64: Fix kvm_reset_vcpu() and SError
 handling for nested virt
Date: Wed, 25 Nov 2026 09:56:15 +0300
Message-Id: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOQQ6CMBBFr0K6toYZxKAr72GIaaej1BiKLRAM4
 e62GFcs/8z7L38Wgb3lIM7ZLDyPNljXxoC7TFCj2gdLa2IWmOMRAHNp3KBffOOJuOsjLFVxMEQ
 lAkAlYq3zfLfTqrzWvxwG/WTqkycRWgWW2quWmnTaGNM/cY0NvfOfddsIyfefUWxnjCBBkqlQl
 yeFBZpLx57fex5EvSzLFySRl6jpAAAA
X-Change-ID: 20261120-double_exception-a34dcc521118
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0

Our formal proof work at Pereq found a way to trigger a WARN() by
injecting two SErrors.  Then Sashiko found several related bugs
and testing uncovered a few more.   The original patch is the same,
it's just that I have added others as well.

I have included a selftest for kvm_reset_vcpu().  I have a selftest
for SError as well but I have a question about that so I'm going to
send it seperately later.

Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
Changes in v2:
- All the patches before [PATCH 7/8] are new to fix other related bugs
- Link to v1: https://patch.msgid.link/20261123-double_exception-v1-1-cd82b59a232d@pereq.eu

To: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Zenghui Yu <yuzenghui@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Christoffer Dall <c.dall@virtualopensystems.com>
To: Rusty Russell <rusty@rustcorp.com.au>
To: Marcelo Tosatti <mtosatti@redhat.com>
To: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
To: James Morse <james.morse@arm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>
Cc: Clément Blaudeau <clement@cryspen.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Dan Carpenter (8):
      KVM: arm64: Drop an incomplete MMIO access when resetting a vcpu
      KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1 when resetting a vcpu
      KVM: arm64: Discard a pending SError when resetting a vcpu
      KVM: arm64: nv: Discard nested SError in kvm_reset_vcpu()
      KVM: arm64: nv: Replace a pending SError when injecting a new one
      KVM: arm64: nv: Don't deliver a pending SError to the wrong guest
      KVM: arm64: nv: Re-inject a stored SError after the exit is handled
      KVM: arm64: selftests: Test that a vcpu reset clears the vcpu's state

 arch/arm64/include/asm/kvm_emulate.h           |   1 +
 arch/arm64/kvm/arm.c                           |   1 +
 arch/arm64/kvm/emulate-nested.c                |  14 ++
 arch/arm64/kvm/inject_fault.c                  |  10 ++
 arch/arm64/kvm/nested.c                        |  16 +-
 arch/arm64/kvm/reset.c                         |   8 +
 tools/testing/selftests/kvm/Makefile.kvm       |   1 +
 tools/testing/selftests/kvm/arm64/vcpu_reset.c | 210 +++++++++++++++++++++++++
 8 files changed, 251 insertions(+), 10 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-double_exception-a34dcc521118

Best regards,
--  
Dan Carpenter <dan@pereq.eu>

