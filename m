Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819393;
	b=CWHZvzYQxtrz//zrKPeZVJr6Tga64zi3qmzt/R3FHt/44h1Xhk5TrH4e3XqkAmpcd9x9
	 3+n5xjZcnCcR8Pk6rgH54ffkqBQR6ikScaOtT820X9jaJ5/jZWWr1WAJ5xN2kj6oaw1Cd
	 C+mXfKO3jOvC5WPuRdGqllEqk0mP3MX264ktvU0kScGZAVagw7BhVKmI3U+UCv/B1PS5E
	 u1FRCbBAn3zq5ABq0NlzCZ69m9lxiMz+Mvw14rO3grYWloic7wISJ3c+vD6fq5DYX1zhH
	 WQG97fi8f8SYovB3iB8icXjQjgIn8H+1plwYeqFpnpKhmlY306hwR4w/fJUemToVIrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819393;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TCOAmNe0BEFi8mKC+0PAv0vRnH09iyDNA3a8Nshj+co=;
	b=oiudT924Ty0Sy+9O927UOVDdqC4YkRwEE1STrQJUpC42XGqkk8XZ2jAiOhFxSJ22JNbd
	 66ay84LQUwnh2Q2A4OA3jxE5ksqd4AotH+CwvcHJhpW8jonmDmZ/Z2oBhxqANRMVfk/hQ
	 5ej1DPYO2oGugz/GVaT+hRiziaOHR9Ta2OC61V+6+75BQZE3Xk2sa6crDeSi/D5ngomyT
	 AthTe/O+zsLExy6wqZIWRwtfWDJvfvx+ddQGzkuH3gqmtNEmK9MzdQOMqapaUz2C5nlf+
	 QctMR/z7YURODaRS6MqHyxuE1gCuHklNY8Nn71otqkQ2rNYroSU24NHQrE/DvRn614A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YKadq6xx;
	arc=none smtp.remote-ip=91.218.175.243
Received: from mta0.migadu.com (out-243.mta0.migadu.com [91.218.175.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E5606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456E5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YKadq6xx
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7lolab2zVmmIzQhOdTNrMQkrZuGsVRndTA3iq4cS6mY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794819390; v=1; x=1795424190;
 b=YKadq6xxRABnupfUM1Y3hNWq3Al7M1iv5OqCAbAfNTk17YILf3ZqtW36B6X1MXCCt1kkg91T
 6eHvksBn9PAi9rKa8wc5E1tikQsyX9npBRPn46zM/d8prnXNJ6tKrMyplef8SF2GgP+mcVSv6Oi
 g6mYlUnstFLAeQrKREmEXLfI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 17b6a22d7d497bc4;
	Mon, 16 Nov 2026 08:56:30 +0000
X-Mizu-Trace-ID: 17b6a22d7d497bc4
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
Date: Mon, 16 Nov 2026 16:56:11 +0800
Subject: [PATCH] selftests/mm: protection_keys: use _exit() in aarch64
 ptrace tracee
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-for-pkey-exit-v1-1-ca4c76b32ff7@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avIrBtQF0JdJVqkjjUFFVpRRHfPa
 vkW/1+QKDIlqMQFkXZOPE8ZqhDg+nbqCNlng5baKCVLDHPEZaQT6eAVZShN8EY7Yz3kZokU+Ph
 +dfM7bXYgt74TuO8HcVaD73EAAAA=
X-Change-ID: 20261109-for-pkey-exit-0f96fd62c6bd
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: hongfu.li@linux.dev, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongfu Li <lihongfu@kylinos.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794819387; l=2106;
 i=lihongfu@kylinos.cn; s=20260915; h=from:subject:message-id;
 bh=I343t2uR4wEtG+HLyp6H7kkFFFvE00XGS9N9j96x0BE=;
 b=WBYHvXmoxaPSzAUK9OsLYlPhQpq9V9t4iR/GbU7w7PSrNgs3/neeELXubmCtAzFBv88Jh67QB
 PJu87aQrbGhB3pKMntsmZzL9gPjVeV+SRoEasVfYnMQ81Pr6WhKMFkM
X-Developer-Key: i=lihongfu@kylinos.cn; a=ed25519;
 pk=rUpDSpB3neoNZRlGG6dHlFb3RepiJakcev+ucyqaZzw=

From: Hongfu Li <lihongfu@kylinos.cn>

Commit 25356081894d ("selftests/mm: protection_keys: use library code
for HugeTLB setup") replaced the exit() calls in the x86 version of
test_ptrace_modifies_pkru() with _exit(), but missed the aarch64
version, which still calls exit() from the tracee.

When the test runs as root, hugepage_save_settings() registers
hugepage_restore_settings_atexit() with atexit(). The tracee inherits
the atexit list across fork(), so its exit() runs
hugepage_restore_settings_atexit() in the child. That handler calls
hugetlb_restore_settings(), which writes nr_hugepages back to the saved
original value while the test is still running. If the saved original
value is 0 (or otherwise leaves fewer than the two free huge pages
needed by the next allocation), subsequent iterations fail in
malloc_pkey_hugetlb() when mmap(MAP_HUGETLB) returns MAP_FAILED.

Use _exit() in the aarch64 tracee as well, matching x86.

This was found by code inspection with AI assistance. No POE-capable
arm64 hardware was available, so test_ptrace_modifies_pkru() was not
runtime-tested; the change has only been compile-tested with an arm64
cross-compiler.

Fixes: 25356081894d ("selftests/mm: protection_keys: use library code for HugeTLB setup")
Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/protection_keys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 5dece144ab95..a0f51be3fcbc 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -1530,11 +1530,11 @@ static void test_ptrace_modifies_pkru(int *ptr, u16 pkey)
 		 * checking
 		 */
 		if (__read_pkey_reg() != new_pkey)
-			exit(1);
+			_exit(1);
 
 		raise(SIGSTOP);
 
-		exit(0);
+		_exit(0);
 	}
 
 	pkey_assert(child == waitpid(child, &status, 0));

---
base-commit: 2c5dafa7f289d760f4492260b0988029aab478b0
change-id: 20261109-for-pkey-exit-0f96fd62c6bd

Best regards,
--  
Hongfu Li <lihongfu@kylinos.cn>

