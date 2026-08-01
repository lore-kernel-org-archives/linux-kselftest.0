Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3E2D97B5
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785623367; cv=none; b=aDPgKAHYpmlPf4Qri29Bqky398GH/iWVYnHmuiXT3XOW2esrzXzWg175ZWxByxqCMcWOFXBheZ1Q+/3RCNJzwFbB9J3LMSBittLILh8q4mM0Bpapru9tdW5i61tLLMQqJC7kaAuPxE6zuLHOjAjliBMFX9SB3HPwEThWyitFd3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785623367; c=relaxed/simple;
	bh=1Gw9vWPrfRCTzHFJ2sAvaTRJm7NJukBvxnv7HCFp5Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVnqfvwmSK5bQP1J8ttjIjXc+qM0hUIMF7mFplCvxfJA2wgjh6lvTPDghqsloQeDegFLVfFcI0BvY3kDSmP3Cg1D3jELf6XTXnfpYPLB9PeI2Fmm2E/33mfi+ptdms5A2iLRgTxPY5rJxtHoffsJBvSqOnsESJYHoMzesf14xyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8cGmM4X; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8cGmM4X"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e7632b193so145108085a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785623365; x=1786228165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdyeTfAUUQXGl2cyRUlJj9U9a1L8ImHdvXwmoKXqi2U=;
        b=M8cGmM4XZ5NvSjTRRSQ6jLPgqktuUT0yOi1bhPMRkDE/OliBGt6rlvs013nLVSULu2
         gtosw+FpIy23vTLcc5UqUZrbbCBa+DSHXyOdgUi8D0FIoGI4HUujbG3So423eF06MqE0
         2YMfI8iq4tUSFYp7F7SpBiO0CkWrUuikprrRZSpbfxxjbYzXYBHukVz5QnDqc96F9pzL
         WLqXCTC7yIXd7bdT6xAUPfbLOBVDvkpP77i/ztJOZ0mORHg0T0CC9Nr9rHm4GoUdm5Z6
         YDAd/zQjDdhuKafekpBlG+ydPW/nHPgdgATPZ3nbDKUfjoLaGblR1bTl/ZFGCwuoN6AB
         T8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785623365; x=1786228165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdyeTfAUUQXGl2cyRUlJj9U9a1L8ImHdvXwmoKXqi2U=;
        b=AAVERi+tLWmlrJCpSyMmd+ZiW6NL0qcJziPOrazYzwni+NLHfrl5TdZcC3qBKhhSdq
         du5knlVzkhCO3HV6eFGBvy3cqFoqhU4aEbBHZrrJwQIK+y8w9XuqsNVFc9Y6JL260fVY
         q69GJ4D0d5KB4ORHXllyWMveBST/Z7HCaTBgfTCPoBmY9vT8zeWoTGHlfB6S1Q0uhh2m
         +zU/fS1+7dPbokmr/Ad3t7jZVyqK0Js0/qpnsKyvmFgWS0Lb4f0rgxkkoIGIRDXO4Ju2
         u3RWn2HSq2TgWQWwXkipHn1badVtGcd50uiO2c1LWMzqAGG67Kcx9HBGoe49nZztRTQi
         2Urg==
X-Forwarded-Encrypted: i=1; AHgh+RrZv8edqVps/ho5tJLxAMBDwR2Ikz7a+XbbjEfdHF2LxspEwzC8PClS6CTiULyX6yR8j9uoY/5VqPUp1zWdyUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzmQaAN57M8ER56YmIhyEZZ/9e3jNpe0nwK19vOhUEyg5jgmQ
	hEoe8zCW1tN0TwW2Su0NA4U/OvLyUEgXeFJ/gsNwYSogRTvXH3l8/AnC
X-Gm-Gg: AR+sD11Gsn78aUV/37UMEoSLMm0Fncncz17gNdl4u2vaRTBDXy2DKFRSEmCO1HJSuQT
	6QAclctAjEBwwkTulAL9Psq9UBvnRZxGW+sgj/GCfJX7aUOEyoToS+/4id9LPDSckfZk4oxWeLI
	B7npLXZskUTRGfyjPyq8TkKQLxAzHxcUhOWGm7q6U+lF4dTnIkOWelaAebss4+1nYFLqKkcEggE
	A/ShncqAwFr4WXfoG7WsXeJBT6DvByJO7SoejL0DO4D8ccptwd3nL2WeO1vyrGH5av+3GxMQu5l
	9yDABQIWWmJdXSHtdw5jAqUGW9Ck5Md4QkXRVl/qPVt76vCp2AQx8tAlt4KPTyMXDVmOvVuD4h/
	QbJAuQwYq1Ahj+/uQ/BnjVlpCSw5ISZ+PFjIkOFV58jtH+awfcVbXfq2IOvkNR9zO7Dop1DBmgZ
	pgck8gISkcUp4uW44xY3K+2Owtmv6KE6DQZT3/Y/T4PqLFrGEJzTiu83tzfbr3ijM7vZPcISNFY
	CYgxk+eRM38NLcltj1he7fq/GRdhHHyX4Kj9u+U2n2EMjRCKTaklj3lfpjTxIH6F/k3SzQhujrJ
	PQXUXA4vQN5y6Uw=
X-Received: by 2002:ac8:574d:0:b0:519:89b6:78b4 with SMTP id d75a77b69052e-52b567dab59mr95475271cf.40.1785623365113;
        Sat, 01 Aug 2026 15:29:25 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-32-195-55-166.compute-1.amazonaws.com. [32.195.55.166])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4eb956c3sm33403831cf.22.2026.08.01.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 15:29:24 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Deep Shah <deepshah146@gmail.com>
Subject: [PATCH net-next v3 0/2] ptp: reject frequency adjustments that overflow scaled_ppm_to_ppb()
Date: Sat,  1 Aug 2026 22:29:21 +0000
Message-ID: <20260801222923.39017-1-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ptp_clock_adjtime() validates an ADJ_FREQUENCY request by converting
tx->freq to ppb and comparing it against ops->max_adj. On 64-bit systems
that conversion can overflow s64 and wrap the result back into range, so
a crafted tx->freq bypasses the check and reaches ->adjfine() unclamped.

No real user space asks for such a frequency, so this is hardening rather
than a fix anyone is waiting on, and it is targeted at net-next with no
Fixes tag per Jakub's feedback on v2.

Patch 1 rejects the overflow in ptp_clock_adjtime().
Patch 2 adds a regression test that crafts struct timex.freq directly
(testptp's int-ppb path cannot express the value) and confirms it is
rejected with -ERANGE.

Changes in v3:
- retarget at net-next and drop the Fixes tag (Jakub Kicinski)
- patch 1: unchanged
- patch 2:
  - cast the test value to the type of tx.freq rather than guarding on
    __SIZEOF_LONG__, which skipped the assignment on x32 and other
    y2038 configurations and failed the test there (Simon Horman)
  - add the built binary to .gitignore

Changes in v2:
- patch 1: added Reviewed-by from Vadim Fedorenko.
- patch 2 (all from Simon Horman's review):
  - cast fd to unsigned before the shift in FD_TO_CLOCKID (UBSan)
  - avoid a -Woverflow warning on 32-bit
  - save and restore the clock frequency
  - skip instead of fail on -EBUSY (free-running clock)

Link to v1:
https://lore.kernel.org/netdev/20260712040922.6403-1-deepshah146@gmail.com/
Link to v2:
https://lore.kernel.org/netdev/20260721014256.1876-1-deepshah146@gmail.com/

Deep Shah (2):
  ptp: reject frequency adjustments that overflow scaled_ppm_to_ppb()
  selftests: ptp: add a regression test for the frequency adjustment
    overflow

 drivers/ptp/ptp_clock.c                       |  14 ++-
 tools/testing/selftests/ptp/.gitignore        |   1 +
 tools/testing/selftests/ptp/Makefile          |   2 +-
 .../testing/selftests/ptp/ptp_freq_overflow.c | 101 ++++++++++++++++++
 4 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/ptp/ptp_freq_overflow.c


base-commit: 69963a0678a347d57c4ac8b16939dba216eb95ce
-- 
2.43.0

