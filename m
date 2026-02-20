Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AEA34CFA7
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596768; cv=none; b=VzdfRy6Z514SO/DY9NzDFHjEWRc3Qa6PKFhq8zxqlifSreVfGr+xEdvYapVQ2uWeGglJfXSEyJviT03W2zCdHHPll2iiNIWIX7zAEVHKDLP0lM6Co+elnsDMKtpTxaJkr68vODmpTmDKd61Ai/3p0DEfeL481Q1CBHExcmG9I04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596768; c=relaxed/simple;
	bh=lfkcP3ZdIIOq+1bZXx5CwRguKuxe5MWg0qFqkWJX6To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+BJuyhj754iHIRlMlJWp7cb/s0JyssNQY1zifDhkBgp7kIjmXo6iv0kS3waXbxAhmoyww44boF0OfUL90tzXpzjeI3bXrvZAy14+afOwQkrDAFQWexAFxgOGKNyeUqHOpF3rgqB2e90ken7aGfJsW6Q+UPsSyqz2Von54t6hIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=feuqaKhG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="feuqaKhG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so21634695e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771596765; x=1772201565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+uzYBps92pCmeU+FcOVPa+5H48G5IG9O6HJXUTvz+Y=;
        b=feuqaKhGCEdPX7QTBhQ8wYwGXoNVQeyUjPkCJ3C+wlAlmLGnsPw3Fy97kSUT22dokA
         gY9OSPMK8QNhRTenVdIYtV51J0Czg3QgLJBKGUpFBd9veWy1epALyWFWwAnePw2d8ia2
         +pLSi+vvZrGhJqvMIGtP2mJfgPvvYc0azMqwvBoUHm6GG6D+I4LYvsV9BJ6jtHZ83NnL
         Qxy8vo6tMhAG4W4yuzqdHb6q/igtI5+KLRvt5FQxLOzdmu6qDVVunNra7IO3eIvrajIQ
         E5cJQE1rzus1b+oGdwUnEg2sPmtT05iLxMPeNxkpqu0uUvoW7kGoZODqFBrQpcwOyJql
         ZvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771596765; x=1772201565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+uzYBps92pCmeU+FcOVPa+5H48G5IG9O6HJXUTvz+Y=;
        b=kBUwsVMzjQlOsKxDY2KVU3gNK5fwOMowDvnXkbcQxY0z7KYQUEGjAvdvKT2ycPURex
         sAkR6PROfBs/j5xj49es/MfynOImaGQrbDWI7jxJcGPIVrsNaocgezZ8qGYAb7Vs9gyw
         snIxDhi+K3To6ZoNA7GbDWvB4NbzTrvRR1pdjk8cY60EKw93CTpGYbUW/1xOajqbeyS6
         SXH9Ks11FYgPM8uJYpvraIK5BNNwkY7sHNU9hfAZL/mcmlD4TuLXgPSsDxuORrG0rTMH
         VPPUiUHBDibbSUxcrcIhsdGcJlM1oaQ3KtER5haSvBy48W6oMIeiV3sMJA1YS0ndmfVf
         z0RA==
X-Forwarded-Encrypted: i=1; AJvYcCUxo/sdTmZVty7eoC+4eMiNUk47oWG7RkiSv716Htel9D8IOsJ4RdVQ0tHfwarQl8scT9Us1PBjfVJJ2BY7TZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YznTp1gKjkZKNiVewJ/JwVnQBRL4q9PyemRHM8NlM90SZ+e8y8v
	NKTbb7fAbpv1UfpCnALEF9NTnmE4LQ78g7Fdr513Oi7D8wu10xRACnUH0zEmlTDb1jM=
X-Gm-Gg: AZuq6aK4/r3B5Rz6U1h/av2Eh69bYNiA2Pwa0Bs9n8AWUBTMbd7mwvh31KxtkWbrOMR
	b15L0L45GhY0ffaSZT/dRwdhronKS9lyywDx/tZrh116BRHOKDTQKeOB4u5jFhNBoRTnHsQvbz+
	6Uwq/Edu8Mk5Lrk6u9SBNyo6rxqWE9ve1zDTeZblpHQHIQGY/na4EgPZIR9ue5BFWYAmIPihq08
	5iTLwM9oVHp4VWtPeLTe2jMoWU9syXt5ZJYmPImWFZsRifrdcof5xdXwRTnR988poMDx6bPuKJQ
	wnOCNrkBUERw7dJrcV206552AdiHh7z2Mpxmu3FrFlhV+o+/hKNY3Ti3XTXUPOSaf5JbA9bqjqQ
	ml0136yvYO//7gCdLOKkEqunk5ZEupB61rX5cCCK5LiSEHkf90j8MT6c9OM4zqYcBOoJZ3/fnGj
	CLdkeUkRK0npX3feKkOU6t
X-Received: by 2002:a05:600c:8287:b0:483:7eea:b185 with SMTP id 5b1f17b1804b1-483a541a866mr36611035e9.16.1771596764582;
        Fri, 20 Feb 2026 06:12:44 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:822:3100:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b2d1sm60119173f8f.4.2026.02.20.06.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 06:12:44 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 20 Feb 2026 11:12:33 -0300
Subject: [PATCH 1/2] selftests: livepatch: test-ftrace: livepatch a traced
 function
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-lp-test-trace-v1-1-4b6703cd01a6@suse.com>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
In-Reply-To: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771596757; l=2107;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=lfkcP3ZdIIOq+1bZXx5CwRguKuxe5MWg0qFqkWJX6To=;
 b=j0Hy38QFPzn4yRGnk1pGC8agT7SWqZWsfvcqLHUjNE38K6fhxH9e2jAeIpsiR17McRfZSkL8I
 UAuk8Hzj9wJDaMKCHcPbKQWymB9g+38qIJH2vWs64xRU7cjDGNbk7q5
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

This is basically the inverse case of commit 474eecc882ae
("selftests: livepatch: test if ftrace can trace a livepatched function")
but ensuring that livepatch would work on a traced function.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-ftrace.sh | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/testing/selftests/livepatch/test-ftrace.sh b/tools/testing/selftests/livepatch/test-ftrace.sh
index 094176f1a46a..c6222cc037c5 100755
--- a/tools/testing/selftests/livepatch/test-ftrace.sh
+++ b/tools/testing/selftests/livepatch/test-ftrace.sh
@@ -95,4 +95,40 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 
+
+# - trace a function
+# - verify livepatch can load targgeting no the same traced function
+# - check if the livepatch is in effect
+# - reset trace and unload livepatch
+
+start_test "livepatch a traced function and check that the live patch remains in effect"
+
+FUNCTION_NAME="cmdline_proc_show"
+
+trace_function "$FUNCTION_NAME"
+load_lp $MOD_LIVEPATCH
+
+if [[ "$(cat /proc/cmdline)" == "$MOD_LIVEPATCH: this has been live patched" ]] ; then
+	log "livepatch: ok"
+fi
+
+check_traced_functions "$FUNCTION_NAME"
+
+disable_lp $MOD_LIVEPATCH
+unload_lp $MOD_LIVEPATCH
+
+check_result "% insmod test_modules/$MOD_LIVEPATCH.ko
+livepatch: enabling patch '$MOD_LIVEPATCH'
+livepatch: '$MOD_LIVEPATCH': initializing patching transition
+livepatch: '$MOD_LIVEPATCH': starting patching transition
+livepatch: '$MOD_LIVEPATCH': completing patching transition
+livepatch: '$MOD_LIVEPATCH': patching complete
+livepatch: ok
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
+livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH': unpatching complete
+% rmmod $MOD_LIVEPATCH"
+
 exit 0

-- 
2.52.0

