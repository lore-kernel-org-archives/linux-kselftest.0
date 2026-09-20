Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB443DEC3
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789910650; cv=none; b=bH25sj8XLZhtJtJpLvsULB6/UyXOdHXWnj90BUjWYrbsN68zpjPMKnvpHgKJANkuaKlUJXoIx40m8k15ywaJSjcMQz3IbIvoKfayGCNlTaUR8zL6xZSmSu9XfSPBPD6lt0NNFbj0d4cHTgrMZK6RRasu0WMEpwrY690JLYWTut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789910650; c=relaxed/simple;
	bh=vN3GvPXhDGTPAyw8RqSAV5H+01VWk0+oT9MkbAuDN1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFWKJieSBXTn4XWS+7BpESvED+lYDbhg8LCCcutQcQ8NBL3sQtI6F1ZQqWS81X/VYc3KUol0r2Gbr9bLPCN31J8kYeu8n8DW0tWAOhZA5tQDqdifA5powAozlHOtoG4s5Pz3d8ImAXTufUyLCAz5S5lio7mqrHkyGVGVyIklE4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY4xCnnw; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY4xCnnw"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db22383fe8so13414155ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 06:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789910645; x=1790515445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpXb80c2/A/RkMSYNkLi4WaEDGLQJKU+a9vHUD3ajSE=;
        b=FY4xCnnwH8QrURp3IFAD775fNLmM6ER47q/k5iYYjXh24+HSH1TnJCAyNb53N1qoQt
         cLABgFtb2DZlLr4DEX0miDjPyKQ/GpvxymTJIGbCbJK2HWvDxSEIAFzQfnJlJHoSY9OJ
         Jch7mrVyQyUmS6J3f5SjhYpzX/6kL6GDxDM/k4b3UELrtka7ponsw6T3zWfjBl5fOgTL
         1Y5861F/vSluyl9qztUCneBH38f0UTbS+p5xS/zE9q74qEyYHG68bVYVatuuPM0z8sUG
         q3FgAHa/Q/NSLnjuD/k39PGaD02V0yoj4tWVS60l7zNCHz49gmX+lr9PlqcPhnmOFLLB
         2pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789910645; x=1790515445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpXb80c2/A/RkMSYNkLi4WaEDGLQJKU+a9vHUD3ajSE=;
        b=Q64HYsW4xIsg4ORaW6BbDxUyfPEYr5S+BkcdqYTJ7XPZZvs7yiSbcRumscdyXYxCBh
         PlQGuHUMuzvOn6YRJC+IpzmJKZa9c9CsxPW81vC1OFVAtAIFdFBvf6UNFTtXpzD3Q54F
         NhOIV9+JnyUFJ/AddrrceuP5qWMiocfd1i//7PYlVCdtvmWZkQHN847tk6lqUAXe1Yhr
         qNqV6cSiPKTxvRX1wQCHkNrTEaqdoqTrgpBwYxII6QB6Iscs1OGM9u3vzK3OYAqvbmQy
         QDHzLabHmAE8dkXb9OwdSzz+hQYZ6uCx2mz6GxWjpLcbAZ+R5nLBrkVKz3jQ4yP/lorL
         KwJA==
X-Forwarded-Encrypted: i=1; AKwUvBzH5Q4tiOlRVaW6mLH1IVO//LSiVCRGanPRN9N+HD35cefFKcb0yRLkCrcFJX+YuUpdwhKCPuqdBBLk0VbWjPY=@vger.kernel.org
X-Gm-Message-State: AFuF++m0OS0t/TodYeZ2Y6MEk1t/Zfk/vxIjIk7czPEpfoSar8LmzbST
	PiQwa5wktJUPcp8fRcmogyL+rvslOQl7yfghuQsZBoGSSZtlSnFSyTFQ
X-Gm-Gg: AYBFou3rTmXhDKYJEnrMGo/rzQO8zdcuV/I+vsOiRg4LhjEL3VnFgCn1X2R/3tONIBs
	SBjdaVk8KaR5+Xa6Ogx1PWuOFfDkLmHrMIfd2XAEUQ7F2K5oFYH3yQEz9ISgYQuow0Isuycht+S
	ULcqcSkIvgjVgNZTkrongbLY7gFfdHzrEgGRTto8SxmeLZj7pZpayNrFzcHwOBIaSHxSld7O0lw
	+vlhlKhuvarGuAOMlOIkOtf5KXF5zjd0q9x/Ig//VVnBRKxbULN3H4eVSbf1gh8BY2N3aYMsSID
	KbWM7AqmGk8oI8QOePJSadPzXUzTR9DBdlJvIC7xw11pFVP2Dsx1/a5mGzEXlXKVBIJT+JP4YQL
	Xyns+t62/xzxIMi8heQZLGoSimQvjqLAH4bdQB1SnHKIvVSFnoNQsa2Pd70HObIzE1CXFXdIZyq
	q2T+pcUR8E3isOyhwweiBkrBsyutEHLbCkEYl/ZsITqe1qxCg9AQJ8exw9A0xr2cBSF4aUGW9yQ
	XpD1eMR+A4FIcFy/MTmMzOBKb38kvx+wtsku0JC/8U=
X-Received: by 2002:a17:903:b84:b0:2dd:c053:82fa with SMTP id d9443c01a7336-2ddc053843cmr65687345ad.49.1789910644813;
        Sun, 20 Sep 2026 06:24:04 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df44393990sm4857795ad.20.2026.09.20.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:24:04 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
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
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+ac0a8c41de69121d@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH bpf v2 RESEND 2/2] selftests: net: test cross-device XDP dev-bound attachment
Date: Sun, 20 Sep 2026 21:23:05 +0800
Message-ID: <20260920132303.4109240-4-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920132303.4109240-3-bestswngs@gmail.com>
References: <20260920132303.4109240-3-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a regression test which loads dev-bound-only XDP programs on both ends
of a veth pair. Verify that attaching one program to the other device is
rejected with the expected extack.

The second program keeps a bound-only registration for the target device,
recreating the NULL-offdev collision fixed by the previous patch.

Link: https://lore.kernel.org/bpf/20260917161335.1020405-2-bestswngs@gmail.com/
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
Resend:
- Start a new thread after the previous v2 was threaded under v1; no patch
  changes.

Changes in v2:
- New patch.

 tools/testing/selftests/net/bpf_offload.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/net/bpf_offload.py b/tools/testing/selftests/net/bpf_offload.py
index c856d266c..017910b4d 100755
--- a/tools/testing/selftests/net/bpf_offload.py
+++ b/tools/testing/selftests/net/bpf_offload.py
@@ -995,6 +995,24 @@ try:
     rm("/sys/fs/bpf/devbound")
     sim.wait_for_flush()
 
+    start_test("Test dev-bound program on a different device...")
+    cmd("ip link add bpfveth0 type veth peer name bpfveth1")
+    try:
+        bpftool_prog_load("sample_ret0.bpf.o", "/sys/fs/bpf/devbound0",
+                          dev_bind="bpfveth0")
+        bpftool_prog_load("sample_ret0.bpf.o", "/sys/fs/bpf/devbound1",
+                          dev_bind="bpfveth1")
+        ret, _, err = ip("link set dev bpfveth1 xdpdrv " +
+                         bpf_pinned("/sys/fs/bpf/devbound0"), fail=False,
+                         include_stderr=True)
+        fail(ret == 0, "dev-bound program attached to a different device")
+        check_extack(err, "Program bound to different device.", args)
+    finally:
+        cmd("ip link del bpfveth0", fail=False)
+        rm("/sys/fs/bpf/devbound0")
+        rm("/sys/fs/bpf/devbound1")
+    bpftool_prog_list_wait(expected=0)
+
     start_test("Test XDP load failure...")
     sim.dfs["dev/bpf_bind_verifier_accept"] = 0
     ret, _, err = bpftool_prog_load("sample_ret0.bpf.o", "/sys/fs/bpf/offload",
-- 
2.55.0
