Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F32348C4A;
	Sun,  2 Aug 2026 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700404; cv=none; b=rBhCfvCdwAdK7Fw0GcuSagZtxDYXI4MMfEZOjBYfLuXcmfmN6AUoaX/YyqY9ZcLaFP0TESxgX8Q3zb11QkTKoaTtYx8n3UC4XaJi6GjWRPTirC/pAzAfW9q2JVLthRMuZfaK8W1vAtKWlWr25XDbIAROTCGE26jXqf74J5RFJTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700404; c=relaxed/simple;
	bh=+TLAK/GDr3G0C1+pKt2j54nz1GcAD4bsMbGOy3A6TMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PZpOFrxjbJ17yYtsALrtvusMyehXQUjLhIq2UcP3Wmup1r02AgQIB1eJVaStxy0Z/5QhGa04E9sAD7OUYlLJBRHSvQXK6AmMA3jTwhqz/jfYuMPtvI8OgVkdpKuOfs82s5ACyKio1uW3b1V41ZYKpAnt+lZfKPpbD1qLwoysg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=XkYwMRGB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QDs3xIqJ; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="XkYwMRGB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QDs3xIqJ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 74673EC0098;
	Sun,  2 Aug 2026 15:53:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 15:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1785700402; x=1785786802; bh=wFWqzaBwQsPmRIRQNia5eoBYA1PeMAY8
	pSf2InhjqsA=; b=XkYwMRGBnv/+b50lORIU5B1aYoK9N7essibAphyEATL2SBLM
	O2vtkaB8RoAcpo58b0Ak84ICAUVxuZRuSnSb4e41vTG4A8ECOKL+FH29mmZavmu8
	RUMtNDXtvizZ78K9CKlaczJGm58ZRI8/tzGACQmNc0ToaUSBV+OBSSnCmsrTrLl/
	n+LyB6ndxuoClSZo7hWvXcILHMFxXmIQrVX7ymJ9dgRADZrdiaCZDjlfWTNqo5rH
	Bt/A6UJtP0TWk+Ow0x5i2bJ4gzLd2Nac2bwZr/coeUzbFj1knb2Kr7dyyJ5pBG+j
	HoJpU2k7D1ZbgNsR1d6ud1wyiVPoKrK2JZ5xlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785700402; x=
	1785786802; bh=wFWqzaBwQsPmRIRQNia5eoBYA1PeMAY8pSf2InhjqsA=; b=Q
	Ds3xIqJpXhUjexTGnanmmJ56sfkLB2O7nV+E2goGt9tIEkpk6zXijSbNtJVwuegQ
	GVB24014FcJ/zcu7keGOQBJlm+/H5txT4UK/gZNlG6N8XpPV4nvdbCuaMBtJbBuV
	SoxfxYeeXtSw1Fhh3QaT/PqsSoboftuZoVzp0iLVAKTVbkr/O6bOwZqBc8NuNbV7
	mUlJGvdCreQ9GPQntJMEosmshuvcWiqlT/z3WGoWUQEy7LPspxbIPq2Oj5VbZFwr
	/PkNNuf2MqNIrFRORBZznAYZsZWWgAbVKJB39jN17Z396NqA9/+O+eL26p6IsDXv
	fVGt0V1EtnMvkqprpBViw==
X-ME-Sender: <xms:MqBvahkmsAw7wlTS-GZ92DbI0zxsa1ugigdq76TDoNocKOu8OG8PFQ>
    <xme:MqBvanVWAiFU5Ao_yEjATjunc2WXfFMERKccijT9z8JMzo6ABqQfLgStT_hwYYKlS
    Kf7CZdgvjM5sojiJEAS5ZL9Idyrw3SNIY60OwrYm8_qFUmfueUTng>
X-ME-Received: <xmr:MqBvakmLrZcB8aN_f460z0uh878rapy79zLjICBA59BOjWPhlylRUzLBP7c>
X-ME-Proxy-Cause: dmFkZTF0jcSSKFGDg2KrIu5c43P4SsiipwcvDQBe+CHxos2n8PFgvSXAdv5YVW583HVAOz
    W5evq6qe09LpHqloXNM1K7VWF721j2bpam5IryqVMcYz9qouNwbpBEKv3Y5gifbeJAqW/Q
    YZQrbB51yLEk86mWZaGZ1Drq0Xy949i11wvFP7mkSWE3f4+XiyFqs+bTi+V6AVpUjNMMFr
    yeY2fCKzWlrX4GavSe/JRyGqxABGArlOuRBA0IP4mMA1yNK8fSDYGTdjzDrtr8AjwNqVIi
    3BcHDiClTVSc/WD5f6J8XCsMYF+6dE+0Mr4gWnl6eMmh6FUU5GqCPEjsceh07AxGuRDdDW
    62fQ2/9u74au2+y6Z30vcyT9WnM7oG3rlL7aGZfWCmvUWi+wMupUoEIfvLx/IqqiGyIemc
    Ty9SF6MQ5p667l9OtKFnlBZxuF1mkS8qOiorfNmNnjpw8vuHcv3za+r3fP8FtNFupylMzl
    3RlNjEvfVrNWCr7HNpVq2nxOxHR5Q92OZzR8Cu1jf4A7kRK2zdcAwwLpk09w/b7mFfe2kZ
    uHnSoJKaG2LOlo+SkX1PVf4o+wkujht7ZlXjd/x7J1vxXIox3CSFWwvrjxiDkMkDu+g5pm
    Npp2Ng46lR0baSURacZG5yYvzaF7ymHXFmVMFowsFxya14L1fuY3g5LgAVPg
X-ME-Proxy: <xmx:MqBvakSrwFA58VcOBGnclZVr0LEh_P02x5mWqlVYGhJhJGAVL4EvQg>
    <xmx:MqBvaoFHVivJsCxSPa-SNUiG4cIxkP_4AJTO_cb3iDPVAAyzl74ZyQ>
    <xmx:MqBvauiuHtcuH8t3-Vj9Ajob-BXn1sJ-ICVEOMAfnaJnTFEAUzZG2g>
    <xmx:MqBvamphzI6J4F0wbXiXZG8QmUpKqr5GPLywgBULw5w3oP1u3yj3oQ>
    <xmx:MqBvahBTnf6xKmBXx0Zhq0oJxhS-snSi1TX6TMxUUWRcOBgK2uSfHE-J>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:21 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nico Pache <nico.pache@linux.dev>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 11/16] selftests/mm: race-harness variant for permissive hole occupancy
Date: Sun,  2 Aug 2026 20:52:43 +0100
Message-ID: <20260802195254.1937477-12-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802195254.1937477-1-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The race harness runs with max_ptes_none=0: strict occupancy keeps
selection honest under racing MADV_DONTNEED and avoids doomed PMD-sized
allocations on 512M-PMD configs. That regime never exercises collapse of
partially populated windows -- every candidate it emits is fully occupied.

Collapsing a window that contains holes is a different path: the hole is
not copied from anywhere, it is zero-filled into the new folio, and the
slot has to be re-checked under the page table lock at install time
because a racing fault may have filled it in the meantime. None of that is
reached at max_ptes_none=0.

Add -z, which selects the other supported end of the occupancy scale
(HPAGE_PMD_NR - 1, scaled per order): selection then emits hole-heavy
windows and those paths take the brunt of the racing faults and zaps.

Also drop the stale claim that max_ptes_none sits "mid-range" from the
header comment; the harness has always pinned it to an end of the scale.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 33 ++++++++++++++------
 tools/testing/selftests/mm/run_vmtests.sh    |  2 ++
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index b586a114e4cd..2e36e242caa7 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -15,8 +15,12 @@
  *   madvise	MADV_COLLAPSE in a loop — the legacy-PMD regression
  *		axis.
  *
- * All anon THP orders are enabled (inherit) and max_ptes_none is set
- * mid-range, so the MADV_DONTNEED holes steer selection across orders.
+ * All anon THP orders are enabled (inherit). max_ptes_none is 0 by
+ * default — racing MADV_DONTNEED then steers selection across orders —
+ * or the permissive limit with -z, which floods the batch engine with
+ * hole and zeropage slots so the population paths (park-time zeropage
+ * clear, zero-filled copy, install-time pte_none() verify and abort)
+ * race the faulters directly.
  *
  * Correctness signals: every racing page must read as its pattern or
  * zero (MADV_DONTNEED), never anything else — checked continuously by
@@ -196,7 +200,8 @@ static unsigned long now_ms(void)
 static void usage(void)
 {
 	fprintf(stderr,
-		"Usage: khugepaged_race [-d seconds] [-m stepped|free|madvise] [-a areas]\n"
+		"Usage: khugepaged_race [-d seconds] [-m stepped|free|madvise] [-z] [-a areas]\n"
+		"\t-z: permissive max_ptes_none (hole-heavy windows)\n"
 		"\t-a: number of shared PMD-sized playground areas (default 3)\n");
 	exit(1);
 }
@@ -219,11 +224,12 @@ int main(int argc, char **argv)
 	int duration_s = 10;
 	unsigned long thread_mask = ~0UL;
 	int nr_areas_arg = 0;
+	bool permissive_none = false;
 	unsigned long i;
 	int steps = 0;
 	int opt;
 
-	while ((opt = getopt(argc, argv, "a:d:m:t:h")) != -1) {
+	while ((opt = getopt(argc, argv, "a:d:m:t:zh")) != -1) {
 		switch (opt) {
 		case 'a':
 			nr_areas_arg = atoi(optarg);
@@ -238,6 +244,9 @@ int main(int argc, char **argv)
 			/* debug: bitmask of racing threads to start */
 			thread_mask = strtoul(optarg, NULL, 0);
 			break;
+		case 'z':
+			permissive_none = true;
+			break;
 		default:
 			usage();
 		}
@@ -274,13 +283,17 @@ int main(int argc, char **argv)
 		strcmp(mode, "free") ? 1000 : 0;
 	settings.khugepaged.alloc_sleep_millisecs = 10;
 	/*
-	 * Strict occupancy: mTHP collapse only supports 0 or
-	 * HPAGE_PMD_NR - 1 and coerces anything else to 0 anyway, and 0
-	 * also keeps khugepaged from burning the whole step in doomed
-	 * PMD-sized allocations on 512M-PMD configs: under racing
-	 * MADV_DONTNEED a fully populated PMD area is rare.
+	 * mTHP collapse only supports the two ends of the occupancy
+	 * scale: 0 or HPAGE_PMD_NR - 1 (anything else coerces to 0).
+	 * Strict is the default — it also keeps khugepaged from burning
+	 * the whole step in doomed PMD-sized allocations on 512M-PMD
+	 * configs, where a fully populated area is rare under racing
+	 * MADV_DONTNEED. -z selects the permissive end: selection then
+	 * emits hole-heavy windows and the engine's population paths
+	 * take the brunt of the racing faults and zaps.
 	 */
-	settings.khugepaged.max_ptes_none = 0;
+	settings.khugepaged.max_ptes_none = permissive_none ?
+		(hpage_pmd_size / page_size) - 1 : 0;
 	settings.khugepaged.pages_to_scan =
 		nr_areas * (hpage_pmd_size / page_size) * 8;
 	for (i = 0; i < NR_ORDERS; i++) {
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index f61ec76d8e00..83a04b1e2520 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -413,6 +413,8 @@ CATEGORY="thp" run_test ./khugepaged_race -d 5 -m free
 
 CATEGORY="thp" run_test ./khugepaged_race -d 5 -m madvise
 
+CATEGORY="thp" run_test ./khugepaged_race -d 5 -m stepped -z
+
 CATEGORY="thp" run_test ./khugepaged
 
 CATEGORY="thp" run_test ./khugepaged -s 2
-- 
2.54.0

