Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51DD361968
	for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 05:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982630; cv=none; b=K2StY/5r/DW0aWoICiACB2mZNFSzyNDuRXchSVPVrz8EWncIHYwhCr8aj/El6tw0rWDIx9+bQygYfDhpWaDPbHVeUw8qxp8vdFKbAa+oT5/E5aVCGRofOpeGjKp4VmP5Ef+tiEdPrpbgM9DaZycOpFBgMSQaMpxoauhwguR8Rk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982630; c=relaxed/simple;
	bh=Q4xDvcP9DIiwYXTXpczLlLyq7Kd7CsRktQVDTGiaDVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QAeoKKOpjIPBLS6eCBsXH3UWLodcLnvQsQ+WdExQH+soGzs4wPnGVSMbZpbtK7uDr18m0SgQZPuPBYpBNwTrCsUIH0R6nSml3feYGikrQLKowOCcboGs3gRNk5Sh9LIC00KZ5+fT5/WYBB18Vk7UF7HYA5+ab3SgBW1Tqwwgalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD6QDr38; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD6QDr38"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso16945485e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 22:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982625; x=1788587425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmU2GuULI4+ubbU7oraX4k5FiAqeW6B2DekgWiWauec=;
        b=HD6QDr38uOdg2inY+Mqbd8HJB2s4sC1jnKT1/cLmDMfe+q8ZWY3RiNc+Pbl4QMf7/4
         jqFK4DCYCL04nFph+fZzOIQ1m7SV2h2j5SUaGYZkHox2n8Ck+WoEsz2TW3SJGWzKXfXn
         NsLrYQkfqF3vPx95ahD6uaYUpcopTflEVaplfa0mkK0sUst0Ncal7OKkyOMRbX1EDWlj
         zJzbDvFRl45PUPCs8JOSJBLWUOZ4vJsowCJVHIBIuES+8JKu87Seu7PmzSLofHxy8SRk
         23+969t79Fln2i+uB2WoRaet05BiKpr8uScQOfIhnGoidi3PFv1OFp5u1POSkBUu+swk
         6TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982625; x=1788587425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmU2GuULI4+ubbU7oraX4k5FiAqeW6B2DekgWiWauec=;
        b=mFdN/T1tGryVKDm4/baHMh7bD/sawaGBRH9QxV1o3RMs+sfCOoLdmPjucd/GiJCxkr
         SIWAoFtXbdhSgfhVtY6tmpueg0H+Yg36DZsRMf/Qc5Uw3O0OqQv18rhgcfDO2XeWqhBw
         67hN5xxocZJoTkQLmgU4o0HqNgYg3vIkkZmqnIgF+aqNbC6JaygvuzkBSaETuRIRMZv2
         BTPCP33Ox/m4UfeW0xYa8O6s+snqFkKVhMh5mybu+SbwumWs49IDk56WUdIA7a1xJnyP
         c1+c7yJgB7zMaDK7SOHJKyCbnkUG4T+33SXEwxr0X82CyvUu4FhKiHBYLc/X+H2JRvbY
         6RjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9xTol43Q7ZAJ+VvZ0Ji6uVnoj0178v/k4xwlk51+40IjNp+7s9Dmb1JQBKWNsO2Y9hwCoXYeXsU47oYKTRW4=@vger.kernel.org
X-Gm-Message-State: AFuF++klBzPpfLhHTfG2DhzCk++7K/bR/DZv0Hj4NflW4B6y3Y3Id1tH
	dEW6Mj0KBeDKh7dd+Zj9ubImNAykdpFGNPdYUfqYwpumRncjcVn7nmJm
X-Gm-Gg: AR+sD13wvHbUWae69Q3fbw7QuEWbIzvPt5KVXgFroZXIwYJ+dY/2AMcfRTyyKk9166W
	i1/6qXoDc1kUkj2qqye/UtrCnfnDrLmqvPpFekthfwh6jJVRMCu5YvPmCEeLz5ZeGQlAvIZ3Nav
	cQw2fr9QHZEM9GCx1iy4mKb5cZzzuXUUBgtUzN6Eoai/IP6SJIu8miQqexgzcLB9LUjBu2PgMsC
	FCvf+m7qzW9eggoV+S3PFg0inzX0utKy0Tv4pgh+O/bxkVPbaeud8bDf26/lVv9Ub/2ulNN9e2x
	sdBoc66N9DuTqsVKCHlePONwtSlP2ojR+ZMY+gzhh0Dpn5nqMBVmwXV1AnMxmdZ82NQrIYfGEgx
	8y5aI+VFqNmrJUZlpU4TZ4ZNeZZyWUh4llA35UljjN77ZHJW1xykEXe5PrV01o8XJ/XRPUbwZz5
	2O2767lBn37u6etCaYanyu2uuxFB7SZArJBgnQyMpuqzk00T8/NbLdsS5Bh0U7sFuoBGLyWFcao
	cQqJHsuw1dgPy62uelxNk6DzhZqwD/9xzeeODj5I6+rBHj7xZJnnabsRATyilw8kQMrMIX988ky
	gJ7ueHfRwgh8wqrzMs0w
X-Received: by 2002:a05:600c:1f8d:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49b91c17c41mr163125035e9.3.1787982624717;
        Fri, 28 Aug 2026 22:50:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm35357485e9.2.2026.08.28.22.50.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 22:50:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] KVM: arm64: selftests: Test empty SMCCC filter range at base 0
Date: Sat, 29 Aug 2026 07:48:56 +0200
Message-Id: <20260829054856.70549-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260829054856.70549-1-kmehltretter@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_invalid_nr_functions() only checks an empty range at
PSCI_0_2_FN64_CPU_ON, which KVM's end < start check happens to catch.
It never exercised base 0, where the inclusive end wraps to U32_MAX
instead.

Add the base 0 case. Without the preceding fix it fails with EEXIST.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/smccc_filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/smccc_filter.c b/tools/testing/selftests/kvm/arm64/smccc_filter.c
index 21e41880261b..a41ed3e016ba 100644
--- a/tools/testing/selftests/kvm/arm64/smccc_filter.c
+++ b/tools/testing/selftests/kvm/arm64/smccc_filter.c
@@ -140,6 +140,10 @@ static void test_invalid_nr_functions(void)
 	TEST_ASSERT(r < 0 && errno == EINVAL,
 		    "Attempt to filter 0 functions should return EINVAL");
 
+	r = __set_smccc_filter(vm, 0, 0, KVM_SMCCC_FILTER_DENY);
+	TEST_ASSERT(r < 0 && errno == EINVAL,
+		    "Attempt to filter 0 functions at base 0 should return EINVAL");
+
 	kvm_vm_free(vm);
 }
 
-- 
2.39.5 (Apple Git-154)

