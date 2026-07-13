Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2CC3EEAE9;
	Mon, 13 Jul 2026 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943323; cv=none; b=IL031m95jVEtCIZlSqxBplMKh/YncFUhVx032A0it/5iaDfDICFdI406MEEYv8+al/xZl2WYol+tSeVb+tkraCyUA5lP+MfLvyjl4rWXk/YSMYcRfLQOMjubgE4SVifM7o7TavXVa5/Eroq1XVDLxanwiZ2SN/768xjg97GtLR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943323; c=relaxed/simple;
	bh=6m0sGE2RD1Jzdr/pWFz6NTrp36wLFw+6shhzF/VGRDY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rI5XihHY9SuBlh1Nj6ZQWBNHNokimTi769bFihJRKpAppucNOdu6QNsJNOyDaYkQONjTuSh8kg9OFNqEjPNInHWEVS7H066cwNBZKhSsaHbkg5mmUlL0ovSe0xpTjqJeWAmGhDKPgH9pBcTcRQKS2Iloeo7I7oGFk7jcmhz3e0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=f1cjNPoi; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="f1cjNPoi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=h+ewRGwRCC5f80UYTJvZsM+OSAaYeVd+91q2pbM6EL8=; b=f1cjNPoiNOYteBMDkMB+7j4YaX
	RviPxa+xWHKln17FzBOhhYXqWHOCZH7cXydmBHTEZmXxtF1EhzTj8FiHIEGKx6fDvMzvoX0IDlIHF
	caeBMjAdLKBY7vnwoPQeQ5nJs86dk83uDk6efM9KkhGcqcv67KFalEqcJPbc4Ot96BSJXFpy5/pyV
	DKd7nUcT56uRQOM2YERUyvSzEiNrWqISOR+8Xl+ZSUX3ytAEIeKbu4XNh9ufVbzKZC7he4RlFdTCx
	eZvZik5E1vuMANBEpjx9UuSHSDwvTw3zI3CnwLCqCx9x52FILOuy10yEURygM+xBvh3MP4wxksI3u
	M4xFACOQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wjF96-001Tib-33;
	Mon, 13 Jul 2026 11:48:25 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/4] mm: kmemleak: reduce transient false positives by
 confirming leaks
Date: Mon, 13 Jul 2026 04:48:03 -0700
Message-Id: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHTQVGoC/x3MWwqAIBAF0K0M9zuhBxi4lYiYbKyBsNCIQNp70
 FnAKciSVDIcFSS5NesR4aipCH7juIrRBY7Q1q2t+6Yzni/eNU7ndZhlZh+snaULjIpwJgn6/Ns
 wvu8HWfvr7V0AAAA=
X-Change-ID: 20260713-catalin_pto-dbacf66be3fa
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856; i=leitao@debian.org;
 h=from:subject:message-id; bh=6m0sGE2RD1Jzdr/pWFz6NTrp36wLFw+6shhzF/VGRDY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqVNCD4ZdAePawtg7VFuLqpysw6wnTe3c8T79Pi
 IxLUJCR7AqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCalTQgwAKCRA1o5Of/Hh3
 bSzbD/93Jr74YAW1SERbtRFp9A4hsP+JaCLfhTQJmzuI91RIOjGm26p3wu/yg23uwGf3BdWdl+g
 HKb/xjTyk6syZUlmGnkx3qFOrFnS8reOIWRm4tsAUjnbsYVhu3DO3doYDTrRIdDITFT1HyOPF2i
 ZXJSXhRtG61AQIWxdhabJnPv9aaNfYUvtx6Ktq0x7oDL6tDL8uaZozRHEaBgQm0ydyhe0VL904j
 uEgGL25/iVLwyzgwvmo2u2J4RVwijPG1sKw4yIOZkSsyCLiJNbE8RhQk2Q2PZZQuow9WpZ5rV8F
 cgDnXqmOUWSX1Fojftf+G1ts/LC3+ZtzaOLs/ZvjgKmY9/i7We87yGpJk6pEKohdwZ4dZp+hzsS
 KfA/ZpfkTQFuWjyFjT2/js8xwBqWv1SNwTiMPmS8qqsnAdzDG/YXTdVdUofkcYyTjazc+rRLdzc
 87T/Hfie08URotG2WoJjm3EUwkPSh6bJL70vk27Jj7Lh/OORX1FpJwGTeL7SeinGd8jSocIZIDV
 DlFN+uf3YtpSZQ3XLhaKu2ZKV/vGviJaiIPn0g1fbFq8GOMJA9rxxUMgKK+WBXXkbSon5EVfWMr
 eMidKO4e7D8ULHtdI1s+j0x4NrdQ33l8AzKS9XiY0yCY7S+OS4A32XBpKy1TXyPESuCyNdmzTFi
 vcGu4LnSRsUvz7A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

This series combines two kmemleak enhancements that were originally submitted
separately but both required rebasing after commit 79c37ae3733e9 ("mm/kmemleak:
fix checksum computation for per-cpu objects").

The first feature introduces a second scan to confirm suspected leaks:

        https://lore.kernel.org/all/20260709173347.689607-1-catalin.marinas@arm.com/

The second feature adds a module parameter controlling the minimum number of
consecutive unreferenced scans before a leak is reported, as discussed in:

        https://lore.kernel.org/all/20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org/

Changes from v1:
Now that commit 79c37ae3733e9 is upstream, the selftest includes an additional
priming phase scan as requested by Catalin.

Additionally, I've factored out the leak-detection conditional into a helper
function to be more digestible for the reader's eye.

This 4-patch series resolves all outstanding kmemleak issues I've been
tracking.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (3):
      mm: kmemleak: report leaks only after N consecutive unreferenced scans
      mm: kmemleak: factor leak confirmation into a helper
      selftests: mm: test kmemleak's N-consecutive-scan leak confirmation

Catalin Marinas (1):
      mm: kmemleak: confirm suspected leaks with a second scan

 Documentation/dev-tools/kmemleak.rst               |   8 ++
 mm/kmemleak.c                                      |  90 +++++++++++++-
 tools/testing/selftests/mm/Makefile                |   1 +
 .../testing/selftests/mm/ksft_kmemleak_confirm.sh  | 132 +++++++++++++++++++++
 4 files changed, 225 insertions(+), 6 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260713-catalin_pto-dbacf66be3fa

Best regards,
--  
Breno Leitao <leitao@debian.org>

