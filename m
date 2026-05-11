Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D1443D515;
	Mon, 11 May 2026 16:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517218; cv=none; b=a6+/w85XcQhBYuBX+/LiEwGHXDeRpuEBAqnz6twm84bGkWR7YXiIjlR0Yw7fU1KIZeqs069TbapCtwuu5p/uz7u+0MGa5YwlcLddIzeZH9pLkbgzbnpMJ587BVev6cEiyMTNczgpJ/54H6sFoMLuHSZyjS/K6pwxhiNauJokVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517218; c=relaxed/simple;
	bh=RANINORwxgnBLj95qZshBsdS6l3lpxQnkreW9yzehS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwWCAYk92GdhL5MS4HUGK4O7Ki/zCcsJC1yWxBSxRAhTIq5buHF8Zl0zUikugkiy9OgwJT182GLeWC6S33F9VoxZU7xNRXA+V9qOQ2ykgtB+ZEPtAC/sV9XL/lN9HOuWSyndqiBzD80+cTouS+4gCxX04GioagpRvhCEOhBWeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRrFdUev; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRrFdUev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C686CC2BCF5;
	Mon, 11 May 2026 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517217;
	bh=RANINORwxgnBLj95qZshBsdS6l3lpxQnkreW9yzehS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IRrFdUevtR0hUVm7Kyd7LyyhUIMKoUj+bhCCB6cz+aE07Dhopi2C51DmzZ5NvdZZ7
	 58EN3Pe+DyCJx2yBtyY9A1qo8nf+I7ayRQaUDR/8CIYPm7rweIw65IW597a2TYlqnp
	 yNA+xCPHc0JcO0b803Rmba5/OC35UEOdcheFQEs0QsMMGzKdYvAMNiOQOhGTBWpoPd
	 G70KtAoNAt03ZpOGhZwNM9sqZdWQI0rXRfIC74zHTEL1Ilyw+FK2BybJ31FMNRmsUN
	 qv/EEL3MFBcTKsAL4wSqfJBT5JAvm8z1W/EV6AcQfhkRrTfcycrmNip8dWCvHUnqVO
	 8Xlr21MwiZ99w==
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
	Li Wang <li.wang@linux.dev>,
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
Subject: [PATCH v4 44/55] selftests/mm: hugetlb-vmemmap: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:28 +0300
Message-ID: <20260511162840.375890-45-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hugetlb-vmemmap test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-vmemmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
index af5786bebfd1..507df78a158d 100644
--- a/tools/testing/selftests/mm/hugetlb-vmemmap.c
+++ b/tools/testing/selftests/mm/hugetlb-vmemmap.c
@@ -97,6 +97,9 @@ int main(int argc, char **argv)
 	ksft_print_header();
 	ksft_set_plan(1);
 
+	if (!hugetlb_setup_default(1))
+		ksft_exit_skip("Not enough free huge pages\n");
+
 	pagesize  = psize();
 	maplength = default_huge_page_size();
 	if (!maplength)
-- 
2.53.0

