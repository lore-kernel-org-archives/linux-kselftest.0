Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660688;
	b=VR7PjJ1zgis+onRS+NoKB+dUqfbZ2EoZRsTseJNvYLC6NBU3vbWkmBn97CJJe4M/cJWu
	 0Dzd0yRJ3tfm2kfmknv43gIp3ZgWfOzqKecpuFBSfIYqnJlSvTutwOl9YvCHQeF8kBoGE
	 u5KKIU4aniSsrt5/FZVBt1j1+FF+U2CtyWJFJPHS1ZvsmATC/sWLYRI3/4brnbcdY518I
	 0NIxsjIBx6Xe5aLGwqzOtlszN0w7Cwl7ldAMcSg6//9gD7+WmmhsNqtOG2AkXn/sTQGgn
	 eQkKWG5BKdfzVoSC283p07sXo7C3Y5sX5z6tgGXThcm5Cs3uK045k6MeMxsbLLPMqYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=25NTSzNfhX1jQ3caPzQMBs6/5zghNZP2uucR6qf413E=;
	b=Oe+2/D0+8s3XhI0hhbYxxvgxsi43DPz1OxyH9R8U3i8amfjLL/xHKksLLH9nADYwWhFC
	 yAlhiuC8F+dXzV+tQdeoHJ0/lEF5QjvXZ4WCN0+nwvqHkwUzbhYpisGD0VUDrUGVsswHm
	 8Z/vEVRI+5jQKM2Dnx4gd2YkwntawsJHlcWHIM6xAnGwm8x7O/GEDj/EeYoEp2E3pc29x
	 T35EgC45jfuYqXau9D0rL4pfWwfB2n6aYUikCfjNmU1pcBHnY/zcqUZN+NoQFIasi+S1B
	 VmBwq9nAxr7Iqxe1tMy2KH+2QYZvVCjovu+YCAIwEr6m399YMJEgGeShiFyID2+7X9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SRmKtloF;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C5606A330
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 23:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2C5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SRmKtloF
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so8529398c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 15:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793660687; x=1794265487; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=25NTSzNfhX1jQ3caPzQMBs6/5zghNZP2uucR6qf413E=;
        b=SRmKtloF4KMmR8bpuA+dPUpYKOOXYI2/eMmSFNSYNR6gypBzrhrqjHv8/SBp56rGYN
         zF0mKO9apHU2M9K+Oui9ldIuQFIwk8LOs2iJDPEeY5BZwTbI5KUKTi3DiFg37doH0Sj7
         GsBZG3C6/t1qNyIOwLVPnuRL2d/hEjcYH1qNTJ9c20GL1T6b3mb+opyDo2Wt6vtlx2nA
         PvFR6wnFbQ362VGDV+XQhPsY9ueV8Hae4MkBhxmgcmBS3O6r1CD9qtnHu77yzbYL2uBL
         I8Bl6jSm9se3f6iDgrVcHjxtotrqX9gAa06WWR5ytsAm5nWrs78+ZtOby/8yRSlBclqt
         0+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660687; x=1794265487;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25NTSzNfhX1jQ3caPzQMBs6/5zghNZP2uucR6qf413E=;
        b=J0CFONb+JbZNWGnvu2JFRULZd8e58dAg1UxygEgo3VzZAW6rqDu9S/SwEExF1ccLgW
         MSKIsR7EYCpreXXnOgk3mF4IhdJ8LSOjDRwIswEcwKxp3tOK6986XrvXQ2E/CDubIPjm
         HB6Gko+a9shxTcVuscRoG5IslpTuGAIm3RJj77BvxYZ5i/OhvHQfNNMhQAuFPc4Zu7K0
         ZB1QNwgQQCCIC61vAuzMO5El8yZoCXgm2WoEG+xF0d83iH6juIeuKUA9mEMCPPyxR+4t
         C2jlVu1tysayl1rFxv92BbdA+Zr514sGDJNdMQSNDpZYaiUGbVF2nDpM7mrPzOKbM2P3
         KTCA==
X-Forwarded-Encrypted: i=1; AKwUvBw4Qb6a8KiYyPPJxS8i2tunmq+T6WbZcScR4fcB8g8GLAeuVHBPp6fySd+i2kWYjI3d0fpraQMXCUD3ebJKZfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcV6EBEMjg/MH9vHSYUKE9+3Oblgs30YJAPvu1lWBtnOGaJT9L
	cJas20E8cwlepJJWrCc036XVesiWbyIxOHRrhC+4/tok72wbDETaQ/QF12+bPgwwFKROto3wes7
	U7XQJMW3X3RGi+mnOmdlpUp+S8w==
X-Received: from dlea5-n2.prod.google.com ([2002:a05:701b:4205:20b0:19d:8ab5:5be5])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:280c:b0:19a:bbe8:41a8 with SMTP id a92af1059eb24-1ac5c64cf83mr14633430c88.20.1793660686305;
 Mon, 02 Nov 2026 15:04:46 -0800 (PST)
Date: Mon,  2 Nov 2026 23:04:42 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102230445.3993629-1-almasrymina@google.com>
Subject: [PATCH v3 0/3] vfio/pci: fix huge_fault write handling and add selftest
From: Mina Almasry <almasrymina@google.com>
To: Peter Xu <peterx@redhat.com>, Alex Williamson <alex@shazbot.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, David Matlack <dmatlack@google.com>, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>
Content-Type: text/plain; charset="UTF-8"

Fix vfio_pci_vmf_insert_pfn() passing write=false to
vmf_insert_pfn_pmd() and vmf_insert_pfn_pud(), which causes an infinite
write page-fault loop when vma->vm_page_prot starts read-only (such as
after soft-dirty clearing via /proc/<pid>/clear_refs in CRIU or live
migration, or on arm64 without hardware DBM), and add a companion VFIO
PCI selftest covering both read-then-write upgrade and initial write
faults after clear_refs.

Changes in v3:
- Add Patch 2/3 introducing vfio_pci_find_mem_bar() in libvfio to locate
  a memory-backed BAR (or range within a BAR) from a table of known
  devices (starting with QEMU's pci-testdev 1b36:0005 BAR 2), per David
  Matlack.
- Update Patch 3/3 (bar_write_fault_after_clear_refs) to require a known
  memory-backed BAR >= SZ_2M via vfio_pci_find_mem_bar(), zap BAR
  mappings via PCI_COMMAND_MEMORY before both sub-tests instead of
  re-mmapping (addressing both David Matlack's and Sashiko's feedback),
  and leave PCI_COMMAND_MEMORY enabled afterward.
- Link to v2: https://lore.kernel.org/all/20261101062049.998160-1-almasrymina@google.com/

Changes in v2:
- Expand Patch 1/2 commit log with practical trigger scenarios (CRIU /
  clear_refs soft-dirty clearing and arm64 software dirty tracking) for
  stable backport evaluation, per Alex Williamson.
- Drop the Assisted-by tag from Patch 1/2.
- Add Patch 2/2 selftest in vfio_pci_device_test (bar_write_fault_after_clear_refs),
  as suggested by Alex Williamson.
- Link to v1: https://lore.kernel.org/all/20261024015540.538758-1-almasrymina@google.com/

Mina Almasry (3):
  vfio/pci: pass FAULT_FLAG_WRITE to vmf_insert_pfn_pmd/pud()
  vfio: selftests: Add vfio_pci_find_mem_bar() helper
  vfio: selftests: Test BAR write faults after clear_refs

 drivers/vfio/pci/vfio_pci_core.c              |  6 +-
 .../lib/include/libvfio/vfio_pci_device.h     | 10 +++
 .../selftests/vfio/lib/vfio_pci_device.c      | 67 +++++++++++++++++++
 .../selftests/vfio/vfio_pci_device_test.c     | 65 ++++++++++++++++++
 4 files changed, 146 insertions(+), 2 deletions(-)


base-commit: 076d7e989cb69f6ded7d60f2a080eb909930061b
-- 
2.56.0.385.gac671c819a-goog

