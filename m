Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF447D477
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436261; cv=none; b=JEgBfj5fuAeZZnxw8Pj6+HwyrTYF4oouNAOqrZ96P6NaADaD+MV/nIUyIALBUIeirqqJW0kEmdHbYqirfAmLdsX10SfZ6Dl7NAeJnwINyawBiretANpgv/qOPZALXtoP0uTB8AJsOeJVbX/Ze2YhZvDcbH9DSIfpDL3XopuM+ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436261; c=relaxed/simple;
	bh=IQiRPBQT8PoLrQ0+RVIpR2y3WG9M+s7mAoP6ATneTVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=huM/ikTtOkQ8LovNODUBlHypsGT1XNljEWi9zRcoPNy6fScpGQo1YyhNjwfzilZ3NccLOsbkFNhK1kTW9UCb4p+U9tpH2ZQ+jxhszs+b7YEV+90gfUuTTBqphlIxpwOVGH9LCf9dcsdzfdoQV7GY+xAQE9Hdeu2XE6wdE7g+lGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFMuPzKK; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFMuPzKK"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-493cf6d8e60so624137fac.3
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790436259; x=1791041059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiMOLaAgW2NxFUQCTa7UWtVYKX99lRyQl/mvvigA5Qs=;
        b=aFMuPzKK9KZq027fVRl4YVspS7K6T9nnolXR/BwujPUnvKEKUO0ctVPFwvQnn8Ns/y
         Qo1zgF6bT/TRNl1r55p5CDnTY9+GJ81wqYKeV2UzBdGEoUyuGVYxJXofzeF1MHmeVwbi
         HR0R9NMtsgldtt9bLn8Kt6uMuYl/WZfTG+TrUXORHwK7Sb2FrW5vP5ojcYqbMGUwDh9R
         kSGtQ7ZRa0oi2Jniz6GG1gFHL2+j61sjN3MCzo81digy//Qfc6MWdH3GByLqJvPdsP7V
         e3lzaUvpO2E5xbRZxdmpcXi472P6efuSEkMF9WN3j6Xm1zAlbcbhleh9xy44F72ABkY+
         IcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436259; x=1791041059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AiMOLaAgW2NxFUQCTa7UWtVYKX99lRyQl/mvvigA5Qs=;
        b=STDDAJ8kSdPJQXnMgIn9Q/TPETHmFWpNoYN0EGhJgRdg++DHkyIyddGOwH5fyJ0tSO
         uuf3FP4mvqcL3YE2so8eB6gMEvce3cyyuj2s2NkN2gf2io9kuDuYmuR2ZB93jtHF3n9o
         Ig6a3uCNuPAz6tjRaGAtePhxsLOq9Rhro4OcJOglOtPrEl75+ie17BjE+j2IvSiWH+Ss
         kgoQeaN+PMIbHhyPDV0Yluh5Zh3yZRMyWQziuoFkXtp5hlYNbbtFDq5mjm7CGbl3mtHA
         tU85WKaK1lKINDqu1Iq5KxHBcB4QOf6RKgdSGwXBhqX/QMUkDpuzFEQYu5suRWvgGaXK
         RarA==
X-Forwarded-Encrypted: i=1; AKwUvByHf/baHAISKyTEZGYdcBrMsF1G6pSZrM13aYjewVNrusycjrzhxgh5AxU5HkbPqRURincd0flgwxEnaIEpJIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mt0kkrpCrQvTlsVGwhSPFgnOe/pqViB8zdSvz6C6ZTSDSfnNyA
	RbMSp2b6TEv6aNOTEGdSmBg1Za3Qt7KFm15IJ6ISncbVJD8uXDPGm+yX
X-Gm-Gg: AYBFou2xy2CFVTmHMGfa3yNuvU6gGK1qEkQNHDdhs6UYncmsgDWYpdudrksdCAES07K
	uv35z+z4y4MGflpv103a+8qC4NhQE5gBrFHqJgsYmUPNysVeYW97ff8fGsK5AHzu1Qn4J2Qt2LP
	pQAFecqBq1f85kb46He88/vloT/MfRK+QfJppwtjMEItgrfOGSEzbRV1hbBcqBBDn7q4AFe5+2S
	bhyRxZKd91/7RGwYdTy90Xwf2H9xVmFp+CHtjBBSZimREsp26jQhWU8f9gaW1xUrt3SopuKuIJd
	yvG1q6s7s++7ysGEHTJngPfUQQRlnTzoK6O9BHLwk0gxEqnb70OZ7+tQVr535X4abb/EnHVKUPG
	lGNGUU9R4wNzfqctMFTnZF6KjN7xCDT7wZqGHaaUWi7I3AUhjhIYUJDANDlK363rJ7JTwVciTMn
	eNTmct3lATm0ldzjpPLr6GgsYfbPeOhn5xP6pj7g3o+LSy/ubsJhPgG1uxhotR4fDgsjyLzjKsF
	wrwFl6clllYCtAkE3a1HUWIY7tegW6EN1dbJC2k
X-Received: by 2002:a05:6809:17:20b0:4e4:86b1:f7a0 with SMTP id 5614622812f47-4e486b1fec3mr1143351b6e.53.1790436259140;
        Sat, 26 Sep 2026 08:24:19 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf6206942sm4653798b6e.9.2026.09.26.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:24:17 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 1/2] tools/nolibc: stop rounding malloc() sizes up to 4096 bytes
Date: Sat, 26 Sep 2026 10:24:13 -0500
Message-ID: <20260926152414.251214-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926152414.251214-1-danishkhateeb03@gmail.com>
References: <20260926152414.251214-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

malloc() rounds the size of each mapping up to a multiple of 4096,
presumably to align it to a page boundary. But the page size is not 4096
on all architectures, and mmap() and munmap() round the length up to the
page size themselves.

Drop the rounding. As heap->len is no longer rounded up, growing a block
with realloc() now always creates a new mapping.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdlib.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 6c3c620a04cf..dc554faff22a 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -130,9 +130,7 @@ void *malloc(size_t len)
 {
 	struct nolibc_heap *heap;
 
-	/* Always allocate memory with size multiple of 4096. */
 	len  = sizeof(*heap) + len;
-	len  = (len + 4095UL) & -4096UL;
 	heap = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE,
 		    -1, 0);
 	if (__builtin_expect(heap == MAP_FAILED, 0))
-- 
2.55.0

