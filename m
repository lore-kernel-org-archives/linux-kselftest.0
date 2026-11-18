Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009231;
	b=vnEbDixEo+MiCfPOyqAxSz3LVPp6RKi9plATJ9iazsLuOeTQEa+XGuhYZZXwAQEGUIZK
	 QbCVLBQbRxqfFPOb7GqmguK14DZ0pN7tlrcJ0wwxxcxPpG4E11n/sX3YV42FIVODiVQx/
	 5/pM3o+lLTfJaQOJLE72ruhlReqxgC7/eUQd8wgAO2ivjJo7d7Xxu6Zhgcl0RDkNHRmPM
	 FlQDJaltJ1QM5e6BH65j95/DXVcUrcSk2S2ej7MgfixKPLExdIpWAyqbcjqYmjxvWs3eo
	 jCZgzb5yhQwBWLs0lM8ZfjFjczY/IM2uUByOz/K9CRk6iBQZRXWT4P69bf6Tfm6zGHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009231;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ffGGHNKWCSxETLkGONbiTEwq2aMq5a8fFt/dO+LE6XA=;
	b=RZxexkcjW8wiYRCh/FHcP16JdErAE2HlzUCkVkZplvkROvOcFWz2xN+Acs/EyXPT2FWu
	 AP1vfvkLH3n2KsiNGLnS+aQFaJVXdy+eF8gRxmoVodjgl0UzxOyDMCCyOyqP1mYwmTt0z
	 n4EaqvZSlY9MeDeQyfdKrmswBf6IVdW8Krob8LJFWLL2JD7/raDNRWRiTREMMc9sA5sR2
	 U2+wiwRTpRwi3wBCRO6GK9PNsGheaMjF2VRMoZaWEIdapEsyr8hT4nbP/zBfHCertOVRJ
	 3GIJ6k9HJjtGxoNMswymWb8FArHnA6atOc2ssoZiwPeCN99pnjrLAdYh4khXmPJmuog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b="IPh/vKHJ";
	arc=none smtp.remote-ip=195.121.94.183
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD0606A32F
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57BD0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=IPh/vKHJ
X-KPN-MessageId: 9aa99447-e355-11f1-92b2-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 9aa99447-e355-11f1-92b2-005056992ed3;
	Wed, 18 Nov 2026 14:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=ffGGHNKWCSxETLkGONbiTEwq2aMq5a8fFt/dO+LE6XA=;
	b=IPh/vKHJDPRXXlexcXIDYI8Qid0WiTIuqOb3egGNBUu41c5voP7EAb7bJYF6K4Byq2+W5WAUKNLJp
	 CJIXV51kQwkaCNxaI+3cbbdMPIRSGe7Q1YbjNs2/PUqoL9EeFC1f8wMf3wD6HFaDx/ebpS51w0q4/k
	 M60VUzswfpA23BfkilD+wyW2EUNdJNeHeVGGi1W4lx4V3eEECc9z0QOzsbVwNmMaURqI91/aQh/K7J
	 xYNP+XJYCJU3+r0gIkgvWQcGTQ6/Nx+G3/AMONrg9Rf/qEJj6FiSAoMi+iMPM2JpxQLxfpB6uiXJu3
	 ubtTwivtPKE/DlhweJCTbK1KxMW//bQ==
X-KPN-MID: 33|b7sY4Pp07GmT6N/UT6poXYD4KxTJk3GtwJE+RgemeIdGNG7rDB4bZbp50csDiom
 w1bEv9R8cyebfEi6ZGK9WVV2d5GRlw1Lnk0y7Lui3BAQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|yGa9M+T+n+0+j2+go80d4/Rg/ot9voV/6enMeQvwKVEl8YyKU6BZzJTrIP7NnXh
 WBJTHDWaIJRrFAH7t8EJpng==
Received: from [192.168.122.1] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 9a9120bd-e355-11f1-a6ee-00505699772e;
	Wed, 18 Nov 2026 14:40:23 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Wed, 18 Nov 2026 08:40:10 -0500
Subject: [PATCH 2/3] selftests: pass the timeout override to tests run in a
 netns
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
Message-Id: <20261118-kselftest-run-timer-v1-2-53a838b2d62b@xs4all.nl>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
In-Reply-To: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
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
index 9b1dad5441ea..06748af6fcf7 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -174,6 +174,7 @@ in_netns()
 		BASE_DIR=$BASE_DIR
 		source $BASE_DIR/kselftest/runner.sh
 		logfile=$logfile
+		kselftest_override_timeout=$kselftest_override_timeout
 		run_one $DIR $TEST
 	EOF
 }

-- 
2.56.1

