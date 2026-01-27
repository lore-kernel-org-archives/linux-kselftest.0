Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D701E47C5
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 02:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481570; cv=none; b=qop5sehELmEo1UGTV2N3acOCWxAGIkNFN37dcn4PAFr9XAuGGc7yzBoSzmGmuE/OBdDQBIYbq/ipagz8CbtNPaCqL9umQEh8tMo+Vh649k+w5X0e2Zogb8v8Uy++YYW4dSGs/bwnpg00HwY5MRMA1Gq+dLfzOuBiFY9Ef2tJw44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481570; c=relaxed/simple;
	bh=5XxKCFjvUeBJd3/sJWOWOhH6U2z8NICLOoQ31iyLR/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yuk1p1SB9RVK3iAXxSfXSQcfk1j+7UXZIZ0Olk/5RjV/gaPSQUr/mlgf5O2Is0H1QEuHs7VFTFbKPfi9B1xvvsrML5qRE5o13RKZaOgv0zSo2uN0XAem4DP5wlj6T75+1xipyOHURBWlL85qzgBMHN5vnCcvYnb+2c9HJFwV+tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wl+NyzFk; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wl+NyzFk"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82307c6902eso2306684b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 18:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769481568; x=1770086368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpYVNl6F2yjMKr4vJzkPb0vzLf2Qs5yJn+B2+9BM/zU=;
        b=Wl+NyzFkEWA6kkrVN9TPoUwKU4iSKIk8IbrtHcax85vm1GHqpzfIiWPyEnM65I8xjP
         UkALdAgdhsDDM3jN7YGTNiouscNwaAPBu8QprU8uuz0k1WpjPVzMbV9H9/S+eCTtw77N
         f4irrdygHMYQw6/CeBrvLIXtAPtIfYKQGhquM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769481568; x=1770086368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpYVNl6F2yjMKr4vJzkPb0vzLf2Qs5yJn+B2+9BM/zU=;
        b=AzVWicaT21U5P9Q2oOTpvqIGKyiMzcdWFJmSqG2JETDueVaxuAV/+OQOXmfWft6XFy
         j4YKouZWJST+I5zGn1wupNjdAsYKoqyU1ud8iiK8XC/xm8MVI6oSWDy1FYK5pI4r20a3
         CyW+fVRG/HE4ahbsSVgjFNiLMj9NekbAtlu1VHttagKsu064olk3/FnMohVMtlkQXtoh
         QA4+NC+ZsqTLIY4+jBJKAifwzI2Yp41bXGIX9QII3nVcdbF3arBeoWzHGs+Xwf92m9/p
         7ctQci+mJXz3t9FXiFWGoP+kK5DU/rHIK7a07F4zmxMOuEF7OEdubb7hkQ6RiXChzDFN
         6OQQ==
X-Gm-Message-State: AOJu0YxzapPcdyN/uj+XHTUCjjRmfN3xChc06ZweHeACX/A5J2/aeR5D
	Ht8OznelMIym5r+2RqL065rpvEXYgvnHXsuR61uUQHhJmq/afRxo+nLJ5G/M/Ulz9HI7f/FDxOO
	rSzk=
X-Gm-Gg: AZuq6aLVbMXeyELXiL0nLuish5xBLS6f8ae5tqBGtoWpJ1PwM8sO/eFssN8Rn1hx4NM
	Oyg/ruX5Wp58HAeuxHybZwOoqvZopZmcbHpN4FZGDMhIr5cor1EKS9DVpzGI9hQsVr2lv6VHp25
	YMZNHCjI5p6dNfO2PKOgIzMs/e9UYchmDPvKzanp24jZnyVYhr4B/gBfbW6EzfbD3ph82bz2WPI
	hVv0TP4gA1TiDqv6nZ4bqNY+5KzEMJCMCj/n6fdC7ZZX1n1BKdU63V2JNzD8VH0uJT7T/yVfvT0
	3lk486wEJ9l6BiWUqvd2zo1keLYXef9IHc5hx41FvjRvT2ffXwQ2GarHJaAj3clxeJTTvpd8QKm
	2U4XsSfRIjYsxJCXZcdBEx6VZiY2+IFZLGwpkxpEuFcvctilsXrICBIkNDR4WykmGkqOgKs5yp1
	wbVvJnB+WxJVZvMW19+WVimws9tXX43ct7fbgg8yIxTSlNvOaO1dEwbW7Ie44bpwVLVsp+Sm7pU
	w==
X-Received: by 2002:a05:6a00:1c98:b0:823:1427:59e1 with SMTP id d2e1a72fcca58-8236914c638mr361715b3a.6.1769481567947;
        Mon, 26 Jan 2026 18:39:27 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:d089:781c:105e:9178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231877005dsm10297794b3a.68.2026.01.26.18.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 18:39:27 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] selftests/zram: remove max_comp_streams test
Date: Tue, 27 Jan 2026 11:39:09 +0900
Message-ID: <20260127023910.2756093-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zram max_comp_streams device attribute has been deprecated
and defunct since 2016 (when zram switched to per-CPU
compression stream) and it was eventually removed a while
ago.

Drop the corresponding selftests.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 tools/testing/selftests/zram/zram01.sh   |  2 --
 tools/testing/selftests/zram/zram02.sh   |  2 --
 tools/testing/selftests/zram/zram_lib.sh | 29 ------------------------
 3 files changed, 33 deletions(-)

diff --git a/tools/testing/selftests/zram/zram01.sh b/tools/testing/selftests/zram/zram01.sh
index 8f4affe34f3e..638ecc9afaa0 100755
--- a/tools/testing/selftests/zram/zram01.sh
+++ b/tools/testing/selftests/zram/zram01.sh
@@ -17,7 +17,6 @@ ERR_CODE=0
 dev_num=1
 # This is a list of parameters for zram devices.
 # Number of items must be equal to 'dev_num' parameter.
-zram_max_streams="2"
 
 # The zram sysfs node 'disksize' value can be either in bytes,
 # or you can use mem suffixes. But in some old kernels, mem
@@ -58,7 +57,6 @@ zram_fill_fs()
 
 check_prereqs
 zram_load
-zram_max_streams
 zram_compress_alg
 zram_set_disksizes
 zram_set_memlimit
diff --git a/tools/testing/selftests/zram/zram02.sh b/tools/testing/selftests/zram/zram02.sh
index 2418b0c4ed13..e0a408160903 100755
--- a/tools/testing/selftests/zram/zram02.sh
+++ b/tools/testing/selftests/zram/zram02.sh
@@ -16,7 +16,6 @@ ERR_CODE=0
 dev_num=1
 # This is a list of parameters for zram devices.
 # Number of items must be equal to 'dev_num' parameter.
-zram_max_streams="2"
 
 # The zram sysfs node 'disksize' value can be either in bytes,
 # or you can use mem suffixes. But in some old kernels, mem
@@ -30,7 +29,6 @@ zram_mem_limits="1M"
 
 check_prereqs
 zram_load
-zram_max_streams
 zram_set_disksizes
 zram_set_memlimit
 zram_makeswap
diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index 21ec1966de76..4ab8ac018a0c 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -116,35 +116,6 @@ zram_load()
 	echo "all zram devices (/dev/zram0~$dev_end) successfully created"
 }
 
-zram_max_streams()
-{
-	echo "set max_comp_streams to zram device(s)"
-
-	kernel_gte 4.7
-	if [ $? -eq 0 ]; then
-		echo "The device attribute max_comp_streams was"\
-		               "deprecated in 4.7"
-		return 0
-	fi
-
-	local i=$dev_start
-	for max_s in $zram_max_streams; do
-		local sys_path="/sys/block/zram${i}/max_comp_streams"
-		echo $max_s > $sys_path || \
-			echo "FAIL failed to set '$max_s' to $sys_path"
-		sleep 1
-		local max_streams=$(cat $sys_path)
-
-		[ "$max_s" -ne "$max_streams" ] && \
-			echo "FAIL can't set max_streams '$max_s', get $max_stream"
-
-		i=$(($i + 1))
-		echo "$sys_path = '$max_streams'"
-	done
-
-	echo "zram max streams: OK"
-}
-
 zram_compress_alg()
 {
 	echo "test that we can set compression algorithm"
-- 
2.53.0.rc1.217.geba53bf80e-goog

