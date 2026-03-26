Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05438550B
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774563895; cv=none; b=UzaUSlQsu1SaIeotuvKmn4d3wtFPA+dFZlfCb5yfqjOGBprvWnCoMM0r2wkOeCgkHswstUnvQBxDkwoPNN0x28OWya55YvdQ08d4+efaxUPt1ua4KZUSGkzgAByeWD2emwA3nyCpv4w3aaFfO15rUFCFW07Vt6isWfuq5AlZuJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774563895; c=relaxed/simple;
	bh=+lH9JgLOF707IWKJRbslu6RR2YV0S99MONEW8Yc3BZ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s6AGNtaLDUew/XadbcFpAQSQD3X9IimTxZMnKaZ75Rl8wB84zmlPWtBz3kNHc6I1mzMaBGGYGgKQBP6NLXXywANG+jVNZhHm9UEI9gq5S+W7tp6kxKihlU9jOQtR4bCBL9aaakhvAnR4tc+y3FcQdd5Sn+/LpDi3AfyluMTHiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dRGO0fFQ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dRGO0fFQ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82a8203055bso1084045b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 15:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774563894; x=1775168694; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=krjKKoUHOcKbfpf9SpjvgIZEA4m0P+3HWizcMkU39sE=;
        b=dRGO0fFQcn6iin7wNsdIdxtGeXHBZwU8tVS8u5jJY6Q9DTWYntjVdewCv/zHGxZvfH
         NpipVC4nbtfAJYp+1qMn4Nfzybvs6fPBC6xjnne+Q63y+S/PhbvImcFan1ZpFui8eDH/
         ecNZn6QyBECHVjOOtWTl7YGSNwzrlLdA9fZxgnFtgmhxVJTrcN+V8iEKISo/BMVMKL7z
         4IUhR28XEk+IY6qhI6b5Hvt/8a14klDwFm7Ogu4vCjjwdgbW6vcISGTqrdefLsYRZqck
         gWyuyovL82/QVthORjyTD/rYEDgFO1LOD8QgJUdT+2JUblQTRchCTDuw13MCpcKdKph/
         cn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774563894; x=1775168694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krjKKoUHOcKbfpf9SpjvgIZEA4m0P+3HWizcMkU39sE=;
        b=ST8ZpM4CqlOnZAvRLQfiFHyP6JdBODm777NmyUTdUT0VD4ci8hS2KDEKuX1Os9rZJH
         UqhPDHeUSSKvXT4GJfNTZTXI/sVbq7q+20W8pEIeHI5p09Ss/chvZdcY9PszavsUMIu0
         yHU4yZudmzOFqwtspCHGTKkkU68mKPQJ4Y74seaKOsWwoARgDl2UGtUhGGjOzX2yIQwY
         GZFWzXrq1t+WtPRDGPKR8hU/7r5S9TUfHD+tkPB9bUQoeMYSU/j/cAswNvHYEemA6Cqm
         gtSD3bScgsgoAHfFTcuJ4bPAoaZlhsuzGm8dBsFzyMQOSrfp65mAdQSDExU7lleFSzU0
         vEHA==
X-Forwarded-Encrypted: i=1; AJvYcCVcSSb/AV1DPUfOciIVlJivRAOZDlSyHYKVcwkC2EgVFoRtc5SMq5Iof251M5keeHuBUSCe481j34HBAb/LOmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkE9wTNphAtAIIc0Q3AG8WnKCOxsXkrD8wZSfjdCP3opNicop/
	rsTJXgqrVcV5NpgVNgKpf9ZQTwk9uYZyujOSGtEKBr8ZamqDgJGGkIiIKvm/JvlLW6+xq2m0fq5
	cIkfcrjFXxqgjUtWCcq+sXJuluQ==
X-Received: from pfbfa24.prod.google.com ([2002:a05:6a00:2d18:b0:829:813e:c970])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4b12:b0:829:a127:518 with SMTP id d2e1a72fcca58-82c9605434bmr143072b3a.40.1774563893212;
 Thu, 26 Mar 2026 15:24:53 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:24:23 -0700
In-Reply-To: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774563861; l=3333;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=+lH9JgLOF707IWKJRbslu6RR2YV0S99MONEW8Yc3BZ8=; b=M/Gbb884LE5QPF+3EzZzuqSIO6Odv8JZWUawyA7Mhz//bCISt9epGhctguzMXhMlD/ZE6w0Rj
 EGaXkNBVodNBXGot/DtKS79CF61Z84KbG7KljbyQM3ZQboU3Sv7s68x
X-Mailer: b4 0.14.3
Message-ID: <20260326-gmem-inplace-conversion-v4-14-e202fe950ffd@google.com>
Subject: [PATCH RFC v4 14/44] KVM: x86: Add support for applying content modes
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

For x86, override the default implementations of content mode functions to
handle reporting of supported content modes, and application of requested
modes based on x86 VM types.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/x86.c | 101 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9c29407712580..3bbc8ffbf489e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14078,6 +14078,107 @@ void kvm_arch_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
 	kvm_x86_call(gmem_invalidate)(start, end);
 }
 #endif
+
+u64 kvm_arch_gmem_supported_content_modes(struct kvm *kvm)
+{
+	switch (kvm->arch.vm_type) {
+	case KVM_X86_SW_PROTECTED_VM:
+		return KVM_SET_MEMORY_ATTRIBUTES2_ZERO |
+		       KVM_SET_MEMORY_ATTRIBUTES2_PRESERVE;
+	case KVM_X86_SNP_VM:
+	case KVM_X86_TDX_VM:
+		return KVM_SET_MEMORY_ATTRIBUTES2_ZERO;
+	default:
+		return 0;
+	}
+}
+
+int kvm_arch_gmem_apply_content_mode_zero(struct kvm *kvm, struct inode *inode,
+					  pgoff_t start, pgoff_t end)
+{
+	switch (kvm->arch.vm_type) {
+	case KVM_X86_SW_PROTECTED_VM:
+	case KVM_X86_SNP_VM:
+	case KVM_X86_TDX_VM:
+		/*
+		 * TDX firmware will zero on unmapping from the
+		 * Secure-EPTs, but suppose a shared page with
+		 * contents was converted to private, and then
+		 * converted back without ever being mapped into
+		 * Secure-EPTs: guest_memfd can't rely on TDX firmware
+		 * for zeroing then.
+		 */
+		return kvm_gmem_apply_content_mode_zero(inode, start, end);
+	default:
+		WARN_ONCE(1, "Unexpected request to zero for vm_type.");
+		return -EOPNOTSUPP;
+	}
+}
+
+int kvm_arch_gmem_apply_content_mode_preserve(struct kvm *kvm,
+					      struct inode *inode,
+					      pgoff_t start, pgoff_t end)
+{
+	switch (kvm->arch.vm_type) {
+	case KVM_X86_SW_PROTECTED_VM:
+		return 0;
+	default:
+		WARN_ONCE(1, "Unexpected request to preserve for vm_type.");
+		return -EOPNOTSUPP;
+	}
+}
+
+static int __scramble_range(struct inode *inode, pgoff_t start, pgoff_t end)
+{
+	struct address_space *mapping = inode->i_mapping;
+	struct folio_batch fbatch;
+	struct folio *f;
+	char *kaddr;
+	int ret = 0;
+	int i;
+
+	folio_batch_init(&fbatch);
+	while (!ret && filemap_get_folios(mapping, &start, end - 1, &fbatch)) {
+		for (i = 0; !ret && i < folio_batch_count(&fbatch); ++i) {
+			f = fbatch.folios[i];
+
+			folio_lock(f);
+
+			if (folio_test_hwpoison(f)) {
+				ret = -EHWPOISON;
+			} else {
+				/*
+				 * Hard-coding range to scramble since
+				 * guest_memfd only supports PAGE_SIZE
+				 * folios now.
+				 */
+				kaddr = kmap_local_folio(f, 0);
+				get_random_bytes(kaddr, PAGE_SIZE);
+				kunmap_local(kaddr);
+			}
+
+			folio_unlock(f);
+		}
+
+		folio_batch_release(&fbatch);
+		cond_resched();
+	}
+
+	return ret;
+}
+
+int kvm_arch_gmem_apply_content_mode_unspecified(struct kvm *kvm,
+						 struct inode *inode,
+						 pgoff_t start, pgoff_t end)
+{
+	switch (kvm->arch.vm_type) {
+	case KVM_X86_SW_PROTECTED_VM:
+		return __scramble_range(inode, start, end);
+	default:
+		return 0;
+	}
+}
+
 #endif
 
 int kvm_spec_ctrl_test_value(u64 value)

-- 
2.53.0.1018.g2bb0e51243-goog

