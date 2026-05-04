Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3947D346A13;
	Mon,  4 May 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885883; cv=none; b=JG5tUFOt423GTAaEpCDaeyUIQXQkKwkd2XUbC8YAeCk3b34OuU+EZl1eb4fMSZoBPHUSI7KUhYiqyevBMgs4+84zJQiJnDJIBzfwd9PRpCoGYA/ZOSiDWXUI+Wc6Vbl54R5UcOMBWf7UtAB6D4nSCopnqg6x0jD+cpGY1BweNTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885883; c=relaxed/simple;
	bh=G5VkZTPiZ9eFO2wxScepjroUpqxzhBoTF1Sz0NepLiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hs3pbfQ/oXTO9G3amVZkNfimUNz10shXc34UpS3ALzkfsbXOe5t0IPsp12l1smZK1Yh6MF9DAKspPh6sWVwAVMFvhVfhcGUWqjbOLpGvkAxpHW9eJQ8WjESyHv+BxKzlQUuqHQBqSQrizJGppZ4ds8N+BydxAYC3pLyhE1CPESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AJVpEaBh; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AJVpEaBh"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64484Ibf1010395;
	Mon, 4 May 2026 09:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=9wiDU/yHrm108gVQhopEZG7BPuvKV+l2/i7eawOnq
	/U=; b=AJVpEaBhf/zjq5DjxxcVADM4SD/ze/ibqu89AVSBkknH8S7z9uQJW/DjR
	Ic49GEV09XsHS8wKlW1ftuY6YbqvAmGDHBUZWDud2a/wuOoQHiAojKRJJAG4119z
	r+bpPS3bHdlGM8UKJjMGO4h021XMw66fEewzxKjojOsESYh6Mem9ayREutciaE0u
	Sx4lEem23LM4FqosElVNBhPQcseebWSO9BZc/JzkcocooG2gAKdeV1qSTU7aIjRd
	YsNmSa/8yyyGkEtKvxgUrztH4FctWUJ/ChorTWw7MN5i5bfiocE8TpzhVoEPAGNZ
	SE0aeGVVSFBQCLptfmnsjBdtmK1rw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9y4e2y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 09:11:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64499Rwp005941;
	Mon, 4 May 2026 09:11:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dww3gvcq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 09:11:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6449BBP434931018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2026 09:11:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ECB920043;
	Mon,  4 May 2026 09:11:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9BD320040;
	Mon,  4 May 2026 09:11:09 +0000 (GMT)
Received: from aboo.bl1-in.ibm.com (unknown [9.123.14.187])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 May 2026 09:11:09 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Cc: Sayali Patil <sayalip@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Aboorva Devarajan <aboorvad@linux.ibm.com>
Subject: [PATCH 0/3] selftests/mm: assorted fixes for hmm-tests
Date: Mon,  4 May 2026 14:41:05 +0530
Message-ID: <cover.1777870179.git.aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5NyBTYWx0ZWRfX+eWJQ6jZGvm/
 ZpdGNbxPlLKY7tYyz3LRHCNBSN0r7Yqp4AFAGX1dKnyjHrXk29V5QqPRvB86unnxd6f2wi2qwKh
 IGPaO6pj0K5KVv1pBvnnSaQn61EyazfFonmUEg+nyvaoSPzBPFYsDP4VRZr7K26BIFEzmVbmQBg
 HsNamw5uq+VJSmHI+ZcJaDL/CSU5Pj7rnblmq9YggRfz1fCn43m8B2TIpA01J7qpoNIDoJW4Cfy
 Z7pwiKp7u1USmJsFJOgiCJDgXKlwK++cFgb8EPAj0LoBabwmr71LpbN7E61Coo8NttvwnHkz6Y2
 aJRCvHLmr4pSNGs2QGOhF3KpLsyX0jZ8Idr+XmKMtAOz9rnHjnVLFJYOcRKWYfc/wHtP7h+vHiW
 vlkTJuBpqNsI0JAOJv7MlO2jHBDj4maJmFbwE+uucnhw2PLhZ6QE1cuNvSCh477ArLFnWP46B+L
 JhKz4kB0Zko0ZKqR98A==
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=69f862b4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=M2d22ONcT9KgptbevxoA:9
X-Proofpoint-GUID: uV2WjqPChciwyHDFa1D9KT7BjH_8Hqr0
X-Proofpoint-ORIG-GUID: uV2WjqPChciwyHDFa1D9KT7BjH_8Hqr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040097

Hi all,

This series fixes a few issues in hmm-tests that show up when
page-size and huge-page configuration differ from the hardcoded
assumptions the tests were written for (PMD/THP sizing, default
hugepage size, and related cases).

It also includes a minor fix to exclusive_cow: the test ignored the
return value of fork(), so both parent and child ran the same teardown
path.

Please let us know if you have any comments.

Thanks,
Aboorva

Aboorva Devarajan (1):
  selftests/mm: fix exclusive_cow test fork() handling

Sayali Patil (2):
  selftests/mm: allow PUD-level entries in compound testcase of hmm
    tests
  selftests/mm: remove hardcoded THP sizing assumptions in hmm tests

 tools/testing/selftests/mm/hmm-tests.c | 86 +++++++++++++++++---------
 1 file changed, 58 insertions(+), 28 deletions(-)

-- 
2.54.0

