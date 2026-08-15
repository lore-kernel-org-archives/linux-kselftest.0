Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7BC3ACA7F;
	Sat, 15 Aug 2026 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782059; cv=none; b=MlflKjYNu8a3v9TEvQpywveRKnSjiakT6y15/zZEjBxgiQRjjUQEAE033f6jgBbzRCin5O6BCWHvksXeQGxzgxxns6aY5XfLJx7NCcjdtPQWuMxuuQU1ld8xwIQE3T0R7NsqNyw5w5vb16Wcaw4z3k/Dj7XolBzQ1bJwfkbmjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782059; c=relaxed/simple;
	bh=+fFWWSqLyu3PjQzehABQv02Lc+EqAjSd5SGZ0DROjfg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=NFjQtUx8E+LWcMz+6IhPEF9+xk6Qxnm3iStfoWXPAvySZTRggV52NmumkUA2DG99zNW2W5uQO4oXNkhp1VicUlLewP8xosJmYTNAWnXpJexbObyf1KBUsSXuVg8Jgn4iFIkdEWCcmFJxXzWDITCiVKkHBoY4XTouhOj+Anc2Ifk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=ig55K4N2; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="ig55K4N2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1786782049;
	bh=69NCRqUGMyTGIEaRQMsQ7kuM06BspArxunj4qsVVe9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ig55K4N2XSeOQFKAWtgNNm1bOHjG/oWyL/Ihv9Oy5nzYtM88nwJ/rFiFSGbP9TRpq
	 TwAWM1HRd0mNRJh49zGSxaIAejtdejuc6UBzyGpkB3MBIeoJEl2GJgZh6B8j6FSw2T
	 eflw3c3IZ1VAfz7A1b3sB6GFv1ReVIg5qPw0hP6Q=
Received: from localhost.localdomain ([180.153.160.8])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 4D51223E; Sat, 15 Aug 2026 16:19:21 +0800
X-QQ-mid: xmsmtpt1786781965tp6230rqd
Message-ID: <tencent_B9A612466A5F8D64DA61B448344B570F5905@qq.com>
X-QQ-XMAILINFO: No7DFzN00JnR54N0psLWHIn2W26T010DFW5PLNA97pQzo/kUFJ8LJfxRiHgYCI
	 BLMMNHgzswmtN3T36ICB93AswWCJYgKrSoLqvLvDAc8W0NUMa7UY7CfLS08oO+DSyatna6XCUWea
	 ezy17V3qlFcZfyMxs2E2covb62zWaoJM7FkCs9YTtZPs9zNcHaac6EkI/bd2UTmfLxM1yWdMmVj5
	 nYRMumgqF5s1etziOi4cs0DlSop8zUw1nROrb+eVatjBXtaVyLNi0vpRUSePeKuEu+dWehHQzGNK
	 Uvqu9+1vc5vqY0JjX3vzkFgY9cQP2oSpsTO1KVPdb5moySlC6WtwrNGdsDtLkTVzloFn/F1ISKX9
	 XH/EDueu5XGEcbByaz4M9qQIwNgOkQPt5jvbOoQFEWomE/FpewgcDVf6Rs1r/Rn+hML/X2ycqKpG
	 RhXgb3CeZ2X4Pmjr2pRGpNeqQv1bkSf5uZK91U+ZjcCf5+nfKkUCcduJtJCRJKH3beOcd+l0K826
	 AL4dfvKlM6ByL8LsaRZP2sJyt2O0AoC+K3zI5RqWmRECOlqbYrCqn/vtzqotV2wLa3aczy9qSCuY
	 ZswMQN8muf/QXxb0Bs1szsrhHfHWkF6tXpIbK7BjSp0GWjqNBj1+TQeBSdzB8WJxUmKSpb4BYmrJ
	 ZGaDBWPDtDVjyF2jmkIRqk/9YLhhSSmwovVUWXMME1XaiHKyc9SwRFKTKndoSvzT0epMwP+6kBzM
	 gTnHMEjBlAUwXM8YcXLU2iliF4QzQ0XSEJGlks4mHkGptgMY40BTB0fsFAXJGjYtRjMf7JvoK+Yf
	 CgciT+cV6UOBgjTZLKsojaOf4nZB6LLNVwQQnr8DI8FEp9saluJT4bPCbqnZ6zlRRoRMQ/1KT/EQ
	 jC3jRgnoU8zgLvD5JOGq6LZG2+Sgi3QO/vTTCM0uhTK097TypE8N+QTYob1OC7XulNmxrxG2XzJB
	 aePfe14iHyqn5CBXdvHxYGpQVj/e/buoKca6D0ygl5IRz+gNVdNlLuQkuGRALNjdBIXHAcQwheWW
	 E7Vr3kedeRs0zI+Qe9UarysN4lZttyQzSmS8qiJemrVdjqyD6NjHqGsuUivw6dScrJkuaa4A==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Jianlin Shi <shijianlin11@foxmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	memxor@gmail.com,
	pulehui@huawei.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 2/5] bpf: fix stream capacity leak in staging path
Date: Sat, 15 Aug 2026 16:19:17 +0800
X-OQ-MSGID: <20260815081920.609936-3-shijianlin11@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815081920.609936-1-shijianlin11@foxmail.com>
References: <tencent_C919BB32458A4DAD645A68F441345B971E05@qq.com>
 <20260815081920.609936-1-shijianlin11@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_stream_stage_printk() increments ss->len before pushing the
formatted string to the staging log. If element allocation fails,
ss->len remains inflated and bpf_stream_stage_commit() permanently
charges the stream capacity for data that was never queued.

Only account the string length after a successful push, and use
vscnprintf() so the staged length is the truncated payload without
the trailing NUL.

Fixes: 5ab154f1463a ("bpf: Introduce BPF standard streams")
Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>
---
 kernel/bpf/stream.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/stream.c b/kernel/bpf/stream.c
index 0b157ec4e38e..ef5a7b06ffcb 100644
--- a/kernel/bpf/stream.c
+++ b/kernel/bpf/stream.c
@@ -316,17 +316,19 @@ int bpf_stream_stage_printk(struct bpf_stream_stage *ss, const char *fmt, ...)
 {
 	struct bpf_bprintf_buffers *buf;
 	va_list args;
-	int ret;
+	int len, ret;
 
 	if (bpf_try_get_buffers(&buf))
 		return -EBUSY;
 
 	va_start(args, fmt);
-	ret = vsnprintf(buf->buf, ARRAY_SIZE(buf->buf), fmt, args);
+	/* Cap to the written length, excluding the trailing NUL. */
+	len = vscnprintf(buf->buf, ARRAY_SIZE(buf->buf), fmt, args);
 	va_end(args);
-	ss->len += ret;
 	/* Exclude NULL byte during push. */
-	ret = __bpf_stream_push_str(&ss->log, buf->buf, ret);
+	ret = __bpf_stream_push_str(&ss->log, buf->buf, len);
+	if (!ret)
+		ss->len += len;
 	bpf_put_buffers();
 	return ret;
 }
-- 
2.43.0

