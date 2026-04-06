Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEEC3806B2;
	Mon,  6 Apr 2026 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485361; cv=none; b=G3CpGR43GpkcpUuELPWlLAjkV69bDvy5y52DWwZ2cp0TUgtlTwlbQ/ZeWKeD1UhwxrWsP1XUipPw94xramwL5lyZRhGOMit8kry/HzerX2GLw++bGBdtfFMBbBnhcoaiqNthegGKPN0ej8VD6eAXpSDUugUrtCu6Ui45e95bAfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485361; c=relaxed/simple;
	bh=M6q1zkEt1sbIFV6K++NJye6dlph/Y82XdwR7nYmElQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gu+rGHQYyW45VMOcLCjFTVma6mHhj5YBHRZ0AIgZ4gcIe007r46OAs6Zs3nkUg9TWtLLTwJw8ITb9IpOlqLPyi9pJy+n36vhpccNHqfAiMtOUW2eUH5E4iHFMrt7Y7+x4F1MYLQP8weN4vENXvejFsvAnLthorO8OURlTIfqjnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAJP+Jhd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAJP+Jhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E00C4CEF7;
	Mon,  6 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485361;
	bh=M6q1zkEt1sbIFV6K++NJye6dlph/Y82XdwR7nYmElQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QAJP+JhdtSkCNKhsErENZZU8T6LZDngJhrwYigw/W0evwsKLji1rs8q4lLoyEO6hT
	 8tp9/XthNoGL/C6m6fcXdrDrU5SOn1iAZ5CI4W3r27OZejYyOw1ohrA+ERF2umOK1Z
	 81q/FcO2T8MUFOQzwabh8CM0E35mpGsSfYJaDjby3rtxcIy2T15+VzSB2NFkKRGC91
	 tuCKCrFHXbuOYfzk3Xviwf4Gx0+elZ8cfLapXD8Havt+ulJdxev68326nNOLZBAOLC
	 EzwPUEHUXxLZrkYCNRLr6b/3Iv/hfl8svR38nMVvUqopiaJKnOUxt/2ELr9inpVo+Y
	 6Gqnrs7o4N5Jw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 51/53] selftests/mm: va_high_addr_switch.sh: drop huge pages setup
Date: Mon,  6 Apr 2026 17:17:33 +0300
Message-ID: <20260406141735.2179309-52-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406141735.2179309-1-rppt@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Since va_high_addr_switch takes care of setting up huge pages, there is
no need to set them up in the va_high_addr_switch.sh wrapper script.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../selftests/mm/va_high_addr_switch.sh       | 39 +------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.sh b/tools/testing/selftests/mm/va_high_addr_switch.sh
index 9492c2d72634..d66c0fd3cb4d 100755
--- a/tools/testing/selftests/mm/va_high_addr_switch.sh
+++ b/tools/testing/selftests/mm/va_high_addr_switch.sh
@@ -9,7 +9,6 @@
 
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
-orig_nr_hugepages=0
 
 skip()
 {
@@ -77,43 +76,7 @@ check_test_requirements()
 	esac
 }
 
-save_nr_hugepages()
-{
-	orig_nr_hugepages=$(cat /proc/sys/vm/nr_hugepages)
-}
-
-restore_nr_hugepages()
-{
-	echo "$orig_nr_hugepages" > /proc/sys/vm/nr_hugepages
-}
-
-setup_nr_hugepages()
-{
-	local needpgs=$1
-	while read -r name size unit; do
-		if [ "$name" = "HugePages_Free:" ]; then
-			freepgs="$size"
-			break
-		fi
-	done < /proc/meminfo
-	if [ "$freepgs" -ge "$needpgs" ]; then
-		return
-	fi
-	local hpgs=$((orig_nr_hugepages + needpgs))
-	echo $hpgs > /proc/sys/vm/nr_hugepages
-
-	local nr_hugepgs=$(cat /proc/sys/vm/nr_hugepages)
-	if [ "$nr_hugepgs" != "$hpgs" ]; then
-		restore_nr_hugepages
-		skip "$0: no enough hugepages for testing"
-	fi
-}
-
 check_test_requirements
-save_nr_hugepages
-# The HugeTLB tests require 6 pages
-setup_nr_hugepages 6
-./va_high_addr_switch --run-hugetlb
+./va_high_addr_switch
 retcode=$?
-restore_nr_hugepages
 exit $retcode
-- 
2.53.0

