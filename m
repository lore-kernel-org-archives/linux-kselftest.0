Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEAA286D7D;
	Mon, 11 May 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517283; cv=none; b=BJdNW9mNEzbO2qaTaF2EBBIRbmoVVeXkJk/4zxYdSs1C3sSTvSmmp4ssRF8+DmifkoDb689yCEgAfsEc0fIM17IdQtT4D7bpqyuPwDfFVNjQK9jErU8MNe1VmXTEK0HEHHMFb6hosXROHxgIZPWfxxmSTwI0vew0DhtQu+zO76w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517283; c=relaxed/simple;
	bh=n1Mt8JH9EyCnyBzZcz1MIZxUn1KdveQ6qfX1RYPTiWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uj6ymzJlOXCCINx8w8TVSxCaWt2LoZjwzbpPQxRljgkR1TfUaw1vlAdmy6kdGhw5zuwitIQQVXwGi8ShwUKzVU0tG1Pb7Ez0Hn3eSrDIbUXvrQYRRGhWKz8Y3jAc05mw3VPBHyfuLp+PmSW4fYhcpNN0r20Y6gehHq56cW7C1B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqQoS4p5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqQoS4p5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D12C2BCB0;
	Mon, 11 May 2026 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517283;
	bh=n1Mt8JH9EyCnyBzZcz1MIZxUn1KdveQ6qfX1RYPTiWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqQoS4p5tW9HVD4XPxHSg/gAlG2XaypPm2PrMmUzY6X55im8LnY3+lUCSgJ7ZDwo3
	 LoLnGxNlNEIg9hKTisEqTciVrRWrcBSpj4exLr/eZdjPyQiEopS8tJkjuxJjgiBqQI
	 9lfMHbLIWa4KPzPinpAJfDYwW1yHNzL0/GBL7YGetqegMADsOqENOdnFTw1Ur4CrnT
	 yPsKfjHX7coLiwl+pf+Y/Vqn64DBJuYpehRJtciNY3YedLC21olEdJ45VLrR39UYBg
	 kJmMn8LGeG2ENPW79PAlXuI5bjOxaHpF3mGcQANhnxkQptnPqIwNm4XEcKpqHAGdvO
	 K+htcfm7FMVZA==
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
Subject: [PATCH v4 54/55] selftests/mm: run_vmtests.sh: free memory if available memory is low
Date: Mon, 11 May 2026 19:28:38 +0300
Message-ID: <20260511162840.375890-55-rppt@kernel.org>
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

Currently when running THP and HugeTLB tests, if HAVE_HUGEPAGES is set
run_test() drops caches, compacts memory and runs the test. But if
HAVE_HUGEPAGES is not set it skips the tests entirely, even if THP tests
have nothing to do with HAVE_HUGEPAGES.

Replace the check if HAVE_HUGEPAGES is set with a check of how much memory
is available. If there is less than 256 MB of available memory, drop caches
and run compaction and then continue to run a test regardless of
HAVE_HUGEPAGES value.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/run_vmtests.sh | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index b9e520194634..45298157b155 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -234,19 +234,17 @@ pretty_name() {
 # Usage: run_test [test binary] [arbitrary test arguments...]
 run_test() {
 	if test_selected ${CATEGORY}; then
-		local skip=0
-
 		# On memory constrainted systems some tests can fail to allocate hugepages.
 		# perform some cleanup before the test for a higher success rate.
 		if [ ${CATEGORY} == "thp" -o ${CATEGORY} == "hugetlb" ]; then
-			if [ "${HAVE_HUGEPAGES}" = "1" ]; then
+			mem_kb=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
+			mem_Mb=$((mem_kb / 1024))
+
+			if (( $mem_Mb < 256 )); then
 				echo 3 > /proc/sys/vm/drop_caches
 				sleep 2
 				echo 1 > /proc/sys/vm/compact_memory
 				sleep 2
-			else
-				echo "hugepages not supported" | tap_prefix
-				skip=1
 			fi
 		fi
 
@@ -255,12 +253,8 @@ run_test() {
 		local sep=$(echo -n "$title" | tr "[:graph:][:space:]" -)
 		printf "%s\n%s\n%s\n" "$sep" "$title" "$sep" | tap_prefix
 
-		if [ "${skip}" != "1" ]; then
-			("$@" 2>&1) | tap_prefix
-			local ret=${PIPESTATUS[0]}
-		else
-			local ret=$ksft_skip
-		fi
+                ("$@" 2>&1) | tap_prefix
+                local ret=${PIPESTATUS[0]}
 		count_total=$(( count_total + 1 ))
 		if [ $ret -eq 0 ]; then
 			count_pass=$(( count_pass + 1 ))
-- 
2.53.0

