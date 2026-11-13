Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584680;
	b=HT7D73QAz6wSKmdvrZtaTJ5T3YjWioXOWHcGpEYAHDEiDfN531IK0Yb2QIjiWhLQ6Jo2
	 JuOWSAr030+XDIoOoWBRbkJ1z10W0q+dO7v+erMD9WML928Eaj6jPjwN9Nte8rtD58En5
	 KAnoV9U8ETr22ejnwFMgfK/cOlmJmA85dWXgarLROhhSzs+oBlW0Zd5L3ccFEpzYmV1Es
	 TJFCauRzue9yqbS4uqOerPi2t9dSicRfQdV0P+a6Uq0mCONjZNhHIg4vz/nuhUtm2qUyL
	 F+Ljk+yDiKU2n8k0Xch+XiNlsCLnYGDVaE6fCK8zKhwVU+VghW2WgpKiwqTW+aJ89BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k3fq7sobyjyzCNZzJN1bjMh/9ywA3Vs0nu6XoBVK3sc=;
	b=MAae1seU4GCbKO7DjbtuRFVAo7kgcTke+NSm5+gH4EhXBlGTCd/wVBCaGupMr47IyyAg
	 DVbXQHx2rU2t/7sKCUpAHyxnEOnbeXwHR6ad6cyTTodH9orEchWggFySUP5UQN6ngYsp5
	 BsBbV8pqgvp08NANeqNOsxq5sgfTA/1stkNr+clNJKAJWuYrbDl2b0pVMXYj/XVNlgUJh
	 a1Yy8HNCOwzMHd2MpiMCQSzMHmLC166fYP32b4D5PpmB+IT+U5NJiPS2ITbisB3xapKzx
	 StTpAwnKF4NrI8yxa1ib0iQ/cxBlNhSyz36mpzxMohHkmElve4YuLSpWXQ79w2wsYaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Slc2SJQy;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA6D606A886
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 15:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA6D606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Slc2SJQy
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1330746a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 07:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584680; x=1795189480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3fq7sobyjyzCNZzJN1bjMh/9ywA3Vs0nu6XoBVK3sc=;
        b=Slc2SJQy0o+vUZrOsbK+aKIq4EI0IHDy5IaM1eGdDPfCjxpZVYHQRuNfeHwqf6EE6t
         uwe+ey69VctbElih+X+LuaQG0m6fCoNJ6X0jubKAuhE5NmAp4SnGSOD4nPq0XCLxiMLF
         1Gfyzm+E0NbITwpwTA15YJLNWbWKeIWKus8Mknj8dneQl0DuwXpSaSxle+DK0ZJqIJx5
         oa9djP2LKWzb142nfgp2ONsXcM4CZTBRZB4cOdKcqB+B5c4GTwiiVobD+iH3BnvlarRv
         Xdr3E6WRS8XlHl2uVy24nNE8+GDhFQGkJgMTw1bBsJIO8CbaCnKvlkVgYMU+tVgfroam
         OTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584680; x=1795189480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3fq7sobyjyzCNZzJN1bjMh/9ywA3Vs0nu6XoBVK3sc=;
        b=EjOuP1l8+eRLEEfHPcmBaL4G4ChQgT/VDSlw9Mat35lzxMdHR6qQjwzo7l6Thj0DpQ
         6ubo15bj4x/50C1DnwSRb7fTV+Yj+PXucnUZwgDnIDZ1NNc7N323Hfhlz42zTxe4Zv+P
         n+E2+JL5abqWdIcu8hO17K/9XRjykWS4M/0NV8SgIsIrG4glwPRSU1ecFmkq27Xa7iGL
         4w3otXY/cp6YeXF0jPIoW4E9sbpTCNDKvIZoKIJddG73JddZGB8h0Vis8NyU1yTPl6hM
         XfLEhNkja7W7l9oCddP10kV4N85G0QSxEAyf9u3RxvWlbK/L1CRzjZslRqoZlnZu7UwG
         m65A==
X-Forwarded-Encrypted: i=1; AL+hErEDgWjvfBbph+AOIjbV2y71rUExxyOjgXDkFpoSYtLH7rQQ+Hk0MDJ4gImHH71I+rceKjDcA2Z5n2Gh5AfKMUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6dBUQIRR0CFBTW7har6ALpr/sSHd7TgwSQ9kLuKh8zIagLW0g
	032UOGf3ZAIYRBL854wNpfqfHIQbfgfhmNyVBd3iWCeNkRgVNlznp92I
X-Gm-Gg: AYBFou1CTRF0CHRWvi5Koi5OCOt0JcE9XHripGB9KwmIZblvsSPvsd+7NP2dC7ILorv
	9V0h43kUuzig5KkigBukkbK29IMNRs224VL5abZJ4WKYKkwuMmm/hmIw1/gnMUs2F86GHFVWJRc
	jYu6O+lwmeUPJ/6i5F6HMmmQWIq/t1D2rfYiYVmK+04NQrpEbrcyE/69x4zli5JFYXziHEtBOGa
	+z8WxvX5it6J4eW1Wv3urZKZnPLjEqIC2y6agyJ7Wp6hz3ChCY3KiGfAKb4cXy+esknlgN47kRn
	yYSuIdzT7brS3u5iZd6S8FNIUGcHKz78R4+weboMsmwFuUcZ5iAFz0pSfNOgkLy8tCJ7BJv156X
	x20B68WMEp/9cdQdDO1jelZrPjtC92R3bBIyqMKArQRcb3ohXlIbwNluGb1lzSA5EHqSgE625tV
	8pK88ZN1Dx5WofqJiXZfK3HE5jlIMOKyQaGaqmK5TKzBh/RAsMpl2dnfgtsXi+DPu+MAQAXxhSs
	5wNnSTQyweRNztig0XSqm7UwFlmMunU0XDQVoc/p1l9UFRIXcaX5S5S1NWAehEgH8f7LMFthTWY
	DyNQuVWVNFWo9gEjMZCcW7GLGbL9Mok4IUnWGqOcha35auMPiN96/1eJV6J9Ew/m5BXx3GE=
X-Received: by 2002:a17:90a:d44e:b0:3ac:8527:3fc5 with SMTP id 98e67ed59e1d1-3b1b081b149mr2743869a91.3.1794584679691;
        Fri, 13 Nov 2026 07:44:39 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm2064587a91.3.2026.11.13.07.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:39 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH v2] selftests/proc: proc-empty-vm: handle CPUs without protection keys
Date: Fri, 13 Nov 2026 23:44:11 +0800
Message-ID: <20261113154411.568272-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109151912.156518-1-lylin1023@gmail.com>
References: <20261109151912.156518-1-lylin1023@gmail.com>
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

On x86 CPUs without protection keys, pkey_alloc() fails with ENOSPC,
as documented in pkey_alloc(2). protection_key_support() only expects
ENOSYS or EINVAL, so the test fails on such machines, e.g. an Intel
Core i5-7200U:

  protection_key_support: error: rv -1, errno 28

Before commit dee87e09b0dd ("x86/pkeys: Fix pkey_alloc() return value
when pkeys are not supported"), the first pkey_alloc() call on such
CPUs wrongly returned EINVAL, so the failure only shows up on kernels
with that fix.

Treat ENOSPC as "no protection key support" as well. Keep accepting
EINVAL for kernels before v7.3.

An AI coding assistant (Claude) was used to analyze the failure and to
draft the fix and this changelog. Tested on v7.4-rc1 on the machine
above; the test now passes.

Fixes: bf5add391eeb ("proc: test ProtectionKey in proc-empty-vm test")
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---
v2:
- Mention commit dee87e09b0dd, which made the failure visible (Kevin)
- Add Reviewed-by from Kevin

v1: https://lore.kernel.org/linux-kselftest/20261109151912.156518-1-lylin1023@gmail.com/

 tools/testing/selftests/proc/proc-empty-vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b3f898aab4ab..a9d3c973a663 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -77,6 +77,9 @@ static int protection_key_support(void)
 	} else if (rv == -1 && errno == EINVAL) {
 		// ospke=n
 		return 0;
+	} else if (rv == -1 && errno == ENOSPC) {
+		// CPU without protection keys
+		return 0;
 	} else {
 		fprintf(stderr, "%s: error: rv %ld, errno %d\n", __func__, rv, errno);
 		exit(EXIT_FAILURE);
-- 
2.56.0

