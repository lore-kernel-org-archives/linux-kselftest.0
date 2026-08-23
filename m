Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1409D2E8B64
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494681; cv=none; b=gzN457lqkvuOJmHId8cKAfeeKmDo/xAEBaAP7xSkqP/BJEKIzsNVqTk2P+1074Pb/fIswWsWbrJlWhuj9RQCdGDhpss1XgBH3KbmT7+Y1crCPl/aBrCdwCMTryZ2AVpoI1JuCNpLBfQ5SC5rxZEx07sIVm2i/KJtdGh274h8ln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494681; c=relaxed/simple;
	bh=THAx6kKy6+ANuW2Ijm0TWq0Gw/XWcFP2cIc+C2dP7TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+lVsKr0wsyIFBSrnGTXuMpmE1Kq+RA7DQhMV599mEQt962mhCy0Ao6hBAxn4O+pIA1ziNloreC67Aw4hnq8ZxyH9auyLz27XTjda4KtmJHlVjPfy12fqJ+toNnmp7bZYWsW9ldXpJUcuqxM8S3brclfbvzPtQg+jLJNHMB/vIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2d323628f8bso602465ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 07:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494679; x=1788099479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/Ql4lEDJqP86btbQpei2w3GW3dnEXXUERLHfA2IhaU=;
        b=oXqxVYkOI8jv7YjCbz7SYSCb3qdhy7h2DxwCbtR/mwteHVZ/ZHUp0HAY5RhNBjH23j
         KlkGNFkDpd7DcY7gFseyHgfDvThQVS+mgOTz+0sZwSQDg9JNtud1WfZqmzIMqjxGgAnK
         gP4YaXNSFNn6g8jDf+qjuOEVteWOw43BkRkD0xOQR4MYFwPYZcw4J4o6tbATYjXXBXcY
         kReJYRqUZcHiiEKijH2HXbt1mQwqjLkxzFg17xzsXw9IIL3s91jVbcgmawc2+VKdjT/j
         4iprQoQCoqrQvw7JB8puzxdT8PX7gVfuVz5hbH2nz+86D3rQgss8j1QPc4EZqiGpNe6J
         1/Gg==
X-Forwarded-Encrypted: i=1; AHgh+RoP+cLYv0PWTkzQ2V3WM69Bo3CCBKDl00wunNNGNXVztMNXzDvOaHL88IC+3/mlECbX5m4Fl7Kx6HwBjwwF0Lg=@vger.kernel.org
X-Gm-Message-State: AFuF++kx5s/VCHnhJ94odttp/gJl75noenleQObceP/ZJ48djQXqazfT
	a5chgFwzr5haUybNS7BWR4qYLbVJRMSDrIRWoGCVuhJmjBG97TNMSMwx
X-Gm-Gg: AR+sD13uC3f9WGW2FIasEh+SugYCcULMmYRmBPpmhwOEJ3klVD5RPiuV0NpLYi9gQ77
	AXTTC3FEA4CigqG7DWJBv4vbjh5X3hLzpkRlk+jFnIEtsanFBrrLgGmGgJ2XanriED2AQwPIknB
	X+xgo/p0AZfI9wn7ZI5iCCn7wkJjzFiH3ivwwz67QSKmOVJ4PWqs9RP+cqgK9vaE8UNmsDLk4Xe
	V0ORr18E8zxsR8c2uI/W3piz/Hif4wC95R8/OOY5zwo6zuTGogKhjSOOuQuB8yiA9egm4mhhF1Y
	/f8wRNU4E/DnrdhZhEwg5EheGYJt9YZqbrFgDKRWQ3NTcYUkSxeiw2hl1OFcxwDG0KvsBi9mjBY
	4uRhdyJEJJ7LhPZm7cUywMImM3pSO+baHfumCrsUh3Mm3PcqYTSfVzxIE0yaAm7yHEE3It7+2wr
	lW1toLiy+vjhQDpvrqaF30lLFAru7OZIVmtepp1lmaIBpjnVJAymRRGrjNNmdDtfhi2d7Cu/g3k
	SgJ3DBQ3H3QynJdiA==
X-Received: by 2002:a17:903:1b2d:b0:2cf:8aa7:7810 with SMTP id d9443c01a7336-2d64d136829mr214712585ad.2.1787494679307;
        Sun, 23 Aug 2026 07:17:59 -0700 (PDT)
Received: from localhost.localdomain ([180.153.160.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676791d44sm9944575ad.24.2026.08.23.07.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:17:58 -0700 (PDT)
From: Jianlin Shi <shijianlin11@foxmail.com>
To: bpf@vger.kernel.org,
	memxor@gmail.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@chromium.org,
	sdf@falco.dk,
	haoluo@google.com,
	jolsa@kernel.org,
	emil@tsalapatis.com,
	pulehui@huawei.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v4 3/5] bpf: return partial progress from bpf_stream_read on fault
Date: Sun, 23 Aug 2026 22:17:26 +0800
Message-ID: <7668c5838c6beafeea719df8d55319e2fe08cfef.1787492521.git.shijianlin11@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787492521.git.shijianlin11@foxmail.com>
References: <cover.1787492521.git.shijianlin11@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_stream_read() pops and frees stream elements after a successful
copy_to_user(). If a later copy_to_user() fails, it currently restores
only the current element's consumed_len and returns -EFAULT, hiding
bytes already delivered to userspace and making the consumed data
unrecoverable on retry.

On a short copy, keep the successfully copied prefix of the current
element and return the number of bytes copied. Return -EFAULT only when
no bytes were copied for the call.

Fixes: 5ab154f1463a ("bpf: Introduce BPF standard streams")
Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>
---
 kernel/bpf/stream.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/stream.c b/kernel/bpf/stream.c
index a36fc9338967..09471a605268 100644
--- a/kernel/bpf/stream.c
+++ b/kernel/bpf/stream.c
@@ -167,6 +167,7 @@ static int bpf_stream_read(struct bpf_stream *stream, void __user *buf, int len)
 
 	while (rem_len) {
 		int pos = len - rem_len;
+		int chunk, n;
 		bool cont;
 
 		node = bpf_stream_backlog_peek(stream);
@@ -180,13 +181,14 @@ static int bpf_stream_read(struct bpf_stream *stream, void __user *buf, int len)
 
 		cons_len = elem->consumed_len;
 		cont = bpf_stream_consume_elem(elem, &rem_len) == false;
-
-		ret = copy_to_user(buf + pos, elem->str + cons_len,
-				   elem->consumed_len - cons_len);
-		/* Restore in case of error. */
-		if (ret) {
-			ret = -EFAULT;
-			elem->consumed_len = cons_len;
+		chunk = elem->consumed_len - cons_len;
+
+		n = copy_to_user(buf + pos, elem->str + cons_len, chunk);
+		if (n) {
+			/* Keep any successfully copied bytes; -EFAULT only if none. */
+			elem->consumed_len -= n;
+			rem_len += n;
+			ret = (len == rem_len) ? -EFAULT : 0;
 			break;
 		}
 
-- 
2.43.0

