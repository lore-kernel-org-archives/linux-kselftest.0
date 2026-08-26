Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C73F327C
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735949; cv=none; b=oxqxg1dzOxB4nVeN2iHDmR1hcRDSI9SAIkll7V4EVv20/XVK14xmDk21diJnac4uZ0QJYXLD0JPTi/T6RzEb+03F34ZuZHxI8FopI+3Sy4HU99DtO6LYMaG9pkQtL7bwAUzjwL90Z11CK2WeIlbW1x7yg1lIp09iRxCvfY8bKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735949; c=relaxed/simple;
	bh=7w+gDb7QtZnkDWq+h4HUO3ST/UY633rHaNS6m39pYVY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AprbQJK1Kimlbk0vvp8EUE9TfhnlrQmbny+dn+pUeFGjRLBiKAXW6+6rHUTvcDEG6pXhWCyM9pAy0/4SxbzerQ77hcz9f51Vx87KBtOeHd0TGA9ah/2hRKnPX7dPNp9pWU6LtI8w13Bj1LXraWRQe1L0fMePRNWaied6sGPOTS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HI67MDFJ; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HI67MDFJ"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so13420255ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735942; x=1788340742; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89L7E0e7HlFcsWgm0DMydejmixwj8/yVJ5vfC8XlboE=;
        b=HI67MDFJqzLL4F6hahAQXqHB3Sfp3AyN1KlgnDqwQKk1FzC1C4d9J3t/iXw43SpzRy
         0OX0hSJVh7OXV6mxwGHLMSzH5LZT/wUxnkn7wbBK6X28/wGkdWBBWfstIQW/kT4dM+4E
         M+1TDg4YSM/3LNhOx/XnnQx2snZTGpX9kQk4ZuqiRDMLO3uAjBDWeGdIvv3jRfayStom
         gImHyr9WHc6V78nlQHT2lehv62po81BQ9TJFUii4LDzoicgp6zwT59Eut2/N9lTCkLZv
         PQbCmjJYPb9b955votmeEYOMZ0TYdQjx3BCi15jM3tI0uZHn9tBkLuFCdN7f9Jf2Hpya
         p85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735942; x=1788340742;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89L7E0e7HlFcsWgm0DMydejmixwj8/yVJ5vfC8XlboE=;
        b=mZ5KjBbS+Hq6MObERdtS13JwF5qoD95zejMzwFUviwSOTl1vr1IQaaGEuhACCPcF6Q
         sqnc4x7LsjMAm4JbQAJJB2UQ6KxIzDG3izg32AGUTJwTScgJVezNgDmNB61LKzQ1AJh5
         JhliZ3rJ01VF/ghjsreZtVDx6QI28ZlojFR7X7GO53c7KV67KP8FC3srD6whQjHHhk5r
         odkYDNLrQur4B424VhA4EzgU7A8UoaCVwrxeFRe3ugb4OGjU1wIfukf13wh6JckV0Zzc
         jfgTmlWKy3d0l9ObpP6M+x0VSJrPTZn9Sifn/irlp4HuUvVXB6dGY8K0jP79poYrvT/T
         vxuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzL+ksDxXgJnDQlQze/OMZ0cSto19PJXplCu5gtlKBZVHTO6O5Wh2m2AapcgZ+exAh1ktJsYlfw1jjORP4QLo=@vger.kernel.org
X-Gm-Message-State: AFuF++n3NggKIQQR8pqACMJN2MinXs2h0m0Ns62BjNYO0qAFwKDfth3a
	lNi7BP3h+czGaG2id1/Yw25AWLKBVsTHjBVBwh6lcrPf9gvbKZIZXMPuoW6wKBhEnO0VpNixaEu
	0fiDx/2S+4yl3/vsrrx5s4ZR7dg==
X-Received: from plwg14.prod.google.com ([2002:a17:902:f74e:b0:2d5:9dd2:5fc6])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2283:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2d70779678cmr89516245ad.0.1787735942070;
 Wed, 26 Aug 2026 02:19:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:30 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=4642;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=7w+gDb7QtZnkDWq+h4HUO3ST/UY633rHaNS6m39pYVY=; b=r4t4S/JNI5hvSCE0TK199jmMLi6mPSfRkQixeoALxuEBJ2SPvehHkS7r4ESdRDawsAmTdhPMz
 yre4PD9BkhTCsEfVE6Y3A1ngu0fOF/kQZRDMogw2uXeBID6J4beusMe
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-32-0a15d8a799aa@google.com>
Subject: [PATCH v11 32/46] KVM: selftests: Test conversion precision in guest_memfd
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

The existing guest_memfd conversion tests only use single-page memory
regions. This provides no coverage for multi-page guest_memfd objects,
specifically whether KVM correctly handles the page index for conversion
operations. An incorrect implementation could, for example, always operate
on the first page regardless of the index provided.

Add a new test case to verify that conversions between private and shared
memory correctly target the specified page within a multi-page guest_memfd.

This test also verifies the precision of memory conversions by converting a
single page and then iterating through all other pages to ensure they
remain in their original state.

To support this test, add a new GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED
macro that handles setting up and tearing down the VM for each page
iteration. The teardown logic is adjusted to prevent a double-free in this
new scenario.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>

---

v10: Update macro GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED to avoid
     potential macro argument reuse
---
 .../kvm/x86/guest_memfd_conversions_test.c         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
index 4c20d3d8e9349..a8d89df53e46d 100644
--- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
@@ -61,8 +61,13 @@ static void gmem_conversions_do_setup(test_data_t *t, int nr_pages,
 
 static void gmem_conversions_do_teardown(test_data_t *t)
 {
+	/* Use NULL to avoid second free in FIXTURE_TEARDOWN (multipage tests). */
+	if (!t->vcpu)
+		return;
+
 	/* No need to close gmem_fd, it's owned by the VM structure. */
 	kvm_vm_free(t->vcpu->vm);
+	t->vcpu = NULL;
 }
 
 FIXTURE_TEARDOWN(gmem_conversions)
@@ -103,6 +108,30 @@ static void __gmem_conversions_##test(test_data_t *t, int nr_pages)		\
 #define GMEM_CONVERSION_TEST_INIT_SHARED(test)					\
 	__GMEM_CONVERSION_TEST_INIT_SHARED(test, 1)
 
+/*
+ * Repeats test over nr_pages in a guest_memfd of size nr_pages, providing each
+ * test iteration with test_page, the index of the page under test in
+ * guest_memfd. test_page takes values 0..(nr_pages - 1) inclusive.
+ */
+#define GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(test, __nr_pages)		\
+static void __gmem_conversions_multipage_##test(test_data_t *t, int nr_pages,	\
+						const int test_page);		\
+										\
+TEST_F(gmem_conversions, test)							\
+{										\
+	const u64 flags = GUEST_MEMFD_FLAG_MMAP | GUEST_MEMFD_FLAG_INIT_SHARED; \
+	const int nr = (__nr_pages);						\
+	int i;									\
+										\
+	for (i = 0; i < nr; ++i) {						\
+		gmem_conversions_do_setup(self, nr, flags);			\
+		__gmem_conversions_multipage_##test(self, nr, i);		\
+		gmem_conversions_do_teardown(self);				\
+	}									\
+}										\
+static void __gmem_conversions_multipage_##test(test_data_t *t, int nr_pages,	\
+						const int test_page)
+
 struct guest_check_data {
 	void *mem;
 	char expected_val;
@@ -201,6 +230,44 @@ GMEM_CONVERSION_TEST_INIT_SHARED(init_shared)
 	test_convert_to_shared(t, 0, 'C', 'D', 'E');
 }
 
+GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4)
+{
+	int i;
+
+	/* Get a char that varies with both i and n. */
+#define combine(x, n) (((x) << 4) + (n))
+#define i_(n) (combine(i, n))
+#define t_(n) (combine(test_page, n))
+
+	/*
+	 * Start with the highest index, to catch any errors when, perhaps, the
+	 * first page is returned even for the last index.
+	 */
+	for (i = nr_pages - 1; i >= 0; --i)
+		test_shared(t, i, 0, i_(0), i_(2));
+
+	test_convert_to_private(t, test_page, t_(2), t_(3));
+
+	for (i = 0; i < nr_pages; ++i) {
+		if (i == test_page)
+			test_private(t, test_page, t_(3), t_(4));
+		else
+			test_shared(t, i, i_(2), i_(3), i_(4));
+	}
+
+	test_convert_to_shared(t, test_page, t_(4), t_(5), t_(6));
+
+	for (i = 0; i < nr_pages; ++i) {
+		char expected = i == test_page ? t_(6) : i_(4);
+
+		test_shared(t, i, expected, i_(7), i_(8));
+	}
+
+#undef t_
+#undef i_
+#undef combine
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));

-- 
2.55.0.887.g758fc8c411-goog

