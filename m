Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428460;
	b=h/dJ4t7uLrZ067fI8+KG8HZpdQ2cdm5H5IjnAUaA8+yzDvpVN3wC/yhGnnLX1Vv6prl0
	 vLP90ivoQLC9dDC71680hcz+jkmXAaqBCfghE7Ar7hfdkVzE7aC/mcp2n4MbRsQHWQ6Ga
	 HJssjXATaWLt+WKnBQS8HZX76qRQW6Q3DkI2gWwE+UbxXTPwWBk5BObAozktgd+rQfXHV
	 WF2mYCbgkouH5uNvRdVW3Pfvm3Ya+Kmwg9MYpGZjSCvXZExr6/eD0Uu8nG0p6K1osSd+M
	 Iis11aXSia7/6Qis7uahgejO6rvVMzrEf4FzD5gDo7y47618MYibTblGFTNuVxpLSKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
	b=W8XP8LxUxuh/u2DylNjOu4bp8x3Kjc62chtv6Q+Yk6hlrzvUoxr/pDMjkn4W2TdWbDCu
	 FKQrAP7Y5w/7kUuZJNVB0Fg5ujbynkNBvo8sLoBG9YbI4B0HPr0warShfbMizRY9hfBTh
	 p8dEDvRwV2zdXqNioUqCSls5dmLuAGD5W2RzMUH2HofqdeAmdUHOsbv1lk5wj4sRW9toW
	 Y9LNhNbVfu0uBTSLkygpOoPpSoOv+Ph8nO2PeNsnzSdRHZByxdC58fEzOULpGuoZiHUXf
	 eg4lo66qIBEXlIrD2+sSXUFgEnBZGsu/afEjozkoZMV7+4MZZnUAG7nrQy9zdi8SS8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3nz1+yd;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420E606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3420E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3nz1+yd
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385d8a00598so4215258eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 02:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428459; x=1796033259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=z3nz1+ydzssLuojMa86t0bCUsF5pTBTdBhCoMsI06c4k7BgL++xywHGia6rmUBwduG
         jGsRyq+4uVjVFQxWTtHpRWAkCcLD5bMkzBb05FZUhbxXRxhVu/hg/dlaR402sqnrFxY6
         uYFdsdTfSjMCLFlM6gMtIFcdyUPMuT8ohBP94dkkF0EaeMjwLcARuKAtmbIPcb313wt3
         J0P/ORHRu6QQpmEkiUNLHol24tRbddAwa8TiwqsD+0mmmhV6qMOYb26FPjEbRCkk0yj8
         9S0FSR7PLTdkGWkNy8mPtcl8Fr8tnlRxGNQ5iGHrUV2oS79vWB3neZfMPiYMFsiLUkcV
         yvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428459; x=1796033259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=aKlw9hEnxGf4gvs2Hr+qJqDEPDQd9++t/6xANhPYt7L9ZXMj0kQgWHjIrxdmhn7WS+
         DCVCO9rIGhgJTjc5YqCURAZ2VeVpiuB13Um1Z1hgW3uhu/x3htbW+TIn/rJNionCoE7T
         tqvNrCCVT5w1emPvMYcIwS7ibDodaytm9vii1BvsMWHPXz6SyjRup25TeItsLHD0ITnY
         Ji0hSVSdjbGAx5HJfohvLr6zLwh0t0RZI3/kaiYGQQqEu/ePuEJb4iKerHp8QOGQfr55
         GduUGbu2uPYZaoEHvv3nnf/GRvqsSXWoMv5IxZqHKzE45EiwuNOZ+tcDpo+E1mtoC95b
         aWsw==
X-Forwarded-Encrypted: i=1; AL+hErEoL9oF2R2woySDc0eU1NjfySgUI/FWrwyZfjiqVvQvZqkSxFmmarQj5K7MjSA4FIMAArFvXYAtc2YgExdflyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cAg1Vnp4LQr6C4AvFrt6ok9zyZlY/iEkwe3RB/A7b/HD5AxG+
	J5l9no5jqm68yCctGwUPqSi/HPR2niNmFT4DXY/S8GT6euyy6LymguPV
X-Gm-Gg: AZFdTZdtMv1vkZtufUq9oEjdcwb18mZ14NarU7DPWkLlGsA7M9YiLLrWbU7gI2xFw1R
	/ItiWV8ltkR6/v5w7najU+Pm4RGmHULfR8HBy/E6cI8+igiSRIgcybC9V3c+OEDVYFlBqiXFiOq
	5dh7i/5KeZUP5xb4EVTlCEk6HhCwp5wJosu2KKPHaDJDjDeI9Z9UM4bC/kLfgKtLDkJAfd1rfCm
	S9U+ZiDCVKGMwa5fgBziASY9ziriCCl4ej9ch91dOlgLKNiwgsknEx1qx3h0Xh2Dv0OnDwfFLOu
	AH+4cuAlGdVoi9fKzIR+aA4sz/chf0F6awewIP0wzAGFDzUeN5QjVQKY9PkGZzrr4FVtDKf5Bxd
	z0Lv0TFm4NGTR7v1iWjHzdZ571+dDuQ6u95JJWBHfplb7QPWyrDMNqE5uELnMjBfAKB+JomFknH
	bvC93krjnjw0lH9e6by83IqJE6KExcLK3bqpYmjvKxbO2stObqjt1Im4QZ5cYLZq1hQqG0ECv5g
	6qLSQYjKtBV8NXS8NdYY1JoPZjrcBuEiWxtuwYquWBraLGYaSELrJkah2id/mFXTqoS/Y13EEHA
	HnO9w4ZDCoO5AdU8G13u2P4h1WjssSM6vrosNwP+Zg==
X-Received: by 2002:a05:693c:8843:b0:386:b429:fe0 with SMTP id 5a478bee46e88-386b429175cmr1773472eec.16.1795428459292;
        Mon, 23 Nov 2026 02:07:39 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm30929402eec.8.2026.11.23.02.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:38 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: LoongArch: selftests: Free the VM when the PMU test skips
Date: Mon, 23 Nov 2026 15:37:01 +0530
Message-ID: <20261123100701.1679376-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123100701.1679376-1-gokul02k@gmail.com>
References: <20261123100701.1679376-1-gokul02k@gmail.com>
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

main() creates the VM before asking whether it has the PMU feature, and
when it does not, returns KSFT_SKIP directly. That skips the done: label
through which every other exit frees the VM. Set ret and jump there
instead.

Fixes: 11c840192768 ("KVM: LoongArch: selftests: Add basic PMU event counting test")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/loongarch/pmu_test.c b/tools/testing/selftests/kvm/loongarch/pmu_test.c
index ec3fefb9ea97..c9dd3cf5de06 100644
--- a/tools/testing/selftests/kvm/loongarch/pmu_test.c
+++ b/tools/testing/selftests/kvm/loongarch/pmu_test.c
@@ -176,7 +176,8 @@ int main(int argc, char *argv[])
 		pr_info("PMU is enabled in VM\n");
 	} else {
 		print_skip("PMU not enabled by VM config\n");
-		return KSFT_SKIP;
+		ret = KSFT_SKIP;
+		goto done;
 	}
 
 	while (1) {
-- 
2.54.0


