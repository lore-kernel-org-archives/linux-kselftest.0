Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C851351C39
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 17:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776101202; cv=none; b=CLixvyoXDaXRxX7Yug5dGPBA3IitnMDqbiuhNB74ZtV1jnvwO5g5nMqtlxn9j9I8LRCYJOYhTl++5ay473dzE3/e/VMqI97hcGtZUO4lI19tLTBfUPHFAIPMtpeW3GHxs9JHokklO5rRtDXmV2ku0rUgRNW/OfNZuPW8+lX7ODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776101202; c=relaxed/simple;
	bh=GWGq7P7bvRfSD22bdYnyvNbQAb8tVilIkrfjkEJwIjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzMhX5jdK9Bu/tdZ8q4M4ve5a2Opu9BSRt2t6egf2Z+KCtlCj6nnc2wZB12iVYi59jglU6Pz78eiI8Ke3jLiB3Bsd4xTBia9WE8szTrrIqcW6FJLtf9AYmWFLKbgjxQtouhDFuLWOtafW41FC5VlTX6VoRNyf59K1p8SIVbkBew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vi8WbX1N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vi8WbX1N"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488971db0fdso46518285e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776101197; x=1776705997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO2pGCWxGzIXon/onQ1T7QGLeTxZ3Xf5Ie8qcBJrTk0=;
        b=Vi8WbX1NB7uFwv7UUnudnAk67pgWoJvXA69MIkVBak3HeBbNWKnN1ADtTp6q/ifmI8
         Jmr10cH9oJRQMb2vLPcoUtlBYF1abJTimXH7CsXf6V2om0y0RgP0wdGhswImzQLpaX9F
         JSnP+7KzcTKoBJzMP3yW0O54nPqRA3F59pd7xUUfbgssa3ATXpFmDYo70cwhrtAzA8ho
         X5wzryuaoHiCRTFTsjY41fAe2QhHYOH5s6uC7/jAsX8M+QEw9b5xa9UHjzHb1IRbARKf
         5mPm9RJIoFKAqwGtYrt6VLMlTg1O59GWYU9TedTW+Va69mvVP0FcRK4MKwNAzU1s40fo
         GbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776101197; x=1776705997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO2pGCWxGzIXon/onQ1T7QGLeTxZ3Xf5Ie8qcBJrTk0=;
        b=LZFEcxe8glEmVy9H73E2DJSN3RrWu/gZ5Cibk2OuSvcMF9f0CEU+0utQ1H2Mldgbhw
         MzZLqVjJhXTNelUgJfLCl5CjRLgoTRI4QpVGM895mBITc/VEGz9wLXaqjDQ09IAktv8y
         7EZ86vXtQeuEfKfU7J6RvuprOxp9gfCeUFuuBZ6C5aDcSE6c0+PcPDkBNzwjDy+uMj2A
         Jsel+zjAlCRmvLfc2CAOpNvB4kHqssBQQnlb61S/OLiGnLiOZTbOmBcJvK1yMnpiabn7
         NYnn6aMGXfz4r6czQQw7/Gh2CZPz1Ryy2shSLmIeKRdXuhOKeVQXYemf3zDOHMuYVZrO
         5+1w==
X-Forwarded-Encrypted: i=1; AFNElJ/3xTscMwl9hz+WzkZTqXiNujAiUDGkAgEipoHgapU4uxI61PUqQN36YdgbNEHT3RazeU6p6UVDl7xnHhDzKTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3GTUvaXUcFOeu8a9VR958Q3tSks1i0GrVXw1Bqa7pPeqIWiO
	kcb6cOPFVrdl8kZrwsCm/eD5i3OJrT93nGBEHzj6Nq2HSJkPuq4p5TPN0OqsJiIO2KnhM8TjixI
	LoRab9G8=
X-Gm-Gg: AeBDiev5wcIYODFAM1uX1fMZ5ZoIIWj4CdmFqB8UeLjGkbRdsisUhluuxVpsOMlgWtp
	mQt+33nCwgDdivL9ecv0DyJzHOdJGhJhy04UPS46zjZLTnlLInLfL+Fgp2xvuARR0qxHhGBHwkA
	+IXIv9uPPOslm0xT03zjH5wBa5MjH7Eq6Zre5741NT/LkxQtjo3TqM6P2UittfIoyEEn3xd0aZ+
	VVXHw3PbRCZbnqetExBinFfYuUxqrx1io+n8B8j5fY+AnAfx83VAqP+EI/2605jem5EHVqwx5/F
	T+1ZkCyL+GhZSDWLpHmWA/OE+lmU7oA73qt2rEBcpArgvWlMWQkeD8P2OrmcjnNhtFurr58xQ93
	b68tN7uegNhUEQgigSTFiH6GtdjMY+4E+demfXyNLAlVyc9tcqerlVirLN4W55Gj3f78sQQ2hGP
	hn5gTv4ty0a1uQy5G0ku7lZlY=
X-Received: by 2002:a05:600c:871a:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488d67f0b8fmr208758455e9.9.1776101197444;
        Mon, 13 Apr 2026 10:26:37 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5734a94sm298657835e9.0.2026.04.13.10.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:26:37 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 13 Apr 2026 14:26:16 -0300
Subject: [PATCH v2 5/6] selftests: livepatch: Check if replace sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-lp-tests-old-fixes-v2-5-367c7cb5006f@suse.com>
References: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
In-Reply-To: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776101176; l=3906;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=GWGq7P7bvRfSD22bdYnyvNbQAb8tVilIkrfjkEJwIjY=;
 b=31e9o5gk39vFNf/aLfmX++1HUFH1FpphvTSYVJPQIeReWeQ5AWglhubic42TxsKGFICzx1Y+Q
 dstt69BNPmtBOlz3v9V1vvTgBnmNtUkKTAkOVZycJgLpNzciggYVOl8
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

In order to run the selftests on older kernels, check if given kernel
has support for the attribute. If the attribute is not supported, skip
the checks.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-sysfs.sh | 39 +++++++++++++++----------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index a2d649404a63..0cdaeef00983 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -9,6 +9,7 @@ MOD_LIVEPATCH2=test_klp_callbacks_demo
 MOD_LIVEPATCH3=test_klp_syscall
 
 HAS_PATCH_ATTR=0
+HAS_REPLACE_ATTR=0
 
 setup_config
 
@@ -22,7 +23,6 @@ check_sysfs_rights "$MOD_LIVEPATCH" "" "drwxr-xr-x"
 check_sysfs_rights "$MOD_LIVEPATCH" "enabled" "-rw-r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "enabled" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "force" "--w-------"
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
 check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
@@ -34,6 +34,11 @@ if does_sysfs_exists "$MOD_LIVEPATCH/vmlinux" "patched"; then
 	HAS_PATCH_ATTR=1
 fi
 
+if does_sysfs_exists "$MOD_LIVEPATCH" "replace"; then
+	check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
+	HAS_REPLACE_ATTR=1
+fi
+
 disable_lp $MOD_LIVEPATCH
 
 unload_lp $MOD_LIVEPATCH
@@ -96,18 +101,19 @@ livepatch: 'test_klp_callbacks_demo': unpatching complete
 % rmmod test_klp_callbacks_demo"
 fi
 
-start_test "sysfs test replace enabled"
+if [[ "$HAS_REPLACE_ATTR" == "1" ]]; then
+	start_test "sysfs test replace enabled"
 
-MOD_LIVEPATCH=test_klp_atomic_replace
-load_lp $MOD_LIVEPATCH replace=1
+	MOD_LIVEPATCH=test_klp_atomic_replace
+	load_lp $MOD_LIVEPATCH replace=1
 
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "replace" "1"
+	check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
+	check_sysfs_value  "$MOD_LIVEPATCH" "replace" "1"
 
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=1
+	check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=1
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
 livepatch: '$MOD_LIVEPATCH': starting patching transition
@@ -120,17 +126,17 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 
-start_test "sysfs test replace disabled"
+	start_test "sysfs test replace disabled"
 
-load_lp $MOD_LIVEPATCH replace=0
+	load_lp $MOD_LIVEPATCH replace=0
 
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "replace" "0"
+	check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
+	check_sysfs_value  "$MOD_LIVEPATCH" "replace" "0"
 
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=0
+	check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=0
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
 livepatch: '$MOD_LIVEPATCH': starting patching transition
@@ -142,6 +148,7 @@ livepatch: '$MOD_LIVEPATCH': starting unpatching transition
 livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
+fi
 
 start_test "sysfs test stack_order value"
 

-- 
2.52.0

