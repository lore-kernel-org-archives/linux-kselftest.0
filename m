Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A637107F
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580009; cv=none; b=AeSfDnBZ4lILh0vnFjMSY6Myw9XFI+0cOUkpJKkqlZZyxaV25R8/fP/Cs08nAi+fOC+e1kVQP+3KwlmJPyuEFvII3LVcCwhFxHQKzGmgySnieZB9nqJLT+TnrvChRIJHaaiBOJQubeEDJPS+J8j6XelHykx/c4cjkTXwzKOUQ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580009; c=relaxed/simple;
	bh=nhU53OwnG/fAq56JGP21f3nMP7J14/UpgaOBWIQXEHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CMcVZRK2V7FKIXKnLKKuzx7gB1qNFBgLIrsTM2JwKljPGbGqLrWF3IZWTdsJS6W0qYxtFXQrq0yKgQ7xaFIjpwmaJiTfDk/CahIRRxlAai/wA/sxRbpW1XbiZ/KXrrrWGejW6BDgEFZdvAj+pOqGIXofx+ddBmEWftppA+umRmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/dXSDeo; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/dXSDeo"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ee6912d86dso50796096d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 13:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784580007; x=1785184807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwjtLCWgTTEQSYC4lcp4VnyQbYT7DkETAh6o5X09RTA=;
        b=S/dXSDeo0x+f6wu4iES/rJtmzjHsvdiBouX+PEbiTG70blsSep33n3LFCqQe1Wh/Ox
         X92JCN2xRffrhjImOa4CAI2XvYr96Yu63Pw5Y2hkOEv32lUuopmp2GKQr/M1g0x6SDYZ
         enAXWJaKUtNu4qPqbsLL8bOYMstGDYs1a1d9JwdT9Dn9hHztAo4KSKHqar5epBiE5Jyi
         S2YQeIT/kHTWeU1790ZPVsJhiTWfYjm73vc3cP7o8Jr+iI9dO1flwMjaJM2zgoHafFVp
         xcEuG1jatFtESNrdAdMapCpV8p08MP/BtXa0Llfgvy/XfkFpNER3ky5AWCTVl7OteEd6
         7Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580007; x=1785184807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwjtLCWgTTEQSYC4lcp4VnyQbYT7DkETAh6o5X09RTA=;
        b=sWMaK9Hthm/aM1vTv8ttB6yoSQ4+BsBtnPts5FjW7OzoQAJVX+0IFQOVHRzrJWfF7o
         E72X6+trdyby29RrsfOnYt8JY8WTDJntulivLPL//DZizBGA1SusG1XifpJmKztdV7bm
         BbWLHqxhoWOBv0LyZqJbQsdIlUJ8nJlla7bRWCksOq1Dzk/Jk7Gluy19d67/9JyFmoQx
         0NLz9hGmmsWDkr51d580l9csA5620MyyaQbpTER9bAz/uVGaH8BAdIWheCPGpqyynhuX
         7gL+qw5pHgCPEkRlbz9QYb9bhNVscArXayQAeyf9hvJhqLDeAl31iVpJtHPlF+lHT80d
         GN7g==
X-Forwarded-Encrypted: i=1; AHgh+RqsEKNuT1672WmNSMECNZe8/PhEY4mTD2oSouEkxSGjr6kJtVGYcZlafFFLdkrMMyv4wsSUpPGnZd+F2C0s6G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iFmz+yxSSL7IQmAWAYZHU9dZLjrZD0Sa47M+vJ+jjdAy5tz2
	zz9W+Fy7+PfUFuMhTwCciBETAysx9zGOU/HogXHI3Iq+0AHZxJ1+sMIy
X-Gm-Gg: AR+sD10PSb7KmOD+BeKJ7tYAW9CVgFcNDWPIeIQ8FwFxqGcV1l/EERYOGXz9aJXG2RU
	yBL2wU5PYPUyiopKLKWGCsLp7MtrVPr559GjIsf2dNTZX2Xfy+KDnLjFSaYn5cE1t63mFfyg7pZ
	kEvWFoTx044Lm0j5SsD8Ldt4BaR13nRy4sWcMcu0qGzt6sjTVW9kex6DaITl14+Q70oD80Z/r04
	loJdhrfgltcKsV7rGAZ7Bqq/eb+0PslNkMX83brg+YaHkwjAyuaWr7eFAh+eaOVHhv3U+pGGsit
	1QZ9u3f8xLBR6FnoW1TCo+zXR5ZxylppGL85CVAhGh8MtIo0GuQZWx5PGfQKQc5Cec01fQ85BgR
	aQlthNG1ROcva5xnbq6zwhW4ShTuCrLrQeSMrF12DqrctYAZLbnChixYiHdDiI5bknIwKRVGn+T
	OMaa/PsioTGLuVTuqbzlrtKkDHARoV5TFXDAoDXoi42HgRIwxrkPtADJjbalOiTf31eAr8pDoEK
	K9A+6Tz1iU=
X-Received: by 2002:ad4:5ae9:0:b0:8f2:747d:3027 with SMTP id 6a1803df08f44-907783395demr165080626d6.20.1784580006790;
        Mon, 20 Jul 2026 13:40:06 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad6a:1e00:3cbf:aab0:f9ff:788b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907892782bdsm74021916d6.36.2026.07.20.13.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:40:06 -0700 (PDT)
From: Paul White <paul.white.kernel@gmail.com>
To: shuah@kernel.org
Cc: akpm@linux-foundation.org,
	jouyeol8739@gmail.com,
	reddybalavignesh9979@gmail.com,
	richard.weiyang@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul White <paul.white.kernel@gmail.com>
Subject: [PATCH] selftests: ipc: Change operation not supported error number
Date: Mon, 20 Jul 2026 16:40:01 -0400
Message-ID: <20260720204001.1663473-1-paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The application doesn't know what ENOTSUPP means, as it is a
kernelspace error code and the application doesn't have access to
kernelspace error codes.I used EOPNOTSUPP in its place as that is
an error number the application will recognize and know an operation is
being attempted that it cannot support.

Signed-off-by: Paul White <paul.white.kernel@gmail.com>
---
 tools/testing/selftests/ipc/msgque.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
index 82f73cdae120..4b4c1abfac0f 100644
--- a/tools/testing/selftests/ipc/msgque.c
+++ b/tools/testing/selftests/ipc/msgque.c
@@ -161,7 +161,7 @@ int dump_queue(struct msgque_data *msgque)
 		ret = msgrcv(msgque->msq_id, &msgque->messages[i].mtype,
 				MAX_MSG_SIZE, i, IPC_NOWAIT | MSG_COPY);
 		if (ret < 0) {
-			if (errno == ENOSYS)
+			if (errno == EOPNOTSUPP)
 				ksft_exit_skip("MSG_COPY not supported\n");
 
 			ksft_test_result_fail("Failed to copy IPC message: %m (%d)\n", errno);
-- 
2.53.0

