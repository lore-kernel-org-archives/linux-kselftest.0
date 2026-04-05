Received: from outbound.st.icloud.com (p-east2-cluster6-host6-snip4-8.eps.apple.com [57.103.76.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD230E0ED
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775408035; cv=none; b=a573dvU7zscQaUo2SKFvjuAkiTIISzBKRvh5M3N47lkxECu4Kn86zmef83mAc1XN15QhN+Jkh/hRl4lHXzbWjfMTVb0S5MmwImGacWqjnMpCdRWZ8Qg59YNJJeIRSDbw7XOYVDgR+TNN4dNRlqKvl7IZ6poxdtV3vcU2muOCk8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775408035; c=relaxed/simple;
	bh=v3yl9slSLpWvGImzZdbbFVDqQuIntL9xUh1TAmIX3KQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZY9MJnCdobu3ZN2J/SPrfrhGRPn1tDgo4CCXs+OXWUQLnciUjzxlbhzZS+OKJQkh3NtJ3AyoZ42JghK19pg3FYiesMmZfv/U79sJl1G4o1GY/ta9VvV6y4opZpUsCcw+r/YXotiKs+JFwhkS+flm9yTYA7wFYTG/dEEBkWkLLl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=IQ603w8e reason="key not found in DNS"; arc=none smtp.client-ip=57.103.76.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="IQ603w8e"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPS id DDC3C1800450;
	Sun, 05 Apr 2026 16:53:51 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1775408033; x=1778000033; bh=VSJ4q2wFeM/YCh0ps+bNo//AJyKpAA0ilsBmUNWsuWQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=IQ603w8eLuR2BzdJigy6lRatfvRnzM0F2da8ap8+NYgOnB74ETrKXiCF1lOZCZ8LxzRfauAWXEYbidKxaElQ5Kp00urE3iFisvu0Q39PZlT1xRUw1VLKhUDd6vzgd7h6IkMu7nw/SIza8MHxRT3lZrmy43b6Y4p3WNTVgA5BakDFw4UsFlx0FvmJesVjKKPud6DTXxV2iBeMRxaneWXNt6sj7F6phQOAgOpW5SE7V2Bqwk9KkYUmTkUyfraxmPQiWG8J4SOy5NCYxgjmC1hZQQj1VQcKVVKCuHi2HP/ci7dNM5LVoeY4T9hVFKB+nCS0CwzO09s9rTirs+ntxQyxbA==
mail-alias-created-date: 1719758601013
Received: from desktop.y-koj.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPSA id 5C7DB1800DF2;
	Sun, 05 Apr 2026 16:51:54 +0000 (UTC)
From: Yohei Kojima <yk@y-koj.net>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Yohei Kojima <yk@y-koj.net>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/4] nstree: Fix spurious ENOENT in listns pagination during grace period
Date: Mon,  6 Apr 2026 01:50:36 +0900
Message-ID: <cover.1775404451.git.yk@y-koj.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE3NiBTYWx0ZWRfX2OMeTkD9IwcX
 BTA1wlIe7/OgM2j6G9vkD9nNWMZ1pSP3x84xdeg1EZjh/JiD+44DSEhzJENflrIOFWPE7fQPXlz
 OWecYMy991AAHyZGgx1R4ECkiJK/uIx3+qQw/d0WCHP1eFeJm8Davd9FozOL0TaDhGH1Q5AAIpw
 wCKY+wtJp/yKkPQDFkezoeN/QZjVkjacEztUwaDbRn9D+aS/ywSDkZMNKGMPHn1FBOjlnhqeVsW
 Ub5Anpm0jiN5ze/100O8wNqbdNdeCDr92ZtgaBkpFYzGo/cs9y4DctlMeBiyX8ec7+Ss/2ZYoFy
 I/TNo+TYh+jkJzOwklpq1nDgUO185cuhdKkmPNsGGItl8hdgpxf/X2ELvBHe1Q=
X-Authority-Info-Out: v=2.4 cv=Cuiys34D c=1 sm=1 tr=0 ts=69d293a0
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=TCFzKv49ausxwcHn_0YA:9
X-Proofpoint-GUID: -3gBA1-hBsK8p4CnL0yj-2J2kttvH4Dc
X-Proofpoint-ORIG-GUID: -3gBA1-hBsK8p4CnL0yj-2J2kttvH4Dc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=823
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 clxscore=1030 mlxscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604050176

This series fixes the spurious ENOENT set by listns when (1) pagination
is used and (2) listns tries to start enumeration from a destroyed or
inactive namespace.

The Cause of the Bug
====================
This bug was caused by lookup_ns_id_at(kls->last_ns_id + 1, ...), which
is called by do_listns(). This function returned NULL if the first
namespace after the given ns id was destroyed or inactivated before this
function is called:

A: active namespace
D: destroyed (or inactive) namespace

         +-----+-----+-----+-----+-----+-----+-----+-----+
state:   |  A  |  A  |  A  |  D  |  D  |  A  |  A  |  A  |
ns_id:   |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |
         +-----+-----+-----+-----+-----+-----+-----+-----+
	                |     |
		        |     +-- (kls->last_ns_id + 1)
		        +-- req.ns_id = 3

For listns(), there is no way to distinguish this case with the case
nstree is empty, therefore it returns -ENOENT although three namespaces
remains in the tree.

Solution
========
The bug is fixed by iterating over the nstree's internal list until it
reaches the first active namespace.

Patches Sequence
================
Patches 1 and Patch 2 fix the existing issues in namespace selftests.
Patch 3 fixes the spurious ENOENT bug. Patch 4 adds a regression test
for this bug.

Disclaimer on Reproduction
==========================
Unfortunately I couldn't reproduce this bug on VM environment, perhaps
because the test I added relies on timing-sensitive RCU behavior. At
least, I confirmed that this bug reproduces on my bare-metal machine
equipped with i7-14700K. Also, I confirmed that all namespaces tests
pass after applying this series.


Yohei Kojima (4):
  selftests/namespace: fix selftest hang-up caused by zombie processes
  selftests/namespace: fix unintentional skip in ns_active_ref_test.c
  nstree: Fix spurious ENOENT in listns pagination during grace period
  selftests/namespace: test spurious ENOENT bug in listns pagination

 kernel/nstree.c                               |  68 ++++--
 .../namespaces/listns_pagination_bug.c        | 200 ++++++++++++++++++
 .../selftests/namespaces/ns_active_ref_test.c |   4 +
 .../testing/selftests/namespaces/nsid_test.c  |   8 +
 4 files changed, 258 insertions(+), 22 deletions(-)

-- 
2.52.0

