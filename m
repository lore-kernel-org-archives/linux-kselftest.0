Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D66839CCFF
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469650; cv=none; b=PLfvhgxHFbRuRUpvnLzf7RHkRd5zm3rUCn2nhmeqIJBxBPBQXOi7vf2izm2+JbhCBmSjpT+6YDMPFmLXUm6dga4sOW1pObXxaFWa4GssEAKgMWUVvduPLaljsKvSsLjylui/ypFw/xpxqsauXJ0LEXjv31LnV94tmEOnU6sPVSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469650; c=relaxed/simple;
	bh=iQFJx8zGQZdJF+vd6dzT3I1sdYulHPoS0UNY5Sok/V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuwlHXjHLz8W7izHOqZ3dlAcxy6oo0a9u9W6/fO4apDqQ1w0GbZkWbb6Y0kzo/Y93Nyha9nGm54A3Ov64wV0IWDrWRFoaBh32B9t0sjVCeJ3rsTlIWdSBJwpczcGj5ZZrTq3XVaTJY3AIgXXNa+EHYrdZkDjwuonvBoabFsoI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUqDIQzP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUqDIQzP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a166199820so5151595e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469648; x=1792074448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ypc1R6277opyYpazj7Dj+X/DOrlDGXaNMJ06BesIwA4=;
        b=KUqDIQzPxVleyAMF38WpRyQsaVn6ZNVs5mGjBDRFtDhBoLTkSXgxsRMCEsICmxlb/M
         Jn70QQmKPVGZ3jt1Ra91zCWh5Ct3UXVHYHMyJNsHI2bRt0LCsP1vPlgOhzK62yWW06/O
         6O29L9KOHm4r5CBe+XNBXEV44j20x8z3dKYjiFO5R5mGB83+OHuYr2Fs2VJAUhqm8/xu
         /dj/Xm80Q7kZHELryu1SOQnSWbcK6I0VsKfVZDl93PhE//gNe50NV0e50ol3Q/jpegFF
         UtQDxZS4LEMErE+fL+XCQ4IQFBQi0mCEIkTsoKxF6R0siJGX2wZEAjGbyEuiyc8QR5k1
         TZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469648; x=1792074448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ypc1R6277opyYpazj7Dj+X/DOrlDGXaNMJ06BesIwA4=;
        b=WtwhuHyP3vki59RVhydrGTOG7pEhq/UcnMV77mAr0QIf6gqDd0sHTd+XE/fjesxWyL
         okC+HpvSrvRTRA8IhCZbbt8AhhnUL56kYNkwHuhLkaeqSC7GmkqtInXdKxKs8yt4rYhF
         ql4O3zRGSZdbh8dma4Sbp3hOY0qNkhlT85a8LD7CEv5Piu0D0UpH6KfWF+1qj3csYoHT
         jPZNpc1KzuGFI4B8tDUmEbQSwFCKRQ9Ck/lX0CfziuJCxiebT+/ImmCgiWTdXUKKgOu0
         sKe5yczCARMOsyp5nnFuqfcKj+Jxctc9ilDSiHrm9iswJHJfJ48h1nKPxPPt+2eEl/Bq
         11QA==
X-Forwarded-Encrypted: i=1; AKwUvBzGoULE3kv4xA1k94BOFWk7dksytomRioANeDq3GWaqyUEILjtaqaBDytHjIpchPRzXmufTS0x4KfeSsV98NFw=@vger.kernel.org
X-Gm-Message-State: AFuF++nvFdGDhAFdy2DsXHfgkSNcDDaMUSi2Y872zUUDIjqdx2tNz2w7
	gebbCn1Mild8TdU5Jmx1wG8C5yS3MqVeEqfFgBlUb2if6q7F1vLZaTlT33i0kmAD
X-Gm-Gg: AYBFou0Yq9V9Ns2fryFj1CszcfyymFr15dMZ1TQjIyWLucYLCB0tgAvr+IatJ3a0EGf
	5qQlIe6OesXD470h7rAPPCzWX5tOqstQPldZUcm/gKO7w2AHWD8m1hjlyvowfPO3RY/vWQo8xn2
	tjNe9XUT+G1Ss7OVosagdgbWlbMAHQb2LlLV0uRICTBotCbfU0DuumMv/v/ePpxeBBQgu6RusU3
	gE+BgBd6Gw64DGxRgl+EHKpkS8wQdYwaMlIpIDHMWWhKSjzvzW+EocmilpAV9ctIxcf21lF3W9L
	fRSeEsa6ty6k522vGcewk2zZJOtaUYVlTP3UhJ2/Qyr03q/Wq5C2TFvbrSTYpAIutpHfIY1Urak
	OozS59rHr9BZZFVWKyGwvUU8C5zKZ3uHnEJUFxaRrdihYTtkWPgNuFc4NMzfTLy47nm8sRULzFy
	AmzV5Zk1d9yr5ow9a3nyiWoNqYvRWpGVPJKIpxgtMwVh96G/eThP5ACjifNVx+q34IYW+/pyheZ
	9uR33ZiGSudo5mx+lx8qZc=
X-Received: by 2002:a05:600c:6343:b0:49c:ff66:7d88 with SMTP id 5b1f17b1804b1-4a1852f61f4mr38293055e9.7.1791469647504;
        Thu, 08 Oct 2026 07:27:27 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d123b5sm11266950f8f.24.2026.10.08.07.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:26 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/27] selftests/landlock: Fix regex_escape() error handling in matches_log_fs_extra()
Date: Thu,  8 Oct 2026 16:25:47 +0200
Message-ID: <20261008142604.39107-20-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a more conventional error handling interface in regex_escape():
Return a ssize_t, which is either the number of bytes in the output,
or return -1 and set errno.

Before this change, the (log_match_cursor < 0) check in the call site
was never true because log_match_cursor is a pointer.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h  | 20 ++++++++++++--------
 tools/testing/selftests/landlock/fs_test.c | 12 +++++++-----
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index e1aa0ec02c96..91842f618a3a 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -264,11 +264,11 @@ static void __maybe_unused set_unix_address(struct service_fixture *const srv,
  * Escapes characters that have special meaning in POSIX Basic Regular
  * Expressions: $ * . [ \ ] ^
  *
- * Returns a pointer to the NUL terminator in @dst (cursor-style API for
- * chaining), or (char *)-ENOMEM if the buffer is too small.
+ * Returns the length of the escaped string (excluding the NUL terminator), or
+ * -1 with errno set to ENOMEM if the buffer is too small.
  */
-static __maybe_unused char *regex_escape(const char *const src, char *dst,
-					 size_t dst_size)
+static __maybe_unused ssize_t regex_escape(const char *const src, char *dst,
+					   size_t dst_size)
 {
 	char *d = dst;
 
@@ -282,21 +282,25 @@ static __maybe_unused char *regex_escape(const char *const src, char *dst,
 		case ']':
 		case '^':
 			if (d >= dst + dst_size - 2)
-				return (char *)-ENOMEM;
+				goto err_nomem;
 
 			*d++ = '\\';
 			*d++ = *s;
 			break;
 		default:
 			if (d >= dst + dst_size - 1)
-				return (char *)-ENOMEM;
+				goto err_nomem;
 
 			*d++ = *s;
 		}
 	}
 	if (d >= dst + dst_size - 1)
-		return (char *)-ENOMEM;
+		goto err_nomem;
 
 	*d = '\0';
-	return d;
+	return d - dst;
+
+err_nomem:
+	errno = ENOMEM;
+	return -1;
 }
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index b1ce0f810e10..9abc2adef79d 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -7454,6 +7454,7 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
 	char log_match[log_match_remaining];
 	char *log_match_cursor = log_match;
 	size_t chunk_len;
+	ssize_t escaped_len;
 
 	chunk_len = snprintf(log_match_cursor, log_match_remaining,
 			     REGEX_LANDLOCK_PREFIX " blockers=%s path=\"",
@@ -7471,13 +7472,14 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
 
 	log_match_remaining -= chunk_len;
 	log_match_cursor += chunk_len;
-	log_match_cursor = regex_escape(absolute_path, log_match_cursor,
-					log_match_remaining);
+	escaped_len = regex_escape(absolute_path, log_match_cursor,
+				   log_match_remaining);
 	free(absolute_path);
-	if (log_match_cursor < 0)
-		return (long long)log_match_cursor;
+	if (escaped_len < 0)
+		return -errno;
 
-	log_match_remaining -= log_match_cursor - log_match;
+	log_match_remaining -= escaped_len;
+	log_match_cursor += escaped_len;
 	chunk_len = snprintf(log_match_cursor, log_match_remaining,
 			     "\" dev=\"[^\"]\\+\" ino=[0-9]\\+%s$",
 			     extra ?: "");
-- 
2.56.0

