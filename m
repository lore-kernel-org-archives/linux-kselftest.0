Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620982;
	b=ZEeB9iO6+jzvSf8E38c0Nb/F+sF8j/j4jqBB/glQVzNzmok4ifqENODOJ/znHFhiEl48
	 MEpPY5XW633O3ozSA4sUANneITPRB7OKUZf/azaTZzt/50Hsxo9xy5JfG9a4Vi7x+IcvA
	 HFCaVFu72jGd51YMNNA3Cr6mvsCnTv1MtCbkGznhYb+bLaGZhxGemjrtDYddYljFh96TW
	 8jukVAnipsrUa9hUypoBpefLQYQ4asR0uUGX5iDc4R1Xji6PPTX5qhEEe69RJJGAe3Ck8
	 OnNhtqArtL4EROG2cBvVIJUKSn7lt23buANpeM7MozdMHoGZ4q6cGkUiEyqZwLZRBnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=kdXtsK5oiGz6RmA/ZpSIqAQiVji6Qb7T5uYbNNT0Kak=;
	b=sPzDZrnAnqP1DDlPiV++dESg1Mk725fOe6zvbwLlvgbDJtflBmEQo8rW4djLJ14v48pW
	 FlLfs+R9OQu3SNx0jeUxrfEtO/l+pKPge7DVOca2f1oEpkozuHJrW1K982DvYEsG4r/sC
	 Hgve843jMf3n6rAO8E2aiDVkAcY5mqyu8gdda6Wg04djWUkjaygV1RbUQPXb13ru2kNPx
	 po4vqoaopXF6lYzsaR6AJBuGJN2rVGBSpNz8hk2wrn/CJvbm3gLtpgANW12gY5LiYIxh2
	 UJh4cybLT9Qu4ZgviOdnkFZbmPtLRch8x55ta07/ZBOxaNwiiL7HxslPlBRKUL2oTcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K2qTsagq;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CB8606A69A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 15:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03CB8606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K2qTsagq
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3467968f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 07:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795620980; x=1796225780; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kdXtsK5oiGz6RmA/ZpSIqAQiVji6Qb7T5uYbNNT0Kak=;
        b=K2qTsagqlqoZkyqUv17dVhMa+/T8HsTgQbL6jA7TB1tsoXQ2u0ynnnjEOjxRodMK9t
         MA1Df4Wm9vd3C/xIiQkG+0KBVZ5RMzjMGLUMxLvcVRbCU9czf3E0tghI6/8rWGU/ESIj
         Igw64GMPQMbg+kFTBLyXncXMeAJ2ccEf2e0u4mJcySSywdR+fv6ZDg8kvOTt8U0pmlSs
         6Q2I6K2PQfm3CyMadKaAj7CQtzLrvhG1JFbnDZ4yUXBz1ckhh/caxa3CF6eU2mByPY78
         0LfPkfGt7DNKz3rIBq14/Gf93JLTJKjeDiw+gxs2QTTEGNZkZRWfkZYKwhnZDUel5TX5
         peDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620980; x=1796225780;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kdXtsK5oiGz6RmA/ZpSIqAQiVji6Qb7T5uYbNNT0Kak=;
        b=aELD1AZ45DDx623AVtSTRLoDm4zZP0lxgXChPn1A6t78xnZUpmnqXgISPE2K/Sbhks
         ZN13EfZZDTxJOKRWyMUtuDOtFR5jYGBFQk3jk6bZ3GJ+FXuZAAvAmSVsvfV+36jTcNB6
         CA7/2yjCpwqricZv5tPK4/AE70DCBwydQuJ0tXm0uYvKXsrYxgASFKUMxIJUABBfo6dw
         i/rhVFgV33RGdvhCAzW3HvVwhS5H9VaaCiaOnqtbXTta2ksqPiuDGp80wKUY08qVkYzJ
         zJWbfjdeuvnrsxkaBQTv0DOAeFVt0fufR2MRcThrfIeFxTlC39CYKuQKhw5RQyH8u3pw
         FEDA==
X-Forwarded-Encrypted: i=1; AL+hErGNyStVCfZhbbvBqYPAiEulvjIhE+0Jigkqz/EEMk4BG5rJo3XCFFaTOWaIFCESor0UoyN3lUk5U7kl3aO2RoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N7nun383PZtxaG6aBt4VP3q3D/hce660lypfz0Y7kaXjMHMuF
	nF1ckXRwzksHHT0m2xFILEWWnZ4PpxkHx90NTlZX+m//Lv/rkgAoQ+TSHRfxwiDyzD0=
X-Gm-Gg: AZFdTZc8MV1hPNnHcZMxm/Wxpx3PmusfbL9G4/1vyqnIfNDtCm6TGYeX6p4VVkq/FV3
	jpw7gsjGxcxgn5CcYTkeWIeGuq7biGQy3Ooz1gqujNvTzwJIL2nazfmk5ImCaOKtP07EABJ9rzZ
	xr+g7Uj8Xm7y6oR0mJLwaEAcGWwSQZmdmxLQcT/AgXFalWESe43T7qrQC+85VIXrXwd/rQu2FRB
	LHqLiYKgGEozkpbkVbfVcs9scsUlsL3t9/CVVHXCVn5hFGNuN2pwgnR4tb5ZEQVbSRvfWYtjV0v
	6lldKUeFYbkV43EqUJL2PhdJLxp8lVbQz8iBsHns4/N70CL1/XxEFmoZkjVxdITykCLfjxrZ80Y
	gW++tsuVEWdabFoaBGda96aKkPhXG/trkED/6U+sQTbL4qOWzL9KFXtYAynpyVPJsEN4xIcGXB8
	YqEdafNrlRLX7gpLaUNf5h3SH3dMH+vceFpv6TmFG2COvZH9g2Qk0JnhBa1AhYqjLRHu6jBe1c0
	m/t2pmM2DclBNMUZSFHTYx1KZZF7h+1Wyt0a7uvc0Uvw+vmxOY4ZXNCE0Cyi6geqPqoY4Fyp6eD
	QhphdwSujrmYWsZWfNibcqgijjBAgVroO8nv7LjDmFdQ0Bg0Cx+3SA==
X-Received: by 2002:a5d:5849:0:b0:4a4:4229:c3a2 with SMTP id ffacd0b85a97d-4abaf7401bbmr39868108f8f.11.1795620980437;
        Wed, 25 Nov 2026 07:36:20 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b8e564e39asm5382635f8f.57.2026.11.25.07.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:36:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 25 Nov 2026 15:36:03 +0000
Subject: [PATCH] KVM: arm64: selftests: Pin vpmu_counter_access to one CPU
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
Message-Id: <20261125-james-kvm-pin-pmu-test-v1-1-c3ce989233fb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGIAB2sC/yXMTQ6CMBBA4auQWTNJW1B+rmJcIIwykJamU4gJ4
 e4UXX6L93YQCkwCbbZDoI2FF5eg8wz6sXMfQh6SwShz19rccOosCc6bRc8OvV0xkkSsjCqaoqm
 VKktIsQ/05u9v/Hj+Letroj5eNziOExjFhCt6AAAA
X-Change-ID: 20261125-james-kvm-pin-pmu-test-720393980044
To: Leo Yan <leo.yan@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
 Colton Lewis <coltonlewis@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

The vpmu_counter_access test reads the maximum PMCR_EL0.N from one VM
and then creates new VMs for each number of counters up to that limit.
If the test migrates between CPU types the limit may not be valid for
the new VM which causes:

  ==== Test Assertion Failure ====
    arm64/vpmu_counter_access.c:483: !ret
    pid=9165 tid=9165 errno=22 - Invalid argument
  ...
    KVM_SET_DEVICE_ATTR failed, rc: -1 errno: 22 (Invalid argument)

For example on a Radxa Orion O6 with 20 counters on the big cores and 6
on the little cores, this happens on most runs.

Fix it by pinning the test to the CPU that it starts on before any VMs
are created.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Assisted by Claude Opus 5.5.
---
 tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 22223395969e..e7eac736260e 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -626,6 +626,9 @@ int main(void)
 {
 	u64 i, pmcr_n;
 
+	/* get_pmcr_n_limit() can be different across CPUs, so pin */
+	pin_self_to_any_cpu();
+
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
 	TEST_REQUIRE(kvm_supports_vgic_v3());
 	TEST_REQUIRE(kvm_supports_nr_counters_attr());

---
base-commit: 5715eba4f80a7655d85581c6c951b71d2abbd725
change-id: 20261125-james-kvm-pin-pmu-test-720393980044

Best regards,
--  
James Clark <james.clark@linaro.org>

