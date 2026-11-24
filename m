Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556868;
	b=5of2+WSuvZUl4zkc//NSw1Hm17VIjUBo4Y7iCYXEp8QwCbWa4l1VZ0yb0PqGUQdVp+1y
	 3KotxyIrKMyjWsZbyX4ovm8f3f4G1bvU9FeaFjdQrJFtwIURvJ3iyp5aIMi3iJFreWBkf
	 Es3bua3kOfC+DCm93DvPPI3jWEZQn6Iuv9ccN6N1eMxhH7h4LMpeALsYj/9yEnz/VBvkP
	 J33kvJ9C1py8gZZVjX/nZ6HgFBja73SAYl74GcSRyov14S+momKckNHvE7AlqYdlQgHO3
	 bPrvo/KBMtoP9GhgYw50rG0fN1mhLNqnwbBXoF0f5ijyXMyQykP4yRupTcDs5mHYffg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
	b=CysD98N4RBmrSLH4KpcPGSmxGJNGK8YbMtk2KSU/OmJtjW0GQBW/BtPZGriKZom+9a+9
	 thNWSFw+QjW3+aCa6rFZGrnhEVqMcsMVBxMMU9fus9geEOi6t5b2adZsjTPHg1zHrs1k0
	 m9IAk+jAaaFLpmbMYuaeEM0eLJ3xD5ZKJ/XbsSNBn3ysR380FVf1Q7vPq0KGhY/7/ptxO
	 ozRYyJey5QBCPEgid3/ZWXLBdpgBwUEMo9Qz9sjF8UI9Om+ROFWrHpXWnrwmuGlKv/8aW
	 s7Yci5rTgtCJgohzuRvA43ORuRWGkVbpsEkcLAPSbKfAkbxDy/p2E2En17tKoqS6e4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NCjMwkm/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F9E606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCjMwkm/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bba5e1b9f9so19695e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556866; x=1796161666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
        b=NCjMwkm/CfTBm3rjRtM5Fi9y2811ZZ7R9VlLyqcxqvhLBTRQYXnfe6UG5hWXEa7THo
         lmXEhwSxX35dWoAP/Fpsi7mV1/EF8dKg6VTfvchlCDxGFwlj4F9dryFhw/KCTzJPmzGF
         ck6glT1WosE8d+8+PZembYMKaZ9XLdOSwxczNOyvFSTvDLl7N8YNsKru2uhftK3WSfIN
         I4hrG4DN8KupTdflQr+yImbACP/vJf2SRcCYfZumkWwLK3tPsu1edMsOuuoXQY/uTSjy
         0EAEkTyXkcyeAvKIMAhssD+8HMH1XD6XA4biQTuolPwlBJqygHBae+9nT6KPd4XLR82j
         ShKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556866; x=1796161666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
        b=WJz+nwq3SSetIoVGSa0X4D0dfiiKrNT0QdKW66C2+0y4cm3rg7SmA4mU7yf0ko1n8U
         pj3dIpxuZ009N+dasEKpiBCiohGUh0/x8UYpQSdcwKsMsXPZgvklkp6r6M3f+AGzkvju
         /7xPJD13VXtDlDo9bGi5T859sO5qSWGrKGsx0HycNKPbQmBudjM/89aqW51bfS69PZgK
         YLmaNbUHpqMTEn5gAuU3iz0FJ9KR9eVMPM1mb79HY6NuBy3v88vTlrEJFHpBs0shDYkW
         KiatvnNltRfPvODt47cAvr03S9JH/jpK+vJTqC38+6YP3rDl6SLr4LjZGwT6+osZ8KIo
         fDNA==
X-Forwarded-Encrypted: i=1; AL+hErHkDmRFG4MhipUj1gkjmaTBLq5wB6T9dp8Re+EmJA2GXfe3n6bTY5mK9y6Zs2nVnx+bB8VZJ+JwjIL9B73Owlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rcJRyKS/Y5ffJiDM6imcd9ipY4f2gnkmLjNedQD2yftxEJCJf
	ZSA0q1+JQhBDHmd560Dn36IjU0bJVFhyU3UpIdlxQpdUFG6Pl4AAoUW7
X-Gm-Gg: AZFdTZdf/F4Gb5iDXh3/CdfunObFxqCLLE1wsXWDpxin1RElriWHlRu0yl3Pqavk8BE
	rVrjG3PG7WaO5bN8KdjrPT+XGVXbQW8XQRUUdjXNIGnDtk2Mlz/pLJMZUbvyUQn8yNekyj7jfqp
	IhIXCYERHdO8Zz4uUCJNm0qutJJglBTU6w8AMOvMcpu7HwRdDbE/A8Za+eKsS1Fisd6tV4aCgIT
	Ou3hBg/fc8dCmKSp2npIFDawiRrAe2SBs3Vc7cgp7l4sUrdkp8Be4oD8j6foAOPz6RE5vrvGg+f
	0MV09LrVWdy6QdAmSat0GAS+delxPKW0pMnSdpfA6BkLST8ataVwCFtUYGT2ZB1VDLxL2RPhJ+A
	Yb+HBr7SQ/76rOQOC7asExj5Uj6W++1EgAI40D2ffcJ6Q7cC4ediTxhgxvXTYEjtLtzutwyM4B2
	t/NT5nHrOVeavSlBEHwuElOKow3m4j1s4bs5IbOkhGlIEXd0Qy1k1c5doWR1CafZgrWO0lyz+zy
	dbyhsvqkePK6K7cjVvohk5vLwqQkX7gnmGnEjsJIPJ9A9OeTij2aG6MucPPsy4fyAR67Qs090UA
	GytEiWBlsx4qbPqBMXSndm7uYw9nWMDwZs4+k4X7kLG+XJdJaGO9MZYLEExedZO9GOZadQ==
X-Received: by 2002:a05:600c:154c:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb887f43d8mr314245795e9.1.1795556866565;
        Tue, 24 Nov 2026 13:47:46 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm476404005e9.3.2026.11.24.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:47:46 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v2] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Tue, 24 Nov 2026 22:47:36 +0100
Message-ID: <20261124214736.13398-1-emmaonana18@gmail.com>
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

The connect() failure branch reports "bind fd2", copy-pasted from the
bind() block above. Name the failing call.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
v2:
  - Drop a stray line that crept into v1's diff hunk.
v1: https://lore.kernel.org/all/20261120063011.21557-1-emmaonana18@gmail.com/
  - Initial posting.
 tools/testing/selftests/net/sk_connect_zero_addr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/sk_connect_zero_addr.c b/tools/testing/selftests/net/sk_connect_zero_addr.c
index 4be418aefd9f7..4441e9c62fde5 100644
--- a/tools/testing/selftests/net/sk_connect_zero_addr.c
+++ b/tools/testing/selftests/net/sk_connect_zero_addr.c
@@ -46,7 +46,7 @@ int main(void)
 	}
 
 	if (connect(fd2, (struct sockaddr *)&bind_addr, sizeof(bind_addr))) {
-		error(1, errno, "bind fd2");
+		error(1, errno, "connect fd2");
 		goto out_err2;
 	}
 
-- 
2.43.0

