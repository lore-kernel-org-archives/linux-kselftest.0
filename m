Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514051;
	b=NoekLJUPTaVbVpGe8W7PmRliTqFXeugYNWjuVGQxYknfoz7XVImlb89Efy0mCXD9odzN
	 txFsF+EvPcxwxnCfzfjsNplZjRJIJl259e1Mf9gmCUSvnZuIX8f8eZPhXF6evfDZ33eoV
	 +9u3ER78kSzAkrZ3mwMi4WuUINuKrzv5pDYVewhar/Z8px9e6+SHYm8VGxyLCh0zO+1b5
	 cY4+H+q8PFYyKi1MHw5QtuTe0+UyGdRYAATVWIKKN2/nCFGy+n5qofEe+yRJmb42RQiWA
	 S6bi+ZqXFsqhp0plvD2dHJNmcNUItQPi35Mo5Ud4n45K+5NPBmR2t+dHKU1cs9a0THg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=oaPJYRLQOnUXY3GkH7jTJTAE7Wl3NuOEbtsp4Z/SUgc=;
	b=S0Y1ShStaGFNCH2RKq8TZW0cN59y6wMhT/kyDz8V+PspkiEnJyArQdbbvtlp3Whn05t6
	 xUxeyJip+GbX0n2CaAmyXcWGgSK6pG/lMzYjER84m83Ye9xI+HJHvbZFWDVMzBwZBGMKF
	 +X+JfyVigcu2o05j9rJ5D0HpYfXv8jFJTSfTrapnJqeZHeDe4yMf7drX7go9TmaYTeKAr
	 5AkMAs9QLr95PQ98eXcigetZOMH7D1ImfsgnU1EvNEu2Nq91hgEQWTcoI6nQ3DxSutBXE
	 S4XB/JDC12PB73mgTIwsB3F6PcUUwWSJv347bjTt5HOjCgz6iQyS3KlrPt00hRDbyxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BuQzGhTZ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D74606A326
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 06:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D74606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BuQzGhTZ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so2775330eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793514050; x=1794118850; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaPJYRLQOnUXY3GkH7jTJTAE7Wl3NuOEbtsp4Z/SUgc=;
        b=BuQzGhTZI+KMKd3AqJd6tbk+GDDIKP+orSREe1lCsOFmj8e48N8Y9Bekm8LL28stEz
         jyQeNR07S3Tvvmxp324XlNxfmn109Gi4srlgUu5TBQ2bDryrhHvqUP7b2nChw5lHDEY9
         5Sq2eYfcmNn5nxp2/mdG2JmSQIrl8BdnDlchxIkfDjUS3ZFerQt+qN+cBONcQea9/eiU
         Lm82dTsu20HN1G6dPMDjADLzFt5QDU7yVavVfKVf6W218D6DhEbpryzM4KHZG7c7baOi
         MVXZYNGCSwC/evPXhieRFIxV1vOhKLQxEvfuavDyvg3oJ3wxqYWlHn5DTRCKmPsc67Jc
         YwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514050; x=1794118850;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaPJYRLQOnUXY3GkH7jTJTAE7Wl3NuOEbtsp4Z/SUgc=;
        b=J/nExXMlQba+RNCktB0/A12BHFPf6ATrVaYPjSLxEUvCuj7k2dvXn+/9OwYcKSD1Z3
         WVSc5W/akt6I+VqsIOBUOHp6fDAhCYs3MG9VCJH5fUM5fOCw/TUXEO/JpKIDPqDmonRX
         ba4Y4TU8u5gq/hfdpSgsmIMBau2vSnNcEeDPBTnU2HrbKgeaMgfYW4itaEmcArhMcg5f
         gZKZnf60iSvu0FMdJjvjtQI9XkwVuiMPTjpc1hknyZ3FVvm4Am8NOebiSzbmDcfVmFfo
         h+r6lj7oe6W38Hgj0soB4GFq3zWPS/le2qxZZUhQ6E4Z7F9acb5o7OI2lRQXzEEeGRzL
         5FXw==
X-Forwarded-Encrypted: i=1; AKwUvBwodGKEfcJEyQCGxclstY68lSsuzwUbP6PiHxq64K6Yt2K8TcrtxCSdFWY+z7y4/MIM469/dyt198cWnMQGb+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoIGo14NfaG9IfRkrfQ/vYbQEwlIyPitwBYDI2duo+AIw23fmC
	CMjuMdA6ROZJIE9RK6uZSG+nbxmS1UmUu0Rszx6iFoSVC2UphuB0YdRia4S5ejVcAS5f4t+Va3p
	jnqjh0ufxnHpfFUJ9stOGsRvwrQ==
X-Received: from dybsq12.prod.google.com ([2002:a05:7301:710c:b0:366:233a:49c7])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4715:b0:369:f17d:efb with SMTP id 5a478bee46e88-36a3002dfe5mr13291921eec.10.1793514049730;
 Sat, 31 Oct 2026 23:20:49 -0700 (PDT)
Date: Sun,  1 Nov 2026 06:20:47 +0000
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
Message-ID: <20261101062049.998160-1-almasrymina@google.com>
Subject: [PATCH v2 0/2] vfio/pci: fix huge_fault write handling and add selftest
From: Mina Almasry <almasrymina@google.com>
To: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, David Matlack <dmatlack@google.com>, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"

Fix vfio_pci_vmf_insert_pfn() passing write=false to
vmf_insert_pfn_pmd() and vmf_insert_pfn_pud(), which causes an infinite
write page-fault loop when vma->vm_page_prot starts read-only (such as
after soft-dirty clearing via /proc/<pid>/clear_refs in CRIU or live
migration, or on arm64 without hardware DBM), and add a companion VFIO
PCI selftest covering both read-then-write upgrade and initial write
faults after clear_refs.

Changes in v2:
- Expand Patch 1/2 commit log with practical trigger scenarios (CRIU /
  clear_refs soft-dirty clearing and arm64 software dirty tracking) for
  stable backport evaluation, per Alex Williamson.
- Drop the Assisted-by tag from Patch 1/2.
- Add Patch 2/2 selftest in vfio_pci_device_test (bar_write_fault_after_clear_refs),
  as suggested by Alex Williamson.
- Link to v1: https://lore.kernel.org/all/20261024015540.538758-1-almasrymina@google.com/

Mina Almasry (2):
  vfio/pci: pass FAULT_FLAG_WRITE to vmf_insert_pfn_pmd/pud()
  vfio: selftests: Test BAR write faults after clear_refs

 drivers/vfio/pci/vfio_pci_core.c              |  6 +-
 .../selftests/vfio/vfio_pci_device_test.c     | 83 +++++++++++++++++++
 2 files changed, 87 insertions(+), 2 deletions(-)


base-commit: 076d7e989cb69f6ded7d60f2a080eb909930061b
-- 
2.56.0.385.gac671c819a-goog

