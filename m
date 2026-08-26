Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBCD3C10B9
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735964; cv=none; b=pakmM0Iq8kjVpgxQp/OtI5TSWITmHFoobH74Fae9t+K2AFPSNiFs9NjrC362RvAXm4muou45+my6n3DV0nfUSvn++KZ7HZTPSS2p5y4vHk3dC3DkqqVSIs+Qvw8RES2C3TJDVuVYrmTHL8JBqYZqB7cfITwKdELJgzhcD9tlCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735964; c=relaxed/simple;
	bh=aNpKmkec8/mPoC6VqfSFdL89LVrYPgyUp4I7FMfqF28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rJvZrhx9JgN1vLWIRfDP97y4vCadJp5ojKGz8pXN2H0noCQbGqGtSuTdlK/kgdbszB5b+4HZNRVtFus3gdexUsjHKTUz65FFi0cgGRr0P066MIxyhSm9e/+4R5XLjYICJGCCN7KuPjB/2FH/H3hGN6ffGYHxjJSG2ElGZpL6MpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OvUMdWSr; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OvUMdWSr"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee894b3d8so13678805ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735958; x=1788340758; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLqZOLBapggAgTh0v8ToB3YKqPPya91M3lrmoBKPLbM=;
        b=OvUMdWSrJxZAZziRu/qsQMKTWSNdMtvGBwpOvIg/PB/wV0gWFDV24TBTEmaifFaQVK
         xAVOu7uTIrVI5IjoXUYkGbV6zjvRP/MPZk/nH6Y5x6CPI1ZTHLY52BsEQwoLP9EnYM5g
         F6LReDdGzmKxqfFT5/4G9RJYZdB7Yd4nNcuEX/KhNN381bxgREA1XrE3Ezug8f2DRXTp
         isZnBA3JAE8ophsS9YcElutnuzEMGRvOVuULYtdUyefNf3i+oMXs67+3JL0OHSyg/Gzj
         nDxNsjPEeoLnHrhoz3o51iUlM8s4biiUuIA0fH3Ydq2MlqpN9U/GSDomDB+i1Pd9NhTi
         LSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735958; x=1788340758;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLqZOLBapggAgTh0v8ToB3YKqPPya91M3lrmoBKPLbM=;
        b=mDvXu3bPtQS2Ec0HFh9/mzDi+VVHHy6Z58Vu5SCyAuopYcsQ/Tk0E8x7/4mavYhwRD
         d7V6kWauV9BNCBHR3zAWzhIlhjrOeigLfJuALWF7WYiXclkmaweNd2EZ/TRaOKXuiqpC
         gRHfN1XqFdewYvZJDw8g6YHICjyfm8adltSDIupD9WPwC2TXYHj3g1ndhWqLATx+VdAT
         EvnYXpEbCaIiznbBXQ2IUSm3jF+Ig2F3Qf+bjHn8i2rL460ccNRBD+6IUioqPXHE+FCB
         9EvteWSHJY7MfqKGoC9Mk2aAu9py81MHG5+M/OkLxq5DiqfIfl8gxVqeVLndQs9xFewI
         d1rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcbaqhDXE8W+u69mDNSU7I2Ify+Z0OaZSMTmSrLaxbQnVDf2m3vVTtuJa6MLudM0sTwJvwS0UZIlu25k7M7H4=@vger.kernel.org
X-Gm-Message-State: AFuF++kU7+FKGC1SBc2N6sBU86sQb/VC4+Pvdi0e1zcpHCPhs0zARoDy
	KOkx25v6qETeLF0LIAMg/m9RLUieSBCCyNpXHjPBYfVNw+1kdOnUfPsrdq2UsN6KWJNdsnXz2IL
	JP2YWWxMwZn7BMsUgO2QbhCC6rw==
X-Received: from plkh12.prod.google.com ([2002:a17:903:19ec:b0:2d6:e427:73fc])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1a45:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d707a9fecbmr93482805ad.7.1787735957517;
 Wed, 26 Aug 2026 02:19:17 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:39 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=2853;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=KrfHutYDID9ZpS/QrQgxXNh2ivfNp+DkdslA3yVHWOg=; b=AvojirCrTsfwdIbnWA5buIntUCOjUNcNGy9Bkh8lUDQsgnH2HyYawXH79uUJxeFFALY27Ytjx
 awXjeiPTATiBTlEnjkf3iDdDkOOiMl8oaR9xK+2t16BzXlg+JCNL7Kl
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-41-0a15d8a799aa@google.com>
Subject: [PATCH v11 41/46] KVM: selftests: Provide common function to set
 memory attributes
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

From: Sean Christopherson <seanjc@google.com>

Introduce vm_mem_set_memory_attributes(), which handles setting of memory
attributes for a range of guest physical addresses, regardless of whether
the attributes should be set via guest_memfd or via the memory attributes
at the VM level.

Refactor existing vm_mem_set_{shared,private} functions to use the new
function. Opportunistically update the size parameter to use size_t instead
of u64.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 46 +++++++++++++++++++-------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 795c9eb311071..777fa3dbf88d6 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -454,18 +454,6 @@ static inline void vm_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
 	vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
 }
 
-static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
-				      u64 size)
-{
-	vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
-}
-
-static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
-				     u64 size)
-{
-	vm_set_memory_attributes(vm, gpa, size, 0);
-}
-
 static inline int __gmem_set_memory_attributes(int fd, u64 offset,
 					       size_t size, u64 attributes,
 					       u64 *error_offset)
@@ -532,6 +520,40 @@ static inline void gmem_set_shared(int fd, u64 offset, size_t size)
 	gmem_set_memory_attributes(fd, offset, size, 0);
 }
 
+static inline void vm_mem_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
+						size_t size, u64 attrs)
+{
+	if (kvm_has_gmem_attributes) {
+		gpa_t end = gpa + size;
+		off_t fd_offset;
+		gpa_t addr;
+		size_t len;
+		int fd;
+
+		for (addr = gpa; addr < end; addr += len) {
+			fd = kvm_gpa_to_guest_memfd(vm, addr, &fd_offset, &len);
+			len = min(end - addr, len);
+
+			gmem_set_memory_attributes(fd, fd_offset, len, attrs);
+		}
+	} else {
+		vm_set_memory_attributes(vm, gpa, size, attrs);
+	}
+}
+
+static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
+				      size_t size)
+{
+	vm_mem_set_memory_attributes(vm, gpa, size,
+				     KVM_MEMORY_ATTRIBUTE_PRIVATE);
+}
+
+static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
+				     size_t size)
+{
+	vm_mem_set_memory_attributes(vm, gpa, size, 0);
+}
+
 void vm_guest_mem_fallocate(struct kvm_vm *vm, gpa_t gpa, u64 size,
 			    bool punch_hole);
 

-- 
2.55.0.887.g758fc8c411-goog

