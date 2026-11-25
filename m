Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589808;
	b=w4jRD+uiWR6DB7Qrg+L/t1OcYaiEm0yIAJW4MU6VCYsLYiocrLzx/diG3alIyTdEnmLF
	 IB3nJ61+GXYg8zcqOGyRSLLWStjTE+gRKTiKrUltiavjoLw+uCcy1MfW0QEEtjlo7e71f
	 6rRgBv6DrlvsjZKq+x98FPV6YrSloQpcIEK1JYesWbHXxRNRC///zPb0HNJTzS480vt0r
	 gapuo/a5McUkKI39Py462fyq05f+6EVj9Udtds6EhxgvyCY4cOtN80nw5ksKyN96nFrZX
	 lL5swGU38jTa2uAlPtPvnFWMi0n2HLswqEN1VGA0vyrGt1rLfr+/b485N3IVYMgQrwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=;
	b=B2N/F73VtpRLsFYpzpNFp4nPJdMIYoVFGSd5OY7Thydei4ey59czjcpklKC30EiiwtWW
	 ySN8zXad7nojfQLdOKJuN4QCt2dhYHIdKNvn72t0eKq985tlDx6V248o4gtmQygdNndfe
	 on4BkxEgI3Y3DXD6RQ3TRJQP5jqnhgXtxZqI8p3jqevP/MxCkI77pPhjU+naWE6/rZk/7
	 nPDCqwDJwqZ31v6pBHv7eVRNuprPWVwTa80wgJCn07uYsnFAd6ofzqpp7F/FF9ir/0Ce4
	 bvFcGE33b3311Z0yph32W0umRsx6tN8JKpGcrZh9ryJZpi2WlyUYIwHzuCB6n5McHlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=RlPZXaa7;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFAE606A6A8
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFAE606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=RlPZXaa7
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5017158f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589806; x=1796194606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=;
        b=RlPZXaa7fe7EQZlpHI+2GAQlXvVlmpHFOev8m+dtEjaz87EYAL8kAQJNFvcebnJnCJ
         QayppHZcapAX1zGtIIZsMb3RlEGPDjqVmWDvVCnvzPYoTLjBV9ke6fhmRYjzuIaAP7jA
         uK7+gZzUDH1J8jBhKFSXooKzUaz9d+QZLs7K7nY9iph4N8+4JXQtNDxgs+EMim1wIgD6
         3tmYEVVTb6u68vD0HJXKScfYOusBlvBMoLIrGEGqC4lPbYcn7H4MFr1XSBLw1XgIUh2h
         xgqu/Fuyde2lH67JzlyZNxMTaIY04TI3Dwh75KA5/W7iI/mh+UWUbKewCi1k6FPdGR+x
         yANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589806; x=1796194606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=;
        b=gpQBbSd0dwTlDDMjxMkdLxqw21n8t3qQsojBPvqT9v5qRiWVsHR7UBA7JS218zFH0o
         cQan+POyKWPl+izjBKvVEt3huovqZKCOPdYF03trowCD38kv/e2Tf0t4JudDL1gFzD4g
         lA59iImDNeoXTmUZcWV7pqSJKu0C+FCilTAuT9r5R7xMunLn3bjSdTqBE60GxBz4HVTu
         0WrfzsBm2druHttsLAxKFdx9H3laSJxhAHJN1u/PBmTrO9L0N6G3+K48vq5CkDPUvHTN
         b+sscMCnm9qiHoAx0pYajtPVmwHpkYbmlsGuO59jWPQPcS/8JwOWv7QSqV2H6BH5u7P9
         XI7g==
X-Forwarded-Encrypted: i=1; AL+hErFBM4VZFfZqDTPvzLh6JdFIg7wH9tHGrRwZW1zOj75D5+ljHsHuyYhl5jZDV/5Wdrg/gzTfa1fnTaFrq+sm8Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IXa3dbOHEthyD/GhxowC9BQwcRjTy+7Zut1ZzNoyNnWlN+VJQ
	R669f1AJfHHp18urLwxazcJUH7xXN2TuGeklr3oiyithgpWGReP6Exjv5hxptQuu8IU=
X-Gm-Gg: AZFdTZcqM42Y7jjtM4y6n34g1sls+C0Mayhffuzh7CUDFtrV+pJm7A6PYbqGckyXmxG
	viYEKYb1kpNAbY2B3PcKrTP4Yl8OXcDAuZSF2SLWk9JeTNObshQN21UBcSmW2cmX2o+JIWbsgbO
	PlX+knJhNQr2+3UArIvnjOg3vj+IVSdoAPib+oXtW+eb90Jh1VdGKv1dfJjxaGKfADXkZQvlGFH
	3mBD1g9URea6bnhAxNfU5o+w3Q6JZbgXTItYlgzS25Gs0cM7O+oxmg1LzmSh/BPIUR6mtxz84hO
	W5qUVQA80vN2i75aO29dyzvNEUU3vonxrbSJQBl1QzyRsUe298dfjsGh/CoUPzGyd814dwqcjOY
	Ak9xF04POgUugZBC0NDIFaS6GFJFZ8GgC5vvmLGDOXcm/ClCq2pd59SWkM71sqhM1PIDyaw57ML
	7M2X+4RfRKVOJUGol2FGbu/tPkQimMwMVEPOU1yot1KIZaL4953r/72S7cIAV6N03IM4hKBsvhP
	QeK4PwTAP/mb8LxBtNq4D8D4hhtZdl0Xu8wpKahKnjtTIZEcrCLVzMsagL3cUQJh6F97sN9C4FU
	PP+23yNs3bF4XiPRKoc=
X-Received: by 2002:adf:e014:0:10b0:4a6:b87:d799 with SMTP id ffacd0b85a97d-4abb400bb42mr23914238f8f.17.1795589806244;
        Tue, 24 Nov 2026 22:56:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm29125406f8f.17.2026.11.24.22.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:45 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:19 +0300
Subject: [PATCH v2 4/8] KVM: arm64: nv: Discard nested SError in
 kvm_reset_vcpu()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-4-224689d8a764@pereq.eu>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
In-Reply-To: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
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
 stable@vger.kernel.org
X-Mailer: b4 0.16.0

Vanilla KVM stores a pending SError in ->hcr_el2 but nested KVM stores
it in the NESTED_SERROR_PENDING flag.  Clear the flag for nested
SErrors when we reset the vcpu.

Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: New patch.  I split it up like this to make backporting easier.
---
 arch/arm64/kvm/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index a5d298d5ce61..d80b38b2ce6c 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -209,6 +209,7 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Discard a pending SError */
 	vcpu->arch.hcr_el2 &= ~HCR_EL2_VSE;
+	vcpu_clear_flag(vcpu, NESTED_SERROR_PENDING);
 
 	/*
 	 * Additional reset state handling that PSCI may have imposed on us.

-- 
2.53.0

