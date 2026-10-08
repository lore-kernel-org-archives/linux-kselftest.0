Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE493932F9
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469659; cv=none; b=CW5h1C4E7iubkRlLwn/glayMpyOfaDWxupvoSS681RTTjhm4wUsyupTQe3sQLgkRIffL/oeoyues4egzRGxjVVNCJPczDkBpLBuRh3L5fF3qWyZ+fhWSuOZI/j5eibHHdzgmQoCd1tkCFXWrIeY289cRr/QVLaeADkEW2Aoi5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469659; c=relaxed/simple;
	bh=o7kDUy7ifRwVuBB/aVT8S+5DoYKMzZEbXLg6+PuzSWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ouAx7VsDmkb1ZbIugEMac7L4tlstET5b+s/G9Own4HjtWNXEJRnw60NBjORFByJwo6k9bsgxeOUmmFmFP4LBua+3NdWDGHP/BHmD1tWek1vDRaPEfiCvHCSAbLtklTw8mf7t9vjwCFRnYog9HSyqXkUR/xvfbK/suMoDcN+zUpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSZXzM0f; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSZXzM0f"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so52234185e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469657; x=1792074457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1YqcyVpnEV64UcHAyoY2EuKOz6TzXsl4r9+TaXC3HD8=;
        b=GSZXzM0fxMEcZimZxKB/3BpC2qWtuD/6ASc7JGNpZ6uVE8Sg2UhYLrag4ea6wDEFls
         AiN0vqyaMHeb9buO7R8ikCvPn8Ae1Zn3f3Bp2KtaoFXSv5T+9jwapw/ygAtHl7ntUXlR
         EM7KTZX8IUVfv1NI2P/S2L8iMK9hPaPD5O7PHYO2uccUbsjE3wL1SN3VaI0U1FH977I2
         PlnkOjr0yIdEXSQK4U8zEnY0GwliNe9YvTS/5rlGjuPAi77ULh6MqPJj2M8uO1ple581
         OKUDxzC5dCGDJhThHlFOW0aNtjj1Cer+rQ9Y4aQgDghPAwppc34xgp726G7wb5YDISMZ
         K+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469657; x=1792074457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1YqcyVpnEV64UcHAyoY2EuKOz6TzXsl4r9+TaXC3HD8=;
        b=KoYgsyPF7IXQtnaVrO+pSxFrblv3lCDMnVe9rZbikffe+pm2Y7HQvoplsG8Wa6PLb2
         qr1hpaZ4/s8vItP+790jQN/hwLZCYbbXll7x+qURNstpVj28DKpTqJTEi/dEOROZpi7m
         RPlt1sc/Tw4fw97sbvQNKCY+aNT4TdTjYyULt+VdF8+yOFvblajNUgNNTSBNmfqL8NSP
         LSLn0lILCuBSi7CAkpR4z2g7Nz0qqjhTCiVl55ar63tsdVtQX8ph0WR0WNf90VR69Usp
         Hnb4KkFsjfOLtbtk2lPF+lNv2NiYqUh6jmh6u95m8w+duG5rJE+LUZV4cREYl9ep4p8p
         UOkA==
X-Forwarded-Encrypted: i=1; AKwUvBzrhwr9zpdyh/ZRdBKDBkLsaY9+GHUKFVqExFJm9gUkX0eSqhBKz0+IURLs5RzDubY4e6zNAyH0QcJY2wxWRv0=@vger.kernel.org
X-Gm-Message-State: AFuF++kyw1CtjTV2Pde9x7nd88EY7x8j4pDQL0nc9w2X1K4Yu6ZofkLQ
	d/VB6K7b+e4vdrZse7lJebK0tle4x6KVkUgOajdiNyw91/zNDFfyq+Mm
X-Gm-Gg: AYBFou2+RIzLj5dJCp3xyMxRg7+axuoeZE3ecK9J6WpQHpUU4SnB9I/sNWOLGWH8olW
	UB4GFicQ3P7H8cQXuQo1TJNnttTiX1cv4Szp4xCf6Z1XycpdCmWX5FGIo6JrkE1Hn8Grmsa9Qvg
	NHkEcK0L5gOSRiMeJq/kyMMT0Rhnqhhe1g4a+gxrhMtRHbSe+1NmRJkvZT0M02dn5ttCfkhdx10
	DNqMVnD3u92FNN3of0NG87fj0k6t4g/0x+rETncJm5LOndO+Rg703RFgd/MH50eVpQS57grbKxB
	HKpzczYcdAqwcnRzA6Iu/2NsxnzwCgR7nE3uGtFXi/RF0z1lYpo1FkK/90+4lEdT05cNVtqeKVD
	ghx84YWCex3UTh5+NwKJ3GHHdyzkKbQlC00LhVJKi63tZIayNf6wQVujFwPGGqEUzxzJuktEQ+X
	tws+IJf6dOEgPdUw5REDNuJBXedNhGsaVUkW1F2ly/R0DLsiyP3kYtz7AziJWMBporbFOpxaGtu
	yuvbeHiOcKaRpF64gx6dUY=
X-Received: by 2002:a05:600c:474c:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-4a18044dd41mr98405585e9.17.1791469656515;
        Thu, 08 Oct 2026 07:27:36 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17fc664d5sm68997305e9.0.2026.10.08.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:36 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/27] selftests/landlock: Fix the snprintf() error check in matches_log_fs_extra()
Date: Thu,  8 Oct 2026 16:25:49 +0200
Message-ID: <20261008142604.39107-22-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By storing the snprintf result in a size_t, the chunk_len < 0 check
could never be true.  Store it in an int instead, matching the return
type of snprintf().

Fixes: 316d06b01130 ("selftests/landlock: Add audit tests for filesystem")
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 9abc2adef79d..90f63af1d64d 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -7453,7 +7453,7 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
 				     (extra ? strlen(extra) : 0) + 1;
 	char log_match[log_match_remaining];
 	char *log_match_cursor = log_match;
-	size_t chunk_len;
+	int chunk_len;
 	ssize_t escaped_len;
 
 	chunk_len = snprintf(log_match_cursor, log_match_remaining,
-- 
2.56.0

