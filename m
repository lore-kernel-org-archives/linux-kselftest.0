Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B624E8E0C
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558013; cv=none; b=Ez2gg+SZrz20fdEF5XYT9JplpHxNhso/HvVSP/OOPu1FATscFk71YNCqxg/IIii4AMiqoQprabepZ46EPSAJll+/9rokM+7VS+zG8ZQs3CqsGeDDc9yp3eWkU4g/uZBbdixlq5ljLQ3Icolh0br4aMM92235pOcMCnWyWbKjQkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558013; c=relaxed/simple;
	bh=ZZp0FXqP6ehaWkXjbXrqhJ+mxFtZdYGV4kcnUZ+5mPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OlgsCeRC9NdoqCbDJEELNW3STpc7ygyg16TMl0/cjrBEC0CGFPfVdrcVueJiEGSvhjVmVC8WwGMIhHVH4xvSG+taAGUd5fNLGQgSzTmed2e0QarMDA7Yo6trZcjbT6reLXrSFnb2XFPuFH483L7eUbd9QinIkCi0sMi9px4AOnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W08uIdYP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W08uIdYP"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300816so2048135ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789557996; x=1790162796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9ViUhwGOM7OIB5s/olFkj6i9s8IeWq2eOJA0tjaMKk=;
        b=W08uIdYPF6SqcnXWAKNJxOGcv4+Zh0qDmq3cAZlbM1Z1KfRCbRM1xsWQA35PUshP6q
         8FPiH9fD9QcdCxL3w2VzJ9qhqivUK4kGu1XqkjjcWLYKfR2y0UBaoanbnh+3mIAtaQIF
         4HJ/EGP8C2DfZrGzaF1hzpuz/8r21C1Si4UPPsV/JOdJm7TAM8M58pzci/AGM1CpcPQn
         aqTc/7dAxUQsyXIVSfE3FL/8OUy9k8Ob/Irig3Cy9Ojg0jYGtN4RGSXQ8Rha+osdTbhc
         C0/I/KT7aJXJpOxTW7b4FbbNdfOO7SCpZOVvz9/YKcrQsp4h+rK4CoW0JQ5S0ThRMsaC
         WzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789557996; x=1790162796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9ViUhwGOM7OIB5s/olFkj6i9s8IeWq2eOJA0tjaMKk=;
        b=M6+mpM0YStj8FjfbW4UOX3epfrYaCp5Zw2fPwY5M8B5laJ+OXkQdnzMGatYNM1tze6
         JfC5Pure3q+CH/FdlRkLCwjW3Xm3XWxMKVtonGqV1fdCrkpctlxV6mhYSUPTwoqsqDJc
         piQcBeAezBWVY0BT3xqABIQclLEclAm3FEW0AXVVxkdYRTVQ8UlGe4RNShVK6JHKP/hB
         GjZ8lf9rZ8X74UbwkjstfitATjRm+9C7omyV/xleAHMd3mrhi4kO30Mp6ZJTODeytx07
         sJcQQ9dEERHyGyK6VYd5CaCSGCcyRVCbRyr3AkUvv8s80K0Wh0RHaxFLwd05kudTSbW8
         s6Iw==
X-Forwarded-Encrypted: i=1; AKwUvBy/x4/tpACJGGn1c0C4hnXDaZhTSMK6AXHMPu7w55v7lIzrDEfxHCqsmMZS/5v6AoeASPsfblNhbdiUZb/UeuI=@vger.kernel.org
X-Gm-Message-State: AFuF++lC1325YRm6fMyMljMfHOJbRr1u+OS68rZUidmhTrHdDPZXw5RI
	IbVq32InoKi0hVP+6G8J/kSTfrHyWKqWKVQd0fGWf9o0yNWJ//fWdIAr
X-Gm-Gg: AYBFou2p2jBXgIRimuoio83QrTchBPnPyNPtzQXgsAcr7c2ZP2POb/UCNZIjV2WPKnF
	yzqqzYXbfeJSgMNM3YVqSiRLC8B9Nonk9vJGqVEvOxghwLA2PiCuzq9Rac3jHXlU1e/W/H5dAXU
	pQ/ORNg3MEy/rs5FetmKkouxhptYaH/z1t+ybyGAknly8HKnzmSyFESI5iVQH30MUd9x0GNpqT8
	iiqsyvxrIfYAGBdYc9H/a8zWSxAMQUZxxyiW2U3pkg/Ao5MYZSOq3PwC32pN/HkMg/COMyFwZD/
	YkmY0mTD3Y3FmlPB7mAJ/iwtq32BR9QMGHaRmSa96fnaQyrkXjyHW8DhRNXJAgIiG/go0a3CRxr
	NorF6cpAGGpgcStWKslTS8fSWOM/IQHqYq5dpUj+FGgQvK8KzwQPMcFFcanJhBLCQax42DBJpNp
	R11U8npaOpOry75k7tMt3WHkPC/ngJampCjrz5ilwDn8FDqGHCI5BZW9MP3chD2pLjUcyd/V0A5
	CkJNHb167TMCy5vuwV2pDPT3HjNCuVcTG2CNiQlztEd850JDJQq8DearOYxCnJL9+bw8UsGNlli
	MIapj8UTjNWVCXCWs4+Z/N8=
X-Received: by 2002:a17:903:1a2d:b0:2db:3d84:efff with SMTP id d9443c01a7336-2dd8e8b20a3mr27548885ad.2.1789557995925;
        Wed, 16 Sep 2026 04:26:35 -0700 (PDT)
Received: from blackbox ([2401:4900:8838:4a03:4141:6b61:e799:72f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe2esm10102775ad.6.2026.09.16.04.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:26:35 -0700 (PDT)
From: Madhav Khosla <madhav.khoslaa@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: alexis.lothore@bootlin.com,
	Madhav Khosla <madhav.khoslaa@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
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
	bpf@vger.kernel.org (open list:BPF [SELFTESTS] (Test Runners & Infrastructure)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:XDP (eXpress Data Path):Keyword:(?:\b|_)xdp(?:\b|_))
Subject: [PATCH v2 bpf] selftests/bpf: Fix csum_partial() dropping trailing byte on odd length
Date: Wed, 16 Sep 2026 11:25:53 +0000
Message-ID: <20260916112554.413933-1-madhav.khoslaa@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csum_partial() computes num_u16 = len >> 1 and only sums that many
16-bit words, so the last byte of an odd-length buffer never gets
added to the checksum. RFC 1071 says it should be padded with a zero
byte and summed as one more word, not dropped.

This backs build_ip_csum(), build_udp_v4_csum() and
build_udp_v6_csum(), used by flow_dissector_classification.c and
xdp_metadata.c to hand-build packets. No current caller builds an
odd-length payload, so nothing fails today, but a future one would
get a silently wrong checksum.

Also bump flow_dissector_classification's TEST_PACKET_LEN from 100 to
99 so this actually gets exercised instead of staying latent.

Without the fix and with TEST_PACKET_LEN=99, flow_dissector_classification
fails under vmtest.sh:

    test_flow_dissector_classification:FAIL:test third port unexpected
    test third port: actual 0 != expected 10
    #137/6   flow_dissector_classification/ipv6:FAIL
    #137     flow_dissector_classification:FAIL
    Summary: 1/0 PASSED, 0 SKIPPED, 1/6 FAILED

Kernel just drops the packet over a bad checksum. With the fix, both
flow_dissector_classification and xdp_metadata pass.

v1 -> v2:
- comment style: opening /* on its own line, per BPF selftests style
- Retarget the Fixes tag to bcc00987bc56. commit f4504af68575
  ("selftests/bpf: move ip checksum helper to network helpers") moved
  the helper, but sizeof(iphdr) is always a multiple of 32 bit words /
  4 Bytes (iph->ihl counts in 4-byte words), so the odd-length path
  was never reachable through build_ip_csum(). csum_partial() first
  gets called with a length that isn't guaranteed even in
  bcc00987bc56, via build_udp_v4_csum()/build_udp_v6_csum().
- TEST_PACKET_LEN 100 -> 99 so an existing test catches this instead
  of the bug staying unexercised

Fixes: bcc00987bc56 ("selftests/bpf: add network helpers to generate udp checksums")
Link: https://lore.kernel.org/bpf/DLG5TIIHIMC2.2YCCY0UX86YQF@bootlin.com/T/#t
Signed-off-by: Madhav Khosla <madhav.khoslaa@gmail.com>
---
 tools/testing/selftests/bpf/network_helpers.h     | 15 +++++++++++++--
 .../prog_tests/flow_dissector_classification.c    |  2 +-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/network_helpers.h b/tools/testing/selftests/bpf/network_helpers.h
index 75133119c04a..878c9fc5c37c 100644
--- a/tools/testing/selftests/bpf/network_helpers.h
+++ b/tools/testing/selftests/bpf/network_helpers.h
@@ -129,12 +129,23 @@ static __u16 csum_fold(__u32 csum)
 
 static __wsum csum_partial(const void *buf, int len, __wsum sum)
 {
-	__u16 *p = (__u16 *)buf;
+	const __u8 *p = buf;
 	int num_u16 = len >> 1;
 	int i;
 
 	for (i = 0; i < num_u16; i++)
-		sum += p[i];
+		sum += ((const __u16 *)p)[i];
+
+	/*
+	 * RFC 1071: an odd-length buffer's trailing byte is paired with
+	 * a zero pad byte to form the final 16-bit word.
+	 */
+	if (len & 1) {
+		__u16 tail = 0;
+
+		__builtin_memcpy(&tail, p + len - 1, 1);
+		sum += tail;
+	}
 
 	return sum;
 }
diff --git a/tools/testing/selftests/bpf/prog_tests/flow_dissector_classification.c b/tools/testing/selftests/bpf/prog_tests/flow_dissector_classification.c
index 80b153d3ddec..421dfa6c4ea3 100644
--- a/tools/testing/selftests/bpf/prog_tests/flow_dissector_classification.c
+++ b/tools/testing/selftests/bpf/prog_tests/flow_dissector_classification.c
@@ -27,7 +27,7 @@
 #define TEST_NAME_MAX_LEN (32 + SUBTEST_NAME_MAX_LEN)
 #define MAX_SOURCE_PORTS 3
 #define TEST_PACKETS_COUNT 10
-#define TEST_PACKET_LEN 100
+#define TEST_PACKET_LEN 99
 #define TEST_PACKET_PATTERN 'a'
 #define TEST_IPV4 "192.168.0.1/32"
 #define TEST_IPV6 "100::a/128"
-- 
2.55.0

