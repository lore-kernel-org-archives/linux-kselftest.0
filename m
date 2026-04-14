Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BB3A6F01;
	Tue, 14 Apr 2026 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155000; cv=none; b=cMR//LgMsCdIgRYszx+skf8wPN6FsDiXsYegEUGzM6uxeIsvPbnyCnuQCrlhepDGNfQZ6mYnINQV4Ix1ZCstr0lNDJUP4bedmGMgfL2rPRbL31riii4ksKY9q1Alns8ZbsWdRoi8uSxZ8vJ0ZrEU+QwjDp9h99D3w73ykHl58EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155000; c=relaxed/simple;
	bh=qe7862oHZyGNEDBvsQMIgWBZB5eyPOzbNdyR67dTBsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDI9FC9x6LMWqAlTaZBIS/qvh02Awmw4PmV/NvSQQQtYNI6rGeVl1eIpRBVtLI99I96eoFOVarEwZ9fuRvXZYpZF111eARQtqayZBJZwhXj9knI0oEHyMmkhbooT3vEmubzsWARZ+aYQWSe7OyABk2prTvqUn5mjx5eZzTtzQbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Dy04uXgm; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Dy04uXgm"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLIWoL1734194;
	Tue, 14 Apr 2026 08:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=PIfsNgy2577DuXl0N
	OF1ozWvbjY8j3LLjpYwpQBtv2Q=; b=Dy04uXgmJ6HQH2mkJWkMw48Lz+WnD5fi1
	PRe7XdJb+l7DPwFUTvRFjDxLjStHLLMsRLa7rICCG7ZsRAlmYxRt/3rnGbrYTm1U
	mo5Nxq6DfV1tR9ZNmtWp8uWhDYxiM3g/cnOc38Inhi9Mbkk+rJaXevnCpIGsQwH6
	ocOn50Chq8xKaf2cHDvO/yIocOduX3lwOqaKsPn8LGSfREm3MTKqYYuD7+bfBre/
	KiG71z+sOozqTOtYBPBbLiuGnFbqkcvO78QCwqCEG6PRJj2IJyYSpAUn9Hdr4UyK
	m0WsJOEeP8z/HthrZFVo1yBsNyOiQPAklUirAXACvIYyBws/38XlQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89m1pp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 08:22:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63E605Fb025862;
	Tue, 14 Apr 2026 08:22:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg2ujgec0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 08:22:58 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63E8MtOW54264088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Apr 2026 08:22:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A6E520043;
	Tue, 14 Apr 2026 08:22:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47CFD2004B;
	Tue, 14 Apr 2026 08:22:51 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.39.26.223])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Apr 2026 08:22:51 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Michal Hocko <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com,
        linuxppc-dev@lists.ozlabs.org, Miaohe Lin <linmiaohe@huawei.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Sayali Patil <sayalip@linux.ibm.com>
Subject: [PATCH v5 08/14] selftest/mm: align memory size to huge page size in hugepage-mremap test
Date: Tue, 14 Apr 2026 13:52:02 +0530
Message-ID: <6aecfff81bd3e288e66af238f50f35eac0bd4ee7.1776150071.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776150071.git.sayalip@linux.ibm.com>
References: <cover.1776150071.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=69ddf964 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8
 a=7t5IiW4R7ddU3FUDOzEA:9
X-Proofpoint-GUID: Ll73KCu9JhI0EZGDItcsvD_m4RnAukxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NyBTYWx0ZWRfXxq8CYlg+lax4
 dR6o50KfmRTv4slaMwr+lzQlXHj0GSIoVhDYBSYq70rr5BsqvGZK6TDce5pxAokFbgWucQtwV3y
 1LL9jZPWfBXF2w+tImKA8k34ShkXrj2vcMitORXDIVNqom8QD+Hg3ib2eKOFuyfkg3XgY3lDb2M
 jKVIIqImhDE9ssX+zijb0LuDmokK8JJjCfEO8rS/8ifn/PyFs2WYx2J9d0kCsMgGmWJfAC22MWe
 Y2d9txnoHD5n6kNcghnQzMlqwfU5WhbpAc4arxsiLuG4heQG3nUpKr0GrjW9ugh/h0OlFQxAjjZ
 bxavnR8jKN+3iM3ULoyMR0zY0JpxL9FSB5eqIsbCE9Y4OZsPP3BTGs/7Id9lT29kfn3j0Q8z3ie
 vzpPQb4TRKAzq0bDwwUuXqgiCjomkst3ze5WvuG7SBhXQruifkxre0AlRwQDjM7c10aW3ubC5m9
 lvikv3OGyBtsQk/OeEA==
X-Proofpoint-ORIG-GUID: RqjhDONzob-n3QKT63z9ZJOJjWZFSPJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140077

The hugepage-mremap selftest uses a default mapping size of 10MB
when no argument is provided. This size is not guaranteed to be
aligned to the system hugepage size, which can cause munmap() to fail
and mremap() to succeed where a failure is expected.

Align the mapping length to the runtime hugepage size using
default_huge_page_size() to ensure the mapping is properly
aligned. Also handle the case where
default_huge_page_size() returns 0 by skipping the test.

Before patch:
  running ./hugepage-mremap
  ------------------------------
  TAP version 13
  1..1
  Map haddr: Returned address is 0x7eaa40000000
  Map daddr: Returned address is 0x7daa40000000
  Map vaddr: Returned address is 0x7faa40000000
  Address returned by mmap() = 0x7fffaa600000
  Mremap: Returned address is 0x7faa40000000
  First hex is 0
  First hex is 3020100
  Bail out! mremap: Expected failure, but call succeeded
  Planned tests != run tests (1 != 0)
  Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  [FAIL]
not ok 1 hugepage-mremap # exit=1

After patch:
  running ./hugepage-mremap
  -------------------------
  TAP version 13
  1..1
  Map haddr: Returned address is 0x7eaa40000000
  Map daddr: Returned address is 0x7daa40000000
  Map vaddr: Returned address is 0x7faa40000000
  Address returned by mmap() = 0x7fff13000000
  Mremap: Returned address is 0x7faa40000000
  First hex is 0
  First hex is 3020100
  ok 1 Read same data
  Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
  [PASS]
ok 1 hugepage-mremap

Fixes: f77a286de48c ("mm, hugepages: make memory size variable in hugepage-mremap selftest")
Reviewed-by: Zi Yan <ziy@nvidia.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/hugepage-mremap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/mm/hugepage-mremap.c b/tools/testing/selftests/mm/hugepage-mremap.c
index b8f7d92e5a35..f66e4d806477 100644
--- a/tools/testing/selftests/mm/hugepage-mremap.c
+++ b/tools/testing/selftests/mm/hugepage-mremap.c
@@ -32,6 +32,7 @@
 
 #define PROTECTION (PROT_READ | PROT_WRITE | PROT_EXEC)
 #define FLAGS (MAP_SHARED | MAP_ANONYMOUS)
+#define ALIGN(x, a) (((x) + ((a) - 1)) & ~((a) - 1))
 
 static void check_bytes(char *addr)
 {
@@ -110,6 +111,7 @@ int main(int argc, char *argv[])
 {
 	size_t length = 0;
 	int ret = 0, fd;
+	size_t hpage_size;
 
 	ksft_print_header();
 	ksft_set_plan(1);
@@ -126,6 +128,14 @@ int main(int argc, char *argv[])
 		length = DEFAULT_LENGTH_MB;
 
 	length = MB_TO_BYTES(length);
+
+	hpage_size = default_huge_page_size();
+	if (!hpage_size)
+		ksft_exit_skip("Unable to determine huge page size\n");
+
+	/* Ensure length is hugepage aligned */
+	length = ALIGN(length, hpage_size);
+
 	fd = memfd_create(argv[0], MFD_HUGETLB);
 	if (fd < 0)
 		ksft_exit_fail_msg("Open failed: %s\n", strerror(errno));
-- 
2.52.0

