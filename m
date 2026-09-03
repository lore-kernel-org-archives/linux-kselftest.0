Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E84C77BA
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447960; cv=none; b=WuVsnu84AOG9S5Dbvw8xazS3c9puHgo6/yvGo4T9cHtgIiXL7AC4jhDUiCLTq/16brN+rKTLH6QmnCsma5IqC3uVR73kYoBMP49F/i9tU1Oar/BbnBHvnmE+rEYUqzp7pt2fPJE6pU6PZFLrfU5iwj451HQgCD3++B7Q70NewzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447960; c=relaxed/simple;
	bh=w92MawKkkHyqj+j4V9THNwhrPMydRPMGaLtM9WLIOwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HIyRbcu8NNp1AZrvrfzSHl6zfRn/XXsytUEh9dl7ln+vk5eExJOw3QsZ1PZv6IHo3LDB1AeOVohCgfsHRTFOpfrMWjkDJypnByEBaiJ9SiAvbs7LfVqnddH5v9DGGZBPHGyfqMrqUeVKTkM09by6aC0PmCbOzCyTy3cQReuZ8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mpt/RDc2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mpt/RDc2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso18792095e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788447956; x=1789052756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jJG+BikQhyyhKOerozrYKC8uiImTn5ykntBkDa6aSc=;
        b=Mpt/RDc2EGK7IZHG7V2yXpIlibUlc8G2twPQedcB+p25HDMYpWCYwstgLHM/XsCkRY
         IHgIIQmNO+7Z5rCjyyLpGwA4KC3UtcV0zOyVFAZEK7mncrvIUPm0UpSB80BjE3C05ZuZ
         TGIuWxe0L8GA1lGx/SScaznL+dlGTiXBcu9DR6qUHsXPts0PbP+7cIUhaGaw1XUQQsNR
         8WewNcfpPBrAVGfyYc/JMU7E3hQm46gtmmmDK5GfBxXMBx9mv4Aw6a770FbsOOFnGjhS
         i1eoFYQaQ/yY86+cDIOgGy1+mB5k6rgYE4BdN85kAnVoFocbY/4oP8v7brufw5JEGUsj
         UJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447956; x=1789052756;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jJG+BikQhyyhKOerozrYKC8uiImTn5ykntBkDa6aSc=;
        b=BY3VuZEl+xXzPaXT1rwxEdJggFrH7NSwsFrDjuZUpyJarEVtg3yQr6xmmHcd1YBs/A
         cSDYVQ8x1tdlqXj2hzRWSPxJS7MmcL4QRS3ppMxu5fOlt5q7MI3oFFXOXZ6L2sX6MRMv
         AHbqKCHxLk+j67Zg2bjVoUrc2GINGMmdpnvUzqn8qMgdBIb8lLGVSHlTutwkWytyXcQL
         wqdPSlfDa9Fo+FwFJyBjjSPczkN07tBrd0HxmR2r1h+tThL0PmGBdHOZYqfudnPSh3HS
         StsXRU9TXP+odzkUskevmRgBUhkJerFxRMXN1s8ifs5X6enPtisMXUG7y0b0GKJACs1C
         4vbw==
X-Forwarded-Encrypted: i=1; AKwUvBxogJPnKtY/fWOFPUgEhmIjyDrXt+O87s0zI4HlAQwlIzzDOyPsC5WbKJjC7f4N78cpdAKy/2Jsoj2EpJc29HA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjNDA/xiZwIcUkIfzquj5SxCTooWwimMwcwOg6oIYt3WyDJG5E
	2lIsjvBvY7Bp+Yn+XB4qcaXYsHR5iYfZ46gRvz4LnxF2NaXpUpHngJol
X-Gm-Gg: AYBFou3IdAY1pgNeJUvzKe+gpw2vU/UDjttLgEf5nQMrSuGZamC0QJfyGb1rfYakD0z
	3/Mo5QoYiqrTDHfvu2Bbca6iv6pexYALtKjQJJpzR8+QvBZXH2ETBesRlgkZ3LvJ8sQd7x4w9O5
	nE+0fbU7xGBa3jUUGwVy+46aY8LpAHhvDvLdgWZNPOwV4zwQQCCBBycVv9NC8ODjso7M+hKbn6E
	9gm78e1lmMje5jH0waMQD4whH75OapX0Vq93qe+4WpO9YoeX7FHRH9mVl4nsoqoqKSs0vWT4gdM
	oM07ZMneEMrh9q6AdHMaUBMR9G0xpnPczF17sG8nycP3C5pTJTkDrNoz6Tkdfjugpz5bF2WFG1O
	dMQvyCj0WZmx4JbzF1PufWk8FOL+QUa9cCwzyuB4Pto5Z3uKOCxiSW3/OgXmYbXdWDzB7PrKs9O
	Esl2bgBJRD3qXZ/YyLiJ9DGMpxYjLyB6DtYCCPoJmUJPJ9Ka/djkKK6CRd0A==
X-Received: by 2002:a05:600c:1f84:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-49cf5bc7986mr8421325e9.5.1788447955968;
        Thu, 03 Sep 2026 08:05:55 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm14353038f8f.2.2026.09.03.08.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:05:55 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] selftests/bpf: test_xsk: Fix spelling mistake "conigure" -> "configure"
Date: Thu,  3 Sep 2026 16:03:51 +0100
Message-ID: <20260903150351.12725-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in an assert message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/xsk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/xsk.c b/tools/testing/selftests/bpf/prog_tests/xsk.c
index 6e2f63ee2a6c..772f3dd7ce64 100644
--- a/tools/testing/selftests/bpf/prog_tests/xsk.c
+++ b/tools/testing/selftests/bpf/prog_tests/xsk.c
@@ -75,7 +75,7 @@ static void test_xsk(const struct test_spec *test_to_run, enum test_mode mode)
 	if (!ASSERT_OK_PTR(ifobj_rx, "create ifobj_rx"))
 		goto delete_tx;
 
-	if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "conigure ifobj"))
+	if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "configure ifobj"))
 		goto delete_rx;
 
 	ret = get_hw_ring_size(ifobj_tx->ifname, &ifobj_tx->ring);
-- 
2.55.0

