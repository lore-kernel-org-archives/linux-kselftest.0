Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27217448392;
	Mon, 19 Oct 2026 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.220.120.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380310; cv=none; b=cPYJn2zBO7/RMrFJnSjU3v22EMkNEGK2eiERbS8q2LkSdTkUgUjyOXBavxBIt1VDotoe/LA9opcpm25JkS66ezwLvWzrfd9Xavy8gaGVigPwhvaehhYyT4dDonktsNUt9E2iPZIJQwjFpI2pl8/dAp4kjCUIgsj5SQxjhzit/WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380310; c=relaxed/simple;
	bh=q+iHaB3Zul+091O/KYMpCyMI0wXtO05u8O5i7H10/7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TC7nXoZbPjPWoxXIy/shlAIwId/1jH0IsM60dRQw4Ya/hJxM5SI6PQvzviIf/Es1P/uW3Mc9M7wnzNIhs+qYQcHnuQcdzGZnu6tuQeyJbLkqERKrrjXzIyH/6optDRCA28fyEDjqRBGRFT6zvHwa6psfOI6UdZCj98KshPApwuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org; spf=pass smtp.mailfrom=grapheneos.org; dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.b=Svv8odSy; arc=none smtp.client-ip=206.220.120.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.b="Svv8odSy"
Received: by mail.grapheneos.org (Postfix) id 5BA263C08EF33;
	Mon, 19 Oct 2026 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1792380308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAtzOV1aFpE444BHWurpFl6eEij2FJlVdplmk16Btfk=;
	b=Svv8odSyL5Tm1doobfW++LP+1pltC3vJi2ONKqbov+CRHAYL92FrhQ094jT8BV0mLzy+LO
	WoSN/HTCxGsXlwRV2w5Zv5ZxO0GyS/f8oWK1iE8IwEZaS/JFqGsM/MqEf/horF8tJ75RJm
	R6iRewrn27kSfBnjZKn5/m4tmG4c8+rjLzNiMrNeJPbYGG0xBr5YlRMlxkqo5c90m7lcex
	0Ve33mFNKtmrkIQzWybhDwf0iLaBolU2MObPwIxPXlLQKaSRHuHiYPhLpq/qfiBdgWEtzJ
	iG8+G4EtOSHWUPwNxLvS0p3bSqd7j1Cvs2L6g2BdhEMOPy1cHUSK5vrKGA0/5g==
From: liamsmith827 <liamsmith827@grapheneos.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liamsmith827 <liamsmith827@proton.me>
Subject: [RFC net-next 2/2] selftests: net: Test prohibit when oif specified
Date: Mon, 19 Oct 2026 03:24:06 +0000
Message-ID: <20261019032406.88874-3-liamsmith827@grapheneos.org>
In-Reply-To: <20261019032406.88874-1-liamsmith827@grapheneos.org>
References: <20261019032406.88874-1-liamsmith827@grapheneos.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: liamsmith827 <liamsmith827@proton.me>

Now that prohibit is honored when oif is specified, enable the existing
test that expects an interface-bound ping to fail.

Signed-off-by: liamsmith827 <liamsmith827@proton.me>
---
 tools/testing/selftests/net/fcnal-test.sh | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index a50609535fed..7eb4dc0311a9 100755
--- a/tools/testing/selftests/net/fcnal-test.sh
+++ b/tools/testing/selftests/net/fcnal-test.sh
@@ -643,10 +643,9 @@ ipv4_ping_novrf()
 	run_cmd ping -c1 -w1 ${a}
 	log_test_addr ${a} $? 2 "ping out, blocked by rule"
 
-	# NOTE: ipv4 actually allows the lookup to fail and yet still create
-	# a viable rtable if the oif (e.g., bind to device) is set, so this
-	# case succeeds despite the rule
-	# run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_start
+	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_test_addr ${a} $? 2 "ping out, device bind, blocked by rule"
 
 	a=${NSA_LO_IP}
 	log_start
-- 
2.47.3

