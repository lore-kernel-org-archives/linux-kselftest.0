Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558D126C03
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 03:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775620027; cv=none; b=cFN9V/yC7TNYj1XhzqLA4Cv5pyRZ4XUL7tAuNoLA2t9kgNmQD/EtUytzOFB3VNCpY1jgujMXeOTzIbSttt8H+mcsA8fG2IZhDeHJ6GQ9fsReVs0ZSCQI7djVBFKFcQ8r+VoNMR8tTsoYyGuH52JNz1fw6IQDrBrVSEk7ORsCbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775620027; c=relaxed/simple;
	bh=qcV42KYEemU5riSTjc6YXQrEjjsTBdVPiuqNE8v7kl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YN00oFLESn7FKsC+7VFjkoBzFmbBC8UETv7BSWqHoLbzc6r19mLyZZ08bVClQNbEWP7vPvriBy3/3QoujwkC+lGhqGwLAfpAf8CFFEOjH6rV6BfD6c90FcaOLekGpvUBPD2SnIUzP+a9eElZzEvmMkpzrAQAFYR5hkbud3TxJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpkFwlzz; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpkFwlzz"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7927261a3acso50577667b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 20:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775620025; x=1776224825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDq9GzdF3GTXYAI+d4YHY/mPxeR+u0QCqSkXrW51+Yo=;
        b=SpkFwlzzQmYfscXIlDaIiVVkmkLrKaVlbQWodbevxZP2Hu0Tfgwg8ogiCeu5ka9VuY
         EIH9XcEGTBOuB61dQkWHDx1rIYVUq0r+wgctui6HCoyvGR9m1AsoWxtcUqQ+BgGZRi3W
         qA7VTsqOtSN2mhn0HD/ugwCF/vsVignSTwvZuQDgpuges/iYF7y2qeAfr+aVuANo1DfQ
         l1+5AucCrldeS9Jq1XCmPcpDuM80jMYXrHBVc15pTYuS6M6CE3WRUzTp8XaAG18XgsIF
         6OZGJlImYj4Ku6bv3JcKfogVgNj8c1oFsSDzTFUaIblMbtY0HNmS8jSIapuOrQ7Czxj/
         dk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775620025; x=1776224825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZDq9GzdF3GTXYAI+d4YHY/mPxeR+u0QCqSkXrW51+Yo=;
        b=qjQfksEM5dRe9RPlK3npxMS0I84WV1dgZIfqoGI0RrWqIgE6FhqcGnm6wDtnfDNHFr
         QEehSKLe30u5pbDO8cVOFJBvFmxDqSwOfr7odYCdV/oaHc6jIMnpkXfEIKTDLlWMz6K2
         ToEh0wU7NGbxfcCkTgmPNB830ZlxaO4ntDu3i6KYCfLlMJnPOePbuRqg/lM7fZwy1H0S
         c1BrXXwr0DKfQCEppBHPKoehr4eTV1EE0GYi3buJ76N7A0swek9sU9c10DZ8eKHC3jMB
         eocst4/lcSdEUDYYxgZuDoIz9nNK8TfB1vli6qjck16XCTtLmAluRDnhux4nFGh5tY+o
         SxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK8Yf5xb36FEQctr68uMXYOKHbccTdSYOF8E7RksSY7sGAIb0tQyCPCBxDOOwJzmR0c2dI5DoezNqvY6EnQuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyikMkoe8OAYaaNtXkGyWvK6UqSnsC3EnxPMjfhCbm6lTbSXbWD
	ZWzgL7yKRJOT+BBxOn8iywnsxfEHAoY0lFHzzXltmGQ+CMEVkqqSpAT0
X-Gm-Gg: AeBDieu7VAIIm1Wi6rQQYZLyZWnBv4fJjC9dHjAiR7Pyiepd/CKAxrHxW55ZpBJMLQ3
	fK7AcvZ24fHPwXGr8lpvDSAmhfgVNm/4OX+AABtvbH+V4YoHOCuq6BdE+OYkbpXAiXzx/may3Cr
	Kt59MrdeBjMJrAL79FiK6YbkQ+LYXe7I5EHvyPdpD3WgmDc3WYGtybD+rN8AH3TcC6YKhtWg0OP
	mrrJMMSMQJCvsxBuNGjTZQSjLUFvmtKU56UzRDgSACb/WS0QHGeRDTXECRUDF8Mf1MGWLXFNspP
	l/tMNv3fcp8arFdUwXLJZaTA89II5Q4PkiXbmDkDpT4q/tlw4WjkgAzrjTRoZQtZEuXgyYgNuF5
	uDdy368plIwqdSRkcZt4QzqUg2M/mY8m9JMgEfpoCfatwHv4hb2+VAJSGExuXma9paeRf3F6/aL
	+H5/quPOrHPIfzcg+peMAXBYLHL1/7zaWMGqnu3ML1TDDX0HnUGomHKKbQTkOB0iAGkOTPXqZmv
	ftfDqXkrHQNUfl5Tane+Mf16ZPrv1GdY/GXms8wwTUsDRfr7RukwvQanY72qoT5rSUN/O0ZPkhJ
	CQ==
X-Received: by 2002:a05:690c:dc9:b0:79e:9cc1:ede7 with SMTP id 00721157ae682-7a4d62545a3mr195592387b3.10.1775620025220;
        Tue, 07 Apr 2026 20:47:05 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370df155csm79129167b3.36.2026.04.07.20.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 20:47:04 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	horms@kernel.org,
	syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v4 2/2] selftests/bpf: cover short IPv4/IPv6 inputs with adjust_room
Date: Wed,  8 Apr 2026 11:46:23 +0800
Message-ID: <20260408034623.180320-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408034623.180320-1-sun.jian.kdev@gmail.com>
References: <20260408034623.180320-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a selftest covering ETH_HLEN-sized IPv4/IPv6 EtherType inputs for
bpf_prog_test_run_skb().

Reuse a single zero-initialized struct ethhdr eth_hlen and set
eth_hlen.h_proto from the per-test h_proto field.

Also add a dedicated tc_adjust_room program and route the short
IPv4/IPv6 cases to it, so the selftest actually exercises the
bpf_skb_adjust_room() path from the report.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../selftests/bpf/prog_tests/empty_skb.c      | 40 +++++++++++++++++--
 tools/testing/selftests/bpf/progs/empty_skb.c |  7 ++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/empty_skb.c b/tools/testing/selftests/bpf/prog_tests/empty_skb.c
index 438583e1f2d1..c9fcb70cbafb 100644
--- a/tools/testing/selftests/bpf/prog_tests/empty_skb.c
+++ b/tools/testing/selftests/bpf/prog_tests/empty_skb.c
@@ -10,8 +10,8 @@ void test_empty_skb(void)
 	struct empty_skb *bpf_obj = NULL;
 	struct nstoken *tok = NULL;
 	struct bpf_program *prog;
+	struct ethhdr eth_hlen;
 	char eth_hlen_pp[15];
-	char eth_hlen[14];
 	int veth_ifindex;
 	int ipip_ifindex;
 	int err;
@@ -25,7 +25,9 @@ void test_empty_skb(void)
 		int err;
 		int ret;
 		int lwt_egress_ret; /* expected retval at lwt/egress */
+		__be16 h_proto;
 		bool success_on_tc;
+		bool adjust_room;
 	} tests[] = {
 		/* Empty packets are always rejected. */
 
@@ -46,6 +48,28 @@ void test_empty_skb(void)
 			.err = -EINVAL,
 		},
 
+		/* ETH_HLEN-sized packets with IPv4/IPv6 EtherType but
+		 * no L3 header are rejected.
+		 */
+		{
+			.msg = "veth short IPv4 ingress packet",
+			.data_in = &eth_hlen,
+			.data_size_in = sizeof(eth_hlen),
+			.ifindex = &veth_ifindex,
+			.err = -EINVAL,
+			.h_proto = htons(ETH_P_IP),
+			.adjust_room = true,
+		},
+		{
+			.msg = "veth short IPv6 ingress packet",
+			.data_in = &eth_hlen,
+			.data_size_in = sizeof(eth_hlen),
+			.ifindex = &veth_ifindex,
+			.err = -EINVAL,
+			.h_proto = htons(ETH_P_IPV6),
+			.adjust_room = true,
+		},
+
 		/* ETH_HLEN-sized packets:
 		 * - can not be redirected at LWT_XMIT
 		 * - can be redirected at TC to non-tunneling dest
@@ -54,7 +78,7 @@ void test_empty_skb(void)
 		{
 			/* __bpf_redirect_common */
 			.msg = "veth ETH_HLEN packet ingress",
-			.data_in = eth_hlen,
+			.data_in = &eth_hlen,
 			.data_size_in = sizeof(eth_hlen),
 			.ifindex = &veth_ifindex,
 			.ret = -ERANGE,
@@ -68,7 +92,7 @@ void test_empty_skb(void)
 			 * tc: skb->len=14 <= skb_network_offset=14
 			 */
 			.msg = "ipip ETH_HLEN packet ingress",
-			.data_in = eth_hlen,
+			.data_in = &eth_hlen,
 			.data_size_in = sizeof(eth_hlen),
 			.ifindex = &ipip_ifindex,
 			.ret = -ERANGE,
@@ -108,17 +132,27 @@ void test_empty_skb(void)
 	SYS(out, "ip addr add 192.168.1.1/16 dev ipip0");
 	ipip_ifindex = if_nametoindex("ipip0");
 
+	memset(eth_hlen_pp, 0, sizeof(eth_hlen_pp));
+	memset(&eth_hlen, 0, sizeof(eth_hlen));
+
 	bpf_obj = empty_skb__open_and_load();
 	if (!ASSERT_OK_PTR(bpf_obj, "open skeleton"))
 		goto out;
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		if (tests[i].data_in == &eth_hlen)
+			eth_hlen.h_proto = tests[i].h_proto;
+
 		bpf_object__for_each_program(prog, bpf_obj->obj) {
 			bool at_egress = strstr(bpf_program__name(prog), "egress") != NULL;
 			bool at_tc = !strncmp(bpf_program__section_name(prog), "tc", 2);
+			bool is_adjust_room = !strcmp(bpf_program__name(prog), "tc_adjust_room");
 			int expected_ret;
 			char buf[128];
 
+			if (tests[i].adjust_room != is_adjust_room)
+				continue;
+
 			expected_ret = at_egress && !at_tc ? tests[i].lwt_egress_ret : tests[i].ret;
 
 			tattr.data_in = tests[i].data_in;
diff --git a/tools/testing/selftests/bpf/progs/empty_skb.c b/tools/testing/selftests/bpf/progs/empty_skb.c
index 4b0cd6753251..44326f5cc8bb 100644
--- a/tools/testing/selftests/bpf/progs/empty_skb.c
+++ b/tools/testing/selftests/bpf/progs/empty_skb.c
@@ -35,3 +35,10 @@ int tc_redirect_egress(struct __sk_buff *skb)
 	ret = bpf_clone_redirect(skb, ifindex, 0);
 	return 0;
 }
+
+SEC("tc")
+int tc_adjust_room(struct __sk_buff *skb)
+{
+	ret = bpf_skb_adjust_room(skb, 4, BPF_ADJ_ROOM_NET, 0);
+	return 0;
+}
-- 
2.43.0

