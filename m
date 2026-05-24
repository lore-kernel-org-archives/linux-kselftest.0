Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250B837BE64
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 23:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779666652; cv=none; b=h9yi5b3L8uRi+pW0BJre2NAhmNxkF8eGZIlx84I6Z/GpQr33PhgPQinxQDlDfo6lR1kqa3DFgOA86NOV4VWPTgB+/u4fpvz89J/m9zHtREJ3mg2I3ToMZEo7y93mR5HCK0uq+O96gs7o181EDmAi5OIXPUqzBy5LzeIGlA8Mv6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779666652; c=relaxed/simple;
	bh=8ylJrm4gNzXVcl53g914hH7zMuE5tvlB0gFHZn4rj4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d96uAI/VcupuquoT8npXqvDnLfJ7jXf5l2cGanw82vZZL1IeBXmvfwOXBReyzPOHKFWGAY8YgLSQE236qR45a4adXeC4tjG6yCV2f6yLqZc9xND+GumRTdkShsNPmfrEM1NwaRNVUmW2RBiA+BB4GOnB/AQNGK8orKrLHob9i3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SJfE+m26; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SJfE+m26"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso75843985e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 16:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779666649; x=1780271449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6YNn0fcdFecPZmRv6CDovwT/SpsvUpXOiglKkzdZnk=;
        b=SJfE+m26pAmZNXQt7rl9M+Fo1dHOc1GplEotfj6CG90PK/wrtiCgyUZLNC09WHXmAM
         9/wJ7dtOB2xJkK0W5jyjDnnkWg3MbgkSVedJ9ILh/F8DF8wxP1P5JH5ojnzOVzoyMeVl
         tRy2Oy2U616AGWM7n6w4kYLkhBPq8pE37X/MsDQOduXuhGwRZRhfYEnnAGEhsyF+QgCw
         tDfYgGhjd89uyauACMgZMuUe52aTxZk8FjeCzRTLxe276Q4HKWEFfxko0soUzOdtZjPY
         oKLI57xZU+4gaxtt5wv1IwVAA7+iAZvFp5m7Mna19RG4NzdYc6i07y4w52SYgsOTbSHa
         6sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779666649; x=1780271449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6YNn0fcdFecPZmRv6CDovwT/SpsvUpXOiglKkzdZnk=;
        b=i33Q4dVEmhyfS0CqAXnUHh4ec/odZwiUEV+nepRRt2188BKe5aTtfcbzc0boULWQUd
         f6cN/EkTDFT5uZnhMpNRC5WAO9xbttI3eUKbTpRI9y7P5+3+o6+D0mUj07+77LkJh9m3
         Nn5Em7fr3xIdmhOlXzQKvjtL63odgyt2Kog02ZzLm8LkHVBlqbAL2wPOHcKbEqkfG0nG
         84/KbRYfqKGUrhQzJJKdNlw5NE5EvW/tl1jzKcE4Ry+xhyTdR4QUHrDgxZ8wBVoVafPf
         9xNvbAU3ksd5xkDtNq2CFNgVngHeqCP6Kg2U3gw9Y2mKx8SVCglsDp4wYUiRNoqF1D9R
         FbaA==
X-Forwarded-Encrypted: i=1; AFNElJ8g6jHuuPgSPhNzwwrypfAopAbXrb+RC6NMJ4jJxbR+8HJR+gNvmMLCVq+4f85LKAxcwMgUwTggRjwNFIYaRY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjcPuM6GIxxx3FYg7eYc7giwjI/leahhERB9K2K9WAuOt6v86S
	qcFo5N5ucmYYjRQX7kqZa19FOkDn/NKZkWgfi24iiXx27KqJzYdJVsAExdyNdMfmddI=
X-Gm-Gg: Acq92OF4DV/bpey3RaWCzgrmc44rKt1YbBqYnYB9DljMyuCMZEsPzODFuwkAB3b32KI
	XP6Iy9uwmPwPrMmgugxCer7M5RQjSqvM+7UYY/UUXeewHnStRGxa5P5U8Ij5dJ1t9Ve1VDBB1j1
	ZgS/2hjvLrWepOUsi36K7q1X5LL+h+uMWxpxBuNvUQiz/mAFe5WlMYV15lh70zcqEWKwfrCCiUH
	4A3djpRXsg1YWmGt5NtqASM1h5nWHwR5kti6Dnaa9eclh73hq9v83rNHX85EgUjrJhyWaaIdt1H
	omHLqPEaJ2EquD07e7APAv+8TcGAaudfc76hxZ4wWaAyY/CLna5NxTSDWISvkZtAIZ478dUlka4
	u/tg+U7TlvOcpB+2PCur3rD50RUAcOykWG2wCpVCmuRV2ed2mUZojciNB3F2jIvYd4RNmaMf2GL
	FTUzkKnIzWtWpVost+cpwnuAQ=
X-Received: by 2002:a7b:cde1:0:b0:489:1f04:96c3 with SMTP id 5b1f17b1804b1-4904248b137mr123733665e9.2.1779666649419;
        Sun, 24 May 2026 16:50:49 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9de2dsm21698074f8f.4.2026.05.24.16.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 16:50:49 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sun, 24 May 2026 20:50:31 -0300
Subject: [PATCH 2/4] selftests: livepatch: Remove leftover modules when a
 testcase fails
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-livepatch-unload-on-fail-v1-2-7465de7f741d@suse.com>
References: <20260524-livepatch-unload-on-fail-v1-0-7465de7f741d@suse.com>
In-Reply-To: <20260524-livepatch-unload-on-fail-v1-0-7465de7f741d@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779666636; l=2469;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=8ylJrm4gNzXVcl53g914hH7zMuE5tvlB0gFHZn4rj4M=;
 b=TWGoyFXs5NKuk8AGPH545Wuz7+klYGHy3CcSOG+Fnnm5SxVeZI3XIYgtSHk9VGybJCOd2Wnt6
 90asTv0ug6yBKrHd/IuGuzUXT2eS87+RMTRXaS2GKneHXKSrcpxk2eu
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The current livepatch selftest scripts load modules, run tests and
unloads them. If the test fails, it can leave loaded modules behind, and
in some cases making it impossible to run the next tests.

This approach tracks down the loaded modules, and in case of a test
failure, or premature exit of the script, the cleanup function will
be called by the trap installed on setup_config function.

The cleanup function iterates over the list of leftover loaded modules,
unloading them. The function also checks if the given module is a
livepatch, properly disabling it before unloading.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 3ec0b7962fc5..25f137003865 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -15,6 +15,8 @@ if [[ -e /sys/kernel/tracing/trace ]]; then
 else
 	SYSFS_TRACING_DIR="$SYSFS_DEBUG_DIR/tracing"
 fi
+# List of loaded modules used in tests
+TEST_MODS=()
 
 # Kselftest framework requirement - SKIP code is 4
 ksft_skip=4
@@ -125,6 +127,14 @@ function set_ftrace_enabled() {
 }
 
 function cleanup() {
+	# Remove leftover modules in reverse order to handle dependencies
+	for mod_item in "${TEST_MODS[@]}"; do
+		if is_livepatch_mod "$mod_item"; then
+			disable_lp "$mod_item"
+		fi
+		_remove_mod "$mod_item"
+	done
+
 	pop_config
 }
 
@@ -181,6 +191,9 @@ function __load_mod() {
 	# Wait for module in sysfs ...
 	loop_until '[[ -e "/sys/module/$mod" ]]' ||
 		die "failed to load module $mod"
+
+	# Store the module in the modules list
+	TEST_MODS+=("$mod")
 }
 
 
@@ -262,12 +275,20 @@ function _remove_mod() {
 		die "failed to unload module $mod (/sys/module)"
 }
 
-# unload_mod(modname) - unload a kernel module
+# unload_mod(modname) - unload a kernel module and remove it from TEST_MODS
 #	modname - module name to unload
 function unload_mod() {
 	local mod="$1"
 
 	_remove_mod "$mod"
+
+	# Remove from TEST_MODS array
+	for i in "${!TEST_MODS[@]}"; do
+		if [[ "${TEST_MODS[$i]}" == "$mod" ]]; then
+			unset 'TEST_MODS[$i]'
+			break
+		fi
+	done
 }
 
 # unload_lp(modname) - unload a kernel module with a livepatch

-- 
2.54.0

