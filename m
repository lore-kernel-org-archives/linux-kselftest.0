Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646578;
	b=qh1t25KFf3BaqjBY5mrKGeFZ3zIvBMbXFSf08/ZUwchWLnLjP13wXJN3pHqS+MsmyhGR
	 gQNL++lJoJhnKwoINFtDfWbOSQ2+lRJO3HFPh5F2bn31aSxv2dJDtRh39begICbrTaeu5
	 sXfblZB7IgzC7fvugMCg+HEny6nJQaS7ba/9M7UUa732eZmpvM3IGNnCW3mHAguoFWZY7
	 sW4Zqbudpj08FoseBqDGLr0O/v6FneR1HF3i3hlLyAAbNRW6d5rk1kB2JIqD8nHMl9dhG
	 LBtHoRq/P3BfzEo7SyUjIMyjsrHMbt4apJJqtnWObwUBzgq9Cg7HtApRhR4znjqBumw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3L/lDtmSjNcVzmRigKEhrofpE79lZ1IJN11/qW4zHvM=;
	b=tLctAE+5QV0wFrrtoxIZvMiNc9v1eeidsNqoI0ZdSANH4wGQ5UtTc7KQ8Hiwy2sVk3g2
	 pVgftr1PYs+Mv1GcN60c9lqnOFUmPYRPDkGhgh+n+AdyEeYKmF6q7g92YXH+v6OQDzknt
	 tlXkegc3nDZ5psRH2nNINXinz1N9WJRwYlX9uQJKzYPjv9/atBuHBjtUuUpFy7ZnfpgVf
	 Yt7Z2RW4WhQ3wG/L0awZLnbuvYz4HSo3waSjXvJ+ovZF3ikiLKbag1PKh0sCFOzrT6YxT
	 rZOGe0RKNwtKkH2gdpESCoHhcdBfeH+41N4kbxEf4aOLJUGBODEBFXlx0DLeAMHbRMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chihsheng.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hidp6np1;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78B606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 05:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA78B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chihsheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hidp6np1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so1909321b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 22:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792646577; x=1793251377; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3L/lDtmSjNcVzmRigKEhrofpE79lZ1IJN11/qW4zHvM=;
        b=hidp6np1w4lB6HvB4Si8+x6PctJhO0E1dOFcIJFC2o0MHK9y7sji6ZxtWZgEyEOyDq
         nbxODKk3yS0bz5HTvgEb9IanfwRBTH6Sp9h5CHXgVtzFHRD9Q8j9HuXwkHauQlyrbGre
         VMKzhVwi51OLIvLOc1Yx6zt6nyYykDcjSPma84qMJppCtocQNdOzKUORpcf455JdGo9W
         hUe6DLPXuvxvXG8PZxhQBfGtON7/6Pv5qJj9HXIzH3rC1UwS7wEFOskqW9I2tYmD91XB
         WHcF22ffR1ywWpz9OV05MScfYOEfwjh2VUQJ52wy47CJHcogaqKegEF6xeN9gVLK72dF
         /NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646577; x=1793251377;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3L/lDtmSjNcVzmRigKEhrofpE79lZ1IJN11/qW4zHvM=;
        b=Ao/IAm0BuizSwMlbJKShtP3EFuhsLGDgci8CConkS8z4mrVkyHS/4W6PbbMwDf9Jx/
         VHhAFDb8TZHt9PlntrW1TRr1/0ZYufUbIh8wKDHnOBVg6Rs/GyEJzfBBJu301g2PhG/y
         EJ+jUscAjb9Upfssi+U1YwPFgP+BqDino7AxPpVAiAsq+uK/l0v6fNSfHZLQHL1esBms
         GD+7Z6fuJtGdilKzte6RnndNy1YdUPvaKnn7oohuiFNyNJvgsteuZ38kSx1rbrWrKHFV
         BIMMNm9h/RULCmjVZm2YAH6VhJ3ibixJBObdiN+3aLPrhas96og0V1P/A+NONlZJjPTw
         DBPg==
X-Gm-Message-State: AFq9FYIv0qb8LvbEoTahQ+XVSObdKIkEgqSBV/vGpsLRKconxTPuUEep
	7yIxGM/dygmTLcnuLK1XdizJwV0lbbILi60KgCQyNc3p5VvHCQCtnR922KcsanKj7pUvkxszLF+
	yrsoiGl06qEz8RBu8Tw==
X-Received: from pgme24-n1.prod.google.com ([2002:a05:6a02:6c98:10b0:cc7:4919:5ed9])
 (user=chihsheng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6e86:b0:3de:b120:bb88 with SMTP id adf61e73a8af0-3e287b9dddamr2850752637.2.1792646576926;
 Wed, 21 Oct 2026 22:22:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 05:22:45 +0000
In-Reply-To: <20261022052245.1138709-1-chihsheng@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022052245.1138709-1-chihsheng@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022052245.1138709-2-chihsheng@google.com>
Subject: [PATCH 2/2] selftests/memory-hotplug: Use $(id -u) instead of $UID
 for root check
From: Darren Chang <chihsheng@google.com>
To: shuah@kernel.org, david@kernel.org, osalvador@suse.de
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Darren Chang <chihsheng@google.com>
Content-Type: text/plain; charset="UTF-8"

$UID is a bash-specific variable and is not defined in other shells such
as Android's /system/bin/sh (mksh) or POSIX sh. When running this test
on environments without bash (e.g. Android), $UID is unset and
'[ $UID != 0 ]' expands to '[ != 0 ]', causing a syntax error.

Replace $UID with "$(id -u)" so the root privilege check works across
different shells.

Signed-off-by: Darren Chang <chihsheng@google.com>
---
 tools/testing/selftests/memory-hotplug/mem-on-off-test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
index 611be86eaf3d..11fb70bf1833 100755
--- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
+++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
@@ -10,7 +10,7 @@ prerequisite()
 {
 	msg="skip all tests:"
 
-	if [ $UID != 0 ]; then
+	if [ "$(id -u)" -ne 0 ]; then
 		echo $msg must be run as root >&2
 		exit $ksft_skip
 	fi
-- 
2.56.0.257.gf7497c7d27-goog

