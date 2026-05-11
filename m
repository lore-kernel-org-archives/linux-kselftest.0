Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408543CD8BB;
	Mon, 11 May 2026 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517270; cv=none; b=rvQAuNFJJtZnf1xMN3DMRcAsYdhmEB9wkQbSUCVlDOVe9xxL3d3nZEoXzcZc0L3IOqvP+ky9qBoqnRj0WzyWJEnA/gxj7wuaeNUp/235P9bLljYF7B1DOE0mqem4LvJ0xe5KHuGOF5dc728bcdNxv3KrXW6Dum8qCnou46kdOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517270; c=relaxed/simple;
	bh=7xaEO0jVC5oa/tRtrz6y7cMEa/ulRsn9VdSuUhVaWnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtgxb44b6DIj99p+y0l9OF1VjZ1zzKeZqrnrt3f1jALwBNXco+pUxsFmK8Vy0CK6fY7JvXq2+xAS9ZUn7QxcR3IPE2vWi8o3TacS5+1TnTnfdma2xH6IaxFiRrmuU3Xb3D+8Nd9bQTf+NL+cLe/XhbQu/UDGh9eaSr58fGS8hcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcAKKDva; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcAKKDva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D16C2BCB0;
	Mon, 11 May 2026 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517270;
	bh=7xaEO0jVC5oa/tRtrz6y7cMEa/ulRsn9VdSuUhVaWnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hcAKKDvaGGiwoqAumYTApXmbnL6JF7KtdECplSQfIACzSO0/i6P87KjHbI7dE1n/d
	 ZVClLZgoS7v3iibq11JFq8e5QvkGpFrSepUow4mD/TOJHiZA9p8a3JAR7zsAPMrg/W
	 jy+C3CNa0JUv7reaauSAy2TRh56CwHIfOdxWwLfPh2HjxttgKXNdN68/Z5Ki+RSXrg
	 E/p3mliWyePXA4GU1OxEGyR0+kUp/LDY46qVfsMt4g/x9Hmirs8wb4ojNjuTzd/+qo
	 PWdmksodT1qI1yH5YEiteEbNj2SMk4kLW7mgBkvr4869J93mtQazXv21PceCGHdg29
	 YXTva4RQQ3aeQ==
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
Subject: [PATCH v4 52/55] selftests/mm: va_high_addr_switch: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:36 +0300
Message-ID: <20260511162840.375890-53-rppt@kernel.org>
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

va_high_addr_switch skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/va_high_addr_switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
index 0b69bd4b901d..e24d7ba00b44 100644
--- a/tools/testing/selftests/mm/va_high_addr_switch.c
+++ b/tools/testing/selftests/mm/va_high_addr_switch.c
@@ -325,7 +325,7 @@ int main(int argc, char **argv)
 	if (!supported_arch())
 		ksft_exit_skip("Architecture not supported\n");
 
-	if (argc == 2 && !strcmp(argv[1], "--run-hugetlb"))
+	if (hugetlb_setup_default(6))
 		run_hugetlb = true;
 
 	testcases_init();
-- 
2.53.0

