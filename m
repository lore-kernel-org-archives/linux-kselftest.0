Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF42E2EEE
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494668; cv=none; b=odzC1S8ie0Go+DUigT44HQli2H2VWxyP0bQUfP5V90s/C9owoU/SAuOF+DjJt1/h75oz0vFjMHyn4YA9Qdg9UGv/vfSrZJS97MLnlMFILICSuE6jfmi1iRAQaoHJijS7CJi5TuUTjMotXurzPlntIkVFTU1Y8fYJltTabPzRRXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494668; c=relaxed/simple;
	bh=VMT+7O4PRfRA8hkUYOH4H8KA2oOaKuJWcfiM+CybF68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vx/oejV4g/2QFr7345nFMq6eNJVc3l+C2P6IFKAuyP30Qu8To22TSy2WX1lDAJXgH6GxUFDdh1ceBf4G3LfbEkmL8lGBfel4DOjTkP0hSzc9BMC2DPbJ8w+FJ7YESLVyzr3v8D/nMAkguP70Z3x8n+ZlxAwB5BdfKRD0lrE8lvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2d3a0a81329so31980995ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 07:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494665; x=1788099465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDaTtrBueWZK/iU1B8CemJY/aBytAH9QHxpofZQQz3Q=;
        b=JxDam9XqM+Mq7CcS672KSYDEPt+aau5B7Yw6uDaEaTjQhJicE5HtAi67JmEp0StbCj
         9cyliyoJxt2iIkzfFl0fJNkQTq7h2AeUAetIs8aIBDby5cWXtWeQAg+G1woMIZAiNFZ1
         GcVGUX1f2lDxY1Borf8U/OvaGh4e0fa9ZlXifgGWUvFoMYR14R9KsCujtUf6oq87YprG
         T/7Dfzjj0YYf9D7pmW8RpBnBtlT+hNBrIueoSS6ygl4Ldfl/WxX5fwnJCV6TQlMRLdfW
         W9knpIypJqcpr2aAoVcuBwa5smb9/to19bixP9tvwAFikP9H7aqS9dN4CRAQDEVt6DoG
         gvIw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3kj1o9RK5kPhdk8AjlQgRt4SPnlOVK9qlgeD3PYP1v0vqSg6LRlXVkyJMQ8w3VBqrjAu8pncIy8q6H6fUc60=@vger.kernel.org
X-Gm-Message-State: AFuF++ky/DKmwEkjgF1V5SrgO0UxBM4UxqD0koagZExtagsJNEulOuvx
	FFxfs4LhrHHjuCnpuH1vt3MS5dW12R6LLIJcV34YJqc+Ml0edLWJKqhg
X-Gm-Gg: AR+sD12b1E+Sn/eGu1ckgp9IHnkHtvLGuhrYAJgfG6qTlLnbYo/YrUFob9mWZG5ghhN
	zK4O8q+tO7YedXuJISf8oSwTE1Uu7ENWfshsyhFKCSIdGqmBp1PMtEk8YGABuv0s4B9vj0KTcHb
	6sS65cqkdESClWChJnWtQpebXCo9HtMR9h2aM0crWpJZ8/0QMfG07f8bEXw3iflIu+LEiu7yP5Y
	6ld1EIssWarbtJzBjJ2o7MMUvLWRmvnpAfDOUDnTLJi1temARdF1eKydbtW0MAdiluBKa7KGeiU
	vJ7asXQAxZZF1ZRmxkg42h8wtAt5uvc+dIn/EuYHnZrkv4GYiyhh4XW4kSkkp+GarxtipM8TCSt
	YoPymJsDTEoSptb3azbIYlLkCULrvUZ9FrUbY5OGtSnxQUXmyx//leUXKQTnRBgaX7HTJa86Xy2
	fDf/k+IRmz3FiP0JcSNXrbVi8ldetFda4zd/5j7/shpBLat44wo/FBnXDnI5fyS+ViZmc1b1Meg
	NeVvMA=
X-Received: by 2002:a17:902:cf43:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d64ade9363mr383366805ad.3.1787494665150;
        Sun, 23 Aug 2026 07:17:45 -0700 (PDT)
Received: from localhost.localdomain ([180.153.160.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676791d44sm9944575ad.24.2026.08.23.07.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:17:44 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 1/5] bpf: roll back stream capacity when allocation fails
Date: Sun, 23 Aug 2026 22:17:24 +0800
Message-ID: <c0ad7b18c59be6695fcc9e4e1200b2f4d5cbbea2.1787492521.git.shijianlin11@foxmail.com>
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

bpf_stream_push_str() accounts the string length before allocating a
stream element. If the allocation fails, the length remains charged even
though no element is queued and therefore cannot be released by a reader.
Repeated failures can exhaust the stream capacity permanently until the
BPF program is freed.

Refactor bpf_stream_release_capacity() to take a length so the consume
and release sides are symmetric, and use it to roll back the charge when
creating the stream element fails.

Fixes: 5ab154f1463a ("bpf: Introduce BPF standard streams")
Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>
---
 kernel/bpf/stream.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/stream.c b/kernel/bpf/stream.c
index be9ce98e9469..0b157ec4e38e 100644
--- a/kernel/bpf/stream.c
+++ b/kernel/bpf/stream.c
@@ -68,10 +68,8 @@ static int bpf_stream_consume_capacity(struct bpf_stream *stream, int len)
 	return 0;
 }
 
-static void bpf_stream_release_capacity(struct bpf_stream *stream, struct bpf_stream_elem *elem)
+static void bpf_stream_release_capacity(struct bpf_stream *stream, int len)
 {
-	int len = elem->total_len;
-
 	atomic_sub(len, &stream->capacity);
 }
 
@@ -79,7 +77,14 @@ static int bpf_stream_push_str(struct bpf_stream *stream, const char *str, int l
 {
 	int ret = bpf_stream_consume_capacity(stream, len);
 
-	return ret ?: __bpf_stream_push_str(&stream->log, str, len);
+	if (ret)
+		return ret;
+
+	ret = __bpf_stream_push_str(&stream->log, str, len);
+	if (ret)
+		bpf_stream_release_capacity(stream, len);
+
+	return ret;
 }
 
 static struct bpf_stream *bpf_stream_get(enum bpf_stream_id stream_id, struct bpf_prog_aux *aux)
@@ -188,7 +193,7 @@ static int bpf_stream_read(struct bpf_stream *stream, void __user *buf, int len)
 		if (cont)
 			continue;
 		bpf_stream_backlog_pop(stream);
-		bpf_stream_release_capacity(stream, elem);
+		bpf_stream_release_capacity(stream, elem->total_len);
 		bpf_stream_free_elem(elem);
 	}
 
-- 
2.43.0

