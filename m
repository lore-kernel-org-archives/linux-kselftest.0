Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722242;
	b=X6/pvr+ek7blYcTVxTkyHspowpWdnT4U9nokKvz567pWyKACMP/85JWikXcdKIJKMU+J
	 tgV+bESwi9ehqAx0HhRWmUSM1ZtNKAtQHEtb6YwQHE/MrVGdWm5BJVd4BkHd7EnItS9CW
	 7VQ5rIfW/FBNwd+HUYHdEByg0PVWA2XKNH0HeQlbSI/CQJSaql4EW7thYrRcLAT/LnxOw
	 YKbpVU8TYO5zKBShb1RWLtVXmtfeXGFsTj7rKICXbPdkmttr4qEfbAQ432803P/Dnhw9p
	 32MD+oA0hdm0ePapQC8xh1Zovf8dHclnEM18zckwieGwTYDH/90biTGLBiUHrAEmBGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
	b=DfOFkrFN+Txm1VHRQa1cf0BX9YRKOMNp765Igou2l+es+b+fYwRnYKVO4LctxFJyd8eC
	 DFZJrDb/ezaHB7PRXtY719neWT8KfE84lUoOc5VXwBY9xyHTWSKAHO6w4uJ7K1h3x9wzD
	 IABk1X76ql+2uF1Gioz9uCa5SnM20/fN8hzmMrH3CDo6puf0b9mERXT8ASfsNeo4jg3J8
	 P1BGn/N4nJtDx+5hJ5Vd2rlsbRz/WMdQYgtKZFoLICdgzpkpifygauEr3AHbTzurZW7mY
	 SeHkbhmV45QTuKwIdfwqNC5gGGeP46uDP9VAVl4/MVO5g+F2PONfdg7AGgQPt2pM3Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ve1amdfe;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52395606A682
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 19:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52395606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ve1amdfe
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so6078386f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 11:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722240; x=1796327040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
        b=ve1amdfez05VbyrTbnbkfDlGB6eqbuV2YRVktN1E3nJFBTY+vWxzxHg/apgbJ2FVbV
         IOsgA/iSbqD1jr4sRO6OwITDt5ebwxS7rAi1uWBXen35EmmjBK0lCoRsKM8OiUW9IDpC
         4pcE1RXZ4AaOu1YjQlwGzk1gt1wIAE78qnuivN3hSJv5BH6mUpiCWaeWk8ulzTLGnZAm
         kbJ2U/otb7Ys0kzn9ekVeCM2rcPw0iavB7Oj+9y10gFkh2xKI9deERr6Iz0+yb8RmfR1
         OSxd4lRnjtW35GKR+Tn0taq4V8eMsTcf+Xb+1FA1FUtOek+qfTUWKBJr+bKobV8mczmI
         RaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722240; x=1796327040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
        b=Pb2rvnbgvvi+TUG6gdeY13zCt+guDKCdEzF5EnqHwdNzo2wU3WNpUG5xjLAf+f75SL
         OcPTGaMRVpBMPDY1HXkDrgnNxJ5QHxP9vBlWmGFSXsm39EkDIosInilYQm4qeWrvOhyp
         25Kxq9JgqowLYmErKqalHWHqKveArU6z9qnwJPfZxUEoyxJQ42i77zHpx36OobGdnCz9
         DvtoS2+NsuxP7gEm1DVo6h612MViC46aM0YBvtIu3KcigC6l1owF6q7ftg5WqZoDBG1q
         8f8QMj/3LEHNKU8fLU8F5dfWINydAGkAqOqqJ1eZ78ZrpYI6WLf0sgSl8xic+idusLp2
         IOuQ==
X-Forwarded-Encrypted: i=1; AL+hErGBdFas2t7TtKV4FpOnO/uEk9B4LtKiEPB64KTtcqLEMc+qPB1AgZCrQz2UtEYPVJcSV2DqG3ZyxAR4T2WVTCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U6JODt2EzKX81arVXLE1K2DUyXhwcKLAUjnhvEMtqY4Paq0Gm
	cAHZ9nOO2Ol7AALh6fuNIa1b2MQlegqmCOV3bDOzFjq0Es8BZSXchQk=
X-Gm-Gg: AZFdTZc1G28BtjwHR/uDMvG9cNsYhq5qylOU4tPviZA2FDxlelswsoRDq8hrcG8ni5o
	Pnwp1+7oQjZtzSR8OyJ6ue9TMt6QsXwp1hiBvdgtkiHHODTfDbiEAmG1qwzQwFK74e2DAz0lNFy
	ylmE0TPNOD/QJ6qZlBr8jm0AubDPy/yFB7nwYHWeXz6LGGdEc1f94iV5Vs91i/7T/Sxxvim2Y88
	ehE7yNunGyhbtUmxKVachLZrwhbXCHxHBiCNRxy7P+d7S4pFMfanKGLX+DIHM6NhtSpLobbbkx0
	sgk2P2gL5PaC9XMFVYzmla3x0OrjQISXn/bh8zZBogJheGjRZ3mCUANsKUWYqZjNIFga+xOZ8n+
	uvM9Cnk7jmg2aiu3jhuwodnjlslRAt/uKxF7dC9OprfWfLaAAPrwQG6IRkGhC1knfRDeHqwDmSv
	kOD9YwMb7YsN+ki9vxnwK+byXizZ6bxw9GyoMowd1SjbvEJ4lgVgYRKp3tnA5ktifbf0DL2KNQX
	zZ93m/qjEZjVT80aIyeyvifR2exJXRQBnfI2gWzJ9bR/TjRWM6BS0lcX+Wkk6qej4/t57F/6Uv7
	dZZDPk2Vh9VPyeMOadAjmhass8p/n+ysh5dN/SNsJPNbVH23MKpXgGw83nAPRFyu2kQkSX0oDWD
	M1V3n0AHt+whcxhdb2kQJBeR8zCNbCy/9tufbMcXtbknDWIy9ZkljwcogKQoKrbU6X2XL8euZOD
	Vzo2u/jQIysBOBN+fKY2UP0/Or9l4EFubV
X-Received: by 2002:a05:6000:2f89:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4ae0a0b0809mr37498634f8f.42.1795722239670;
        Thu, 26 Nov 2026 11:43:59 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:59 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 4/4] selftests/bpf: Check that map values are 8-byte aligned
Date: Thu, 26 Nov 2026 20:43:47 +0100
Message-ID: <20261126194347.42466-5-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126194347.42466-1-tphilipp@gmail.com>
References: <20261126194347.42466-1-tphilipp@gmail.com>
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

The verifier assumes that map values are 8-byte aligned. Add a test
that looks up an IPv4 lpm_trie value, a BPF_F_NO_PREALLOC hash value
and a devmap value from an XDP program, stores the returned addresses
in global variables and checks them in user space.

The program does not execute any instruction that requires alignment,
so on an affected kernel the test fails instead of crashing it.
Without the previous patches the lpm_trie and devmap checks fail on
64-bit architectures, and the hash and devmap checks fail on 32-bit
architectures.

This patch was written with the help of an AI coding assistant
(Claude Opus 5.5).

Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 .../bpf/prog_tests/map_value_align.c          | 51 +++++++++++++++++++
 .../selftests/bpf/progs/map_value_align.c     | 48 +++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_value_align.c
 create mode 100644 tools/testing/selftests/bpf/progs/map_value_align.c

diff --git a/tools/testing/selftests/bpf/prog_tests/map_value_align.c b/tools/testing/selftests/bpf/prog_tests/map_value_align.c
new file mode 100644
index 000000000..91898a052
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/map_value_align.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+#include <network_helpers.h>
+#include "map_value_align.skel.h"
+
+#define IFINDEX_LO 1
+
+/* The verifier assumes that map values are 8-byte aligned */
+void test_map_value_align(void)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts,
+		.data_in = &pkt_v4,
+		.data_size_in = sizeof(pkt_v4),
+	);
+	struct bpf_devmap_val dval = { .ifindex = IFINDEX_LO };
+	struct { __u32 prefixlen, data; } lkey = { .prefixlen = 32 };
+	struct map_value_align *skel;
+	__u64 val = 0;
+	__u32 key = 0;
+	int err;
+
+	skel = map_value_align__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	err = bpf_map__update_elem(skel->maps.lpm, &lkey, sizeof(lkey),
+				   &val, sizeof(val), BPF_ANY);
+	if (!ASSERT_OK(err, "lpm_update"))
+		goto out;
+	err = bpf_map__update_elem(skel->maps.hash, &key, sizeof(key),
+				   &val, sizeof(val), BPF_ANY);
+	if (!ASSERT_OK(err, "hash_update"))
+		goto out;
+	err = bpf_map__update_elem(skel->maps.devmap, &key, sizeof(key),
+				   &dval, sizeof(dval), BPF_ANY);
+	if (!ASSERT_OK(err, "devmap_update"))
+		goto out;
+
+	err = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.lookup), &topts);
+	if (!ASSERT_OK(err, "test_run"))
+		goto out;
+
+	ASSERT_NEQ(skel->bss->lpm_addr, 0, "lpm_lookup");
+	ASSERT_EQ(skel->bss->lpm_addr & 7, 0, "lpm_value_align");
+	ASSERT_NEQ(skel->bss->hash_addr, 0, "hash_lookup");
+	ASSERT_EQ(skel->bss->hash_addr & 7, 0, "hash_value_align");
+	ASSERT_NEQ(skel->bss->devmap_addr, 0, "devmap_lookup");
+	ASSERT_EQ(skel->bss->devmap_addr & 7, 0, "devmap_value_align");
+out:
+	map_value_align__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/map_value_align.c b/tools/testing/selftests/bpf/progs/map_value_align.c
new file mode 100644
index 000000000..bd0663a13
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/map_value_align.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+struct lpm_key {
+	__u32 prefixlen;
+	__u32 data;
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_LPM_TRIE);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__uint(max_entries, 1);
+	__type(key, struct lpm_key);
+	__type(value, __u64);
+} lpm SEC(".maps");
+
+struct {
+	__uint(type, BPF_MAP_TYPE_HASH);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__uint(max_entries, 1);
+	__type(key, __u32);
+	__type(value, __u64);
+} hash SEC(".maps");
+
+struct {
+	__uint(type, BPF_MAP_TYPE_DEVMAP);
+	__uint(max_entries, 1);
+	__type(key, __u32);
+	__type(value, struct bpf_devmap_val);
+} devmap SEC(".maps");
+
+/* Addresses of the map values, checked by user space */
+__u64 lpm_addr, hash_addr, devmap_addr;
+
+SEC("xdp")
+int lookup(struct xdp_md *ctx)
+{
+	struct lpm_key lkey = { .prefixlen = 32 };
+	__u32 key = 0;
+
+	lpm_addr = (unsigned long)bpf_map_lookup_elem(&lpm, &lkey);
+	hash_addr = (unsigned long)bpf_map_lookup_elem(&hash, &key);
+	devmap_addr = (unsigned long)bpf_map_lookup_elem(&devmap, &key);
+	return XDP_PASS;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.54.0 (Apple Git-157)

