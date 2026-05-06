Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648334657FA;
	Wed,  6 May 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072331; cv=none; b=rNBIqLYp2AlZzARs62euHpxbcI73j67l4uLeUSEMwCTKkOvkhvJDBZzJNuq+lCfCb7W4SlUL+MooOegpBl4GVGQQfWhAGmOXZeXJErm/1Mcfy2RdcizTBTi2tdfU8c3eXGmSmpC37vMWp1e1QfiEFv/fyCmEkhoL6qwnsNXZOSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072331; c=relaxed/simple;
	bh=3Ctk1ueBYM7eZhy37SI20jpItOb6u/qilgxPdOBa4Q0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ofsf/GgerCxXvytOTIgXCUdLhAWAt9pk+56WewVFlfSbQuBXKX2f42RR6nFvfLESXjbXI34AZwgjIrDnXTzv0gMrfBbgT5Sq5X2slQbEvCvu+zYhaP8+qgR2x3PLxz9Oc0V9aKVCfPL+b6ewCnxx+Zm53uM62bzi86si51vVnII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=OvaRCQgY; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="OvaRCQgY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=f/NoTfhD2VkFXRGNeCaBOGvpRgVDghkOR86RNNVoqOA=; b=OvaRCQgYZdQUXHB77xJV8VAyy6
	rnK2gA04PqR8vUt464ypD7eVVA28VxTeZJS0ZRJb6ypW/Lewfoz8jjcLrozcn1wcLKDNDj65gGHWz
	OfakcvXlE2OygfiDR6Kn5Lr349rV6U+0iNNnt7i/xEnFkEmzgYw7gF8SDWkcPv1R2RPJTCPbaTEfJ
	D/NR2OJrp0tiGOjMgr4k/g+ifzoSkI88kgcPaw319x4QmoXnzUm3bmLqw0q2730qxc/mf6yNUhJDl
	KJOz9BpPF/Af0lxvrofYTNSk0UXwGSPdT1LxWh86zDTXIE8lX/jdMuKUBEFwA8XQXhSuqwHjiGWR3
	9vehShZg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wKbpl-003bWv-0r;
	Wed, 06 May 2026 12:58:38 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v3 0/2] mm/kmemleak: dedupe verbose scan output
Date: Wed, 06 May 2026 05:58:23 -0700
Message-Id: <20260506-kmemleak_dedup-v3-0-2d36aafc34da@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPA6+2kC/2XN2Q6CMBCF4Vdp5pqaUqAKV76HMabLABVZ0gLRE
 N7dFGPicjnJ+b9ZwKOz6KEgCzicrbd9BwVJIgK6ll2F1BooCHDGBUs5o02L7Q1lczFopoEqxCw
 tSyky3ENEYHBY2vsGns6v20/qinoMSljU1o+9e2wf5zjs3nj8i88xZVRkmMRaaFMyfTSorOx2v
 asg6DP/7NO/nlNGDwqlSHPFZc6/+nVdnw7cRUn/AAAA
X-Change-ID: 20260420-kmemleak_dedup-bee54ffa65e7
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3351; i=leitao@debian.org;
 h=from:subject:message-id; bh=3Ctk1ueBYM7eZhy37SI20jpItOb6u/qilgxPdOBa4Q0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp+zr4eoaPHEJLh2XpEKHZWn0rDN2L2vJTfk/5V
 Xjns1o99YuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCafs6+AAKCRA1o5Of/Hh3
 bb72EACm6vbCSrmwesUK2Eeje66wKXaGTquJVs3/PFpqiRJnRZkP7X1/LX7G/+EVfl9U3XHbd87
 uG74LeMadn1j7O6qx1YXhNa2F75wL/grYB0g4ADzymlDZO3a4bKApJAE7Azff9gYqJG6BLx1aTe
 4xLk6dwY+Vaj25S9OPF6q9ivvPTMuzrhVBwviLtKdv+W99eWu8qs6hFIYwZKBHUAvD2Mtvm3Ezv
 8ktDq88qxtQBJrcjDCdCkBu3/OudQlHSqJEleROHx6KskOK5dt4bzgp9NYg6fQlzyJFgmcdAi3z
 syrYaciQTajHWHPfQXNfGuyjWErVvhds4TV+ibnh4DHfkaXaTWRFwv5V9KPUGKzGKyeB7bpdAMN
 NsSfjGJTvgpw9rmE72Dnrc7TULhBAcS0bz2FaHPNTAL/9psgThstzH8INjwA7xk7rjxTKzfrJVh
 FSxI/lb4AmixfIOZqMeu5oNFmdpPWizuL8vdKE3tewI/r67lMCBqGvs4w6nwK5vTkziiz55GxQ+
 R1zzgnJG62JGikD+4Db/RSKOKoshVLO/ADLhF2DwqmT6wukW9FLOhYzeMmqjhxUt/hwqiTPb4q+
 Eyd8HbPaF8yD1SD9rKdnqf1xusjdkeKq5FNSwNEcz1LU5lONCwMXm0bFX66SW+c7xbb/cL/PsSu
 RjblrHyeJ2pIukQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

In this version, I am not touching the kernel code, but, just fixing
the selftest, as sashiko reported some issues, and I am addressing them
in here.

https://sashiko.dev/#/patchset/20260424-kmemleak_dedup-v2-0-8bea649b2a92%40debian.org

NOTE: Additional testing has revealed that lockdep detects a potential lock
inversion issue on kmemleak and legacy console.

The problem occurs because the function holds &object->lock (a raw spinlock)
while invoking printk to report the leak. This printk requires the legacy
console_owner lock, which remains in active use despite the ongoing transition
to the nbcon framework.

Concurrently, console drivers such as hvc (hypervisor virtual console) acquire
the console_owner lock and may subsequently free memory. This kfree() operation
calls into kmemleak's __delete_object(), which in turn acquires object->lock.

Although these code paths hold locks from different object instances, lockdep
operates on lock classes rather than individual instances. Since all
kmemleak_object->lock instances belong to the same lock class, lockdep
identifies this as a circular dependency, even though the actual deadlock
scenario cannot occur in practice (?!).

This problem was not introduced by this patchset/selftest, but, it is exposing
it. I plan to solve it once this patchset is done.

Breno Leitao (2):
  mm/kmemleak: dedupe verbose scan output by allocation backtrace
  selftests/mm: add kmemleak verbose dedup test

mm/kmemleak.c                                 | 102 +++++++++++++++++-
 .../selftests/mm/test_kmemleak_dedup.sh       |  78 ++++++++++++++
 2 files changed, 175 insertions(+), 5 deletions(-)
 create mode 100755 tools/testing/selftests/mm/test_kmemleak_dedup.sh
-- 
2.52.0

Signed-off-by: Breno Leitao <leitao@debian.org>

---
Changes in v3:
 - No changes to the first patch (Kernel changes). All changes below are
   for the selftest.
 - Pre-cleanup before modprobe — rmmod "$MODULE" 2>/dev/null added before
   modprobe so a stale load doesn't cause modprobe to be a no-op.
 - dmesg -C between the two scans — isolates printed count to the second
   (reporting) scan only.
- Link to v2: https://patch.msgid.link/20260424-kmemleak_dedup-v2-0-8bea649b2a92@debian.org

Changes in v2:
- Drop struct kmemleak_dedup_entry and its kmalloc. (Catalin)
- Handle trace_handle == 0 instead of dropping it.
- Skip hex dump for coalesced entries (dup_count > 1) — bytes would differ
  across objects sharing a trace anyway, and it removes the only
  object->pointer read left in the deferred path.
- Counter narrowed from unsigned long count to unsigned int dup_count.
- Link to v1: https://patch.msgid.link/20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org

---
Breno Leitao (2):
      mm/kmemleak: dedupe verbose scan output by allocation backtrace
      selftests/mm: add kmemleak verbose dedup test

 mm/kmemleak.c                                     | 148 ++++++++++++++-
 tools/testing/selftests/mm/Makefile               |   1 +
 tools/testing/selftests/mm/ksft_kmemleak_dedup.sh | 222 ++++++++++++++++++++++
 3 files changed, 363 insertions(+), 8 deletions(-)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260420-kmemleak_dedup-bee54ffa65e7

Best regards,
--  
Breno Leitao <leitao@debian.org>

