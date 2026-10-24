Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834108;
	b=evHCkV8vfVLp0Y9WS6p9wgD5boof6R8LaXkSpRTkRhPm9OG19oUl47e0nJ/DDEdFVXx7
	 AmR8DaQmfQIxOLCFaT5fPHUegIAMQ2FS4fHp0ORD0OanKKGfj+H3XMyaujxdHWXP58F/f
	 GLaONQxeCugWDMMlK+tZIGr5x3Zjh0+1xSQnOnZF23OB1piTN7zWErtVOUWFFLBe3P/Zu
	 bQ50nQ5SX1shQRiOAWjrlm9b95wFwMDr9Q2Sg1l8DjyIUDVpzBVAgFyj1Bnynbjdd6KwI
	 o0k3eML5aLIEPltkGvIZDPG2dmcI1/MRaOpu3WlSWtz1coQlWCIujLWyY/HFAMfEvAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BlUUlyu0tLkS0StKgW3SUYx8agTboJGWzFSZtZkcXsU=;
	b=g3h3jxaSw0YRy0lTXeXkN6tgJ+HF+Z39c9MNp0ODDCs4GQP5Q79D0iUc0TUdOISDNO2U
	 Hdf8MkwONHHspD4+yPhhdpA4T31nhIqcdE4LK8EwUD7tDKARrAGoeTkUq5hYQOyJ0KCce
	 g3o4tHBV8WAc9kart/mpxUOLTNF8vxpPmFW+5jW85Pjxc6mBJOgF5997KsouT3CYrZuHk
	 R8YLyJcrXmBA7RyzsPvTAaM80zKBNExgHy8PpuqQ9fda/5sN/Hz+ev61nIehIWlux9dx+
	 eWRP/rOiRp+bINrUtU79BWV/PZSrN/kqUQr9xl37WY+wCbTPAuS1aqfmU6zmzsz7Kng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b9nh1GtH;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C446606BF36
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C446606BF36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b9nh1GtH
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36681e85e87so159551eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792834107; x=1793438907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlUUlyu0tLkS0StKgW3SUYx8agTboJGWzFSZtZkcXsU=;
        b=b9nh1GtH2+skTNF5DZP9gibDmo1B8XDJqOyw8/vQ6Hd74v9sFQ35s9Tesqt2FOb1pP
         Qo+VkuBPh1UAfxNNdXvzZGy5dqQMvfL8wWV0KkiOjlsFAuZ0jB6LU7PN3kr0OA5okfZ1
         dCa8a0oNrk/TJERvUoac8eX8GqwJLdaZZWx8w6Oy6xH8AeLiCbXskMox7qS6zJHcGA/U
         Lba7qXFG+eJRjcwzpwWBJ3wKgSpWdlLk6fRDtV/K8AOowXnUzZknZB8RmFwwORREa4Eu
         pmaYVLGyAojs5xhQUTZoEUiULZRwwY9pWKlF4nr5LKVBGz3/bIONFndeO7oDFWw+ILxa
         2Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834107; x=1793438907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BlUUlyu0tLkS0StKgW3SUYx8agTboJGWzFSZtZkcXsU=;
        b=dF1guctLOFLb/zkS4MQzN3IHpz12opQvL4HkYuCfpDaWZRBIBvh04aEeFmwaRke7aS
         d8dnEii+sBLqSwayOLfGIfT0+L3soNG39542osY+t+cydZnbwDUpGnaf4cKGSDuD9kJ1
         +J23ach7MYH07UNGtOBaeLSv+05g0jHAobAVMbUjVvxK7efPFWaEt5u1ni3ELEK0EdQP
         qTErRNTLctDRcEhKbrMVk3jrKyLhMq4E1V7CHF0HmW5RBk93oQjO18YCIHTi3cRTikzz
         7RHTjnePbcTGJKYG4yGDeeDpKLAVCf427pwWTG1ykdBcWffFeAZBNdqZh32OiNd2KD4l
         1tng==
X-Forwarded-Encrypted: i=1; AKwUvBx7MoFl7ZvTP4CY5UHng/7+Mm11VCEWzsmdS1JKH6/D6YFk2L2YUHP27f+VdyJ9SHezGPms8IrKrh9eRAAZzTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK1YdXAEugrIRl9h12UbFCNQblwUCtKFZSPuI6HqXE3JBE40i7
	s7H0LUHO+HpjZwP9+KhTPp/McyGthpOe3ucQ+AfmbFE460rHGUCpZKMc
X-Gm-Gg: AYBFou17CMHYKEr5QEarvgTkCUawiYxjG4uSpbI1fJ4UOYYJohRvG0zducksW4qaw+f
	XP1sZ0AANIwwntAR4yd13pZwbJQRMk2QVoCtcjk6EnmeyJx61aq+3wP8JfvzPbc9yX2BkQX1TiE
	aJWBKnRyozgIdiJo3DBk43WIbctnl9k2MzF1DY3wWSwIyFYks29Lu7cSUNladWKQ4m2X88jwsoI
	16FJ2W1QHJGZYLisxbzrYA4ffyPCUHLBvi3T3LgHp3ps6VELgHPuEZQ4qgnmh5O5/hE+Z5th8r9
	ML+QZEDQLfOK89RV/ND8IprzYxnfc38yY4BRyp9mseUeMOs3vvdPlU5JitBrUgxxBfPWxWkp3kW
	iWviMs5J/DGPFGvkm/txPQ6Lr5all1wIhOw7P/V3n+C4gT9YRsqJrVM+hheIKU/YXQZOJe/0d1+
	I4lU2mTRCr1Jf8Dl+ZHFozSzADYJBNc5RaIrxOakZJ31q0c7DK8Ocbv7UCTcJM7QnMs9ua98WP9
	7Dwb54piRNcZywMw/4fWq1LA74+O3yn0zTGSW4brQHO0xpnBM6ihWH6jBDSXaKf0dIO4NaAKL2/
	cOkOW6KF8YQZ9EkIfXWyXxB2t9+g8Q1pT3qf1vDKNP1Cq91skITzc5jLYJEuIzn+fNYFFH0yiA=
	=
X-Received: by 2002:a05:7300:d086:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-369e842df55mr2190770eec.9.1792834107430;
        Sat, 24 Oct 2026 02:28:27 -0700 (PDT)
Received: from nixos ([2405:201:c40d:9039:e1f8:b9bb:b037:3cab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm5236604eec.18.2026.10.24.02.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:28:26 -0700 (PDT)
From: Ayushman Rout <ayushmanrout27@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	Ayushman Rout <ayushmanrout27@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf 3/3] selftests/bpf: Test overlapping dynptr copies on xdp frags
Date: Sat, 24 Oct 2026 14:56:58 +0530
Message-ID: <20261024092659.76422-4-ayushmanrout27@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024092659.76422-1-ayushmanrout27@gmail.com>
References: <20261024092659.76422-1-ayushmanrout27@gmail.com>
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

Add four dynptr tests. Three use an xdp packet with frags, and in each
the range goes from the linear part into frag0:

- test_dynptr_copy_xdp_overlap: bpf_dynptr_copy() of 1200 bytes with
  the destination 100 bytes above the source.
- test_dynptr_read_xdp_overlap: bpf_dynptr_read() into a slice of the
  same packet.
- test_dynptr_write_xdp_overlap: bpf_dynptr_write() from a slice of the
  same packet.

The fourth, test_dynptr_skb_load_overlap, reads a range that spans the
head and the frags of an skb. It passes with and without the fixes and
checks that skbs are not affected.

The new tests set err when the data is wrong. The existing
test_dynptr_copy_xdp does not, so it can pass on corrupted data.

Without the fixes to bpf_xdp_copy_buf() and bpf_dynptr_copy(), the three
xdp tests fail. With them, all four tests pass.

Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
Assisted-by: LLM
---
 .../testing/selftests/bpf/prog_tests/dynptr.c |   4 +
 .../selftests/bpf/progs/dynptr_success.c      | 128 ++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/dynptr.c b/tools/testing/selftests/bpf/prog_tests/dynptr.c
index 4396560365e8..08382ed076a2 100644
--- a/tools/testing/selftests/bpf/prog_tests/dynptr.c
+++ b/tools/testing/selftests/bpf/prog_tests/dynptr.c
@@ -22,6 +22,10 @@ static struct {
 	{"test_dynptr_data", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_copy", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_copy_xdp", SETUP_XDP_PROG},
+	{"test_dynptr_copy_xdp_overlap", SETUP_XDP_PROG},
+	{"test_dynptr_read_xdp_overlap", SETUP_XDP_PROG},
+	{"test_dynptr_write_xdp_overlap", SETUP_XDP_PROG},
+	{"test_dynptr_skb_load_overlap", SETUP_SKB_PROG_NONLINEAR},
 	{"test_dynptr_memset_zero", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_memset_notzero", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_memset_zero_offset", SETUP_SYSCALL_SLEEP},
diff --git a/tools/testing/selftests/bpf/progs/dynptr_success.c b/tools/testing/selftests/bpf/progs/dynptr_success.c
index b668ebd61fc7..b6c3abb66e4b 100644
--- a/tools/testing/selftests/bpf/progs/dynptr_success.c
+++ b/tools/testing/selftests/bpf/progs/dynptr_success.c
@@ -759,6 +759,134 @@ int test_dynptr_copy_xdp(struct xdp_md *xdp)
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
+int test_dynptr_read_xdp_overlap(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	__u32 lin = data_end - data;
+	struct bpf_dynptr ptr;
+	char *dst;
+
+	bpf_dynptr_from_xdp(xdp, 0, &ptr);
+	if (fill_xdp(&ptr, lin - 10, 84)) {
+		err = 1;
+		return XDP_DROP;
+	}
+	dst = bpf_dynptr_slice_rdwr(&ptr, lin + 10, NULL, 64);
+	if (!dst) {
+		err = 2;
+		return XDP_DROP;
+	}
+	err = bpf_dynptr_read(dst, 64, &ptr, lin - 10, 0);
+	if (err)
+		return XDP_DROP;
+	if (check_xdp(&ptr, lin + 10, 64, lin - 10))
+		err = 3;
+	return XDP_DROP;
+}
+
+SEC("?xdp")
+int test_dynptr_write_xdp_overlap(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	__u32 lin = data_end - data;
+	struct bpf_dynptr ptr;
+	char *src;
+
+	bpf_dynptr_from_xdp(xdp, 0, &ptr);
+	if (fill_xdp(&ptr, lin - 64, 118)) {
+		err = 1;
+		return XDP_DROP;
+	}
+	src = bpf_dynptr_slice_rdwr(&ptr, lin - 64, NULL, 64);
+	if (!src) {
+		err = 2;
+		return XDP_DROP;
+	}
+	err = bpf_dynptr_write(&ptr, lin - 10, src, 64, 0);
+	if (err)
+		return XDP_DROP;
+	if (check_xdp(&ptr, lin - 10, 64, lin - 64))
+		err = 3;
+	return XDP_DROP;
+}
+
+SEC("?tc")
+int test_dynptr_skb_load_overlap(struct __sk_buff *skb)
+{
+	struct bpf_dynptr ptr;
+	char ref[24];
+	char *dst;
+
+	bpf_dynptr_from_skb(skb, 0, &ptr);
+	if (bpf_dynptr_read(ref, 24, &ptr, 20, 0)) {
+		err = 1;
+		return 0;
+	}
+	dst = bpf_dynptr_slice_rdwr(&ptr, 10, NULL, 24);
+	if (!dst) {
+		err = 2;
+		return 0;
+	}
+	if (bpf_dynptr_read(dst, 24, &ptr, 20, 0)) {
+		err = 3;
+		return 0;
+	}
+	if (bpf_memcmp(dst, ref, 24))
+		err = 4;
+	return 0;
+}
+
 char memset_zero_data[] = "data to be zeroed";
 
 SEC("?tp/syscalls/sys_enter_nanosleep")
-- 
2.54.0

