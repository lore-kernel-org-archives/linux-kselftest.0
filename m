Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB2147ECCB
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251808; cv=none; b=OumT0Bi2/bK7GKiCvQinNksF50ptT0q/vHue+smk1+J17rW6FOwlPYaXCocLDgJuotQvz4dDPMRQVC6Os7roYbNCU34o4t1L2i5flvbV3oF4MNvlliH8oWoZm2KrrRYu/fQoIOFMgNBPyfw9s21qh8WGKpqDxoRL/c/5gpPjNPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251808; c=relaxed/simple;
	bh=M6bUUW+Us8s4tlnoGjcgnGEWGKM+cZZ+vYh/2H6Y2aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkSus0ksISjLKi1t0NpBYyQ1Jigx9gdtA+i4z8aeI9EHewB1l7wiWnlZixDZwo61BjQAAai3YmC45syPQ61hlll8pdssWoHxiHmuLHZCEUYxDQFhQueM5aVWIA5cBsey01OJRb6FZHcLMNcyqyrqG02hAeZOpytvGS4BIhrm5Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fA3AHtI4; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA3AHtI4"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6bc475ffcf6so1131627eaf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251804; x=1790856604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+reEzqlDosNphymAGhKvKF7gaiTMd0YIMHTRa4Wete0=;
        b=fA3AHtI48mzNg3SrkvBXLIltTFaVElackw79mHdjWQNWk9Cx+pGoxSUZwFJKXa17qo
         s4k9qdxoRTfecuHh7IEcI436d+kh/XnOCAB2PLUO5rAOGacGXRhjD4dC8Kfesyi6uUfW
         VSI0MykFFQHX0aJz5HZX1VD/zAjF9LjQ5V68uV4oLH1JF+wY0qpCS5ucyeEhvZ+IQaEZ
         wAPTRdz8QfKLzqq82Ad2XuepVOpODljuZHrWsXISGStPPIF7R61ZuvqszMPAZpSMa00m
         pyF5GwT+RD5lCb6YBEFIopxSHrf99a3Db0D2Nanr2bqiB3pOgQrMKxguofXqGWewg00d
         19pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251804; x=1790856604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+reEzqlDosNphymAGhKvKF7gaiTMd0YIMHTRa4Wete0=;
        b=qtktvLezUe6S9URtBhcgT9OcVSFqnXAn1dR0k8rZTC09NOGT3+J5ARVLCKXwJ4SIjx
         BV1pEEWgIYft22ZN+x/Y4rO8CAx3/09TRmSAXBBF2E4mkxNAlCyXLWtYzhgg8qgUtZUc
         c8varkmCkv08okeZs25dON3ShOzxqbYQ3/yHb0AeMhYoM0hEeiL3Ozds4gUYLRYKWX+e
         wN+vFQ3RuSFrT6XeMS/cSHqxEMFH7qnoja6TD+Ayg7TWLC31jyaVzmYtFcGED0ka0+m5
         mHE2uzYyCy22TcCdYyOK0WaABcGajNWwWic+2r//+Sn3FvDx7wbAkkEBxXbNmHcW0Vig
         dPZw==
X-Forwarded-Encrypted: i=1; AKwUvByQ5wWxnS6NUirn40qmv8Chz3V0hOJBIK1a4tTted5nSzvfUb05Wj0N46rXO08cgX29uxGiPWPXR67d4Dlp+28=@vger.kernel.org
X-Gm-Message-State: AFuF++kxTfvVIQxNzBtAFVj5kP/cPQAUXInCko0dhL6e6xNd4WBQzkp1
	1EWJRrvmaIUgiPgZmhFbLmbj954zPHNp3t8aTO5imgew3UfnFBFt7PCk
X-Gm-Gg: AYBFou1+4w3w6ZfxTFcYo+NNAjJ/GXHzqYFQMy7SqWtHXTa9V4x564pU1fNf9bBUQUA
	cH6rySYHmf/PVmaYQqiJJYp0JvRUaS/w6QdLJnkDKtEHOXIclmFT6CfQGDNWHUxYPZqNJc/ottU
	u2LkRKdW6s57Q/vqxePSLpO1smDMRwC/704qO5NJJxseTT8pbLp9fPbaAc0t/7IA79XSxrAvT07
	OWrGkoYU+pRs7RMQhQSEvUT5KxTi/E/xNyBDzgUgUAwtio6vVtMVNbNgnQCWRMB3IJ6o4O+Pygc
	0zJ/8EM5K+uvySkf3Cx5BIBIJBDBI/lsxXkid07YeT2iMdNi3tZTXX/3fVWKa6N/VZPMgot/zwh
	fWTpjCRz50+i4M7JaXTLx0MTcEfhWReIZnb+wcJpVHxRLsB7u+2R0eOeoYVkJ9JqrwkxXRo0P6r
	5ZruzXIn4v7TWMM4R+y04HXKIL1lumgCtf0ldsadI7ty8JhUr8HocbBxTIP+3nHShf8e9kUQlPq
	JjIW83fZNe8rq9WM4Fi87aUsQ1TI+cROdzMUcwB
X-Received: by 2002:a05:6820:221e:b0:6cf:c878:2b1c with SMTP id 006d021491bc7-6d43f89b70cmr2173148eaf.33.1790251804550;
        Thu, 24 Sep 2026 05:10:04 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce763f94sm5018070eaf.8.2026.09.24.05.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:03 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/2] tools/nolibc: fix verrx() and errx() message formatting
Date: Thu, 24 Sep 2026 07:09:57 -0500
Message-ID: <20260924120958.23698-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924120958.23698-1-danishkhateeb03@gmail.com>
References: <20260924120958.23698-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

verrx() passes its va_list to warnx() instead of vwarnx(). warnx() is
variadic, so it takes the va_list as its first and only argument, and
the conversions in the format string print the va_list itself and then
whatever is left in the following argument slots. On x86_64, for
instance,

	errx(1, "int args: %d %d %d", 1, 2, 3);

prints something like "int args: -1699009032 1 2", where the first
number comes from the address of the va_list and changes from run to
run, and

	errx(1, "%d %s", 1234, "foo");

crashes with SIGSEGV, as "%s" takes a leftover argument slot for the
string. errx() goes through verrx(), so every message with arguments
printed by either of them is wrong.

Call vwarnx(), as verr() calls vwarn().

Fixes: 9da0f529c089 ("tools/nolibc: add err.h")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/err.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/err.h b/tools/include/nolibc/err.h
index e22ae87a7289..61978d537ed8 100644
--- a/tools/include/nolibc/err.h
+++ b/tools/include/nolibc/err.h
@@ -60,7 +60,7 @@ void verr(int eval, const char *fmt, va_list args)
 static __attribute__((noreturn, unused))
 void verrx(int eval, const char *fmt, va_list args)
 {
-	warnx(fmt, args);
+	vwarnx(fmt, args);
 	exit(eval);
 }
 
-- 
2.55.0

