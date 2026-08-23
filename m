Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CF532B102
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494688; cv=none; b=JdmhXy9eJUL4BWxhbFt8NZnCmC16E9isO6cZVTjUo5SgxDnObTR37/NAzLAees4GQ/311Dz6jgcpOFc9D+b+SEIBqKgzFNwOIRJWOV2vOGR0VCptKWAMejcfBAchsxpXPMQXdiyMoBueKKdA8red+E2MpXhNmJd/M0HbQNX+yjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494688; c=relaxed/simple;
	bh=5oRKg6K0iG5r/v/hXBuDVgSmeObrV9gsWMCfckR8DaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlV1vr+vIgpgM3osHBWoMGPJlTKc+ytGXyvd4XMhgPcBPZkSsbou5ckR8yo4t/akJK3ntLGGiJG8PKSxDxoeMmiPPQV4aTxPiiw1q2PIQ4DbRuzGn3m4WribvVDLkIkJqzf88stn33yHtIAj4UTeyzqR07cU6tUZbyyAYfWckm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2cc7a345f51so17652015ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 07:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494686; x=1788099486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLPNl7tv4b8gXirdXjyz87bURnmNqmX7AlYBb8DFG4I=;
        b=tZgNETZtWVrqJ16nv4bS2V3xSBUf1+7TwTWYPM5+3plHwgPwpp+9Te9KCNtxmCdIJa
         WrExEAnC8DI9UwpmBJ071ehcyXUu9Obh6NghmujaoUxXuzAwFcPQoqC7OGYQumUjlKLm
         TSVulfk0nPT64rJSP8G4t+Oz4O9YTcWzjV/Ec3vlSplxwgD9vA4vDdFMp2YTcKIbKsW2
         JdmhbZ31LeNlPoXlBYKLkzAsTIrB+eX6L1VwkQAaJrqakLqdjpmSvEYQrh4nZxpPYChd
         /yPCN495KgOoudQH9aYcKj54RpJxbVw15chtKACd+NgxYOA32qB9U7H7i4cTd0cZ54Nd
         /dMw==
X-Forwarded-Encrypted: i=1; AHgh+RrOjZxXS89yP5dmK4CHO4wifjz5Xa2xBV4lTFDCXDEJXl4fBvFyhpw9KFEJL1lPgBCEjTjd+iBcX6Dmvf51Hm8=@vger.kernel.org
X-Gm-Message-State: AFuF++lEaQt9Wz6Ay7gP7MbQ0+hM0wJ1PevMbMBCSsADFmuMaJ7MFT9J
	mLf3Jqj7uY82ouEftRqFAY0Zj7aAUGGX87AARSFqJ174y7AT+wNn8YFj
X-Gm-Gg: AR+sD12o6L5CL+ZeXla7u+A/OuhD+h3dLd/DVaPjWYEnrQCPJvL2t5vsL+FrdQuCc5U
	RtcuofLMqB08UTQsm/vVpSHGbxVMirK7c4HTylK6wp5p43iqto2v/619QafTzi1dbOx7ESuY5M6
	7Bb4AjImgymtWSQSW4ei1iP1dER0/CS+y6j+wnXgB1sVyf8WDhECrkhAw83Qjo6pmCGGGYl2cFN
	vSaxcTSyirQHAijD3CQQsLi8Lu+4i+84fSIOhtcaLg9zkaIhafVfV0MqZT2mYRehBTWxTR+841V
	lQz8lUI+E7F6v5byQtvVOA8nlthUN9h+FcLudnXh0T42VEzFZ8hJAzKNAz0VQVBqTJ6Z/U797wT
	hYfPtYacC019TUKMazHzcDX6XUDyfqeUV6Y6LCp7HPiDrxRMpSCs14B00+bWF7BOmSkd5JKQ3sB
	86YMeKlmyJOaQ2Qirbvs7gRzS3ElM2XtvnNxLDsrXUNr7YRqK4MkPUI8T0oI3FzJDI1vtdpRcKk
	BtXMuw=
X-Received: by 2002:a17:902:cec7:b0:2d6:702e:b1ba with SMTP id d9443c01a7336-2d670b7f140mr195137145ad.3.1787494685686;
        Sun, 23 Aug 2026 07:18:05 -0700 (PDT)
Received: from localhost.localdomain ([180.153.160.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676791d44sm9944575ad.24.2026.08.23.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:18:05 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 4/5] bpf: reject oversized bpf_stream_vprintk output with -E2BIG
Date: Sun, 23 Aug 2026 22:17:27 +0800
Message-ID: <74387ae5024d7e2996095e97211430285095b525.1787492521.git.shijianlin11@foxmail.com>
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

bstr_printf() returns the would-be length excluding the trailing NUL.
When that value is >= MAX_BPRINTF_BUF the message was truncated, but
bpf_stream_push_str() still tried to allocate with the inflated length
and failed with -ENOMEM. The boundary case of exactly MAX_BPRINTF_BUF
could also copy the trailing NUL into the stream element.

Reject such lengths with -E2BIG before charging stream capacity, and
tighten bpf_stream_elem_alloc() to accept only payloads strictly shorter
than the bprintf buffer.

Fixes: 5ab154f1463a ("bpf: Introduce BPF standard streams")
Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>
---
 kernel/bpf/stream.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/stream.c b/kernel/bpf/stream.c
index 09471a605268..7a5c3ac8676b 100644
--- a/kernel/bpf/stream.c
+++ b/kernel/bpf/stream.c
@@ -22,11 +22,11 @@ static struct bpf_stream_elem *bpf_stream_elem_alloc(int len)
 	size_t alloc_size;
 
 	/*
-	 * Length denotes the amount of data to be written as part of stream element,
-	 * thus includes '\0' byte. We're capped by how much bpf_bprintf_buffers can
-	 * accomodate, therefore deny allocations that won't fit into them.
+	 * Length is the payload pushed into the stream, excluding the
+	 * trailing NUL of the bprintf buffer. Reject anything that cannot
+	 * fit without copying that NUL into the stream element.
 	 */
-	if (len < 0 || len > max_len)
+	if (len < 0 || len >= max_len)
 		return NULL;
 
 	alloc_size = offsetof(struct bpf_stream_elem, str[len]);
@@ -245,6 +245,11 @@ __bpf_kfunc int bpf_stream_vprintk(int stream_id, const char *fmt__str, const vo
 		return ret;
 
 	ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
+	/* Truncation: reject before capacity charge (not -ENOMEM). */
+	if (ret >= MAX_BPRINTF_BUF) {
+		bpf_bprintf_cleanup(&data);
+		return -E2BIG;
+	}
 	/* Exclude NULL byte during push. */
 	ret = bpf_stream_push_str(stream, data.buf, ret);
 	bpf_bprintf_cleanup(&data);
-- 
2.43.0

