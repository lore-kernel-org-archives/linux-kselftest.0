Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF24A2F290B
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123840; cv=none; b=Ifm6GWyRMXiKeSea4IdBS3KY1Y03qSpdfildi2l2MzcUArRNhL6Xsdd8cCIQ6kRbetVfhq7MqaPqm+nxyYg2ttLzxPrDEUzzHkT7H7SxkqC4pxyfl/l1h/XTcUD/UeMepzLiGFodUoATZx8iEkIPwZLLeBzJ6K5IWLn28GYBicc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123840; c=relaxed/simple;
	bh=qkeQzWOWaxxISsl4uCQPDbfJ2pwDKTr/UDzPD99oQ98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4a2prZwNUuvLxKXNtq1IuuqzF1jZg1Qv1eFF8Y0AhgVUmlVIYKYfwEv7sHLK8MPA3gSr/y7K/hi3l2UDeTVzYNAd4S+VUU6rSenq1C2ZWtrV+o9fXKuLPQY9PbY2cGKMihsFAroVznUOm+jH+9hQCrsG1/ItZ3jcxyY4tD1iPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haUnb6/u; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haUnb6/u"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8623e5d435cso140014b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123838; x=1790728638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQQTGO16FXbzJluwZGxhoyxw7BVm8s40aDo/D7gXx7E=;
        b=haUnb6/umygpdhvmg/IzQrNUoYsT83fOZ3GTKlimFvLPhVNNle57N6zvV5U/XEHStV
         uIE7NXWgbFDP7jLarAU3vuyqbKWlmtcQtkhRzmHJ3CcijaM0xF5f+TCaE8voDLpJohkZ
         bUOjCBWthkD7SacGPtnpeJpqoPJR1Qf5hPvq1QXbiYBX5BsxPrsFeQauA0szqG3LYKlj
         W41AI2YMjXtRB20OW8ja+yqZwV9LMho69z7VqAxiGwEjlyehXJlf3BMF4LBlAZJXdJ8j
         1DpO3Juo9ElGk9lmZmrfKfwRcA6RCL4AAgKYRpf1s28hU1vJvNo3czb1Pf1J/h+UVWLQ
         uxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123838; x=1790728638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQQTGO16FXbzJluwZGxhoyxw7BVm8s40aDo/D7gXx7E=;
        b=w+qBmgYj3Ys7Mn4lvw36KLlQ75CVswbUG0zfGho2o4zqJDh83jbChZQ8qMZUzHRHXq
         ebX9dKEB+dWyQnONgSKl+5yd59BOYm8B9leZiN5H25FlfSTCezRG+M72TE2SJosdHDcZ
         2OCILP/1roB5IYr02Ak46IA9zrNdY5Ub3CBLQSgYEIs3oduXro+uNtZa8yZcM419cU37
         r9v3/+jG5ai9u9iTNK/T+sjnccKYIGbqB4C2Mz5AQlwYrTDAhZ3KrCeDnroDGV5Zl16U
         t6AnLNRtcx4RG06ma3TxoMuIX45b4vMbCPFvP+fWPxAWdNEoQTmGtOZo2xXHcpKu8+gK
         Wosw==
X-Forwarded-Encrypted: i=1; AKwUvBxO1MIBeVwhDagSQLLXipij6KYLMS1IK8LEoDgf8ZVprSdx8Wk+yXosq1zdOre1MmAc0ztfn53jpgWfgt/bBEk=@vger.kernel.org
X-Gm-Message-State: AFuF++kWtpJuI+3wcjV89btnoOAFd7fYJG/Mx7cZTcItShif1/krDpgu
	aQqIF472zjY25UTlxmxAwkSH0DZPx5Tyc8aeleIGsrLFkxdTn2/MZy0Q
X-Gm-Gg: AYBFou1QFO46Gq7otLE8nNcNbYdJ7BqYChX3FcXJfa9/qOeQ3gVz4PpihvZfJvSLxGW
	/jPxNgUB6e0eVRu9dYrZYi8CxpXgjtNfrkUOl4/bQw7swZI95aOvryZ6MivfZ47vEk3mHJZVYpM
	zhncOvfYibSzNx8ma4udy/GiiAOAXPAhi+bSolDrooK5MF/5jLf+yCn806qD8Esnp6c8Ty6V/Gk
	we1aPrpn9f/OXXYVCm/E67trDd17HHypTkJp9JRe9ZOBSFPK2n+3sqQRHxaiEm0Rk/nOkh1fQ5c
	Fa6bLqp0H3tn5BVBVhyaBXGXxUgOMi38W5E1CjqjkxCNLZtpc+BMeXriQC1hmHRfjjwfbhGsZ5W
	m1GxZ7CMl9x4dAy/DOUkmKRATdTstFRgCvXlZdjb9yNrfUMJUbt59yBZoJ4uYhNsNRQ+vWafAjP
	/2kcRLd/C3bHTBqfChfzQVjY+6+Y7aY4PNQY7DYtf2aXqi33Wp8zd2aDIWq7kRmQyElMBO/P1ly
	dnn1bfPo6g=
X-Received: by 2002:a05:6a21:1398:b0:3dd:a196:ffcd with SMTP id adf61e73a8af0-3ddf8354fd9mr736411637.29.1790123837960;
        Tue, 22 Sep 2026 17:37:17 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dff9778sm427895b3a.49.2026.09.22.17.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:37:16 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Wed, 23 Sep 2026 09:36:59 +0900
Subject: [PATCH net 4/4] selftests: net: add lwtunnel route save and
 restore test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-lwt-encap-noflag-v1-4-8de7ab6c86e9@gmail.com>
References: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
In-Reply-To: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Nikolay Aleksandrov <razor@blackwall.org>, 
 Eyal Birger <eyal.birger@gmail.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 Xin Long <lucien.xin@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4135;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=qkeQzWOWaxxISsl4uCQPDbfJ2pwDKTr/UDzPD99oQ98=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqsx8qGYKDa+Moa334x7rJOG8r+GdYWjOJwUmhN
 grU+ne16wCJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCarMfKgAKCRAq19F1Kl0b
 TeNREACzYs5nzq43SdXpSUP7sd70DgWFhqYY2j6yuqOeQuMUnL1l8Ns2/hYo8bUe1LyfpRm1Uys
 G+vTYT9fpVAdhWAuDzB9EX7W9HJIzC8lqj/ft831DL1Clj7q2ZidVRMhaBkTUxB8vSHMQIUuNuN
 Ahger3YtSbcD2GspOweoLVGUcQIzksNKxtfVs+O9RHcLjuq4FYwiR+XtyIixehGvDbl0doOeGc1
 b6ksWyKalDqCsuBzD+XekRBVAyo1i2jGUNp156DU+XQ4hJWbsInJpMWngR6nM66UrTuP+5vFUKI
 Pc8i1hchxqENQfggrd7/ThhXcMTZiZnQJtPllFk3UEXTgw1wn8RjRniDSUz4SJJYRKVWLLS7g8m
 snB/FZl1sOtj1oyjQyrTYCUgcgHRlgxSGBZxj03qTVTmXGr1QE+CK+8yNoCFO5V1DwWeDp0EXy0
 5YwmH7TYib1kGb09ODRkG4j7lTvP2E7x9+REmMrDFsT09pqnQJ5G4zK24Y5nMlvH4edHotm1pt1
 rj4mpvNwUuVTQVFprgKWLFKlG2M5mCojH2eTKL2IbVSRgVj239y/y4n1gkhroIq7WQ0Y77hLJ4Y
 VFkoTvY6uwO2RGp6Lq/a4L/tY+Fos5FM5QbZ3A/1dH2t1axGFw287r16snDgGh+ktF8LFIMkUQS
 0ph8PWetfqEVV5A==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

Add an encap route, save it with "ip route save", delete it and send
the dump back with "ip route restore".  The restored route must match
the original one.  The test covers the rpl, ioam6 and xfrm encaps and
the ip encap with geneve, vxlan and erspan options.  A case is skipped
when the kernel or iproute2 does not support its encap.

Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 tools/testing/selftests/net/Makefile            |   1 +
 tools/testing/selftests/net/lwt_save_restore.sh | 116 ++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 3ee3378f8b26..496aed9ca57b 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -62,6 +62,7 @@ TEST_PROGS := \
 	l2tp.sh \
 	link_netns.py \
 	lwt_dst_cache_ref_loop.sh \
+	lwt_save_restore.sh \
 	macvlan_mcast_shared_mac.sh \
 	msg_zerocopy.sh \
 	nat6to4.sh \
diff --git a/tools/testing/selftests/net/lwt_save_restore.sh b/tools/testing/selftests/net/lwt_save_restore.sh
new file mode 100755
index 000000000000..9666386c622d
--- /dev/null
+++ b/tools/testing/selftests/net/lwt_save_restore.sh
@@ -0,0 +1,116 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Check that routes with a lightweight tunnel encap survive "ip route save"
+# followed by "ip route restore", which sends the dumped RTA_ENCAP back to
+# the kernel unchanged.
+
+# shellcheck disable=SC1091,SC2034,SC2154,SC2317
+source lib.sh
+
+ALL_TESTS="
+	save_restore_rpl
+	save_restore_ioam6
+	save_restore_xfrm
+	save_restore_geneve_opts
+	save_restore_vxlan_opts
+	save_restore_erspan_opts
+"
+
+setup_prepare()
+{
+	setup_ns NS
+	defer cleanup_all_ns
+
+	ip -n "$NS" link add name dummy0 up type dummy
+}
+
+# save_restore <description> <prefix> <ip route add arguments>
+#
+# The description starts with the encap type.
+save_restore()
+{
+	local desc=$1; shift
+	local prefix=$1
+	local encap=${desc%% *}
+	local before after dump out rc
+	local family=-4
+
+	[[ $prefix == *:* ]] && family=-6
+
+	RET=0
+
+	if ! ip route help 2>&1 | grep "^ENCAPTYPE" | grep -qw "$encap"; then
+		log_test_skip "$desc" "iproute2 lacks the encap"
+		return
+	fi
+
+	out=$(ip -n "$NS" "$family" route add "$@" 2>&1)
+	rc=$?
+	if ((rc)) && [[ $out == *"encapsulation type"* ||
+			$out == *CONFIG_LWTUNNEL* ]]; then
+		log_test_skip "$desc" "kernel lacks the encap"
+		return
+	fi
+	check_err "$rc" "Failed to add route: $out"
+
+	dump=$(mktemp)
+	defer rm -f "$dump"
+
+	before=$(ip -n "$NS" "$family" route show "$prefix")
+	ip -n "$NS" "$family" route save "$prefix" > "$dump"
+	check_err $? "Failed to save route"
+
+	ip -n "$NS" "$family" route del "$prefix"
+	ip -n "$NS" "$family" route restore < "$dump"
+	check_err $? "Failed to restore route"
+
+	after=$(ip -n "$NS" "$family" route show "$prefix")
+	[ "$before" = "$after" ]
+	check_err $? "Restored route differs from the saved one"
+
+	log_test "encap $desc route save and restore"
+}
+
+save_restore_rpl()
+{
+	save_restore rpl 2001:db8:1::/64 \
+		encap rpl segs 2001:db8::2 dev dummy0
+}
+
+save_restore_ioam6()
+{
+	save_restore ioam6 2001:db8:2::/64 \
+		encap ioam6 trace prealloc type 0x800000 ns 1 size 12 dev dummy0
+}
+
+save_restore_xfrm()
+{
+	# iproute2 takes every argument after "encap xfrm" as an xfrm one
+	save_restore xfrm 2001:db8:3::/64 dev dummy0 encap xfrm if_id 1
+}
+
+save_restore_geneve_opts()
+{
+	save_restore "ip geneve_opts" 192.0.2.0/26 \
+		encap ip id 1 dst 198.51.100.2 geneve_opts 0:0:12121212 \
+		dev dummy0
+}
+
+save_restore_vxlan_opts()
+{
+	save_restore "ip vxlan_opts" 192.0.2.64/26 \
+		encap ip id 1 dst 198.51.100.2 vxlan_opts 456 dev dummy0
+}
+
+save_restore_erspan_opts()
+{
+	save_restore "ip erspan_opts" 192.0.2.128/26 \
+		encap ip id 1 dst 198.51.100.2 erspan_opts 1:123:0:0 dev dummy0
+}
+
+trap defer_scopes_cleanup EXIT
+setup_prepare
+tests_run
+
+exit "$EXIT_STATUS"

-- 
2.50.1

