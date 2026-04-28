Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE083644CF;
	Tue, 28 Apr 2026 20:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409327; cv=none; b=DRO6aiwdkLxDZFvZEtyg784v1Cswmx+rXLv5V6eZePE9eRzHwZzLw4I8lPZ2Ge4soE4Cg5YkOwchscIofUUNdtUn5BeGmrkarjzDk9Uv4yK8lbnC2zfEFLXdK9dapBHfhEwlJmb3hewTvzN+uWOgFS4o1vMlrJjfNKvSnp1a290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409327; c=relaxed/simple;
	bh=sZoUbqG9CxBotaWHnOZiPFKTeBgb66YHvpq2HPRKqX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1Z0SCOK44mYCA4U63KlBK8GGo1MW+x12lvlGnQ7eOcmTec5eW5fzAmp8fnVNjF7fZGCtHUVSqUnXwq5kihUMNzTKCCAmC7KQ9mobuDvUBz19IYIFwtEgGt37qyQbydYICq1MuH2EfQUJI1BbUA09HF2NMvZndCHe0GLh37KorE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEwvk+c8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEwvk+c8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0401C2BCB3;
	Tue, 28 Apr 2026 20:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409326;
	bh=sZoUbqG9CxBotaWHnOZiPFKTeBgb66YHvpq2HPRKqX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BEwvk+c89LXIHHCN4f4+Pq+EZNnwtnAEh4uQfFVWCsMySqE6CEf3Zyl21hKweLePx
	 QTen65EdzL7a0w0B10gW3pGXeKM1OaZppOW2E1rJi6+9i6Ri394QYTTjA0KbveQ749
	 n+ukaoBLr/8SEUosGjg0ZiD3nTontIjbw+DDyEeQtOe31/UdT5ncNH9cRoagF0E3qN
	 iDIqSxmz37VI8471rn/QiADf1v6JpmoBierHgdYLgEW3Ha5d/9hP2ElN0wZoFspVAE
	 MRZc13pYZLOorECpjjSqnX7REv2Mwxt5BxDR9zjP3yNeukhpr17mQxNJF3vyFpVIg7
	 KcHpVou0RUFCQ==
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
Subject: [PATCH v3 54/54] selftests/mm: run_vmtests.sh: drop detection and setup of HugeTLB
Date: Tue, 28 Apr 2026 23:42:40 +0300
Message-ID: <20260428204240.1924129-55-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

All the tests that use HugeTLB can detect and setup HugeTLB pages on
their own.

Drop detection and setup of HugeTLB from run_vmtests.sh.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/run_vmtests.sh | 128 ++--------------------
 1 file changed, 9 insertions(+), 119 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index b42d19036182..7e0c379e7af4 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -157,60 +157,6 @@ run_gup_matrix() {
     done
 }
 
-# get huge pagesize and freepages from /proc/meminfo
-while read -r name size unit; do
-	if [ "$name" = "HugePages_Free:" ]; then
-		freepgs="$size"
-	fi
-	if [ "$name" = "Hugepagesize:" ]; then
-		hpgsize_KB="$size"
-	fi
-done < /proc/meminfo
-
-# Simple hugetlbfs tests have a hardcoded minimum requirement of
-# huge pages totaling 256MB (262144KB) in size.  The userfaultfd
-# hugetlb test requires a minimum of 2 * nr_cpus huge pages.  Take
-# both of these requirements into account and attempt to increase
-# number of huge pages available.
-nr_cpus=$(nproc)
-uffd_min_KB=$((hpgsize_KB * nr_cpus * 2))
-hugetlb_min_KB=$((256 * 1024))
-if [[ $uffd_min_KB -gt $hugetlb_min_KB ]]; then
-	needmem_KB=$uffd_min_KB
-else
-	needmem_KB=$hugetlb_min_KB
-fi
-
-# set proper nr_hugepages
-if [ -n "$freepgs" ] && [ -n "$hpgsize_KB" ]; then
-	orig_nr_hugepgs=$(cat /proc/sys/vm/nr_hugepages)
-	needpgs=$((needmem_KB / hpgsize_KB))
-	tries=2
-	while [ "$tries" -gt 0 ] && [ "$freepgs" -lt "$needpgs" ]; do
-		lackpgs=$((needpgs - freepgs))
-		echo 3 > /proc/sys/vm/drop_caches
-		if ! echo $((lackpgs + orig_nr_hugepgs)) > /proc/sys/vm/nr_hugepages; then
-			echo "Please run this test as root"
-			exit $ksft_skip
-		fi
-		while read -r name size unit; do
-			if [ "$name" = "HugePages_Free:" ]; then
-				freepgs=$size
-			fi
-		done < /proc/meminfo
-		tries=$((tries - 1))
-	done
-	nr_hugepgs=$(cat /proc/sys/vm/nr_hugepages)
-	if [ "$freepgs" -lt "$needpgs" ]; then
-		printf "Not enough huge pages available (%d < %d)\n" \
-		       "$freepgs" "$needpgs"
-	fi
-	HAVE_HUGEPAGES=1
-else
-	echo "no hugetlbfs support in kernel?"
-	HAVE_HUGEPAGES=0
-fi
-
 # filter 64bit architectures
 ARCH64STR="arm64 mips64 parisc64 ppc64 ppc64le riscv64 s390x sparc64 x86_64"
 if [ -z "$ARCH" ]; then
@@ -283,29 +229,13 @@ run_test() {
 echo "TAP version 13" | tap_output
 
 CATEGORY="hugetlb" run_test ./hugetlb-mmap
-
-shmmax=$(cat /proc/sys/kernel/shmmax)
-shmall=$(cat /proc/sys/kernel/shmall)
-echo 268435456 > /proc/sys/kernel/shmmax
-echo 4194304 > /proc/sys/kernel/shmall
 CATEGORY="hugetlb" run_test ./hugetlb-shm
-echo "$shmmax" > /proc/sys/kernel/shmmax
-echo "$shmall" > /proc/sys/kernel/shmall
-
 CATEGORY="hugetlb" run_test ./hugetlb-mremap
 CATEGORY="hugetlb" run_test ./hugetlb-vmemmap
 CATEGORY="hugetlb" run_test ./hugetlb-madvise
 CATEGORY="hugetlb" run_test ./hugetlb_dio
-
-if [ "${HAVE_HUGEPAGES}" = "1" ]; then
-	nr_hugepages_tmp=$(cat /proc/sys/vm/nr_hugepages)
-	# For this test, we need one and just one huge page
-	echo 1 > /proc/sys/vm/nr_hugepages
-	CATEGORY="hugetlb" run_test ./hugetlb_fault_after_madv
-	CATEGORY="hugetlb" run_test ./hugetlb_madv_vs_map
-	# Restore the previous number of huge pages, since further tests rely on it
-	echo "$nr_hugepages_tmp" > /proc/sys/vm/nr_hugepages
-fi
+CATEGORY="hugetlb" run_test ./hugetlb_fault_after_madv
+CATEGORY="hugetlb" run_test ./hugetlb_madv_vs_map
 
 if test_selected "hugetlb"; then
 	echo "NOTE: These hugetlb tests provide minimal coverage.  Use"	  | tap_prefix
@@ -332,44 +262,12 @@ CATEGORY="gup_test" run_test ./gup_longterm
 CATEGORY="userfaultfd" run_test ./uffd-unit-tests
 uffd_stress_bin=./uffd-stress
 CATEGORY="userfaultfd" run_test ${uffd_stress_bin} anon 20 16
-# Hugetlb tests require source and destination huge pages. Pass in almost half
-# the size of the free pages we have, which is used for *each*. An adjustment
-# of (nr_parallel - 1) is done (see nr_parallel in uffd-stress.c) to have some
-# extra hugepages - this is done to prevent the test from failing by racily
-# reserving more hugepages than strictly required.
-# uffd-stress expects a region expressed in MiB, so we adjust
-# half_ufd_size_MB accordingly.
 adjustment=$(( (31 < (nr_cpus - 1)) ? 31 : (nr_cpus - 1) ))
-half_ufd_size_MB=$((((freepgs - adjustment) * hpgsize_KB) / 1024 / 2))
-CATEGORY="userfaultfd" run_test ${uffd_stress_bin} hugetlb "$half_ufd_size_MB" 32
-CATEGORY="userfaultfd" run_test ${uffd_stress_bin} hugetlb-private "$half_ufd_size_MB" 32
+CATEGORY="userfaultfd" run_test ${uffd_stress_bin} hugetlb 128 32
+CATEGORY="userfaultfd" run_test ${uffd_stress_bin} hugetlb-private 128 32
 CATEGORY="userfaultfd" run_test ${uffd_stress_bin} shmem 20 16
 CATEGORY="userfaultfd" run_test ${uffd_stress_bin} shmem-private 20 16
-# uffd-wp-mremap requires at least one page of each size.
-have_all_size_hugepgs=true
-declare -A nr_size_hugepgs
-for f in /sys/kernel/mm/hugepages/**/nr_hugepages; do
-	old=$(cat $f)
-	nr_size_hugepgs["$f"]="$old"
-	if [ "$old" == 0 ]; then
-		echo 1 > "$f"
-	fi
-	if [ $(cat "$f") == 0 ]; then
-		have_all_size_hugepgs=false
-		break
-	fi
-done
-if $have_all_size_hugepgs; then
-	CATEGORY="userfaultfd" run_test ./uffd-wp-mremap
-else
-	echo "# SKIP ./uffd-wp-mremap"
-fi
-
-#cleanup
-for f in "${!nr_size_hugepgs[@]}"; do
-	echo "${nr_size_hugepgs["$f"]}" > "$f"
-done
-echo "$nr_hugepgs" > /proc/sys/vm/nr_hugepages
+CATEGORY="userfaultfd" run_test ./uffd-wp-mremap
 
 CATEGORY="compaction" run_test ./compaction_test
 
@@ -393,14 +291,11 @@ CATEGORY="mremap" run_test ./mremap_test
 CATEGORY="hugetlb" run_test ./thuge-gen
 CATEGORY="hugetlb" run_test ./charge_reserved_hugetlb.sh -cgroup-v2
 CATEGORY="hugetlb" run_test ./hugetlb_reparenting_test.sh -cgroup-v2
+
 if $RUN_DESTRUCTIVE; then
-nr_hugepages_tmp=$(cat /proc/sys/vm/nr_hugepages)
-enable_soft_offline=$(cat /proc/sys/vm/enable_soft_offline)
-echo 8 > /proc/sys/vm/nr_hugepages
-CATEGORY="hugetlb" run_test ./hugetlb-soft-offline
-echo "$nr_hugepages_tmp" > /proc/sys/vm/nr_hugepages
-echo "$enable_soft_offline" > /proc/sys/vm/enable_soft_offline
-CATEGORY="hugetlb" run_test ./hugetlb-read-hwpoison
+	CATEGORY="hugetlb" run_test ./hugetlb-soft-offline
+	echo "$enable_soft_offline" > /proc/sys/vm/enable_soft_offline
+	CATEGORY="hugetlb" run_test ./hugetlb-read-hwpoison
 fi
 
 if [ $VADDR64 -ne 0 ]; then
@@ -464,7 +359,6 @@ if [ -x ./protection_keys_64 ]
 then
 	CATEGORY="pkey" run_test ./protection_keys_64
 fi
-echo "$nr_hugepgs" > /proc/sys/vm/nr_hugepages
 
 if [ -x ./soft-dirty ]
 then
@@ -545,10 +439,6 @@ if [ -n "${LOADED_MOD}" ]; then
 	modprobe -r hwpoison_inject > /dev/null 2>&1
 fi
 
-if [ "${HAVE_HUGEPAGES}" = 1 ]; then
-	echo "$orig_nr_hugepgs" > /proc/sys/vm/nr_hugepages
-fi
-
 echo "SUMMARY: PASS=${count_pass} SKIP=${count_skip} FAIL=${count_fail}" | tap_prefix
 echo "1..${count_total}" | tap_output
 
-- 
2.53.0

