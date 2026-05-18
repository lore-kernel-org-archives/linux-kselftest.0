Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741D3815FD;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128266; cv=none; b=fFaE4Ibf9w0u26tKr1rkMnGQiNKbNso2am4nxCe7W4hIj16Ua9TzUmoJxnXx78s1Tx19UBenoA50xVicdJgR9LXrKc3GT68K/RS8MWjZWPMdu5xQ329/jbI3d2pGlJZfSkbhoSbB8DOoMhjZXs28orV/ogTHAZ+FRe8v+suveE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128266; c=relaxed/simple;
	bh=uPaUXRhcKqK9gTwZzqyg3dsJT+ESOmLgskDTFq08dN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXTHle8GKfPAX/ODXeETLoPzlr4lYJNESidrSUiUMx1/jTrKN3PgsvyRKsg5+L1M86BJi+AvbQ9yOkqJG7u4WsQsgxt0b12y8D+F23Onme1wMudT0o3O8cvL074srmh5GnXbbD/qBpGHZ8COjSdlSvAJnSsanbRRdm7b+jYkmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqCNxRdq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqCNxRdq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 968D9C2BCC6;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779128265;
	bh=uPaUXRhcKqK9gTwZzqyg3dsJT+ESOmLgskDTFq08dN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iqCNxRdqLxB4wvgj9cMjt8jNzLW7SuPq6eCfmjflUK1BOhqh2ryUyskaTt7nXGE5z
	 qkhBIAxHYOp00DQQ0Iu8eScWkeEMgUgYLjbFaBIGVCrBOOuwEMMGS2vh5Pko7Z7BRa
	 F7Ytfby7tDmjA3g3Ibq9tiQ3yvIGBH14hN85AR8kgTT/i4rrlXchzBnJU6p+iAHc2y
	 fkV19X+sYc3Hh4564uiTJ/CVCx2LL5WAVW4lCpMdOZF7nq+cbRZZzEOMS07dV23ny8
	 lGbgKMuvy9GIc9yNQFSOsrBmDWRy8lT0nPUP765Ac12Zg39eJk1Wl0f6aaMdi6C14p
	 SSMH2vwK0qclQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87296CD4F4A;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Date: Mon, 18 May 2026 11:17:33 -0700
Subject: [PATCH RFC 1/5] mm: selftests: Inline check_bytes() function into
 caller
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-port-hugetlb-selftests-v1-1-d64ba3a785fe@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779128265; l=1508;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=ojhFIsSt5J/Ln9Qe8lS4lDGB7t2xMx2nI91/0IgGnFg=;
 b=aCFGbDzyqxAT6wHgkBwWRA+y1A982R53xn0sOG+7hlA8GCoWXFQxD8QyELbiTEhSynpWciYyf
 8NJ5sYUzWfbAuyRupSfrHOzNUScKBzd0pxj9IFOKrSOl1MraP43NkT/
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com

From: Ackerley Tng <ackerleytng@google.com>

Inline the check_bytes() function to prepare for using the kselftest
harness, where TH_LOG() relies on the variable _metadata being present in
the caller.

Instead of passing _metadata to a helper function like check_bytes(), call
TH_LOG() directly.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/mm/hugepage-mmap.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugepage-mmap.c
index d543419de0407..8c246070572f9 100644
--- a/tools/testing/selftests/mm/hugepage-mmap.c
+++ b/tools/testing/selftests/mm/hugepage-mmap.c
@@ -20,11 +20,6 @@
 #define LENGTH (256UL*1024*1024)
 #define PROTECTION (PROT_READ | PROT_WRITE)
 
-static void check_bytes(char *addr)
-{
-	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
-}
-
 static void write_bytes(char *addr)
 {
 	unsigned long i;
@@ -37,7 +32,7 @@ static int read_bytes(char *addr)
 {
 	unsigned long i;
 
-	check_bytes(addr);
+	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
 	for (i = 0; i < LENGTH; i++)
 		if (*(addr + i) != (char)i) {
 			ksft_print_msg("Error: Mismatch at %lu\n", i);
@@ -65,7 +60,7 @@ int main(void)
 	}
 
 	ksft_print_msg("Returned address is %p\n", addr);
-	check_bytes(addr);
+	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
 	write_bytes(addr);
 	ret = read_bytes(addr);
 

-- 
2.54.0.563.g4f69b47b94-goog


