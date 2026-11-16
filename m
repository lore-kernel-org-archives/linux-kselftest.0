Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836430;
	b=GPYkiw0xV4mkXy9Z6f1ObPHxZGQSXcYwe7n7v7/appzvxfWUZhvHyUoC3Iu6E99llFTR
	 ry64LxB0TFanI3C7F4wyjPEQ4954ReTKKJEFg08L3dlwvihr//EUiIwZTeZ/iZyCly9CK
	 GyuFt7X2yRfpTYMqanNCV2ZMH8QL4bZk+0D2P4nqYlqYgfeCszO4728iB1MUVhBmD3O2y
	 RkW9d0BaZLUvd51kxgR3M7IOzeEQPpQiNy4vSmU3+VhRUAtaFwCN/h4N2tVOKJJGJ2Hk0
	 Bz29hODOtdk3sSZlkIFh6cHd34iBqwZfV0D7n48W0TclYuPnzsabnjRmy3l70YvVLKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836430;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5x9NAjwyHTj7gs1TvGr/q/XVOTeFRW8sCriRzxuuRiQ=;
	b=ChRrfkHxQa4cIZ6pxrjB0SZJP24PicddsqwAf56coVELHIv+ES45VlWF81B/WxYDi8S8
	 HtReF4UaGoRlxnV6aeN18sEB0J88B87VVD/q3HXF5Ma/Wrv4dIWIB4RCslNCNJxEVtddN
	 e4fOdPjqmIsV1JYuAs6qgO0U+T48DQkMdShoKPP/2K10oQn2dlpKNz+fyOgdwoSH3eAPv
	 am/0HmoVEeNyo2IGgDeDcoONnuk5h/E636gocAVs7RpCf68W7IPDc2EqpoleKaADwUIr/
	 lLyLj3j7tYKfdgBSTEfcPIsBepSUQ3COGV003S0DxRJ0vBxqcnHXlQnki7W55P43yEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEpmx0Dr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4FB606A333;
	Mon, 16 Nov 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEpmx0Dr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063801F000C7;
	Mon, 16 Nov 2026 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794836430;
	bh=5x9NAjwyHTj7gs1TvGr/q/XVOTeFRW8sCriRzxuuRiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cEpmx0DrzH4kQYgsIkL897GpxshBlqigkorGhJo3MJ8+VZnRor36BETgWpSsikiZy
	 a+x8UHIWtb8HhghpobzEAAnBRXwpM7ExMD864dFUseejt6SABl9jVOVY8hbpsYksHt
	 OxKRMzN6vkTW17vcw/CXflhsSrldtO9M0BDqg1zI1vvNTJ5w/xJJrhEGAjXo3PAe+o
	 asCk8iN5LZmhUgc+SRGVQ7Ae10QCHG3Toi9Lx5Win+W98o2Z8z8bDZzU8jXRbTc6EN
	 Ro84Nmtnjda6fCuTuKS+Yt8KSnp7JkiMTeC/eySOLWugBM2N1lFSx7ak8+ldOAsIPZ
	 ehRje7JdM3o3A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tarun Sahu <tarunsahu@google.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 2/5] kho: build KHO objects into a single kho.o
Date: Mon, 16 Nov 2026 14:40:07 +0100
Message-ID: <20261116134013.1636689-3-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116134013.1636689-1-pratyush@kernel.org>
References: <20261116134013.1636689-1-pratyush@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

kho_block.o is part of the KHO infrastructure, but is currently built as
part of luo.o, which ties it to CONFIG_LIVEUPDATE.

Group all KHO objects into a composite kho.o, built for
CONFIG_KEXEC_HANDOVER, the same way the LUO objects are grouped into
luo.o. This also gives a single place to add new KHO objects.

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 kernel/liveupdate/Makefile | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index d9f4694625567..bc679905ce3f2 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -1,13 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
 
+kho-y :=								\
+		kexec_handover.o				\
+		kho_block.o
+
+kho-$(CONFIG_KEXEC_HANDOVER_DEBUGFS) += kexec_handover_debugfs.o
+
+obj-$(CONFIG_KEXEC_HANDOVER)		+= kho.o
+
 luo-y :=								\
-		kho_block.o						\
 		luo_core.o						\
 		luo_file.o						\
 		luo_flb.o						\
 		luo_session.o
 
-obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
-obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
-
 obj-$(CONFIG_LIVEUPDATE)		+= luo.o
-- 
2.56.0.611.g1030f0b940-goog

