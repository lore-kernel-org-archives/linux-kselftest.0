Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4888B489FD0
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045023; cv=none; b=BgwgETzlSgiyLIuUV4EA07xK1OhCMaB5+CXT6g00mNzHOmkTjaSIJbI+t6SKrMvabyuPUqh7kDrd6XZxLDzAFniKHX44sRZLGtO3DqkjqBS4lCtmzWLwTr+kymp8WY4fjceCLc2JyGKN6lhpUxxPgQQ4nodqKOc3iIkH2KARaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045023; c=relaxed/simple;
	bh=0X+AdhuUJlHtyLQafhDA6Ri0tmdjnAfvmKJFKTMJlxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqTcg2SyuIC10vZyJGr4Sngpj8Lm8A8rzCsHItBiMk656gUFLe65vIg+wFwW47KZoEjg+kTslvqIw/ROJyhFOML58gTcrOB4biOC/8CbiVwLvESuIynKitDk+IpQVM+XIYIe4NtwMfe7MB/xmfpfxxrpfo+7O7nCZShfnjJ48DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCo57O0E; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCo57O0E"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396a51b2605so2892773a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045020; x=1789649820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVOi/Y3C1iRUwyA09cZKyOyweLLbf7+xSIA4QpyhUZQ=;
        b=lCo57O0EZfDD/fYBtVv6D39Nfu+PniGRijWIaBH/JszGEVh1vFdW5VQ3IzdFs1qLuX
         ze6w4iEbmlwTg6IN+RyisvMLYwzAScF4Tuhes3NH1iYE6crnO9n3bB94kziAP9Qv9SpG
         M9ChfAjZmTWnsYdyI3zJ0mbZ4ptZaslrzD5/FFHEfCMbKnKi143kKilaI2kVvI8pMHc/
         Tnu0P29swK5xxr0UQglMuF+BTe0DxpaCkBs62avNCU0xlvlfRJ6Y+LKTG5e56ZFNnlNP
         nky73R7X7V7yCz5v2I9v/pawjoL51kOgJe5Ag8jsqhJJNl78qWl93BQNzwDrBxFqpjQw
         dnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045020; x=1789649820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HVOi/Y3C1iRUwyA09cZKyOyweLLbf7+xSIA4QpyhUZQ=;
        b=XnAQHdyclz8GVZ6ntFCv9VfNuz4Zqvww8Y9v2uZBCURhVH+U4OJmgk2uwydqJ9p9rB
         vHdUT/eWXyv/PaBLYIP6ibpGjK+TpitKvrUdPtM4OeU66eYVbBQvZ2R+sRFSvUHOdxgN
         nyHx/8coF2ZDEIsn+JkZ2sSixhUoVoDZvH+alm0MV3mkIk9qQz1666QqHWZ4vPa1kaPG
         NezGfsub/24pizauMcgVyo18JUAyyEioDVhWtYvyDnN8npUJjyiwkpukFg/k9Hr/GggR
         1C/vuqdT9zZ3PQvy+jDk1dIcYwVapdZVq8OLyektFQUXp/gIo3SEJtE8jqEz1fMuYrWj
         Zg+g==
X-Forwarded-Encrypted: i=1; AKwUvBy6NWAXqaM8IwpmzZCF8fkrUvrm4SvCfNghmxTIMGzoy4WGNBr3BN8KubAwS6Ce2WTj+2reo0hlrsTeAUaYktI=@vger.kernel.org
X-Gm-Message-State: AFuF++m6obqiqipCLwopIs+EzubLLtFKKZDRFQ36ri5Gdfl8I7e19LAY
	hh57FlnlBSlpfuPmdt/rjcDWvxAZZ7JugLgNcjPNwgysG+kbe0fXwi96
X-Gm-Gg: AYBFou3zpukdVT1/ES+Z/mttUYVJt7OfM82lANNwwL+gTvAGWnMWwftanZaHUAuKufs
	7pQ1w9ZIW+1vKRifLhDS3lrtEdIMQ0WeTH+4rtGZS8y37UQPJ02yCDiTCK7zAcoaxInRIRWruM3
	G/k6s34/yv4NLg1TpvwOA8vcVHAXVLsM/TEhZOVB+Yvft7IkXrAf9BkzsuDARDVa8r6BOA/gaFa
	XRVRyW7OuA8aamEBTfTLBvdV3OC40cvNJFFce51az/N+ScBmR00USi7ICIx8RLRwmYfA25hTpKe
	DwFSflnxNkfTohCIif2sA/NLy/W6oQmFCbgeaNw/V6JxvIfZZOGxPOOktrmBsC2lsc810Vnakca
	IquMCiqIJEm1HTRmsy1HKtDtRK0qrtGu7cddb8Sd/MDdiCNc+Xt+1JvYIOWbGWgvihSQvoZ1EP2
	eNHdZPLX6ydjKqbzXXs0tpO1h5FoyHm/652UnuY2vThaHVg5fAhGfvogIcDlTrcvYMjymEVw==
X-Received: by 2002:a17:90b:4fc5:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39b26190c25mr61000735a91.6.1789045020263;
        Thu, 10 Sep 2026 05:57:00 -0700 (PDT)
Received: from fedora ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm4800488a91.16.2026.09.10.05.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:56:59 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Savitz <jsavitz@redhat.com>
Subject: [PATCH v3 RESEND 1/2] selftests/mm: Reject invalid test selections before running tests
Date: Thu, 10 Sep 2026 20:56:44 +0800
Message-ID: <20260910125645.285866-2-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910125645.285866-1-diannaaav@gmail.com>
References: <20260910125645.285866-1-diannaaav@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyi Chen <hi@tychen.cc>

getopts reports unknown options and missing arguments, but run_vmtests.sh
ignores its error result and continues with test setup. An empty -t
argument also falls back to the default selection, while unknown category
names can silently select no tests and still reach setup code.

Exit on getopts errors and validate category names against the existing
list in usage() before any test setup. Reject empty and whitespace-only
selections, and normalize category separators so validation and execution
agree. Initialize the default selection before parsing options so only -t
changes the selection.

Fixes: 85463321e726 ("selftests/vm: enable running select groups of tests")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/mm/run_vmtests.sh | 26 +++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384e..9e62ab4c6775 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -96,26 +96,44 @@ separated by spaces:
 
 example: ./run_vmtests.sh -t "hmm mmap ksm"
 EOF
-	exit 0
 }
 
 RUN_ALL=false
 RUN_DESTRUCTIVE=false
 TAP_PREFIX="# "
 
+VM_SELFTEST_ITEMS="default"
+
 while getopts "aht:nd" OPT; do
 	case ${OPT} in
 		"a") RUN_ALL=true ;;
-		"h") usage ;;
+		"h") usage; exit 0 ;;
 		"t") VM_SELFTEST_ITEMS=${OPTARG} ;;
 		"n") TAP_PREFIX= ;;
 		"d") RUN_DESTRUCTIVE=true ;;
+		"?") exit 1 ;;
 	esac
 done
 shift $((OPTIND -1))
 
-# default behavior: run all tests
-VM_SELFTEST_ITEMS=${VM_SELFTEST_ITEMS:-default}
+# Normalize whitespace so validation and test_selected() use the same names.
+read -r -a selected_categories <<< "${VM_SELFTEST_ITEMS//$'\n'/ }"
+VM_SELFTEST_ITEMS="${selected_categories[*]}"
+if [ -z "$VM_SELFTEST_ITEMS" ]; then
+	echo "No test categories specified" >&2
+	exit 1
+fi
+
+if [ "$VM_SELFTEST_ITEMS" != "default" ]; then
+	# Keep the documented category list as the source of valid names.
+	valid_categories=$(usage | sed -n 's/^- //p')
+	for category in "${selected_categories[@]}"; do
+		if ! grep -Fxq -- "$category" <<< "$valid_categories"; then
+			echo "Unknown test category: $category" >&2
+			exit 1
+		fi
+	done
+fi
 
 test_selected() {
 	if [ "$VM_SELFTEST_ITEMS" == "default" ]; then
-- 
2.55.0

