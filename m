Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B337E31F
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382419; cv=none; b=YfOhcHaRw7YXB2TFPxZ34C1z+3WuinqwL5nyxrIOJms8wpVuSwaRZ0T97DsV7VxfZSNrCvK9+Uvy+b+ujjW5FQYc6izuI+NQ+8iM8j4TMyAxb1doQQCBEOaBcyrG+8X/saYFsIXR9KGLnH8JZCc0TW50/42FviVcodEoeK9omck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382419; c=relaxed/simple;
	bh=AsQimpP6VPCpX/GeA3PXLmrBwdE8bqvci7sU/Y3ufXs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oMbkvG87/XyEtyqKcgP6ENQWDTihxsp/D0vPsM8FbwUbSGF/INQjLA/xVXGqNVzfxN7m6Vm7NZj+0J36hyj/o8Hw2C8z6ssZBPO7XXy0bz3JgWxg3pqEys/6kD70j0o2WrfEHixzL3dTwzYtrEtf9N/1Rrz5VMbE0yaG1si/yTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XRiWkCSV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XRiWkCSV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so2150323a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773382413; x=1773987213; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYNGOoNNh7RW693z87teeFuj/YH+4YrK5JAx0qc/QTU=;
        b=XRiWkCSVLhdFTGBcZYNn1hBrtn1DzZoJTtIiFrcoI634tKr2aV3v8A4OVoQDD3emxa
         DVO6tQAcQLKCFK+utKfawyvYsc6tN4LeritZAudo5dkjmj9EmPQakvpOQPpYdKyMY0as
         WafnpAarM72O03lRdBRLkT1XlbQkqZUnb4nAsuYfc9PtmCXhAjpTHgj0b5omOtwPWCyq
         +osjql4VBcXQZQ0s1d+x/6hcGXqwubE1ZJAGSJXTSV34OFY0btK5gZmWs7aZzI87/WOQ
         RMMLkHkcbISiqxBPeeGDz1AhSfjD18+VOHKHLZJiUHC7n+dl7+9g8m4I+MhpZeMVbGMZ
         p1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382413; x=1773987213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYNGOoNNh7RW693z87teeFuj/YH+4YrK5JAx0qc/QTU=;
        b=hHfv7ipCv9cEbogbGrOIvuiTrFUUw05N1CRfvOypgNvxZMgoMyT3tY3a4x6rryosmI
         d6ffegIkydWbmus1VZo5AGIEglnstovmYR5ep4sqN+NjM1Fb6TyDNdGP4cbH3IoG9+Jy
         pSmqPK6WAF1Y6N7++pZ2tPv9LUesiDfTmqbqp9E8OZpfUpQLY1O6Dy9i40z+vPnUZC6T
         00E7yxKUP9Qb8S2WUUujCUTmhXa7L0AinQASwT8PUjfz7SVcy//HttGdDct/mDFU3tk0
         wuicT43ui9GbbcJsl5poTv4IQTm0PYs5CU3BP4l4KMEp6/rsVEIGGwKevg5FGrxyYE5O
         XTyw==
X-Forwarded-Encrypted: i=1; AJvYcCU7gPb1Elk3KHfU9kKJHw36JG/SFoDdfRHmg4mnZFjQ6kaAgB5JBlV7sy9YQYBdJWGFs9e5tdaeUOr7JTUZ7Gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjF2C9KeeVzGoZsVyFQzShOipsVyNMm9PlXStlW03tW0uZoPNN
	FdOP+CMJT8M1w7qd+NHDw1dU8Y9bohwKqupF3AcI1XMdU/J7ZD4alixzf8DCrbhgyjsxbyT2ICi
	qno7nk3z03dwZU1dIDouuM8s77g==
X-Received: from pjvf3.prod.google.com ([2002:a17:90a:da83:b0:359:86b9:176d])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1fcc:b0:359:8dfc:d39a with SMTP id 98e67ed59e1d1-35a11940b38mr5012681a91.4.1773382412954;
 Thu, 12 Mar 2026 23:13:32 -0700 (PDT)
Date: Fri, 13 Mar 2026 06:13:06 +0000
In-Reply-To: <20260313-gmem-inplace-conversion-v3-0-5fc12a70ec89@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260313-gmem-inplace-conversion-v3-0-5fc12a70ec89@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773382364; l=3457;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=VmcKXTBk9OIQ151891CwT/J/1loQnzBkF6yygKgeTPk=; b=z3KgLYQjwUaYikW8XAOodIwQ93xrZsUpHVKoezptz6hG2AKa7cWLyyzelsKs++CcZexA/5KQ8
 RM4G7PiCRZXBpyLNHyr7/eGs7fAM0F2Z7u3swsCGBSOSQZvOCOykYJ5
X-Mailer: b4 0.14.3
Message-ID: <20260313-gmem-inplace-conversion-v3-27-5fc12a70ec89@google.com>
Subject: [PATCH RFC v3 27/43] KVM: selftests: Test that shared/private status
 is consistent across processes
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
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Add a test to verify that a guest_memfd's shared/private status is
consistent across processes, and that any shared pages previously mapped in
any process are unmapped from all processes.

The test forks a child process after creating the shared guest_memfd
region so that the second process exists alongside the main process for the
entire test.

The processes then take turns to access memory to check that the
shared/private status is consistent across processes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/guest_memfd_conversions_test.c   | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
index 89881a71902e6..c1a9cc7c9fae6 100644
--- a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
@@ -322,6 +322,80 @@ GMEM_CONVERSION_TEST_INIT_SHARED(truncate)
 	test_private(t, 0, 0, 'A');
 }
 
+/* Test that shared/private memory protections work and are seen from any process. */
+GMEM_CONVERSION_TEST_INIT_SHARED(forked_accesses)
+{
+	/*
+	 * No races are intended in this test, shared memory is only used to
+	 * coordinate between processes.
+	 */
+	static enum {
+		STATE_INIT,
+		STATE_CHECK_SHARED,
+		STATE_DONE_CHECKING_SHARED,
+		STATE_CHECK_PRIVATE,
+		STATE_DONE_CHECKING_PRIVATE,
+	} *test_state;
+	pid_t child_pid;
+
+	test_state = kvm_mmap(sizeof(*test_state), PROT_READ | PROT_WRITE,
+			      MAP_SHARED | MAP_ANONYMOUS, -1);
+
+#define TEST_STATE_AWAIT(__state)						\
+	while (READ_ONCE(*test_state) != __state) {				\
+		if (child_pid != 0) {						\
+			int status;						\
+			pid_t pid;						\
+			do {							\
+				pid = waitpid(child_pid, &status, WNOHANG);	\
+			} while (pid == -1 && errno == EINTR);			\
+			if (pid == -1)						\
+				TEST_FAIL("Couldn't check child status.");	\
+			else if (pid != 0)					\
+				TEST_FAIL("Child exited prematurely.");		\
+		}								\
+	}
+
+#define TEST_STATE_SET(__state) WRITE_ONCE(*test_state, __state)
+
+	child_pid = fork();
+	TEST_ASSERT(child_pid != -1, "fork failed");
+
+	if (child_pid == 0) {
+		const char inconsequential = 0xdd;
+
+		TEST_STATE_AWAIT(STATE_CHECK_SHARED);
+
+		/*
+		 * This maps the pages into the child process as well, and tests
+		 * that the conversion process will unmap the guest_memfd memory
+		 * from all processes.
+		 */
+		host_do_rmw(t->mem, 0, 0xB, 0xC);
+
+		TEST_STATE_SET(STATE_DONE_CHECKING_SHARED);
+		TEST_STATE_AWAIT(STATE_CHECK_PRIVATE);
+
+		TEST_EXPECT_SIGBUS(READ_ONCE(t->mem[0]));
+		TEST_EXPECT_SIGBUS(WRITE_ONCE(t->mem[0], inconsequential));
+
+		TEST_STATE_SET(STATE_DONE_CHECKING_PRIVATE);
+		exit(0);
+	}
+
+	test_shared(t, 0, 0, 0xA, 0xB);
+
+	TEST_STATE_SET(STATE_CHECK_SHARED);
+	TEST_STATE_AWAIT(STATE_DONE_CHECKING_SHARED);
+
+	test_convert_to_private(t, 0, 0xC, 0xD);
+
+	TEST_STATE_SET(STATE_CHECK_PRIVATE);
+	TEST_STATE_AWAIT(STATE_DONE_CHECKING_PRIVATE);
+
+	kvm_munmap(test_state, sizeof(*test_state));
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));

-- 
2.53.0.851.ga537e3e6e9-goog

