Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8873A3E79
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267509; cv=none; b=HABIFI7NVaEwgB9TdWAY5gZ1t++gkDdRBndz7IVQSRLG58gRRzeDroVLFzlzu1uDS88lUYw2AAYrg9I2GI0F24E/nwiaZGsS0uCuvX1+GJ5ZdvWiNwFwhRkZpNrPFIx3X7Pr2FiA6QV+YqCmURQUyNiPVVToCbse19yeVV8ctew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267509; c=relaxed/simple;
	bh=fd6B8sCD+3sNAl5Sq4HJx95VGGp4u0nfYAEMqd9qNOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ae9Be6gVJ2dnFGzneKvxupQ68OYBXwXc8VqpMP08NUO1I3meLm8yMfoRT8XZghzjvEm0teGhNdzJwf6lYtNntE/ZI+mIr/iEefwqEhFGDe2PAEiDsqQE4iYOCy8da/eYDLz0m2JglYl+2ytrYCux2vRqxobW9beigMXYVR9XLfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mKkvcKeh; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mKkvcKeh"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JJIiQ23991710;
	Wed, 20 May 2026 08:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=LEuzo96EvcBe1L0RHV2X4G4DgTPw2E1t0irsEQ+uW
	os=; b=mKkvcKehSZKLNr4vEWY6375jNajk3+/jonWds9xLcQuGq50DV6ELKfKa7
	VS0DGZylMSIr3OUUtDutXf3Dx8Xu5C7thROYxYymQX8uVt6wx1yBffIn3EzTxZCA
	U6F4sUBqlGPmOXNfXXKZ3p3JZKJc7CwaB/OgYvsQqKnZG8TAy2yP3VSt8G2Z5kVy
	BQuK6yatPKRVRtgJlj8/PF8+/0oKLV87xmKMgGTHiNpwNLYQPX6pERYKay9o3sWL
	yPqUTAfws+W3vxX+pU9Q9cjWhaVlDamOjnqYE1AJhroJIs6iTuIJrcrQDpvCReQl
	iI+oEHuXY+KqQCEtTfnHJ/dh8uVbQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6hb8g88v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 08:58:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64K8s85k023572;
	Wed, 20 May 2026 08:58:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e73wk6ka1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 08:58:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64K8wCOl48169314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 May 2026 08:58:13 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1A8420043;
	Wed, 20 May 2026 08:58:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03A4E20040;
	Wed, 20 May 2026 08:58:12 +0000 (GMT)
Received: from li-49acbccc-2994-11b2-a85c-d51b89e344f1.bl1-in.ibm.com (unknown [9.123.10.212])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 May 2026 08:58:11 +0000 (GMT)
From: Pavithra <pavrampu@linux.ibm.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, pavrampu@linux.ibm.com
Subject: [PATCH] selftests/mm/run_vmtests.sh: Fix protection_keys binary name in run_vmtests.sh
Date: Wed, 20 May 2026 14:28:09 +0530
Message-ID: <20260520085809.739101-1-pavrampu@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MiBTYWx0ZWRfX23KMcJ36YsqL
 K1x0sYZo+IwPUatnCOS30DxcwzvR6FniE0HsVEKNmeQI91q8d+JCixyzOVXkF0NcQp+W8hgMcSM
 wGM48S58Z1Vg0sbEO6supZDPY0q5mbyrtEKFYDQ4hG9PbPKlIPlmnZYLqv5RuXSXQiNrwoGLuPy
 L6si/L1bSrXkbw+YJAV3OhSJdyatsdLY4t4v8JYkpWtStnHIuUV+kbUOiQMGmHO+Lslyd3IDRN4
 8izBckxtXB+WnseqnmkyuRusO0CwOjn23sm83s1alprZ4WMAovmYJaTE1zraJrLvDLBBBAD5NIG
 axSIuLM7ZBu6d2UKdKBAkLvS5zcG5SwL7OibzH6PYUxlSmOgeC+EBTsxj2RNSvpR4fbk0vV2j3j
 xhjXcCE1VcM6scm9jbbqzaE2AZT3/i51xre5ktqokptYb9CKkTihfgl8GnF+NxII4DKmd5xo3zY
 D64zlvNrP6rxoQ4bqrQ==
X-Proofpoint-GUID: 5WOXTND9afN9flM3UrzXcdNnl0lyqMeX
X-Proofpoint-ORIG-GUID: 5WOXTND9afN9flM3UrzXcdNnl0lyqMeX
X-Authority-Analysis: v=2.4 cv=aYBRWxot c=1 sm=1 tr=0 ts=6a0d77a9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=lXLsEBLhcoI0ZpkwZQYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200082

we have protection_keys_32 and protection_keys_64 tests mentioned in
run_vmtests.sh but the binary name is protection_keys with current
kernel, adding the correct binary name.

Signed-off-by: Pavithra <pavrampu@linux.ibm.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 043aa3ed2596..a6b6f397d942 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -344,14 +344,9 @@ CATEGORY="ksm_numa" run_test ./ksm_tests -N -m 0
 CATEGORY="ksm" run_test ./ksm_functional_tests
 
 # protection_keys tests
-if [ -x ./protection_keys_32 ]
+if [ -x ./protection_keys ]
 then
-	CATEGORY="pkey" run_test ./protection_keys_32
-fi
-
-if [ -x ./protection_keys_64 ]
-then
-	CATEGORY="pkey" run_test ./protection_keys_64
+	CATEGORY="pkey" run_test ./protection_keys
 fi
 
 if [ -x ./soft-dirty ]
-- 
2.54.0

