Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B452FDC20;
	Tue, 10 Mar 2026 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158324; cv=none; b=Blkuicfd2sWwSj7SsNLKVvJSYfPHM4saTeczPIqQGigzrAOhJRfXTePl+FN6t+7YVZo8b81FtOJeEvaXgAQzQLu+E8bBbILkLxVbHkUGC/sQRHhylMX382e2hvmcOqYzYBPlb1ATlcVMeBaV80OeDAwQKRYVQm9feJXFKxlbw/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158324; c=relaxed/simple;
	bh=EioQ+s6DALilCIaIqpu0+FK3Uof/SiiRniIzo9QAP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mL9cZDT2G6zd3Xf/46yI6HtZA4MPmcyPSB00d+jkZcfBgL/G1gJiM5AgB7uu70UNGjRbW0tHGV2RRULwh/X1f9Wj1jt2Nse2icC9G8wpYOB8Ktm5NhN27MNp+J1/dOjxxIfgL8xUZPbLTADYpfkKxowr3spGNUAg0dD6kCoReYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DQQrAnE5; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DQQrAnE5"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AFcc0Q2582839;
	Tue, 10 Mar 2026 15:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=De4g2LAyWvY3GWO7BeINKqb2S28hz
	YXHWiu9xaz7NEc=; b=DQQrAnE5EBBJNqVzGSrnY5PZvllsaEenaJ/j35CNNMPc+
	if513RKpVaEAnuw7XCC/8qnWZcAM7Da0/vYEiBDqR1nDB7h3ZL8hLaCeBJwqIcaK
	84QfpayjX8aD45c4ZrkvbieaRqbpWlxLZWo1VzrjaEjdjBU3VLXmSZBkGrZ52OTq
	LvpzI4UY3ebYKgCwk7S0jYut+E99lfTGYr/CYGwkJAi3If72KsSKrYwgS54+LTq/
	uyX3WeEyeyydIV8MV21SB/2iXf3z5oRDZIt1vB8sfwltXKJys9gPTe7Ui/hJQyC8
	nGM0XfnozDi+tevFOfrF4FPstQEsK05ya7RuBnuCg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cskyp350n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 15:58:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62AEZh1l022712;
	Tue, 10 Mar 2026 15:58:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4crafa9wxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 15:58:28 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62AFwRjC027022;
	Tue, 10 Mar 2026 15:58:28 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4crafa9wu5-1;
	Tue, 10 Mar 2026 15:58:27 +0000
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH v2 1/2] mm: prevent droppable mappings from being locked
Date: Tue, 10 Mar 2026 08:58:20 -0700
Message-ID: <20260310155821.17869-1-anthony.yznaga@oracle.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100139
X-Proofpoint-GUID: 3ANEJ9zuxwbaKK0FOosQOnxfOLriMh2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzOSBTYWx0ZWRfX5pR1s/plwPJM
 MViPNiMklGdGKAA2mkRnPrJ5sLUYq13b+k4KDZ3wGxz6cF/d+3bbrePc2iZR4wvTTA3BSESsG9n
 ec5xBEY8h+RJCi70R3AqT9l/88yHAQftO3gCYtPk6owA1Kitdn/OWQgtXrjuGSb+J3fPrgwEGXI
 v9tyKNmy714ZzMFMK6U2ddyUceTRS5cU1phT/n6+2Ssh4MEev5Ms6qAZMU2mV8T/q24V8Bb8qWf
 dUvajm+yezMBXP2uNHJoWestU2BZ0/WtyiR//PT6O7IRGCSrqlA40Srbu7IYmPrh80SRUPXJvCC
 RxsFUOemI3bNn2j/AQR9Mz3P8V3dpKWrAAefslK1JuFKNCxMQlms1Tmuzq001Tfnxiq34EhC6Pz
 CHI9B+BQDBhy3anvgePs7icHCYliVke8Pe+nZl2UFRxvQftT+N5o5gstxN/sAOlRxgTEFQPqJaI
 haHj9KL8pUAU6gVxnQw==
X-Proofpoint-ORIG-GUID: 3ANEJ9zuxwbaKK0FOosQOnxfOLriMh2V
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=69b03fa5 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=iWkOVUfiZeQ8vpaLj3YA:9

Droppable mappings must not be lockable. There is a check for VMAs with
VM_DROPPABLE set in mlock_fixup() along with checks for other types of
unlockable VMAs which ensures this when calling mlock()/mlock2().

For mlockall(MCL_FUTURE), the check for unlockable VMAs is different.
In apply_mlockall_flags(), if the flags parameter has MCL_FUTURE set, the
current task's mm's default VMA flag field mm->def_flags has VM_LOCKED
applied to it. VM_LOCKONFAULT is also applied if MCL_ONFAULT is also set.
When these flags are set as default in this manner they are cleared in
__mmap_complete() for new mappings that do not support mlock. A check for
VM_DROPPABLE in __mmap_complete() is missing resulting in droppable
mappings created with VM_LOCKED set. To fix this and reduce that chance of
similar bugs in the future, introduce and use vma_supports_mlock().

Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>
---
v2:
 - Implement vma_supports_mlock() instead of vma flags mask (DavidH)
 - Add selftests (Lorenzo)

 include/linux/hugetlb_inline.h    |  2 +-
 mm/internal.h                     | 10 ++++++++++
 mm/mlock.c                        | 10 ++++++----
 mm/vma.c                          |  4 +---
 tools/testing/vma/include/stubs.h |  5 +++++
 5 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/include/linux/hugetlb_inline.h b/include/linux/hugetlb_inline.h
index 593f5d4e108b..755281fab23d 100644
--- a/include/linux/hugetlb_inline.h
+++ b/include/linux/hugetlb_inline.h
@@ -30,7 +30,7 @@ static inline bool is_vma_hugetlb_flags(const vma_flags_t *flags)
 
 #endif
 
-static inline bool is_vm_hugetlb_page(struct vm_area_struct *vma)
+static inline bool is_vm_hugetlb_page(const struct vm_area_struct *vma)
 {
 	return is_vm_hugetlb_flags(vma->vm_flags);
 }
diff --git a/mm/internal.h b/mm/internal.h
index cb0af847d7d9..8c67637abcdd 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1218,6 +1218,16 @@ static inline struct file *maybe_unlock_mmap_for_io(struct vm_fault *vmf,
 	}
 	return fpin;
 }
+
+static inline bool vma_supports_mlock(const struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & (VM_SPECIAL | VM_DROPPABLE))
+		return false;
+	if (vma_is_dax(vma) || is_vm_hugetlb_page(vma))
+		return false;
+	return vma != get_gate_vma(current->mm);
+}
+
 #else /* !CONFIG_MMU */
 static inline void unmap_mapping_folio(struct folio *folio) { }
 static inline void mlock_new_folio(struct folio *folio) { }
diff --git a/mm/mlock.c b/mm/mlock.c
index 2f699c3497a5..73551c71cebf 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -472,10 +472,12 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	int ret = 0;
 	vm_flags_t oldflags = vma->vm_flags;
 
-	if (newflags == oldflags || (oldflags & VM_SPECIAL) ||
-	    is_vm_hugetlb_page(vma) || vma == get_gate_vma(current->mm) ||
-	    vma_is_dax(vma) || vma_is_secretmem(vma) || (oldflags & VM_DROPPABLE))
-		/* don't set VM_LOCKED or VM_LOCKONFAULT and don't count */
+	if (newflags == oldflags || vma_is_secretmem(vma) ||
+	    !vma_supports_mlock(vma))
+		/*
+		 * Don't set VM_LOCKED or VM_LOCKONFAULT and don't count.
+		 * For secretmem, don't allow the memory to be unlocked.
+		 */
 		goto out;
 
 	vma = vma_modify_flags(vmi, *prev, vma, start, end, &newflags);
diff --git a/mm/vma.c b/mm/vma.c
index be64f781a3aa..18c3c5280748 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2589,9 +2589,7 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 
 	vm_stat_account(mm, vma->vm_flags, map->pglen);
 	if (vm_flags & VM_LOCKED) {
-		if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
-					is_vm_hugetlb_page(vma) ||
-					vma == get_gate_vma(mm))
+		if (!vma_supports_mlock(vma))
 			vm_flags_clear(vma, VM_LOCKED_MASK);
 		else
 			mm->locked_vm += map->pglen;
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index 947a3a0c2566..416bb93f5005 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -426,3 +426,8 @@ static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
 }
 
 static inline void hugetlb_split(struct vm_area_struct *, unsigned long) {}
+
+static inline bool vma_supports_mlock(const struct vm_area_struct *vma)
+{
+	return false;
+}
-- 
2.47.3

