Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6285D242D7B
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494675; cv=none; b=VwaNHWnXlE3bvPWsNr20WM/lGGoTgr3aTjc1DAblgzupcc/yqJc/w5+Nfyd3+NgCqGT6B1cW6FoI2qBHpoEy4bzl2ztcrj5nIk9fuKJqXBLPehKJjtuFyIXrEWrSL55c3Xwy7hkXpZIDknmuynj8dGgEIVhjLf0lWncV+74zhRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494675; c=relaxed/simple;
	bh=TqMZ4MjNxmrd1cDxUtXOC6oUrOQ9f6GDMWyFj9PY888=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euMaG+hn+y5v2yEpGWvORq6NZRQMRHoc1n0XnQhCDP3Ewqszckp6+IGWAdXu8DjtFL2LDyuht4LTiexFVKylep3bkibgSzigJOlddKFw8wvAnQeDCzkZlryl2bT1UJQjrBm+MnCrf4DD1oAmggMw5v4vbfgyjwWZSAEuYZC0Zuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2d3a0a81329so31981565ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 07:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494672; x=1788099472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgScuoQtFaIIIFVlTJbHUDFalROzqYBQ3imuXJJ7d/U=;
        b=dqvKaGKd5E/Ebjkaxy2bdy7RPIz/jgHQ2PGmdtSzUOAF/QrF5WNefr418I71AH3I0T
         6aghhC/gNhsy55YgHe1bgp4JuEvwqwSVJBwT8fIy5dbluNNCcdHpIUUcTqSGObH1EpkU
         BWtExk3GqqisqWe3ScSg8ciEhqSimpOy3cqvolw53vXbbWR2+qGAz7WiDnUCDiCfxbRW
         2NvjcXDzA8OFSJ/uj5+Z17Hmy82haD8/yQmDEYbVk3cRiEiWhs2hfSWUEdIpKQNiDj5j
         tFrqO4BzMEn6dZIaVMl5qrHskEPBnwlYDikzE1oHjsbCDEAAKbYWEpqufy+AQA7EKzXe
         73xA==
X-Forwarded-Encrypted: i=1; AHgh+RoDZb/BjOKJW5Rbc+jdnzyn4wy19uHDJf78fsd5JgtbmgnGm9hPHSQc2FqNlE7y3q5yjaro6V7CwRChV63I6TU=@vger.kernel.org
X-Gm-Message-State: AFuF++kfh5TRgHmmG+3s1ooYF8eqzb97AusArWVu6NNBKoJ1x9h0gSm1
	JZwFtjNKxmfk95syykPgO9eUb0bHTNp6g3XGLbWWzQ9MDyZqmx876JC5
X-Gm-Gg: AR+sD100z50+/KbCYDjpZZCoa5IQGRS0P6rH3XVMhsrHg3lodEkVG0Qp3L64ZrXl/Az
	YiOWgnAbRuJX1CNbL3oFkx6GDxEESUlH60SQO4uygorY0V66g51Xjr5YsB4C4VVGuZtSxY6GzDF
	iHIypCsz3IRD8uUm7pWcS2ueZtZgDrWx4bqtYrFTydvw3jBKgmK0s2BYFAZt1rtYsXMNSAArisR
	uDkwsjc9F6jynCqumQ61BIuBQPJJOcB+aK0vjGkcQOD8W9MGJVYfvvpeEz3kfQ9hwPp8m2XV29w
	xQztbK7oUXza61/FeY62r6OixvNvS8ggJRDaFE4+95GMC5BqrCCP4/4ax1Z9VLEZyiHZY30O5S1
	cCZ2dwbeww89AcWM+f8q5GTSiPQpbBZt0WcgArkLkGO5K/Nh5a5kHTwPxCgrzo7LQIeYyhB+Cg+
	Gg40Cf3LLGAZwousZ8B+9xUMPqtptIQHh64xLYgmy6HFb6StrH2XsD7HAdXt2kl0LJWUcgJptfp
	5q6BhvgoiTownOgLg==
X-Received: by 2002:a17:902:da82:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d64b17b564mr336152235ad.13.1787494671665;
        Sun, 23 Aug 2026 07:17:51 -0700 (PDT)
Received: from localhost.localdomain ([180.153.160.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676791d44sm9944575ad.24.2026.08.23.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:17:51 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 2/5] bpf: fix stream capacity leak in staging path
Date: Sun, 23 Aug 2026 22:17:25 +0800
Message-ID: <46898fb1ae482b2f8b1da459922b187378dfdc1d.1787492521.git.shijianlin11@foxmail.com>
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
 kernel/bpf/stream.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/stream.c b/kernel/bpf/stream.c
index 0b157ec4e38e..a36fc9338967 100644
--- a/kernel/bpf/stream.c
+++ b/kernel/bpf/stream.c
@@ -316,17 +316,18 @@ int bpf_stream_stage_printk(struct bpf_stream_stage *ss, const char *fmt, ...)
 {
 	struct bpf_bprintf_buffers *buf;
 	va_list args;
-	int ret;
+	int len, ret;
 
 	if (bpf_try_get_buffers(&buf))
 		return -EBUSY;
 
 	va_start(args, fmt);
-	ret = vsnprintf(buf->buf, ARRAY_SIZE(buf->buf), fmt, args);
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

