Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157955;
	b=cnP1vW288G0wIQGh7GGRA4blbVbjU8wL8sXyj2TDXINmASdyhWC3v9JkwWkkSWDMtqxh
	 oeJ5+DbXClQwojOjdZGsKdoaWsYDezLXWWbz285BoqyHbS49qK2zft8Qh0ppM3AJshOGq
	 PBTEWj4c+WsxkK3yQcpGrQXfFW43OCrdznE0KSfrFtvf9C63YpN4HjGR2f0ntbtJzd9eG
	 klgVEQjn0eIyKPEzFJ2yRiNF97PZPCYAE20pFemcmfn9iRHuzo0NbPRuwamXJV/MoXQPv
	 6JDrwVlCGfkGfHscS6oMlrnNE7mKa7tCxiCZi5RpkoE7N1CPAQC4Fwze2KzwQHwZvDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
	b=zIbgMjVe6bknpIkOethEar4zsakIJpgX3CwvMURHrPotfqc2AGrVMRS8vGs8YsLDsXGD
	 Zxd8GuSh0DyjuU2yqH69GiuOHgmRq22A/a7+h/wNZh+C2WCaIObyjBEboZcygejIykdZH
	 53y6bkubkgsJaZI3LnTniP9OUr0XPYm4O2buZ0Q0xAcxpQKt56595rwTP6AGPVYkVFTE7
	 aq4IRC+MdRsU4xVmGfXZ27eONq3qDhJANXtzjwATuaTfqfiiO7zc6RB71JhJQqW+wNkpn
	 AD7nJU6K1qK2emaiL3C7KNP0kpeoDyhWXole4cIvfYj7ffaSdL2/IBs2K3r/uPcmk6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+ayur8N;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B908606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 06:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B908606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+ayur8N
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso1008575e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 22:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157953; x=1795762753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
        b=B+ayur8NVY5Cl/rajdqV95YrqS724UV1tmlCmzVWef+sET9W2kHQnTzSsJo2UldC+j
         WodZg/VICXi6ZeJuotPMLoyy3zch5pFwecFwpdJoufnmV5qqNVVTB3wwfYETHwnyZ9WI
         qL4XatKPMv1QebuPO29XCMC7VWfu8BmCOn1pdq3rKB7Wrpohvmx3EgLKknyO3LHota51
         np/y9eo5zFX8nBqIvWSfJUcLD1AMvgTqf6HEiSY4TeOKmAtD/agQVtHhyc0UXEf6dRNf
         Gk2fLrvuDkH2afQYJD7v+/lWIcjpYSASsJW405nTC0T0cUrbkAyMnIfR3YlfHEBjN5VX
         OfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157953; x=1795762753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
        b=C6Ed/p6e0J9xrKyFyDNA8RoRgLyowggdwP9Kkem3GxNRLUjR7wlVcqutRc9BM353Ua
         AV2mQAUk/r/BnvpbP0kTtv2ANYc5OlJCkvFD17e5As8tKMzpWt1PmkMyXUDAG4XcJ9t1
         I6egnChmVQ8Vjx/jbPp162+33MFNq1XBLyLRcBd2cwtIbm9udtQ2Y087lbbrlBVVs5pB
         6WfNfFkW3COdOcZ5I3ZnQnowwouf7PqTYQZZv22OPa16V6O/M+D3XmC/HT+MwooJx1JY
         3We5aRmpeYgoGvvzjxcSAmP/D1G8rgzOHjAxYJKnbHm1MSl9wutorPomZSPvL2UhN/WD
         qyqw==
X-Forwarded-Encrypted: i=1; AL+hErEHsPUPhU0WVzK3ek4PEnVLCRAiyrFlTZwqGv3ZWothyuv0pYZSSApmF3lYXZgcQUhw4vYrK1k/nIQdnxHtpc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Df4IE26aJAGVwGhkNNPVNh7fp8HIxeIdwOMGOUxodiYpl16UQ
	imm+1NqkfFkp1HSffcFbOCnbCcJj5GUxtGCpfvcSb/V+qA2ZG/U8NJc3
X-Gm-Gg: AYBFou2nY2wW+vY+zTktMpHofvGy7U8pxFiYYrzPZ0I8p/WttLGvGx0yNRRryBPKBpT
	18Yx2jdtuVSBawIR9zC6NHxIgRmQaBcnwapiM+WFT1audco/WJFYO8h3nPvgBqofKHg8z8yrmM7
	2AVA3upI8eSFPMxLke3ipAhR1VIErhpjrBbOvu0jJUYrC2xL7iRX44dLyaf799fCWQcgmFPRIz6
	/4Aoe5KTjers5ZWSo80Mkqv+O2KPPqFKPa+46+7I9a1ayWZn9XUaHJpFYLoublVvvG1ScpcDHCu
	EfVAve4k7HE/2ZRygGsVfYENayNtBK3czExaSSUu1bmkJMtpDDuQ9t/MNVLXq26HBHWaQdWdDdT
	4PRjTLQ6ZbU6TSgY563y93POCLBPMkZWWxYFdrb7K08ET2AlMmMJZuwTacr+jOyONo6BTQ2X2tZ
	/xL+R56lc5iW2gVGDQuMaKLbMZ+/9Hl2uJxv00exPuz6bFrUGUA53mA8ADVpm6gJ5DXux6PpasO
	d1RKiDH9VpNVR7iBewjVBavLCrYoSf+y8Xk8fXjkUrmfJVCSynHwFOqhXYRmaYScLKVtOTX075y
	xZm8xKYSxf+G3+xxbYcIalGNv73yNJLpcZVim1mkWdP8YVasRYMZ58al7JwPgITusIDYUtw=
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr42068645e9.0.1795157953446;
        Thu, 19 Nov 2026 22:59:13 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.128.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm68378915e9.6.2026.11.19.22.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:59:13 -0800 (PST)
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
Subject: [PATCH net-next] selftests: net: reuseport_addr_any: report epoll_wait timeouts honestly
Date: Fri, 20 Nov 2026 07:58:55 +0100
Message-ID: <20261120065855.22628-1-emmaonana18@gmail.com>
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

receive_once() waits 3ms for a packet but only checks for errors
(i < 0). On timeout (i == 0) it falls through and uses ev.data.fd
uninitialized. recv() on a garbage fd fails with a misleading
"failed to recv" (or worse, blocks or returns a bogus fd). Report
the timeout for what it is; errnum 0, since epoll_wait sets no
errno on timeout.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/reuseport_addr_any.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/reuseport_addr_any.c b/tools/testing/selftests/net/reuseport_addr_any.c
index 1c43401a1c807..2e8aa83f68dd0 100644
--- a/tools/testing/selftests/net/reuseport_addr_any.c
+++ b/tools/testing/selftests/net/reuseport_addr_any.c
@@ -155,6 +155,8 @@ static int receive_once(int epfd, int proto)
 	i = epoll_wait(epfd, &ev, 1, 3);
 	if (i < 0)
 		error(1, errno, "epoll_wait failed");
+	if (i == 0)
+		error(1, 0, "epoll_wait timed out waiting for packet");
 
 	if (proto == SOCK_STREAM) {
 		fd = accept(ev.data.fd, NULL, NULL);
-- 
2.43.0

