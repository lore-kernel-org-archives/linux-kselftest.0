Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669488;
	b=tHxYi1BurU/QPn2qDfDfIyMwLllNzMjADf6Yxh6hCB4EIJs6ext8UZ2I1y8dCOuqdKlc
	 l2QaFKMlND208Jw6cmo7rlAAKh555O+SXgqusIiniwK8bUbcSSdUkQ8Pgg8kgMdazJto1
	 AkYIzYl6GMiJKgfeM+Cx1qsdUJRXa+vwcuc5AGY4SLpioZMoE7W+PFhrzcDp7HeVqozwV
	 gJow063Gwo3vo/SEzUO0O2e6khu/1U/ZlzljCrFullRKs8bupDbX5iyu2kVsoAjVB91+T
	 8Q5iskLvGUddBJppsFiFe7GSlicMx130dGs325cmANgMyZkA+WNdPloUqFBH9VEowZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
	b=HsS/ZZohjXBEDbtH/M2BSj8tAYCWZXdwWV3J0h5iWP4i/0EtjsVk+wxaN/ljTomt4Oz5
	 BrE6lcbcLQnEtI/8O0YOKDWIVah9vJ9Vi5IgWc1L+wXk2iJ/ymyLEwEgBMGCH+1q3okVZ
	 AQ6jrON+M/oFA3/bXVyCeCljkarcwHF9PmPZQf1ssWPjdKCL3MjRCke1+340TrLDaZvlv
	 7HI2canS6CjCCP9v1wUNjItmO/xrRluDTnKDAMQ3bgAnSsTUT4h7+pwxJInyqupuzAq5x
	 sO2ounrNjedOvGbsqUv1McaNHFs9JSvFGJV2au5+wuynQaz3IkVuhEAVXzu5iiX2lPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4TuT61Q;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B79606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B79606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4TuT61Q
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386bd881d39so6154101eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 21:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669487; x=1796274287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=x4TuT61QEHzqtYh0juAuI4XvTMOyWJhGDXnal7jHIqLPCRaKduCYPALjsc7k4AGTDj
         +bBtaKbjdNLKt9pjOrWAE33W1zBx+1Io1nWiG4CR41OPvrMc3O15WtVPgu0kz+rbGH1Y
         IiguUrO2Mzm7UYQOZnsgL1A6PhM4pw4nWZs4O9m+fv7I71r+4P07VCCDUfQsQQl/LQJ9
         M601R4WfPJQmO2x5klfU4R+KNE2NHteRXVtFOi0fsEqK6mJ0II/d4NYC6xPrys1YYJS5
         VaPaMxlcxCfw3M62wFEk18593CSxtbjtSNHXIKSuyT4qWqDe5GVYcQf5C8Tp2JjcXKry
         MTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669487; x=1796274287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=JjEWqWMI4zLiAgYivVw+CBiCUEy1S9VIm8McLuLglwmSSYdOTa/+K/HQjzijXUpkz3
         46+9nvU7XcQxGaFCeqmTTe0qMAhy/Sx5gRmEyaWJvHixgczZUx68MWXSc6zbB5Ly/Kgl
         6HJiRBYPGB/Y99mZ7SSfdoXs5/EMwJdU1FMCZrx93fplzizKv7h6ejrBMso+YqYlqQXT
         WsAoAKBSZezyYgKm07O2bbJ49taCW+uBN2I5Kw/YqVJLB5FIhj/BB6pKy2lxNxVUJkQJ
         n0Yc+Vzaavlrj8j1Wodr3jt7GafvDedlOIHZXFlH7c4vZRLR+/w73ekHPaKKMDcrWkwA
         Ckfg==
X-Forwarded-Encrypted: i=1; AL+hErEIQF+jcvOMtJ6NiUXvxwkhvUt4Mll09tzvMXv3/ZIN1HFGcO7Aveeg/OK+zPDSXVOeX/5n8Z1qVJlqiytqtq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5vzdu3erjqvQCrH0YHl14yT0fXLg3YCtUrEpkN98B7vEcqBMj
	KACAqKh59cQETr7MUkCZ4Y1U2c+B6b1IT1nsxU3WYa6jVSaPlAQF9AC3
X-Gm-Gg: AZFdTZdW1kvv5deUtDWRrROhQlBBgNikc1x/CRFABLpdcAcRVQSJ5aiBHZLLE/A/Tzk
	2FOGKH7q9cPoyCxtBC3hYTlxPYUnBvMp6cPsB6AtwtDDlOuZ0A4cuaNQPvO4YrHL72JJ89kyv5q
	fx6rXGfqiarTF4gTTAisbGcU+zWZfAwWe7E7tq9R7bdkqgCBXzYRLgl18o9KOTngzuv361H18e4
	ijr7f1Zebg3AG1cwza1NZ3fvVeJr6iWff/IHUHT2Tyb8QQSIp4T8+vqiq6KLvkxqKt3tEnT0zIK
	uhRKNH663bM+q0v6j+8R2mko0OWkCPWpRDH5pBotP4qvYTDRYv3EjEN5OvXpbmhgN6uaNmVOd5/
	/pGd9S80NnwsAO5dW3KbPyR9WYjaSeOCCKhGbAvgYZPRFYYl69lTMlULwPLfaFbiZnGDxnaZi+L
	aOjwl8gI0D5vSgd9aTyNcbkOMacxJQR7cJcDis9QjNV1o6MdroYVSHGUVbkIL4N4OYpQiYy9i8u
	+MfKd/86OwTnnMDEcwFFbHziOKmenDZ3da1isPui6vp/txwvvWQnUTFOwbH2GzsOgxjKXa2ZlNF
	SI+Xx3Q4V3QjJ9bu4vjjQdop0dNQer9QtWwp9UzOTA==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr22517783eec.32.1795669487141;
        Wed, 25 Nov 2026 21:04:47 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm17154865eec.17.2026.11.25.21.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:46 -0800 (PST)
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
Subject: [PATCH v2 2/2] KVM: LoongArch: selftests: Free the VM when the PMU test skips
Date: Thu, 26 Nov 2026 10:33:52 +0530
Message-ID: <20261126050352.1957454-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126050352.1957454-1-gokul02k@gmail.com>
References: <20261126050352.1957454-1-gokul02k@gmail.com>
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


