Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF36C2F8EA0;
	Tue, 19 May 2026 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163610; cv=none; b=Hh6kV5nQ2TGLKvzDvOJaFm7yTWagPKrBd+h83ycJhCuj36PDfyYZia0lU/5l/BgzJ5HyBktM0g02/gomLPnygM27Jzp4VHBkQe3Vrt7MCMyXuL7PctTY6PaAKrriVfav1o2Crr/J85aApPjU2GylgBKOinbtQNdTZ7UT3C7MUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163610; c=relaxed/simple;
	bh=LVCuhWW3bv63di6Bzh6Q6mqJXC4uKkRCXKa9er1600g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NX6qSBiq6WSQrKM9QQ2/0p49uA9NjPf6Np+3IxR00rND+sx+bb1zX5w6gnSAy8EojOWH1Q/64E6S4xy98q4eXfies2ZynmojXLsL2TugoZIe2NTGlOPtxsQqWCC7xyBlAiRZ6CM9qO+kJ7KHeh/B/DP7Wdq5IOckBZLdCTn18BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=X7RWxTb/; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="X7RWxTb/"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IG2ZeR3252234;
	Tue, 19 May 2026 04:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=NymUJvLzenYDD5zRe
	PoXoHJ8ghSJOU8eRyvhNSKbHoQ=; b=X7RWxTb/IIRgzOKExFLMOL49vQlMw2arb
	3K7YBC/tyAyQvzMNeYkLtCl+KjWoHepMCxKlT9WEh4lF3O1M3lapOJae2SbG4Fda
	SsUcgs8817bABXAn7WO9B32OfZdG6+d3PLz0LLkjSpCKVpMLbViyp3aNUk2ikLMP
	h5Swj7nJpQUo7mteISEUuPCkgXY2VnIObicd1RUjbmURJ7iYuBuxrHWDA0VaxTeJ
	N8pVldzFK7Y4xdIGEnNZHG3L6R8sl05tKMYVQql7zXum06sUPEDJpOxMPvDyn8/b
	snl71fU+gr1SZH0xfZD/LA1aEP/afPPLKtrmaxq9/KM4NoWnOYYJw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6haw2fsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 04:06:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64J3s8h5003315;
	Tue, 19 May 2026 04:06:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e754g8nv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 04:06:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64J46cBF25690604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 04:06:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18DCD20040;
	Tue, 19 May 2026 04:06:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A02E82004B;
	Tue, 19 May 2026 04:06:35 +0000 (GMT)
Received: from aboo.ibm.com.com (unknown [9.39.29.16])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 May 2026 04:06:35 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Cc: Sayali Patil <sayalip@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Aboorva Devarajan <aboorvad@linux.ibm.com>
Subject: [PATCH v2 3/3] selftests/mm: fix exclusive_cow test fork() handling
Date: Tue, 19 May 2026 09:36:24 +0530
Message-ID: <ff06c54ec2cd037a6d9a0d65cd06e4c37cc0b3a8.1779090293.git.aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779090293.git.aboorvad@linux.ibm.com>
References: <cover.1779090293.git.aboorvad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzNyBTYWx0ZWRfXxEs+blJ1WZGx
 jURbBeii+KyFGA2EtQjYPq3ZWwJcquIrIwLGhseHfERxTuclaUa/0+CCh45MTfY0hkEjhnGG6Eu
 yM6r6/PbBaKHXHNv8/VxVWVgn90DZ+afbPw65djXjiz4LKTPMJvnmjoBBLUYbMJ9Vr0324B/G71
 /1CpWvMps1AJqi+llWJ0+lVpAkwNKJNcrH6p+rwg789GIxt8+N+UdZ2ENp3nP1k/d29oa9pB9bK
 r1d+hwYNGa23EJcIJ9onwsiQ358dk9vtVxHAObjR6hszdSr6jFYooqMXFWyC58P6F6OixIcSJcB
 IOuijACqTzkCNFrxzsRjtWGj1gE4wSMBh6HKzEI2aOzSTnfPliXBpjMbGKLsTLDXSEJeyA4f0DW
 nlTmnRAmSb+4h8TAhJLjKdOlRAMGWdiJrkmTmG8Wf0p8Es1tLqTKoc1+4iFbrTjgiRyzaphwybs
 cYK6IoqLLwxoSK28QtA==
X-Authority-Analysis: v=2.4 cv=Np/htcdJ c=1 sm=1 tr=0 ts=6a0be1d2 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=V7PHP-YOonYUhVqbgP4A:9
X-Proofpoint-ORIG-GUID: tSqefxWkmupUPinfPcO6y6YwvePycbTS
X-Proofpoint-GUID: tSqefxWkmupUPinfPcO6y6YwvePycbTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190037

The test ignores the return value of fork(), so both the parent and
the (newly created) child run the COW verification loops and then
call hmm_buffer_free() before returning into the kselftest harness,
which _exit()s each side.  This duplicated teardown sequence has
been observed to manifest as a SIGSEGV in the test child, e.g.:

  hmm-tests[360141]: segfault (11) at 0 nip 10006964 lr 1000ac3c code 1
  in hmm-tests[6964,10000000+30000]

Fix this by adopting the same fork()-then-wait pattern already used
by the nearby anon_write_child / anon_write_child_shared tests in
this file: the child performs the COW verification and then _exit(0)s
so it does not run the test teardown, while the parent independently
verifies COW, waits for the child, and only then frees the buffer.

Fixes: b659baea75469 ("mm: selftests for exclusive device memory")
Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 30 +++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 1d49d9e919c1f..48834e7d1d984 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -1868,6 +1868,8 @@ TEST_F(hmm, exclusive_cow)
 	unsigned long i;
 	int *ptr;
 	int ret;
+	pid_t pid;
+	int status;
 
 	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
 	ASSERT_NE(npages, 0);
@@ -1896,14 +1898,36 @@ TEST_F(hmm, exclusive_cow)
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
-	fork();
+	pid = fork();
+	if (pid == -1)
+		ASSERT_EQ(pid, 0);
 
-	/* Fault pages back to system memory and check them. */
+	if (pid == 0) {
+		/*
+		 * Child: fault pages back and verify COW, then _exit().
+		 * On ASSERT failure the harness calls abort(); the parent
+		 * reports it via the WIFEXITED/WEXITSTATUS checks below.
+		 */
+		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+			ASSERT_EQ(ptr[i]++, i);
+
+		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+			ASSERT_EQ(ptr[i], i + 1);
+
+		_exit(0);
+	}
+
+	/* Parent: also increment to verify COW works for both processes. */
 	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
 		ASSERT_EQ(ptr[i]++, i);
 
 	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-		ASSERT_EQ(ptr[i], i+1);
+		ASSERT_EQ(ptr[i], i + 1);
+
+	/* Parent: wait for child and then free the buffer. */
+	ASSERT_EQ(waitpid(pid, &status, 0), pid);
+	ASSERT_TRUE(WIFEXITED(status));
+	ASSERT_EQ(WEXITSTATUS(status), 0);
 
 	hmm_buffer_free(buffer);
 }
-- 
2.54.0

