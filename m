Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75593B4EB5
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940697; cv=none; b=T+2t+XAneY3B7CN55/HhLg3dvQCVx9oGJVvf8Pct/kIYUWXcn/pJHK60sYsWskS4BlxrS+OBy81+yglOfEv5QNVsCNQWmUt5sF/VR4QTBLhAPlB64bO4t5vjBm7f7P3EFeCapUTR2Rdd/1rcJjCVlay59gxaA3qT7gV7EVTuAqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940697; c=relaxed/simple;
	bh=Ig4osFGayyTKiUDrdhynu9gUM5VDbzOye01+8vxPoP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxP6Ptmpk5dwZnGN2dJnGzlcmV2HU/fC0z8F82Cz3dDDzZzZW+b1VvXBdfhQg5UhqCihGZIcaZljB/icNmJxlQAjHO9Cq9005yjc79whhn2CrEait9UkkuegOl20Dd3B7VwVwdsjvZngC8v+0KlujFK8lXTpPPwKaJRprU52GR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjBMfmUN; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjBMfmUN"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-829a9d08644so2816863b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 00:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774940695; x=1775545495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lbWXtnbhC1yTNbE69i6SmEZlVhDlB2Axaw0Jgrh2l8=;
        b=XjBMfmUNPI4q+3Ewm7D1ZxWRm+6EmkOf/XHJEHk2nDdP4f1vAw45xRDslQBGhWUo90
         0SYj/W+JrPMeAI9IVA/eprWoEm3D5UtQ9as+YUS5nqEyF0tYjUSiDsQmbuRLoNIKkDnj
         dk7s6o9WcRwKdLICU/FczxrkPdRkdU+Y9ezL5TNcug4Ri8U/y6/+5N8DEgw3tbOHwlYj
         3p2X4flkHyk/UceEB4S8bzeOjbdi3vlNOayzjnmSevqK5E5zzmO2HInvDJErKhrNIHaJ
         21OT2/HbZfVdPpuXkD3Wo4ng1CFb1GGMe4FwBI38OcXNfoNZABslR90rXYojrIe88iTd
         8aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940695; x=1775545495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lbWXtnbhC1yTNbE69i6SmEZlVhDlB2Axaw0Jgrh2l8=;
        b=QCnjew5ltpBOzD0xJw+5X7yyuyL87UZbPhtAcPmVvsPP/8nZJ2kH2rUXKS82qoxaqZ
         gAJuEYfOxjXDH7BhTFc413aPgX+kFVuwZlzZWnoudU6OjljudaIPEitU5p3RTI49YWe0
         NnVHzfaNJPgw5xsouWxYnz42Q/XSE/SAs1TF8/GEXddZmsLKLDJm8zHQU3lbpZR+29zK
         r6Y5PtfJQ63WZ+mX5XqFoOjjb4PS23aQChW9vtZ6tucwnHQ3ZDQmCQbm/L6l86tWexwA
         lJTTBg9+hMrFp5iiKOh5mJ67A5Q50FCtd9cvyRlRWXa5qFX/NbwL9E9T3X/hjAitimED
         UYvw==
X-Forwarded-Encrypted: i=1; AJvYcCUENMnPOeJhLKByb9YybvjW57lOFGiEfydvLgL8l9aKZfZnK0H6cea3G3UZysTMlZJCRqRdXT4f+9rqQSnj+Ho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+DqimJtkkecBYEopiR90+iLJH9Zwp/DE/CsAGhRXXuRymlxP
	3aPDK/XvEteN94RJjtzDUu+UUuKPgCOXRmtWyxichTbOxN8pfkrYmlWS
X-Gm-Gg: ATEYQzwEqWwQi6LVD4idKuGes4SLumVFj9fQKakJ4Uqv+qDTHfr44nv3yjvVGH4z0l3
	tEguuEE75W3Aq/l9aJpyYUQpuZ4e+M+NXYopwGdecLugNj7gNMEqeLzXuH3TejxnbpSLAnv2/kf
	KkTRd5zt2GIRAlbj04Y8R7K8RGCP5NkIGUQxrr08OAyBkcg9jtjP68rnsCWOAA+70J5U0RAo4+O
	90n8cz/aEk2UO1GVfeMAd7xs14aGYPxLKdlL968wAlvaLu8XA8qXWcS62hUzFRz0Sp1m7lfDEh+
	ZASPJXlBEHLJQuoMk1u+OLV9MFuznQbeRu1/5fhoeiaMj3dr9E6+fPOG/m8jX7/FQ8kjoY5cTdM
	ZDe5QR8zL/p0n+VJl2Z8rGNRZwX4Q7ouNPArtBjnG/6OsPKo/UobG8tf5pYvxMALk+PKs6anpO1
	JAvKYE+C4Yye84unbqeFLb
X-Received: by 2002:a05:6a20:7f8d:b0:39b:c9ca:9736 with SMTP id adf61e73a8af0-39c87aea4d3mr15490809637.46.1774940695284;
        Tue, 31 Mar 2026 00:04:55 -0700 (PDT)
Received: from 7940hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76b78de2a7sm226149a12.13.2026.03.31.00.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:04:54 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org,
	olsajiri@gmail.com
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
Subject: [PATCH bpf-next v3] selftests/bpf: test access to ringbuf position with map pointer
Date: Tue, 31 Mar 2026 15:04:34 +0800
Message-ID: <20260331070434.10037-1-dongml2@chinatelecom.cn>
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
"128 + BPF_RINGBUF_HDR_SZ".

It will be helpful if we want to evaluate the usage of the ringbuf in bpf
prog with the consumer and producer position.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
Acked-by: Jiri Olsa <jolsa@kernel.org>
---
v3:
- use BPF_RINGBUF_HDR_SZ instead of 8 in check_ringbuf()

v2:
- don't set the max_entries for the ringbuf map
- add comment for the producer_pos
---
 .../testing/selftests/bpf/progs/map_ptr_kern.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/map_ptr_kern.c b/tools/testing/selftests/bpf/progs/map_ptr_kern.c
index efaf622c28dd..373c8d17ea55 100644
--- a/tools/testing/selftests/bpf/progs/map_ptr_kern.c
+++ b/tools/testing/selftests/bpf/progs/map_ptr_kern.c
@@ -647,8 +647,14 @@ static inline int check_devmap_hash(void)
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
@@ -659,9 +665,20 @@ static inline int check_ringbuf(void)
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
+	VERIFY(rb->producer_pos == 128 + BPF_RINGBUF_HDR_SZ);
+
 	return 1;
 }
 
-- 
2.53.0

