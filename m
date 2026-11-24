Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555033;
	b=oTk1RMSxgSPRv0jlicTX/K/2x9kAqCHoiHR/iGC2ECUB7ZR9Xur3C3+sznhy3bA+7w8+
	 wxRyzrijmfrlQzC438ZlHO8hxb4w4U2CzSMTUOOepgio9p9BUAHsx3pYLhVV2kc5CSJfO
	 e565ipvEZ6U6C8vw9OfNpVVZxafGZa4q8sKDyI2MqtA+AWq6pgvOAHu4XUAq0u1Mf60cF
	 izq3puv+nJXx0t7/ZnB6EJ4T1ZEAVJKoz541VkHRj0ijZasgPLqjZxVDwptjLMbVkyUME
	 /vPtc6+wRNsxG+2q+AoyJKDjCxf/OwWO3AFEYHh+g8kBlLjO/OaxSgen9fjyXo7TC3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
	b=LCmwNH0IhcNepqaTyMMgxkNw1VbD4LAgg2MGy83Tqqmn5WC01kwdRubL8bhLL/jxdha2
	 zl9IjqgdzRyYHY3TdUPq3i0O2IHtTk2OIw9pi6nSDT0UYmMnQ/Gq/PnghvGz32MGiWvxb
	 PLM3n2Su5KrreHBFuT6JTc+Ns/2sMHSZF0+eCJUwImrfu0DbuygyXRiF2A8ijE8dCpFqK
	 zhxIclnAayu7S4EYt5HRHh1amC/4WjdcQu71w3/S/5TPsdvhHtXyM3+iopW8Fb9Re8xjr
	 U3mBbacGI+YfEuwVgV1OjEawpFWarl41SzrhEt6cAJHCKWLunFYSHB/EMzEBYjf9g/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuhBzzSQ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82AA606A6AF
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82AA606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuhBzzSQ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb8ecdcbb8so3553795e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555026; x=1796159826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
        b=DuhBzzSQIOmob5iiMXjAspZZK4dRaT2eyOggvVWtx6Q2OP9Sp9y1lBkgw3uul1qzE8
         72OVbG5PhPpYZvJFMgS+BwcIMli2L1YWDlhKq7lWJSxudTX+FsbdrAkU3tL/a7w8iYF7
         EfSNMKPJewpaHr+dqkGZ4QIUryrR37cEwbpbXVe7V2mo0HmNGPRdYJWUlCglGvpGW0AI
         w13htGx8cAnyPv7+ZYp1LEBujYn3k+wFzQEaR4NkKYsdcpc91DvcN4CBOpl10aWiN/cn
         pCE+bsI2P6xoVECfHM2Gx9sebBeOFe58Qi16fFvFYFZtKKlcbeZDzBJ2fNUa17IiM//k
         +YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555026; x=1796159826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
        b=xhdn6ipv+k6aYPS92sUlO5ggzZnnVrz2rr5FDvhuaK+dd2aq1lZfB7Wc06d1QaQzNF
         NMhN7Cz50sou7YoUYRYsgl1pX0yYWIZ4fXiG9CAZfcdKOI6bsNtnMN8bZsBmtMzvcDFe
         Aq+rt9chjglpmr71BvpO6VsMv2ejfjqITE2yHO2DCF41lt+WrOPlLl1pcXivqPcdTjyf
         7UwOvomE4GA7LpBUk/Rjrgo1HnC5gIoFreimbSM3qRXHfO/h0kvnm9iI/mY/qDI/9/dd
         NAF1uFR04+v4RyU+fMMTJJ+/pYeN1/VxrbE08VyOCxlJRuIOYJ17rWP7fIiPYfdmaBuT
         Sz5Q==
X-Forwarded-Encrypted: i=1; AL+hErHvhobklHOYdwvWsBel5cq5AO9G6F2mn5W32S+HMoy10hhp+MGMNa38uclYIe3RktWL2ZcQKGrjVHDDFv2D+zE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JcdEMtQRinTo9EXscyXQ1SC3HkLFQQGFmdUqhrfDef/2buXb+
	MnVkXA5EAP2CPmQvUCZ47PgmRwioN3sBkbmcWxV6Gmo6u+O9cyjnje/1
X-Gm-Gg: AZFdTZe7wgqTzkZW5brwV6o1DNAQhVsose+fovSHOWML6EyhlFe7xU9mTBsBGlTYUI5
	qdM46TInoAIDnPfHqM5T3mt+3BmPcyIZdiAiYHxZJsuINtbRxruqfMOxg2kbRvTOUPx4odJGRec
	qSmlOpqoPXN4tPqf1srhh6eFKaIniy91uRQrIOPK0P4BdtIEPydCsHOet1RXjS3GBnwI1L7rlO/
	YAaH6C6Ib6HEKCSg9o2ULdPEWZGm4sNReB/CnZub6ggwj6l5mYDawMMLAl1IlTN3BcDiha+YT5c
	26C3HFvXY0K+pFMzEVJv1/AuRQrmrVWeO6yj/FCoGbVCLeRYcYHueLWsDthWqzrU3ESPfgwrIdt
	WQPPbPEY643zjvAUNZCBSgKkPLAfI0HYXMDPjrv2+0ZI25/Ts7AYAx/fjdZ+hnP7cd4CPfQAA3v
	Qi7PXTOSHkLvTob9YHKla2q9kNfOd9oWQ3A2vWjLmUp+QmFVy6uAb5zmq8rrR/OPaPnb5q35bjH
	gPw0wSHD+k9E/HI4AMIeNprWqon/dUMYiEofixbZTVPbEmgQRwlctriwk0ag1rOaAjEalRSq9sB
	rTKPvHbb6KcD81U6TKYtX9aobaZsP+TpuVET7H2NKPxaWeEUafbTMvWFKygilJNPv+qz
X-Received: by 2002:a05:6000:2505:b0:492:3672:eea5 with SMTP id ffacd0b85a97d-4ababda5370mr33797353f8f.2.1795555026024;
        Tue, 24 Nov 2026 13:17:06 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm29347713f8f.36.2026.11.24.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:17:05 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v6 0/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:16:43 +0100
Message-ID: <20261124211645.5751-1-emmaonana18@gmail.com>
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

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 1 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once the propagation patch makes failures honest.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v6:
  - Squash the two propagation patches into one  and add
    Tianyi's tags.
v5: https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/
  - Retarget to net-next and drop the Fixes tags
  - Move the invalid-tx fix first, so no commit in the series can
    report a false failure on a correct kernel.
  - Fix the subject prefix on the invalid-tx patch, lost in v4's
    send.
v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
  - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
    lines within 80 columns (thanks Tianyi for the review).
  - Add patch 3 deriving the invalid tx value from the kernel maximum.
v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
  - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate check failures to exit status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

