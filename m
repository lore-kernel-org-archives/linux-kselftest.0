Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511952;
	b=urvjArM0SXo1gtuJ7ywGKXyh4V+khf5vrOcbplSxtqaUPkLw8gEexYeE//rYyrU+mBbE
	 8uOr0cBaj4XzhWMfPpXG+RwUOWfXG+H0DlF4toF/nACqI+qLkxGqxG0cQ56YY8tcwumEp
	 nvSJ8BKZSrHHVoHArQmN3HcLMS++kOoPBeYaoKHIvvPMwlV1pLuqv8eoFGhrnWinbg6hN
	 7xZFjsBu2r/qKvqbzjFkGY8Op/R+O1bhhsGEk56Sb3VtXPaHdetzpZUGkFwIeiSW/2yyE
	 kAg4NoflYYMPNvmT2JHsLhz8bxHysSstKN88/7IUYoWF7U+idCZIsVDsQIksm+B9p+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511952;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PY286/snnbEF5QyixUAEHWZvLTqyb1OkbulZ3V9rDhA=;
	b=kbkfbgR8kWzZS4uTeAvdVhdAKulF+Un3Pl1XEV4sy7dxY3x1jFx5KlWdQZS3guJp7+ZK
	 hO7plc7Rrh6YtiJamNSUxJ5JvQdh3CeT4mwnBLfn5zi87eZu9VxjVVTTo/W0TYcgmHZHl
	 9nlEhCdPFYttfTetSiarUcrMy2Fmr6fSGgj4NLTGeLrBK8bimXBGluyEBbNvwc7il+UC0
	 G4dEmhof5usuiYiJHeu6J17zArPSl4slEoeO5V0q9KGutTYrfASiQNB3mEcJAYxHrGOp8
	 8x4SjFwnNR94y2GvHgu9wUKbY8wNnhv7arzK1uRk/EjJ/+s7yksWrJ3pwplwxafEEig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=h72fjJkI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEFB606A31C;
	Thu, 12 Nov 2026 19:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=h72fjJkI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F421F000C4;
	Thu, 12 Nov 2026 19:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794511952;
	bh=PY286/snnbEF5QyixUAEHWZvLTqyb1OkbulZ3V9rDhA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=h72fjJkIt+Va71O69daZ2arnUrd8jTdiBVApIAer0TGjgBuC0c3GWO2JIn7yxg1E/
	 soIzM0uy+i9p10EcjDxQk0LUSWGF+I6AmwdRErIL/d631Pe3mbD39m2difcanToBX3
	 d7apj2AGagrXKdki612FGoiOc60Vs8V3QXoY9gAM=
Date: Thu, 12 Nov 2026 11:32:31 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Xionggui Chen <evers_chen@163.com>
Cc: David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenxionggui@lanxincomputing.com
Subject: Re: [PATCH] selftests/mm: Handle implicit read permissions in
 madv_populate
Message-Id: <20261112113231.ce39807d300f102e6763a87b@linux-foundation.org>
In-Reply-To: <20261112031811.56500-1-evers_chen@163.com>
References: <20261112031811.56500-1-evers_chen@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Nov 2026 03:18:11 +0000 Xionggui Chen <evers_chen@163.com> wrote:

> The madv_populate selftest assumes that a mapping created with
> PROT_WRITE cannot be read, and expects MADV_POPULATE_READ to fail
> with EINVAL.
> 
> However, some architectures, including RISC-V, may implicitly grant
> read permission to PROT_WRITE mappings. On such architectures,
> MADV_POPULATE_READ succeeds, causing the test to fail incorrectly.
> 
> Check the actual VMA permissions through /proc/self/maps and adjust
> the expected result accordingly.
> 
> Add a PROT_NONE test to verify that MADV_POPULATE_READ still fails
> with EINVAL for mappings without read permission.
> 
> On RISC-V with Linux 7.2.0, the original test fails 1 out of 16
> tests, while the updated test passes all 17 tests.

Code looks good, thanks.

The changelog is a little imprecise.  

"some architectures" is too broad - this is purely riscv.

The wording suggests that a readable hardware PTE alone determines the
result.  riscv can have readable writable PTEs without setting VM_READ,
and this test still expects EINVAL on those systems.  


I altered the second paragraph, please review.


From: Xionggui Chen <chenxionggui@lanxincomputing.com>
Subject: selftests/mm: handle implicit read permissions in madv_populate
Date: Thu, 12 Nov 2026 03:18:11 +0000

The madv_populate selftest assumes that mmap(PROT_WRITE) creates a VMA
without VM_READ and expects MADV_POPULATE_READ to fail with EINVAL.

On RISC-V, commit 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to
VM_READ | VM_WRITE") makes the kernel set VM_READ for mappings requested
with PROT_WRITE.  MADV_POPULATE_READ checks this VMA permission, so it
succeeds and the test fails incorrectly.  Whether the hardware can read a
writable PTE does not, by itself, determine the madvise() result.

Check the VMA permissions through /proc/self/maps and adjust the expected
result accordingly.

Add a PROT_NONE test to verify that MADV_POPULATE_READ still fails with
EINVAL for mappings without read permission.

On RISC-V with Linux 7.2.0, the original test fails 1 out of 16 tests,
while the updated test passes all 17 tests.

Link: https://lore.kernel.org/20261112031811.56500-1-evers_chen@163.com
Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
---

 tools/testing/selftests/mm/madv_populate.c |   67 +++++++++++++++++--
 1 file changed, 63 insertions(+), 4 deletions(-)

--- a/tools/testing/selftests/mm/madv_populate.c~selftests-mm-handle-implicit-read-permissions-in-madv_populate
+++ a/tools/testing/selftests/mm/madv_populate.c
@@ -69,10 +69,38 @@ static void test_prot_read(void)
 	munmap(addr, SIZE);
 }
 
+static int mapping_is_readable(void *addr)
+{
+	FILE *maps;
+	char line[256];
+	unsigned long start, end;
+	char perms[5];
+	int readable = -1;
+
+	maps = fopen("/proc/self/maps", "r");
+	if (!maps)
+		return -1;
+
+	while (fgets(line, sizeof(line), maps)) {
+		if (sscanf(line, "%lx-%lx %4s",
+			   &start, &end, perms) != 3)
+			continue;
+
+		if (start <= (unsigned long)addr &&
+		    (unsigned long)addr < end) {
+			readable = perms[0] == 'r';
+			break;
+		}
+	}
+
+	fclose(maps);
+	return readable;
+}
+
 static void test_prot_write(void)
 {
 	char *addr;
-	int ret;
+	int ret, readable;
 
 	ksft_print_msg("[RUN] %s\n", __func__);
 
@@ -80,9 +108,19 @@ static void test_prot_write(void)
 	if (addr == MAP_FAILED)
 		ksft_exit_fail_msg("mmap failed\n");
 
+	readable = mapping_is_readable(addr);
+	if (readable < 0)
+		ksft_exit_fail_msg("Cannot determine VMA permissions\n");
+
+	errno = 0;
 	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
-	ksft_test_result(ret == -1 && errno == EINVAL,
-			 "MADV_POPULATE_READ with PROT_WRITE\n");
+
+	if (readable)
+		ksft_test_result(ret == 0,
+				 "MADV_POPULATE_READ with readable PROT_WRITE mapping\n");
+	else
+		ksft_test_result(ret == -1 && errno == EINVAL,
+				 "MADV_POPULATE_READ with write-only mapping\n");
 
 	ret = madvise(addr, SIZE, MADV_POPULATE_WRITE);
 	ksft_test_result(!ret, "MADV_POPULATE_WRITE with PROT_WRITE\n");
@@ -90,6 +128,26 @@ static void test_prot_write(void)
 	munmap(addr, SIZE);
 }
 
+static void test_prot_none(void)
+{
+	char *addr;
+	int ret;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	addr = mmap(0, SIZE, PROT_NONE,
+		    MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap failed\n");
+
+	errno = 0;
+	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
+	ksft_test_result(ret == -1 && errno == EINVAL,
+			 "MADV_POPULATE_READ with PROT_NONE\n");
+
+	munmap(addr, SIZE);
+}
+
 static void test_holes(void)
 {
 	char *addr;
@@ -266,7 +324,7 @@ static void test_softdirty(void)
 
 int main(int argc, char **argv)
 {
-	int nr_tests = 16;
+	int nr_tests = 17;
 	int err;
 
 	pagesize = getpagesize();
@@ -280,6 +338,7 @@ int main(int argc, char **argv)
 	sense_support();
 	test_prot_read();
 	test_prot_write();
+	test_prot_none();
 	test_holes();
 	test_populate_read();
 	test_populate_write();
_

