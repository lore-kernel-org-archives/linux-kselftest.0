Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B071238550B
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774310329; cv=none; b=kkE28JYQ9WhISGGTIaOojhJNgbZMhu3cWqF2LNohA0Te/lzaNh+34skZ66VCCp3zM6meXtu6tJZR0SABMk0XhF0aoVtYo/BugJvMdVe/Nnp5OaoG3ucsdMDMXNwlXa6zW0tjEyjZQW/HO3FzaEDwqjj+Vet9XZJZruNcVodGZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774310329; c=relaxed/simple;
	bh=nufixlrxKDA9RxLJCcKgJiD/jb0wnKOqEaMV67UGvLw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VpjMP8IOrDcNw3jYy4aLMphGchdwnZMJlmgbC9lLiUMS/N/TSGWLjMhZmDs+7G8IC5n0kLi6PbIIIRhfwXnjQ4Dt053xyJjBnXPOL42WMp4SDPjHrrQObr3TJt7ap3P/7IsWwKEy9ASQTqlK/AGIuLwu1oDcFKV44PCQ4Mmn5jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cmziZylm; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cmziZylm"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35a0b51eb23so703146a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 16:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774310326; x=1774915126; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z81MLxHKunKSpfd9G8Gazc1UStxzf4ZSRozQrfTx8r0=;
        b=cmziZylmbR22KBlTJw3YBAD0h4KEiYTt9tBnAaZDYK37JZj0W6BZyiNKKc9M3n7I5r
         /WHbloHMOkUlcII14sI7xSLS05UQBchd6XAG+EvifXbxp4mUSH6FGvpCeef4YkYJUtjT
         lgJx1Vm593wZZaOxauARkMjMgMWvaAwjiEiPfRBD8RtAmPrmSLv3TYRfkzFuLtyEPyIq
         FgAF0zDle4ohJPldBYPAibP7B1s1tv20mQ4QDNQPL/nazzyUHuF2urlQMN0iH7TbNIzb
         FDO9Pze8JlqjHWUpv2Xt+M5cVeJS7OQjjr+WZP4WOPcXhsYY1VNek09kjKM6dTUxKvdq
         ZSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774310326; x=1774915126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z81MLxHKunKSpfd9G8Gazc1UStxzf4ZSRozQrfTx8r0=;
        b=kHVc3aMEigsDqVIU4OGrneR/i2KgZNzTVnAeU9DkuwDZ8OKUTm5b3A21RsaHSeGJ33
         b61Qb3bgVJHIFSu+Ym6wQnXb4EVu52/Jd7+D9Wh+G5Dy9/OuQgkygKl2DszzP2Drq5Cj
         VQBB0RG8ABVdmvvrPpKxqAGhztLgjUOX7QOTQq4c315vUuX8zDAxlJXr3aHhdPR+lUD3
         YwokWgQQUTrkaqTHMvv31TUKrHB8OpuQzh/yH/SuTR6MgTRIUXPkNXS9KZSjX1jGgZHi
         EN7LB3jM5OalAujq8RO6qDqLGuRjeOnHOnOE41rVxV8iS+0XbWwNKZdYxnVWcIMGbc27
         WduQ==
X-Forwarded-Encrypted: i=1; AJvYcCV16SLrz4KcEhjQA3OZSJjH8f17IMD1eKEtWUoRi9irmQ3Jpm8tx+V+OBwgYQo94+jnHqgWnbN2E+5MeIOBByA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaSSpQS6wEl6+50qX316I0+6XoXQb4RwzN/I482hajlLYs0NSg
	tKAYhkFleup80mMhdhPSaBV3Q8hlej5ln4yZhSSdQVMZz75Py8VypcFS5IxSMygnl9e+I0/7anO
	ROVZi5ZBO3Xh7pw==
X-Received: from pjbfs13.prod.google.com ([2002:a17:90a:f28d:b0:359:979d:cee5])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5390:b0:35a:275c:4c27 with SMTP id 98e67ed59e1d1-35bd2bba27cmr10391028a91.2.1774310325767;
 Mon, 23 Mar 2026 16:58:45 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:57:57 +0000
In-Reply-To: <20260323235817.1960573-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Message-ID: <20260323235817.1960573-6-dmatlack@google.com>
Subject: [PATCH v3 05/24] docs: liveupdate: Add documentation for PCI
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Li RongQing <lirongqing@baidu.com>, Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Add documentation files for the PCI subsystem's participation in Live
Update, generated from the kernel-doc comments the code.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 Documentation/PCI/liveupdate.rst      | 23 +++++++++++++++++++++++
 Documentation/core-api/liveupdate.rst |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/PCI/liveupdate.rst

diff --git a/Documentation/PCI/liveupdate.rst b/Documentation/PCI/liveupdate.rst
new file mode 100644
index 000000000000..04c9b675e8df
--- /dev/null
+++ b/Documentation/PCI/liveupdate.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================
+PCI Support for Live Update
+===========================
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :doc: PCI Live Update
+
+PCI Preservation ABI
+====================
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :doc: PCI File-Lifecycle Bound (FLB) Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :internal:
+
+See Also
+========
+
+ * :doc:`/core-api/liveupdate`
+ * :doc:`/core-api/kho/index`
diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index 5a292d0f3706..d56a7760978a 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -70,3 +70,4 @@ See Also
 
 - :doc:`Live Update uAPI </userspace-api/liveupdate>`
 - :doc:`/core-api/kho/index`
+- :doc:`PCI </PCI/liveupdate>`
-- 
2.53.0.983.g0bb29b3bc5-goog

