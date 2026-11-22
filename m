Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335629;
	b=qXZP2LOk96Y64EzfvO+u0zlzhqvcwL/IQbpDxJBQIDigKBGyCYzNf4vHMioD0TZXHdET
	 c4ecgN9KKz+QmOu0Gu0j55dsX5aTEYQYuCm1eIn73K0fiOnnU01vkmASKcXLoWbFerW4Z
	 buKQqmVJQhEnMLDKiHCwS4r8YkL0QwhdKVPBYyE7zfx1tjOdJTDxURc5qYzrheCt9DvcJ
	 HouSTmG6/04riSgBwMB9t2locUpOAYXUQyItYyUL+XhheAiU15GpqwP4ACvZwgLWFXePd
	 d5s1lKvqV6kOlVWpdf4oG0y6basjnPYV3R32rZnlO2oiZE88esD4idVDW4KZYsD0T9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8Rf2VcTDmTGn3qRzDj6gU5ruc9gUgxiYv5dADr6Q67g=;
	b=4c4l8nvB9LS4UgIghmrINsA1l2I5JcRs8tYOkmprLT9OC59nk2DEhsneyZZD/eYpNBLX
	 M6Mq4G8pBsnSpmak3y4AKAs1g7mQnjG4diiwZRF40oM7D2zfx4/c995TB8nD/fryMmIUr
	 fDqsX/vhCcsJXn9htwCV91NwI+PFFy/hkIAW7b2rgPHenHkvLuLoS5tYnk2Ss0SyVBiOt
	 5GjYcJwOFV6vif5hCggPi1UbSJDEYDRLsjpTqppBMt7/jZPkhwZOp7yJFwkd5dpbG67Kj
	 mSm31X6dIIbdi5fOkyLNuhwko1EN8Xwl3sOKaLQizh2eDHGpkVp26+Dg3fSOl+myEaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pta+Vpza;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94E606A334
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 08:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C94E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pta+Vpza
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3270911eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 00:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795335628; x=1795940428; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Rf2VcTDmTGn3qRzDj6gU5ruc9gUgxiYv5dADr6Q67g=;
        b=Pta+VpzalHvscN9FNpEMJ7SQJPTNW2HKZIQ7Oq8+JPHTB2n54/14qMUfz3/SBpcEEv
         abAtMsKOzmP0BjViMInWhRoKADhN4iKxCdu14bYvL7zIkMAzU33mI2HAQejsMzBgRd6/
         z3i3v/yJhuV00RPjVx3x4AtEOeeW9wW38YUsyHjnvmnHaaOggO5sQtalBW8ZLphXTzIo
         R1zEOmox9bGllcTXH462ooA+mrViUbO+OF0sVxNEEYGh/vIXO+Vhh+55aTNJj4p+cG6y
         GML4o5RaHEr3ordQDyvtvw9m9j+mN5Qwy4UIzuGBzGO2RWLYhebFcH2k62nuqdVtrbRJ
         HNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335628; x=1795940428;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rf2VcTDmTGn3qRzDj6gU5ruc9gUgxiYv5dADr6Q67g=;
        b=vkxLd0j0Jim/p3imGX/O8oDsVyk4YnZ/xYJrpxC/1N0TQXK5mH+PQXyfbYxeEXfxYm
         pYhKbJbz7UisYsatoekuzoAlZo2TqfdXYBBwG2vRe6Z6Y0ojhihSj17Y0l4fH8lZXM42
         kqd2k0IrrwvhqMHdXtI+Fmywj3QXwIKQG9m4xLQOW1E60CMllEjlZiV4PbRLJ5DVXjFt
         KwrxiA4MgKWYssqWbC42UtRc/9C5iYo/C3JaiEe37woqqiwulrItDEq2uOP7LJH9Vpgw
         cK7o1Xgso4ITo6cfEPGZy1IMX3mz8giR+1GrgD41O1k/BsMLBqcgmrf0vZKEVxmuzVHG
         7ilA==
X-Forwarded-Encrypted: i=1; AL+hErG2ghaykzxnU/swRkUsiEYd8fZdKlM0zgkxlrjmAAJjlbqQSa2bdW3iuiLV3fB5jzjONJMJESADUPmvHTIW/+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gNT0wXXUcygCtQ6H4CP64tW21l/SqE56rRUOws4NhyAhhabzE
	CXQfrl2WFZFo74i8K2T+U8aYR8Oz2uxZMx5GLSTx6htNIxgvQajgBww4I0XIBtx1+Ahy7hg2nJu
	dDKbL65zB9nCLlNhsOE0u5hjunw==
X-Received: from dybfe25.prod.google.com ([2002:a05:7300:bf99:b0:379:1aaf:7a27])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:860a:10b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-3857073f3c4mr8592473eec.30.1795335628168;
 Sun, 22 Nov 2026 00:20:28 -0800 (PST)
Date: Sun, 22 Nov 2026 08:20:18 +0000
In-Reply-To: <20261122082020.1255434-1-kaleshsingh@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122082020.1255434-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122082020.1255434-3-kaleshsingh@google.com>
Subject: [PATCH 2/2] selftests/mm: uffd-unit-tests: filter required features
 per memory type
From: kaleshsingh@google.com
To: akpm@linux-foundation.org
Cc: kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kalesh Singh <kaleshsingh@google.com>

CONFIG_PTE_MARKER_UFFD_WP defaults to y but can be turned off, and
userfaultfd write protection then works only on anonymous memory. The
kernel still reports UFFD_FEATURE_PAGEFAULT_FLAG_WP but no longer
UFFD_FEATURE_WP_HUGETLBFS_SHMEM.

uffd-unit-tests checks a test's whole feature mask for every memory
type, so the tests that run on all memory types and require
UFFD_FEATURE_WP_HUGETLBFS_SHMEM (register-ioctls, the wp-fork tests,
rwp-wp-exclusive, sigbus-wp and events-wp) skip their anonymous runs
too. Check and request only the features that apply to the memory type
under test, and make minor-wp require UFFD_FEATURE_WP_HUGETLBFS_SHMEM,
as it write-protects shmem and hugetlbfs.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 42 +++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 2a97ba1d6feb..d0dda2ec48fb 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -176,15 +176,44 @@ static void test_uffd_api(bool use_dev)
 }
 
 
-static bool uffd_feature_supported(uffd_test_case_t *test)
+/*
+ * Filter test->uffd_feature_required down to the features needed for @mem_type.
+ * For example, UFFD_FEATURE_WP_HUGETLBFS_SHMEM (gated on
+ * CONFIG_PTE_MARKER_UFFD_WP) only applies to shmem and hugetlbfs, so anonymous
+ * subtests should still run when it is absent.
+ */
+static uint64_t uffd_test_features(const uffd_test_case_t *test,
+				   const mem_type_t *mem_type)
+{
+	const uint64_t shmem = UFFD_FEATURE_MISSING_SHMEM |
+			       UFFD_FEATURE_MINOR_SHMEM;
+	const uint64_t hugetlb = UFFD_FEATURE_MISSING_HUGETLBFS |
+				 UFFD_FEATURE_MINOR_HUGETLBFS;
+	uint64_t features = test->uffd_feature_required;
+
+	switch (mem_type->mem_flag) {
+	case MEM_ANON:
+		return features & ~(shmem | hugetlb |
+				    UFFD_FEATURE_WP_HUGETLBFS_SHMEM);
+	case MEM_SHMEM:
+	case MEM_SHMEM_PRIVATE:
+		return features & ~hugetlb;
+	case MEM_HUGETLB:
+	case MEM_HUGETLB_PRIVATE:
+		return features & ~shmem;
+	default:
+		return features;
+	}
+}
+
+static bool uffd_feature_supported(uint64_t required)
 {
 	uint64_t features;
 
 	if (uffd_get_features(&features))
 		return false;
 
-	return (features & test->uffd_feature_required) ==
-	    test->uffd_feature_required;
+	return (features & required) == required;
 }
 
 static int pagemap_open(void)
@@ -2417,6 +2446,7 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required =
 		UFFD_FEATURE_MINOR_HUGETLBFS | UFFD_FEATURE_MINOR_SHMEM |
 		UFFD_FEATURE_PAGEFAULT_FLAG_WP |
+		UFFD_FEATURE_WP_HUGETLBFS_SHMEM |
 		/*
 		 * HACK: here we leveraged WP_UNPOPULATED to detect whether
 		 * minor mode supports wr-protect.  There's no feature flag
@@ -2636,6 +2666,7 @@ int main(int argc, char *argv[])
 	mem_type_t *mem_type;
 	uffd_test_args_t args;
 	const char *errmsg;
+	uint64_t features;
 	int i, j, opt;
 
 	while ((opt = getopt(argc, argv, "f:hl")) != -1) {
@@ -2711,11 +2742,12 @@ int main(int argc, char *argv[])
 			/* Initialize test arguments */
 			args.mem_type = mem_type;
 
-			if (!uffd_feature_supported(test)) {
+			features = uffd_test_features(test, mem_type);
+			if (!uffd_feature_supported(features)) {
 				uffd_test_skip("feature missing");
 				continue;
 			}
-			if (uffd_test_ctx_init(&gopts, test->uffd_feature_required, &errmsg)) {
+			if (uffd_test_ctx_init(&gopts, features, &errmsg)) {
 				uffd_test_skip(errmsg);
 				continue;
 			}
-- 
2.56.1.750.gf70dc682cf-goog

