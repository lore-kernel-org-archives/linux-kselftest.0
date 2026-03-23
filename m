Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B26FBF
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 02:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774232338; cv=none; b=VVHZeF7ubsf2xlAF701ecez7w/49Ly4GdA0mysEvTP33E2hIXpph/+4SqYxpASugMljXuEtTX98tGbBBFhJ5pE7rDnC9jSJPYT+6R3quyFALkROKgrWNZMJ9rtAZg5ghik6tE1kUAiSlWNDiAYunrMJt4Cj5CPLwYd0ncCPCdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774232338; c=relaxed/simple;
	bh=3F2YTwMiInpUo7vYiWA4QSWv+6x2KTNxHJOzazBbxiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZISBMsNNJ460d55QNTWliY7EzT4LHohfG3K9y3DCH5RLheyrrMH05bs2M8OU9eXB6JL3DrSpg8eFO/ZgnYDr1ttkW+y1RfhHKXxD+AfP826A0WIJ0ggPPvmw8EFppnNvNxYcZXGQSkR4WamvLuyamkmQNg5p58aPsPmVR1Qvv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/xBYe0K; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/xBYe0K"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-35a094cc3e9so2528456a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 19:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774232336; x=1774837136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ooe4HdAHw7dJGZq1UaghqqlXPLswv0YlfyU3aXugIk=;
        b=W/xBYe0KUceib4qjxEmSwQXKXJuAnWk+8WQZZR6ddsR+i0dcAX659+hJKoYV6a2Ltz
         DOGd2T+2L5udFqGL2Gd6UP1XPfHuBxMPfEpXWrPhpuzThP4wzpj4+W8URPGLWlotx+Qr
         YfKAfB+Q54Admiaqne4FibIj2+OHZ4HcyUUfNmzlnfDUt+tcJUXY3qMtlJLkiOR6UAZg
         scuhRjTKkFIZA+QGjfLOI7HbDEI4I0+YBf5Ia+CCQlYV+zqY/dq21lGe5rLyfIkwIcTV
         +G+1xUGjsYPKFpgKQnvjqVMTMM6rBW2Hlo4jJNl+bgfwwnl17R+ojz8b8t8XNT8tASFz
         Vr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774232336; x=1774837136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ooe4HdAHw7dJGZq1UaghqqlXPLswv0YlfyU3aXugIk=;
        b=WWILanE8YVTwDSYcgjsSxA5ReIYhmFAscpwO5fY19ZpM+/xD25oU6GeZmkYDizygxg
         2NRrkx+VfzyNSd3+TBv2whggSTG8p2Y4v8EHzSNqKnG+nE/tMv/QHV5yF135S+VVFWda
         2h4EmJd9qldGUVL+wPpnlmI0uTNSmMS5K8+tJHBa1reNatMxs81wb8OcB46FOgVNew10
         uoR6szBt1itIRwQuhxq8VJPkuRaCEEdj3fGc9AQAgGUZkSKT2FOJFNhd5rDrLEFUOMNW
         ddsVN2/T+FJhQDlg/uS1kVffG3fsbgb1B3zcC9Y9is7NI/E7u81kcmzGRMFk2IALjHAf
         EkRw==
X-Forwarded-Encrypted: i=1; AJvYcCUtCVWZbAoqxwFR90Qe23OIrDNTyPUbNtM5KREUZouqA1t3hbI9pNQ74/y0fq8p6cmTBxYfwe73z+azOnDNuDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Rj8gOqGqYljvEEYWzYb4MOQdqWvkVaSOK/ZBGGeJwDIrio10
	j6hcBmgt8lIaXsdpwKz0ikuHxLRdoCc51OFSlUgzX6PCt7ZQVDxiAiWA
X-Gm-Gg: ATEYQzyOfXT0JooOFVbL3J66foVWsQ/nwL8gpzrqoA72vrw5gsM56QpuBh1mYFITAwe
	GW7oOvc0/Nk/5JyQbo8CXXJ9I2x4PhM4fK5XOIS4R9fuY2PxSCQgneSbbAv0DvW80Lld6Qn8+Sf
	O2uifbmEPhSYuS06P/AzMw/UJA/rzrjw/qD4hTEYJTk5Ct6Dl+q0S4ds6z1ryCbQMxUbVVaIuPp
	2oT7hFCW1HPMtVvZwrUYoOzdtFIf4sdkH8RMud4AgIbTGrQsap3lN8YwjBZgSEMTgVdxjStx84t
	m7VWmgkd6rgwucAy2O9r0IqZt2TnyoznUmZrNRnguxaSGLn2X8XGdWdYBmGp8FF4lckaHbSJfN8
	3EKXxweIrPNsou0zAvQoBRwo8UF3GxXlleYl5AhHqQAaiidBk0TcDSu1OZWfG9hBbVFZQVWeyjp
	iscaZnVYG9onIHDKYzMR6i
X-Received: by 2002:a17:90b:5111:b0:359:ff8a:ee3f with SMTP id 98e67ed59e1d1-35bd2d3b921mr8332433a91.30.1774232336155;
        Sun, 22 Mar 2026 19:18:56 -0700 (PDT)
Received: from 7940hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd24b541csm3766621a91.0.2026.03.22.19.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 19:18:55 -0700 (PDT)
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
Subject: [PATCH bpf-next v2] selftests/bpf: test access to ringbuf position with map pointer
Date: Mon, 23 Mar 2026 10:18:39 +0800
Message-ID: <20260323021839.101316-1-dongml2@chinatelecom.cn>
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
Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
---
v2:
- don't set the max_entries for the ringbuf map
- add comment for the producer_pos
---
 .../testing/selftests/bpf/progs/map_ptr_kern.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/map_ptr_kern.c b/tools/testing/selftests/bpf/progs/map_ptr_kern.c
index efaf622c28dd..d7611e7018ca 100644
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
@@ -659,9 +665,21 @@ static inline int check_ringbuf(void)
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
+	/* The "8" here is BPF_RINGBUF_HDR_SZ */
+	VERIFY(rb->producer_pos == 128 + 8);
+
 	return 1;
 }
 
-- 
2.53.0

