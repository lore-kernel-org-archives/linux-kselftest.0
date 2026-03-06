Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58691F1304
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798443; cv=none; b=bh2TLXSNzP5SqRwt9mYwYJHKoOThOBLkgY0Q1Rc80mhzm74rxcIQ+Sfd1kFTcViY1WKUtCEH5vyytdcqzYTaiHn84BPFtJ08lXxNyx1gxRNHQFVNYDIs1rQNl24x2ru0Bsz7JJvJLeyS9O1JKOHfAAzYGFeodyKsZbRh16Asdzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798443; c=relaxed/simple;
	bh=XZD0nlvsMUfnro3BBZbrp0Lh5REKL5pw8q8MrkouDhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1ebDABpqDE/XnAgbPMz/+/BEB/L/eR0eSXaVUTYYO5oBle2xh0Mfq8ZPIgqX4MzSluMETjTWB1AB/JhStYDRRUgBSiLwOolfoF/0iMUuUm+np/AB78jU9ITm2hvBJHf3qq7Zi2j11Uhk4z1mVH8cZse4c9PaOj+YmrgtgNAlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZhMN6VU; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZhMN6VU"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7927261a3acso83210027b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798441; x=1773403241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3R/49ouSDYzhu3nFmbplFfPLaAdWGpJSnr/CaN8H/08=;
        b=kZhMN6VUh8SMNqGEcY/azb64zjXkuvuXFXkslHe9JoydTqofKsMluE4ZfH9TnGfDzi
         cs1UlCU13JVEWRwVjm8X7yVmQboSEkLPSyT3mcpvZmzWrborXTirMvON2zuoWyBuJgod
         1gMtH1pqtiEcJfIS/jNhT9DpiAnjkcwVESJvwBGYWlnrjOmDAumDWLGXWDLuVpvFgGQD
         fnD5XUZbFZRzppKPrYN5Hoid0TZXBmfSB7lYtjyb1nf4KZYodce7Sa8DzivMnFYgon3f
         0lG2dodpAp02twYbnfDqTWFGLsQtt62ZpUbWRWTn85q0dzzxqpAZ/NELavTlKZrunoF8
         P+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798441; x=1773403241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R/49ouSDYzhu3nFmbplFfPLaAdWGpJSnr/CaN8H/08=;
        b=myY8sk0p3BD5E2QREioMxbOlyrfgFOZcNwAkS6EKzhPntofMOlv+c4ciLC0wkUOwoo
         fuXUKEArgZrfRYrG6EarcHLH+T2k+dk1d8bdNU8M9nB+CgJ2h2a8FgAZPfhOea/DYrwa
         Q23XVSRc8RBqQWkCnpuNj/0fV9UVbRzHHj88krbZHlTmUWD8OT3od2mjtOKIvCzEsbBM
         OhbTmWWMoWx0WSMj8iUkYlnTr70hcxojAtXDo9sjUEcamJw2VQLzuvaRCB/2NtWMISxF
         QaxLku3QY/6FEJTfdhQ34XQu85S4AHCJDsoPcRY4nj1KVrWj3QG5PxjGs9E76j67EpOm
         xCew==
X-Forwarded-Encrypted: i=1; AJvYcCVx5uwSt6DIUmvIESyNucQQ/oiWzw5r5VI9cNtPjFzcFRATmdzU7Z01jl6LvLz7kqsqiwV3JMzayzSaN6D1YD4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5lab8EvzV6NWlSAOYrwJQ0+R3YRUvz1fABzU4ywAqQPp549iA
	8n3Mi4bqP74qjTCsK40K2n9cBRRd9XVp68XIo0jquNhQ2t+hDz9S1uZY/McAsJ09150Rpw==
X-Gm-Gg: ATEYQzyjFBsxbErmcVuu/FIch/cE3TVo5F/rP1P9SlG3Sf7tgZ/YE2X++FTNXxPhce/
	H1zkGr5hSoS7U05V6EKqpY7ZFzfcPfwi97MWNNNXKg9LDPgwPUVC0SYSLZQM+LOkFrY7UO1/z+J
	PyuUUTdvg3D7KC84wPd6lFpy4M9fuKgErJYtG4KLRoSZOdUHAgpnvgPXs7vWfO5Qx2O5lwG++r5
	5GtDkTyNz4hJsSpItZuyTucnm+BZ/qp9AQ0G+SgJqJOPOW+kD1FZuvw2t/IYGOg5B6ZxIS5S3HA
	rHbuf8as5hhl1qcMzHU1Olj40f+HDCrhuEUxpyO4lXZBo+79wknZXd22ZLQRJVDPe45e9Guu8XW
	zr24PnfB2ySJuXbXSzl311jXtWhZSgkEl2YR/dNjY+AixVtaQAMgBbyAqoO13fUJ6VEqnGlMN4v
	mzj0Kk+tTpYHCHy5vBxr5nL3yBl+9g7t2hzvWAjEcKkZIKZqCOTrppAyajtBskIKYPLb8ZIxebh
	6fNorictVOd5sa+KB6Mn79GB+7IQpPIPMjq
X-Received: by 2002:a05:690c:6891:b0:798:578c:2af1 with SMTP id 00721157ae682-798dd6da5a7mr17085347b3.29.1772798440681;
        Fri, 06 Mar 2026 04:00:40 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dec8b55csm5601177b3.5.2026.03.06.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:00:40 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2] selftests/bpf: avoid jump seq limit in verif_scale_pyperf600
Date: Fri,  6 Mar 2026 20:00:24 +0800
Message-ID: <20260306120024.1032301-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pyperf600 is a verifier scale test. With newer LLVM, calling __on_event()
twice can push the generated program over the verifier jump sequence
complexity limit (8192), failing with:

  The sequence of 8193 jumps is too complex.

Let pyperf600 provide its own on_event() that calls __on_event() once, and
guard the shared wrapper accordingly. Other pyperf600 variants are
unaffected.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---

v2:
  - Drop runtime -E2BIG skip; instead tweak pyperf600 program source to avoid
    hitting the verifier jump sequence complexity limit.
  - verif_scale_pyperf600 now passes; other pyperf600 variants unchanged.

 tools/testing/selftests/bpf/progs/pyperf.h    | 4 +++-
 tools/testing/selftests/bpf/progs/pyperf600.c | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/pyperf.h b/tools/testing/selftests/bpf/progs/pyperf.h
index 86484f07e1d1..c02c49c52c77 100644
--- a/tools/testing/selftests/bpf/progs/pyperf.h
+++ b/tools/testing/selftests/bpf/progs/pyperf.h
@@ -343,8 +343,9 @@ int __on_event(struct bpf_raw_tracepoint_args *ctx)
 	return 0;
 }
 
+#ifndef PYPERF_CUSTOM_ON_EVENT
 SEC("raw_tracepoint/kfree_skb")
-int on_event(struct bpf_raw_tracepoint_args* ctx)
+int on_event(struct bpf_raw_tracepoint_args *ctx)
 {
 	int ret = 0;
 	ret |= __on_event(ctx);
@@ -354,5 +355,6 @@ int on_event(struct bpf_raw_tracepoint_args* ctx)
 	ret |= __on_event(ctx);
 	return ret;
 }
+#endif
 
 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/pyperf600.c b/tools/testing/selftests/bpf/progs/pyperf600.c
index ce1aa5189cc4..31e8a422d804 100644
--- a/tools/testing/selftests/bpf/progs/pyperf600.c
+++ b/tools/testing/selftests/bpf/progs/pyperf600.c
@@ -9,4 +9,11 @@
  * the loop will still execute 600 times.
  */
 #define UNROLL_COUNT 150
+#define PYPERF_CUSTOM_ON_EVENT
 #include "pyperf.h"
+
+SEC("raw_tracepoint/kfree_skb")
+int on_event(struct bpf_raw_tracepoint_args *ctx)
+{
+	return __on_event(ctx);
+}

base-commit: 5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
-- 
2.43.0

