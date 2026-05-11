Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D67481FDA;
	Mon, 11 May 2026 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517289; cv=none; b=cS0tXdabTuHaZVcdvZ4LPyU5uxozgow1/D6rioTpaxe7LJx/GUi13s4qEShbG1x4Z2JGqw8cUt7yzvhhXSS8Qo2byYZx4Fn1nZIo83LgCvOitxHFg/0ikhe+oz03NVSZTXDXZgSeADVta4J0vYSdESRqI/Bks5FHcaazWk9gNQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517289; c=relaxed/simple;
	bh=8nR0ELKi7mbRVnmxjYNZjGeMYUYYYJwNNBptfNilokM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCDkDvxUpU4r0xaUK47baXbZIB9kwiCE5dPvI8j8iG6QltOfW41uQivSD4OAjkCrNyqoT5ruWve+qNW0fFlCPY3IZrAaoi8BSUIF0Nhv7QXBLWaJdPjuhfAvbe60rAx63vJiAzm34Reg8gFAtt2lADveKnYT99GCcNzdx6ePfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+I7jzkX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+I7jzkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7780DC2BCB0;
	Mon, 11 May 2026 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517289;
	bh=8nR0ELKi7mbRVnmxjYNZjGeMYUYYYJwNNBptfNilokM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+I7jzkXKdRKdySrSn134ag6OMHx+2+YsNNDNrt8UTVUya999OehInoOgd2qrhZmS
	 n4me+JzaKWyzW04zbfT+z9Lsu/WNx/YaeuRaXzJA/aq00VZULVgDSvqaMtGlSj9ZaA
	 KGPlM2NpreTNQK6LR5xx5P4vaAK1CvmzIrX2BcQLAUyYrAUTyheNh7z7nwwVD4liRB
	 SZbIF91rKqIls6J1EE5PP0K22n6qk7p/NdeSQS9YU22QEl534t2Nznzed4HRIjsyYf
	 JvLO9zMBtpv4kmu/q/smxBvegury63KKQCwUlIWuxwv6fEQY7MsQDO1SUHTD24y85y
	 /2Em4CBqSIs3w==
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
Subject: [PATCH v4 55/55] selftests/mm: run_vmtests.sh: drop detection and setup of HugeTLB
Date: Mon, 11 May 2026 19:28:39 +0300
Message-ID: <20260511162840.375890-56-rppt@kernel.org>
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

All the tests that use HugeTLB can detect and setup HugeTLB pages on
their own.

Drop detection and setup of HugeTLB from run_vmtests.sh.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/run_vmtests.sh | 125 ++--------------------
 1 file changed, 7 insertions(+), 118 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 45298157b155..73f14894790a 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -132,7 +132,7 @@ test_selected() {
 
 run_gup_matrix() {
     # -t: thp=on, -T: thp=off, -H: hugetlb=on
-    local hugetlb_mb=$(( needmem_KB / 1024 ))
+    local hugetlb_mb=256
 
     for huge in -t -T "-H -m $hugetlb_mb"; do
         # -u: gup-fast, -U: gup-basic, -a: pin-fast, -b: pin-basic, -L: pin-longterm
@@ -154,60 +154,6 @@ run_gup_matrix() {
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
@@ -277,29 +223,13 @@ run_test() {
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
@@ -326,44 +256,11 @@ CATEGORY="gup_test" run_test ./gup_longterm
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
-adjustment=$(( (31 < (nr_cpus - 1)) ? 31 : (nr_cpus - 1) ))
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
 
@@ -387,12 +284,10 @@ CATEGORY="mremap" run_test ./mremap_test
 CATEGORY="hugetlb" run_test ./thuge-gen
 CATEGORY="hugetlb" run_test ./charge_reserved_hugetlb.sh -cgroup-v2
 CATEGORY="hugetlb" run_test ./hugetlb_reparenting_test.sh -cgroup-v2
+
 if $RUN_DESTRUCTIVE; then
-nr_hugepages_tmp=$(cat /proc/sys/vm/nr_hugepages)
 enable_soft_offline=$(cat /proc/sys/vm/enable_soft_offline)
-echo 8 > /proc/sys/vm/nr_hugepages
 CATEGORY="hugetlb" run_test ./hugetlb-soft-offline
-echo "$nr_hugepages_tmp" > /proc/sys/vm/nr_hugepages
 echo "$enable_soft_offline" > /proc/sys/vm/enable_soft_offline
 CATEGORY="hugetlb" run_test ./hugetlb-read-hwpoison
 fi
@@ -448,7 +343,6 @@ CATEGORY="ksm_numa" run_test ./ksm_tests -N -m 0
 CATEGORY="ksm" run_test ./ksm_functional_tests
 
 # protection_keys tests
-nr_hugepgs=$(cat /proc/sys/vm/nr_hugepages)
 if [ -x ./protection_keys_32 ]
 then
 	CATEGORY="pkey" run_test ./protection_keys_32
@@ -458,7 +352,6 @@ if [ -x ./protection_keys_64 ]
 then
 	CATEGORY="pkey" run_test ./protection_keys_64
 fi
-echo "$nr_hugepgs" > /proc/sys/vm/nr_hugepages
 
 if [ -x ./soft-dirty ]
 then
@@ -539,10 +432,6 @@ if [ -n "${LOADED_MOD}" ]; then
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

