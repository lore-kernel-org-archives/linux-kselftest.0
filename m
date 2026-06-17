Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C54503B;
	Wed, 17 Jun 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698575; cv=none; b=ZpSkfmUNm5ByTcjiOopkn4NaT/o+k7CtJcmXsFsx+ODeYs2m/kXKGtObNrP6rnbVJTryK4rXecjTbwB9dnKtw1VNWnFZvSk7GumtTQ/mhTgIu2fg2bx3xHpsqHLZSWIvxO+Ss77ivPWf4JfwnqCDc1SzATC5ktX2QxQPB/VvPsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698575; c=relaxed/simple;
	bh=g+LEkPvgkWKbgTkp+1fmmvnTpJndMlgkhh6nDl+Vtrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bP+JUt9aVWjx7D3rB9X42barAQqWOf5G/NNfv4ic1/r5qRSsuMOuYHFKKSkZb+Qw2xrZ0iXnfFBLYdt7owBgOlLQWpC5yo3OI4OlIT3mr8Vp1Iy/Gr7uGy0hZfn9sm8rgJX1bHzeq8W9bSM2jWsmZ/Ab1iq4kpAQWKM0ar35XUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BQO8mgXV; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BQO8mgXV"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8mj8h4003680;
	Wed, 17 Jun 2026 12:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=L+FAlSxoBKHtj3poE
	xWb1BpTaJVIQgPidlJhgtMj00M=; b=BQO8mgXVGb8pFF6noQ3A0G4b0T+0TsFLT
	Vlr1lYEk3StIT3v9ilCwXgO9eBGyiCmEJp173ncnSPsVxGzzZhEXGl8xl5CcAegD
	vplXwTB94PxJ++rt2XDGyKd8CMDWKy7JIxuRKkDN2oF4bnKo1lN59hmwIlpplTLl
	sXqnW7SESDkZUs5dKOX9ngwogxhVE88S1sIrLbyCWP0JFr/jW6is7lOvg6cIMYhY
	eX9ajD18JcCJQdndoG8qIC1ykGdBZZjtSmwfTZ7StgZ4GjzI/lAoeU97C07Lw9ao
	mSQ5x9iWJ3XpwdYq2GuKcukrffsKoRMm1i1/W2FbkB02ebtHYisuQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqx2rqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:16:00 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HC4aRL005496;
	Wed, 17 Jun 2026 12:15:59 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4eudva329d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:15:59 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65HCFvA816843318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2026 12:15:57 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CC6E58058;
	Wed, 17 Jun 2026 12:15:57 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DA2458059;
	Wed, 17 Jun 2026 12:15:53 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.28.81])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with SMTP;
	Wed, 17 Jun 2026 12:15:52 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 17 Jun 2026 17:45:51 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v3 2/3] rust: kunit: add 'kunit_suite.status' binding to 'kunit_unsafe_test_suite'
Date: Wed, 17 Jun 2026 17:45:22 +0530
Message-ID: <20260617121535.462459-3-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617121535.462459-1-vaibhav@linux.ibm.com>
References: <20260617121535.462459-1-vaibhav@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: CzYeLTTYZJ_LAyFc3DDl83Oco2LQJzhS
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a329000 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=nzuXsxulAAAA:8 a=VnNF1IyMAAAA:8
 a=GF3r_HLv5JrM67tSYL8A:9 a=Jn5cl5okm61iLnyvC_SE:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMiBTYWx0ZWRfX6N3dbBV5Z1am
 HFOVsNcqJ1tVJDPMZMEdApLxqy0NH95fBJOT17b9sjsVv8s/mU650B35wz9UuKH+kx/sXPTfMni
 e/RialhgRzw218pm78uYeJFhrXQFmA4=
X-Proofpoint-ORIG-GUID: O1I_LBhQiiR6k0MvLA6kabGrS0CmJmKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMiBTYWx0ZWRfX+fL2KnGdhq7I
 PM00mjrUBZgr+r6lfOWBpXXHfvd3UdoaciEvG0du5oIbeMv/5ljf6mK43XbmKTTL+K+PBGKaK+1
 M39c5lgSdiWBOjzYLOEoh3J94ujgy87VikKmjpQyIJuc7Xj0rljLNgLrN4gEE8xvmJqXw3eN+LJ
 rPfcWtt0ZpYV7zaUKptvSRpw4JuCNmi51eiQrR1H5IxUVqhy2notk18ap5AFS4PIFQQne6td+Zf
 iq5va4qvllf2/ah9mnilqZN9jgoPtPc6sRErcTOY6GONoXgGxtgBxWWzjyGamSvu/fMp1S3QK95
 yR8o9l8vdi+HXwMqfoNBrIC1Ha1uXHnd4EXSjQdDXAvpQQlgTSz81fMWQOtnL6mi/UwHZ7j4YVD
 p8tXWBOHvachn94mbmOzGBDUT7CfvhG2N6N2qWPJDja6bTx8xqcCYIz+uJrxCKqcSDsaLxgjVP2
 c8uFBx+Hp6F/mRGxdpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170112

Update KUnit Rust binding macro-rule 'kunit_unsafe_test_suite' to add and
initialize the newly introduced 'kunit_suite.status'. Without this
'kunit_suite.status' field is never initialized which is an error for the
Rust compiler.

Suggested-by: David Gow <david@davidgow.net>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog
=========
V2->V3:
Patch, not present in earlier version
---
 rust/kernel/kunit.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index a1edf7491579..e07894c72d0d 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -288,6 +288,7 @@ macro_rules! kunit_unsafe_test_suite {
                     log: ::core::ptr::null_mut(),
                     suite_init_err: 0,
                     is_init: false,
+		    status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
                 };
 
             #[used(compiler)]
-- 
2.54.0

