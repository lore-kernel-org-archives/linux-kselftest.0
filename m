Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754033E9F93;
	Tue, 14 Apr 2026 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176649; cv=none; b=a6dYm3MkaIsA5k+DQd7zb5AR6KVrjQ7BKwOyy9TxPo0J6sFw1NRgNsrXIxjvTmpTb3K4xduYM9yOqmIW5wxaFA13SWk5nzKWL15APgS9Z8IuC7feKHMmdeELmpn+5E6OkxlSYMD2AqzOlQLVfB/RBYFQXiNQXPNY9iQql5BOjLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176649; c=relaxed/simple;
	bh=T8LSXzdMMBigtmoOeSLgAOloW5y/jN/E21D4tN7gU44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+MCUwJiX+IG/iPzMN9hvFpKUaNxnO3xLUbymJMYWSI5ngsEPduoF5MyQ2gmE/c/P7BzLOj66Mcc+OimSmKubTj5awGSjLH5vvePhBBg8IOc44P3b+KA5O7LmosjrmZb+V/VftObD12KftlcwEpvGe7pfbaRcw2Xm1FPZpAhTRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9CRxtgX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9CRxtgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9B1C2BCB0;
	Tue, 14 Apr 2026 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176649;
	bh=T8LSXzdMMBigtmoOeSLgAOloW5y/jN/E21D4tN7gU44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9CRxtgXyuhkT63FAhVMwfPcZIEcdOlWRITnhk3rtZMVqmciL6sDH7uZI9b1Rqt1k
	 T5JnJH/l5gCv0sNQaQFmkLcbWsa0OYyL39M+Zd01MdiNyc7vUYWFvc8aQtTS7iYJhk
	 F841u0TDqDGtGNtVLwRfO/oNSLiHQeehuPDmMc+bu3eQ0Iyt2+8O2zaQ+z7UPLGZ8E
	 sb2P/WzlwDqgnV9EAGi7Cl85goPmc4m/cEdQZZkHHg8oGvCXd45WODFLAh7SCR6XvX
	 96NsQdLmFYft3HX8Y0DUIMHNGK6IhIw0VR27AYFhjoq8uJWIcDUscgiUErHt0MuLbb
	 HZp2XOC6r9bLg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 876FEF4006B;
	Tue, 14 Apr 2026 10:24:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 14 Apr 2026 10:24:07 -0400
X-ME-Sender: <xms:B07eaamlq86m5G7fwWFFR89ilsVMxxDzx0XuBlJMg5xo323pXDsMKQ>
    <xme:B07eaRGXbaDkgYaGFJr8RBXQht6hLx4UgETebC_5OafBcTY7SEBW0NVJvq24OnlG4
    KJtnqKMxTzxlLSNk9o6aMiDCQgTvg95FOW78mrBSzDbQn_2ePchSA>
X-ME-Received: <xmr:B07eabeMbeDUVLk-Wa0m1mAAVLvqnaejVtBwAYt1XNG5BhJBHLWUPfNM_2tmwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfmfhirhihlhcu
    ufhhuhhtshgvmhgruhculdfovghtrgdmfdcuoehkrghssehkvghrnhgvlhdrohhrgheqne
    cuggftrfgrthhtvghrnhephfdujeefvdegkefffedvkeehkeekueevfedtleehgeetlefg
    feevveeukefhtdetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepkhhirhhilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqddu
    ieduudeivdeiheehqddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghessh
    hhuhhtvghmohhvrdhnrghmvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorh
    hgpdhrtghpthhtohepphgvthgvrhigsehrvgguhhgrthdrtghomhdprhgtphhtthhopegu
    rghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehljhhssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhu
    rhgvnhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopehvsggrsghkrgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtgho
    mhdprhgtphhtthhopeiiihihsehnvhhiughirgdrtghomh
X-ME-Proxy: <xmx:B07eaWErl-LdWJDCm7RWmTfhyWg3YDUCMEWb4RILl456wawMgM4uZA>
    <xmx:B07eadHmDpoEsd3AyN0xUeV-fLAvQCQUHiYBBe7xfVuHbpMB1fazfw>
    <xmx:B07eaeNbZ96vkjZ1yFqGzoVG9Wqyy4UlHfThJLX1-emptJRERr-_mA>
    <xmx:B07eaar45yZpIUMhk5LThQEQds1mx9n6UdimwEXg3QZCGnR9QuApxQ>
    <xmx:B07eaXCGWPatpEzoVg1MgpCPmIqFcAfTt3ZSkrpQjgy7K-ulPvEs4HXd>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 10:24:07 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [RFC, PATCH 06/12] userfaultfd: auto-resolve shmem and hugetlbfs minor faults in async mode
Date: Tue, 14 Apr 2026 15:23:40 +0100
Message-ID: <20260414142354.1465950-7-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260414142354.1465950-1-kas@kernel.org>
References: <20260414142354.1465950-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When UFFD_FEATURE_MINOR_ASYNC is enabled, skip handle_userfault() in
the shmem and hugetlbfs minor fault paths. The normal fault path
installs the PTE from page cache directly.

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Assisted-by: Claude:claude-opus-4-6
---
 mm/hugetlb.c | 3 ++-
 mm/shmem.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 327eaa4074d3..c10d2432768c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5847,7 +5847,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 		}
 
 		/* Check for page in userfault range. */
-		if (userfaultfd_minor(vma)) {
+		if (userfaultfd_minor(vma) &&
+		    !userfaultfd_minor_async(vma)) {
 			folio_unlock(folio);
 			folio_put(folio);
 			/* See comment in userfaultfd_missing() block above */
diff --git a/mm/shmem.c b/mm/shmem.c
index b40f3cd48961..ce47e77fc090 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2489,7 +2489,8 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	fault_mm = vma ? vma->vm_mm : NULL;
 
 	folio = filemap_get_entry(inode->i_mapping, index);
-	if (folio && vma && userfaultfd_minor(vma)) {
+	if (folio && vma && userfaultfd_minor(vma) &&
+	    !userfaultfd_minor_async(vma)) {
 		if (!xa_is_value(folio))
 			folio_put(folio);
 		*fault_type = handle_userfault(vmf, VM_UFFD_MINOR);
-- 
2.51.2

