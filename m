Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4F3911C7
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469617; cv=none; b=qvAwT7wzVUOX/039W+3/UcxBjwQ/YvqSCetdzo2Vk2g8dJ10D5FKk0Li2HWhfg/8Qu97SBbd2kcMHwHKAR8vE8aDdJIzuQsSTtF1MJ/W+9YIZ0vpgyStcJCjV4ULVloKqbOMZJQaJK1iC94cv/17RhCCnnEArMwhtcUKjIT40Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469617; c=relaxed/simple;
	bh=ByrU050C6mWf9A2+Pv2MNQgWCyvpMO6DzWw5vep16/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N8bY3GRyW4W2b+HGZe0nFglKAaZafQ7HettspvEisON3MxAXoZK/I04/VHAA0EOFvX3bSypRJlNIH/RHWYNJZjVeYjQORIEJu2RVuv+52Kp9xpZDYjDoWd2NJzmHj6ree06uCH8Qzr59yBMqkwYFpgq6bWHmUtdBRuNmlhzIm7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVDSBA/7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVDSBA/7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so52223905e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469614; x=1792074414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgWv44SDiYSXnWDnIpS+FVJ4yK/DbSj0L12XhfF9ohk=;
        b=NVDSBA/7fuGf3y10eUO5W/QfL0CcUIMvrE5H/P/h+nVKFoCGdBgXlamGpPOXj+6omP
         EAasg09BX0YolhKez0BoFdCaJI/zn04HUU7oprU1VpA9zq8eKlPLWWUQn4S3l7oWV1QL
         oGMy+GaEvyxorSIgELPhCJ7162mAJvn7bmfQYZ73EAUG7S7EZd17BSA384FiXqGq6EjF
         Mo+6pRlVFFL5tZcRnOnV3bLxHvanQAzGX2XIo7T2b16Y0c+w+MzmZKrDUCtVgy7hByj5
         h7DAHYYK4KgshLmKto/DbhckIyK4Y4vhsNLOtA1yezOYQBmVZRzxK7dSQivRADWeNw5m
         nDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469614; x=1792074414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgWv44SDiYSXnWDnIpS+FVJ4yK/DbSj0L12XhfF9ohk=;
        b=nJJ5A0g38cGr+zHdTUWK+LVO0JYoRX14EjM9GK+OcoowltHojVXRUYccPdo+mex2CN
         ZrXYj4qeapneWaLSm+fs3M0geOpIJPMjpYM6bUb+XaNhLvwvUmnrSLzAX+1pyLx3ORcH
         Muet1g3JbIkymvGxsUCdMQ+f9HoxK+vPmt0+QsOo+WFX9223F4YX2JZu5clZcDMu9ndK
         GBpDDEFzvKTvlnyRzhV0L6Y1Ol/Gf+lJCXpVGQ+XWAn8oXp+T0KWEnGURhwx6pto07WU
         Nb267QoWL2NcWlkuMAq7FXhPYmljfVaw+MsMhJRnvU2/XHzgFWXpqJB/E0/78KJd5Ink
         wJJg==
X-Forwarded-Encrypted: i=1; AKwUvByIp1HiGw9AoKcrcqjWEW2htHtu4BrhLE3gWk7vdm+/c97+RxcL2K/Q9P6oxrHPJym8lfYmqCWQU8hdY/bTy7g=@vger.kernel.org
X-Gm-Message-State: AFuF++kjNBsnK3bo+gQ4ZW8VRZwBB0CBbo325FNITK+ob6BKEACLyyPK
	z9mXLD59QecXgHnKSpuM/sJ2nTU24A8R33HPTo2K05+byJcqJAR69ymb
X-Gm-Gg: AYBFou1mdKTDXb321wOCe9oVT281FGYYRIkaOoVC1aPJjWR7gmUNCRrUQ9tSQQk48Cq
	ChClJ0XKXF3AgSwDVX1UUtyLDsMNGPsjMFlBbN0M6JnxZtw+WG4+iM4uFdqE+E7JEXO4aPvH2aA
	PSYyWp2h9NxmqXjYgboCNVkBo80CQg4cnuIEOxNHbg7dlNlXJmOYekUGs/t2Perlef1qnuy6FhO
	tnV0dhWVKYRluj43HYcLVQQCaNkE4/8iTWxAzFhDD5vlrKdUQmiW9tcN7D1WsScmdHAtl4NwgS8
	GBGkFfXuHn96zA4/2Od2lt9Avo5Ztu6hg98MBxb5SIyc0G1fPdS0laIQXMvwwjjBH/tvLOCSrXJ
	YNavKtCKbrhUg9iFJMVsbWN0ET3WsgIhSL+Qmx/64fMt86BjM5vmCRuSNJ/oxnFKJ7diD8+gzwt
	n/wkGUK4gcZd+HxGiizDPBquK27N3Z/lY2TLI+T9dC2fJ0wVyc6GcERfAEIZA2YYoylvVOV7s9r
	SeQwxoHst0GsrDkl2Z21qYcC4r/2AKSig==
X-Received: by 2002:a05:600c:4ec9:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a18043c4cfmr97014765e9.12.1791469613900;
        Thu, 08 Oct 2026 07:26:53 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17fc4a588sm124941545e9.1.2026.10.08.07.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:26:53 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/27] selftests/landlock: Zero-initialize the buffer in inconsistent_attr
Date: Thu,  8 Oct 2026 16:25:33 +0200
Message-ID: <20261008142604.39107-6-gnoack3000@gmail.com>
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

This buffer is passed to landlock_create_ruleset() a bit further down,
expecting an ENOMSG error.  This is only guaranteed when the buffer is
zero-initialized.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index d20ab8f0862c..4e83f9c52a6f 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -25,7 +25,7 @@
 TEST(inconsistent_attr)
 {
 	const long page_size = sysconf(_SC_PAGESIZE);
-	char *const buf = malloc(page_size + 1);
+	char *const buf = calloc(1, page_size + 1);
 	struct landlock_ruleset_attr *const ruleset_attr = (void *)buf;
 
 	ASSERT_NE(NULL, buf);
-- 
2.56.0

