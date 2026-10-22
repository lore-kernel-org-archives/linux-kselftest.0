Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651611;
	b=Bdy3OViXgCj8jgPLNa0r2O+8iXRe6c1REoYR6DiVuXGPX+1Nff46rDT12gdLoDkLn2Bq
	 HWBGIigxvjMRUYJ9C/kClJndLIfs12gTduscn9+R4mcdEnvNY0M7fe0nnvoay19XZ9IrR
	 2sCcML/JY9ACw9PTRXEN+YtNQ7Uuu1bEEZjvp/xiciaoFdLPhtHuC6cDVIbl2MPza3h7d
	 cVmh2nWQDH0P+Mt8mgW/wwGSF8rnXEFHjnENLkStjU8r10RfxYtFzwsK61AiMVxgt2MGb
	 IzeopFHxzO+m9mFqLO/Nlp+9+wL0mnCnTLGZC9XRrat6SeKwLV0FHMiYrKVftA+zb7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=;
	b=qSK8/ifaqRje3mmZgwZaoEhE3bfea7Yhi6+rjMNmZ84QhppjtYNEuxU1EHga0OXLPSbN
	 hof4VT8E2sYRmKsXH22bH30xfK6SC/NburS+D/TXnymsW44zUYnda2iejclj5R7y7q4Tx
	 WMcN/UM4NhctTQQ7j9xnNhph1MB+Fc241mCeXghU63+LMoxTCeAZBuE8fUXuiaCNH2kQp
	 Nz3QyrsFRDagMSuWufCXcD6xriPl1zKhAUJ7ZVyZWF4SRy2BJIu4+jXdFU6xYko8q7mNi
	 Wm74+do28YQu4HI9sDwbOljCrPZtHk9zkcvZqoXzIE0n/f1DyBsH2L6cCn+ZDyJ/w5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GF7ZGPL6;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F48606A335
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 06:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F48606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GF7ZGPL6
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1067095f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 23:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651606; x=1793256406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=;
        b=GF7ZGPL647B+FNnG04dpET3G8O5xXb61EKo7cJWaxZ39oPa+V/POXl/DjBPqCyvukr
         uxvVa726bZh5CWEE9C7t29Ca44cLmFKZB8DJAH7gHp2zbYn6eGy3iw/+MTdY/Y+c1dLd
         bsFmozeSaCQlewtrAFN3OOFEDHko98J7y/YjiPzAcRPMrS20L8WbdKJ9qmumOOE4DVoc
         l2PknbSPoWVGrlc5N7LF0nwMjR892vdBSDTGyLSerl6iFlzmnvYoF/OysRdU1WZs4YeE
         K33nwxsxDqHVwCzDED4gqyWjfL/dhrrbehq2DtdmXAZPe0x51KBUtwPLlLd3WNi+aPr9
         1/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651606; x=1793256406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=;
        b=bJXMNZ0XY/myiR5KtF+qsrcvF4m7VexMEj6XzK9Tn8cM9ytvEvHdI5zl4mN6O1HMZ4
         xkXaSuhKHgaXRnIrP+MO+FSn6xf6jAt/PYRLh2nfT3cW5P32JJDPqkfjYcRU1XAYpK7c
         JhcwmT4RuuSoG4nnQKhtOsnntQOk1FRwwNiL4vS3oA2KUaOs1ZxTljuGm3Xq+56F/THA
         7CLEAf0wqXJxX0hjClKg25oaQ5FCJwASW7dqrbzrvmYd8Fc/Y+1Njpmyt5vG3eN/eR2g
         pBDp5ArrJo6pWr6zaFCnLk0oYIvhqah1DCUSFSnwBeZezAOAG0B6DOtx4t5UkdEe/ubr
         XwKw==
X-Forwarded-Encrypted: i=1; AKwUvBwx+IviL08wrlM9hDzIPHQW1tvKM2BB3Jg5Hes9kZySY26ys7xJD3kPDdF8L917HtExuO5ZAAzaIughDec61GE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk3tA0tBzu0juqwl07h+VSeSp0BtVnP42ctEN4NvpWQqGG2f9k
	h/DHlj7/tlJSUMKKxfZKdPCCfSFl+okxZasxIqx2bgRLz4Q7EbHXK0cqPQQkKxlF
X-Gm-Gg: AYBFou3ndMuu+xH2R55ziAl2071mjhJ3YdVuy3puDwPBETwEgEJMl/E9G59Zil3+l3i
	5z0gRjRhUbGY0E3i5ilJGZwTn639jBG8qTc9BIrN2sl+kZLvaf8mWHxxfp0OEYhzZ83WNiyLewt
	X4qLUKADJ5R7X0runnLWfIFy0Fr/xUISMAaJk2uvBUJ4FoJJSlkq1uz89aJKcsqYdeezIlFdhrt
	xuBz8WWEgR1g+s5LEjGvPlY2fZUwRjPGA5DQMgzPIM4hGTH7oGKVGtV+dVXaOjX9kVd4mHwx8ak
	wEkPrhTq3vDOiI7eUG5R7fc9kw7PZujfGhXJwvSsOHwNr7fTcpFbn3FRJ6QcCA6MZC13vDUeC1J
	K5g4G4jWvAARuP0Tb0qu6pzBaRErpeLH3RqyUMgTG9wjAY1IRDAgsdha3G6bEZUtJzYGM/+Rnyh
	ayJhOJPx8xEUDYzTs3NKxUE1Qz6ztPECgHS1yvgDFDaXl5xStTD6FMfHm8V52m5UGbmBlgKrLF5
	netyrXvNcV+YyxgpxqG818KfVObZ4BdqYgAFCDs0F1on0Q3WhKJCm6R2TwLY0gjzoyc3GRiSSJC
	bnPV4/7oXT7JpfSFiy1NnFzG4SutFu5mIBcy0bDeAagZx/IO/7ehpkXCK+bacSaa8Fbc1OaO/le
	oEnoV8xowxKRbIiQNwg6Niaiai83krijv7mW+CFezIGmDkZtAyVV7VJbU11oVAtZKsw==
X-Received: by 2002:a05:6000:310c:b0:48d:faf4:54a8 with SMTP id ffacd0b85a97d-48e26493bedmr9081092f8f.11.1792651606193;
        Wed, 21 Oct 2026 23:46:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] KVM: selftests: arm64: Test pending writes to active level IRQs
Date: Thu, 22 Oct 2026 08:46:28 +0200
Message-Id: <20261022064628.4206-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022064628.4206-1-kmehltretter@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a two-vCPU GICv3 test for a level SPI set pending through
GICD_ISPENDR. Re-pend the interrupt while it is active, first from the
handling vCPU and then from the other vCPU. Require a second delivery
after deactivation in both cases.

Also check that the other vCPU observes the initial pending state
before the interrupt is acknowledged.

Without the VGIC fix, the pending state is cleared on deactivation and
the test fails before the second delivery.

Assisted-by: LLM
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 101 +++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 3cb85932ee85c..81f38e523d3c0 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -959,6 +959,106 @@ static void guest_code_timer_spi(struct test_args *args, int cpuid)
 	GUEST_DONE();
 }
 
+#define REPEND_READ	1
+#define REPEND_READ_DONE	2
+#define REPEND_WRITE	3
+
+/*
+ * A level-sensitive SPI that is set pending through GICD_ISPENDR stays
+ * pending for every vCPU until it is acked. If it is set pending again while
+ * it is active, it becomes active and pending and must be taken a second time
+ * once it has been deactivated. The second pending state comes from the vCPU
+ * that handles the interrupt in the first round, and from the other vCPU in
+ * the second.
+ */
+static void guest_code_level_repend(struct test_args *args, int cpuid)
+{
+	int i;
+
+	gic_init(GIC_V3, 2);
+
+	gic_set_eoi_split(1);
+	gic_set_priority_mask(CPU_PRIO_MASK);
+
+	if (cpuid == 0) {
+		u32 intid;
+
+		local_irq_disable();
+
+		gic_irq_set_config(MIN_SPI, false);
+		gic_set_priority(MIN_SPI, IRQ_DEFAULT_PRIO);
+		gic_irq_enable(MIN_SPI);
+
+		for (i = 0; i < 2; i++) {
+			gic_irq_set_pending(MIN_SPI);
+
+			if (i == 1) {
+				/* Not acked yet: the other vCPU sees it pending */
+				WRITE_ONCE(args->shared_data, REPEND_READ);
+				dsb(ishst);
+
+				do {
+					dsb(ishld);
+				} while (READ_ONCE(args->shared_data) != REPEND_READ_DONE);
+			}
+
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+			intid = wait_for_and_activate_irq();
+			GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+			if (i == 0) {
+				gic_irq_set_pending(MIN_SPI);
+			} else {
+				WRITE_ONCE(args->shared_data, REPEND_WRITE);
+				dsb(ishst);
+
+				do {
+					dsb(ishld);
+				} while (READ_ONCE(args->shared_data) == REPEND_WRITE);
+			}
+
+			GUEST_ASSERT(gic_irq_get_active(MIN_SPI));
+			gic_set_eoi(intid);
+			gic_set_dir(intid);
+			isb();
+
+			/* The second pending state must not have been lost */
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+			intid = wait_for_and_activate_irq();
+			GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+			gic_set_eoi(intid);
+			gic_set_dir(intid);
+			isb();
+
+			GUEST_ASSERT(!gic_irq_get_active(MIN_SPI));
+			GUEST_ASSERT(!gic_irq_get_pending(MIN_SPI));
+			GUEST_ASSERT_EQ(gic_get_and_ack_irq(), IAR_SPURIOUS);
+		}
+	} else {
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_READ);
+
+		for (i = 0; i < 64; i++)
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+
+		WRITE_ONCE(args->shared_data, REPEND_READ_DONE);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_WRITE);
+
+		gic_irq_set_pending(MIN_SPI);
+
+		WRITE_ONCE(args->shared_data, 0);
+		dsb(ishst);
+	}
+
+	GUEST_DONE();
+}
+
 static void *test_vcpu_run(void *arg)
 {
 	struct kvm_vcpu *vcpu = arg;
@@ -1073,6 +1173,7 @@ int main(int argc, char **argv)
 		test_vgic_two_cpus(guest_code_asym_dir);
 		test_vgic_two_cpus(guest_code_group_en);
 		test_vgic_two_cpus(guest_code_timer_spi);
+		test_vgic_two_cpus(guest_code_level_repend);
 	} else {
 		test_vgic(nr_irqs, level_sensitive, eoi_split);
 	}
-- 
2.39.5 (Apple Git-154)

