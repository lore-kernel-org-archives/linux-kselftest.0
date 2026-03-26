Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BC3CF69E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 22:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774563937; cv=none; b=fOU+hxdxhtYKX8tFx4xRqYS1IO8F3WXhQR4+gvhEvtnQEHEsqFioAtX9VDwkf9SpcPxOvN+DbYEnZmmaWp0FHKzTVV1p4FWS0O3MO9K3Leu8x+r1v/2BXvhxeqiYLes2s4KLqNzo/1uu0Yb88hNfz4YUCb5oqpsRazzbbBJ+lYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774563937; c=relaxed/simple;
	bh=mbmnyh+Paq6B3nFHJjVqfDuPSLNxTEBywi3jrm5yLoM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OsxkxVMbcYb6jYHMQxsoAOF/x7oCuyaSzK1VzQ5up4fcZClqLQEMU5mk3slpO2xizT7+Z2jnWoE2WUhzavnK0CDHRPvK93i1L/fFjzNnRIsW8kN1dT7Pdbjhr8lhCH/4/AX0i0pHHtmFWh9RXKR0nw9rSEDRwKV8v/zulI+o0HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dX0Ig1BC; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dX0Ig1BC"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c73a4983fc0so1099610a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 15:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774563934; x=1775168734; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQv/c3jRIYhBhzt6KigDfrqgdsyHsqIxf08hCghwjGs=;
        b=dX0Ig1BC9f6wcZaVnloMFz091FKUqAa+Ppua+0yjFzpjZAE8ii5eDY0znaAEO6jcre
         yAsEraf9sEOmsm+9F7w63jJf1kjJ6/fJssqp1JZAJo0HPbrVixupIDZfCTsJzr271jyX
         Ex3VIjIvxbXFMFVFgbJSs0AQ8CwqKQeYp1pQKJAWBWmQNJ4SF80lEJIUCNQlN0LqsTEb
         BaS074t2mmTZn8BEEP3eND//nrPn6FguamVh7DQGfEERdh6HzSAGyBRBotQIx6Crn7+n
         ihjAjaeIZtUYjfjTNS2sFVA3PB4fq5FhQs3e1gh+kZsaW5swLjZnDzuxIhaoSgw9BupC
         sDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774563934; x=1775168734;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQv/c3jRIYhBhzt6KigDfrqgdsyHsqIxf08hCghwjGs=;
        b=OrznSGtiVNY5z0iQDo7QIp0znrEo7dFjAoo7TL+15k44t7F+mjBYGH4xEq48rSSoGN
         p5TVDBMPdgPdaNfWo4xhNUAiozXs1IazioryLC5bVGOdjjcmYLxjMR4Agl5sdNbby+tC
         k1oeFxLNCPVyTNPPHO00DLPBWzdUc9M5VliNLMfznjJdf4eCy1jVoaAi/kZhu7AWeb71
         o//EyCsdOw+rKAemS9zsoN/bm4qne/rS12Nmwdf5fjdIRY+MS52dh8Zfsued1cim/5rS
         iIdBqc3ekQu9JLPV8SOktLL9pAwMMougqa8sNNj+N9NHh7TH1CWaQgctbnA9b8CMwd+r
         ax4g==
X-Forwarded-Encrypted: i=1; AJvYcCXS/qFvriIH7n8GvWnVe6l9UBZo9biXRCBfEo8NmDreZifCSpuYyRn4WS4yw/KnhgdEgNcDl4fHANJh6kA8260=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC0Oae2mrkPZOuU9Aoh0Ow+iIHIlUK0r2Y2/49Gvo4ZKpd2oz5
	NPlDhK4/glyWH75LTc+ZZ9cR2puGqW6DNhgtlh7+I42xWZddUAbMMZGIs9GdiQF7e0t5PsVzOKH
	Q2gX3Dmo5y017aWT51jRh85t/Zw==
X-Received: from pfbfb41.prod.google.com ([2002:a05:6a00:2da9:b0:829:7d34:ff99])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:13a9:b0:824:36f8:346f with SMTP id d2e1a72fcca58-82c95e7986bmr157171b3a.25.1774563933827;
 Thu, 26 Mar 2026 15:25:33 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:24:43 -0700
In-Reply-To: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774563861; l=2836;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=mbmnyh+Paq6B3nFHJjVqfDuPSLNxTEBywi3jrm5yLoM=; b=ayjE20AS++xWp9N9WMziD80Oj2fnaF8+fEzlR1NValnRS6nVfyJUGa/eCX/UeeAKeN4u7/8Jy
 xLD/R+OSUjsBKl4tO0uelwfjOm2q3N6Bn3lz/wkKJsC7TbYULR2LjZv
X-Mailer: b4 0.14.3
Message-ID: <20260326-gmem-inplace-conversion-v4-34-e202fe950ffd@google.com>
Subject: [PATCH RFC v4 34/44] KVM: selftests: Support checking that data not
 equal expected
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

Expand run_guest_do_rmw() to support checking that data at given pgoff is
not equal to expected_val. This will be used in a later patch that tests
that memory contents are scrambled.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/guest_memfd_conversions_test.c        | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
index c0abc69f15332..277b122ec294c 100644
--- a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
@@ -137,6 +137,7 @@ static void __gmem_conversions_multipage_##test(test_data_t *t, int nr_pages,	\
 struct guest_check_data {
 	void *mem;
 	char expected_val;
+	bool assert_not_equal;
 	char write_val;
 };
 static struct guest_check_data guest_data;
@@ -146,7 +147,13 @@ static void guest_do_rmw(void)
 	for (;;) {
 		char *mem = READ_ONCE(guest_data.mem);
 
-		GUEST_ASSERT_EQ(READ_ONCE(*mem), READ_ONCE(guest_data.expected_val));
+		if (READ_ONCE(guest_data.assert_not_equal)) {
+			GUEST_ASSERT_NE(READ_ONCE(*mem),
+					READ_ONCE(guest_data.expected_val));
+		} else {
+			GUEST_ASSERT_EQ(READ_ONCE(*mem),
+					READ_ONCE(guest_data.expected_val));
+		}
 		WRITE_ONCE(*mem, READ_ONCE(guest_data.write_val));
 
 		GUEST_SYNC(0);
@@ -154,13 +161,15 @@ static void guest_do_rmw(void)
 }
 
 static void run_guest_do_rmw(struct kvm_vcpu *vcpu, loff_t pgoff,
-			     char expected_val, char write_val)
+			     char expected_val, char write_val,
+			     bool assert_not_equal)
 {
 	struct ucall uc;
 	int r;
 
 	guest_data.mem = (void *)GUEST_MEMFD_SHARING_TEST_GVA + pgoff * page_size;
 	guest_data.expected_val = expected_val;
+	guest_data.assert_not_equal = assert_not_equal;
 	guest_data.write_val = write_val;
 	sync_global_to_guest(vcpu->vm, guest_data);
 
@@ -191,7 +200,7 @@ static void test_private(test_data_t *t, loff_t pgoff, char starting_val,
 			 char write_val)
 {
 	TEST_EXPECT_SIGBUS(WRITE_ONCE(t->mem[pgoff * page_size], write_val));
-	run_guest_do_rmw(t->vcpu, pgoff, starting_val, write_val);
+	run_guest_do_rmw(t->vcpu, pgoff, starting_val, write_val, false);
 	TEST_EXPECT_SIGBUS(READ_ONCE(t->mem[pgoff * page_size]));
 }
 
@@ -207,7 +216,7 @@ static void test_shared(test_data_t *t, loff_t pgoff, char starting_val,
 			char host_write_val, char write_val)
 {
 	host_do_rmw(t->mem, pgoff, starting_val, host_write_val);
-	run_guest_do_rmw(t->vcpu, pgoff, host_write_val, write_val);
+	run_guest_do_rmw(t->vcpu, pgoff, host_write_val, write_val, false);
 	TEST_ASSERT_EQ(READ_ONCE(t->mem[pgoff * page_size]), write_val);
 }
 

-- 
2.53.0.1018.g2bb0e51243-goog

