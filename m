Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860F5346782;
	Tue, 20 Jan 2026 23:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950378; cv=none; b=at1Wgn93+03ZbypSqsDQDHikaNZnJ02IBbiU2u2uloTRVfz4+hiYP0EmBr1ogjD+af4VmMlIHWOYeTT0+f+X5hhA/MLsBPCYvMbD8oiLOpMOJ3dVB4R0sizXY0JsfXT/zQOyRDVHQKyqdCTzZd3s1lsWp403FsMCc9Z8kfH1sgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950378; c=relaxed/simple;
	bh=mIZg6LyAQ5YLRYCvmDB1mT2AHmhvCBdfgRYz3Jhgt6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKgeE6rwmHU0YDmJRz/m83tjVka4olihElJSJMibVt66wtBNDZle+4hNI93L+dK2VW334f0ttYJysNi4SO27CfRTACaEWgNSVZIPKo8zlZ6cicrfB9zRqN93aomAFIEl8YUKZO6tPojeiWSAgIAzKwm0GjI0tBfLEd9QuIfq8QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=FK2wlzOG; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="FK2wlzOG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=8dIBwwgRdF0bXQt/KiXpNGJQK1PK9H5//g4wCSNy9ag=; b=FK2wlzOG6fFo
	kZWDW2l7tLMmRuIgnqYOc0Y+f9qUtqrbyEINWhJITTVTT+s4JUuoI4xBHfSQAew3jKfePVSSz1gUk
	WC2ZdYjXPdWIFH//94lueEm1E2gW6JyU94ZlTKkMaKccQGy/E13y6Vbx8XXRhs2i5KoI5FICAiA6g
	geU3cg+SUfP54UUkmT/9dt9tpmdAQkQoKbn/rY8V8PELVeB3Pgti6+nHHP0uiQ2gCZgSLTwN/hOtS
	xYOSbBY/sK5RF5lWHAqdvk9WOIblFr1ZOug5L7E9RYLvxGTTPPQGqZADwUHfJKswMqevh/4lOj4C0
	zWuyFykxnSAAPY70qinA+Q==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1viKn8-00Fnsj-0H;
	Wed, 21 Jan 2026 00:06:02 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 60KN6B2L328454
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 23:06:11 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 60KN6B96328453;
	Tue, 20 Jan 2026 23:06:11 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH 1/5] selftests: net: fib_tests: skip rp_filter test if cls_basic is unavailable
Date: Tue, 20 Jan 2026 23:05:54 +0000
Message-ID: <20260120230558.328423-2-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120230558.328423-1-aleksey.oladko@virtuozzo.com>
References: <20260120230558.328423-1-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rp_filter test in fib_tests.sh installs tc filters using the
"basic" classifier but does not verify the corresponding kernel
module (cls_basic) is available. On kernels built without
CONFIG_NET_CLS_BASIC, the tc command fails and the rp_filter test
is reported as a failure.

Add a check for the presence of the cls_basic module and skip
the rp_filter test when the classifier is not available.

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
---
 tools/testing/selftests/net/fib_tests.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index c5694cc4ddd2..fa58f9b6bed0 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -441,6 +441,8 @@ fib_rp_filter_test()
 	echo
 	echo "IPv4 rp_filter tests"
 
+	modprobe cls_basic || return $ksft_skip
+
 	setup
 
 	set -e
-- 
2.43.0

