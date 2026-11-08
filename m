Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169466;
	b=vNDLf2EsL39F2/nd0+l8GW4l4ffhld9IIn2axOrutJn/lDKj8o9FdWvYQitN3HgZHQRN
	 3zy+tfWtounUyr3KVwnYqmYaAowpyVF8QwqcKgn+JWpPqbZq/aJDs6ywfu+JyGiJa72T6
	 8b1l6Po8HC6ygZryGuh/+N3GFd3PLN2K5F5f8CCYg49Tod774FlC24SSQR2pBikmhr9Ia
	 a/wTl1lLZ/jWCR7aV8b9kP94hPRh1qX7MAuGrKj6h0Ca79WfAw9vLPvL+X4ZzmjAKM5gD
	 wFx3o9YeBX9inflQmPsSZf/4it/y2WTICAeIoGr6qsqFrJQsnmRcKQztqIu26NM3Tfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LVXPEVlyVhyUrhrzslMzMs3XMd5k7yY1+/ztFUw4sp0=;
	b=X9GO/PGu5rjYK8dnGh3IEhC9fXxzGY4ih201Cp5ecKFzSJ9ePf/+u8G1eIls76iB5jXL
	 00k+sO0J4SjuF+gRJZZqPMlGbm0HG3b3PGZBoKM7uofKveymH4b+wRlLJR2qr5p47Xs1k
	 KdnEYRQ493fOXyU1so12CwdRiLeRx6rulsciZaHESM1As7CZu0I6jWqAME+a36eURt6w3
	 EXSmpfUxNrtyjEWBgcbfg4h0sm4A+anoPaYMs0kWHSEh9dEdbhlaPbIHY4FtpMZP1AdDG
	 eKf7eLCzITNLV78VagotZvtz3+KWe/SjXmU7lachB9JoIUe7wiyF/eADNKvqff3wkew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hRiL58/C";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D46082BC0
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 20:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8D46082BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRiL58/C
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2418195e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 12:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169464; x=1794774264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVXPEVlyVhyUrhrzslMzMs3XMd5k7yY1+/ztFUw4sp0=;
        b=hRiL58/C+yEOjBcUCIMc4lrMyeaY3yRbL5vApL5nAobdmxS7c6/W8bhLRKoH51w17s
         iSdfLvaRR2EE4/PYFxX3MzoPef/OExTG/rX9WeGaV77qJeusrE7ZlaML/f8nghZVZQNz
         ZpwhUMXEjxc/6lMJ1Z6zrCTcSN3ssP4p9fOO1jZ1et+YmgEb7YQELg8tWFZHSNO8KOZ8
         QALJHTS8mqg9tHpUgCYle1S7va8g2yW4OSQYEP6cnum6tXtzaEZJAgbvTguwDZkcZzCh
         hZfOk6Bv03aF58fjMhgpT9Mx+h7JU8sxpk6Ht2rhHOALGZ+Q8M6RwoHHBJuU+BcXn0sr
         GZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169464; x=1794774264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVXPEVlyVhyUrhrzslMzMs3XMd5k7yY1+/ztFUw4sp0=;
        b=efdXLU0NrAsvHTQM/uG6ZTVPS8f2QCcQIg9mxzseQL/NsVCppMBWSOt8KGjAEaCERl
         Ae8xsOrP0w5VAihJH2vjLTPLVhPSfdLfGYEIh42N1GW18XISo2bINPnR8d5vzOizAHV5
         y5JnXOb7kQ7KFzHGNpPkFOJv6WpFgOoXoBIscez3P8EUkSdTb8Bm6c2RUi0fjGsjfnFV
         lfkUn6dN90wokcE9KaDvysN83xKnjdZQYGKyX9WvA6lFA5ol+If5g0IXL1OcuIje2X2L
         non2xtb1Eb9L7JV+/ugzOpRF26kWP/XHeR0F061qN7VHu5mvYN35u6lbkFX3kzXzvO33
         ZxdQ==
X-Forwarded-Encrypted: i=1; AL+hErGaYrPIJ8VqG3ptxwVhFzA2AVOyz2f2fEjAqvaOGz8rnIpmiQLtYK7kOCx2l+7YKhCP9QZETl44dV1Mbs6vZgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eaMRooRVlHuFsopxWkzHlBFIB66Zle3kVlD56686DexssVZvV
	tebTylMaCkdFcaGE+vWYGCNtPNrVQE6b9UP5y9DWcrxJl20WFVQ+w6iX
X-Gm-Gg: AYBFou3D39ap15tT0yYbXByvxmOaMIpjrESxBFnWYTp0YLGiCkq0ai5ItPPtov0Ys4H
	lOwJwlyT2vbq6WfXXQyF/JpE1jiubLhFETvzD18tf8CdLr9b6E67UBFwSeLabWezl8tSwNUpmXP
	K+U6RDPYo7k91m3HRBD1Vpz/+0gPyg/2wQOfineXlsaWv6mzOP2I0TMbA+KX4AQWjwM2xh1fvtt
	cwD3XPPpqyS1uIkx1wE4MBjyhk6Irv7cf+vtfC5AZwIkkJZ6/K9w+O6tj1WPwij8ywelw7rVq0I
	o+S1cxRcK3F7kA+BRUy2etH6XVibuDz9EP7HeLyJYSMb2oK5jE8R+1/kanNrkZ4B34PXx2xMwZE
	6/cXblqU68rswC61y1vN81EkgdqD2+xn1y7aDwKjdJQH9G0Nr/nU12OdYkwRaeOmkMHcr+fb1MF
	3dvjQxOrIpcerYmrGbHyPSpv/chQA81XSneF4n0yOh8y8bAykVgBOsMViNMKYbisLRDYZAKfNc5
	rXX+Qno2ef1pFYyiiJCKyLiLzjKXbK0Rw8R6COx64Ya+LLL6S+AEEWtbRV+7oJDMxsWR9al6mSZ
	ItunU6rP4yG6Gt0YqQensnwskozZYE5aGN0uSvXiKFwyttJJHHTdfg==
X-Received: by 2002:a05:600c:3113:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4b963c91d7fmr43603045e9.24.1794169463555;
        Sun, 08 Nov 2026 12:24:23 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597748acbsm5733788f8f.44.2026.11.08.12.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:23 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Sun, 08 Nov 2026 21:23:48 +0100
Subject: [PATCH v2 1/4] landlock: Fix layer composition of
 LANDLOCK_ACCESS_FS_REFER
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
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-1-2b405fc1b3aa@gmail.com>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
In-Reply-To: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

In landlock_get_fs_access_mask(), only add the
LANDLOCK_ACCESS_FS_REFER right if any filesystem access rights are
handled at all.  This prevents us from accidentally treating
non-filesystem layers as if they handled LANDLOCK_ACCESS_FS_REFER.

landlock_get_fs_access_mask() is used when initializing the layer
masks for doing access right checks, so this bug meant that we
unintentionally denied "refer" (e.g., link, rename) operations in
layered cases, where the same operation would have been accepted if
only either one of the two layers had been enforced.  If the rulesets
individually allow an operation, the composition of these rulesets
should also allow it.

The bug only manifests as soon as one other layer handles filesystem
access rights.  Otherwise, Landlock filesystem path walk is guarded by
an early exit for the case that no filesystem-enforcing layer exists.

Reported-by: Dwi Siswanto <me@dw1.io>
Link: https://github.com/landlock-lsm/linux/issues/67
Link: https://github.com/landlock-lsm/go-landlock/issues/66
Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
Cc: stable@vger.kernel.org
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index 935e18b12b3c..d9ebf4857fce 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -262,9 +262,16 @@ static inline access_mask_t
 landlock_get_fs_access_mask(const struct landlock_domain *const domain,
 			    const u16 layer_level)
 {
-	/* Handles all initially denied by default access rights. */
-	return domain->layers[layer_level].handled.fs |
-	       _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
+	access_mask_t handled = domain->layers[layer_level].handled.fs;
+
+	/*
+	 * Handles all initially denied by default access rights, but only for
+	 * layers handling filesystem accesses.
+	 */
+	if (handled)
+		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
+
+	return handled;
 }
 
 static inline access_mask_t

-- 
2.56.0

