Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2163C944A;
	Fri, 24 Apr 2026 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033480; cv=none; b=MGD0vqKfykQVX93fMVlSxr3CYSsgj2a6o+4OXsz6SRdnGD66L5DCXbaXkOyNb0LuTvz/PZ54Kdy7/nvL9cIU8cyjBo3xrr7fM9kztwji+zUI2BwNwXmWhTLIj9QvlCsLSa+8q9npPcAeqQAE9sB2BDnfMbOliq0xGe+Gyq3nLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033480; c=relaxed/simple;
	bh=/qCKorRDHDfdon8uQB15LannYTC+7j0ppSiNsgWgO1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gS+e3Y1u30UT0xGHTUPGtwPj9XsrsCrUO143oeXR6Z3SnF98zRc8+s06HqpsBLt4+X82ApORWQMMPQu3R5V2oxBAzAJN0RWArql3U/BhcfG9immR6UWdERNmiVnkAb05whHDQ1CulagsG81sQdozXgdHJ6En3pdMU38wWdd8Dfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=gKK60k+S; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="gKK60k+S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=T58sPSkCpDO6mBCqL0XNY2K3RwSWcmiQzHhYDz9yJNk=; b=gKK60k+S3QWIkEsCrZpLN2qzb7
	nut7ZZBWKz1PqFWcgB/i1eQix6vrVsbVf5Nrkxr34b/YhxBif9c1+0eAA3/pEQ4WAHsXQEJ9MNnJi
	SdkS2/kuu+SY3XwaCJHg0iINy/ij99/44h+aDAha2ATMISlY4HV0+1j3Jb5UFpK2VH5KtagHiwfQN
	Dz7KAPRyMp5DW66Cp8F4YHEaw+KBYzYuL5E6n7qTbkup10a/+jjak64JJ2Bo6MfENvuiNtLXtvKZE
	ZLWCZj8qTrFsS3zHAtcnCspX3nJ+lmZBJN/MYuX2vDBIYzoL4BLLFegpjc/O8A1dYNwMFp4dJXR6o
	j2BqZ/BA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wGFaF-003APz-1L;
	Fri, 24 Apr 2026 12:24:35 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 24 Apr 2026 05:24:01 -0700
Subject: [PATCH v5 3/4] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-ecc_panic-v5-3-a35f4b50425c@debian.org>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
In-Reply-To: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3920; i=leitao@debian.org;
 h=from:subject:message-id; bh=/qCKorRDHDfdon8uQB15LannYTC+7j0ppSiNsgWgO1Y=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp62Duf59kh2dj9J6Mb05R+4nEoFVAbAXCB+7LW
 8yh5FWm1EqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaetg7gAKCRA1o5Of/Hh3
 bSVZEACbzhttOBC3Ol+GlNv//VUwHekj1rvhaAp79eZJ8vFb8jBi8rEAbCDhEBO1mCojmLbpb2E
 rrywuAl9yDZxWmG2mQGJtDS5wvNtMbP9KWUgwtpctvC0OQnATLrf1BN46NdC4RQ/628ZoL6TgTV
 PCqSuAlxdCkZkG/xsQE+KlPmqGUTogqFEqtreAk4CxZHtPrNqTOQ2TJOtIFIxflrSFcKPlUyD2U
 c4oUttA2kx7Uk03nMUB7HTRBbQ8jdaHGr9GSU44Kfk5s1skC8xGZOd3JD+XlCsiNRD5zCfda/1i
 Bzs1tmJih0O8B6ZaZvl2RGyxIpFFEh0ekQMP6HuESvcW59bJexYxoY5Ilkz3M4RhU5n3/PzHsi4
 Vw9EHRuK7f8+ci2tANKyIZV9vIT9gRo1JWtfU2dBzicb43za53G57L9YFbwuWlyYJB9Xo55gd4Y
 qvZTF1DQ5MISTe547MZi8KsZ6qeHZUAnbIw1ua+rhwXxlipjEltrf6jdDqvcnurrPWF0FsEsk8k
 GSFndcTgQta0DeaX3U6V+zAt30Yg44jSSE2EhwydgOWLJhp8QG8HeFcCnJfq3NaIPw46+YhxASK
 uQjcjPwGAE+SIuwlCi3ow/0n1KcmQNCdQn7DNfQUarx1YP59vGKOZGahiPFCtGMp2smPr0jUTZu
 iZaBWTaaqrwqKzA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Add documentation for the new vm.panic_on_unrecoverable_memory_failure
sysctl, describing the three categories of failures that trigger a
panic and noting which kernel page types are not yet covered.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/admin-guide/sysctl/vm.rst | 65 +++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 97e12359775c9..f118ec5cd1fad 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -67,6 +67,7 @@ Currently, these files are in /proc/sys/vm:
 - page-cluster
 - page_lock_unfairness
 - panic_on_oom
+- panic_on_unrecoverable_memory_failure
 - percpu_pagelist_high_fraction
 - stat_interval
 - stat_refresh
@@ -925,6 +926,70 @@ panic_on_oom=2+kdump gives you very strong tool to investigate
 why oom happens. You can get snapshot.
 
 
+panic_on_unrecoverable_memory_failure
+======================================
+
+When a hardware memory error (e.g. multi-bit ECC) hits a kernel page
+that cannot be recovered by the memory failure handler, the default
+behaviour is to ignore the error and continue operation.  This is
+dangerous because the corrupted data remains accessible to the kernel,
+risking silent data corruption or a delayed crash when the poisoned
+memory is next accessed.
+
+When enabled, this sysctl triggers a panic on three categories of
+unrecoverable failures: reserved kernel pages, non-buddy kernel pages
+with zero refcount (e.g. tail pages of high-order allocations), and
+pages whose state cannot be classified as recoverable.
+
+Note that some kernel page types — such as slab objects, vmalloc
+allocations, kernel stacks, and page tables — share a failure path
+with transient refcount races and are not currently covered by this
+option. I.e, do not panic when not confident of the page status.
+
+For many environments it is preferable to panic immediately with a clean
+crash dump that captures the original error context, rather than to
+continue and face a random crash later whose cause is difficult to
+diagnose.
+
+Use cases
+---------
+
+This option is most useful in environments where unattributed crashes
+are expensive to debug or where data integrity must take precedence
+over availability:
+
+* Large fleets, where multi-bit ECC errors on kernel pages are observed
+  regularly and post-mortem analysis of an unrelated downstream crash
+  (often seconds to minutes after the original error) consumes
+  significant engineering effort.
+
+* Systems configured with kdump, where panicking at the moment of the
+  hardware error produces a vmcore that still contains the faulting
+  address, the affected page state, and the originating MCE/GHES
+  record — context that is typically lost by the time a delayed crash
+  occurs.
+
+* High-availability clusters that rely on fast, deterministic node
+  failure for failover, and prefer an immediate panic over silent data
+  corruption propagating to replicas or persistent storage.
+
+* Kernel and platform developers reproducing hwpoison issues with
+  tools such as ``mce-inject`` or error-injection debugfs interfaces,
+  where panicking on the unrecoverable path makes regressions
+  immediately visible instead of surfacing as later, unrelated
+  failures.
+
+= =====================================================================
+0 Try to continue operation (default).
+1 Panic immediately.  If the ``panic`` sysctl is also non-zero then the
+  machine will be rebooted.
+= =====================================================================
+
+Example::
+
+     echo 1 > /proc/sys/vm/panic_on_unrecoverable_memory_failure
+
+
 percpu_pagelist_high_fraction
 =============================
 

-- 
2.52.0

