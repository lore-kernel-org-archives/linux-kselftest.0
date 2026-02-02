Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9592539527B
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 22:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071470; cv=none; b=s9xpXjr3+Eq3j4cWsLaFVzJdgC43emiBRwiJ8kkcSv60NXiluRO12fNGwMskYleFgKOCYDkYkFsulSoFVp8q50uCJ1yk+ixOca3H+050PAHEU05/Kw3aU0JKkUTErlQt7wzQj+eWWD4/S8hNFwfOLZob7SZDvEePIT+uwnfLRHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071470; c=relaxed/simple;
	bh=qRnEczXlduOW3C0O9spHmofImFcnn7rXn4Gw2hh/jro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KHEQ4JGgsSmsMdfTzWJ1c46qGLb0TXBUIpJt6EoZ58GdC5T6e8o5t7lav2BoNm8D5ifmMJwr+FciI0L9NhMc1WZgYuMnQ6AT8McC9gN1n+4ixVgXq/6jTfVfYd5toFrfmwEefjdQqx5xbs2OIdeTzKWa7M6LBLhtiubi3FmzMlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Cpg0OSb; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Cpg0OSb"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c6366048135so112719a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 14:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071468; x=1770676268; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3H0YZPf5vKYzMrAOphWj1h1SEeefAlujnu5HOJZAJU=;
        b=2Cpg0OSbqEjlLcQIAkSI4PgNVskzNa+RHb0MpjW6XtILcYda6B+1na2wzvX7awou+V
         QHt8GZDTBaJV5UCEMKw9+KsRkfNGipKJ7c6NA4CXHng7yy2Kemncwa/zbHjfcRHFuA/U
         AzSNnvUQtDeyLUXpz1fVi1uyNUbbsRZaee4lMU+VTDw6/kYLnmuVpY3XYZSo8k6GYOLx
         mziOhQz/5cOclT5Wl/3q0sSYRl4ZvP91qGEM0djVMBD+Dd2cPvdeTFZJ0Bmj8JbvIdIv
         Vj8LK58FQL16lx4mLv85JrxSEJEe+wOMtpZ47Ra1H9av36LFI1rWacNqCGz6zUmOCDxB
         nZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071468; x=1770676268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3H0YZPf5vKYzMrAOphWj1h1SEeefAlujnu5HOJZAJU=;
        b=bD84ujwzv5j8czjEy+sjBhkYI5rcWCPSjfh9YaV7cz2Som5HlbbHX+FQWI3QPbQNJ7
         FV1eTY+9VhXfS0eOibca6kEoriOJiFhIiYXmxf/K7RopwPPFxcdx1YfMPWIxfbtAbZtW
         QNnbEYLLeXkY7Dk4MMzC3wWKRS3ObR2lk70u9UtFFqmPZ/xjDk8ec4d/S3S14U0YEUY1
         aCHYNu+xSZYZmw6tNfehshxP9MUjgsQeRJxew+Kwoa3qIgc+SxW2y2B84uJtcH4Ya8SX
         fwiRmweU7TDTplais/7H/36v3Z7PNtpATgNpS7tF2YG2DSB22z4WqRrHXztsUKNLbHPv
         GFag==
X-Forwarded-Encrypted: i=1; AJvYcCXplJn7EQYXbYqO+R590Ye55NAVzAQNcQ1w6gcjm1CK7FDYJtYvjnQEH+L9/8X6jJqpYfvYg9gJChSThSjHf/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxSN41/YV9yGWkrmL8xy7F5Sly+oRWrOwEveLzk4JVw19o5gC
	T74T9hYJCmzDZ20h057h/uIsnFVCXmX/s/aCsy/T6VNr9WPWtBwoBlyXg99+d5V08t7NTk05LKC
	yoqQsBitBww4Rf1yhpl4/URR9mA==
X-Received: from plho3.prod.google.com ([2002:a17:903:23c3:b0:2a0:a0e0:a9c3])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c94a:b0:2a7:a87a:423 with SMTP id d9443c01a7336-2a92465cb91mr7857185ad.19.1770071467885;
 Mon, 02 Feb 2026 14:31:07 -0800 (PST)
Date: Mon,  2 Feb 2026 14:30:06 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <69033e02150097aeb2b261ead30cd37c20d007c7.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 28/37] KVM: selftests: Test conversion with elevated
 page refcount
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a selftest to verify that converting a shared guest_memfd page to a
private page fails if the page has an elevated reference count.

When KVM converts a shared page to a private one, it expects the page to
have a reference count equal to the reference counts taken by the
filemap. If another kernel subsystem holds a reference to the page, for
example via pin_user_pages(), the conversion must be aborted.

This test uses vmsplice to increment the refcount of a specific page. The
reference is kept on the page by not reading data out from vmsplice's
destination pipe. It then attempts to convert a range of pages, including
the page with elevated refcount, from shared to private.

The test asserts that both bulk and single-page conversion attempts
correctly fail with EAGAIN for the pinned page. After the page is unpinned,
the test verifies that subsequent conversions succeed.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/guest_memfd_conversions_test.c        | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
index c1a9cc7c9fae..872747432545 100644
--- a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
@@ -396,6 +396,84 @@ GMEM_CONVERSION_TEST_INIT_SHARED(forked_accesses)
 	kvm_munmap(test_state, sizeof(*test_state));
 }
 
+static int pin_pipe[2] = { -1, -1 };
+
+static void pin_pages(void *vaddr, uint64_t size)
+{
+	struct iovec iov = {
+		.iov_base = vaddr,
+		.iov_len = size,
+	};
+
+	if (pin_pipe[1] < 0)
+		TEST_ASSERT_EQ(pipe(pin_pipe), 0);
+
+	TEST_ASSERT_EQ(vmsplice(pin_pipe[1], &iov, 1, 0), size);
+}
+
+static void unpin_pages(void)
+{
+	close(pin_pipe[1]);
+	pin_pipe[1] = -1;
+	close(pin_pipe[0]);
+	pin_pipe[0] = -1;
+}
+
+static void test_convert_to_private_fails(test_data_t *t, loff_t pgoff,
+					  size_t nr_pages,
+					  loff_t expected_error_offset)
+{
+	loff_t offset = pgoff * page_size;
+	loff_t error_offset = -1ul;
+	int ret;
+
+	do {
+		ret = __gmem_set_private(t->gmem_fd, offset,
+					 nr_pages * page_size, &error_offset);
+	} while (ret == -1 && errno == EINTR);
+	TEST_ASSERT(ret == -1 && errno == EAGAIN,
+		    "Wanted EAGAIN on page %lu, got %d (ret = %d)", pgoff,
+		    errno, ret);
+	TEST_ASSERT_EQ(error_offset, expected_error_offset);
+}
+
+GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(elevated_refcount, 4)
+{
+	int i;
+
+	pin_pages(t->mem + test_page * page_size, page_size);
+
+	for (i = 0; i < nr_pages; i++)
+		test_shared(t, i, 0, 'A', 'B');
+
+	/*
+	 * Converting in bulk should fail as long any page in the range has
+	 * unexpected refcounts.
+	 */
+	test_convert_to_private_fails(t, 0, nr_pages, test_page * page_size);
+
+	for (i = 0; i < nr_pages; i++) {
+		/*
+		 * Converting page-wise should also fail as long any page in the
+		 * range has unexpected refcounts.
+		 */
+		if (i == test_page)
+			test_convert_to_private_fails(t, i, 1, test_page * page_size);
+		else
+			test_convert_to_private(t, i, 'B', 'C');
+	}
+
+	unpin_pages();
+
+	gmem_set_private(t->gmem_fd, 0, nr_pages * page_size);
+
+	for (i = 0; i < nr_pages; i++) {
+		char expected = i == test_page ? 'B' : 'C';
+
+		test_private(t, i, expected, 'D');
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
-- 
2.53.0.rc1.225.gd81095ad13-goog

