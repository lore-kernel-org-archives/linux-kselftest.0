Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275433ED105
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814935; cv=none; b=NJT9FI+/cJSR/Oa3jHg/sWR0M1F/GsrkdKFV2qGwOx0SpB3/FIIRnj/iiJI1TEcnrO+fiKyHqJfP1hy9ZoTji/eoLVlOpshAtc4hO4Kw12IhqWzJ1cCXhL44vKIP5jiJdYoMphEC9vzv2kcXa08zfUazzQ3YZ6B2VJAJrhwm9jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814935; c=relaxed/simple;
	bh=3B4mgEkMMg1k+RH7odWpE7epbKwExfi7ZwW6SF4mnhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fP13x6HKCLzL9+kB2BDX8bUm2sVymOdVohHNDnjZHpx/Do5WVMvN18c3PJLIHVfO0is0KrIqqy00IKBc8xvN8cUpm2lgSbJvZfGWD9lVSW6dLYP24qZdmPI8dFdlrMTwzxWweloJy7nfGgMEoJjYetOyEQq+vHVuPG6K6ShvfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilETqyQe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilETqyQe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c825c88744so26246815ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782814933; x=1783419733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/t9kcr2j0sJat9b7E1mstFc45YE/VNCBoHjz8KUyS8Y=;
        b=ilETqyQeYMMc6wd3zO9se+Y8+lxLjXTyQDc6FfgiQnmQR58T+oNy5CBfQL2zaog1mz
         hoxBeb8WdGJANiH9vNAmrUOEBbxtRhe/568qTG4vrwuMK1xOhfAqdUWQ723Cc9K7g7aF
         U3jCufWY/y1nkT6xH5PKyYYAHz0KUikRNRMmbnUXF8rYX6n1jI7Iev21Xfx8BvUhqyEv
         6KMhLT6riQXecUh1P2z8WqLLa5Lk3MUzpTzDqOXN4UsmoRiWofEwzAu81KrVgKV0ErSx
         acYf1gaU4bHCLQaX6xafuxQAGtTKxwi83bejOQuIyakxRzgd7yEazbqZASdRPEtmUhA/
         3hkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814933; x=1783419733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t9kcr2j0sJat9b7E1mstFc45YE/VNCBoHjz8KUyS8Y=;
        b=sIQ/2sWE9etXDdPOQ/AnSkGnEBkdWegO0M9ODYsnC9MbiCR5E6aDFvlXHpZztfWf4M
         d/LcJ2+N1v+2x8W6No6KiG9/1TGev6dCwm4zhEiWOOvbD4H9yUGjL50M46oy5ri+sOAq
         X4D810kRmVKjFJ05W0UFECg1rPtNlClE3s+q802yK0/rMX9S6kY8WwTSmciG/hBA2yMs
         9MvlGBkdbuXThfjPQzFhKGATNwT46hNsSphmUFdBMkb3ym3JNeotapYqYsBHvHZTwlI1
         CQX3QK5FOOj3xYA6+PmRymTlyxgjYK8q3B22xOJCw4+00CVH27j0brfYY7C6b0Ks/nzX
         S0FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVKF/T7Xc/nFOEfJQSDJyIY48n0zYgWBtFeN4Bgv14D9T1vL7cxNCYK7QZ53oyiYUOBWfvnRSEwRHzlsvXBFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOCJ8zvsUbYx6jfS1FJiNi0L4QdmAs6EajtlEhT4OBetMOqRv
	7oWJ/TjVJuq0yJ7Kzcf0LW3x+xXa9MHhmN25x5DXT9ItBidWMHygV6r0
X-Gm-Gg: AfdE7clUTDfrB7kGY9z4HY9PZH6B1G3dBm7nO/AXpBDWY1wZ03d64Sv8OIw4vVl6FeW
	9CTSNAKJV5qHyITHbMqgQZ+TGWNXCd7OgeyDpgv3bTJYpUfQDbZPkjcxAf5U1FSOKmQ8VPfo7zR
	C7UKXFTeXwKhgA93HPB8hy37pcdVW6kmDMT7ui8OPS1Hssk20uzCQJFny8Z43SYjyCkE6A7oAuJ
	ZbOCMK2t+PGAaTmIwfF8N0a2BTp6tJIf6T1QiLbL/tPf1OS7NcQ998lt0B2XIT9zcZRmf8A5k8M
	QEWVHVYav1D4SlqJGsF2xfN6MTLWhLV70e7sOINlb3apnmTsydVqKoFrz09rBLzL++Tm6lW673f
	LitsicUGmNqC/y8yQL7hlCfKZr3xFx6R5kd+ja1VV9cl1pXQd1J16F+sJln1Sk7fCXpxYOep9cA
	pNM4+D
X-Received: by 2002:a17:903:234d:b0:2c9:a9c0:80b6 with SMTP id d9443c01a7336-2ca2ea10374mr23824275ad.34.1782814933036;
        Tue, 30 Jun 2026 03:22:13 -0700 (PDT)
Received: from houminxi ([166.0.188.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c7456bsm10696285ad.25.2026.06.30.03.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:22:12 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Minxi Hou <houminxi@gmail.com>,
	aconole@redhat.com,
	echaudro@redhat.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2] selftests/net/openvswitch: add output truncation test
Date: Tue, 30 Jun 2026 18:22:08 +0800
Message-ID: <20260630102208.29140-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test_trunc exercising the OVS_ACTION_ATTR_TRUNC action. The test
verifies truncation in three steps: first confirm normal forwarding
works, then apply trunc(14) which truncates packets to the Ethernet
header and verify ping fails, then restore normal forwarding and
verify connectivity recovers.

The trunc action sets OVS_CB(skb)->cutlen, causing pskb_trim at
output time. With trunc(14) the IP payload is stripped, so the
receiver drops the frame and ICMP echo reply is never generated.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 2954245129a2..fef21eb4a129 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -32,6 +32,7 @@ tests="
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
+	trunc					trunc: output truncation
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -443,6 +444,71 @@ test_action_set() {
 	return 0
 }
 
+test_trunc() {
+	sbx_add "test_trunc" || return $?
+	ovs_add_dp "test_trunc" trunctest || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "test_trunc" "trunctest" "$ns" \
+			"${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add 10.0.0.1/24 dev c1
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add 10.0.0.2/24 dev s1
+	ip netns exec server ip link set s1 up
+
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify connectivity without truncation"
+	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 || return 1
+
+	ovs_del_flows "test_trunc" trunctest
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	info "add truncated forwarding flow"
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+		'trunc(14),2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify ping fails with truncation"
+	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should fail with trunc(14)"
+		     return 1; }
+
+	ovs_del_flows "test_trunc" trunctest
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify connectivity restored without truncation"
+	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 || return 1
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {

base-commit: cef9d6804030793cf8b8796fd6936197d065dd3e
-- 
2.54.0

