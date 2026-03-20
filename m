Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADCB330315
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996137; cv=none; b=GvBBanSH6tmoWaZQIiQedd8c3qXJxfyS7mKvvMdbzQlZpsZUlyBl2xG4zCeFJrrM7HvFe+Nbz6eYAQfx+qHUAKeApJDSYW3j731B3s1fK7EHJkHqKoOkW3cSFP2Ii2mzZk1vQRM7lDUM2RpH2VIDa5DbGyUcZmA+0CvHGfBM4aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996137; c=relaxed/simple;
	bh=5Q7aLuxOVdADzoU0uivwq0xD+2sqiuHUFUnRzhh3DKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AE6ioNve5hajMT4AiOOKoWclr5xnH+OWle5nldIc3q/N9ezUVHBAsHUFH1eXLI0ND+4H/+k7geYfPnCbCDjAAReuK+mm/9Cl+/BDH3007jkM2TXXBYKDmX1d5jj+o3NrqGcoSC6DEoW3tULD80OT9iVvT1MyPO+vJwZDXNVEf4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV1ujL4F; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV1ujL4F"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c73fbdd9b53so605787a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773996135; x=1774600935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVhVfvEdh8PGLTq9OCpKCKnbK78t+8gkIfnExz2ct6g=;
        b=mV1ujL4F+PLg4+Qoce68BOLDq4TYZ3R+sRDJ8w83pAVFNL697z1QfO9niV0bw53m2d
         qZ39IAmJCnS1OC0ts9Tegd2l+E9DeQuiK1vWBpY5NzZUs7VFxxprNQwZbd/liQKckaDY
         i7SI2lryLhX57J8gRIYwDbwVN19q2awvVcgHjUKlNVGJdrOSwGqV8YIKsVqslvViI6xA
         NrjqSuMOPNbiuvq7Qq8x/EtcXYwgVxGGKuo7RoNFwaQYaR/BxZ4JTsUPaT6ba4BupZXo
         u7YvN3qz3wvWQLsZpb6VZ2XlnkA/2AfvWXd0MK4a6iuzs6U0W7SWCyG+z9euY1HfopGR
         YyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996135; x=1774600935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVhVfvEdh8PGLTq9OCpKCKnbK78t+8gkIfnExz2ct6g=;
        b=gMkQQmhf+fNEStsbFXsyiWsaxpS7KrMUiimdJ2QCUlrm3/Y196PNNp4wQA1OoSYFli
         kqJAhhjEDxl/+mQcdFj/MD3kk6hfi/CjYQQB0zh4sB1fKx2ziZtKe6eC+2A0hnhhkYKW
         1bbnP2MvpZlIJgVe7vs2SYvlQ0pb3euxjyjGfa82RRGx0FZ51/1zK6iHacHJspW7D53e
         jUOvDwGBCA93s7QVoiQ9OKP2TaM/uoWY6be8lwfSn9EH7mzx2iFgbyVQvI39lomKt1Di
         hcQtHedxbn4MgeV6It5gdUuE5dCiRAitFeOLFG/yFdwLLkFCWeppUiJ0DS7TBbodejFj
         yRVw==
X-Forwarded-Encrypted: i=1; AJvYcCWCc12R4fha1m/CiGAqmVNtjohWpL0jA5nxIrm24ZpIQt2jH+ziF7/2hlg4J/TB/OafpJVnteryOEF1fa7/Gu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcwg6Xwg3ffrRfgISLrhMkqHEzj7+ZrKJJhu+FSndsvuJTcWIk
	0gC/GPAkszx9rw6tagCgCf+0DfDiTKwq4VKXTWyTC82FR6Ls+Qxy0u7x
X-Gm-Gg: ATEYQzxtX8oMnz6HPgnI5GfuY7rsBQknOIx1gC0vcF7KupF/2oi5shI8EoseFjruOIh
	8qdtG8l4scZtyPXQrtN2i+SSFfbDxWOMIB88gdPaSsrlobIQV9m5y44AZb9M5bqGfAkB79lC4Ix
	v9gbGyWbOTTKUShC1g5L690VCYXoMOX6ATLfz4NjOF2S59RdtEcNIxaWINuFrd0NdWvPdZYjfHa
	r5kUJaLs4uqBrBjjY9yzUe7gx00YSQ+WaUhyIqiI9IuOqYyPD2G2fGyZBOquDD6v6xOafJEutOv
	+S1eMWvK1Js11QELrXhehe8VdeaDtqMaQhsOq9UrjXpbDLjdfA7LUL/oRTMbj6sON3b+2XgNd4/
	hYdDD5PZ8D1AOEGq6JseErHzFNwJuvU2OoVilZu94ePbbmmpy7lrN6lG4XK4/hFSF9VdvnCUPGt
	+v+6KNhWKCuWGBkww/CPwd
X-Received: by 2002:a05:6a20:3c8e:b0:38e:99a0:105b with SMTP id adf61e73a8af0-39bceb7edb0mr2140353637.51.1773996134580;
        Fri, 20 Mar 2026 01:42:14 -0700 (PDT)
Received: from 7940hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a7ff47csm1288665a12.6.2026.03.20.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:42:14 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
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
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] selftests/bpf: test access to ringbuf position with map pointer
Date: Fri, 20 Mar 2026 16:41:55 +0800
Message-ID: <20260320084155.288417-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the testing to access the bpf_ringbuf with the map pointer.
"consumer_pos" and "producer_pos" is accessed in this testing. We reserve
128 bytes in the ringbuf to test the producer_pos, which should be
"128 + 8", and the "8" is BPF_RINGBUF_HDR_SZ.

It will be helpful if we want to evaluate the usage of the ringbuf in bpf
prog with the consumer and producer position.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 .../testing/selftests/bpf/progs/map_ptr_kern.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/map_ptr_kern.c b/tools/testing/selftests/bpf/progs/map_ptr_kern.c
index efaf622c28dd..c3fa57ec430b 100644
--- a/tools/testing/selftests/bpf/progs/map_ptr_kern.c
+++ b/tools/testing/selftests/bpf/progs/map_ptr_kern.c
@@ -647,21 +647,39 @@ static inline int check_devmap_hash(void)
 	return 1;
 }
 
+struct bpf_ringbuf {
+	unsigned long consumer_pos;
+	unsigned long producer_pos;
+} __attribute__((preserve_access_index));
+
 struct bpf_ringbuf_map {
 	struct bpf_map map;
+	struct bpf_ringbuf *rb;
 } __attribute__((preserve_access_index));
 
 struct {
 	__uint(type, BPF_MAP_TYPE_RINGBUF);
+	__uint(max_entries, 1 << 10);
 } m_ringbuf SEC(".maps");
 
 static inline int check_ringbuf(void)
 {
 	struct bpf_ringbuf_map *ringbuf = (struct bpf_ringbuf_map *)&m_ringbuf;
 	struct bpf_map *map = (struct bpf_map *)&m_ringbuf;
+	struct bpf_ringbuf *rb;
+	void *ptr;
 
 	VERIFY(check(&ringbuf->map, map, 0, 0, page_size));
 
+	ptr = bpf_ringbuf_reserve(&m_ringbuf, 128, 0);
+	VERIFY(ptr);
+
+	bpf_ringbuf_discard(ptr, 0);
+	rb = ringbuf->rb;
+	VERIFY(rb);
+	VERIFY(rb->consumer_pos == 0);
+	VERIFY(rb->producer_pos == 128 + 8);
+
 	return 1;
 }
 
-- 
2.53.0

