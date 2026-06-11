Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194903161A4;
	Thu, 11 Jun 2026 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149301; cv=none; b=Xam6OWYuXl7IWAEdbABwidR8X/Rz03MaOSc1uOQ/ckWeQYeQPu3lN8QUtSYUQHPzdglvZ79DqD6Gaw57W37TrLPRjwI+pl1IHjyQlEWgsA9U37dBicxEI/3i8HPa33infubONcmPvyJEG81igibme1QEE8ariCvG1uSoLzPJCwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149301; c=relaxed/simple;
	bh=7yWpXLaw6CYFRQ1cAa6Koqi5tWvFVhIW4pgfODm3Zso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wo61991dMR4kA3/117DbAV7hzQIggBRQem4Y5GkwNbwPKD430YLQurSK4UHT9+RroBzjywnHLXkW1N115SvY5fITtPU5xFI1COshiV0etY77KJVVEwvxIm/PQmz6Z8wZWWwHQShaaUFh7GhuPZuo/b5twq2akfyBLy0DdtFOet4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YrzZrABd; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YrzZrABd"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AJu40a4146513;
	Thu, 11 Jun 2026 03:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Y0/G7y6HjmKYou0RghAqp0snLCOrcWkAONdunbULC
	wE=; b=YrzZrABd5k92FeXsmeuix8MMgDfOGWOZo+vCT61fexToTnJG0NKtutaK+
	drkrwWGBkNdTeamoSHkwspxzQ3Wj0SL0K3FS9ncDCThO5e5NGCqHH1wMNeOwQHLr
	/O5Rx221zYtfGQ3gbov7Qy5L3hLUv7/CNYevnjt/9IxGQeOOd1j49wEzvKyR0hap
	vAF6limJNQmlYiW6sY2YsfhQwkdXXHR8BF/SvZc0JEQGoCImuMNAEXGIfm6Ywkp4
	HkV0nuyWnMaUWKfsie4svONWhGaGuL9TWn1JTltzz/Fv3PnVFpPX4QsPsvzslWBO
	QIqHFmq7eTbEmxgEve1PTUvW2gtag==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eqe8c18wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 03:41:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65B3Ybuf009495;
	Thu, 11 Jun 2026 03:41:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4eqe08sfax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 03:41:15 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65B3fBGW45875570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jun 2026 03:41:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 907E320040;
	Thu, 11 Jun 2026 03:41:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C1832004E;
	Thu, 11 Jun 2026 03:41:04 +0000 (GMT)
Received: from aboo.ibm.com.com (unknown [9.39.27.36])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Jun 2026 03:41:04 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R . Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Shuah Khan <shuah@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Balbir Singh <balbirs@nvidia.com>,
        Alistair Popple <apopple@nvidia.com>,
        Alex Sierra <alex.sierra@amd.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sayali Patil <sayalip@linux.ibm.com>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aboorva Devarajan <aboorvad@linux.ibm.com>
Subject: [PATCH v3 0/3] selftests/mm: assorted fixes for hmm-tests
Date: Thu, 11 Jun 2026 09:10:59 +0530
Message-ID: <20260611034102.1030738-1-aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAzMiBTYWx0ZWRfX33cLrJmY9dIL
 kF0N0bHQ9VM4NKCR3g/A6IOfci13Z0c5mkLEFwf0uLCkwAb4pVoK5nRsRDb41XTUqY6SM4e/2HL
 jYz43BSCzUxJWjZJP9bBqQ8TEUb9694=
X-Authority-Analysis: v=2.4 cv=AYCB2XXG c=1 sm=1 tr=0 ts=6a2a2e5d cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=fsPjIq3vPFagtXREB8kA:9
X-Proofpoint-GUID: naBpAaJcwPSnvDYDmdBpIrHgrXyzYpME
X-Proofpoint-ORIG-GUID: Tp18Vn8KOllkXEz0SE-xkHUgxLzRu0OH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAzMiBTYWx0ZWRfX9vBvpXKNlHce
 cDEIQotyBFi2K5p2SnRlZEcA1yyIOgkOUh8jmGAMU2fk69BJFizQcAYM7ZqIVvQZotjkJ5MUY1f
 dKpX6X4aGeQHWF003684hPU6Y5k1noIsDlHQjIO+5PvFQpmQpPkAJzbmhEQDqjjtsfCU56h+ujN
 bt8Qe7eRCHNU6BLGzJPvH9/RD55tHtK3ShlBuwY63SEQiMzdW1IGYADe2DoyrCVkB6ZJDvDEaN0
 NT2vhomgAPoRQx8E1WzlotWvhETK96WJ25a58CBbn3i8NbRZ71nTq5cbzUD0uHM2B3bMHvnRscQ
 2AMpMz4D4uqk9c4KQQ5gKhmiDQARP7hCRWCDqfxpMD1+H9FpUUNIlLZMsWtSxQ7avkWUAJS2umM
 nrw10I+TqZ8iEK9QxtugasHs4XNTZbrxlQtdQppOl+uO+Vv1iIRCtB7wr+9MNF9uEKAO87Gpmoy
 D2He+3hpT7UeyLlONdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110032

Hi all,

This series fixes a few issues in hmm-tests that show up when
page-size and huge-page configuration differ from the hardcoded
assumptions the tests were written for (PMD/THP sizing, default
hugepage size, and related cases).

It also includes a fix to exclusive_cow: the test ignored the return
value of fork(), so both parent and child ran the same teardown path.

Changes in v3:
- Rebased onto current mm-new.
- Patch 1: reworked the compound testcase check in response to the
  Shashiko review. Instead of an ASSERT_TRUE() that ORs the PMD and
  PUD cases on every page (which loses the expected/observed values on
  failure and would let a fragmented PMD+PUD mapping pass), determine
  the mapping level once from the first page and then enforce that every
  page matches it exactly with ASSERT_EQ().
- Patch 2: Unchanged from v2.
- Patch 3: No functional change from v2.


v1: https://lore.kernel.org/all/cover.1777870179.git.aboorvad@linux.ibm.com/
v2: https://lore.kernel.org/all/cover.1779090293.git.aboorvad@linux.ibm.com/

Please let us know if you have any comments.

Thanks,
Aboorva

Aboorva Devarajan (1):
  selftests/mm: fix exclusive_cow test fork() handling

Sayali Patil (2):
  selftests/mm: allow PUD-level entries in compound testcase of hmm
    tests
  selftests/mm: remove hardcoded THP sizing assumptions in hmm tests

 tools/testing/selftests/mm/hmm-tests.c | 125 +++++++++++++++++++------
 1 file changed, 95 insertions(+), 30 deletions(-)


base-commit: 801c5efa788952095586d076fed1ea4902facff8
--
2.54.0
