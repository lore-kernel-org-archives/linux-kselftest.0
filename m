Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1CD421F00
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354520; cv=none; b=bNDW4UL14n4YqD4WBvVh9E/9jnc9c5ERnV4ZKHp32uYTI2/SDnPmT6vde+owyhwpI1wrSAP+Pib6K6MXDswRN6kTb0qowCHuHDbu4UED1iWXOE/P9T1v/k0rcDdreEfaTRu8Q2REv+uNMmGYIuDGHQTCVf14yJU3O9gf6/xao5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354520; c=relaxed/simple;
	bh=5G5FB9kOtpFLC9ywyKU/WqUp5GOuGEuJ4zI7XGzDU/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I633dqx65HpCy5nU4lQMOkAoaDZeBUxU8al0+KP8TlCa5RbgXtEz4wmHHwEldtt2B7YFfJAA+FVkaTFcccjGFRGK2UGDgJAF9hQmoq5JnAxfTyIjTwOMerIqoINjw/pq/9h/Ut3ocC3vr521QYjro17URfnsZO0Cv5FuvgbWO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dsf6MDyX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dsf6MDyX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cace91f112so27205625ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783354518; x=1783959318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/3RgXCA9XKT4PqM3Zw2JPstafRKCR+nS+crMfKpAcE=;
        b=Dsf6MDyXItcjWn9QJIcv5EzfidGxocrrA7mt65C0Rpsf3CECAM0+kMW2UryOaySVtH
         HY7B2hOkvyy7vX6MZqSEEwcY0tFjhG5v+YPiZHiLYpTyHvYk5mZ8oL+Jof2aPolBb7oX
         vxTFesMrDGFsVxx2qbqlNZGUKkQwhoMKA1r4CElWLlkbCKWgtx4AUu5QfV58yjbUoYBL
         jE5qjwVVkeeTfJ4hCXDhBOWqchfxSV51XazD9Abk0jqHEo33FxtIG28YbbMTlUhFOHvq
         zPW5WE2TFZtc1wc8Ckn89C5QnQFa4Ow3nMs7G60Yl4wfsBiQXRDjb+L+o4ukoYoImAiS
         7TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354518; x=1783959318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/3RgXCA9XKT4PqM3Zw2JPstafRKCR+nS+crMfKpAcE=;
        b=I1MO2+HbxDVhQRw64F8HeXwb75NE4yYoQL1Suto/taAKSEgPDreagE4oMOCMqJYPIN
         eoS6pk+6o2chANY0G73XFilSDL/B8t8q48eqD07EPod0toI9TvGLrtH7lVuyBmxQMCx8
         /WlBAa8lIogWS5eP2JEf/wT519lXEmIf9S86Vi2cpcsLxINkTbP3Kh6+E7vKL9fGkmDR
         nziuMGwWsBExvkcO6sAXW09HKnGUI7qPN+3JTYJ24F1W9JpwnnvY5SChw0bMU111ABXG
         t6scV7pmVmm/gp3l7Ozetjg0GktXadKfcAqodgxbOZByKxUz2sblh8RWe+bVFUL7/eCP
         FQyg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/u49miM35Db+10+CwhPNpnAaiEBBon0nhcIvMRg1U9ijswuLfiWjVJlXrg3w/I9SCxcST2LasJ1t3ymBwxgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTd3mE6RB+MC7dy8x6yPZg033vlhJSXDcxytYI9e6XoIc+7Wtt
	vUpPYtWcYkAlOjj41jcUVyj5ratVko3mH33GHcQhAwVDNT2WQlo60BFDwln8GFts
X-Gm-Gg: AfdE7cnxoSyGL2hqt9MnOm6xmVCNvfaHtIbVYCPuMA12P7+az5Lx0RcFurhKbGnPt3C
	YFhasM2zqSgiGtwFeYWfYQrBZc3Znm3kT5DLRRqWKdHCJQSlByJ4AZxm/+IhOgRpTyDbB523ics
	v/YvwB53JIXhbeAUqk/5sFh7dGYEhausffaPJqtCpM4NzYNqb9jeBT/h07SalNjsF0OGkEzHc19
	L7aRiobMJwiBpEV+imm6tnySOPoPOjTwqio7FhEQxXdavKiOyVNpeVk9VSneJiYcX7LFl4riIPz
	4V88+qYUfMkRxck/bEDPoWMfG2KE/H+JWU5OF6YoqVYXdsQlUkDtRKkEoet+oN9oKlZxXMOzWdO
	9fWGQbKItYEoYsnNKL2/abo7UpfbnOOl0BWo5BDENfPVtlXcnxcYnPMtNjBLldWBUwrwv+nQ17I
	xveu7UN5ivqJvFKpB22NP1oX9c8UlClbHXxC/YcMn9LY8szd/bwvyqBYR7WeoKOFK9JaJttoSNI
	t1B3om9uD4dE+AvgHAAfR+SgAvkSds=
X-Received: by 2002:a17:902:d2ca:b0:2c9:da58:17dd with SMTP id d9443c01a7336-2ccbf02ea30mr12245295ad.34.1783354518316;
        Mon, 06 Jul 2026 09:15:18 -0700 (PDT)
Received: from NV-9MNJ414.nvidia.com (2001-b011-2005-72fc-7da4-215b-b67f-50ea.dynamic-ip6.hinet.net. [2001:b011:2005:72fc:7da4:215b:b67f:50ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260a1sm53394545ad.11.2026.07.06.09.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:15:17 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	shuah@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yiwei Lin <s921975628@gmail.com>
Subject: [PATCH] kselftest: cpufreq: Backup and restore governor for sptests
Date: Tue,  7 Jul 2026 00:14:30 +0800
Message-Id: <20260706161430.16949-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After executing cpufreq sptest, the system governor
will be overwritten with the governor switched
during the test. Restore this setting to maintain
consistency before and after the test.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
---
 tools/testing/selftests/cpufreq/governor.sh   | 21 +++++++++++++++++++
 .../selftests/cpufreq/special-tests.sh        | 13 ++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/tools/testing/selftests/cpufreq/governor.sh b/tools/testing/selftests/cpufreq/governor.sh
index fe37df79c0871..5d105ab9c9222 100755
--- a/tools/testing/selftests/cpufreq/governor.sh
+++ b/tools/testing/selftests/cpufreq/governor.sh
@@ -16,6 +16,12 @@ source cpufreq.sh
 CUR_GOV=
 CUR_FREQ=
 
+# Per-policy backup, keyed by policy so multiple policies can be saved at once
+# (backup_governor/restore_governor also keep CUR_GOV/CUR_FREQ for callers that
+# read them directly).
+declare -A SAVED_GOVERNORS
+declare -A SAVED_FREQS
+
 # Find governor's directory path
 # $1: policy, $2: governor
 find_gov_directory()
@@ -39,11 +45,13 @@ find_current_governor()
 backup_governor()
 {
 	CUR_GOV=$(find_current_governor $1)
+	SAVED_GOVERNORS[$1]=$CUR_GOV
 
 	printf "Governor backup done for $1: $CUR_GOV\n"
 
 	if [ $CUR_GOV == "userspace" ]; then
 		CUR_FREQ=$(find_current_freq $1)
+		SAVED_FREQS[$1]=$CUR_FREQ
 		printf "Governor frequency backup done for $1: $CUR_FREQ\n"
 	fi
 
@@ -53,11 +61,13 @@ backup_governor()
 # $1: policy
 restore_governor()
 {
+	CUR_GOV=${SAVED_GOVERNORS[$1]}
 	__switch_governor $1 $CUR_GOV
 
 	printf "Governor restored for $1 to $CUR_GOV\n"
 
 	if [ $CUR_GOV == "userspace" ]; then
+		CUR_FREQ=${SAVED_FREQS[$1]}
 		set_cpu_frequency $1 $CUR_FREQ
 		printf "Governor frequency restored for $1: $CUR_FREQ\n"
 	fi
@@ -65,6 +75,17 @@ restore_governor()
 	printf "\n"
 }
 
+# Save/restore governors for every policy at once
+save_all_governors()
+{
+	for_each_policy backup_governor
+}
+
+restore_all_governors()
+{
+	for_each_policy restore_governor
+}
+
 # param:
 # $1: policy, $2: governor
 __switch_governor()
diff --git a/tools/testing/selftests/cpufreq/special-tests.sh b/tools/testing/selftests/cpufreq/special-tests.sh
index 8d40505dc4682..c7eddadd047d1 100755
--- a/tools/testing/selftests/cpufreq/special-tests.sh
+++ b/tools/testing/selftests/cpufreq/special-tests.sh
@@ -40,7 +40,9 @@ simple_lockdep()
 {
 	printf "** Test: Running ${FUNCNAME[0]} **\n"
 
+	save_all_governors
 	for_each_policy __simple_lockdep
+	restore_all_governors
 }
 
 # Test 2
@@ -56,7 +58,10 @@ concurrent_lockdep()
 {
 	printf "** Test: Running ${FUNCNAME[0]} **\n"
 
+	save_all_governors
 	for_each_policy_concurrent __concurrent_lockdep
+	wait
+	restore_all_governors
 }
 
 # Test 3
@@ -68,17 +73,23 @@ quick_shuffle()
 		echo ondemand | sudo tee $CPUFREQROOT/policy*/scaling_governor &
 		echo userspace | sudo tee $CPUFREQROOT/policy*/scaling_governor &
 	done
+	wait
 }
 
 governor_race()
 {
 	printf "** Test: Running ${FUNCNAME[0]} **\n"
 
+	save_all_governors
+
 	# run 8 concurrent instances
 	for I in `seq 8`
 	do
 		quick_shuffle &
 	done
+	wait
+
+	restore_all_governors
 }
 
 # Test 4
@@ -112,5 +123,7 @@ hotplug_with_updates_cpu()
 
 hotplug_with_updates()
 {
+	save_all_governors
 	for_each_non_boot_cpu hotplug_with_updates_cpu
+	restore_all_governors
 }
-- 
2.34.1

