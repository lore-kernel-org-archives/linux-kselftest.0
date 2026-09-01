Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7878444AB98
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 21:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298806; cv=none; b=YsBFeoV3OVXnuT7LOkAT3iS8T+MxXj96uVNp5UQPXQJACVDjLctuvak7y+9tjXZmTMf8HyNA2n4zBjJj4B+2nyN/0XOB7rdLQtWOIq3Z8ntX7tNG3c5gBeehju0sJs6S1JepbKweKkx8kPHkxIyPP7drBfjri5OAC92g5hRMWTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298806; c=relaxed/simple;
	bh=eyE60TegcdJMhcfWpYEF1SbVB3JqDiX4LAJmDhQCurs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NdL5SCr/SOwNRgj2ahAXSBSSco6nns6qdEw+ZWROZxI1xt+R1gxEzFT6zDguoKkb4TczE0CeGsfXiYJGuyA6KixW/ERXEJ/bBO9pzBn0Ti8Cs4fNqljjYlPPhpZwViMROD0hX2iRuvAaJD/xpLkwqvBjIP5zhrZA7EBL3QpgHnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=euX+NJAl; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="euX+NJAl"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90ce08834feso5243796d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 14:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788298802; x=1788903602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr78r6eU22ImOp3LoEBgktlcoV8p3UrAuZPj6+yVHc4=;
        b=euX+NJAl65/31QpOZiiLkhfJIglVogQ+OpybY2S5ECOwIA1sIZKIcyvqD6kDBQoqlu
         4knXPz6AxN9sA9mhlmEC7g0nZaOQFfffIQCIJLW9CioqlY6ElNUdvyNUTZBCsxus2XlD
         tmnRMwm6PQfJmnrbVeNf9sbdWoFRVUhg9UcNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298802; x=1788903602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wr78r6eU22ImOp3LoEBgktlcoV8p3UrAuZPj6+yVHc4=;
        b=Lpev9EsOvQzfAlx5iQDUMaKQrZ1hW0xnfAz95rqFO+s5TVdn5cUXVgIUmt2m1XOJCH
         ZyO8JKu4F0ezuNEu7ZpIUBcBrbH4+BZH86DNegmIICdklbd7PuefJHuQKs0+icx1Y5kS
         uqx+uMZ/JzC7XUvZ2r9ijV2gaD89CgmCkTufgSwTtthJG7rt/4OgIUS/C3FKdEKB4DUb
         6hK22hqpkjE23JwPWYEwbQ/PrEScW6AGQ9Kpd+NQIkGSVienH7I1NegNgbPCeRLw4KPK
         yAqoVyHNiBjVQHhh2bCuBwII3RdSqsiuwR3tIpyxeCfp7F+h+XAhIciE2lm9N9qoge+I
         jMbQ==
X-Forwarded-Encrypted: i=1; AKwUvByfGxjpqL5zUWCl+LuN8T3vusaqOAab8f8omkS3UBDEK64GQT1L+P+Ouy4C13i8of7SEpIPmTH3MZKwwm/a1qc=@vger.kernel.org
X-Gm-Message-State: AFuF++nG9vb/UcZehnaE0gwDL5ahjRQdlWK6wsr5xbBczdZmIAlbZOqK
	LCIT06UJxMsUCRLCJv5gAm96+OrQWcS38M+mKa0lhE4KhQpo191JwglLG9Ibmqcp2w==
X-Gm-Gg: AR+sD12kB2KzFTzq3AFM8zUzgZvY03JC5+9vJ6DEQrnMTykJaNum7Fgm/4AbnLJGV+Z
	m6QCaR74x9fw8tQP+FHJ1bqz3oS6uhnVmi1Uq+YjD9kJgqQaxXWdntqLIHiFfroiWeJyfcCCZyq
	9BIPisuVAL6ynuqkHDZaYOqDpF4atrBvAMie3/EQPoJbHY93JUWpUmMWfRhhBjhGlwTiTRWX9wA
	hVBZ4/uUpy3D76zvAoZ9+wDtvmviA8XnhiuhBy08xumWLsqFs6LU/JgjEwIxEQUahz+dAceCUiy
	p53eT+2omfkZEV33PWwHgvASO2F3ua67D6o2I+/PZQJ93Z8LIZZWWO2gHXNspjOZnVBqB3otU2U
	5joY1DwcZZnWVHU3UAiC43I/2wPu8ZKt5JvLkUKMFk92TMgbSawhOBrwFJr0V02QxZrkf80q2RT
	zctF/0iZAfq1EDjK869Zc/bITdi7tIKCp+Unw1HWTfmtCmi9aoSZZY5SSKro2WfAKEfNQHw0unP
	2QdYe9lc7Ccb6lNkjjvywbodjJYuP11Fq+86A==
X-Received: by 2002:a05:6214:4993:b0:90e:9d05:b757 with SMTP id 6a1803df08f44-90e9f253f0fmr11350796d6.0.1788298801772;
        Tue, 01 Sep 2026 14:40:01 -0700 (PDT)
Received: from majuu.waya ([184.144.29.222])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee08710sm3458426d6.2.2026.09.01.14.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:40:00 -0700 (PDT)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	Vega <vega@nebusec.ai>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: [PATCH net v3 9/9] selftests: tc-testing: update ETS test 41f5 for clamped quanta
Date: Tue,  1 Sep 2026 17:39:30 -0400
Message-Id: <QDISC-0CFC.v3.20260901204856@mojatatu.com.10>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit "net/sched: ets: clamp quantum in parse and fallback paths"
moved the quantum floor into ets_quantum_parse(), so every explicitly
configured quantum is now clamped to [256, 1 << 20], not just the
psched_mtu() fallback.

Test 41f5 passes "quanta 4294967294 1 1" and matches the values back
verbatim, so all three bands now differ from what it expects:

  before: bands 3 quanta 4294967294 1 1
  after:  bands 3 quanta 1048576 256 256

Update the match pattern accordingly.

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
index ee09e6d6fdf3..d2eab61c099a 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
@@ -987,7 +987,7 @@
     },
     {
         "id": "41f5",
-        "name": "ETS offload where the sum of quanta wraps u32",
+        "name": "ETS offload with out-of-range quanta clamped",
         "category": [
             "qdisc",
             "ets"
@@ -1002,7 +1002,7 @@
         "cmdUnderTest": "$TC qdisc add dev $ETH root ets quanta 4294967294 1 1",
         "expExitCode": "0",
         "verifyCmd": "$TC qdisc show dev $ETH",
-        "matchPattern": "qdisc ets .*bands 3 quanta 4294967294 1 1",
+        "matchPattern": "qdisc ets .*bands 3 quanta 1048576 256 256",
         "matchCount": "1",
         "teardown": [
             "echo \"1\" > /sys/bus/netdevsim/del_device"
-- 
2.43.0

