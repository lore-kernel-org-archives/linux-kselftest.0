Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356649;
	b=MIkQT6HDvjV2KPxrUeei52CXWo1iJydcQJgaK3+n4OZy033XesIH+/wxMwOXQXwhpAd/
	 +fbzuo7aguSkpIzeJ1j6GsI9BShmM1D65jnTaZb+bH79z4s/v7B1a6bXR83Aavy+q+XNi
	 clPkp27U83GFMsQWTtYAeZShqmSSqtaJsK+tn1TUEcrUTmkrVn706r71L/tjs7A9xh154
	 pmXP6iO6K777lRVchW+3vxSkj70JVfTgUbQI5ioek39OySb6Muf5MrXEa57/NEVVPNW1s
	 Ulqaa41v0CJ+Swe0I+MDWu0p4vBwQqCzu3AdVt98I9w07NSkduJ0BRvAHitj+QhtF7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8hRjHNT+bDawf2n+fS4w87yYb1rrNIQllzNnUpN3o7M=;
	b=CRFYoWb8JmfCzkyMTUuukB3zOH7Af/9+wSytETLaLj452wboL0jchOenK6F/uGTCLISQ
	 W6lrR+O4RMC0jsBRAZcV5xZ0W8Czld93l16uT/yL9EQobNr/Tt9ag3wQCM6u9oXkj9Xyq
	 SMjqlAQU7CyYwyLWXhSNXbWaEgBexhp4TJak6upb73UAVx2H5t0AL/tkfXSRBC+WgvPT8
	 2UY6hZXAQIjsQS87BDZwKbe7B3j6MOffdbH/5HIVm3WKl5K4mGV3G+Ol3npzjRbAFMyNC
	 GNzOCL7xcnyE1LntME5z66ea+LckVt+XrQBMl/c6Fb/0uuvNRNh9BZYdzKrX1Vbym1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NKjKVt5f;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE1606A331
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDE1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NKjKVt5f
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8490253aeb6so2532275a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356648; x=1794961448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hRjHNT+bDawf2n+fS4w87yYb1rrNIQllzNnUpN3o7M=;
        b=NKjKVt5f9XkfM7CuoIFDdkDQlHdtM0MKBEpsfvLZnwD9mUhdF49nghThwKCbg/tjdK
         hgfZT8pLuZum4ckqFw7SeWG0cAhsoRsXo83NIItg2fmhSWU9fXZgGxQwiwOgZtcyrvHJ
         73giSbswvAqqY7Na+Ukrt6vD3KdnejPS3opbZbg2vaB7dZzSAOQ7xRqyUohhuSOsT9oI
         Cn80aCNPHwY0z/1hteK/M3Po8gexhZdicfOfS3XXdFjNML2utHPdR4Be98oqzhvmZ5g/
         DGkADkkHabW+2AMRdEzsWN9Zsf/TGw5rTbQZljgGIebkGHoGyLULbzVzbfD9fV7Ruydk
         mZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356648; x=1794961448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hRjHNT+bDawf2n+fS4w87yYb1rrNIQllzNnUpN3o7M=;
        b=QyFVywWVkTJiuW+5ORxkFvjUkbLetvG7to8DAi9cSo92Uk7/FkiqASZd2X/OgUQra7
         FnPfR/xGurCx9tL8VaF7WKD2xBk15S+BVXWbduphHKgBOHXBfqW2cNfiHiVHch3AKKin
         ohdc6B303EG+C4Xo62oTg97FRcldGpzsnoTsndUw8YMxhr/l8gVo6wkDz4G1vLdZ181A
         jhUCr7AOI7S7EPvEm0ibVLC+++SS495mr/ve0oYqGCjH6p4ouIeQk7Rqc3pSke3jcUR7
         IblZl3vaYuDrE5IAwLaucynqonDYU7TQms4aLrMVL2KcpHrKIPhuPQJmjNKMT+u7UroI
         0ibA==
X-Forwarded-Encrypted: i=1; AL+hErF8sW1pkqQc/6nWs+0+aB+ZlncTdf8Yl7EWbkLlREQZeOIdifOpu/hvKCltovzsB8x0IPeVbBbI1bK3n6F4K/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3npysDkf6KAoc/hyRzda7CiuCK/kMqOKUjDSEtL5ievMlTGRV
	tv3AlEMajD9+deYCJH0RD2aMKkSam9vdHXH+jbQZSFM83nT2XJoc3j4m3f2+LpPFizXwWlAuoU9
	i6DniegT4BFcgiw==
X-Received: from iohf2-n2.prod.google.com ([2002:a05:6602:a5c2:20b0:9e3:4940:4cc3])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:13cc:b0:567:fd8f:403b with SMTP id 5614622812f47-56b97b17653mr680403b6e.42.1794356648195;
 Tue, 10 Nov 2026 16:24:08 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:39 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-2-dmatlack@google.com>
Subject: [PATCH v4 01/19] liveupdate: Remove the list of steps from
 luo_preserve_file()'s comment
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove the numbered list of steps from the kernel-doc comment of
luo_preserve_file(), along with the sentence that introduces it, which
repeats the first sentence of the previous paragraph.

The list only restates what the code does, and goes stale whenever the
code changes.

Suggested-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..a42b60356d52 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -214,18 +214,6 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  * unpreserved or successfully finished in the next kernel, preventing the file
  * from being prematurely destroyed.
  *
- * This function orchestrates the first phase of preserving a file. It performs
- * the following steps:
- *
- * 1. Validates that the @token is not already in use within the file_set.
- * 2. Ensures the file_set's memory for files serialization is allocated
- *    (allocates if needed).
- * 3. Iterates through registered handlers, calling can_preserve() to find one
- *    compatible with the given @fd.
- * 4. Calls the handler's .preserve() operation, which saves the file's state
- *    and returns an opaque private data handle.
- * 5. Adds the new instance to the file_set's internal list.
- *
  * On success, LUO takes a reference to the 'struct file' and considers it
  * under its management until it is unpreserved or finished.
  *
-- 
2.56.0.542.g3ef89b7020-goog

