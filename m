Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D4044606D
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014139; cv=none; b=fwqoQnJoHX82Ofej9UKmrUphYoUvOTK+F6zHTbqjhB+G9p/8bsO2GePwXtCDT1CkslaZT5pq/B/IAmqshCMPqAvFw4tKr9yldWQKILCYF7eIYcJz39zYcBNsdIZqUvdyTtebUogJ3zaV3Rc0NgKdI/BiBJVOF/q9gr18NaNnQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014139; c=relaxed/simple;
	bh=DXNxB5eHFvL5GDLkleU2o9SNHZVXxhFgsYdy6hDnrgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzFGO9IKpY47Oe/i2lIq3GDDbRzsaMNcbE4VHQz2BbPCoTwbkXsINCsbVzpUKfw4TGT2SbtDkeLHlCRARf2uQ4JOCelayEOHgnXklS8ncgUFxe6a3sibMKuAr0xKQPb/XMaiBt+2fFis6ay4TBGNcQJtdJo7T6HCdjwwhgxpyY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Me8FSZcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/yPDMnS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Me8FSZcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/yPDMnS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nsDP1876736
	for <linux-kselftest@vger.kernel.org>; Thu, 6 Aug 2026 11:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ve8DOLkpQsl9Ldm0gPnv6S8CZTko0GX4BIT
	/H0IxszQ=; b=Me8FSZcR0kxKyhqeohUcRrssIaCScMRfNHKSpHDI01ums1ReS7k
	opBdIQpQFDEJsRyOSUokp+b9p0SfkCK0bVWRqwgg3tqk1FyrcA5ys0g+AjqlXnKh
	SmHvElEBXtwOnF9KCsotmfw+E8YYGnG3kJHG4WYBQZnAPYw0mgTd4ua22WNeyUZz
	wwIKKZTdRAjTHSZ7pYCJEP9tPDfblP6wY9KyRQoRfhLmvjko7t0VaMDCSrK3jzNX
	yR/F6h0u06JeDDhn496jp57TjMg8cPjtH8YBZtEYCnsCxqZWU5u70umFLf4NWuIX
	yCcsvqJfR3PO2uKlX4GW0VIQ7PX2y8WnHFQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchph1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 11:02:16 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e7b95cd84so35104337b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 04:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786014136; x=1786618936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ve8DOLkpQsl9Ldm0gPnv6S8CZTko0GX4BIT/H0IxszQ=;
        b=h/yPDMnStZSWyhQx8qaZboh9wfCoDY9kDCzz1HTHALgMWkjs1NEuUHcCXb/YSN22+f
         OMzZ7LFE0fMkiGCdqqSB0bq18hYbYlreoo+MutE16UwVd5aOZanCFTkO+pp8fVFWicE3
         M4COzUISDLr2sOV/KEBdnIJF53d/9Dzt29/uIApc5A2L4qqpdRUdrhJpPChyexoRzMIJ
         jHuOmOmRcQGQ8Uy5b5MCNmjj944IobXkam+Y7txqrsy3BKqkFXvNpeyoygxGtYi1FBwR
         doCnHSh5qOvilnyNaJJyNG2DlkoLoOgEwHVKSl3bPIkDP+jYngbvGMKnEuiyq68eWHzj
         +oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014136; x=1786618936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ve8DOLkpQsl9Ldm0gPnv6S8CZTko0GX4BIT/H0IxszQ=;
        b=rPC4QSBh95JfiC1wUF7MY3QY70NZsLulLS0P5hW6XubPOFtrPFncBazrq6cjvXT02U
         pw0MOQtvIjVHkS4ehHNIGeD5b6eLgyoRUsytZ2CoanJcq/3iVlUn0sxdAXrycBJwI4rV
         vD2VEEHYXV0HYrLoR20EqWEeWDTN7MU0weR5ILAMX2yCWv6D8hVrEanBcGn7Kbe1ywPz
         Dy6bdvM7oypkwEU5gI7DXHTPoKj5hqEqO0+wUyhr9e4Hp/D7XNwJG6TXaPt5nj/KJMCi
         RkYREIWpNdE9HmCDZ9Fy6l5w1dOY6fD59i4mlz4MmteLRFz2ycFmLCWx3tDTNmP9Ahq/
         WcCw==
X-Forwarded-Encrypted: i=1; AHgh+RpJoAkLtgyxoTxQynrD1+GXydg8qycQD70S+Gov5k0s/nlVsY2jnl2V60PW/HghYuYEforbw42AiZewXsFPgIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2tkJVtNdmIdI+gfxbxf6ge328WKtYgpk5h3vn7SUpThI/zzfY
	yfxaoYnAqp8QHzudlI0pV7ltO4gTon9YCepeGc1RDq+rEIsNlScaI59PhzmG7hXyyCFsVFQa6o9
	xshzKiqHEv2lsz/2Msp35P+IwxTkPjjLpafi2BIO7Vf+l8eYKZynL5zgnU5+qM5s8c2OvH/M=
X-Gm-Gg: AR+sD13NYfpqKPZr/jtGceqPs37DsLqZXGCBTTdyX1Eh7r3Z6Q+WBVWEyY55t2CpSu3
	IdQagpK8qeV06LzeKrvr07RlbOm5fIcoOFHH8ChECm6dabbK2ETMMh3FtBwKaF+g3ZSqwlyiBMB
	7bU0Z17+sVQBeNOSby6S92UCBRks/NWcjN+th0PUkz/Yzi3W8/dfVgiolPDIph1VDktmCcWjILM
	pg646nuZH+tM0smVG1JBO4VqSqGF8DnJY45B4FQlZvvfOlxV0E0NldQEUjxXxSWrhgNZ7Lvpj8c
	0vgqrIQtoaWkYdUvuYvGMLI4+LF07rhiPscMLHRt+AKqkInv/amWsk2HJ+HTYhMbFhYIM4OuNTO
	VhShMGYr3eq0n+WYMeLk=
X-Received: by 2002:a05:690c:9c04:b0:81d:5806:ecc7 with SMTP id 00721157ae682-8202229532dmr82149417b3.1.1786014136161;
        Thu, 06 Aug 2026 04:02:16 -0700 (PDT)
X-Received: by 2002:a05:690c:9c04:b0:81d:5806:ecc7 with SMTP id 00721157ae682-8202229532dmr82149047b3.1.1786014135701;
        Thu, 06 Aug 2026 04:02:15 -0700 (PDT)
Received: from juillet.lan ([2a01:cde0:108:24ed:1501:7670:a13c:4834])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820131db335sm36808917b3.3.2026.08.06.04.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:02:15 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH 0/2] powercap: Introduce generic hierarchy helpers and selftests
Date: Thu,  6 Aug 2026 13:01:57 +0200
Message-ID: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NyBTYWx0ZWRfXwQlA9OF2kp5g
 St9RdM2KX2FQK/rMk95xv+qs3AnAc3OA7xmxBnH5qDbG2QalmjAbgxIYYW5YHy129Jjo1xJZnKh
 HmlUYPAmo4sKWWYueVvPUCEIcUVxkbA=
X-Proofpoint-GUID: u7qxK_hRlmT8TpBeV2wuISLFE69FElOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NyBTYWx0ZWRfX524tUHfSBtpK
 DGso+SZgwddHV8n9B40nZKmeljf57xPBgmJLjzCRE0PmewKERACmi+PV+BlFwe0P+cnNc2Hf/IE
 RiCjoghcuRDR5aCoV9Vxys/mfLosRxLZ+hoMT+ebQBYV2nCOTO6b9+FvrPVly/9Rk5A8aVK1XKD
 0xvXUv/r7esAkYpdnWo6LITqqDzuMrabiecbZMUVUgs7YuTdtxszYabb6Bn16eSOYaIYaMdb/Qd
 C36Nx/RqUIn7w48SHiE2jsDf3aP2EzqEHxpc0n3OT4jW3k1AHng03iuKEvmt230Doz8sAZlYQ9t
 x85y7WBzOOtZH8+9scX6MpEjf5SaS1bMQ1t0qZc+yr4ICZ/bew9lycWHd+uF1dzr2DwznE9I64W
 W4fqE7L2nkKYltL+pcBTvWOJCewsQrTjX8OLdvq1Va2WktDZBnTETykqCH/tEvlv4E6CYd1BiVG
 4MY2Tl5gv70iJ01iARg==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a7469b8 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7e7QNVdAlerzdPoms_sA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: u7qxK_hRlmT8TpBeV2wuISLFE69FElOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060087

Powercap controllers frequently expose a hierarchy of power zones (for
example package, clusters and CPUs). Until now, each driver had to
implement its own hierarchy traversal, parent lookup, error handling and
teardown logic.

This series introduces a generic hierarchy description and helper
functions allowing a controller to instantiate and destroy an entire
powercap hierarchy from a static description. The framework takes care of
duplicating the hierarchy description, rebasing parent pointers,
creating zones in dependency order and performing the appropriate
rollback and cleanup on errors.

The series also adds a kselftest exercising the new API by creating a
synthetic hierarchy, validating the exported sysfs hierarchy and
attributes, and ensuring that all resources are correctly released when
the hierarchy is destroyed.

The patches are organized as follows:

1. powercap: Add generic zone hierarchy creation helpers
2. selftests/powercap: Add powercap hierarchy creation API tests

The API was primarily motivated by the recently posted SPEL series and
also provides a migration path for DTPM to use the same generic
infrastructure instead of maintaining its own hierarchy handling.

Link: SPEL cover letter <https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/>

Daniel Lezcano (2):
powercap: Add generic zone hierarchy creation helpers
selftests/powercap: Add powercap hierarchy creation API tests

--
2.50.1

Daniel Lezcano (2):
  powercap: Add generic zone hierarchy creation helpers
  selftests/powercap: Add powercap hierarchy creation API tests

 drivers/powercap/powercap_sys.c               | 148 +++++++++++
 include/linux/powercap.h                      | 178 +++++++++++++
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/powercap/Kbuild       |   3 +
 tools/testing/selftests/powercap/Makefile     |  17 ++
 .../selftests/powercap/powercap_hierarchy.c   | 247 ++++++++++++++++++
 .../selftests/powercap/powercap_hierarchy.sh  | 118 +++++++++
 7 files changed, 712 insertions(+)
 create mode 100644 tools/testing/selftests/powercap/Kbuild
 create mode 100644 tools/testing/selftests/powercap/Makefile
 create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
 create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh

-- 
2.53.0

