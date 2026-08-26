Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B513E315E
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735937; cv=none; b=KdFaN/YXoNJ9sHvF/A3GMsTcw2IEUoaMfu4d+PyZTvXemoFp8xACMQ2BFTDxX++7Kb1T30IPnDEk9NzwcfKhGT/xpYXyM6Ge/S2u7zF5xZ3jD8cIF4f48fuuayij5tn2/R2B6gI60/AXj83amgkgDL/dVLwVmDP2RCvpBlepWjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735937; c=relaxed/simple;
	bh=muKduSh1b24ScYepPCMs+OGpq6B9+q/ZPxcpNHD7eQU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fqeQEzxBXws1jU15IHQ+nduLvKL/TtWujzssG8ROt3bfbj4ckKJf3E+ne6XGLEewq6UHfzpOIa35XO7DzKTVTTWHgmbhGN0EtXDtxgTr/wrpg9mA3Mjc3NtYQ9BBLshyuKg20whRH99GzYNsj5m0DPF/SKRO63pZ9kO2fTRiCrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EY+k/wgB; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EY+k/wgB"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d70d8839f0so7447975ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 02:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735931; x=1788340731; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeMJJdODrGJdlu806vqL84QXzoIcKrTnV6sfhdG6lEs=;
        b=EY+k/wgBkd9t7cddLQGVDj4JLa0j/WZLJWy2pXdzKeK8Nt45mapZeXNvd5BGJJiG5g
         imfOdfeusy2OFlW/ABsm9urHfZvQCy2dvt+74fLEIyGInDIz0Hk23cF3pXUrUW13ImK6
         0qCFjZ7mPEQMaWto4kn7vCRM7rP9P9XlsOSbTVM6PJbmhYdakL4oDdpIcKjKdnyB5rzp
         fKME+LQLrxbj0GQl12JZo3bZfWlvjjqau2YbI2P8JGKTDsEJYgC8Tki3I3FGg/hMhYq2
         4+VM+Dj/4onBVXe5/+iDpLOliru6G4wczLVHC4uZa6QI1NP2r5DBPlSAM2ZnpHRyIdgD
         Lu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735931; x=1788340731;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeMJJdODrGJdlu806vqL84QXzoIcKrTnV6sfhdG6lEs=;
        b=mQbUqRhV+Q1AZxbicBBEsuuB7VvMzctjOmFhK/7ntjMFohr3OjwhBdIX05BlykLCjv
         ug6+mOXnHyB+kSrpRJWwcK3316Y6o6Qj7UaqiF44xPD/dkn8ZxO20x5tYhiMpUSS74i9
         dkn2GOdyUsZwkvqfrNmbIhAAvn5/avSJGEE35iSnPNCRv2r4j1m3g3KYA/qPoBGCJglI
         zGQbuTxsJOjDHEVt1SdFFz+BGm/0AgY0XW9IXEKHK4NaexbWfv/+QadPb5bdI7VNnkL1
         rQ8KxVwD6sNYGQUTIePNZ+R3AKU4pkBB1kFbqlYbzjBcgHxatR4IctjR11g/iKi7vghx
         tZwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWEwN25noE3fY6wJzgF6kM/RWB/C4LcGjh6aSfHb8G2KS045wPKdaKDdnXOihb1bWsdxE8Zyo1cdxsWwuBxQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mv8VJ9Yt+09Fr5i5IQB+28SKbqjvEJ2HHERF/yUGFlIzYDnffx
	t+ccgad2bGLav8xtLdxv3xQLTHQn7w+8vzXjASahirSRO7Rh7aI/8YlpWGX5iH1c4eH7cglfK1J
	0cqdlqKTxkXI9GrUiqHfTow/TzA==
X-Received: from plco20.prod.google.com ([2002:a17:902:e294:b0:2c9:b703:3bfb])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2341:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d707b4639cmr87037965ad.10.1787735930069;
 Wed, 26 Aug 2026 02:18:50 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:23 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=2916;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=7deP7h7QgDnwN6/9QKin5Nm8lfgB+57/3gsjOj+zwyw=; b=CZvlPH/OyUE2cOwFZHq3gx+or4V4GkEfPVHtR5IRBhyoJc09nGOpZZvAf2iumEeelzHT+XQgZ
 fFOTyta6nJOBd5QLNDNMDklfHWbkIyZvfWZ5tyanGQIZCv0kpN5zCS2
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-25-0a15d8a799aa@google.com>
Subject: [PATCH v11 25/46] KVM: selftests: Create gmem fd before "regular" fd
 when adding memslot
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

When adding a memslot associated with a guest_memfd instance, create/dup
the guest_memfd before creating the "normal" backing file.  This will allow
dup'ing the gmem fd as the normal fd when guest_memfd supports mmap(),
i.e. to make guest_memfd the _only_ backing source for the memslot.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 45 +++++++++++++++---------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9ddc047d5c275..3413d45e34faf 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1077,6 +1077,29 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	if (alignment > 1)
 		region->mmap_size += alignment;
 
+	if (flags & KVM_MEM_GUEST_MEMFD) {
+		if (guest_memfd < 0) {
+			u32 guest_memfd_flags = 0;
+
+			TEST_ASSERT(!guest_memfd_offset,
+				    "Offset must be zero when creating new guest_memfd");
+			guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
+		} else {
+			/*
+			 * Install a unique fd for each memslot so that the fd
+			 * can be closed when the region is deleted without
+			 * needing to track if the fd is owned by the framework
+			 * or by the caller.
+			 */
+			guest_memfd = kvm_dup(guest_memfd);
+		}
+
+		region->region.guest_memfd = guest_memfd;
+		region->region.guest_memfd_offset = guest_memfd_offset;
+	} else {
+		region->region.guest_memfd = -1;
+	}
+
 	region->fd = -1;
 	if (backing_src_is_shared(src_type))
 		region->fd = kvm_memfd_alloc(region->mmap_size,
@@ -1106,28 +1129,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 
 	region->backing_src_type = src_type;
 
-	if (flags & KVM_MEM_GUEST_MEMFD) {
-		if (guest_memfd < 0) {
-			u32 guest_memfd_flags = 0;
-			TEST_ASSERT(!guest_memfd_offset,
-				    "Offset must be zero when creating new guest_memfd");
-			guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
-		} else {
-			/*
-			 * Install a unique fd for each memslot so that the fd
-			 * can be closed when the region is deleted without
-			 * needing to track if the fd is owned by the framework
-			 * or by the caller.
-			 */
-			guest_memfd = kvm_dup(guest_memfd);
-		}
-
-		region->region.guest_memfd = guest_memfd;
-		region->region.guest_memfd_offset = guest_memfd_offset;
-	} else {
-		region->region.guest_memfd = -1;
-	}
-
 	region->unused_phy_pages = sparsebit_alloc();
 	if (vm_arch_has_protected_memory(vm))
 		region->protected_phy_pages = sparsebit_alloc();

-- 
2.55.0.887.g758fc8c411-goog

