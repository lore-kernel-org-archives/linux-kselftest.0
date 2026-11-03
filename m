Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.165.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728097;
	b=bj+2wSCK6jeuFHmCq1HeGTMTQk3fi5+bEp1drip8Q37CzHa7dSjsbBBEkrLiRXZvWXfo
	 zMgfuF3PyalPeCccsm8d+WzrfEg0Rx9Zxl8q7ziFQ7bHDFLnci9PTEzyJPdx1S67FQvhj
	 ph0eGxbooJ3MYqj+7EqFyN2/KAjyoy8m35CAe9lhrA2vlxjwGeOFTAKJeKIKX7l3gM0r2
	 hRzQ0aAa4I7/Aul5gkuhtsOuV9hnE7jdHc74gkx59mXNUiKqkWZ3SlDSImKjlWaTVvecK
	 GmRlQh2IveQLwwKnwSBAGhf9f6bk8Ab9ED+Vg5ExK19pevmxbhxDtMd6gjrRaBZaKwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID;
	bh=dLUVtjZIJ/v1snvst+dkbepdyQJMtG/e3rdPXYts+UU=;
	b=csvg67gZH2GKsTNHYJEIk83OTscEWsoRNZ6JCbxXW7czaP3o/j2/sBAl4CZfgJjA8mvy
	 w6xlEKVtN42BK9K+9O+T6mb0fYu1TDZj7AK4n9ABNwz8Ovq7fIf+YHSxVTWBU27sVCWNu
	 Iub+tLEuxkXVXzsyXfdlnzMBymMMZ1CZfLnVU6Fble7CzKlpmEr+6NZd7Q4xc+AblDBXq
	 vnyaudx1z/kA5UDFri4ekZ6/zaj4CEOX65UK/TsWOkxOkkeOFYuzV78av4IsNQ1YhaHtG
	 d0Ait4p4TABEav0dsz4tHb/kYDo7Bih/DTBOU1c9Z14bQhLMhZOqsZQcMPgfLekv8BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=RbfOy8UC;
	arc=none smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F16606A330;
	Tue,  3 Nov 2026 17:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F16606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=RbfOy8UC
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAlMN1539806;
	Tue, 3 Nov 2026 17:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=dLUVtjZIJ/v1snvs
	t+dkbepdyQJMtG/e3rdPXYts+UU=; b=RbfOy8UCiu1qMmoLNrs0He5ysvIxm6Lt
	Cw/zREpoVpdk+eYHc8alz7UKyeO2Knldv/Fr3fRzosCpAgSjvJ8p7ED2UyXP3FcS
	JsxrDa69WYlP6nEePaFWObLXPPD2MoZ7mMpCFgYQfz97EMkpHWa80FAMpxhgJvLb
	1ucHQ9C9IwQ/+yDYjMeWbEjOFprtsayZp1xPSMOGZqmCGDCbFyn7r9dIzQlJhx2h
	ZJ9WWBZZ8/ss669RKA07BO340Ku9eebU3lDLeIC1N+22lMASM2VldyvtUVwcNjw4
	ax3K43NNWSwpWT0P7NwiB2cAIX+dPj5r2WI4aWQ55nfC0XGgaJAyQw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hn78acrta-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 03 Nov 2026 17:48:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPsgx2435237;
	Tue, 3 Nov 2026 17:48:05 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4hqk4nk116-1;
	Tue, 03 Nov 2026 17:48:04 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
Subject: [RESEND PATCH v2 0/1] kernel/locking: Add mutual exclusion self-test
Date: Tue,  3 Nov 2026 18:47:56 +0100
Message-ID: <20261103174800.1398612-1-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=797 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030070
X-Proofpoint-GUID: jyFQ29lINDPDYLKVHJnGNi3_gHlU_GLM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfX3h2MsqWEFWcS
 RvFKSSv8XTrHZBPAkvtPtUaU9uVdsfieUPnAQ6h2Xs8JhTETNxksAz2baDxOEZZS4c2dKnnTN5t
 SfgxJfb0SsCYyKuXZ7qUXUm+tjN87G6xm5+sgIdFYaRCrybbeIBY
X-Authority-Analysis: v=2.4 cv=Mo3HeGae c=1 sm=1 tr=0 ts=6aea1e55 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22
 a=R5gcnNxLHOFc8d1k_nsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13532
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfX7GiO0qhJCIGH
 kp2CKTDzxE8XPFMpdR1HUe/JoQpCzO7sq5ELAhbe/R/dMxpXetD7PhnHRv/ZiH6JATF65FBr/d5
 bXbl6jrhMED3TlPHIe1pT7vvHxn1ZjQGJUFelL9r+x0uo3g+rL4tIRQPA419dCojprgPEhDCdxb
 2pySCIWit4tAHg2vxaFBXU0TOLtO5CHO91xgRMLlmfduzydep2+DCdZdtwNyCenpyeDULExrfXu
 uyknE9ppXb1wI59W0pdKKZQqoLtNgce2wjBus5WJOs19Ank/au2gQWwKXWBt26NJSuviCwjNr67
 cKt1BRukrCdPRweb08pyWN1yPT4J+fFZJQexET/0VA0Frd1JXXz8NEuKN1JE8s5i2CqMkLetnqc
 YMeXNGBR5sscmMPzd1jigb3NFaGL2BnO/CVmBrElk/7YwEcE0tga1BjVmnGcVmQ+gyHP3iB+kOd
 ulowm1FzdBeVYUwyn5ykjTKJcUvqDzTa+XN4Mg6g=
X-Proofpoint-ORIG-GUID: jyFQ29lINDPDYLKVHJnGNi3_gHlU_GLM

Hi,

Please consider the following patch for the v7.4 merge window.

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
such as Arm. It also includes a variant modeling the incorrect
acquire/release ordering formerly used by RDS before commit
1422f28826d2 ("rds: introduce acquire/release ordering in
acquire/release_in_xmit()"). This variant fails on Arm systems.

The patch also adds a kselftest script that:

* first runs an intentionally unsynchronized variant to verify that the
  workload is capable of exposing lost updates;
* obtains the available test variants from the module;
* runs each non-broken variant; and
* supports low, medium, and high effort levels for interactive and CI use.

The module exposes parameters for selecting the test variant, run
duration, and number of elements.

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
 kernel/locking/mx_test.c                   | 723 +++++++++++++++++++++
 lib/Kconfig.debug                          |  10 +
 tools/testing/selftests/locking/Makefile   |   2 +-
 tools/testing/selftests/locking/mx_test.sh | 171 +++++
 5 files changed, 906 insertions(+), 1 deletion(-)
 create mode 100644 kernel/locking/mx_test.c
 create mode 100755 tools/testing/selftests/locking/mx_test.sh

--
2.43.5

