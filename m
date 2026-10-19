Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228727FB37
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391764; cv=none; b=MtRNFDNvyjInvBdZGIvLwwhlRMSipJu8CBrwDT/0VxM4XSoUwbDhHmWdi8SiXjUnGQAdaXfqL459PTssIZupKFYmDAWzg5LbzffNMdFea55c2mQwJJXTE2S6t2xluZ7AFtPdvVLGR3P//6wtMU/B0z78FgWMQqxB53W/vQUElOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391764; c=relaxed/simple;
	bh=PX9zZj4iTg9WzoWwoCz6MvS21cdwDV4voOBVLw9O6pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QsK6X3QF4LrIoJExIbuf3+esL9wine505NQXiyEa8poPa/VyMO/9s4hkidEZYVL5W6o26EJBwK6X64sShMmX740cHG0G/yK5kjMRf2jocaRtl6cCW9EhDcS5SULwFceIb881MzS1RidoJiUdvGnAEY/eZki30VD4JE2i3uCBaJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYVYgvkf; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYVYgvkf"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so2033711eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 23:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792391762; x=1792996562; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yFQatoeAsD0uy3HEOPLZwlpYB4M5Dzpm+OdX5z+s5s4=;
        b=cYVYgvkfPdscFvhdjQ+ja9tAa2jhRirfYFvFiVJeT83Kc6Z6KMDe8MBRAL6p8YZiBU
         RcX0qxIGWCiGtDnGcOJnH54rSUe579OI3mcCq6EN+5EXujv7kOLpW6PPmiJDZN0ISqo5
         Bgms6d68dCbj9TacB8ALnDQCzlVXcGdjBSJSKzkW2q7aK+MRNc+l+A/DNoJljKvsyKsm
         9NlKnJwLsJr500KvPCuyRjxP0jo5hixWn3pLt80t2U8FBpvTDOtxfgrnJMjQGkwQpxDo
         /zW0Mu09+NcFayZVb16OLZtXLOYoMJXOJ2K/4VBIgp58Lhkr4BDgUgo6OmPSTXtXrBih
         SL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391762; x=1792996562;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yFQatoeAsD0uy3HEOPLZwlpYB4M5Dzpm+OdX5z+s5s4=;
        b=KmcAZ2Ha7ECxr3N2HJFAhDWHr09FbyJ6WsQfZrwU5G5nyfb+ZG/asX0/cATc0reIiD
         xwIOnMgjOr+bEAhM5cFYWoqds4zbjxIFAInK6L99oOqp8gOm9NXUR+X32q/KvFoXAB2/
         sXHd5IvGySzYrmU21Mmpqxw0kB9BL4cv3Rb+wRC/6YKvc1dexcZ1edTQqIsY77hWdRUu
         brmLDM37vbWyJx4bBulcXMWjTCeWIH25LOwnca6aFDhMtmbDtbYDiM/bCU/O4sONNuIp
         U5sxaDhmvLXwWHact+dWI/bzIXQAVhwJv3yZOzBCCLm3e7oOy2uAT/cP916DnFXDlpMa
         mfvA==
X-Forwarded-Encrypted: i=1; AKwUvByshzhHLC8jPgvwiTwx5BhkOLMyX+zdlqj+H4VpFdbfnA5NWFS+vYyLJeZgu6zddFcmcKeYowt5H/qyk0eX2dc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHli66YZybmVSKuKPPzm9z6dn6MFBZT4W+XIuhv50n4RVEq9zu
	DXX0tvOOgIFQ0PrIkhSNNtcn6P65cYnZ1Hf2Fn6/rAwi0u+cWnDL6V3f
X-Gm-Gg: AYBFou2C2hqmeEZDUbcJo3NbXBc9CS18E/QMKo9ODMSG8rMa4AZSov/iSY1e2krcn+e
	dC1MmodkUhTAFtFAipueanivnJtFQ9Oi0TuErdFqnWjSp9mHTfgAeYWmOv86BdL1ws9KyLLcDnm
	A218h9eDWaA/VeSRrz+btxTSjtLGMgJiYfqhUSSYaiwcrx+sT3GeT5toK7Z2jjJ4Ll5tlluD7CM
	hnQv4rvgauR0UDjQtblazTruLi1T8csMmbUxbP26Lh7QSvtKwWssq557JXVC4mYS09x/inTIGdB
	YJWm9ORZSmvBhldqIFKSneLs0/LJ5ditVCzzJkqJ/PceAIN6cnvZf3YWBuA+21bKtmcTMEYO3cA
	5dUO72+sTQCQA4VJTGqTaU+yrgpOOO/Jix3Ivq7tX7yIqZABlwyM5jKoq5ktQ6md/WTGBIU7DUs
	fXLrzMaQ/gK0WqMonS2dtigeJwgqL5hyBH3ZIlHYn+N18UMFl8Lz+/FbJ2ddIZm5eczQ==
X-Received: by 2002:a05:701b:458e:10b0:15d:d124:b7c7 with SMTP id a92af1059eb24-185120a8bbfmr9772701c88.10.1792391762455;
        Sun, 18 Oct 2026 23:36:02 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm30785476c88.12.2026.10.18.23.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:36:01 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 14:35:55 +0800
Subject: [PATCH bpf-next v2] selftests/bpf: Time tc_edt from its first
 packet with data
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-selftests-bpf-tc-edt-serial-v2-1-41c3813e7916@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEq61WoC/42NTQqDMBBGryKz7pQkGK1d9R7FRRonGvCPTAgW8
 e6NnqDLx/t43w5MwRPDs9ghUPLslzmDuhVgBzP3hL7LDEqoSgrRINPoInFk/KwOo0XqIp4RM2J
 jK21cLd2j1JALayDnt6v+hnM+0xahzWbwHJfwvW6TvPxfD0miRFcrEqV2qqz0q5+MH+92maA9j
 uMHtgQgdNAAAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

tc_edt sends 1MB over a TCP connection that a BPF program shapes with
EDT, and checks that the rate it measures is within 2% of the target
rate. The transfer takes about 200ms, so the margin is about 4ms.

The measurement starts before send_recv_data(), which first creates the
sender thread and accepts the connection. On a KASAN kernel, x86_64 VM
with 32 vCPUs, that takes 0.7ms when idle and up to 4.7ms with all
CPUs busy, while the BPF program spreads the data over 200.08ms in the
median. The test also fails without test_progs -j where everything runs
slower, e.g. on s390x and with ASAN in BPF CI.

Have the BPF program note when the first packet with data goes out, and
start the measurement there.

tc_edt run 100 times on the same VM, idle and with 32 busy loops in the
background, before and after this patch:

                 before                after
  idle           0 of 100 failed       0 of 100 failed
  busy loops     3 of 100 failed       0 of 100 failed

Fixes: b0f82e7ab6fb ("selftests/bpf: integrate test_tc_edt into test_progs")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Start the measurement at the first packet with data instead of running
  tc_edt serially, as it also fails without -j (Alexei)
- Add before/after data

v1: https://lore.kernel.org/r/20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com
---
 tools/testing/selftests/bpf/prog_tests/test_tc_edt.c | 13 ++++++++++---
 tools/testing/selftests/bpf/progs/test_tc_edt.c      | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c b/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
index 462512fb191f1..1391978a3e309 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
@@ -90,7 +90,7 @@ static void cleanup(void)
 	remove_netns(SERVER_NS);
 }
 
-static void run_test(void)
+static void run_test(struct test_tc_edt *skel)
 {
 	int server_fd, client_fd, err;
 	double rate_mbps, rate_error;
@@ -113,12 +113,19 @@ static void run_test(void)
 	if (!ASSERT_OK_FD(client_fd, "connect client"))
 		return;
 
-	ts_start = get_time_ns();
 	err = send_recv_data(server_fd, client_fd, TX_BYTES_COUNT);
 	ts_end = get_time_ns();
 	close_netns(nstoken);
 	ASSERT_OK(err, "send_recv_data");
 
+	/*
+	 * Start from the first packet with data rather than before
+	 * send_recv_data(), which also sets up the sender.
+	 */
+	ts_start = skel->bss->tx_start_ns;
+	if (!ASSERT_GT(ts_start, 0, "tx_start_ns"))
+		return;
+
 	rate_mbps = TX_BYTES_COUNT / ((ts_end - ts_start) / 1000.0);
 	rate_error =
 		fabs((rate_mbps - TARGET_RATE_MBPS) * 100.0 / TARGET_RATE_MBPS);
@@ -138,7 +145,7 @@ void test_tc_edt(void)
 	if (!ASSERT_OK(setup(skel), "global setup"))
 		return;
 
-	run_test();
+	run_test(skel);
 
 	cleanup();
 	test_tc_edt__destroy(skel);
diff --git a/tools/testing/selftests/bpf/progs/test_tc_edt.c b/tools/testing/selftests/bpf/progs/test_tc_edt.c
index 4f6f03122d61d..69f4b16acbef6 100644
--- a/tools/testing/selftests/bpf/progs/test_tc_edt.c
+++ b/tools/testing/selftests/bpf/progs/test_tc_edt.c
@@ -24,6 +24,7 @@ struct {
 } flow_map SEC(".maps");
 
 __uint64_t target_rate;
+__uint64_t tx_start_ns;
 
 static inline int throttle_flow(struct __sk_buff *skb)
 {
@@ -62,7 +63,8 @@ static inline int throttle_flow(struct __sk_buff *skb)
 	return TC_ACT_OK;
 }
 
-static inline int handle_tcp(struct __sk_buff *skb, struct tcphdr *tcp)
+static inline int handle_tcp(struct __sk_buff *skb, struct tcphdr *tcp,
+			     uint32_t hdr_len)
 {
 	void *data_end = (void *)(long)skb->data_end;
 
@@ -70,8 +72,12 @@ static inline int handle_tcp(struct __sk_buff *skb, struct tcphdr *tcp)
 	if ((void *)(tcp + 1) > data_end)
 		return TC_ACT_SHOT;
 
-	if (tcp->source == bpf_htons(9000))
+	if (tcp->source == bpf_htons(9000)) {
+		/* Note when the first packet with data goes out */
+		if (!tx_start_ns && skb->len > hdr_len + tcp->doff * 4)
+			tx_start_ns = bpf_ktime_get_ns();
 		return throttle_flow(skb);
+	}
 
 	return TC_ACT_OK;
 }
@@ -94,7 +100,8 @@ static inline int handle_ipv4(struct __sk_buff *skb)
 		return TC_ACT_SHOT;
 
 	if (iph->protocol == IPPROTO_TCP)
-		return handle_tcp(skb, (struct tcphdr *)(((void *)iph) + ihl));
+		return handle_tcp(skb, (struct tcphdr *)(((void *)iph) + ihl),
+				  sizeof(struct ethhdr) + ihl);
 
 	return TC_ACT_OK;
 }

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-tc-edt-serial-9c65af71f845

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

