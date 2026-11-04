Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826554;
	b=IuDhGUR89eJZPTWgI3Er3MfKGPxQcZ4p6h66KPg3st4dBDUCMaalpxWyS3txwqNzqMrc
	 l3XtjQGsGfVYWTuZkHBnabgmbc1QxYu79pMjTxOae5pCyNz8aemQgAmWCtu1tswcrrrmi
	 MNbvFK5duG5vdh4XwWgE90fZvf7RbHCUCel8WJtq7Fag6EOrRrDB5H+wJd7AnbugaiqaU
	 RbU2F8Vju0Sa/8uI08sLF7gSEBpjFRffCWGcOKCDuH1rud4vJYWQWf7w0OmD3nqHKdPBJ
	 YRBBCBWEHHGT3ploeOlk5yjcAW45Q5IEAabhY4y2iEeXsamuyp8VVhpj8FlZ1O0h+GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FwmAXxaBahAboQnBQiZSfiZqfzogCrFIH3WtsyVwi2s=;
	b=givtrx9knEXJjcMVVdKbQ8Zh3kN1wMnrLkOUwMhfgFQA2x6+e3E/E0rlWwC3pRMqWRdG
	 spcKGfr32sNwtgVJ08j8GKcnmZ6mVb5QMnGnk0oKLNDavEQpUKQXXLRUS8MVFTkloCZWI
	 u0xl3NXquv1bNLcIjxD8Ce/67CkzFIfbW4NnmS4dkCFk7xOjcIiqwoIyUzHNOXZrWNjRe
	 wKAAdV8egg7f2AcrYF7Nf7tvhVw0K8MSBYozucbwRKkjhhfILSfKgx6qDhpN7Df2CIYKM
	 qZ1w8OCPenGMDk6WRbd4hDa+8PBaabiKVoB63ZtqZkgsCB3w+RWAn5/cz8DSoaZbLYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCHWRBMc;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1620460A4FA4
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1620460A4FA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCHWRBMc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so11976225e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826552; x=1794431352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwmAXxaBahAboQnBQiZSfiZqfzogCrFIH3WtsyVwi2s=;
        b=iCHWRBMcQht93C+GJcUpbzIdEGz3IzwCqHXybDR+OVilK/BGP9+75mqet1wyp3kCqt
         C5sIzGZHzcoU4T/IuUdrz10/fQZ0CnX8rgDUDzUJa2nIZ8zzF/nl/eHo0htYoSi124Dc
         kSq6HBFe/Yd7iWW33Y3pgpBkI5e1Su5FsvGTMW5qYW9T85FGp7rnphbcJuqPJlBDF7CE
         FPy9N0YBSlAtVkda6gvjtVcCvM9mqZxur2aHKktmr3ephDmqD5qfYx9Gm0nnZaATzONt
         iBqFDQtqt8l2+HmGpwukEwSX4rHC0/Crls1Kq4Na3wp21xt+iUDkE87ohl5NbqDkCBC2
         DrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826552; x=1794431352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwmAXxaBahAboQnBQiZSfiZqfzogCrFIH3WtsyVwi2s=;
        b=FykVKd3nqr9Q9R6PyzTDC0xalYiEn2qp/SlC8x7tcle9Q9ghRj/dF20eB5tktw2e3e
         8+pl0A+FLRHgJimkyCEPrQ00uKTOAXyOdx+OOlaMVvz6Jrdd3b0soozZTTQNBnUcvVnS
         kl+i+vexwtpBDEqiOaWqvDhyNT9eU5er5tQ+mg8l6uQ+AAAHq7at5uQJ/83bzG+XNoXR
         vku6e8zqfvTzYBWjdTsmWf2YdPClHvayl2fHXeY+/tdMLNG4u5uI8OSpfqS50P9iGiX2
         C43TJr10WISPp5KYrgg7nv9QzmBXB/ZXocgNAooJxa+MCwCYbSHPZVbpmJ3/JZfQDzNA
         b7OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOoNUTbSvvr0jGvOZUG21Ozp7SbVn4lZFo1vjx1n3qRinVIqDsfL1VfJF2J5ASJRklp8MlGhIbAIbe3bSSLto=@vger.kernel.org
X-Gm-Message-State: APuU4Z81lR253aYzmlDs4aRGatqSoPnl1cb+5f2zuyhw5wLATSefxQqS
	LYd5QIr9mbuzPokoL7WthmCsqpj8v9cIyXZurTXIxVfgdg6ZxhOSmHso
X-Gm-Gg: AYBFou3QBshOqqAu3n4O38oNrzCnlIaWWRNA1U9ypdljHS/LwhVST7ki87piu4y1EOe
	UC9S3oMpf/kHhxwpWglaC82YyYktpkNg6/0+/n3fcluYx1dBPl5J17PcX0grKo3tRZImrpnWNcw
	GmwzGVkcwrafJa0+ioPW34+Rl+vMEMOvkl8YmvFF4eMnbFPqj7WPxpnEGYFcqyQ8FJ3+UkN9XL/
	8YdlW5/C/C9Pw+9Nt95OK8JPQYALjFUkQ+Hq0mzZlIiywNn3uSxK6wtO6Jw/kLEhECvRWO6Ayy9
	fJKJFxX11D8pATGu6RaQdaRV5CnHs6XhecZBsflQ5gFVGIpESwXsYxM7IEc+4Yfe1zmD1xzOcY6
	6S8DbcFdj3MNJ4w8IoX5V8sPbwRj5z2JSGG48ycaVVMa+gc7+PbC1WWEDSnLGyr4W0FC0axqvse
	yjIu5rLLqW0ZOAhnfvqp10FLQKPMfbQt1PuDq9xuLcTFXvky9pKZMbFT1+UxZdgU7rMZM9GzhYO
	0IJJuYic0PgtY4o6yEe6tKQcZtrJ9XMrTgyXpyIOnH+hwn3N88EqkG8fF1Qxr+/x+gYY5vDJino
	RHOXT9JYxLQd0hA5GqpggELe0cURygYUQjIXptGHwBr3NIs77c7CeQ==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr387058325e9.0.1793826552398;
        Wed, 04 Nov 2026 13:09:12 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca2a4fsm12960655e9.15.2026.11.04.13.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:12 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:57 +0100
Subject: [PATCH v2 11/27] selftests/landlock: Assert helper results that
 are used afterwards
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
Message-Id: <20261104-selftests-refactor-v2-11-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Some helpers check a result with EXPECT_*() and then use it:
cap_get_proc() in _init_caps() and _change_cap(), and
landlock_create_ruleset() in drop_access_rights(), create_domain() and
create_fs_domain().  On failure they pass NULL or -1 to the next calls,
which then fail with misleading messages.

Use ASSERT_*() for these checks, as create_scoped_domain() already does.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h                    | 6 +++---
 tools/testing/selftests/landlock/ptrace_test.c               | 2 +-
 tools/testing/selftests/landlock/scoped_abstract_unix_test.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index 6c2aa913ff11..a662a68bee7b 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -55,7 +55,7 @@ static void _init_caps(struct __test_metadata *const _metadata, bool drop_all)
 		EXPECT_EQ(0, cap_set_secbits(noroot));
 
 	cap_p = cap_get_proc();
-	EXPECT_NE(NULL, cap_p);
+	ASSERT_NE(NULL, cap_p);
 	EXPECT_NE(-1, cap_clear(cap_p));
 	if (!drop_all) {
 		EXPECT_NE(-1, cap_set_flag(cap_p, CAP_PERMITTED,
@@ -91,7 +91,7 @@ static void _change_cap(struct __test_metadata *const _metadata,
 	cap_t cap_p;
 
 	cap_p = cap_get_proc();
-	EXPECT_NE(NULL, cap_p);
+	ASSERT_NE(NULL, cap_p);
 	EXPECT_NE(-1, cap_set_flag(cap_p, flag, 1, &cap, value));
 	EXPECT_NE(-1, cap_set_proc(cap_p))
 	{
@@ -227,7 +227,7 @@ drop_access_rights(struct __test_metadata *const _metadata,
 
 	ruleset_fd =
 		landlock_create_ruleset(ruleset_attr, sizeof(*ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}
diff --git a/tools/testing/selftests/landlock/ptrace_test.c b/tools/testing/selftests/landlock/ptrace_test.c
index 10371c1830ad..b951889cd6ca 100644
--- a/tools/testing/selftests/landlock/ptrace_test.c
+++ b/tools/testing/selftests/landlock/ptrace_test.c
@@ -37,7 +37,7 @@ static void create_domain(struct __test_metadata *const _metadata)
 
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}
diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index 5e8224623780..55a1599819c8 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -40,7 +40,7 @@ static void create_fs_domain(struct __test_metadata *const _metadata)
 
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}

-- 
2.56.0

