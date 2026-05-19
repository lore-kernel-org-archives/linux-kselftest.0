Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10DF2D47FF;
	Tue, 19 May 2026 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163607; cv=none; b=kkFMX0KKO2RofSM7ZPYHK0ptUEkufU0dQOEA/ESa2XBZd2I7JesY5JH/doz9OyYk3fUSMFApExeOlVcwCWlEcrsImtXPYNa/l18z0uD5tbmfBfYSnj1Lv1exvByK3cr1fi91XPyf3M/aXwKZrvLAvAqY10PAUP70/rD06vnUQ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163607; c=relaxed/simple;
	bh=S3SMr3KIRyr+Yx9WwkQLvtaq3XAlJxi17VTPM9rKtPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NfQGcoathQrFQ433OjU5XQyzBcK1R8lAFJfTTNi7QpGa/gHI4ty1ynBeKZijqWjrbSLDv7I7WpiVWXz+EUoRXrjbGEAi0HE59/vyTimgOI0ro2faI06mRdO2KatYRv8WHiCdrUtMBqVHEgZIM9+ocgYlfsPRIoXRe0PFNkHFBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iZz3ev4G; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iZz3ev4G"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IJOvwC4141466;
	Tue, 19 May 2026 04:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=taDS7tqJe/GzKHqEmQMHrAUibv66UsSbZdlpHpy8L
	hU=; b=iZz3ev4GSP/E+NTTf0lcDyUTXixvfZxiA5SYo6g3mxbtIse3DhZFUAlPw
	Oi8QqyqJ7d1UxAyGNAiqAlY4eJDoZYANtg7+3t+wFQgtIoFxhrhvsEAYDV6tOb+3
	jxba58U5g/Qw/BpzvDLPX8XTeHkq4TZXwZgI4KorkYdvlt7iJs7syWzL3ddWWPrf
	f5fznq3dv5x0oMtB6rWKB2fM6BXp82EWFFLKM1NE/0R83b7rb7q7kzTRRqriAjqP
	MX79Dt114vXkyBO0IPl1wmq7wbnjhYdxyIR0gKsUKqbSo9sXTmF/Q9x8ja5eHbby
	7c53PVXWYp76XXDjwMBw7eDbHL3FQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6haw2frw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 04:06:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64J3sEjr021169;
	Tue, 19 May 2026 04:06:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e73wk0wbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 04:06:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64J46TxH10813938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 04:06:29 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00F2B20040;
	Tue, 19 May 2026 04:06:29 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32C2120043;
	Tue, 19 May 2026 04:06:26 +0000 (GMT)
Received: from aboo.ibm.com.com (unknown [9.39.29.16])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 May 2026 04:06:25 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Cc: Sayali Patil <sayalip@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Aboorva Devarajan <aboorvad@linux.ibm.com>
Subject: [PATCH v2 0/3] selftests/mm: assorted fixes for hmm-tests
Date: Tue, 19 May 2026 09:36:21 +0530
Message-ID: <cover.1779090293.git.aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzNyBTYWx0ZWRfX8gjc48HJZWw8
 qIr0KBsNell9uYZ3tIjneCVYVbvU3g7+jT03+KXsgS4jMHhGRpdEmJMpIs4q+fw8cVbkyP8aBCE
 MqSGOmiPMS6Zq/wlSxHljWrvYG3zeLPTldEX0H0fr+qBYd8ci/V4fqPZnFnN1Nq4PIl1bbBPqe4
 a/cuzw/jglF4gzlQ4ZFR3dRz2PopYHQ7PbBP893e65TWQl4WNG4N3W93Ch0Mp8t3k4wO8oG3pcK
 h1HUOoZtxvZsWCLiiZ5Z00/5HIL5oCCPKeA0W2GkKyvPFgBohHcpBS9JTtso0w4Yh7WdHZrDQWg
 nE+NZP0AlZtzHJxx8PApymsYtjwHkxu8KNz8wDWW6NHm35X6Ttn6deNrh47nt+UWZiOeHQzorXp
 R0jRVuFD77cCv0afDZJorYLTvNVGrEI3qvcNgsxO9bzvhHU2PhsZIj4qIcAmTLq3iNogob6PekO
 QPQVBiEvWZdXz/xV01w==
X-Authority-Analysis: v=2.4 cv=Np/htcdJ c=1 sm=1 tr=0 ts=6a0be1c9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=fsPjIq3vPFagtXREB8kA:9
X-Proofpoint-ORIG-GUID: j3Q4XY3U7EgWHhtnHFBlP64i_7nyE5bC
X-Proofpoint-GUID: j3Q4XY3U7EgWHhtnHFBlP64i_7nyE5bC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190037

Hi all,

This series fixes a few issues in hmm-tests that show up when
page-size and huge-page configuration differ from the hardcoded
assumptions the tests were written for (PMD/THP sizing, default
hugepage size, and related cases).

It also includes a fix to exclusive_cow: the test ignored the return
value of fork(), so both parent and child ran the same teardown path.

v1: https://lore.kernel.org/all/cover.1777870179.git.aboorvad@linux.ibm.com/

Changes in v2:
- Patches 1 and 3 are unchanged.
- Patch 2: fall back to TWOMEG when read_pmd_pagesize() returns zero,
  use a fixed-size array to avoid non-constant initialisers, and skip
  benchmark sizes that exceed INT_MAX instead of capping the THP count
  at runtime.

Please let us know if you have any comments.

Thanks,
Aboorva

Aboorva Devarajan (1):
  selftests/mm: fix exclusive_cow test fork() handling

Sayali Patil (2):
  selftests/mm: allow PUD-level entries in compound testcase of hmm
    tests
  selftests/mm: remove hardcoded THP sizing assumptions in hmm tests

 tools/testing/selftests/mm/hmm-tests.c | 104 ++++++++++++++++++-------
 1 file changed, 76 insertions(+), 28 deletions(-)

-- 
2.54.0

