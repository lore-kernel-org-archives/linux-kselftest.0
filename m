Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211A5299959
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777724545; cv=none; b=M2Igo7HyflxNhyKiaKB6ZaPC/O06aOSe2Jjf0A3SD0flWz25QFthW/xVXyR1D/Rp6eigWCCQVlmpkAxXAvAGDkB1g2fuhc+roa4rvOtm0lKn+SP648XLUrlu0bptild/9GGADpSErjDpaaeaPXewf+RvCpHpWc8pA/By8168QKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777724545; c=relaxed/simple;
	bh=eNgPQCfzBOg0fqoatydEMR2gASJHTKxfsAmSc/DzQck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMckgFcVirIUx9lSTTnTzQ2RwwMFj6ZUW4rAC3aTd3pZXvEMxvArKUDUUeawVbLwHyXWyGA2su8ZJLNBlzVkkK3kiLEpJovA4Ps4ePo8e1zPe8XLbIjXZt8wG7gEsbbsey6dQvYn6l5ZNE7RkLQWbDWfDOTowW4ZDWJfw+9A+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvRzGExi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvRzGExi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891f625344so27554025e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 02 May 2026 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777724542; x=1778329342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iK1LIqf5TWkNLZJw4cxgH7vA0Wpgf+PvbVG/5GG9MDY=;
        b=qvRzGExi/tC3CClAvZ+wE3pqfczn/IAhGMsor0hlUXKd6DiFN2AknexlCXotwx07q5
         x1lqmFBlZ9/ylOYneOFjfv0j7QjhfATWADKOKtEP322YK2yTcALjprDwDf15lqHQZkaE
         uMXO90wn8XjLSmPpJihI/qWKa6efLkWRodr7Nl88/CybOhmyqSQ72FP2f30GLBWFP2OG
         NRwTulKbuidxsaXIzXHDpjpUVGqhMsivfa63P7fdx/Bf08Mu5M9Yy5bXEp/BHb2973HN
         14PCmadQ1cnoFojrJuPKktxmG8g0h7fAlqZwnFpfv8MKfGFT9TE/1MUEZQfTza4ICeSy
         vqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777724542; x=1778329342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK1LIqf5TWkNLZJw4cxgH7vA0Wpgf+PvbVG/5GG9MDY=;
        b=cXtycYig06L/ZBqHRortoFY10/eCu7xfZLEQ0nBG7vPEjvfaP0WV1+MaJHAZ4gY252
         uAz9F+6reADwgyZPTc4i/5MK2a+YiUTwsGCjJot2u5/ZL7DGCHsHQMu4BzdQ7+1D1S3X
         DvUzPzO6QxbLfDxMKiVChoFhWH8D7wQRQthFOLXfTIEwybtlF05z9UHv+UpEDR7Rx0lo
         rLRiPHtdl0kqeaGwb/+fczhRvILF0uPsfjAuUDyMxKIzrtbu6KBHUjehf8p0ZWLxk22L
         0D8afDRottop1E4mP2wL8p8ct302UF5FrGQWtwOZUqswcE9tskH/pbZUKOGJ0C6KNCh9
         hSDg==
X-Forwarded-Encrypted: i=1; AFNElJ/ejT9O8qAdPcSqCMOikh+/GSyqjEGkJbsEWYdeYBwyceDxAy1TaO/pAhbcve6OVn/CrEpMfU8KqjZ9LGc78Z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVr4OJOPLQwa2gjv68Bu40k/g0SMt9EBKjv8kFiWQ/OJg1Wia0
	v8xAK1CnbfsG3aONw9YyzRLe+EvTwQtAfoOUL7O/eKWSCM25NiEmZ38K
X-Gm-Gg: AeBDiet287vtcuxUkmNSvrgw0u/neAEQI2VtBG1vxxRWln2mnyFWMWNcwzu6X2rwTvg
	f1l2MRYvmuAjw9LKDkApVeQWW98GZtfRH1K0am02bOw7w5TZGMTiNr6Z4svFYaVa4k+143zguNn
	wto4MuoM758XbD5fl+h53BWEK2ZVvVP9RGXNm4oVhOL+Cstywm6MoqBOaGxnuq4hPdhZyIhwed+
	cvx4Wh5IhUwtMSeC/qt2IwcI2WKS1x6fTmUOHwL7uuqVWcgJbybzujTwg0DcsOD6TU4nBigQZd3
	GF972v/Eg+0uRrYmNK7qT5hIuxwWs5+q54HPAjSSCiqr9rT/c1VjRqzqkNl67cOMuv8xQAGVaFl
	sV3o2b8MxzJ2RnItrgG0/SbBq5FP6mGtVsQwqhNkE4r1au4Lcn8IA3jJjYwENChPWSDdbnmnCxA
	vUdc+kqMITEyntmssg7ruc+RHl9rsfE/PyDsVjhgWVCdlIrx+/kK/R6CsYeBP8kE/JxskZ/9M=
X-Received: by 2002:a05:600c:c170:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48a970ab55bmr41491275e9.5.1777724542426;
        Sat, 02 May 2026 05:22:22 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba865fsm111764855e9.10.2026.05.02.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 05:22:22 -0700 (PDT)
From: Vastargazing <vebohr@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vastargazing <vebohr@gmail.com>
Subject: [PATCH] selftests: net: fib_nexthops: detect kernel splats from torture tests
Date: Sat,  2 May 2026 15:22:19 +0300
Message-ID: <20260502122219.262611-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The four nexthop torture subtests delete and re-add a group member
while ping -f and mausezahn keep traffic flowing through the same
group, so on each iteration the read side runs nh_grp_entry_stats_inc()
while the write side goes through remove_nh_grp_entry(). That is the
exact race fixed in commit b2662e7593e9 ("net: nexthop: fix percpu
use-after-free in remove_nh_grp_entry").

The reason it never tripped these tests is the assertion. Each subtest
ends with "if we did not crash, success", so a KASAN splat without
panic_on_warn=1 lands in dmesg and the test still prints [OK]. The UAF
above would have been visible to a KASAN run of fib_nexthops.sh; the
torture loop just did not bother to look.

Drop a marker into /dev/kmsg before each torture subtest, grep for
KASAN/UBSAN/KCSAN/KFENCE/Oops/"kernel BUG at" lines once the load is
killed, and fail the subtest with the offending lines printed if any
match. The check is skipped when /dev/kmsg is not writable so the
existing pass behaviour is preserved on restricted setups. No new
TEST_PROGS, no new test mechanism, just close the assertion gap.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Vastargazing <vebohr@gmail.com>
---
 tools/testing/selftests/net/fib_nexthops.sh | 69 ++++++++++++++++++---
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index ac868a731694..41c8767fc310 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -128,6 +128,47 @@ run_cmd()
 	return $rc
 }
 
+# Helpers used by the *_torture subtests below. The torture loops drive
+# concurrent nexthop updates and packet flood, but until now they only
+# checked "did the kernel crash". A KASAN/UBSAN report without
+# panic_on_warn=1 lands in dmesg and is silently ignored. These helpers
+# place a marker into /dev/kmsg before the load starts and grep for
+# splat lines after it stops. If /dev/kmsg is not writable the check
+# is skipped and the previous pass behaviour is kept.
+torture_dmesg_marker=""
+
+torture_dmesg_baseline()
+{
+	torture_dmesg_marker=""
+	[ -w /dev/kmsg ] || return 0
+
+	torture_dmesg_marker="fib_nexthops-torture-$$-$RANDOM"
+	echo "$torture_dmesg_marker" >/dev/kmsg
+}
+
+torture_dmesg_check()
+{
+	local since
+	local found
+
+	[ -z "$torture_dmesg_marker" ] && return 0
+
+	since=$(dmesg 2>/dev/null | \
+		awk -v m="$torture_dmesg_marker" '
+			$0 ~ m { f = 1; next }
+			f { print }
+		')
+
+	found=$(echo "$since" | grep -E \
+		'KASAN:|UBSAN:|KCSAN:|KFENCE:|Oops:|kernel BUG at|general protection fault')
+
+	[ -z "$found" ] && return 0
+
+	echo "    Kernel splat detected during torture run:"
+	echo "$found" | sed 's/^/    /'
+	return 1
+}
+
 get_linklocal()
 {
 	local dev=$1
@@ -1333,6 +1374,8 @@ ipv6_torture()
 	run_cmd "$IP route add 2001:db8:101::1 nhid 102"
 	run_cmd "$IP route add 2001:db8:101::2 nhid 102"
 
+	torture_dmesg_baseline
+
 	ipv6_del_add_loop1 &
 	pid1=$!
 	ipv6_grp_replace_loop &
@@ -1348,8 +1391,9 @@ ipv6_torture()
 	kill -9 $pid1 $pid2 $pid3 $pid4 $pid5
 	wait $pid1 $pid2 $pid3 $pid4 $pid5 2>/dev/null
 
-	# if we did not crash, success
-	log_test 0 0 "IPv6 torture test"
+	# Pass only if we did not crash AND no kernel splat appeared.
+	torture_dmesg_check
+	log_test $? 0 "IPv6 torture test"
 }
 
 ipv6_res_grp_replace_loop()
@@ -1387,6 +1431,8 @@ ipv6_res_torture()
 	run_cmd "$IP route add 2001:db8:101::1 nhid 102"
 	run_cmd "$IP route add 2001:db8:101::2 nhid 102"
 
+	torture_dmesg_baseline
+
 	ipv6_del_add_loop1 &
 	pid1=$!
 	ipv6_res_grp_replace_loop &
@@ -1404,8 +1450,9 @@ ipv6_res_torture()
 	kill -9 $pid1 $pid2 $pid3 $pid4 $pid5
 	wait $pid1 $pid2 $pid3 $pid4 $pid5 2>/dev/null
 
-	# if we did not crash, success
-	log_test 0 0 "IPv6 resilient nexthop group torture test"
+	# Pass only if we did not crash AND no kernel splat appeared.
+	torture_dmesg_check
+	log_test $? 0 "IPv6 resilient nexthop group torture test"
 }
 
 ipv4_fcnal()
@@ -2123,6 +2170,8 @@ ipv4_torture()
 	run_cmd "$IP route add 172.16.101.1 nhid 102"
 	run_cmd "$IP route add 172.16.101.2 nhid 102"
 
+	torture_dmesg_baseline
+
 	ipv4_del_add_loop1 &
 	pid1=$!
 	ipv4_grp_replace_loop &
@@ -2138,8 +2187,9 @@ ipv4_torture()
 	kill -9 $pid1 $pid2 $pid3 $pid4 $pid5
 	wait $pid1 $pid2 $pid3 $pid4 $pid5 2>/dev/null
 
-	# if we did not crash, success
-	log_test 0 0 "IPv4 torture test"
+	# Pass only if we did not crash AND no kernel splat appeared.
+	torture_dmesg_check
+	log_test $? 0 "IPv4 torture test"
 }
 
 ipv4_res_grp_replace_loop()
@@ -2177,6 +2227,8 @@ ipv4_res_torture()
 	run_cmd "$IP route add 172.16.101.1 nhid 102"
 	run_cmd "$IP route add 172.16.101.2 nhid 102"
 
+	torture_dmesg_baseline
+
 	ipv4_del_add_loop1 &
 	pid1=$!
 	ipv4_res_grp_replace_loop &
@@ -2194,8 +2246,9 @@ ipv4_res_torture()
 	kill -9 $pid1 $pid2 $pid3 $pid4 $pid5
 	wait $pid1 $pid2 $pid3 $pid4 $pid5 2>/dev/null
 
-	# if we did not crash, success
-	log_test 0 0 "IPv4 resilient nexthop group torture test"
+	# Pass only if we did not crash AND no kernel splat appeared.
+	torture_dmesg_check
+	log_test $? 0 "IPv4 resilient nexthop group torture test"
 }
 
 basic()
-- 
2.51.0

