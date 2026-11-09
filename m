Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187400;
	b=zGgw2DN1iHSfmfoa9wjgtFPBbWqMb3GwgA6ut0TOMeZkWd4B14QD4b4NYGy5wyNaTJSE
	 z5OeKBXVzjIwpEX4gostSli3GHQNo2T+qW7+Ft39Y75PHau1ziDI/ZD5kX1ufkXVPuYKB
	 TNpVhr4z1p6L0zLvO8q82Z+k+H75rkP9I4WETeend7oQNgWKawndFO3p0v6k3MvsNW9Q/
	 HVFlf8Wu80Ort5bjbL0cs/Fo6RieTDEeuyIUy4K2ASj3UjNGcAgNAmL1zeCc8zpc/wMMj
	 Yh19Q8F2lNPHnMmMB8Yi5YfL6NreX6EcZsAE4AwjE22nvA6XO7ZqQ9BZkY0PscmwPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
	b=kmpC5WDIlU8qSE+OOuhH+zwMsUG8APRI+qXK8QDzNuFUlr+p9483NRXK7B/dY7mKmmG9
	 IxawxQK7XF9ugbf+oV8g5dXPsr0Ry6a4Zt83IfeRi8u+mddyGXVdjKFU6vSg9148sFnnP
	 1tTdjWJ9vrhqORY92JRYin4xKd03fKH++EdKWdcWiu6d8EHHhvvoc7q8krW+yGZp4zUiB
	 3paAljrPZDkv3s2Csi4IvL3QjGz8Jo/+Ag4y/WuU4RSTpQqU2CZP5KXhao2XzwCqEMYEn
	 gfT5QDU/E1ULDR9oReGOLDYSTZKp7WcIL05U6TXqHCnNG2Md/AOZXJiR4HVcmlSM4BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbsXd5v;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940AE606FE99
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 01:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 940AE606FE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbsXd5v
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1425205eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 17:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187399; x=1794792199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
        b=ASbsXd5vptVY7r1J5dOkvhmj5G97jhirKhnpXabNrRRYcaXrSmAafoj5HisfZWS1Qk
         9CBegw8w6Bv/GC81m0zRAiAx58/8qxgWWg80BsCzENG+jKRPzli7Vz+0IleO3uIqUKV8
         qb+fNKm3Y2hzaEoiSBSkyDS62VSQ30HTc5Ak79aUKS12YM2NZFU7lFEsKfAQNF/adHR/
         e0ECf64jMpI5tJ1Kp6NLHg3e6YuEXw7kf4aiCIHC94DvHuyt+M8oQ+d/cJF1MWZjaocU
         AtqF8Zwi/vdhw8VC0OWJEHvRjM6QUcaZ2i5q7RFo57tCFaHCvWaSWUyPj/91jr3s0aja
         bJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187399; x=1794792199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
        b=EhHKxZVflVIEpPpe95Gzc1lzofyq6S6BYNE4NVfhm9Dw+JkzsGxNC5QF0qVOi4T6Eg
         l94T1aklZnESTW1ddVumd+uaYbm6iAvWiGjOpwg7QHir+OCBnN/bEaMWIs36PA92//RA
         4LBqj5WDPzw8zEU4FvvdQP0xWAIC5lD+CNmsy1YgjzfXr0ytRZA+dY161PJ8oMmG+Yoz
         w0310JXPoPUoCBcmpWsD5Lva0Hj9DuSK0tNPEHbLJW9LQqONHadCAi+MdOGf9iV3L0I1
         vagmCh4nUEoKQHWfZ4ynMYF1pQ+pmurFj15WCuFYjsQCSZnCKOh4s22/LwscpIGSKuqv
         WbIA==
X-Forwarded-Encrypted: i=1; AL+hErEOKnnoK5ugSrMbQF8Hl+tivDdWpuTGR9QoTo1I7/fbTj97LFlzVGMzEfOJSbcWTCLINAxTsVkXS0UBPs/Op60=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wSxBpODKdJNIALKKfGfbGfTvpA2SXfXGLgej6OzrtOtMGWoBT
	aN3MxyHdyMB7SNHYwTbUN0sw4bpO+Bm/X2iVnWXF0JY716xKhZcJc4xI
X-Gm-Gg: AYBFou1MmOWRqtYfjlQ6pAuDqLg/o6U83qZokCuUKtyEabTl6IyQ4c0VAdw5cAD+yR2
	t5lGcHeYfUh9mw44Ma9KhR8IVMsDYUG+bk+5tp1f5/7voRIH11sEy6QQqVh6CW12KPYCtIRIZuQ
	KAaNZyqe7CUzcLITa10XO2rZhfm5TZ5j0j+kpCERE+22qnAZsbNdVvRd+DKD7oDlgpTGo/gd030
	aZdo5/uaHVQkwV4LapkVNzmbja35j4xFDlzz7emMa0RXqGpCdxXiuXY9HuxEy3+3PwPn74HN/rw
	CSajsXhAOpmS1DCuphx40plOEbDvQukiTx28LIulE4wS3799P7Z5IXwhc6xRklLJoXpVaiWKfOO
	/FX2VF1HS8TuEyqT5P0m1qTiRdHZt+2D0BRs6QlLH3ITqUU7pc8nuIvjmGRgsqeeOs1efNIJ8PR
	Sr/VemoiYFef1OdQyfGuLOMOMQJiUxs4Nxs4qp2J3ItdkrTNCKvxGSRJY3QFtMH6Hn+r2qxqBLd
	TH7mlVM3R4yGi0vu4AiKXIuzkXU3EXtmZZcv3/0n9qAhHVo9QsCx2nFAOY+Vjk/lwlCKQxaET3k
	uf+e0BXKZPWGXt5RPLhXwe8QlxbktYDAJ9tO3eQDVhZUog==
X-Received: by 2002:a05:7022:1701:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b39fec8a94mr3868482c88.14.1794187398555;
        Sun, 08 Nov 2026 17:23:18 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:18 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:53 -0500
Subject: [PATCH v4 4/5] selftests/mm: move waiting for KSM full scans into
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
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-4-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
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
Tested-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 31 ++++++++++++++++++-------------
 tools/testing/selftests/mm/vm_util.h |  1 +
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index caea045fa7d46..8184691211acc 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -992,35 +992,40 @@ int ksm_use_zero_pages(void)
 	return ret == 1 ? 0 : -EIO;
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
 	if (ret < 0)
 		return -errno;
 	if (ret != 1)
 		return -EIO;
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

