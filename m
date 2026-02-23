Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088C1A92E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 07:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771830293; cv=none; b=MSStMQuX7+VlRDlzTDkByCtQ4p3aX1jzrJq+rdVn8gMPoyClKL3ckuvPgTfGpHaqSl+jbi61npyi3HC6bnTs1OJRDGR1D+3KQBdHgzzrPEn6daqU6ZO12YG+dXgl2a52AC3yB3OzCQqljBvxrhDBVn6trj7HVOAOiLiaMsHz+Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771830293; c=relaxed/simple;
	bh=FZRWd7OFFr94c+sVebCFrm+qPTKtpygBGZ1I5UbUj8Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cCLvO5Zklk4csesxJLu1k9P2tzilpozMKbkehRg+Ni8/o3qNZY5MgAVe3bATrDbLrAX1nM4RA4s09ayhH3ct9fxXKNDcS8QmmWDG1RdiRGhl4XTqxv0MV6bdRQuxJWp2kvDr4gR7aEm3B71zSkvQEHTuyfUdYPoVKMqlEQz05hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pWvhd9qN; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pWvhd9qN"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-824ae2cac9dso1806896b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 23:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771830290; x=1772435090; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4ACR+5opE2f1Qb7L32b78WaUJ2hKK306WtP3f4Mrpeg=;
        b=pWvhd9qNuvzQ572O9PaGrTJAuMhFcr6E10rwLG4X/ylZYq3ljR25JK7vOQcihNQHRd
         4AsDElBydnpRqPKT6jkSuLoVfEEmlstEMBucbrUaU5j+KwBzSHTf98tNWa9BLQ+Oa1fv
         QfkP3gMJkqV1GZvKPilJgjltY5ckCG24iPoHV5LwnVr48v3jK5c7wPybdYT1LwXdDim6
         8AYrqiR6/MrGjPy3KCyZ6nx3gehYeR2BBY6emDi6+l61gFKXOmZaYmY8JaVBf9GimD9L
         ldRricmNp0lRhZvWNB/6oq21iCyl377gGgPNJbynpG1muZFAq1Bf1XTu0CiEMLovJTqL
         7bdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771830290; x=1772435090;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ACR+5opE2f1Qb7L32b78WaUJ2hKK306WtP3f4Mrpeg=;
        b=fknt71zjEFDOQ/O8V48UYstF8C4i3uRDcOoavnoWK8pJB1p8LAhd2yfeklls3L8YeB
         7ra8sYHwzv/Zn8mtcrb+A6NyhEO/m2R+p7JZehctoeA67Q+ypoQ6zUTb537VmELv1rat
         WlqAWiAZ4zvbtXCzO00R3vrgOXX2PnrN4bDuCdywUgEMQdOUTbZza6HJ3OiiEAqfUhwy
         pgac6krR+BmWlNSaO4HZCGICjQi9HzqzTX7zoY5Q2wvTD7uq+6SLDSpUJqz29YbOMyj4
         YlosZ1Wq6UIhYqvSKDzPP8Mh4wdB+ZqgQu+jWRl06yma5eQVQ83J0aC6mYDEcPYMywu1
         vHLg==
X-Forwarded-Encrypted: i=1; AJvYcCUlUmk2hju4prBmmxjQ++lIqjJ/lqwiBYYn1pPOjCDT9yckRPYV8RpDN2W+JPBDxvfriMTX7BxlQMzSAH6MoeY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyip0ymtbikR+UPfgicOlDLjW7GX5GpJEMcfIjLe7k7b57iM8M9
	uW1FOUmxyznh0gEiNUjCdy/j5Sfa3JnYLfHJhPLx1hUvJTmqitMnDK11CL+VPD3MyezrQJ7XN2a
	BBwVA5N2cxTMhZF5YNljoSvYSdA==
X-Received: from pfbgr10.prod.google.com ([2002:a05:6a00:4d0a:b0:7b8:ac8f:27c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2ea8:b0:823:f04:e89b with SMTP id d2e1a72fcca58-826daa5de1cmr5219573b3a.48.1771830290192;
 Sun, 22 Feb 2026 23:04:50 -0800 (PST)
Date: Mon, 23 Feb 2026 07:04:33 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Message-ID: <cover.1771826352.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 00/10] guest_memfd: Track amount of memory allocated on inode
From: Ackerley Tng <ackerleytng@google.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, willy@infradead.org, pbonzini@redhat.com, shuah@kernel.org, 
	ackerleytng@google.com, seanjc@google.com, shivankg@amd.com, 
	rick.p.edgecombe@intel.com, yan.y.zhao@intel.com, rientjes@google.com, 
	fvdl@google.com, jthoughton@google.com, vannapurve@google.com, 
	pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com, 
	tabba@google.com, michael.roth@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Currently, guest_memfd doesn't update inode's i_blocks or i_bytes at
all. Hence, st_blocks in the struct populated by a userspace fstat()
call on a guest_memfd will always be 0. This patch series makes
guest_memfd track the amount of memory allocated on an inode, which
allows fstat() to accurately report that on requests from userspace.

The inode's i_blocks and i_bytes fields are updated when the folio is
associated or disassociated from the guest_memfd inode, which are at
allocation and truncation times respectively.

To update inode fields at truncation time, this series implements a
custom truncation function for guest_memfd. An alternative would be to
update truncate_inode_pages_range() to return the number of bytes
truncated or add/use some hook.

Implementing a custom truncation function was chosen to provide
flexibility for handling truncations in future when guest_memfd
supports sources of pages other than the buddy allocator. This
approach of a custom truncation function also aligns with shmem, which
has a custom shmem_truncate_range().

To update inode fields at allocation time, kvm_gmem_get_folio() is
simply augmented such that when a folio is added to the filemap, the
size of the folio is updated into inode fields.

The second patch, to use filemap_alloc_folio() during allocation of
guest_memfd folios, was written as a debugging step to resolve a bug
found by syzbot [1], but turned out to not be the fix. I include it
here because it cleans up the allocation process and provides a nice
foundation for updating inode fields during allocations.

The first patch was separately submitted [2], and provided here since
it is a prerequisite simplication before application of the second
patch.

[1] https://lore.kernel.org/all/29c347bde68ec027259654e8e85371307edf7058.1770148108.git.ackerleytng@google.com/
[2] https://lore.kernel.org/all/20260129172646.2361462-1-ackerleytng@google.com/

Ackerley Tng (10):
  KVM: guest_memfd: Don't set FGP_ACCESSED when getting folios
  KVM: guest_memfd: Directly allocate folios with filemap_alloc_folio()
  mm: truncate: Expose preparation steps for
    truncate_inode_pages_final()
  KVM: guest_memfd: Implement evict_inode for guest_memfd
  mm: Export unmap_mapping_folio() for KVM
  mm: filemap: Export filemap_remove_folio()
  KVM: guest_memfd: Implement custom truncation function
  KVM: guest_memfd: Track amount of memory allocated on inode
  KVM: selftests: Wrap fstat() to assert success
  KVM: selftests: Test that st_blocks is updated on allocation

 include/linux/mm.h                            |   3 +
 mm/filemap.c                                  |   2 +
 mm/internal.h                                 |   2 -
 mm/memory.c                                   |   2 +
 mm/truncate.c                                 |  21 +++-
 .../testing/selftests/kvm/guest_memfd_test.c  |  32 +++--
 .../selftests/kvm/include/kvm_syscalls.h      |   2 +
 virt/kvm/guest_memfd.c                        | 116 +++++++++++++++---
 8 files changed, 149 insertions(+), 31 deletions(-)


base-commit: b1195183ed42f1522fae3fe44ebee3af437aa000
--
2.53.0.345.g96ddfc5eaa-goog
