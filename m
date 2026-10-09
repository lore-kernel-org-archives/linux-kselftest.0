Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6690339388
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 01:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510591; cv=none; b=OdLWfZSGdwFhcmFPZFYlUznAGe20lJcJed9BVoVCYO2LGWFUdoktYSw9AVBId29whE47XoMMy7C0mpVmFxXAompAS2vnwTuQcLP5E14Jpg6+V2Fv9XjyPJXmL/fN2uhDpv/al799WjsPwA2wHxfMvLi7Z6FXoYyk37V7p3iGAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510591; c=relaxed/simple;
	bh=nQq+HEMZexwqK4AVqLsP5f2+9FIgFcdP1vKBz/B2peI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b+43x9rJuOW60w56A/ie7aUnXfjR6FFIHXEtAulOTLiiSBDUNjDT09vxwHj+dkVXf4CeQ9R/B7kFxKkfKlY1ufGXfgUvss16XlT7JMrwgPrtizPInddpmpkk+v1NdI8j8PEfRnRfUmy2+HZHuZEVU+4CqJMDvfK2b/iuNWJuT0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clyIYt7v; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clyIYt7v"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3515f9a5d25so1916855eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 18:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510588; x=1792115388; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xt0KEx+KWuct6HZMJ5fLOI4SrpBFDKOZgqwYPJCF3o0=;
        b=clyIYt7vbOf/gEgieWsC4LfbeCN2QLwjwqnME/ttI0NbtnRLiH3wStUrFI3E6on5Ty
         5mQnaQ32QQIOM0zN8KOowB4OqNB3Mwsn0aOl3TBsSlAiKfajX5WWXo8NMBuPX3oWxMDq
         zO7mMCoLax2FrbPO80cqNOOWjcX3BpwCfGoZxpWNVPnH65QnPaebmGaxd9HlfHA+NCh1
         qVtqAZewJIOYpgQPhovo8E59VWRmT4+MQ7vJoHyTPiilVJbtN0zRzAJy9pGFstT9WDjB
         Q7I3hNH0NzmorJctmdJ9Y4lTZJSyGIFxpP8jFXbhfmBDkBBnyhHOrUvqkx5kxIpB8Oj5
         +9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510588; x=1792115388;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xt0KEx+KWuct6HZMJ5fLOI4SrpBFDKOZgqwYPJCF3o0=;
        b=sqsmUQ0n5Nr6h++zlb3K6jGiUS0VDMs8bzpu3OWDKom3v0WBHvox26WMT2XiJz4dqG
         BlYVqDUM8FX+XFYywv8qF0rA4f7eDhLBYitgdM6LOzZgYLkDIr79wP43g/v+F2W/R9Sv
         1bPW/9tCAK79D3UUV04AWEEXQJ1rPZhwZ+QZg7Gqjtj9d4t/t1e7xSy5HG1pIhFtU4i6
         E3M3DC0dbSRVtN+n71GPcBBuu9EmG6dgPvU1bEQfIh++NvDz5U167twkOoDkBVb0s0Sc
         7eZknIQz7nsi24sTuMkpO/rwXZj2C1/WRXrYgsvlVVUmwQ0qVRFTrU41P1qAOiI4k1bs
         6Lcg==
X-Forwarded-Encrypted: i=1; AKwUvByBX7uGNakwYZ1IooP3O3yBsGZA17w7Q/Lx02uqWOg3QKL2YK5KXBNo9jW4iscQUk0PFosuAKSXGNhdSfGoW7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lHGcMCHRqspRopDks+JSNF5jLQtDX5akhTBO+px6r+FyGnJH5N
	qP465xiGXDGMD7z/uXhPuqnbga+HcZHfzRuh3N5M1uzCsQSOUsRlnTw0
X-Gm-Gg: AYBFou26G9jCEmqyp1ntv80J8qENIcddKPRNkXZx5Vvoa/yBTL+EvnXMGJZ23tVxSyh
	GA3bgZtNOX+ppzGK+y4lIyoRCDb3EOmYbpNCN0M4WpzAU2YvBoWQk9ZF2qmfyAl/8j5GKIqYNKD
	zc4fkwlVOnEcsXqb6Dkk0uVf4GaGZNGrpP5rN3/ZxGX/HTlrJfi0RQLX+64JIeWIO58rmuKfiFa
	qZFmx7vXTngV//1wDxKGm8LqUfscv8KuHI67fpPW6DBi8xyR9dHNKHMK+sxHCQBx4122VU7akR8
	a/wNa/8oIPB/P/6otpb7yCr0nADGqCpdFpyNF0eVyeMKMGV9ZH2W3SnFGKFeDTgYoUHUdjHrnnF
	fU2akiofbXZs7Mt4eqPiAIqZJVXYvLxKGSunL4Fqx2cnVTYhcx7qSTcnqbb32phnQW6CAduiRAy
	uXYUJ/1xkMX3jSSJ9ME3/DIsemZ0zZ1YA/V63pXv4wLA71sCGlf4jwnzxIosLbHvFnpUITcP/jJ
	/oA
X-Received: by 2002:a05:7301:221b:b0:342:645a:5cf with SMTP id 5a478bee46e88-3537dde8888mr908135eec.1.1791510587871;
        Thu, 08 Oct 2026 18:49:47 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm2026085eec.25.2026.10.08.18.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:49:47 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:49:42 +0800
Subject: [PATCH bpf-next] selftests/bpf: Accept unnamed dma-bufs in the
 dmabuf_iter default test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com>
X-B4-Tracking: v=1; b=H4sIADVIyGoC/x2NzQrCMBAGX6Xs2YUkaP15FfGQmi+6YNeSTaVQ+
 u5Gj3OYmZUMRWB06VYq+IjJWxv4XUf3Z9QHWFJjCi703rkzG165wqrxMGVOYxzmzFJReFaNIxI
 Hfzz0HsGl055aZyrIsvwfV/pJiqXSbdu+QEPiO30AAAA=
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "T.J. Mercier" <tjmercier@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The dmabuf_collector iterator prints the inode, size, name and exporter
of every dma-buf in the system on separate lines, with an empty name for
the buffers that have none. The default_iter subtest parses that output
and looks for the two buffers it created.

It requires a name for every buffer, and sscanf() finds none on the
empty line of an unnamed one. On a system that has such a buffer, like
one exported by udmabuf without a name, the subtest fails before it gets
to its own buffers.

Take an empty name for a buffer without one.

Fixes: ae5d2c59ecd7 ("selftests/bpf: Add test for dmabuf_iter")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
index fb2cea710db3e..1a5dc1adae735 100644
--- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
@@ -188,8 +188,9 @@ static void subtest_dmabuf_iter_check_default_iter(struct dmabuf_iter *skel)
 			ASSERT_EQ(sscanf(line, "%ld", &bufinfo.size), 1,
 				  "read size");
 		} else if (f % FIELD_COUNT == NAME) {
-			ASSERT_EQ(sscanf(line, "%s", bufinfo.name), 1,
-				  "read name");
+			/* Keep an empty name for a buffer without one */
+			if (sscanf(line, "%s", bufinfo.name) != 1)
+				bufinfo.name[0] = '\0';
 		} else if (f % FIELD_COUNT == EXPORTER) {
 			ASSERT_EQ(sscanf(line, "%31s", bufinfo.exporter), 1,
 				  "read exporter");

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-dmabuf-iter-unnamed-217561e20d84

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

