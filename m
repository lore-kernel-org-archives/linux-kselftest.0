Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73943806D6;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128266; cv=none; b=pWoEw3ATN3UN5fY0UrvWExC36tEvatu8CujQxrBUY8ZCxvVmR1BNT+VVd4TdMs1c/xyhXyCpSufXfRFyho+pasKqv1W7yUm4w/6zgSbYLpwaoaUIGy9Ot15V35/CjYYOux1ZlZGSNqoy8env3/j8W4fJIkTVyHVPpmmEhXzZmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128266; c=relaxed/simple;
	bh=BUdOCaQuOCSBBDHR2jUyq+U+9zPMuOuv59bLWu+eXK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYV8yhOQyGTgU31jfQ+L/9yrLXIRx3whvrrFgSGkY7MhMV5r7rtiHzpWGUZiBZFD8lOD855a4kXCYIJzii5i/UhSTKCAYJ0aQf9K0fhkNexZWhvk6SPn3tZEQ9jTyehNdsjEPTeB439rNlHEJOC/HjzuysdTiGoI0PRIl18WlmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M58eeV4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M58eeV4u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A373EC2BCF5;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779128265;
	bh=BUdOCaQuOCSBBDHR2jUyq+U+9zPMuOuv59bLWu+eXK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M58eeV4uIMxcWwQE2urHUh/QNnc1jCQBqSjK9PPpmrrgybimA9xYcjou1TUZCjuvI
	 AvcAUrVa6eGU5NMe5rREDkifS95Rlxmdkt1niQq2t+QLUY6VQQ+8cJMIAF5FXxDt74
	 eINX0SB8yeSkm5KrzwlirNCZ6TAa4HV+Y2Ph+rU6HTr1P5ZdFR5fnhgAcRBzNHY/dx
	 boDlFqxn1DBobvQFL6JfB83LimuOi3PZyAwKCBc/S+FgtiQ1Bk9ed6l4UlqTTTfEHR
	 ChVB3Qk+S2zHVfZos0SXxXl3cQEzroxHU7LEXqU4eFfVM1Wtg3kmcyEuhimu9ialjT
	 G4KPykVIF8sSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DE4CD4F50;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Date: Mon, 18 May 2026 11:17:34 -0700
Subject: [PATCH RFC 2/5] mm: selftests: Inline {read,write}_bytes functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-port-hugetlb-selftests-v1-2-d64ba3a785fe@google.com>
References: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
In-Reply-To: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 muchun.song@linux.dev, osalvador@suse.de
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779128265; l=1888;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=3vqV15tnc/KP7l17CqT82I3LVdfcrBoQAIsUGRd62xc=;
 b=8wRWXv6/rOnk4l6CutfsJgow0n6eIr/AsAi5gOQiNeOSPDM5g7SuG9MmaRX7tv6dn3aqhQhb+
 PQUacAigGvODbw69xP477YxGOx0ttnT+euh7SJS2UaNIeMbKaErkZ1g
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com

From: Ackerley Tng <ackerleytng@google.com>

When the kselftest_harness is used in a later patch, making assertions like
ASSERT_EQ() relies on _metadata's existence at the macro site, hence using
helper functions makes it more complicated.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/mm/hugepage-mmap.c | 38 +++++++++++-------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugepage-mmap.c
index 8c246070572f9..64f7d28a97fdf 100644
--- a/tools/testing/selftests/mm/hugepage-mmap.c
+++ b/tools/testing/selftests/mm/hugepage-mmap.c
@@ -20,31 +20,11 @@
 #define LENGTH (256UL*1024*1024)
 #define PROTECTION (PROT_READ | PROT_WRITE)
 
-static void write_bytes(char *addr)
-{
-	unsigned long i;
-
-	for (i = 0; i < LENGTH; i++)
-		*(addr + i) = (char)i;
-}
-
-static int read_bytes(char *addr)
-{
-	unsigned long i;
-
-	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
-	for (i = 0; i < LENGTH; i++)
-		if (*(addr + i) != (char)i) {
-			ksft_print_msg("Error: Mismatch at %lu\n", i);
-			return 1;
-		}
-	return 0;
-}
-
 int main(void)
 {
 	void *addr;
-	int fd, ret;
+	int fd, ret = 0;
+	unsigned long i;
 
 	ksft_print_header();
 	ksft_set_plan(1);
@@ -61,8 +41,18 @@ int main(void)
 
 	ksft_print_msg("Returned address is %p\n", addr);
 	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
-	write_bytes(addr);
-	ret = read_bytes(addr);
+
+	for (i = 0; i < LENGTH; i++)
+		*(char *)(addr + i) = (char)i;
+
+	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
+	for (i = 0; i < LENGTH; i++) {
+		if (*(char *)(addr + i) != (char)i) {
+			ksft_print_msg("Error: Mismatch at %lu\n", i);
+			ret = 1;
+			break;
+		}
+	}
 
 	munmap(addr, LENGTH);
 	close(fd);

-- 
2.54.0.563.g4f69b47b94-goog


