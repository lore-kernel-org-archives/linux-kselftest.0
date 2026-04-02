Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443435F18B
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 23:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172162; cv=none; b=Wpi50y7ceRhwuuZz5QKGNtvm3kvBuLcvGzf3fKsd8XreecuoRVRLrwcAZOb7zZHvxPffwzYepyKDWi4U5WKfmgP2jizwAy6pr0lASKEpL6wxn5Gb5lGlOTuufZ87KYVWTeeGCOYWrGBrTBcoskJf9QKwW76OmvR85+glwS5Jg24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172162; c=relaxed/simple;
	bh=X66sMD2JSJlwtM4s4LLO8jzXLNBFVA3A/cf33Aazx5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q0pzzcMv2FeJ42ignBU2MbhRAyUqmYLRbJpeOjXIN60cwWpf5iTW4col9LHlCv+ZabD/T1CpVmD/Kp+L0Fe9XSnK0ZJkpowX1ErGFZiPgZl3cMhe+BNBcHCvK7KBNTIQHm1Xl9uFActN5jA4sp1W2tXbGWIRsAusL6qiV0Yx1DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=0jADmYu/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="0jADmYu/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8296d553142so668831b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 16:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775172159; x=1775776959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dv6FE7db5UvibRsBKbh58uqqCUadsNI5imxVzaAN9G4=;
        b=0jADmYu/o/xjpcCFUsWZ3dfE6eknKXQiDZBUi6m9nv+3mGSfnolvXsRt7Cs3qIKPIo
         jvjky1YlgJ36yKfhPOWqajNPm0AlR/+vipdubt3FUA/CA6k4llodoicShlXiAi+qyonC
         vVlLqAmoCDDHZR0ebnPjsy/px/SpNDOUOtSFFHeA+2+wU1wdpzbAOmUVWPQ12fm78kat
         nH84mj1y7dOGiJOgYHVskz/oVlwLYdkLRUB6kK6J+/GyceQKA8mol/ISQ59MQLBCkCpI
         mXb+OL5KoJR33z1iu/PrHYTWVrlqoielyfancoqhQ5L4kgp/P2MAgqb44xqljr0EOnVp
         h1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775172159; x=1775776959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv6FE7db5UvibRsBKbh58uqqCUadsNI5imxVzaAN9G4=;
        b=TPBBp3cygRIMdjZ4uzMsxgvNSXb4I3ixR2vERjIYnOfb45+GkloukegvupaZv8CyLS
         vxn3kRhRQj1I+uQsB4RBM02fheN89bR1lwVRYwJHbAaIyGCpbgPPxRqYHrf4vdmKDOaa
         5t1KjoebqVi6q75ytACL6Pv+Yen1nzZ2OJsEVzH6brHeQqp3iCSpbkPTZtZzHaTwkW9a
         k683xPzoUQbxPGMOVFzVRZ56Yd6fgHSjj1DKO8Q1fIExdRVeoMa3N5lKT0O6Kfdf8rAa
         +8T87g5KhHn0EcZcgQ/GJ0/F5KHMx+LNxCPGi7U5i29BbT2PZC6iF9Kd5bkqkntq3heB
         OJwA==
X-Forwarded-Encrypted: i=1; AJvYcCXk4M9yUA1TKiaIU+m4ZLf3ip/JAhSCjCUkxT9Ub42M/drCGyPQCyFv6HwrUJXreHbEz/C6YR1Zazd/g888N70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvg+XyHIAgggLQe4TWmR2FEtfzUYoBGhZ27x8cEHFzxjMa5LEG
	1Jim1qgAuVW4g4Fx7i7NHds2CkPFbNZmonHa79DfEYZUo0KUxy+mqaA1Qp5MF6P9uR8=
X-Gm-Gg: ATEYQzzqfsV8KU3na0Tqvkai9jZOzWTTYXNTeRZShyV+In0sUKGc8AQyceKqbtJFHw3
	MUaLUz1MZmQhezkCKEE+q/KBp49l3a8P/pcFI9HMNKUVIqwA1ixVwIX8yGhsFgKILtozdwFWLnG
	+l93Ra4eMJlrTkaDupcAUlgl//NmegZaEkNcyK9Ap1QUThOlAjCbqTCZob/Asj8qXsq7NnRBpO2
	2WXk264GjxCwXVshJAxmo5mfBUQmhTkSwbXAhIHvepwE0yieuixy1aKpTq3tDpCbNXcBfrG9OdS
	zqXcs94RIJwa148KNWxod8LbvUJlluYIU7EGf7rxcBsXfsiX8vK5uonDfenC8Obv8NklXyDXsx/
	wVKTbjsmlwdCKs/p0zz+d5yYIMWIs7DHu6T7NuEOawjFgn0wIMMCTVNF9T+MPYZ/fSG6qAfmhSu
	6Q/uE=
X-Received: by 2002:a05:6a00:2d12:b0:82a:190b:2225 with SMTP id d2e1a72fcca58-82d0db717efmr836294b3a.31.1775172159417;
        Thu, 02 Apr 2026 16:22:39 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3dcb3sm4064933b3a.16.2026.04.02.16.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 16:22:39 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	willemb@google.com,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>
Subject: [net-next 0/3] Extend packet socket selftests
Date: Thu,  2 Apr 2026 16:21:56 -0700
Message-ID: <20260402232203.2004496-1-joe@dama.to>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

I was looking around the packet socket code and noticed there were a few
features that could be tested by extending the existing packet socket
tests.

I extended the test to test stats, drops, and auxdata and re-ran the tests.
The existing and new tests passed.

Thanks,
Joe

Joe Damato (3):
  selftests/net: Test PACKET_STATISTICS
  selftests/net: Test PACKET_STATISTICS drops
  selftests/net: Test PACKET_AUXDATA

 tools/testing/selftests/net/psock_snd.c  | 131 +++++++++++++++++++++--
 tools/testing/selftests/net/psock_snd.sh |  10 ++
 2 files changed, 133 insertions(+), 8 deletions(-)


base-commit: f35340f2d653f1003602878403c901396ab03c17
-- 
2.52.0

