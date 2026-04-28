Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F404A35;
	Tue, 28 Apr 2026 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409287; cv=none; b=IS/ACt9cd/a8OECaJiGsLBxABE5FSD1BDJ9cULEp/2Mgg5AW7DHQyYsYcw6+OCB6mZt8By1w6p0tS2tQC0R50+klWCfDtGkVfwu08abAJ07TJkDU+W60hpoBQU6kHDPvPlawKB6G6923A8xX6G29WC6iTPRWSOHb5xUflFWFK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409287; c=relaxed/simple;
	bh=n2KgdfeDkv6qGICkBg3Vwdx+MRmhbjeNlFxUjnQTB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxcBi5kNBQ853E+SzCj8QwxY39EvPwrMoS2Vd5wk7q0220Yafp5KxOYDa8qm10x96Lr/6jaqSHTbpKLFc24lVWZFykYH/FR6wgZYK1CCuLFVSW1JRftJsvh41KANHJX/GLFr8sIK/gE6rW6z2vhIhHcqfOte6XJJKQA9Kzz4dBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyYmCfUT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyYmCfUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548C8C2BCB3;
	Tue, 28 Apr 2026 20:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409287;
	bh=n2KgdfeDkv6qGICkBg3Vwdx+MRmhbjeNlFxUjnQTB8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LyYmCfUTY2G4V530dknb3eO7NHTasmxoDpdVvrgwU78AtmHgRv4xF8f3uCPZ/jM14
	 cVswan0mmRYOHVU3VpVJosWpAoVZ1izld0PsVhUgCDUonA7gBWcjJ20emy2Z13ds0E
	 RV2In/aOajeta7CYPc5WrEP+zpmw7j5LaaUOj/IYtlvjB9X0AqYr3dcW51oWC5ytkp
	 KgYQ+54oL8dQ594Y/oteKma0ib+Dq/Derrz8iqbOchVmQYcn8JaMaxTA/K5YnhYnQW
	 9ifHzksHFVo17kV6W4wS8ub864jmzK0/kWbRu0aF7t2Y8XCHe07YkuCFetZvEIdVdP
	 PLPrPgHSd14Yg==
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
Subject: [PATCH v3 48/54] selftests/mm: uffd-stress: use hugetlb_save and alloc huge pages
Date: Tue, 28 Apr 2026 23:42:34 +0300
Message-ID: <20260428204240.1924129-49-rppt@kernel.org>
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

uffd-stress skips HugeTLB tests if there are no free huge pages prepared
by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-stress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 7e37cf3d27f6..9693d042f16f 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -479,9 +479,12 @@ int main(int argc, char **argv)
 	 * Ensure nr_parallel - 1 hugepages on top of that to account
 	 * for racy extra reservation of hugepages.
 	 */
-	if (gopts->test_type == TEST_HUGETLB &&
-	   hugetlb_free_default_pages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1)
-		ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
+	if (gopts->test_type == TEST_HUGETLB) {
+		unsigned long nr = 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1;
+
+		if (!hugetlb_setup_default(nr))
+			ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
+	}
 
 	gopts->nr_pages_per_cpu = bytes / gopts->page_size / gopts->nr_parallel;
 	if (!gopts->nr_pages_per_cpu) {
-- 
2.53.0

