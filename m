Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A947559CBC
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883510; cv=none; b=CMmlWUa2/OUKwm0GNFwfbNl4Z+QeM4V/Et5JraBYh+npc7aNKFSHMkaezXP7XvFUd1XKxai4TGp+jVHB3+oSzEF2czPKVczXYXAGypVvSc7eOJyIn4HjV4s1xZ2zATms0CGv4J2XIfRuGdq/cq6gnw7WicqXdiuQow5QmW4H17k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883510; c=relaxed/simple;
	bh=sK1b5nDQtrjVKFr+o/6GwxhEgYwKp92RT5diVPkBA+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htXWt/sVmHfPLgELhSC5abBWbiPLTcVkDWByNaBRB5QyQOVACvVzLOZNC9pizxpNv5COMRuuULItFzy1cAM3XqDMRyeX2HjDIUIHTfcCOymgA7lXzkktixWQVv8t0gk0hhH6MJru0Da/Y3BwiWFUu8n5HdTFpBoPBhycvN9kRVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfKObwWj; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfKObwWj"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4acso71881a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883507; x=1789488307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSdpcNES+qMXGVTc/+WrAnmCz5JB/CaNe97EdcfztrE=;
        b=ZfKObwWjNK7L05K1IvN9ICzOvstr1NZlsrbwloYMwlijiL/KhwcaIn8KXaD08mxM5M
         p4BocJTIUF+LtbE4jvCDeA0pLStRxVf9nAKzYbKg7LRzeSylufcSUXRi5AjrLu2YgV1B
         iZV9DoDUI1Qu/DJHf4nyG5SPoqMzFi7gO4mdr3jF+DcNEMLUhjFG7qRvxztAngXy0AKj
         uDI7YDXbVVb3UwFZHwKdCaOAAXGLKqYcZS70YG8twwIk/HaZU9gJMoiutRp8E7e1kyMa
         eh+M+sIpHd0CAhbXoJrzcWdLZkY6HiNB2syr77wTymo05XcGSb75S6JotjPKhhZCRR5H
         0Zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883507; x=1789488307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSdpcNES+qMXGVTc/+WrAnmCz5JB/CaNe97EdcfztrE=;
        b=rVg/7LaFVDBU1J3xk57n/LiqO6ew1LgY2mmW8x6UZc2NMXyM1gOOTuMg2iuR3KPTvH
         SmTyPbDvuD0aX+TKswimozNf7fl5SF1HM75TIl8FWMfoM3mGANVJ5WXOPn0t+ifqW4tW
         1xZ/rZcGSbi49uOkGEWqOlBZR1Iwa8jg0ZGhnV1WXN0xv8MdWIQBFhpMkTuMUOyjLeDN
         vfGfZGEgezAuiP8Rhf1bKPm7VJ+6nh+ZE6bjylpYmJuLWNz80YRnapZ/c85ug69G2B4V
         KIkjqhkWS8k6Ao6If220ai+C0iwyWw4Nxi71h1g3JyHcPNtG3Fmy2AecqWrIs5UugDF4
         zlFg==
X-Forwarded-Encrypted: i=1; AKwUvByeyHr/03a957JAiMxVUBnyfxvK6b4hXryk3zw1WjQuz30W4BD6oDwHucl1FfDler10kzoWkAms6WEl7CfVe1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++njpxG6qW4pFDmVhIclfT7qRj5TuoyZhle2vgg0GyfinqRPh0ww
	OLJqkoRl2Tpmshbp39TgK4NdrMn+XBEVMXyxPXJ0cl9G9P8otV1elc4N
X-Gm-Gg: AYBFou2bSB+NUOr0A1QIJbJPUhb6tz0PYNRIynpM60gmD9MFWSVi8SGbWBBePTwpVxE
	bbp5VTtcIT/I/49Zq4QLcGzUvMWPjbqF+PSpqfw0ijk2xlZhpkBh5bEsjabZ8jGtP9pjS7ksF2h
	3NKurYMit5//wCZfjWBnDs4kRdbX0x5QEY5mpajZsPfHM6quhuHmEj4xBbPbwvHwZAy7ymEkeOw
	o5jK2+3EkdEL431OH1HgaFlCe24m7oIkm8gKhMugI/zjQJCMkbvZPbmLw1BksM3SET4GPEF/NuY
	fdy8i9MTgSyODj41ZsVP8SJAyuFYE5EpFt4NHuKcCzfUmbXrESfI77GMBUKPxwaotKGjfNQF8VS
	DadFSG7SMJaNCN1t8gEzun/PkC+1avGLg/+cJJQUBAGSgGj0wFgpV9hzvC369IObBzARwfE7EUe
	MQYockLPXk57T3Ab+qK7zKRP7YTYWBZ08oTs42pjvAmHaPIKiRUQd/0Jpsp9hkzyzdUcrhNkhEa
	mA3M+wICtyw
X-Received: by 2002:a05:6a20:2d22:b0:3d0:f57d:c87a with SMTP id adf61e73a8af0-3dabab860f3mr994786637.0.1788883506463;
        Tue, 08 Sep 2026 09:05:06 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:3ef4:ec38:7826:6c9b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm14204525eec.3.2026.09.08.09.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:05:06 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	shuah@kernel.org
Cc: hpa@zytor.com,
	binbin.wu@linux.intel.com,
	kai.huang@intel.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v1 2/2] KVM: selftests: Add CR8 reserved-bit checks to set_sregs_test
Date: Tue,  8 Sep 2026 23:04:26 +0700
Message-ID: <20260908160426.6547-3-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908160426.6547-1-tharitt97@gmail.com>
References: <20260908160426.6547-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend set_sregs_test to cover CR8. Verify that the architecturally
allowed bits [3:0] can be set and read back, that every reserved bit
[63:4] is rejected by KVM_SET_SREGS, and that a successful set is
observable via KVM_GET_SREGS.

Without the accompanying fix to kvm_is_valid_sregs(), setting a reserved
CR8 bit is silently accepted and the read-back value diverges from the
value written, so this test fails on an unpatched kernel and passes once
the fix is applied.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/x86/set_sregs_test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/set_sregs_test.c b/tools/testing/selftests/kvm/x86/set_sregs_test.c
index 603226ffe437..4e7c35179438 100644
--- a/tools/testing/selftests/kvm/x86/set_sregs_test.c
+++ b/tools/testing/selftests/kvm/x86/set_sregs_test.c
@@ -135,6 +135,18 @@ static void test_cr_bits(struct kvm_vcpu *vcpu, u64 cr4)
 	/* NW without CD is illegal, as is PG without PE. */
 	TEST_INVALID_SREG_BIT(vcpu, cr0, sregs, X86_CR0_NW);
 	TEST_INVALID_SREG_BIT(vcpu, cr0, sregs, X86_CR0_PG);
+
+	/* CR8 bits 3:0 are writable; bits 63:4 are reserved. */
+	vcpu_sregs_get(vcpu, &sregs);
+	sregs.cr8 = 0xf;
+	rc = _vcpu_sregs_set(vcpu, &sregs);
+	TEST_ASSERT(!rc, "Failed to set valid CR8 value 0xf");
+
+	vcpu_sregs_get(vcpu, &sregs);
+	TEST_ASSERT_EQ(sregs.cr8, 0xf);
+
+	for (i = 4; i < 64; i++)
+		TEST_INVALID_SREG_BIT(vcpu, cr8, sregs, BIT_ULL(i));
 }
 
 static void test_efer_bits(struct kvm_vcpu *vcpu, u64 efer)
-- 
2.53.0

