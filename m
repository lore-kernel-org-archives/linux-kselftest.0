Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070646;
	b=eo5SrbEnX8VoMN38QRMilTivM48tXHBhpdpnQKPPkAhXk4vEnVvLr5Lw+2aVIABP0/8x
	 88yf6KeGIKrDzQ/3U6ZHRJy9b7Q7C77dm6O5SgVhc4k4O//Qcvrob8KEUSJFfWxjW3Q5c
	 9oTAjqdjVatDdFUhG4jCN0rxzkELDUB5vH64sp8TDuQ3q0oqcNzxm+PZ6ryOhyays3uMA
	 qZFZvV0P9OeFtjonCb73C54PTIfq0CbZR7BfG1DBvZ0vLy1yj7G7yjzRXbW3vYflmMVMz
	 +qfHLJRz5EAPCz+7pWcen2FU9uol1DsVP+VbHvZlUmhhjlH3pfPKinJlSRrizAILeuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
	b=vlyGnmiUjgnjA0FUIwENcLVVLX5qsVXKJXwd927Ie4XScq5281yfT7T8uBSbkuu2k/av
	 lUINYbbkpRpIMW+q1R4rjOaV+CQ9+bppv44d9HSVbYf+noBR7O5flo6aRPjFT/Tj7sY4I
	 q8u/N9espPElOJ4TRiMD6/kNqOp1reVEgCiV7BHib0DfMfIMWMpCckAtkkqYUMdIZUIVZ
	 pGbazJNNZKxuRwRwFSswas/W7W9l8k6B2qEVCbhLzTnWeLNx/3Z2pKZgdF2tJ2/q39eUD
	 TBtESFC6L/gkhclQue6H+7EBrqL+DjRjrGkIcPwEqrqKjHKaP3SeILXh/kwd84tcF7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf9aMnGZ;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3E606A333
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 16:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C3E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf9aMnGZ
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so2896796c88.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070646; x=1794675446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
        b=Vf9aMnGZ/fWhaWd+BfyuaAn71YYiA2n74dfBULzE/aGwLjp8yB6/k7O4/jnA/yZPm2
         gV3otOYoSUp02Fm5NHftU919RIR68nN/zT1gaUjUH1/Nz/rQyqdk43ke4eBPM399RFAp
         fxZwlZGyJCe1lWVaGiAAB+Qzoe5/vZDzHxzU/mZ+oU5yDPm/Cye6Q6Yfp/F4qvGUgl5V
         DXZ3agQp2n98TfzXXMw7pY+5kuv3SbZksdQ45/iD5ka6LHUqgulggOAfqRZprjq0FShf
         xcaw1iPnYzE6C8frfdC6R2WsAL96+LJduExq0bGHMQlIheOqfHgVYg20vabyOWJgv2Yy
         YGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070646; x=1794675446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
        b=1gTOShy8VgMTsPqAQpq3/lAHbgv3r1Oz+nnk7Vv3EPi1beh/3m8ACajAciu7j+oB2x
         vlgQaK8AJmpFrOaSDK1Xk/L5i9hvGvNFo5FH+Gxbi0gCkNvCTryZogSB64TQIfbB28vY
         nyIM8q8vbAIG9FtylFuff4Ioe6YiCyC4Ekpc4fOe02OqPtK6EywkViKk2s24PYUKN++W
         yFMAkcW/kRW1q0pUUxPJHcToalbao8vpYoz4vjXUNQu5kATDTEASDysll/iKR44l4ZQc
         YIUuQ4p2bKyad2vkbNSIfB06gav7bDGiPIPgnNr3oZWjHSmYahIJ/QGQ6nl/2ueFfmvE
         DGnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8e1fSpxKHuUzeHp+ZVKrpyJBGLAEN5taINZ6qR885ITAEcIdVzVfp4OXxw4+2Useq9fkk0UbfeD0wKbAkUq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NSqW8Y1WvyFiTbrQId5NaEapAJJR8lXOeOmw7kvegRWLNHBvB
	nr2ynr1lwZHjMnb2ruQoZhLt9AlSPT8GFbZjpdqe0Y2AHitzj//L4zPo
X-Gm-Gg: AYBFou2+u8PzM87hwypYGTMdr1cKiYcQT6BSBCx6BLgowuSHgOYjQMUTfNmzkud338v
	MRfFwQ5Kr+OFUR97W2wPmlXMjz4MGYGXAB7ErtCP9FgLxpGr7lbKGHXaALwfrJ22UAVYm0KFdLG
	0RTI6nWcNGKZQEFRRUC792ap9oxmRSDdTACTHDqhHCCkSgBJPBm9f7QL1co/QwXrmw+hfETnS/5
	3DYd6g/3K8WQuqKnCNneVYSFkfcv9HuHjK5tH7yXZBbYshD2ixbM9WTIBpnjZuyWj5GnL/xhVzY
	EJOgERxpJ272iZYPl8qXD5/0gM3lHXsyagnfKuVMlQWgKtRS9p0jD9HxyYLyaf9wIJva0PY0sjC
	cZiZi3E1Ri3UymFns0n2wJSIDLif0aq/9RkSwpi3enCaNVZ8DV8CEW847DRHm4Dg8zmXxhCNyJJ
	9z8w6H7z91G8jWa27eKNLxvJC0SW+IyRI5zGJoO5u5+/r3OT3OYfR8i4Tlux7Inv+R92NvGOg0J
	Lld9kbFqFNZB9EcLTi8b0qnK2EfAnEtnj1LXXucVoQwQZRL3Y4Aq4HDXoe0Q9LK7iHu6VUG2e6T
	3MtY3EA2tdtCiCNoT9HSqloU
X-Received: by 2002:a05:7022:5f07:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b25d31e658mr6932727c88.10.1794070645481;
        Sat, 07 Nov 2026 08:57:25 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:25 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 07 Nov 2026 11:57:02 -0500
Subject: [PATCH v3 3/4] selftests/mm: move waiting for KSM full scans into
 a helper
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
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-3-16d5ce8b5fd6@gmail.com>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_start() enables ksmd and then polls full_scans until two more full
scans have completed, so that any merging that can happen has happened.

There is no helper to wait for a number of full scans while ksmd is
already running, so a test that needs one has to copy that loop.

Move the loop into ksm_wait_full_scans() and make ksm_start() call it
after enabling ksmd. The count is now read after ksmd starts rather than
before, which can only make ksm_start() wait longer.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/vm_util.c | 31 ++++++++++++++++++-------------
 tools/testing/selftests/mm/vm_util.h |  1 +
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 515031b8283da..1c2bac54696dd 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -984,33 +984,38 @@ int ksm_use_zero_pages(void)
 	return ret == 1 ? 0 : -errno;
 }
 
+int ksm_wait_full_scans(long nr)
+{
+	long start_scans, end_scans;
+
+	start_scans = ksm_get_full_scans();
+	if (start_scans < 0)
+		return start_scans;
+	do {
+		end_scans = ksm_get_full_scans();
+		if (end_scans < 0)
+			return end_scans;
+	} while (end_scans < start_scans + nr);
+
+	return 0;
+}
+
 int ksm_start(void)
 {
 	int ksm_fd;
 	ssize_t ret;
-	long start_scans, end_scans;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
 		return -errno;
 
-	/* Wait for two full scans such that any possible merging happened. */
-	start_scans = ksm_get_full_scans();
-	if (start_scans < 0) {
-		close(ksm_fd);
-		return start_scans;
-	}
 	ret = write(ksm_fd, "1", 1);
 	close(ksm_fd);
 	if (ret != 1)
 		return -errno;
-	do {
-		end_scans = ksm_get_full_scans();
-		if (end_scans < 0)
-			return end_scans;
-	} while (end_scans < start_scans + 2);
 
-	return 0;
+	/* Wait for two full scans such that any possible merging happened. */
+	return ksm_wait_full_scans(2);
 }
 
 int ksm_stop(void)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d4327..7e00030077d2f 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -162,6 +162,7 @@ void *sys_mremap(void *old_address, unsigned long old_size,
 long ksm_get_self_zero_pages(void);
 long ksm_get_self_merging_pages(void);
 long ksm_get_full_scans(void);
+int ksm_wait_full_scans(long nr);
 int ksm_use_zero_pages(void);
 int ksm_start(void);
 int ksm_stop(void);

-- 
2.43.0

