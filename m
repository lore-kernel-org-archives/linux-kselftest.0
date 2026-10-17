Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717073921D6
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249646; cv=none; b=hXzkUDxI+2HdYisnHCLtshPE1vc4zaBfLKY1YEhUvBCfDBFGebRQxSKnBFVY0XPxVIOS62kdlzamOw0Ut6/3eQSxhn7ldLjZjlqumvi9YhLFW/pDQ1jbbEbfmWWMCbilUXGKQdl9+LQR2e21WdTZVr+Jp9Fbl8dxncH6O+plgzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249646; c=relaxed/simple;
	bh=ltKFVKcfOm6yYiNRVudov9rpqK5knEbnpjkack9/LaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7rThItuAOQYNAa/4lAjR8pWBQDqJMnaqecIaGME+7Sx3mOlXZTnL8zsDa7Vr2Cmm/+hrLQnHWltAxF+S6RAVca2chZSDXz+HOWqUoeCih8B+hslH0v+OwkohE3slqM2ey/wp21i9uaXSDw68oe5rPKlwj9VF5qmXG/6+5f0JpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsgso+kW; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsgso+kW"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso868763eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792249644; x=1792854444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QiCRhwHnJeO8E2bgX4UvDZxJcOrRqOmEG3KFmXJoYDM=;
        b=Gsgso+kWGQHb1E2StqipxRXRweDz1as1E2kj8CgEtticKhViZUYU7QlWjQFLNuaj6c
         FMVQNoIFjlpv1vNXfSLnWDwEJjmK9h+Nsj0pb0eeWI2zb+mT4C2GfV3h+R3Uiw0jUOR3
         JjfylUIadLGIcPzEAV+LzHEyRWKn5P9Rvp91tdnmvTYYD3ujSkh/WJyThsxs4pK9kpte
         L31O1hZp1ZO3dzRLoieT+15LTU3oM01ZG60VJy7IW2w9HAxTlrsnizXOcHttp85N7aCp
         k4jlDafUqC000GX6+pkgskZL0cnSMhdYzYwtH3YPwPrgJLlXtK8y7d8rBOwmn5c29UMG
         3ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792249644; x=1792854444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QiCRhwHnJeO8E2bgX4UvDZxJcOrRqOmEG3KFmXJoYDM=;
        b=UH/BLECkJvrPl0H7JxNbOfoDJNZcy+Qplc9sk+skdwyHTyPDobNGe+0Sp//YeBha0B
         Sm7RKdyrupHfhISP2ivhl0nbfd48AQ+az9NVUmTgg55tL3X2GsLtqFPFn4USYqIGBYux
         2zTPWqfhCti2W6o+v81+7WBjabqB0LNvQ+cNQhMrBohcqR76VvlAVFlqxQUwyQLpQaiI
         AH1nsvMW+GB1tuhz5DuAqan6fB8YeLiKFY25TYH2Wa0+n52Bykbt+0a2drHHLK01ajiE
         kOYYnUo8ZZcv1J/ASsW19tuT/UY5N5GVYybxS7+XwvQHyRxejWVrheQTmgvvGbw8KbiN
         Aacg==
X-Forwarded-Encrypted: i=1; AKwUvBx7ezG0xKFK71X517toUqPsZH+hIMupQlV80M1glGsOuflVzlEfALoaA2fuCUmGGyflfopo/Mw3JGL5rTHezQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIyTMUMALoIkZrKIzutoObBNu3beS1AB3HZvRdFP32p3YDcSDU
	AwklTIhxQt8fizWHmbB9XwFz1/UXy1vtjUcblKBGvAQht5A0r3yQ/vuZ
X-Gm-Gg: AYBFou1sJ5UZNc+3PbnyIZ2GSj0Ot1c/rm4TCZJA1YSi+E4tw6NQQmrk7Vyc5l9PwN/
	lYrdPmrKjEoQTIannC6zb620xcaeSHz/1WMQxQmowxdP2yE3nNUJghRt2IoKosgVORUD+WsYVzc
	HzJix9ECpr4hrvuKaqBhgNmINZ0ZfRg32pi83Uqmik53XK3vMf8wgHVKMlWC/Nwz6fiHGvgr6zv
	5TcWaSMexXcKu3dDHh5YDO+e29C+mjeLZlBaDiC0Ssm88tn6YIussBFozHnIsqLqDG1XjQTT94p
	5pZ9HGFrLHfJHLKorw81tWGRlTWETFsYXWTMayRU3sGvcEMhT94vNKoEZNlqaUODC0nh37d7OAk
	wyEEu1TlzSVtQuzhn1u3jDPTR5QpGV8LTygDmSyHOo5V7RpffEwluKrVIHYML1+zkvKR97KE886
	hkyh3CLGjXZJ8ZSuicy/hIO/0YolcyPZsPC/NIaKR4qkbT/vOM6HzLppkNsekxys6k+g==
X-Received: by 2002:a05:7023:a5b:10b0:165:aced:1fde with SMTP id a92af1059eb24-185079fd5b8mr4343118c88.0.1792249644367;
        Sat, 17 Oct 2026 08:07:24 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm13170977c88.8.2026.10.17.08.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:07:23 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 17 Oct 2026 23:07:12 +0800
Subject: [PATCH v2 1/2] selftests/mm: track the modules run_vmtests.sh
 loads
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-1-cbb36b014322@gmail.com>
References: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
In-Reply-To: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

run_vmtests.sh loads hwpoison_inject for the memory-failure test when it
is not there yet, remembers that in a variable local to run_test() and
unloads the module right after the test.

The thp tests need xfs loaded in the same way, and repeating the load,
the bookkeeping and the unload for every module that some test needs
does not scale.

Add load_module(), which loads a module unless it is already present
and records it, and unload every recorded module, in reverse order,
before the script exits. Use it for hwpoison_inject.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384ee..56f5416681da7 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -177,11 +177,30 @@ pretty_name() {
 	echo "$*" | sed -e 's/^\(bash \)\?\.\///'
 }
 
+# Modules this script loaded, unloaded again before it exits
+LOADED_MODULES=()
+
+# Usage: load_module [module]
+load_module() {
+	if [ -d "/sys/module/$1" ]; then
+		return 0
+	fi
+	modprobe -q "$1" || return 1
+	LOADED_MODULES+=("$1")
+}
+
+unload_modules() {
+	local i
+
+	for (( i = ${#LOADED_MODULES[@]} - 1; i >= 0; i-- )); do
+		modprobe -r -q "${LOADED_MODULES[i]}"
+	done
+}
+
 # Usage: run_test [test binary] [arbitrary test arguments...]
 run_test() {
 	if test_selected ${CATEGORY}; then
 		local skip=0
-		local LOADED_HWPOISON_INJECT_MOD=0
 
 		# On memory constrainted systems some tests can fail to allocate hugepages.
 		# perform some cleanup before the test for a higher success rate.
@@ -207,8 +226,7 @@ run_test() {
 						| tap_prefix
 					skip=1
 				else
-					modprobe hwpoison_inject > /dev/null 2>&1
-					LOADED_HWPOISON_INJECT_MOD=1
+					load_module hwpoison_inject
 					if [ ! -d "$HWPOISON_DIR" ]; then
 						echo "hwpoison debugfs interface not present" \
 							| tap_prefix
@@ -231,11 +249,6 @@ run_test() {
 			local ret=${PIPESTATUS[0]}
 		fi
 
-		# Unload hwpoison_inject if we loaded it
-		if [ "${LOADED_HWPOISON_INJECT_MOD}" = "1" ]; then
-			modprobe -r hwpoison_inject > /dev/null 2>&1
-		fi
-
 		count_total=$(( count_total + 1 ))
 		if [ $ret -eq 0 ]; then
 			count_pass=$(( count_pass + 1 ))
@@ -465,4 +478,6 @@ CATEGORY="memory-failure" run_test ./memory-failure
 echo "SUMMARY: PASS=${count_pass} SKIP=${count_skip} FAIL=${count_fail}" | tap_prefix
 echo "1..${count_total}" | tap_output
 
+unload_modules
+
 exit $exitcode

-- 
2.43.0

