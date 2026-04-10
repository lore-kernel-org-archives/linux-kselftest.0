Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF2C191;
	Fri, 10 Apr 2026 04:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775796151; cv=none; b=NrJDwvr45ourWDK/2t/i/YAz4+K94uonv9hfTQUrOSAhZqTbpmj5DuIRLpV+u81mHLT4EGDiQ/pLnelXekFweFwkdBo9mlrwXRLNUzHyX83fQzx7EQjm5puGFzZ6/gkHqZ7B2ajh1Fa/W+wownLucFU9c8g0ja4zmpKszPkbB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775796151; c=relaxed/simple;
	bh=dq6ZX9E51boH1527UiffH+Wf3k0bLWfqttmlqixC+pQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UIixPZSF5AWixI8opFBgaozSqmU2BgAKp1miPFbPb3FaQ2JqCoOmENEOs3iZawtnlyKbZudTTxg6Cqqh5Sjrny12CBCY8hjf+YkEeiec1J+AFRqEEN1wX2bCbAyI+G3xAsLbF2Q06Pjjgr/oENdHUzSqB8xGSxily/ICl1Z1uMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=laXNy6Zb; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="laXNy6Zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=6h
	2CeoH05L5D5drW/viG79qQjvldbeeqelsA44hB3/A=; b=laXNy6ZbXQVRAparm9
	5CNQM8nOiibCZht+rlh5ehK6w6SQLRDLyEU88y5+s9btT8sDFGWbWElXAa/7s9O/
	FpxDIJ+Syd0EMwnwtvdoPxZAVPkprQE71wHsGT9oYKCcdyg3Qd7Lb1kGtns2H5er
	iovwKCAWE5nW4qrffjahpvM8k=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnn6SFf9hpjtA6EQ--.23811S2;
	Fri, 10 Apr 2026 12:41:43 +0800 (CST)
From: Cao Ruichuang <create0818@163.com>
To: rppt@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests: mm: skip charge_reserved_hugetlb without killall
Date: Fri, 10 Apr 2026 12:41:39 +0800
Message-Id: <20260410044139.67480-1-create0818@163.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260406053126.217196-1-create0818@163.com>
References: <20260406053126.217196-1-create0818@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnn6SFf9hpjtA6EQ--.23811S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw18CFyfAFWfXrW8tF1rtFb_yoW8Gr45pa
	4rJ3WY9ry8AFy7Kw4kGw47ZFyIvF4kZFW0yrs5t39xZr15Ga4xKr1IgF13XrWfurZ3Xws3
	ZFWFq3Z3u3WUJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UAUUbUUUUU=
X-CM-SenderInfo: pfuht3jhqyimi6rwjhhfrp/xtbCvwiSy2nYf4iCXQAA33

charge_reserved_hugetlb.sh tears down background writers with
killall from psmisc. Minimal Ubuntu images do not always provide
that tool, so the selftest fails in cleanup for an environment reason
rather than for the hugetlb behavior it is trying to cover.

Skip the test when killall is unavailable, similar to the existing
root check, so these environments report the dependency clearly
instead of failing the test.

Signed-off-by: Cao Ruichuang <create0818@163.com>
---
v2:
- replace the PID tracking approach with a simple skip when killall is
  unavailable
- follow Mike Rapoport's review suggestion

 tools/testing/selftests/mm/charge_reserved_hugetlb.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
index 44776965763..44f4e703deb 100755
--- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
+++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
@@ -11,6 +11,11 @@ if [[ $(id -u) -ne 0 ]]; then
   exit $ksft_skip
 fi
 
+if ! command -v killall >/dev/null 2>&1; then
+  echo "killall not available. Skipping..."
+  exit $ksft_skip
+fi
+
 nr_hugepgs=$(cat /proc/sys/vm/nr_hugepages)
 
 fault_limit_file=limit_in_bytes
-- 
2.39.5 (Apple Git-154)

