Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8D3EC2DC
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 18:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314675; cv=none; b=Pbj3LTMpUSwD/GNDvbnfd8XZy1ZBnhf3wd833XBYjm4XtCMr6noAbzE7WMjGOMOWwfatuWjcJplHE1Gugtc5G3rcjnZ6dq6Lf++7UPLrhradm3FoYjcDsb/BSofytP/DXuN0YGp+IjCy6C27NaQ2o4fSropcMyMrxQWtx/bQ05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314675; c=relaxed/simple;
	bh=w+QsBT+5pcbBe5xVs0oaWXhZ1MdasOi3IXWJ4w5Ext4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgPkw1HJclyNyx3fXVeud+oJa6K7T9N9SS9HGZTA7SX4NbaPt8zEl767A4Jnf30CUvWX4yic9FJAwnmlcFKU9vDiJJQ6A/OXaCnCt5VogK4sZ0LzWGAaQPkt8U8UQWM56/nMHni3dc7OC9ybIKZPQj/AxfSsUrcLo1Rcr2H5OLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BAsQpS5a; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BAsQpS5a"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so72252755e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777314672; x=1777919472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJ2KT7kR4JMpZSd6AGblTMphpgunFcNpBlqPqv+V9cY=;
        b=BAsQpS5an2A4I+uWN+DKdRgVQc1flKX4XwEaHoWa0rauJqUZvddJTDTZjme97hXJoO
         DnlU2iZCtBlMsU4why2skBAuxaT/ggD9V7kFq/hRe+uiwPMTgSr6ZOhwZLP+MxHdq8th
         a8IpL3G8WpAQUEmPA+J1NvAVP9ii8H+MmG1YZgGFHexx0XFw/diz9kXCfNvdAQlPQl85
         24y7YRjvGPUkwg5d+gCYLjH94SLBZ1CtWwdy5hrfvGGOjknRbAg+FfbNwsFRIA3lpSCZ
         3gkNMhOvN1UG4fA4FA24g82HpHUf/c14Dpe6KvZ6RkFNjt0SLU2pFJtVkjjipi2rI1Vd
         yZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314672; x=1777919472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bJ2KT7kR4JMpZSd6AGblTMphpgunFcNpBlqPqv+V9cY=;
        b=hdVGUDdATPybzQp8wESXJJstJYiJ+FMEUZM4qneYmsvuM/O8n/9ElETtV3kRLoI45g
         RK5W1NogLss1fgbDdAf+433M/SdKIjiAwIKXbwddSuE3lqN+WPgI2W7OhRHOb7rJVjyr
         +ZhfNZhkVAEXgG7iSm/XmqY//VlapYmDe/AtDevtI375OVvbqIG6cyznZAj/eZrej7jp
         weHnpb3uuYntcpZnXrsyndB3cw0Ufy8rYE18hQrQMW7ITWbTcMgKjSNvMnPzkD42wGZI
         N8ZWWSLfH7uxFULu3/jPE9vW7X+bIMT8XjSXHKFVWMkZ4s5hkMJYMdwjdVuoCGuW2AY2
         fnbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4PgrhRJF27tsM+nM5ujWsd+4rc7u9I7ODWgmqrDQ4aE7GeZK4mfnegL+jd93lvf5z4drpnqQvoBnLQzYjmD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMCFzFq+VCQm7M2dCQ5OhwqFOBDTJcRuif15F4dUCn8TvBAHx0
	m9mTr0cwF7d7BSzbAIdnPDfhdsk4GN7MRIZ7fem/Azd4M147nbbRI3mtKtykfkwru9o=
X-Gm-Gg: AeBDievOH3WwCntTFJfYaz3BLm/A94vam5OPmkeMwM1d8hbeCsiX6Xnjmjb7uTluh60
	ivWZqjiPq26klDGQZjbnWU6fl57Tw/KPQ8Yss9uaBWyCMLaz2nJeyLvedzPnoUEY03kbNupk3Ur
	9cmAIZIzlcDUGQ0pKJganrqH0akVHXh4AG2lLXBk2KoXmFrZu7en2X8kKV7a7W8FTOdebyerfFm
	n0BkAkHqA4atc+uSZY8T93jFhp+WvJzDlXopQb3o6lwe6PUK6cPS4yn5X1bcQAkl+eYZPWjnEpO
	EcAkr+kwL45gPpAIeB6ElRe7xk4SbmSp82X5ZjA9l+yDYxwRHsirkllCc4khc0j+2rWJ5UfM50F
	pH9RuzdEzgcDM9EesrwNLowf/owRmPe0dB52fXoaRbrMSgyeRPPHMjqHnbQfiauWcqxXZQsq+GU
	xle9TjhLQbAvvia7IhAZ4BcASqoR/IUT0ciQ==
X-Received: by 2002:a05:600c:8b55:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48a76f58b7emr6617765e9.13.1777314672133;
        Mon, 27 Apr 2026 11:31:12 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7749cabdsm1182065e9.9.2026.04.27.11.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:31:11 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 27 Apr 2026 15:30:58 -0300
Subject: [PATCH v3 2/6] selftests: livepatch: Replace true/false module
 parameter by y/n
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-lp-tests-old-fixes-v3-2-ccf3c90f744c@suse.com>
References: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
In-Reply-To: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777314662; l=2032;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=w+QsBT+5pcbBe5xVs0oaWXhZ1MdasOi3IXWJ4w5Ext4=;
 b=B9Lwc6hBLmccaw55nIYMFkQtu5er8y4vkFnt2F55uQsp+G/8IM+ODlWB/cJP5DbnIMNnFkEQm
 6cAlXxrf/9WBvQBPlamL7ZjUB36HdWHV0TdtiUthgmhRV8tptPClzWs
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Older kernels don't support true/false for boolean module parameters
because they lack commit 0d6ea3ac94ca
("lib/kstrtox.c: add "false"/"true" support to kstrtobool()"). Replace
true/false by y/n so the test module can be loaded on older kernels.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-kprobe.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-kprobe.sh b/tools/testing/selftests/livepatch/test-kprobe.sh
index b67dfad03d97..7ced4082cff3 100755
--- a/tools/testing/selftests/livepatch/test-kprobe.sh
+++ b/tools/testing/selftests/livepatch/test-kprobe.sh
@@ -20,11 +20,11 @@ start_test "livepatch interaction with kprobed function with post_handler"
 
 echo 1 > "$SYSFS_KPROBES_DIR/enabled"
 
-load_mod $MOD_KPROBE has_post_handler=true
+load_mod $MOD_KPROBE has_post_handler=y
 load_failing_mod $MOD_LIVEPATCH
 unload_mod $MOD_KPROBE
 
-check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=true
+check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=y
 % insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
@@ -39,14 +39,14 @@ insmod: ERROR: could not insert module test_modules/$MOD_LIVEPATCH.ko: Device or
 
 start_test "livepatch interaction with kprobed function without post_handler"
 
-load_mod $MOD_KPROBE has_post_handler=false
+load_mod $MOD_KPROBE has_post_handler=n
 load_lp $MOD_LIVEPATCH
 
 unload_mod $MOD_KPROBE
 disable_lp $MOD_LIVEPATCH
 unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=false
+check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=n
 % insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition

-- 
2.54.0

