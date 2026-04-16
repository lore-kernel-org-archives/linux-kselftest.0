Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C039A07D;
	Thu, 16 Apr 2026 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367718; cv=none; b=ErXz7jYadDKzVWqoq8sRJOHfMNG5NKnRJBfpmFKDbes/c9xzyZPjqGQATPLlB+G4OIhoFenCRqV2Wk8q4vq3Ln3tGrG20KSQ5ingHQ7pIZLHBvYxPcdBcWNrkxh6xf5Oz+5Vf2T3a5LFsNgU310dzdq2bLQ7hYo2PH8XUhA3B9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367718; c=relaxed/simple;
	bh=jRTCo/i8SIFZppIeH1n3bjiXuMDolHMz2V4AQp2BQeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejfAU/7esgNiTNQnA6/+9BpKq/PFAZcdy7vc9H9U9/iaxXalbLx1OQW2oOaEvDch1Wlo/rfctPhBlWwxJkz3VbJu+yjk185XvFIO7ZhqZtw853oPmc2wa4ERJ0GNCDUDeE1MTa3oU2KuhvbEoh4LBN7wqSUyqDf16haWgQcL0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGulQKW5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGulQKW5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2C0C2BCAF;
	Thu, 16 Apr 2026 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776367717;
	bh=jRTCo/i8SIFZppIeH1n3bjiXuMDolHMz2V4AQp2BQeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QGulQKW5kZ+n5r4SXvoSKqk6bPVSNKDaxj3dbtekf1hfKUfo/YJUEGVDxg7EjT67y
	 KTfFyGQLzI+iAMCIKD9FfdblvLT7CLM54Qyr4JFpAXDoFxDIq5+180WtncPEpL+1gj
	 xalrBpjZ3tTFMz/EPYWxMzZr+0a14Ix6xp8ha4yZjG4ELDxT0+xpcQERLDF5iVtoh6
	 2jCFPmo7J0VV6N7yJRHl0hQEEQPI1p6eH7k7NGMc6kwUyWoXCVJ96A3WKyjMY+G0Ka
	 lVmWfgILj0SX77MffWtWZvcyg3RrLqlAAdHl3ETInAfPlid70ioRXNnJ45XzkxhuqU
	 7H7kaprGnW3Pw==
Date: Thu, 16 Apr 2026 22:28:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
Message-ID: <aeE4XSuXY8RfphVs@kernel.org>
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
 <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
 <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>

On Thu, Apr 16, 2026 at 08:10:53PM +0100, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 09:05:11PM +0200, David Hildenbrand (Arm) wrote:
> > On 4/16/26 20:40, Mark Brown wrote:
> 
> > > Several of the mm selftests made use of /proc/pid/mem as part of their
> > > operation but we do not specify this in the config fragment for them, at
> > > least mkdirty and ksm_functional_tests have this requirement.
> 
> > I guess we could teach most tests to SKIP if /proc/pid/mem is unusable.
> 
> That would be nicer, yes.  I imagine some of these will predate there
> being a configuration option here at all, it's possible there's newer
> tests that skip cleanly - I didn't look at the skips.

Enabling access to /proc/pid/mem keeps the coverage, not that it's great
right now, but still.

But sure graceful skips are better than failing the entire tests. Would be
something like this:

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 8d874c4754f3..374b5a25f36d 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -37,7 +37,6 @@ enum ksm_merge_mode {
 	KSM_MERGE_NONE, /* PRCTL already set */
 };
 
-static int mem_fd;
 static int pages_to_scan_fd;
 static int sleep_millisecs_fd;
 static int pagemap_fd;
@@ -622,10 +621,17 @@ static void test_prot_none(void)
 {
 	const unsigned int size = 2 * MiB;
 	char *map;
+	int mem_fd;
 	int i;
 
 	ksft_print_msg("[RUN] %s\n", __func__);
 
+	mem_fd = open("/proc/self/mem", O_RDWR);
+	if (mem_fd < 0) {
+		ksft_test_result_skip("opening /proc/self/mem failed\n");
+		return;
+	}
+
 	map = mmap_and_merge_range(0x11, size, PROT_NONE, KSM_MERGE_MADVISE);
 	if (map == MAP_FAILED)
 		goto unmap;
@@ -694,9 +700,6 @@ static void test_fork_ksm_merging_page_count(void)
 
 static void init_global_file_handles(void)
 {
-	mem_fd = open("/proc/self/mem", O_RDWR);
-	if (mem_fd < 0)
-		ksft_exit_fail_msg("opening /proc/self/mem failed\n");
 	if (ksm_stop() < 0)
 		ksft_exit_skip("accessing \"/sys/kernel/mm/ksm/run\") failed\n");
 	if (ksm_get_full_scans() < 0)
diff --git a/tools/testing/selftests/mm/mkdirty.c b/tools/testing/selftests/mm/mkdirty.c
index 68dd447a5454..e4a94638018b 100644
--- a/tools/testing/selftests/mm/mkdirty.c
+++ b/tools/testing/selftests/mm/mkdirty.c
@@ -27,7 +27,6 @@
 
 static size_t pagesize;
 static size_t thpsize;
-static int mem_fd;
 static int pagemap_fd;
 static sigjmp_buf env;
 
@@ -86,11 +85,18 @@ static char *mmap_thp_range(int prot, char **_mmap_mem, size_t *_mmap_size)
 static void test_ptrace_write(void)
 {
 	char data = 1;
+	int mem_fd;
 	char *mem;
 	int ret;
 
 	ksft_print_msg("[INFO] PTRACE write access\n");
 
+	mem_fd = open("/proc/self/mem", O_RDWR);
+	if (mem_fd < 0) {
+		ksft_test_result_skip("opening /proc/self/mem failed\n");
+		return;
+	}
+
 	mem = mmap(NULL, pagesize, PROT_READ, MAP_PRIVATE|MAP_ANON, -1, 0);
 	if (mem == MAP_FAILED) {
 		ksft_test_result_fail("mmap() failed\n");
@@ -124,10 +130,17 @@ static void test_ptrace_write_thp(void)
 	char *mem, *mmap_mem;
 	size_t mmap_size;
 	char data = 1;
+	int mem_fd;
 	int ret;
 
 	ksft_print_msg("[INFO] PTRACE write access to THP\n");
 
+	mem_fd = open("/proc/self/mem", O_RDWR);
+	if (mem_fd < 0) {
+		ksft_test_result_skip("opening /proc/self/mem failed\n");
+		return;
+	}
+
 	mem = mmap_thp_range(PROT_READ, &mmap_mem, &mmap_size);
 	if (mem == MAP_FAILED)
 		return;
@@ -343,9 +356,6 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(tests);
 
-	mem_fd = open("/proc/self/mem", O_RDWR);
-	if (mem_fd < 0)
-		ksft_exit_fail_msg("opening /proc/self/mem failed\n");
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	if (pagemap_fd < 0)
 		ksft_exit_fail_msg("opening /proc/self/pagemap failed\n");

> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> Thanks.



-- 
Sincerely yours,
Mike.
