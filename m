Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826549;
	b=IXilJIO5lms8J5q2zwxL8JabJ/dyBpYT0ZFI9sCzCCyYiM9sOAb1mRAv9rOOlKmduPZ/
	 Ve7a/3hQIMKI6Eciz3vryg4cqOX079Qq1bp+5fRUB41wSV4ModS/xOV6S6AA5vF5q2PRX
	 elvHyXeXf1iOsBsZ7uXKv6vGYr1j+dmWWCdP6DkkKKcpLHjI5r4HVnyg2ux9q7VkIBGkk
	 Kwi/y+7Jjt4P+jMRuluV0e9+bTV+0pAJskawiwu0Mm1ye/9KcdCb5AeH4x2DaeZQGdXhO
	 wiXzIf4KuXNL4Ybg2E0WJgGcN2kvq4yR7f5EUC0l8WRGcIzuZ9s9m3Gyuya/5CSwe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KSffZYDq62GP7tnRprhjIEMyyX/StOyoMuUB9ic+kKo=;
	b=Jkqyfa+crPG0VoYKUxkAJOG7xyKE717oaxRF7VDPbjOYjlw5JBJ+ivCVebybbvPwMAd/
	 073EHUrJY8MhaOFzGIIBQd0xrTHc+WMiQxoOHVOQaMxAoq7lQU6Y854nQea99C8XXX/SU
	 Ow5aw3FF706nLrvIlUakhL2yoDYW1KrRw0eRkck3P3PNUQ/PJD37q1Xlhyp8weM8d8vxd
	 wS0Jhnc9+jxgOvLoL0AaPPxBmDGNn65OEeERSL2l0fCAqYwYKNjaWfovrPQ76KN3tUqmX
	 Chija+dsz6mUp6NHaWgcXwiA6ZMOnd5H/va50hSTgMN7Z3/F8tvAMjRTc/SkPejVdUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHieJn1h;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA33609CAFF
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA33609CAFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHieJn1h
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so11975455e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826547; x=1794431347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSffZYDq62GP7tnRprhjIEMyyX/StOyoMuUB9ic+kKo=;
        b=PHieJn1h9CDxFIUEuSOfcKfnu93q/RQyKGNzAHGbgtTp7cd4pW6mfHqWIjMfE1u546
         UAIkFsE2uDf9ZX7mmVdnFNKLhIEWQamCDDH6Q7ddinEkDbXlMbvjmgWcTCqCEt7dBxok
         gD3jkzNt5sSiHocdHA/Q4UOhraMvQdfRSDdDBAFjf1G9cBk3pxdqP716Tx37ie0uYRLN
         3uqe6dTYMGooJAnVQYWTUrgg4j0WzG23/PihD5Rdc/En7Y9PjTUvfTemU8TeqLT8Ozm+
         /EDYVFkMcvRzL60yzyUVYRk4KryaPsnxuHeEBPsElqQuzRzUVT5rv+o3q4QFbvUuWd29
         Mbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826547; x=1794431347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSffZYDq62GP7tnRprhjIEMyyX/StOyoMuUB9ic+kKo=;
        b=rxi496Kn0gsMZSter9uwTX87Phm/RlZS43pZFvyxcEdufQYJf0sHboQyYbUkc1mLi9
         3yqNpR5jIjO+1sKOqi4WAQVIlrXhn4ngDAg5ZhfLSQByrkPlIGtZmp/7x4tRnHozkRDE
         zEty7kWvEg/Xp5jEdWxy5u7e7DGmY6DqQY38zl1V0GA8QJD0vqS9Hc/bSq4mMJ+WpTtf
         XCPb/JF0LIvADMpwh8FFzvqFMsRCIC91Zao1Gd/O2wAG0htkL0PYvNOPQmt3NlmVVja1
         1yFi8VCpy+L79eUDzsB/fE0u5YDchWux9KHEUluu06/empRKuCJOkCFgyjXpXawv/2Pg
         6WWA==
X-Forwarded-Encrypted: i=1; AKwUvBzH6hX0YOKNA/Qjy2G6m1ka4nn24Kqg4S0BNMqArcCXe7u4E+tasa5L0/dZCJdbQA8ldhVo97tMjc1qI2musHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q9r/zUnpkHxWT9H8l1uo0iDjRDYdl2ZP0q6Xxrr4UdYskGkdN
	NCrmEcO2ejHPcL04lVqi+kCL0AjKq5ZZF5qstVR4mQH7iEfDpnh7xW98
X-Gm-Gg: AYBFou0MeJJpfmiqYDSI3SAdqletL3QjTeqpRZIfNvRxJyKhmISUGe68d08ApJnbiY7
	XLQBFDQJIep92TegNPCU6PycDYQYy//M+ETqv1Y8iAcP2dJ1JJhImGAHTpVQihvVtI4OjEZy40X
	X5YEX33tTUHxClQLNLIyY/xbwnejsNRF0v0tYOBU9pf1MkNxwntw05aeotomo6fRRhLGaUB8dtZ
	rJpa0dQkiaok0nULa9682rEj7A0u8DYxPzw4bZIhdO9al6TabwJ9mVpqWvprQkPGk28P3TWRsO+
	hL0L2BJc+yu/reXLjkezfMEgR0HQFtEtxiL25IWOlDwbzdd+56iXQp2zS/E6NjP8Ppe3R9JbHun
	2YGITHZBVFh7vkmKBjGYDhznnnESkLkdjZBa5AQYYalfT58H0CrD7BOxlhmNdXhLsfcVQroTw1r
	CctPtyjTbJEFfPhYGZRBLGdrYszd3xju7sDegCNHZRFnl6hCQpCPYKHkDtvpnSr4/+Dt8jthtCR
	Mg9GVjzFQWHS8Xlg5rCBfRKdm4zfZ221JvzJCqUqhLgpHAgcjFnLhXd/BLunBgMpBXxPZPKsVFB
	88DhPMIdeWvAboAfsn9AimfD3JaDRlLlYgYwsxZf6Wmkk8utBi82Hb0PLniXY6BGBH24o+ztlV6
	J
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr384799355e9.26.1793826547408;
        Wed, 04 Nov 2026 13:09:07 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm55148665e9.1.2026.11.04.13.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:07 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:54 +0100
Subject: [PATCH v2 08/27] selftests/landlock: Handle a missing control
 message in recv_fd()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-8-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

CMSG_FIRSTHDR() returns NULL when recvmsg(2) did not receive any
ancillary data, e.g. when the peer closed the socket without sending an
FD.  recv_fd() dereferences the result unconditionally and crashes
instead of returning an error.

Return -EIO in that case.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index e29406900c04..6c2aa913ff11 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -171,7 +171,7 @@ static int __maybe_unused recv_fd(int usock)
 		return -errno;
 
 	cmsg = CMSG_FIRSTHDR(&msg);
-	if (cmsg->cmsg_len != CMSG_LEN(sizeof(fd_rx)))
+	if (!cmsg || cmsg->cmsg_len != CMSG_LEN(sizeof(fd_rx)))
 		return -EIO;
 
 	memcpy(&fd_rx, CMSG_DATA(cmsg), sizeof(fd_rx));

-- 
2.56.0

