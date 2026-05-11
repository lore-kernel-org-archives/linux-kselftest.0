Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E73CD8BB;
	Mon, 11 May 2026 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517276; cv=none; b=eylVrO5XTIeLXDo/3uDsetIuYJRbzU3sksg/twEWoAxtzElzzJwicDtftRAYAys+12Gb7REwljjcUP77du1XASwKrmIVkuEFKqk4eMxgPYYzdVc+gf8o1pUnS6nMgYOCZ7/WmRPHet/hg5WL1bB8FcxtLWv6scJdYDOxwcbQFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517276; c=relaxed/simple;
	bh=cC+xeN8LxFcFNLizRYxYZtV3Kwl2xV99NyAd74E1Kcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUZiYpawXqbo6y0LK5AaYSyxSVtMpIODneKvqsmmxj+Ry86uY9X1Bp9T3AEqY1uHQhfbT95UGBOiOVyxcPdZQZgd1ONoOHKeyNnlJ79PDVFNRJJppqGLx50owDD4mOu7SOyA2ApscxSno0euVGu3z3bQD+FW76RFW/OJCkgs+vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnI+fDIR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnI+fDIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79249C2BCB0;
	Mon, 11 May 2026 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517276;
	bh=cC+xeN8LxFcFNLizRYxYZtV3Kwl2xV99NyAd74E1Kcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rnI+fDIR/5JJw0kynRF9ZemaGluf5lMGI8mSRiat5jxVTNPyRzJFONCgBKMTYMHXx
	 kVqOmdTXG0ZfZK1FwG0NePMK2RtznAAjZkEZxJ8jp5boBAeavkW7regVKErgZMnE9V
	 uBKtxpCo1tRYVvs085puXBeakH4YNu7rO7SBagErC+sdlXOMd5c9edSL0oCde4t4Pv
	 b/29dfN8KAXIl9VL8orDskje82FF7gVbBStB8NuO7UddsNRFcMNOdNKkPLp5enkrAo
	 tOWIlR8qh4wenV7ADd7HD626cKyhGemsTO447Pkr3K8rVDmkAvMqkg7TILzx52Im1s
	 pomg5ED7lk2GA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Li Wang <li.wang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v4 53/55] selftests/mm: va_high_addr_switch.sh: drop huge pages setup
Date: Mon, 11 May 2026 19:28:37 +0300
Message-ID: <20260511162840.375890-54-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
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

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../selftests/mm/va_high_addr_switch.sh       | 41 +------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.sh b/tools/testing/selftests/mm/va_high_addr_switch.sh
index 9492c2d72634..01c15fe3c799 100755
--- a/tools/testing/selftests/mm/va_high_addr_switch.sh
+++ b/tools/testing/selftests/mm/va_high_addr_switch.sh
@@ -9,7 +9,6 @@
 
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
-orig_nr_hugepages=0
 
 skip()
 {
@@ -77,43 +76,5 @@ check_test_requirements()
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
-retcode=$?
-restore_nr_hugepages
-exit $retcode
+./va_high_addr_switch
-- 
2.53.0

