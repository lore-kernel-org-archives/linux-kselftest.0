Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562537;
	b=TAnbyQQBI7zUx5DnlNKTCbZ788iLkj4eZ2ykCv3qwGMuY9L4VvMLLxYYOmG0N8cFF3qB
	 0S0rBz9r6U9Pg7qk+Kd5xd9ADYVPV9BrbEpMv627DGJhbeppa/uZa+/foPhyrW3YSA85G
	 hqEStXqPQ/1vsjI+Lz5EYINKGMMlFgoW3ct+Qeazhzy1Yz5xVY9RsX7OLbVand87JxHXS
	 hXEbbAn8hFUCLwbM15nIA2mkEjYlSi7JKONRr7sv/nHTpN5XVYM69lmD9u9csv7jfySXH
	 H2MrD1adXQOczB+GRn4IyYaaOCAVeoQAHbbVKqbgfhPZd6OCoPYhZ64YduVeowlUxHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LEeoRplq5LZHzrY456oul/d2PVq9rdUpin7S14J3okI=;
	b=rGw38OQQcu7q78b89iBA8phDuIkbS0u5vBzuJTUWN4stCJS/tN6iwNjFIwDv0ct2DANI
	 uj2aTq8V5WAFR18ftqruMWAoVwsI3i/QF9sBQI7Pd+7vpu3tYj6PisQZnKP5SMZdOWhYC
	 /0CjlGa33I3n3JMiCxKTfC1W1U4jom4GwzvUf/lVT31yjCbWbl67pogxAR+E6AlACGrH3
	 F5ZBxrbSw6HUneTnATmlmME5A70HjRPompu7WQE2mi1qm6+963i2/EMHCVOajsxrKnBCr
	 0VAV8iyH7RSExCDtZhkJyd3hbaEGso8XA5HhBrrA6QjR3ZZOdjlz5mr+3/V7oDjjnIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFU9xYmU;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC9E606A325
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 19:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC9E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFU9xYmU
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so24276285e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 11:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562535; x=1794167335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LEeoRplq5LZHzrY456oul/d2PVq9rdUpin7S14J3okI=;
        b=QFU9xYmU/L6N9hQKi7stq4UplEV/6r8zefAQp+PjuqRIJisR17AK7U1OftGHMnipEq
         Cl2TA31hOOdiNuVoE7wM+G2S2OJB/QfdSJMfMMG00WQC21DeHkRX4qmiF0pSaXWUdBRx
         Odyq4C5zX7+skq9S6qgpXHuIMwgklqwk9GGkSzz3XgIV+KPY0pp+eIf6Q4000DNIaoAt
         4Oe7KScLKAl/8JkSW5Iyg+oB4TIv17aLhFn2MBhqf1wsCr2+uaIF4mlpVUdlfez68SQZ
         huJzDB83aaTWCtZT50/xAWnTyVPT1rK8FadaAjbuB35XCZe10eOeqo0wgX0bfmj3NUrJ
         LCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562535; x=1794167335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEeoRplq5LZHzrY456oul/d2PVq9rdUpin7S14J3okI=;
        b=zEX1PgAee+wqeDaWuf7ZPzlkr8G66hG5La58po/P4r7ZGh0QBAjgJFScJ0ugh7L1ym
         QX+nTUP1f8jTtGSDNi89MUeZRDG9/x0DI9NDtDQXoeP/fXwuJ6BAqa6GA/PgA434bywy
         X1yjyzguCwhOm0BOQa3YOQmhVeW6kbeJ+xeDXucL644lkHvhjq++/Z2Mnvs+SyaK2pYY
         lyAtk/wj3iTVX43/jvPWKMkq8tJP/lj/FXRKsDG4rvz05yfPRbXGbFnK7lvcy/EYYJNr
         H51rq+Z9IT3A3RzCAji6jQKsUBoGY6zDsoe+D2zfkePSqcYhtITBnM4oXDhTNe9kA9mG
         yPmg==
X-Gm-Message-State: AFq9FYJr5ejPaD/sWc/FbjKhzT2eJVfWUGNjw8izGyyzR2Qkns8Pgr8I
	SwOYAB30HsIDQPAHihCEc4+tcXPf2m3SDgGg3x2BZuNTN5cUKf/TsZHI
X-Gm-Gg: AYBFou1UqJO1hiYjviMBvfnB1X8MMKCxyls1UIZ437rm1IophAbjcEGJVUdgq4O0zD4
	Z5J85YGfMgm4mApIwKPBgtbwV52yreVcY33I2NFU106SM9847WY5d9ez/Wxo6ZfL+od7meRsfoZ
	osy3sB2rWB9QJYWusa3sLmvUxjwHFDYcHVplh2vPUUAgVbES1W8U9uoB53fY4BPVSaWFwzM7tHT
	JgnS77WbjH7oT0stXqoVj8JDDLMwY54PSxMhFDG5Sstljt2OC6DUkHvYYm+zhNm0518l/p9dnNP
	fc/w3T7C/g6LfKnn4UxYjfs/Ehs6Gsus5NqQpsASENglPLifeYiPDK9MXjpAllhRo65YX/JhNnv
	yLWZH0hDzf97t9u6mw5QTSR5TVvcL0aR1tDSGuEPYeH9KsbhQBrPrjQu/v4MYU+BJjtVD+FY50x
	NW7M3WeNQvvZxRyq/SrzcluTJBuEk+aklbTHMc1+LPoQvxEOLXy4/8H+bcGfKoQGqUaT7v3DMPh
	EASo8qMZDKX6xbP++xtowxeGJHmEXH3pFo7eHeBETD6JLUA3Ziqs+yXNEqFdGkloFK6R+/7MFh1
	6nQ62yFt4OKlw+/mBGIBw7/tI0aFbe1DVT1SK1CFtIM=
X-Received: by 2002:a05:600c:198e:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4ac1932a23fmr194625525e9.32.1793562534985;
        Sun, 01 Nov 2026 11:48:54 -0800 (PST)
Received: from cachyos-x8664.hgw.local ([78.182.223.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm296179535e9.14.2026.11.01.11.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:48:54 -0800 (PST)
From: Muhammed Sariyildiz <asiyee994@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/ipc: Use IPC_STAT to get queue information
Date: Sun,  1 Nov 2026 22:48:14 +0300
Message-ID: <20261101194814.188536-1-asiyee994@gmail.com>
X-Mailer: git-send-email 2.56.0
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

dump_queue() finds the message queue's stats by brute-forcing kernel
indexes 0..255 with MSG_STAT and comparing the returned identifier with
msgque->msq_id. This misses queues whose index is 256 or larger, and if
no match is found the loop ends and the code goes on using a stale
or uninitialized struct msqid_ds.

The identifier is already known, so query it directly with IPC_STAT.
This removes the loop and reports a failure if the queue cannot be
queried.

Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
---
 tools/testing/selftests/ipc/msgque.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
index 4b4c1ab..f4168c7 100644
--- a/tools/testing/selftests/ipc/msgque.c
+++ b/tools/testing/selftests/ipc/msgque.c
@@ -130,21 +130,13 @@ err:
 int dump_queue(struct msgque_data *msgque)
 {
 	struct msqid_ds ds;
-	int kern_id;
 	int i, ret;
 
-	for (kern_id = 0; kern_id < 256; kern_id++) {
-		ret = msgctl(kern_id, MSG_STAT, &ds);
-		if (ret < 0) {
-			if (errno == EINVAL)
-				continue;
-			ksft_test_result_fail("Failed to get stats for IPC queue with id %d\n",
-					kern_id);
-			return -errno;
-		}
-
-		if (ret == msgque->msq_id)
-			break;
+	ret = msgctl(msgque->msq_id, IPC_STAT, &ds);
+	if (ret < 0) {
+		ksft_test_result_fail("Failed to get stats for IPC queue with id %d\n",
+				      msgque->msq_id);
+		return -errno;
 	}
 
 	msgque->messages = malloc(sizeof(struct msg1) * ds.msg_qnum);
-- 
2.47.3

