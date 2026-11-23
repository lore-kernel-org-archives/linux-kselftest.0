Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446122;
	b=EwYbB/K8mlblD2nKL3FESL9w94DWG3brTdk0OtfIt/eY+Nx0JJ1pFc29mGDI6eQfzTg0
	 mo4HtB+mSmKYKKm9pMyVR14T3SyWkaSTUTA2Ja70x+jA0ckv3kzHK0my7MQz47p6w3Kec
	 D7P227Jrr2BRmmO48DnA8iVKpsV/k2egu/hsV3H34IXEQR8c3lFvPxJZ79N9tQsxkAhwk
	 tXz/3xbS35az+fP4dgsWqrrRPkNBVDoNSg0NZXKq8Fjgf+LofUfPnbP5U0Y0tIJdSwHOC
	 Nxb5As/EcUvbBNLjcwaMSvL1G9D80pPAP0AcawuTyVfFG1O7M+rNfyh2Wg3QPNKd4HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pOYA2Qi1LlJis/jVtzIzVcnlnxrkX7HcTKZW7RMWJJU=;
	b=dQp+u7ASPdJUy2TpENgWLUGDnpQqcrfkCSF7AOnl2R+k7EAWOnR7/EapB78sQfdyCsdM
	 S5xTC4RvHNlU0PJ8M/36luA32fiVrpevG+g52qQ1vB9lCRNieALejhBoKvVeVgu5mK4tB
	 N9UbIM1itjqY88+7XWHxiH0awD/WjFsdYmp1Tq6k+xqSk9Vh3edUoWoXEMxee2qEzWI8a
	 7EGhT1W7xMDFtBuAKPOtnU1iZkqhrbHclL3FBsp2fZEgbjJaI7GjDAvK/mDcE/wUNGiVH
	 wntAIj4cUDpVPuKH3r0prIaXs3Me5jv1NqysFCN8pbvmlLjsIfM9GsdfZLpPUVY5Psg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PFGY/RjX";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C561606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C561606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFGY/RjX
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso572822566b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 07:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446120; x=1796050920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOYA2Qi1LlJis/jVtzIzVcnlnxrkX7HcTKZW7RMWJJU=;
        b=PFGY/RjXbySdDDj/pp6OdOvHoO/0OOP8E7WNKI70NcGhBkY4msp0/7Vx5qsuwJfvdL
         I/hrefBfj31N7LpxF1azSYXgIqtw5bsCsHQsASenFuwavkFlY4tWEw/tl1AxFykZji3N
         xMRbo0+XVluQPZ8sXqtWkaUM+VvArmxnAKZXiEAquJBE/+62gRn5exC5U2aqkd1qbRqZ
         rwMP836ZeG8yzYTByyr2vhshRX05z5PnfT0qh1x32mwKThJvqFE8FFULPthw7TlrYXDt
         S+Z8uA0PkopmzFGyMZmXIoQnQEdzKq8DxfG8Rmtp+t8Y8nhYCrmt3tB/vbimaxocWHsd
         OGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446120; x=1796050920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOYA2Qi1LlJis/jVtzIzVcnlnxrkX7HcTKZW7RMWJJU=;
        b=VfPpadDpkBAociyFF/e0UCEGNyqrfFsasZn6ikfFfCN6U4LhmxqHXsfk5RASKuc6ud
         pZ2bdkL7+x0lok1nvJ8vSIgunA4Djuo7de4KUAPkvauSsZ0UO4bM0oJUh8jm8AkA+KTK
         SUe5b6pdWGCT5mTvwibrjELIPV5qCTBpGukcYJAn+wZmiGs9FFDFdyPfu8n/bvJI5oLz
         xARtDyftnFF/gxLsFIZ1oZzQIgqLqwRwduiQ0B89SWiPF0lzALGWnnBRJJrjv/Gm2u57
         KnvvkWwZ4AfFW/67dwWwQojn8KboJn0ihQYVAz278R2mq75PMggq5Xv8RIGqXyjMolku
         KjKw==
X-Gm-Message-State: APuU4Z9szNEHezKr4daL/ux+SrPfzuC1ECLUGCX2L0lhDxuaF/QcaE33
	f+Shf1MlWSY1b+cX0dUMdQQWrsdyv/PRIWQpy09lfRm8qAFKtQN+Vbqa
X-Gm-Gg: AZFdTZdqgGXFxmdja22EXC1ulum9SnCZgwN+AGSFY2u9iAn8VizXpbFU4S8MvDYEwqi
	pnubCQXCWC7xMas+Mx7vE9Ey9d+kP48zWGWTCVXeUYe8kjHJGC8CDeHWJBDo0DdoymLwmJiZMc0
	pBbHjitfsorxY+W/65nwxLqaHO5XSEHunVQbztrfEjVbfcrBUdDHHQ3b0FL9WOAsw4kh4h7pSNP
	nIBbz/0JGOfeANVP+LJCdRudIbQOoRgOOw0Zm46oYv0ORdxOnAORdkm1FTx6kPeZtrkyfPWpJ+z
	q9LU4ags43+mhn8YDXiJXA3e5gPfX6SjPxuOxSLHFgQhw24vOKInLbw1YhQO6TgmapgZAUs/4Qh
	3chYccCmmDo0RvxRBdYq08K4CbuUqz/6QMPxsnwvjsXa6h4d3PcizWIawD3iY94IjcnCoySfggJ
	23w7ILK8t+vjOVCQz6EpMx58/WHUErFxAiO9vlMvzyn91yZZl2mJvhJAI6bAPFeVkd5xcp0r+zV
	kUpSuJlFyIMDzNw01ezsRL0vnVEIbD4flBF4XiYMO0DEt9E+12hYQJI91F5494+aVX7gJsk3ukM
	sy0AkO+cLghFxeNVhIZINTZxFYnwC1JHEwbd0ywFZQecBKwb3jSyDNzwKKCHFGGickT5tjnPf31
	IPFIpgcIjVtI3oRPS6n52
X-Received: by 2002:a17:906:9c84:b0:c44:16ad:c31d with SMTP id a640c23a62f3a-c513a3a720fmr1021359566b.4.1795446120175;
        Mon, 23 Nov 2026 07:02:00 -0800 (PST)
Received: from localhost.localdomain (86-95-26-230.fixed.kpn.net. [86.95.26.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm418398366b.61.2026.11.23.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:01:58 -0800 (PST)
From: Ezra George <georgeezra017@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ezra George <georgeezra017@gmail.com>
Subject: [PATCH] selftests: pidfd: declare pidfd_poll_test TAP plan
Date: Mon, 23 Nov 2026 16:01:27 +0100
Message-ID: <20261123150127.635412-1-georgeezra017@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pidfd_poll_test.c uses the low-level kselftest.h helpers, but does not
call ksft_print_header() or ksft_set_plan(1) before reporting its result.

This produces incomplete TAP output and a plan mismatch:

  # Planned tests != run tests (0 != 1)

Add the TAP header and declare the single expected result.

Tested: tools/testing/selftests/pidfd/pidfd_poll_test 1
Signed-off-by: Ezra George <georgeezra017@gmail.com>
---
 tools/testing/selftests/pidfd/pidfd_poll_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/pidfd/pidfd_poll_test.c b/tools/testing/selftests/pidfd/pidfd_poll_test.c
index 232304f818c7..416a136bb6eb 100644
--- a/tools/testing/selftests/pidfd/pidfd_poll_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_poll_test.c
@@ -31,6 +31,9 @@ int main(int argc, char **argv)
 
 	fds.events = POLLIN;
 
+	ksft_print_header();
+	ksft_set_plan(1);
+
 	if (argc > 2)
 		ksft_exit_fail_msg("Unexpected command line argument\n");
 
-- 
2.43.0

