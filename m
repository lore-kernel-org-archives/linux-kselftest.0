Received: from out-utut-a193.jellyfish.systems (out-utut-a193.jellyfish.systems [198.177.127.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A433A9D9D
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.177.127.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861366; cv=none; b=bXhsNnHIgCakITRaInBeoYRdCp2PDJE96x98U8qR0zuXR/Dg1hxA+Hci2NQckETO3PHQXqJoVJSFLfWDtRCKavrs33B/E6Pjl3h7Mk6Ie9ZMXcnJMhSwNAiyP8fCAdjHPLu6KzDaFSHXIcwEkunF88nK+jJX8tZvBGcUw/jBvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861366; c=relaxed/simple;
	bh=GJKDCPElpX2rpNARwUgmgTRmn85+zT/qo0mb009bxZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkayf6iVmZ+IAHq21PELC6OctywUHTkwBz3l1MtaP59foKf0/INu9M73G/dq+rqOOCz04ki662w8QtHPBI+I0kSGVav8NvAPBg6/0mVtkDjb752DjbqPQHLQpQhWul7Gry/3F+peU3M6BQ0/MjH3O3mDFZBnfIM6P3uujjyUGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=KM+HATLl; arc=none smtp.client-ip=198.177.127.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="KM+HATLl"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hfK7p3czFz2xMb;
	Tue, 08 Sep 2026 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788861355;
	bh=F3A3Ti8zHULaJXvRQhe+IOMxiiKMtUoHgOGnDhRSZ4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KM+HATLl/00pp1TKFH+uuYnLDrMWkAQhZAz4OLB6hGUg/JZF04lHzvDhuT8w62o1b
	 wpYFKfZLv82MXPqka7i99mVNrSCM+WAKrzPdWu9EjoAXArubeRPSPKVPCIxiQ2bfYt
	 qHaVq/KoSiZ2F/JGwb+oAAylwdIZJm5TCk5ceCcCU+/MYa5gjpaFXQsjh6SrBWenSM
	 3v5iKsOb+LL/A4Q/AVnhEg0fHUuE0TBAqbGx4uoNx+id3l6O4KAYyFzWIrpPMOYWjC
	 puWR+mpAIflz0/mrPeOi3whEqXIUKorEty6qBzxx4KHni4kOgep7U2HqkG9KDz/t62
	 HhNugY2aKGL/g==
From: Tianyi Chen <hi@tychen.cc>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jsavitz@redhat.com,
	hi@tychen.cc
Subject: [PATCH v2 1/2] selftests/mm: Reject invalid test selections before running tests
Date: Tue,  8 Sep 2026 17:55:32 +0800
Message-ID: <178886112560.138404.14562368683011041790.mm-cli-v2-1@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc>
References: <20260906135444.749144-1-hi@tychen.cc> <178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

getopts reports unknown options and missing arguments, but run_vmtests.sh
ignores its error result and continues with test setup. An empty -t
argument also falls back to the default selection, while unknown category
names can silently select no tests and still reach setup code.

Exit on getopts errors and validate category names against the existing
list in usage() before any test setup. Reject empty and whitespace-only
selections, and normalize category separators so validation and execution
agree. Keep the default selection for an unset or empty VM_SELFTEST_ITEMS
environment variable, and preserve the existing standalone default value.

Fixes: 85463321e726 ("selftests/vm: enable running select groups of tests")
Assisted-by: Codex:GPT-6
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/mm/run_vmtests.sh | 27 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384..836c7454cba 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -96,26 +96,45 @@ separated by spaces:
 
 example: ./run_vmtests.sh -t "hmm mmap ksm"
 EOF
-	exit 0
 }
 
 RUN_ALL=false
 RUN_DESTRUCTIVE=false
 TAP_PREFIX="# "
 
+# An unset or empty environment selection keeps the default behavior.
+VM_SELFTEST_ITEMS=${VM_SELFTEST_ITEMS:-default}
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

