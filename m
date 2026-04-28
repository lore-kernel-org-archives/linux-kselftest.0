Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91202340A59;
	Tue, 28 Apr 2026 20:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409129; cv=none; b=mzQv/4UqE/eHvqC/UWeyj5xytY1kQxIxi97whdSq2I83ql4vnaVnKl/jt1+kLKUgOE6qu5ZVZC69BeU3x6zia6TkAPWVxqvqbvRQ6latD4YxxcK4QXzvgZsuTUX3WvLW2sqMhw/QnAyZHoGkMlej47goFSt+t/VPi5orkdFL/yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409129; c=relaxed/simple;
	bh=/Wvi9uebpP/hGBuUfLX+2dm76zvxNiYlkCrT9K3LAcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQ3Cdg4qII39nXrJmfsJ16U0HHRnyF5SxKcU1Y6D04MH/u+SWMBM7ceLB9GKwSzAYEN6uEneCO09umbIhLsDFD735obGuCvpB3ysMZwsIJwM2aNGiToXlcYDOtGOaTLH2ZIOCkQ3hzkiJtqlkMPWc4IZ0dp4U2XWPqhPKZGNrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fh9A3V+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fh9A3V+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66919C2BCAF;
	Tue, 28 Apr 2026 20:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409129;
	bh=/Wvi9uebpP/hGBuUfLX+2dm76zvxNiYlkCrT9K3LAcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fh9A3V+ypXR4GS5oRIKpQ2uyi2xl8u++OvGhWngaOa12qIEfDGSBqgWfoZi1hBof1
	 Yuuj0h94pGo39vk61AUVl1FOf789apcQAHiXFIYLZV3ZDw8iWNyOKDSUpKmB/MQD5Y
	 GTI9BjMV/vQaNnGP2xoz5xYmzvDVje+KZba7CwbxO/1xu16tkCK8Pc3RkU/y9HAYkO
	 Y1SfAhDpaM85FAdkwu/aYPSdaTvgz3HoZttOwzYZKV2uAbKSk0YfedSiCyZ46Xq89i
	 239DVDEXi6HKISnYp9CNKV4iNV4QHorwTTNf3P54RhKwyYbMgN4i/ajmgkISj6s3N6
	 1m54VeTDYLneg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 24/54] selftests/mm: hugepage_settings: use unsigned long in detect_hugetlb_page_size
Date: Tue, 28 Apr 2026 23:42:10 +0300
Message-ID: <20260428204240.1924129-25-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

... instead of size_t to avoid type mismatch in 32 and 64 bit builds.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugepage_settings.c | 2 +-
 tools/testing/selftests/mm/hugepage_settings.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index ebaa621c45c6..8f563315b1fc 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -399,7 +399,7 @@ bool thp_is_enabled(void)
 	return mode == 1 || mode == 3;
 }
 
-int detect_hugetlb_page_sizes(size_t sizes[], int max)
+int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
 {
 	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
 	int count = 0;
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index 320b97e768e8..9357d07e6c1b 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -90,7 +90,7 @@ bool thp_is_enabled(void);
 
 /* HugeTLB */
 
-int detect_hugetlb_page_sizes(size_t sizes[], int max);
+int detect_hugetlb_page_sizes(unsigned long sizes[], int max);
 unsigned long default_huge_page_size(void);
 unsigned long get_free_hugepages(void);
 
-- 
2.53.0

