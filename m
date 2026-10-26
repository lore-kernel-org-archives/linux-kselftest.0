Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032235;
	b=Fc4ap5ulT7YVVL/BAkCvK+WP/d5ofvVMFL7DaRlqZfhHcO5VSX9PntTmQNCoBmQjewHs
	 t6fDvK1+j5sB7NC8ylZy/VO+aFxRurMPWo7zcb1HJci4j9duWOLINm7JdhLW3tdgybVIP
	 e1W9aWf6kdZ+u6YC9jVWNf6pjd71cICDzRIcm65bYaDbdVARxlOtPppKU8fKVlfySILOl
	 zKvyfQh2+SpZEkayQKz5rocym+eFibkRUsdtjRDNBSTLGrzKIENz4GhzjigsltMfEPSyP
	 Y7aM3m1qnsJh/XQYEfa0bncAXGwFCY/2NQp5ZdrgAchV3W4Ch3+W82S0PFgKyTeqzXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WGd8hv6dQ0jpXHntVrEKsl2n+adOY8jZkAHXTXnqh7c=;
	b=ncCZGz6uMv24ADDhfackb7aJQAFxZbVUfrrlwGCLEAiZgdAkM/IK+ia/vrQk29O7qVQl
	 iNEytHqvG+ARv7Zf1UDm9I1fuYmNAKokhxumtYr4PqCIprht2JtiG8rtjqxjwysRsv3cM
	 QDxTAgnjLHHDis5iZPjo+VO8Q8pGrxPO6k2p6/pvxflYsF2sBrmrnnP5Lf8qG5GEdFdH7
	 er+N4wyGp3XnwrjxGvL4jweBJn5d4arAXvxQkPzGMKtGinBZPQPJBtiRzMXNgFmjQjZ8X
	 oiVHIxpWYsAvulrrUjKw1uc4r8xxBGFo5CrLysIBU+pGtiCDltrjoY128zRr+pno33Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OWgrT87Q;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1E1606A32D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 16:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1E1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OWgrT87Q
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35c76e9614aso5146624eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 09:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793032234; x=1793637034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGd8hv6dQ0jpXHntVrEKsl2n+adOY8jZkAHXTXnqh7c=;
        b=OWgrT87Qj/2zyW8smzZBl773SMPrPIzcvxCXye5uBT8QFVCCjI9Rok0yb22yySWm7Z
         XxKPx1VpKgrJr1Z9ev71PvTb8vFPBIiAiIBfFBPkCyV5KkbZiZfxLW1hrjRMlIoXXzQv
         Pi2jcEap2puXyNfA+70UuljWtojYba002F5ZqLUETRQBGKklcmM2NkLVq+uvOYvQxHH1
         FK25Og2Kk078DLTMCVWxJcKUk6lVI7qlVD3UJcaeKOEYhOscCtsRqlWx2eRPix3JrhTR
         m7vjPzGwMMuwHNDEd+a41fikRJO53eLxA5tTjkQJBnY2A1xWp+M5V7bzqk69179sGXSa
         gXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032234; x=1793637034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGd8hv6dQ0jpXHntVrEKsl2n+adOY8jZkAHXTXnqh7c=;
        b=TbpW8Ic3fJwWnhmOib4B8ZWxc0igj0rsXre+lSVAJHyO1fO889cQPvMlWLUvvfVcBs
         RPNmSYf2GqZyZ39hWo7rxnURTtDNkXBLwmkZ8knCdd53MCqJvcJfU9FI2AfCfthKIErz
         GnmpWyhGeE46rdBu2vbKwg2mj0Bt9nISk/KsANGYRXXUkr6MyKyqdR7LjeO1KynETp+x
         9FYuD9ylGwHxDAuyUDlMPnrBW7+hWHebLJp2wVC1arAPJ59iPx8npHiQNoMP9gjxPHxg
         6qFTU39yewHetado/8+roVMBqSq5cgyIR4+XIm02XLBTeyPWx2K6j++muoUtPkpN3pXz
         o6Kg==
X-Forwarded-Encrypted: i=1; AKwUvBx/dhk/jZzeQHjkS8WFLHOQgF7CgjLR3U03U471Bxwc05elKaGJZHMRnar2nkKYtRBDxV/H0rfvA/+4eeF+N18=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJGo5tU7xKEM4LVkK+mIMPvH9HJi9i/HWs2P6gO9+mPrA/1h2Q
	bENV8Nw8SKqAGHjVl/6EH1+69ZJNs8hM2ysDpVEWqM8BVSjCH6SWsZwT
X-Gm-Gg: AYBFou0seRGGgaUhd363UqG/uhMGzqGowXsasuqn2S5AxT2gskgl/HQrVEHxB8G8atV
	tYaYNklvyKv/8txna46bAGq28KolpskLst5NLykZGAueuTqR6pWK2YRjZ9qub2NNBBJr7z7xv19
	4Lqdd8MiQwMBcz6ENE00nsEbKRio6eh9IFLsh14lXmbyuY4bmi3k0NBwfpMYofQiorf3bWDyRdk
	W8asG8PEPdzu4wpOv/D32sWg4rOsZqnlpipIdk+GX6xlco7FXNzqVBV/yVsw5VkSuBH+BNEn2F5
	ywHc/9ZI213OKS0Aq1qUozBa/aXwRhv/in5tmVK40UxLkt/JyX2jK/iart49MN+Ei6bGhaXX0+M
	9Qxltx6Dn0VQgewaaQ7qK12tt71u2vpHbjoZi0YE3q/I/kXVtw/HHmJs7XMmPxVwGei30m4qQ2U
	xVrmhph7wwe0agv/zrGu3cIqM10gDT3fx/rJ4bBZg2TywugWpO8M5jiKQZtaF0gB1BBBMF43YfD
	NVK84vot6yWxxHUHoS5rWDqnSIl3CRLdX36b9lcVdCNapAMrZyay82f+m2b7IyLooWpBKRQTHKL
	HLPSUUfGV9tzhEGb9LunAKgmBCF0jIjLdh9joLMp4xc4/MBSoZFJFogmKzDGgQONGSYaF7BmBSQ
	=
X-Received: by 2002:a05:7301:1530:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-369e84e94a7mr11024368eec.25.1793032233734;
        Mon, 26 Oct 2026 09:30:33 -0700 (PDT)
Received: from nixos ([2405:201:c40d:9039:f859:3f74:c064:3281])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm36119014eec.19.2026.10.26.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:30:32 -0700 (PDT)
From: Ayushman Rout <ayushmanrout27@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	Ayushman Rout <ayushmanrout27@gmail.com>,
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
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf v2 2/2] selftests/bpf: Test overlapping dynptr copies on xdp frags
Date: Mon, 26 Oct 2026 21:58:09 +0530
Message-ID: <20261026162810.12862-3-ayushmanrout27@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026162810.12862-1-ayushmanrout27@gmail.com>
References: <20261026162810.12862-1-ayushmanrout27@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dynptr tests for copies within one xdp packet with frags, where the
source and the destination overlap and the destination is above the
source:

- test_dynptr_copy_xdp_overlap: both ranges cross from the linear part
  into frag0. bpf_dynptr_copy() of 1200 bytes with the destination 100
  bytes above the source.
- test_dynptr_copy_xdp_overlap_src_linear: the source is in the linear
  part and the destination crosses into frag0.
- test_dynptr_copy_xdp_overlap_dst_frag: the source crosses into frag0
  and the destination is in frag0.

The new tests set err when the data is wrong. The existing
test_dynptr_copy_xdp does not, so it can pass on corrupted data.

Without the fix to bpf_dynptr_copy(), test_dynptr_copy_xdp_overlap
fails. With it, all the new tests pass.

Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
---
 .../testing/selftests/bpf/prog_tests/dynptr.c |  3 +
 .../selftests/bpf/progs/dynptr_success.c      | 90 +++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/dynptr.c b/tools/testing/selftests/bpf/prog_tests/dynptr.c
index 4396560365e8..cbb2cc9969be 100644
--- a/tools/testing/selftests/bpf/prog_tests/dynptr.c
+++ b/tools/testing/selftests/bpf/prog_tests/dynptr.c
@@ -22,6 +22,9 @@ static struct {
 	{"test_dynptr_data", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_copy", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_copy_xdp", SETUP_XDP_PROG},
+	{"test_dynptr_copy_xdp_overlap", SETUP_XDP_PROG},
+	{"test_dynptr_copy_xdp_overlap_src_linear", SETUP_XDP_PROG},
+	{"test_dynptr_copy_xdp_overlap_dst_frag", SETUP_XDP_PROG},
 	{"test_dynptr_memset_zero", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_memset_notzero", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_memset_zero_offset", SETUP_SYSCALL_SLEEP},
diff --git a/tools/testing/selftests/bpf/progs/dynptr_success.c b/tools/testing/selftests/bpf/progs/dynptr_success.c
index b668ebd61fc7..56be4eafc270 100644
--- a/tools/testing/selftests/bpf/progs/dynptr_success.c
+++ b/tools/testing/selftests/bpf/progs/dynptr_success.c
@@ -759,6 +759,96 @@ int test_dynptr_copy_xdp(struct xdp_md *xdp)
 	return XDP_DROP;
 }
 
+static __always_inline int fill_xdp(struct bpf_dynptr *ptr, __u32 start, __u32 n)
+{
+	__u8 b;
+	int i;
+
+	bpf_for(i, 0, n) {
+		b = (start + i) % 251;
+		if (bpf_dynptr_write(ptr, start + i, &b, 1, 0))
+			return 1;
+	}
+	return 0;
+}
+
+static __always_inline int check_xdp(struct bpf_dynptr *ptr, __u32 at, __u32 n, __u32 from)
+{
+	__u8 b;
+	int i;
+
+	bpf_for(i, 0, n) {
+		if (bpf_dynptr_read(&b, 1, ptr, at + i, 0))
+			return 1;
+		if (b != (__u8)((from + i) % 251))
+			return 1;
+	}
+	return 0;
+}
+
+SEC("?xdp")
+int test_dynptr_copy_xdp_overlap(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	__u32 off = data_end - data - 1000;
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_xdp(xdp, 0, &ptr);
+	if (fill_xdp(&ptr, off, 1300)) {
+		err = 1;
+		return XDP_DROP;
+	}
+	err = bpf_dynptr_copy(&ptr, off + 100, &ptr, off, 1200);
+	if (err)
+		return XDP_DROP;
+	if (check_xdp(&ptr, off + 100, 1200, off))
+		err = 2;
+	return XDP_DROP;
+}
+
+SEC("?xdp")
+int test_dynptr_copy_xdp_overlap_src_linear(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	__u32 lin = data_end - data;
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_xdp(xdp, 0, &ptr);
+	if (fill_xdp(&ptr, lin - 64, 118)) {
+		err = 1;
+		return XDP_DROP;
+	}
+	err = bpf_dynptr_copy(&ptr, lin - 10, &ptr, lin - 64, 64);
+	if (err)
+		return XDP_DROP;
+	if (check_xdp(&ptr, lin - 10, 64, lin - 64))
+		err = 2;
+	return XDP_DROP;
+}
+
+SEC("?xdp")
+int test_dynptr_copy_xdp_overlap_dst_frag(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	__u32 lin = data_end - data;
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_xdp(xdp, 0, &ptr);
+	if (fill_xdp(&ptr, lin - 10, 84)) {
+		err = 1;
+		return XDP_DROP;
+	}
+	err = bpf_dynptr_copy(&ptr, lin + 10, &ptr, lin - 10, 64);
+	if (err)
+		return XDP_DROP;
+	if (check_xdp(&ptr, lin + 10, 64, lin - 10))
+		err = 2;
+	return XDP_DROP;
+}
+
 char memset_zero_data[] = "data to be zeroed";
 
 SEC("?tp/syscalls/sys_enter_nanosleep")
-- 
2.54.0

