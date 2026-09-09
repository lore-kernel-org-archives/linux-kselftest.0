Received: from mail-qk2-f11.google.com (mail-qk2-f11.google.com [74.125.230.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD46576ED4
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.203
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965662; cv=pass; b=udfeED83VXv5fWt0HIZQdaBwtj/NcX/3X3Ta/eTzLgOqR0QI9L9/+mGAv6J9nbwAlhc50c5HyVR/BAHUl1msA8RZGYlp2+JC8FHo9ex497oALTeOGD7YEH2rktAqsTcTeXLJXhnf6Ly2ywp8uehYzw115rdcX2HsTQbZ0KnHqN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965662; c=relaxed/simple;
	bh=TLXolKG621p2LkxjBgzjDjrxBq4R+3i7ra2dwhuU64M=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3rxsdHRs6Zgg3x31aPFYgLy41E7P621Fyy9fPPBcDw9HQz+/YsMoGQ1WY+bkCNEuu9OnlxUSD61FwYG7Tl43VErJj6ypRP9mwA+QALb3tAPIA222niJS+9aTEFqKG8tWKVY/gj9MdHgYwYscfM+MHVCfHYanA71hj8Wethkq2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSGVNtMX; arc=pass smtp.client-ip=74.125.230.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSGVNtMX"
Received: by mail-qk2-f11.google.com with SMTP id af79cd13be357-930914e4fc3so320725985a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965660; cv=none;
        d=google.com; s=arc-20260327;
        b=mpNJqWa8BAVX9pNMXG72N6mogqWkLi3fV2BMTJtKWKC9ff8+cu+NTJw6xP79M1B4iT
         wPpBlgFIHGmaAM1xaN3lBeWb0VDmsxiiUaYDcCa97N5NIWTqR99P83ctMIsL43zkVOn+
         quhC/YbvY86gCg0ZVJ5JPVCMnW86gT1RZIbQGSlzzfBRmxzon+4QIxzsO6Y3yOnnQA5K
         3pUwxnT/lthdcWGK2AO59QN5KwBqPJ4kK3BGWR2bnX7sXC2YIr+GpPULqeA6RRUOwM49
         SgcDKr5PfGdGhsMN6r3PP86XxSyaKpa/YpICdsAR0mcMRx6kQAfXvcGsNu1gVsSgzryV
         4XTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=u+ctEZD06peNSR4eAdlrxlVUiCDE+dJnPzXeAForwRE=;
        fh=csL9cXEmEJxep2x0LB2Bet/4ktcg7yLthe/1MzPiBLk=;
        b=n6dVvI0F1uloCuL9+BBKZQ1eBV/czGxh394oU/TpgUvlo9KHsiHQKAaNnc/ej8B76q
         dDCDvELaN5mG7TeH9hTYXR3ffN+Gls3KHmvRmh2+uLRnji8MiBl7eUBcqPrgusVLsHxq
         PPtMB3X6CpvHBer5y8a+6K2Nt1RZSKJo8d39YIRpsEKDhkOkxCmp5mcxN/BOMr2x749q
         JH0TT64JegW/lhrkjMtWCN7KCmzEC30WiFwVJhnEHyrWDRIKdOlOOd3CiW+TU60LNFzB
         Q3gDeOnBCRU0tuPLvj5rbJGuoltdXrMubTKhCKIorAGcrrDJtixcTIub0cmgrNRF5Eyx
         /0lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965660; x=1789570460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+ctEZD06peNSR4eAdlrxlVUiCDE+dJnPzXeAForwRE=;
        b=sSGVNtMXnSV1FiSA0urH+aFt5Bs9RUi2QJd8UY8nGwoLJBvgi9fcYiTq4lIG2r6FBq
         s8fh73fKA9ve7J2ROquwTDoWcDxuN+pk158SIAV1PsUneTThXgzdJYNoIOsxXlwt208c
         B9LmFAkFwULhMaAaTfLUInGyneOvb3qgm+/a3xq3MbAP60xejj484Fy06Gq8i28HMjjM
         danKYeswK3t1nn9J4OP1sC4JyV5O/jkneLctXmUInroCdO5pS3mpg6v04+pG1zGV4q4o
         GGpCv0PkFHHE8nunZiIFfCiupfFhpPNQqCO9ZpdDxUPWOe4ATlbCEJcKy4+dVUpLQwM4
         jJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965660; x=1789570460;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+ctEZD06peNSR4eAdlrxlVUiCDE+dJnPzXeAForwRE=;
        b=Isrm/9nEBLi1kCXb6qQdIZRqnHyv6LbnHOzqa3vQRlcNxH5wgapNcr8ExZxpBbwHo2
         NXBSXONCKN8PqSKCESDyS5NTJStJT9OEA7ZWyTZLm7thbed1sZmQsR081+zQW16xYv+S
         ER4iSPrg6i6wVlNIi8HIyGBbPrIIhU3EeeIK9+aAkvDTH3dgnMe9wgYnwC10xfKPxnv7
         gprGLJdIl3AqkXey1qHyV1rUQaZYmgDkzY8FwgtLea5bfBIly2D24h4lKd5SGankht1e
         SwqrnK8/kaS4rFRZIUl7hHmme9jnLHa5u4uc8gDW8qUV7QC+vplV8oBpxnBW1qJmcbWu
         t8PA==
X-Forwarded-Encrypted: i=1; AKwUvByj/uI/G93b5n+ELw4KCgAtC1YShCZAk3vzM4XCtBu0AhOmcGUUikGb33hGpxcMSQHB6buEq95hK2CrRwml3cg=@vger.kernel.org
X-Gm-Message-State: AFuF++nBRu5sh+1QfPR9arbNfMyJR4rQb0dZmIEXvepjYBTKWWa7osbu
	yi4ph4Qm+oOTJkKERgYQTeg6aEEfflgIxaPogzCr85NQ7NEnMN16JCni3a2NobLgboiPmV7sJru
	tdNYkJbbqby7Bd/7HDVKYD7edmpb/hi8=
X-Gm-Gg: AYBFou2Ri6V69tSkR+xTu+lMHWcnCMKbSwYM8TTGGKblw6NBO2A+QufFqrMRfZxm6UQ
	SO1AF0T+IpenK3xUXSma2HynwTKs8E5z5g9grqrgNmTfHJkAy2LS3NcJYXvIvjhPWyjR6dEtDv0
	VjFLEQ5llUeaAtCeGwGGjqPNSj8y/eGUZ+vEdJVHKSv133Ikh1mlZIzWpboEK0Tz7YCJNi62dUo
	mw8b9LWv4Qx9WtHddyaIekSnAF2Ih8ppyDMqa0SUoSBFsZ7io5s26TlefOZd705/CH4WmAaBXsR
	YwYMm+3W2sUHNI7MbBmzftgWsUvABjhyoE36WBjyFMi8s4VTwKWYVQ==
X-Received: by 2002:a05:6214:4a05:b0:910:4874:66e5 with SMTP id
 6a1803df08f44-910d104bebfmr25031596d6.21.1788965659974; Wed, 09 Sep 2026
 07:54:19 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:19 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:19 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
References: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
Date: Wed, 9 Sep 2026 07:54:19 -0700
X-Gm-Features: AcwNN1UNxzL5WjMgcuf3-e2gvm86CJeujKJF0gUL8RZhHjcliTNAwngLs5rsPew
Message-ID: <CACGbirR9PNt4uhqJFATsOWnwmsNb-v8zau-Rb+9Q5SZmY-=Vug@mail.gmail.com>
Subject: [PATCH v3 RESEND 1/2] selftests/mm: Reject invalid test selections
 before running tests
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Tianyi Chen <hi@tychen.cc>
Date: Tue, 08 Sep 2026 11:21:21 +0800

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

diff --git a/tools/testing/selftests/mm/run_vmtests.sh
b/tools/testing/selftests/mm/run_vmtests.sh
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
