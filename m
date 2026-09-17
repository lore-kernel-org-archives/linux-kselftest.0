Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA44E4C4B
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 19:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673921; cv=none; b=qVwc22UtvdafmDF+oZ55aVBCoxQ+E+pka9iQLIdi6sYOsgcXZ9CNnhOWJR9BZX5rkuWRCikpv8tuquEIXicJNG2VNN22jRB6R8/afqBhcNIJsh0ZVNH6C/Ec+7feQyidXI9Ui/zzAiLdkrFu8cTZDLT7aoHPYMIn3SgMvYKXuoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673921; c=relaxed/simple;
	bh=8WdFP1v7/Oa+dKIJynboqHB29B7wDjj6AhOsc16jvtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YP1yBPXfYaIkVOin7QARjQ++7giNMniA7vm2hDKgThtX6wAni4pP+AVZ20/yJWoDWp7JJM0EN4AybWfPyj9DzyFvBOaF3ZKNSK7lEcVEyVtL6JAB8OCekYT66Gitzskq8x22ulhhcwjo+BA0/PBdYIaHtpVEvX0e7PhU5xtoLLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Qbvo7E6y; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Qbvo7E6y"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f35cc24so12827b6e.0
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789673918; x=1790278718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63GI428HLg6svgdiqmZ8ZkijlWs39+VHkT3kxwHKcMM=;
        b=Qbvo7E6yrNTNGp9RMmGVEJ7mvDowF6LmpBLTdg/Af0DUVt0dUM4pB+Zvi7oYIEKkkj
         9ZJRd4hysWWzsHcaa7oGnOqX0li215pPndCf5WSmLvgnCfFrKt2heTnm0Gmt7y4fjJbK
         68cFDBxe/LaRy9L72DNGc24bO5bM+aMsIsYz88BoSDaKk+v53Tsf3GJ8TuJv46W81GVo
         t2ok+lRuAzGILeMeEiN3soOORuA3ahERQ+NMwuaIqffl2EGScwugplwjk2YYWaWom469
         K8rkGSqpNGt0rNwyb3gbTpTpC3WWbSIudCGb3M4WWZPT01hVDRBrSYwmcm09UMmfRTl8
         cQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673918; x=1790278718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63GI428HLg6svgdiqmZ8ZkijlWs39+VHkT3kxwHKcMM=;
        b=pAEe1RCWQiHoHxkNikpq3Gl3nPyguuqWePSOKvvj7rkn2rFvPAuwlCy7d8SQuEb+/W
         opHZziCuJ/2iiCI5P16TK2v0/Aix5zL7OjX+RsxRgKFIQcs7RTNexbR51Gmu0yqeQGAI
         zMDYSSVkY2izO+uwKPwxO906fKdw8t15gpZpcnNGVFiwQyZC+zZ77p7UsKcW48B/W3oI
         voa9w1zYhoX4Vyb18dTViuTrVonDQlBpiwgRkmLXr7ESJ+sdZB1rQNH+nMSm/G6bWZaq
         glVeGdWrETRQpEtGhCvEKktO8UjN3b5xz62vJWyvK4aJ2s3dzu7pw/GLwV+slTJ5Gt/N
         8Nkg==
X-Forwarded-Encrypted: i=1; AKwUvBwq/mAt+TPVFrYj7zVdpn0qImjjSBbgwcYFvSeKIEYO0xwElRziftY/mFleu0TPANVlVpxTTeHFmJWtMW2mNkM=@vger.kernel.org
X-Gm-Message-State: AFuF++nSqamSw+WkyD0pevM3BWru06iObNghZhF4B0ofYeRS1f2Ro6oR
	eDmMygJnvDKchDYYy5WHtVVxplYsIL8i6771bMUMJPxHUn8jSH0xpBWNOX+HUoTj4XY=
X-Gm-Gg: AYBFou3heoOvIRiMMbQYndcnl1XnalxSqNMvrzfoRcaaAGkqRFsDkNjjo4UeSEYm8gi
	nZOlGwDZR6sCMWfXbZLATH5/HZwwXBE6g2P1Adb8oewdSscYy9f2OFkxcrqIyvX4dk+WuWtiTVn
	xrpGgeXnej0KB8zG6kMPDLZvhMXjpLG0t09N5j+rlr0BFVjb3fC/jJrjRf7eAs15ZdGA4deUi+6
	TO7Qz8phRZxqkZtJPX1yi9q7wSx1Rnw7eiLr69tMIBh38YSW8z0OSu+6R5Z4qfDszjMycA5O016
	GROBaUFMJ/0F6zR137i8CRy4U/R+7eR4n90HQbIrp6HM7XE813rRv3TBlFm1sMTXVQfGGonkFwZ
	JJ1a0znQ3mgI4VNT8AmVBnQxBvvNoVol9PSt+yiVBn19tpLnIbAa9E2sgA03UwjLuIoPR/IrTY3
	ECpAEzV1uaCtz56J3AdWARs9wkSRlygnKjnCF2g1FZUzsh6o/P6JI1cR7Cn6C/
X-Received: by 2002:a05:6808:1822:b0:4cb:26a3:a092 with SMTP id 5614622812f47-4cd00f722f7mr143159b6e.18.1789673917758;
        Thu, 17 Sep 2026 12:38:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2632::3ce:23])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d267495sm3576435b6e.12.2026.09.17.12.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:38:36 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Thu, 17 Sep 2026 14:38:24 -0500
Subject: [PATCH net-next v3 3/3] selftests: net: cover IPv6 uncached route
 device mismatch
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-hash-bucket-route-lists-v3-3-30493a37b6eb@cloudflare.com>
References: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
In-Reply-To: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789673908; l=2338;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=8WdFP1v7/Oa+dKIJynboqHB29B7wDjj6AhOsc16jvtI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO1RwsZDwM/ssWO1I1sKt1WfupSScxRHMASpKykF6ut24vhcFE8p3yTn1fxnRNYklXMR/RihLXH
 dvewFKZS+iQc=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

Local IPv6 routes through a VRF can use the VRF as dst.dev while
retaining the VRF member interface in rt6i_idev. Exercise device
teardown while such uncached routes are retained by a delayed qdisc.

Reuse the existing VRF topology and msg_zerocopy raw-header sender, and
verify route creation, qdisc retention, and prompt interface deletion.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 tools/testing/selftests/net/vrf-xfrm-tests.sh | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/net/vrf-xfrm-tests.sh b/tools/testing/selftests/net/vrf-xfrm-tests.sh
index b64dd891699d..4f409d135a99 100755
--- a/tools/testing/selftests/net/vrf-xfrm-tests.sh
+++ b/tools/testing/selftests/net/vrf-xfrm-tests.sh
@@ -385,6 +385,37 @@ run_tests()
 	cleanup_xfrm_dev
 }
 
+test_ipv6_uncached_mismatch()
+{
+	local sender_pid
+	local backlog
+	local rc
+
+	# A local route through a VRF uses the VRF as dst.dev while retaining
+	# the VRF member interface in rt6i_idev. Raw header sends create uncached
+	# routes, and netem keeps them referenced while the interface is deleted.
+	run_cmd_host1 tc qdisc replace dev ${VRF} root netem limit 1 delay 10s
+	ip -6 -netns "$host1" route add local ${HOST1_6}/128 dev eth0
+	ip netns exec "$host1" ./msg_zerocopy -6 \
+		-S ${HOST1_6} -D ${HOST1_6} -s 1200 -t 0 raw_hdrincl \
+		>/dev/null 2>&1 &
+	sender_pid=$!
+	wait "$sender_pid"
+	rc=$?
+	log_test $rc 0 "Create uncached IPv6 routes with mismatched devices"
+	[ $rc -ne 0 ] && return
+
+	backlog=$(ip netns exec "$host1" tc -s qdisc show dev ${VRF})
+	if ! echo "$backlog" | grep -Eq 'backlog .* [1-9][0-9]*p'; then
+		log_test 1 0 "Retain uncached IPv6 routes in VRF qdisc"
+		return
+	fi
+	log_test 0 0 "Retain uncached IPv6 routes in VRF qdisc"
+
+	run_cmd_host1 timeout 2 ip link del eth0
+	log_test $? 0 "Flush uncached IPv6 routes with mismatched devices"
+}
+
 ################################################################################
 # usage
 
@@ -425,6 +456,10 @@ echo
 echo "netem qdisc on VRF device"
 run_tests
 
+echo
+echo "Uncached IPv6 route with mismatched devices"
+test_ipv6_uncached_mismatch
+
 printf "\nTests passed: %3d\n" ${nsuccess}
 printf "Tests failed: %3d\n"   ${nfail}
 

-- 
2.43.0

