Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CCC51EDE5
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 22:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029583; cv=none; b=UbqVKc7xGYuDC6UAnEi/rKNB4/Lz3FaGVePDkqpFru4cn8FOhRD4W+UNR3CSKZiEC1CTysFdySBSBUQJqcwq/18R8N+BiynqSqtsbferi/sLKeIclOqlZmTJ6I6xuWBpQ+ft+3r+p6Oo8sWsqWGnLKy5j2F4DFhsPM9ugqmhCaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029583; c=relaxed/simple;
	bh=GRZdBlRm1lvsE5c25wt8yPbTEBC5cBBDDLkQAdXfpWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCS19Yl1wZROwENNjNYL/jelxnf1qA7YLpDdwE4+1OzKgIUP4NbingBWXS0LCNNQkniSU/4RuhYl+m2sHBH87nB1TKS/jeX1w8dSq+4Mv1dPASlGx3DbSXlJyFcjfBYgonn7mBCyEmqK8yk5C/A7E0UHQN7M65JI+Vi3+Gq7pwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=RRpMlZw4; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="RRpMlZw4"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-530c602630bso42679211cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 15:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790029581; x=1790634381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bneTXx7VbqxcZhk0NJHAAHTOdPB67K7M73RJR6TLrG4=;
        b=RRpMlZw4UOONWwAuGZcnkNdfUcmgdnlcyXc2JKBIIqeqOjMFTl2SEq7U7ONsos3TQo
         9o8ZENhwv+J/3VHbTewH3xZ0j8Hm1EkROYutruQdX9wD0CFFBW0j7kbvqp2pyw80i+dZ
         b20hRxhBjlRzto1gMQljF0Q5wk/MLJbE++8ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029581; x=1790634381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bneTXx7VbqxcZhk0NJHAAHTOdPB67K7M73RJR6TLrG4=;
        b=ppuo/n3jUaQFmTnK0GYt/ElSqa9MB6EUMFeLwfoQ2FEojcYxWEC/quhyKXDBsbvpNd
         G4oRAGKn4knj8bm+/YGVSUAI1eyxZGfFN1nZ48nXFG3neCBjG4mt0N6n6z+2hhyAy4yk
         ukCffwlZr1Tym//aXGeNBmJpY0twZ/wmhFj06osf0hX5BEirppblnJfRbHMa2Oof/yME
         DuWTaphE1vblqhvCvWPQHrX3eTmW3/9jGHcRxxvc9wII5YSCA9NAZa50wFIRJZD5iqAz
         N2g/CXb8wW9YMwuGvTSAZFOhgWA9IiVKo78qXCZ4RCCl/LNZ9jUNYawngX3MnWiw0/ZA
         WMyg==
X-Forwarded-Encrypted: i=1; AKwUvBww85q5KKSCCsV0PgDEy/CHRXmU8gE6jePe8I7wS17M4CAfdvDzS39wkBlQNqqLbHGf9zrYUaX3GCo4AY38dyk=@vger.kernel.org
X-Gm-Message-State: AFuF++kUml3YoqaUtABOSqrMiBO5vuAj37UUXJZbvL7d6xwmIIKpIxgV
	9Uy3KbEBqln/aB5j3W8G0tdRwdoUXuCOs7s+5SyZddXt5ds/8aFIK2DzZfeCz/DvwJo=
X-Gm-Gg: AYBFou3cG81851EApblzSEnVaDpo5eMoffUizQCNPcHm638AZDU8p5Jq793P6UJYoMJ
	8yJNxawueWrv5s5MSbH/zRBFVDee0Qmz3MJ7ROeyL6gKLiAgDXv5pNuDlMILN3ww3f51HBbL908
	X2fKGWGQJVThexu1A/SBasFbL8FIrKwA4k15lDRyOKaixu8+TeN6F6FLwdCW9tfiE/ErCiAy4zk
	uboD/mDp1VoFONNfWFDJBbJRQtCYk8VJrSH5/XY/rgEG1OBFWUZZI2D+NJyHuf0l0lIUpP9h4t3
	+lZqxzCP3rn4CeeQQthYIKeGBMqboGh+XFmcphFxQMq0x9m2hSqxVCNpq8VLu4ma3n8JuuSo3bp
	kkfUAuYCm9NRF49UtK2Vz5i8Z5lqfxC1ep3aZkowJz14PegVynlaw2x2KST+LYbc0VIsGDz4Gzl
	WXEmsHxZilmUNG2HK5kXlP0+4cjdwaYmGU4w8cJCmyKOfG7PuqbYgYdI6lEtip3jXmUbmLu/neh
	IptxgNNvPu2vo8EGg5XhAgvc8G0ziLUUwKjEAnvpU01Iu65ntD2lksRTramg3uoisyddSjtzE4=
X-Received: by 2002:a05:620a:29cb:b0:939:f522:b2f7 with SMTP id af79cd13be357-93c198e8416mr63207985a.33.1790029580644;
        Mon, 21 Sep 2026 15:26:20 -0700 (PDT)
Received: from com-94485.corp.openai.org ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19bc6f4bsm30675085a.44.2026.09.21.15.26.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 15:26:20 -0700 (PDT)
From: Jeff Jo <jeffjo@openai.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: check timestamp echo after an old ACK
Date: Mon, 21 Sep 2026 15:26:12 -0700
Message-ID: <20260921222609.50824-6-jeffjo@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921222609.50824-4-jeffjo@openai.com>
References: <20260921222609.50824-4-jeffjo@openai.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a regression test for a gap-filling packet whose acknowledgment has
become old. Linux first sends data to the peer. Deliver two peer data
packets out of order: the later packet acknowledges Linux's data, while
the delayed packet still carries the earlier acknowledgment. Require
the final reply to echo the delayed packet's timestamp.

Use a large jump in peer timestamps to represent the idle interval.
The test checks the echo directly, without waiting for that interval
and without packet loss or retransmission.

Packetdrill does not currently compare the timestamp-echo field (TSecr),
so the packet script alone can pass on a broken kernel. Add a shell
wrapper to check all four outgoing timestamp echoes in packetdrill's
output. Register the wrapper as the runnable test and keep the packet
script as a supporting file.

Run the test in a separate network namespace for each of IPv4, IPv6
and IPv4-mapped IPv6.

Assisted-by: LLM
Signed-off-by: Jeff Jo <jeffjo@openai.com>
---
 .../selftests/net/packetdrill/Makefile        |  5 +-
 .../net/packetdrill/tcp_old_ack_ts.pkt        | 23 ++++++++
 .../net/packetdrill/tcp_old_ack_ts.sh         | 57 +++++++++++++++++++
 3 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
 create mode 100755 tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh

diff --git a/tools/testing/selftests/net/packetdrill/Makefile b/tools/testing/selftests/net/packetdrill/Makefile
index ff54641493e9..4695d8258aa1 100644
--- a/tools/testing/selftests/net/packetdrill/Makefile
+++ b/tools/testing/selftests/net/packetdrill/Makefile
@@ -7,6 +7,9 @@ TEST_INCLUDES := \
 	../../kselftest/ktap_helpers.sh \
 # end of TEST_INCLUDES
 
-TEST_PROGS := $(wildcard *.pkt)
+# This fixture requires its wrapper to validate outbound timestamp echoes.
+TEST_PROGS := $(filter-out tcp_old_ack_ts.pkt,$(wildcard *.pkt))
+TEST_PROGS += tcp_old_ack_ts.sh
+TEST_FILES := tcp_old_ack_ts.pkt
 
 include ../../lib.mk
diff --git a/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
new file mode 100644
index 000000000000..d13f5ea4ac12
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// Run through tcp_old_ack_ts.sh: packetdrill alone does not check TSecr.
+// An out-of-order segment advances SND.UNA. The gap filler still carries
+// its original, older ACK; accepting its data must refresh TS.Recent.
+--tcp_ts_tick_usecs=1000
+
+`./defaults.sh`
+
+0.000 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
++0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
++0 bind(3, ..., ...) = 0
++0 listen(3, 1) = 0
+0.100 < S 0:0(0) win 20000 <mss 1000,sackOK,TS val 900 ecr 0>
++0 > S. 0:0(0) ack 1 <mss 1460,sackOK,TS val 100 ecr 900>
+0.200 < . 1:1(0) ack 1 win 20000 <nop,nop,TS val 1000 ecr 100>
++0 accept(3, ..., ...) = 4
+0.300 write(4, ..., 17) = 17
++0 > P. 1:18(17) ack 1 <nop,nop,TS val 300 ecr 1000>
+0.310 < P. 18:35(17) ack 18 win 20000 <nop,nop,TS val 301001 ecr 300>
++0 > . 18:18(0) ack 1 <nop,nop,TS val 310 ecr 1000,nop,nop,sack 18:35>
+0.320 < P. 1:18(17) ack 1 win 20000 <nop,nop,TS val 301000 ecr 100>
++0 > . 18:18(0) ack 35 <nop,nop,TS val 320 ecr 301000>
++0 read(4, ..., 34) = 34
diff --git a/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh
new file mode 100755
index 000000000000..4c4534a81e78
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh
@@ -0,0 +1,57 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+cd "$(dirname "$(realpath "$0")")" || exit 1
+source ../../kselftest/ktap_helpers.sh
+
+if ! command -v packetdrill >/dev/null; then
+	ktap_skip_all "packetdrill not found in PATH"
+	exit "$KSFT_SKIP"
+fi
+
+log=$(mktemp) || exit "$KSFT_FAIL"
+trap 'rm -f "$log"' EXIT
+optargs=()
+if [[ -n "${KSFT_MACHINE_SLOW}" ]]; then
+	optargs+=(--tolerance_usecs=14000)
+fi
+
+ktap_print_header
+ktap_set_plan 3
+
+for family in ipv4 ipv6 ipv4-mapped-ipv6; do
+	mtu=1500
+	[[ "$family" == ipv6 ]] && mtu=1520
+	if ! unshare -n packetdrill --verbose --ip_version="$family" \
+		--mtu="$mtu" "${optargs[@]}" tcp_old_ack_ts.pkt >"$log" 2>&1; then
+		sed 's/^/# /' "$log"
+		ktap_test_fail "$family: packetdrill"
+		continue
+	fi
+
+	# Packetdrill checks packet structure and timing but ignores outbound
+	# TSecr. Require all four observed echoes, including the gap-filling ACK.
+	if awk '
+	/outbound sniffed packet:/ {
+		count++
+		if (!match($0, /ecr [0-9]+/)) {
+			bad = 1
+			next
+		}
+		echoes = echoes (count == 1 ? "" : ",") \
+			substr($0, RSTART + 4, RLENGTH - 4)
+	}
+	END {
+		if (bad || count != 4 || echoes != "900,1000,1000,301000") {
+			print "# unexpected timestamp echoes: " echoes
+			exit 1
+		}
+	}' "$log"; then
+		ktap_test_pass "$family"
+	else
+		sed 's/^/# /' "$log"
+		ktap_test_fail "$family: timestamp echo"
+	fi
+done
+
+ktap_finished
-- 
2.55.0

