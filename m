Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173949;
	b=VDXG8ze71S0W6o+5ZdQU7/9P0uEcOpHmzGvmopcYwqhUNKQSwui64pqEA4i9fLciyrkI
	 HWQgrGdn8b+KX7aY91RqhpgRySHIgBoquR4/akDTtvJhFg49MeVvinIUFi/HtQL5bhTpu
	 Kqta+KzDIzV0od/C5qomP//p4iL/aaJK5cQ8Rdvsp+N88STCUOILgKlQ3u+NyDgRrissO
	 OxQH/gEBA1rbFQN0hvlVSfmr3KI4t/GM2AhKyrS2qONrKyZFG/VQQCqpLnAA6x79RlfBs
	 oHB8U9xLMq8FPjry3hHamudKNE8FElrptPrmbNnfbog08Cl6SOjR9SOhxGWo4EdAj1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173949;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WqMA7RWH/tLIlFRV37UGqFGvravE6hhlZ1PRslslaGU=;
	b=hF/rW3gs0ZG3hW4+AtXl6f9fOf5mELZ07l36oBQJik9MCSggJB5e0aKuMAHV2N2rhTi+
	 KqJRlfm0LbmxrYeKeBw168wbKGIAM2kTaiPxR0areBpld5wYq61AfLI/1ldxPZ3cVXPTx
	 RZzhj7TOJaso9TOAqmTv42WpFwKnMWmtNABFwcPAqJO7C6tOaWdgbJEoWW6zDEgjxXWMR
	 +bvlcqYX1EgmXV8lRpIHenYtcEsi+ZSLer6rYW1uBItTJo8+qLml7q9htyY7crCZ9TUjQ
	 TV5wuIS1NaznD4YYhvzOq2W9Aea1rlF2swLh3i7iaNWn7tN5I0K7NQpTmPMFjgVk0Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=llVSL0CD;
	arc=none smtp.remote-ip=195.121.94.186
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EC8606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 11:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43EC8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=llVSL0CD
X-KPN-MessageId: 1e5a7bd5-e4d5-11f1-b88c-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 1e5a7bd5-e4d5-11f1-b88c-00505699b430;
	Fri, 20 Nov 2026 12:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=WqMA7RWH/tLIlFRV37UGqFGvravE6hhlZ1PRslslaGU=;
	b=llVSL0CDnR7GNlW9vyj/dhFxq3F0Ym+P4ppIoyWd5UuijccBxA2ufIJsPRDSNih++G5z8IU2K1Ali
	 NTdjCnVfHVtaPexMwrdIF02gXc+LiYPMhM6m6i68soBpn46M4csW3q34UxfP1pEA3MrOsP4mikMf9K
	 h1uuarn3BBighCPLH3G8ecEFT7r/kX/NHku9ns1iI8zfFr+6qryFbw0n8ox3afOAay3VDNN2Xcazk2
	 XI/CGc7bUczqd0ud4zVnB40OvtNARsUAbVD5zJiKM1q3uGg9p9Q1ZeBy/tx/jRH2weyZZ9SAb3CMrn
	 l2xKNPB6VHLPGgqrFH1+aEKGwrUNIIA==
X-KPN-MID: 33|P7Nxi6PPULmoId54N2bDPC4PodzQBz+CESPhD3Ph/fMHF9fRpPXxmDrRfurT+Ev
 iGQJfuy0gF0ZUWQlk8Kqb5Z6nPdHAiiPPTmUGr0mNrrM=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|9ZRuYsmyLjQ4G1beXDf1x7bP3Vx0YSsTgBoT0+s7BK+HCUeRUCt0oZ0sOTCFhDe
 uhklr3zHVUVXnsK6yD9Iyxw==
Received: from [192.168.1.167] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1e3ea4ff-e4d5-11f1-92e0-005056998788;
	Fri, 20 Nov 2026 12:25:41 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Fri, 20 Nov 2026 06:25:28 -0500
Subject: [PATCH v2 1/2] selftests: pass the timeout override to tests run
 in a netns
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-kselftest-run-timer-v2-1-9802690a370b@xs4all.nl>
References: <20261120-kselftest-run-timer-v2-0-9802690a370b@xs4all.nl>
In-Reply-To: <20261120-kselftest-run-timer-v2-0-9802690a370b@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hangbin Liu <hangbin.liu@linux.dev>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

When run_kselftest.sh is invoked with -n, each test is run by in_netns()
in a new bash process, which sources runner.sh again and then calls
run_one(). Sourcing runner.sh resets its global settings, which is why
in_netns() explicitly passes on logfile. kselftest_override_timeout is
not passed on, so -o/--override-timeout is silently ignored for tests
that are run in a network namespace and they use the timeout from their
settings file or the default instead.

Pass kselftest_override_timeout to the netns shell as well.

Fixes: 9d0b4ad82d61 ("kselftest/runner.sh: add netns support")
Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 tools/testing/selftests/kselftest/runner.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 45fb8ec38493..bbb2e61f323c 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -169,6 +169,7 @@ in_netns()
 		BASE_DIR=$BASE_DIR
 		source $BASE_DIR/kselftest/runner.sh
 		logfile=$logfile
+		kselftest_override_timeout=$kselftest_override_timeout
 		run_one $DIR $TEST
 	EOF
 }

-- 
2.56.1

