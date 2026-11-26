Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698807;
	b=fJjfqFzeluOTiiAJrkhU9scxueq1pPuJlSTofBnYvJkmeMPo8NVWzk/wKeQ4bI+TJbVQ
	 zXSl4C93BB3jWzZfGWglKcjZ7Mb9hd/05ShNodsaJghvYpnavhzZ4MGwTZY7mIbWopA7l
	 GvtXbHSbVRgJQuXspKvp9iSJGekJb4KQO/KbtbDEDqNzXbAUPRvuLNxVv3FsOJpd0oTTN
	 aAsp38nLi5uOQIU6tfLSuFoWCe16d2Ok4aIWHHfzMY2ab6NSbSy7dJBFovXeKGC/XWwp7
	 W5hbtYvm/T/x5m9hsiGFTF09GrO5idDEuHw/RkjQ+RpqpAaJsPs7F20pdRoHh1N8DCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=45M1pglWyzJAfT+SzxQfEEVe/IyIyurkT0fnn9e5xvc=;
	b=tOhB0y62IPp6nk9agb2KZ6RsZ6cWXyll818GVO48wcE/bihMSdB8sfy36hXOqbTfajuc
	 t0sq2Px5+8GswCBAzgWYevy2Ga3U3unwq1lzDDDCrT7T/+1O0axcR5Lh/0N7X/O0zAeKM
	 63aAH8zkHHNFN0TBEojTPeywtP0fgxb4ftyQ3RJlGCZDUNOhS7lNB2LDrPEpWq3joyVKf
	 l7mVHal2Jt0q24eEVeFfdJx1AFbvIm/DK4OSUOsetLlC22kMupYiCvD67GmpW19J3CYgp
	 GabJIAlXEbM+44tnfBhQVy9bPUOZ1C8LO+6QAT7+ZRiq8rVikxtbmZa4UX1q+2EZXVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJyNfUAz;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C0606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 13:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJyNfUAz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491846221ffso6092437f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698805; x=1796303605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45M1pglWyzJAfT+SzxQfEEVe/IyIyurkT0fnn9e5xvc=;
        b=DJyNfUAzWCoUZaHPCGXoNx2PHzBS1sxXZWwwQ8JxZ6e+pdyeJXAUSqYxV1WEDFHtN+
         jEz7LoSzhwdAPUXI5jfFdsbBdtDtKNgnCrPoYN7aqtpdHBV3Pmj+ZgudAXWUZv7yQ+Ki
         woAqTh0b0XYKbwd4d3K6/ZTBkrTjBnHtg1nxjd+LR1xdu1mj15qnVQG3wnzfYaBgt0m7
         NZwtHdwa6UQ+QHINK9GukPP+cJiLc8xz4FdInsyM7fhPzUgbxsjUxH/HmOt0LgTCTFL/
         bDkYHuP0R4Nw/QvBorzDL33vkfZwk4pDLWhlZHGWI5V9yL3Hbehgoj/GFW5mC7tCKSHb
         J48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698805; x=1796303605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45M1pglWyzJAfT+SzxQfEEVe/IyIyurkT0fnn9e5xvc=;
        b=NjhFlAC7DoCUR8Fpv1nGKb3bghs1m5RQZXLGycZnm5B2dVA//rRvuShKlo/PW+RpzO
         tZoUF/VsET+Dv5qO/Gha+/pSVoULoWz3Q8ruOhlys9lavp3JrQNSBQ1de21l7dL3P78S
         I+eZcjTX7/fek8vU/Xb9CI+GorWgqKG8zBcYkskKSB7aTBD2etz0RZwtzGoJBL9AGspT
         Iigaw+10M6BPQwnj+89bs7NXkPnkAqa9LvNotCS5TXxHGNBRQGPFJOSGczEoTRn5yF33
         lQEAaUleu2P9zf1hXg3BDqH1RP3QOgSqa64LVvZHPg5dGNLdW8yZgBoUhK1zlFlr8cLM
         x/pw==
X-Forwarded-Encrypted: i=1; AL+hErGGz92u2mjRPm5gNzkzIP3aBDehc/gjPSxfjKDesiha07xr1FP4WqPqtJosJmV+t5iHfTQSepfm+aV9PTW7HeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+josDqFiIH/QNDPIbgK24LYtBk8qO1550mf35rPZMceCm8EK0O
	BUca2jGHVcTREmFN+L5awtismq4QsmuHh7O8gv4X/8RHlaaoWIdWOjEi
X-Gm-Gg: AZFdTZcwkahbhXaVm6AkMSOqyl18QNwCeBjWq3EFt6V6qTt1gFJx2xILcREwQvjLQDX
	XZZYkQF6eZ1mWN7LPRBxifXx+uw4RK3OnS7qKM+Oy73HTODP9btkjeNbWVWWnPh/kQ4sWknw4W/
	RWzUoAvvugvcRvanMpjjhYA9c0BJP8jXL7ejt5g8z0GOU66dyAc8B7If/el4zkYQlVwm5K62BTo
	vjDTwLlYYXR+tozDuX8LyhoSgpghxj77BX0tafDKX8engRrgv1o5LRyNl/78WQ56o5XGQ3l1mhU
	BPwziakrOc82JZ5ukUKqoZpZy52URcajMVuWPxPNCXXKE7lHFtjU4jlKe9od4+QUGdzBIu6tRLZ
	FkF0pYtV0EitDriIuaVha+a3YbbEz2QI7iWhnrJO9vzWQh4CVFfcfivXiaXrrM8i16qJISmTCe3
	2hUm1Y2MP4dLcDNpLQ2RlvpfJcT+yhKyKp9aw/LfmLdHPHnQqkzCna29xKnECp6o2NTEyr4Dmsm
	7HwW2AKEqYIYO+lLNTOC99fOdk6IhKzjsSIEm4srNRQofus8ZifjFrE1A/TqaoVb/LtLAAEA/Uh
	CCk6xOMua8wUzYptiDqyV0lugiedkLwiZvtFBvV63L3gvAGdAvvrvR803bVDZ6AciWruK0EogZb
	VS+DfPIIqMfrWwXaMm2K57A==
X-Received: by 2002:a05:6000:4812:b0:4a9:1b17:4f34 with SMTP id ffacd0b85a97d-4abb57f7036mr38287533f8f.50.1795698805223;
        Thu, 26 Nov 2026 05:13:25 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm41679091f8f.58.2026.11.26.05.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:13:24 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 1/2] bpf: account for local storage map elements memory
Date: Thu, 26 Nov 2026 13:13:17 +0000
Message-ID: <20261126131318.470837-1-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit 7490b7f1c02e ("bpf, net: bpf_local_storage memory usage")
introduced bpf_local_storage_map_mem_usage() to compute the memory usage
of local storage related maps but left the accounting of the allocated
element aside. For users of these maps, the elements can quickly make up
the majority of the memory usage and make the reported memory usage
quite wrong.

Walk the bucket's list to count the number of elements in the map, note
that concurrent insertions and deletions can make the count imprecise.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 kernel/bpf/bpf_local_storage.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_storage.c
index b12fcec47ffa..6fb95503441e 100644
--- a/kernel/bpf/bpf_local_storage.c
+++ b/kernel/bpf/bpf_local_storage.c
@@ -792,11 +792,19 @@ u32 bpf_local_storage_destroy(struct bpf_local_storage *local_storage)
 u64 bpf_local_storage_map_mem_usage(const struct bpf_map *map)
 {
 	struct bpf_local_storage_map *smap = (struct bpf_local_storage_map *)map;
-	u64 usage = sizeof(*smap);
+	struct bpf_local_storage_elem *selem;
+	u64 nbuckets = 1ULL << smap->bucket_log;
+	u64 nr_elem = 0;
+	u64 i;
+
+	for (i = 0; i < nbuckets; i++) {
+		rcu_read_lock();
+		hlist_for_each_entry_rcu(selem, &smap->buckets[i].list, map_node)
+			nr_elem++;
+		rcu_read_unlock();
+	}

-	/* The dynamically callocated selems are not counted currently. */
-	usage += sizeof(*smap->buckets) * (1ULL << smap->bucket_log);
-	return usage;
+	return sizeof(*smap) + nbuckets * sizeof(*smap->buckets) + nr_elem * smap->elem_size;
 }

 struct bpf_map *
--
2.43.0

