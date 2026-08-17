Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3F842089C;
	Mon, 17 Aug 2026 13:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971817; cv=none; b=g+mKuvATjVYunM9g1i0yFkCjhWRC+RjHCpdY2iiA9q2RWyXEIjCsQWjYYiaCCijK488lF4GMjxAQh2nHTndsycy28dRauhJZBr1QBJ3V8Q/UhsIPjo4qmKRh99MoUdqnt3HEJNYbiXFzP7MRS6FbLmiBMVcjLItdQyEY2Ht5ToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971817; c=relaxed/simple;
	bh=59lFG8bMcCuZkwJL2dErpHk8N5up4dLJioL0nMn7ung=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aTz6D2WGdqrdHeo7060b6u0S8PdKi3JUZB35mQX7XkM37yBxn1iTBo91y689D4LpYXeojvj7Ph9nu8j6de3GV+DpIEX6CaY2cUqmfSUAG6ZJ5W4gfCQP1opXqmfy4Q+U5iLe2zHK6GPNCaDrV+eNDtpwqznq8fdcHrPNt3/G/g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=djdaUymF; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="djdaUymF"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMeo3Y3198445;
	Mon, 17 Aug 2026 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=I0BsCGzxGUiRoAOV
	ESs0gxE7Ojm20w31WXG8aCuPuM8=; b=djdaUymFMppR1/hUasRctLaTCHOTJDc+
	tfodPidauYaudwlANRYmvX5K9V3LyrL0l2IetNSZfRFRTgHsDiEh2teXWo4RceiT
	RFo6Reh+MUpFdjjKevPVayMI//kVEShV8iDHAQtIOwUE93U2APx2zkfMbawQ+sUz
	4sfCeITPgwSaWbm7zC1yNtQMj8ogFACEY87+t6/L4HPi2OLCjK58Gu0eZh5fBCYY
	5Xr3KyiB6Rf8RoZO9WA7eLoU3Mer1/vy8cqylHmxJ7lDQfIXMfrlO8XFBs6TCfhU
	/Xoeir8+qR0QJflFhm1Is/hndhv+Cg7a/6WKmt2E9Y5EhzaYbN5xjA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g2ehc2e8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2026 13:03:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67HD0hqH038697;
	Mon, 17 Aug 2026 13:03:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejpcmqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2026 13:03:21 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HCsMb2021766;
	Mon, 17 Aug 2026 13:03:20 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejpcmpq-1;
	Mon, 17 Aug 2026 13:03:20 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
Subject: [PATCH 0/1] kernel/locking: Add mutual exclusion self-test
Date: Mon, 17 Aug 2026 15:02:35 +0200
Message-ID: <20260817130239.343594-1-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=835
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608170099
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5OSBTYWx0ZWRfX26xzoIDlzx6H
 FNCuonRxF+r6kxZFZJjlWQl5Gz8K01vHjQqHtxe0ghVjXp8o4xP1o263CHiu9N9IAx5oolQh21m
 LEaDyd1jTk5GC1bAf9okbM3RWxEGDKWCUTTVWrIzxQ8XqcnOlT1hGjKEa1jp17id/Wcp03U/v/r
 ZPi33dvFwsa93mtaQ7acJAbk3IOqNOmibLIcOSTJc0CYkOe/V8eo+EfEuhNUEMTJa6pirAeb09v
 hzp4zhOn3if0PtLgem8pnapSR1QCondc33+11MveTDJdkqA8TiCSh23RV0QO5bIUJAp8L2q+0D/
 TVlpMgY5EXDOQjNnRFQ/ofVcebZJs3rCmi26bkWAIqNORU6gM/J85WPZamkeqFzjLd0xROy5U4V
 HmxjEK3qhSopihJrexd1xtDgUXIhFtTv1mixwhV0UWDSdvafDqAjv8lY6h4/Ri02pprxxPCR/43
 hCY8T174BwB/+nVxYqFObNesWOjzJCQ4bwtCKD9o=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5OSBTYWx0ZWRfX3n5IKBD1YH94
 EOlBHHXb7QogXQ5M+fBPEctl8cLOUJkle52q7p55MgGZQiyWq1KxDsIFKnCD9/SRVEWWniKCKd5
 qMShjj9Ds9OhXkcqgwXt3c4eqvag7rF5d4pkL1VNlvEsQFfqkw32
X-Authority-Analysis: v=2.4 cv=fO0JG5ae c=1 sm=1 tr=0 ts=6a83069a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22
 a=R5gcnNxLHOFc8d1k_nsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-GUID: jGKzvH-CPcewXSy1Fvy2TDb72bPaQdQQ
X-Proofpoint-ORIG-GUID: jGKzvH-CPcewXSy1Fvy2TDb72bPaQdQQ

Hi,

Please consider the following patch for the v7.3 merge window.

This patch adds a stress-based selftest for kernel locking and atomic
synchronization primitives. The test runs concurrent workers against
an array of counters while maintaining a simple invariant: every
increment is paired with a decrement, so the sum of all counters must
remain zero.

A common test interface allows the same workload to exercise a range
of locking primitives, including spinlocks and rwlocks, as well as
variants using atomic and bit operations without an explicit
lock. After the workers complete, the module checks the invariant and
reports a failure if the resulting sum is nonzero.

The test provides regression coverage for memory-ordering issues that
may otherwise be difficult to reproduce. In particular, it can expose
the regression fixed by commit 415d83249709 ("locking/atomic: Make
test_and_*_bit() ordered on failure") on weakly ordered architectures
such as ARM. It also includes a variant modeling the incorrect
acquire/release ordering formerly used by RDS before commit
1422f28826d2 ("rds: introduce acquire/release ordering in
acquire/release_in_xmit()"). This variant fails on ARM systems.

The patch also adds a kselftest script that:

* first runs an intentionally unsynchronized variant to verify that the
  workload is capable of exposing lost updates;
* obtains the available test variants from the module;
* runs each non-broken variant; and
* supports low, medium, and high effort levels for interactive and CI use.

The module exposes parameters for selecting the test variant, run
duration, number of elements, and data-structure padding. Varying the
padding is useful because the reproducibility of some ordering
failures depends on the relative placement of the tested state in
memory.

A successful run does not prove correctness, but the test provides a
practical way to detect synchronization regressions and reproduce
known classes of ordering bugs under load.

If this commit gets accepted, I have the intention, subject to other
work priorities, to expand on the locking primitives, and in
particular add a double set of ww_mutexes for each counter and attempt
to acquire both in a random order. Using both the Wound-Wait and
Wait-Die variants.


Thxs, Håkon


Håkon Bugge (1):
  kernel/locking: Add mutual exclusion self-test

 kernel/locking/Makefile                    |   1 +
 kernel/locking/mx_test.c                   | 707 +++++++++++++++++++++
 lib/Kconfig.debug                          |   9 +
 tools/testing/selftests/locking/Makefile   |   2 +-
 tools/testing/selftests/locking/mx_test.sh | 181 ++++++
 5 files changed, 899 insertions(+), 1 deletion(-)
 create mode 100644 kernel/locking/mx_test.c
 create mode 100755 tools/testing/selftests/locking/mx_test.sh

--
2.43.5

