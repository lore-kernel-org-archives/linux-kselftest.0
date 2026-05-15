Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3612DCF67;
	Fri, 15 May 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778850003; cv=none; b=gOCKj4g0wQa1qSxniNb9pk0vzOeILRxgwoEBGmVC/uwE0vbPo7GhpgI3w2piuY3RhfSteyjTYd9ndPToe7pAnwg4dxkmmpt6Q3JELSL05J32CrwHukKBk9Iqy0fFN5ox+JZxvgu2n2/adxF4WZ+kktz6xHEd45ZnJ3WIiZEcb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778850003; c=relaxed/simple;
	bh=+2xRSrQDtDWLYEFX/q/RbrP/TC4sM3bOmJsEvKC8zfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FkLgP8W8F121Owq/FVktpnSyCQkon76mhQIISxb4rCZA8h0d90PoulssUXEmba9LzuImC8/ZXIweZJWrj8+GIa4Di+ktkcwq6j8B1yfFva3RsndqN+MGikBRbe5txheEiJvqyQcQt5czwlloJXTC3BAcvXNHKIy8cy2Flawe4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YUFW8+oz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YUFW8+oz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6444827D3;
	Fri, 15 May 2026 05:59:55 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECAED3F836;
	Fri, 15 May 2026 05:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778850000; bh=+2xRSrQDtDWLYEFX/q/RbrP/TC4sM3bOmJsEvKC8zfA=;
	h=From:To:Cc:Subject:Date:From;
	b=YUFW8+ozWcK8YoPH90cYdeTuObSnNrZtlgq6GXeS23BZNL2hPCLsS6IAeGSbwrJog
	 giN3V9HRM6QSYUJgZubDaIUyF+tCsFD98gppo/T5AtZW5X5uVWzwlkCTLwFyZqVdwR
	 FXi3kHYboDoUotSKDRQwjP7C+KXjFNLw7PnU6CHg=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH] selftests/mm: add pkey_sighandler_tests to .gitignore
Date: Fri, 15 May 2026 18:29:49 +0530
Message-ID: <20260515125949.315964-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

.gitignore currently does not include the binary
pkey_sighandler_tests. Add it to .gitignore.

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index b0c30c5ee9e3..1b1d9ed87039 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -62,3 +62,4 @@ merge
 prctl_thp_disable
 rmap
 folio_split_race_test
+pkey_sighandler_tests
-- 
2.39.5

