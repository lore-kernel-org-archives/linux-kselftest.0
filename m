Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760819;
	b=uJ05fWpVGIa7xvq/B55fBsJkywjWRZ/EXH6UUsJpurPm2EyR58X6uR65Utd8dFZLsVSM
	 R+UXJlB0IPYll6952b1EWuS65NNVoZ7kNqaYQJmuS8bzwkxwl1WR8iyL0OQogS2KREazZ
	 Rw8fvOhpdillgV5rPzXZeXO/zS6uMDnrQFiLemx4bkhbmY2gWiGYIx/5ibzzDOMRC9Pif
	 oNC6TQoOZiukOGfkk8Lii8Um+gthnLcHAewxigydIGyNLuQwPDoy0viixzYtLoVNPGhQw
	 EQswrFDVIq2Gd083CWGOtKcRe2nsWXoWaS9d1Kdp7bdjyn6wLA3MQSROKkHtvsbg9vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760819;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=2/OLu91ddgo04QO+LHs2nvEg3EswC58CWlt6pz1JMpE=;
	b=rFnEAKI1TvgytlumBMjVbKLyqsYkmBmWkX6gxF20XLWZaF0evJWK+whHY/CgL37aC0Ue
	 j7scGdVK9HbQz7IaiDF6dF/I48wS/1d1j4u+/d+fseAzuYlIM/auXEAFhpRLYE2M13wch
	 caUgdm0a7JXIQeGflTX3dFt02S322z1cb7iXCK8NxBvaohfMJ1of15nwOENb6bfeVgfki
	 ic8IZwdb9EkKfCyWegwRHzV0YsCv3j7rHzl+LT2MwQjJv+Bl9MP06yKHe9fH/qVq7BfI+
	 rhcObxqEtCdIk2UthKe/tOkoptro4WunlaBJcj40eerDvkVE3cXgwW3LGoQBRXG7How==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A562606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 02:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A562606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsvwrnupq0+Q+AA--.5489S2;
	Wed, 04 Nov 2026 10:53:31 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH] kunit: free the resource when adding it fails
Date: Wed,  4 Nov 2026 02:53:40 +0000
Message-Id: <20261104025340.1527390-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowACHsvwrnupq0+Q+AA--.5489S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF15GrWkJF4fXr47ZFWkJFb_yoW8Zr4fpr
	93Xa9FkryUWr1xJws3Gw18tFsa9F40yr4YgrWSkwn3Zan5GrnrAFn8ArWUurW5CrW0yF4j
	vry2yF4UCF4DZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnU
	UI43ZEXa7IUYbiStUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQBA2rqY+TkNAAAsd

kunit_alloc_resource() and kunit_alloc_and_get_resource() allocate a
struct kunit_resource before handing it to __kunit_add_resource(). That
helper returns an error without linking the resource into the test's
resource list when the user supplied init callback fails, so nobody owns
the allocation and it is leaked.

Free the resource on that error path in both helpers. The init callback
is expected to unwind its own partial state, so only the resource object
itself needs to be released.

Fixes: ad69172ec930 ("kunit: Rework kunit_resource allocation policy")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 include/kunit/resource.h | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/kunit/resource.h b/include/kunit/resource.h
index c330ed3e751c..bfb86e3d1bfb 100644
--- a/include/kunit/resource.h
+++ b/include/kunit/resource.h
@@ -250,15 +250,17 @@ kunit_alloc_and_get_resource(struct kunit *test,
 	res->should_kfree = true;
 
 	ret = __kunit_add_resource(test, init, free, res, context);
-	if (!ret) {
-		/*
-		 * bump refcount for get; kunit_resource_put() should be called
-		 * when done.
-		 */
-		kunit_get_resource(res);
-		return res;
+	if (ret) {
+		kfree(res);
+		return NULL;
 	}
-	return NULL;
+
+	/*
+	 * bump refcount for get; kunit_resource_put() should be called
+	 * when done.
+	 */
+	kunit_get_resource(res);
+	return res;
 }
 
 /**
@@ -290,10 +292,12 @@ static inline void *kunit_alloc_resource(struct kunit *test,
 		return NULL;
 
 	res->should_kfree = true;
-	if (!__kunit_add_resource(test, init, free, res, context))
-		return res->data;
+	if (__kunit_add_resource(test, init, free, res, context)) {
+		kfree(res);
+		return NULL;
+	}
 
-	return NULL;
+	return res->data;
 }
 
 typedef bool (*kunit_resource_match_t)(struct kunit *test,
-- 
2.34.1

