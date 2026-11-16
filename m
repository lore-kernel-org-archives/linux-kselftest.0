Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836425;
	b=BIgCIxeqAfk7P9LF8qlZ2dTNnFCbROGuQWnngSqxeyoz+YdgSBF1YmE3vofI1Gn1ubSL
	 D2U6OsN8TbXuDiOjp9ycb/V9UW4jRHNJ76ybZIcLcX8lBOjpCJ5mGHUtCfZKlLhobmPlq
	 a5v4LHY9Rr+TTOoWmO6JKb6jNSKeXG0x/Gu9x+kogcQWyXsfFyZlYnG1jMkD1KkR3j1Ob
	 b84AGrVDzi3kX6szWbH6iFGcAqP9E+B/81Wnp9LGb8vad5dUiYx2D/02dIFRT9SCMfmWR
	 wYwPVPA+Cp3E2yUa/2ySsAhqvQdTdS8Uwi4ZzAQeoIgzc+ckAsbDqmJJKtQkiItRHag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836425;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7ZuahbF6+z1TKgPocK6b1w/LNWgw/JvkC15VlenM0sg=;
	b=nfDrIaDG/uXw5kYQns8zcJfUeb3t+lWGiT5VhRWGFjNKUJWuTvIVwcs3GsVWDg+1FVP6
	 oYTA8H1Wg7ZvLrS8KmDu8Qrc+d4+QCF0jNMiTIqORD66sH7NaGkMGtUCJIk3PUvnoXr2V
	 i81U8UyTsdmoDTGQi+LbnVGBDpBwF9Kcc2Gfmc2YVkdA4+ZaYSk9dPHwwnN8sdSj8X/Yt
	 1ujUM+llLSC3eMDSuH9SjIv8DMaGepwJ87x/Z0GkqmRWoOU6keNkhOfjXh7WUogg8jexT
	 aOiUZd0YAI4YNXL4pUldKJ7b/A2yM9DBOG8Zs5K9jHgooeQfWNPTegQ8DU4vxszayhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=daCQz1Zh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D1606A329;
	Mon, 16 Nov 2026 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=daCQz1Zh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8055B1F000C4;
	Mon, 16 Nov 2026 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794836424;
	bh=7ZuahbF6+z1TKgPocK6b1w/LNWgw/JvkC15VlenM0sg=;
	h=From:To:Cc:Subject:Date;
	b=daCQz1ZhyWXtl44VERLjzwf4McgJ7N2+wucObuWTVBGvb3rE+VtwnoUq05dSgs42q
	 1LZSyEtpWtMTp71b7BeklLRhhuuUwIqs2mZggNQen0Ew07p5B1gk0cTr+zagFCAN9M
	 v69VqSUP8U86/2u44DncKRe2BjOVrkPNXnGxurTVOYsVFomucT6Pyk+1Dfyaquexel
	 kHDjwlalUXamnXa33LjHbumfNimFC4spzOSiCzA1uJn+jyoCiYr+cMboT4tQ/uFO1d
	 JSiqfaiFJgERJPTKDh/zU25XFfS/wFn/tKEn75KV3pVoj15wye93vm/YJke3oCo+px
	 6v6+5DB8GP/5Q==
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
Subject: [RFC PATCH 0/5] KHO map
Date: Mon, 16 Nov 2026 14:40:05 +0100
Message-ID: <20261116134013.1636689-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

Hi,

This series introduces the KHO map. It is a sparse map from integer keys
to u64 values. It is implemented as a radix tree of fixed depth.
Currently the tree depth is 6, so it can support keys up to 54 bits
wide.

The main user of the map is memfd. Currently memfd uses a vmalloc buffer
that has a pair of {index,pfn} to track the folios in the file. That
uses 16 bytes per page. The KHO map uses only 8 bytes per page with some
overhead. So for a 1 GiB memfd, it uses roughly half the memory.

In addition, it is a more versatile data structure. For example, it
allows for adding or removing pages from a memfd after preserve more
efficiently than the vmalloc array.

Post-LPC 2026, the plan is for KHO to maintain backwards compatibility
as much as possible. So this data structure allows the serialization
format to be more flexible to future changes. It can also be used by the
upcoming HugeTLB and guest_memfd preservation.

I have talked about this as "KHO xarray" before, but I think using
"xarray" is just going to confuse everyone since it isn't really a
xarray, and the API works a fair bit differently. So I renamed it to
"KHO map".

This series isn't complete yet, but it is in fairly good shape so I want
to share it to get some early feedback.

Things that are missing and planned in the future:

- Multi-index entry support: currently, while the map is very efficient
  with 4k folios, it is horribly inefficient with 2M folios. Each folio
  in the memfd takes up a full page to track. Multi-index entry support
  can fix this by tracking entries that cover a whole page in the
  previous level, similar to page tables.

- LUO versioning support: LUO versioning headers are still in
  discussion. This data structure should use them for future
  extensibility. I am mainly waiting for things to settle down there.

- Dynamic depth support: Currently the depth is static, so it can only
  support keys up to 54 bits wide. Adding support for multiple depth
  levels based on what the caller needs can improve efficiency and
  flexibility. I likely will only add support for this in the ABI and
  leave the actual implementation for later when we have a real use
  case.

This series is based on a couple of memfd patches I sent earlier [0][1].

[0] https://lore.kernel.org/kexec/20261103172251.2348370-1-pratyush@kernel.org/
[1] https://lore.kernel.org/kexec/20261110175855.2437084-1-pratyush@kernel.org/

Regards,
Pratyush Yadav

Pratyush Yadav (Google) (5):
  kho: add KHOSER_CLEAR_PTR()
  kho: build KHO objects into a single kho.o
  kho: add KHO map
  kho: test: add KHO map test
  mm/memfd_luo: use KHO map for tracking folios

 Documentation/core-api/kho/abi.rst     |   5 +
 Documentation/core-api/kho/index.rst   |  12 +
 include/linux/kho/abi/kexec_handover.h |   5 +
 include/linux/kho/abi/map.h            |  94 ++++
 include/linux/kho/abi/memfd.h          |  39 +-
 include/linux/kho_map.h                |  77 ++++
 kernel/liveupdate/Makefile             |  13 +-
 kernel/liveupdate/kho_map.c            | 514 ++++++++++++++++++++++
 lib/Kconfig.debug                      |   4 +
 lib/Makefile                           |   2 +-
 lib/test_kho_map.c                     | 575 +++++++++++++++++++++++++
 mm/memfd_luo.c                         | 292 ++++++-------
 tools/testing/selftests/kho/vmtest.sh  |   2 +
 13 files changed, 1449 insertions(+), 185 deletions(-)
 create mode 100644 include/linux/kho/abi/map.h
 create mode 100644 include/linux/kho_map.h
 create mode 100644 kernel/liveupdate/kho_map.c
 create mode 100644 lib/test_kho_map.c


base-commit: a0dc8eddbfdb6dd9c5c2b70eb66ab49cb1978425
prerequisite-patch-id: dc555295a2263ea9482ab393c50296636ab1e84f
prerequisite-patch-id: b0c8f9caeb6fd99a352692083e4d2e9255f13d02
prerequisite-patch-id: af8beaebdb1687c349732dc4a7773f7baa4a2c17
-- 
2.56.0.611.g1030f0b940-goog

