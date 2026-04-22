Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4A53D331E
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863922; cv=none; b=oPROS2rmWNB3J7zv/XdL3Rva/Y1bYVaxnlfhsmNYpYe8qplQWMMeo8xyFbTn7jQ3Tz8mJ9MgOqJ+SzD705ECELSnnOIFgMT89j9jEBD2gwBipnJLW/5gdKc/021p1LCTANSv2CBw4jKo8BiF97nzp8f5cP+9G+Ht92ZR7qpmH1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863922; c=relaxed/simple;
	bh=S3w2SiBkuP+XZ0VGSoPCvw5mDdlWVPD5qe2D5ZB+nfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMwnKly8lMN9WTnoKl8/9bHAmHJ/bSCwLdCIgw0/X8uTAM7v2jBbcoq2F5p6+8GSEEHVHGqWRjESbugTz4gpl66A1zJRcbONTWNw+TQ7j3GcTjdAwR295KTg4bxWSx0vXMIui7AMGaLZoCKgjr13OtI8aYxZIJnR8AF/rFnFUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szUHn4++; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szUHn4++"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so6170566e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776863918; x=1777468718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmGAlvlxWs8/umIxWqRxtuHab2nnEuxDktgVlQFqEV8=;
        b=szUHn4++z3GJzi2Txn+Ldmc60J7pOo7qwtoQ3R0ONuAkYzldtNortZAa25H/X/TpMd
         kv78ulhMYU4k1go4ohy80HA6jluH+PwDyNd02warn8GJmJoxlLZNEdo0cvGpucy3zj39
         CWEtCiItlIHDNaw3NtounrE8fAEA+x5nD535hhuMyR7m1nvBWN5rMMWmPw7zOJdVWnJV
         9A47xlraGzS3LFQl/P5JrquJ9kN8lQvxb4tQ+bq+B7uuqzhtvERAWrm0fdU7cS7JJoBj
         b8J7JZhTn4KpeCYuYz2h8wmNkEBSNP5BVj48mq7igAMMgZpQftcxhmuCNbyezrgju+DX
         ajTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863918; x=1777468718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vmGAlvlxWs8/umIxWqRxtuHab2nnEuxDktgVlQFqEV8=;
        b=TD3UilF7I6hHLtjnpMZVPSZvZgh1jTGhzwThJi+fAKMWN5U7ku4/Jo8p2s8c7TRh/Y
         YtY2XWmrt7ZEk0Nwhj/Mx5K083YMl+T9+ui4eup+wpTm4Lq0fQWCAUJTJgdVEkcFySBc
         NuNgcIgNnsBX58J9tOx+8OQniCQ6xVa8z+ky9+b4nN80h8TtsFHPvLInGnTcRhSYRmNY
         bftFvKICQ1ItYIbbu5rA+nUQhkOigKjeaY7xBfigDF9DophRoYgQhtlait7tC/FP06WR
         f2bc/sHTTF3GYx9ptO7cOE6Ycb4VfiooXaq6xebyXlQj2MD1FmvT9ppNO32xKNFFhXIi
         56mw==
X-Forwarded-Encrypted: i=1; AFNElJ92MQK5beEYYOngZy2JrAafYEfkeiKG/3sitFpn+Nm6vVorgqq9rHYKPENqfmcG1FNXmbBmLv/tuS9LIkLkezI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKeIGgM4plSviKPl1rE4c21xYSen/pDsEtAk8WUZRf8mAWjmt
	bznnkDU1CfGKofC6pMIe1PclV82U2w/JbBWk3QIWsRX/Rgf6G6bGmYnV
X-Gm-Gg: AeBDievzL15Q7mQAQvaXUJ1zPJYK9bAlZdIXqqdzHx01KWllT/Bnlu6gwOVXZU0fwR4
	Fb0lXuiSUZ9zxwECQT8Q1zf5+HXhk7R/k7Rek94T5KM3+GaSrY18h90rj7sb+Rf+HZioFeIajkw
	hImUQ3D9etrnH+IbfGllC8AkFiPJstmmZlIUu71ZRSaMn85Dfm4BjE/kivbwi1+3X9MM6eXHlV/
	mlmWN2+ek0NU/cj46rRTYqYqrC60VJXRTcf3JlegavA4Htzx2wwIZ0zpATwv/a2UoqffFag6v+U
	cncnOx1IXQCEvyPzqfiwfM2SIAiFInyyGptq7E2KHhwdjA0MjQ5tDo+mQbiI4RG2ORP+BpKkawf
	Neokx1oUGfxA+4Aa/mc0N1n1HHX2XmsnNv93q82FtpxV0kyx8RmOqu/ItfKxKIrPvZYKWAew5W7
	c3NqB+Ql/iaeCk+GoKzav63xio8mMLItHuONha5F7n1R2y2w+ii8wg4L3nD1iSCummUtsszQc=
X-Received: by 2002:a05:6512:2248:b0:5a4:992:e8b2 with SMTP id 2adb3069b0e04-5a4172e1c8bmr8319129e87.21.1776863917376;
        Wed, 22 Apr 2026 06:18:37 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a418376d0asm4447656e87.0.2026.04.22.06.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:18:37 -0700 (PDT)
From: Vastargazing <vebohr@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: netfilter-devel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	Vastargazing <vebohr@gmail.com>
Subject: [PATCH 1/1] selftests: netfilter: add nft_ct timeout destroy race test
Date: Wed, 22 Apr 2026 16:18:18 +0300
Message-ID: <20260422131818.106417-2-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260422131818.106417-1-vebohr@gmail.com>
References: <20260422131818.106417-1-vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a netfilter kselftest for the nft_ct timeout object destroy race
fixed by commit f8dca15a1b19 ("netfilter: nft_ct: fix use-after-free in
timeout object destroy").

Keep creating new TCP connections from one namespace while repeatedly
flushing and recreating the table that owns a ct timeout object. This
exercises concurrent packet processing against the timeout object
teardown path without requiring external traffic tools beyond bash,
nft and ip.

On a KASAN kernel, a regression in the RCU lifetime handling should
show up as a slab-use-after-free report in nf_conntrack_tcp_packet().

Assisted-by: GitHub Copilot:claude-sonnet-4-6
Signed-off-by: Vastargazing <vebohr@gmail.com>
---
 .../testing/selftests/net/netfilter/Makefile  |   1 +
 .../netfilter/nft_ct_timeout_concurrency.sh   | 116 ++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 tools/testing/selftests/net/netfilter/nft_ct_timeout_concurrency.sh

diff --git a/tools/testing/selftests/net/netfilter/Makefile b/tools/testing/selftests/net/netfilter/Makefile
index ee2d1a5254f8..bcf53a1ef7ec 100644
--- a/tools/testing/selftests/net/netfilter/Makefile
+++ b/tools/testing/selftests/net/netfilter/Makefile
@@ -25,6 +25,7 @@ TEST_PROGS := \
 	nft_audit.sh \
 	nft_concat_range.sh \
 	nft_conntrack_helper.sh \
+	nft_ct_timeout_concurrency.sh \
 	nft_fib.sh \
 	nft_flowtable.sh \
 	nft_interface_stress.sh \
diff --git a/tools/testing/selftests/net/netfilter/nft_ct_timeout_concurrency.sh b/tools/testing/selftests/net/netfilter/nft_ct_timeout_concurrency.sh
new file mode 100644
index 000000000000..79876cdfb2df
--- /dev/null
+++ b/tools/testing/selftests/net/netfilter/nft_ct_timeout_concurrency.sh
@@ -0,0 +1,116 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Stress nftables ct timeout object destruction while new TCP flows keep
+# attaching the object.
+
+net_netfilter_dir=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+source "$net_netfilter_dir/lib.sh"
+
+checktool "nft --version" "run test without nft tool"
+
+read kernel_tainted < /proc/sys/kernel/tainted
+
+# Default to 80% of the global timeout but keep this stress test short.
+TEST_RUNTIME=$((${kselftest_timeout:-30} * 8 / 10))
+[[ $TEST_RUNTIME -gt 20 ]] && TEST_RUNTIME=20
+
+PORT=12345
+
+cleanup()
+{
+	cleanup_all_ns
+}
+
+load_ruleset()
+{
+	ip netns exec "$ns1" nft -f - <<EOF
+table ip ct_test {
+	ct timeout tcptime {
+		protocol tcp
+		policy = { established: 5s }
+	}
+
+	chain output {
+		type filter hook output priority filter; policy accept;
+		ct state new ip daddr 10.0.1.2 tcp dport $PORT counter ct timeout set "tcptime"
+	}
+}
+EOF
+}
+
+flush_table()
+{
+	ip netns exec "$ns1" nft flush table ip ct_test 2>/dev/null || true
+	ip netns exec "$ns1" nft delete table ip ct_test 2>/dev/null || true
+}
+
+rule_packets()
+{
+	local packets
+
+	packets=$(ip netns exec "$ns1" nft list chain ip ct_test output 2>/dev/null |
+		sed -n 's/.*counter packets \([0-9][0-9]*\) bytes.*/\1/p' |
+		head -n1)
+
+	if [ -n "$packets" ]; then
+		echo "$packets"
+	else
+		echo 0
+	fi
+}
+
+trap cleanup EXIT
+
+setup_ns ns1 ns2 || exit $ksft_skip
+
+if ! ip link add veth0 netns "$ns1" type veth peer name veth0 netns "$ns2" > /dev/null 2>&1; then
+	echo "SKIP: No virtual ethernet pair device support in kernel"
+	exit $ksft_skip
+fi
+
+ip -net "$ns1" link set veth0 up
+ip -net "$ns2" link set veth0 up
+
+ip -net "$ns1" addr add 10.0.1.1/24 dev veth0
+ip -net "$ns2" addr add 10.0.1.2/24 dev veth0
+
+if ! load_ruleset; then
+	echo "SKIP: Could not load ct timeout ruleset"
+	exit $ksft_skip
+fi
+
+ip netns exec "$ns1" bash -c '
+	while :; do
+		exec 3<>/dev/tcp/10.0.1.2/'"$PORT"' 2>/dev/null || true
+		exec 3<&- 3>&-
+	done
+' > /dev/null 2>&1 &
+traffic_pid=$!
+
+if ! busywait_for_counter "$BUSYWAIT_TIMEOUT" 1 rule_packets > /dev/null; then
+	echo "FAIL: Did not observe TCP traffic hitting ct timeout rule"
+	exit $ksft_fail
+fi
+
+end_time=$((SECONDS + TEST_RUNTIME))
+while [ "$SECONDS" -lt "$end_time" ]; do
+	flush_table
+
+	if ! load_ruleset; then
+		echo "FAIL: Could not recreate ct timeout ruleset"
+		exit $ksft_fail
+	fi
+done
+
+flush_table
+
+kill "$traffic_pid" 2>/dev/null
+wait "$traffic_pid" 2>/dev/null
+
+if [[ $kernel_tainted -eq 0 && $(</proc/sys/kernel/tainted) -ne 0 ]]; then
+	echo "FAIL: Kernel is tainted"
+	exit $ksft_fail
+fi
+
+exit $ksft_pass
-- 
2.51.0

