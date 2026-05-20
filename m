Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C583376467
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265318; cv=none; b=MhpBklPOsrHe06LHszmpcH+ywVFtuin49liyIT6AcWv5ILF9hD1mvRsRBAw0lvkKl0Vlm7e2tJ8THFhO6Xsn0wsQqKoIyi4/IO8gIeQqq6FbfT0bjBffD67/jlW+Cuh1xdIB+1JKgVXYy1R5qDyHT/q7hKZFYG7Jg2oYNeuek0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265318; c=relaxed/simple;
	bh=uHESdCJVaaqQg66ue1kgOmBIiQYfXseQnocX9sdF2/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VZ1leqTHV3oAjxQK4C8sBpBZJejNEZCd6gyX/D8qeFSzlTn6Vw7nLGDAEbniQXBriaYLiV/ROkOraeF4nTK+c6dKG4gF0yueepYmm7qGvwN8IW/oFEOVZhfIBmcXp7uARKkel2xSoBRV+RwcGA3Ne/as5pIMWvi03C1q7s5bit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4ClvOWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1nFRD6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4ClvOWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1nFRD6L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K74o0p2867863
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iRxXceYW+ye/57CGt2L8cc
	DYPJ39Z0WwwgijGkL+MEQ=; b=g4ClvOWxGa5tPdvG8FfhA6dJohFjguMrBwLGnp
	SAJjBj/uIRJD/KaIBcHE7QABzz7oqKlbRJW3RnSwxERUCGtV2vdSyrM0lTs9ps8u
	Ta5VrMzpiV53svCwg8dDzS+NuUNVcxmIQSjg8g5x4kmcKJOovOAoMC9IkTmirh6F
	amAjdaGQq4ZF8kHsdwRQzuYfJ/4uZCOw+lngawJTt0pixMaSukD7/9wqozc/K9TB
	0nlAjZLjFycZNU2xGRbbXMIZPpf7sIYJ3IM4VjZXm/7M2MCnxU7V34pz1HRECKOr
	4wBAzmDkDg0M0+Dm+5skWl2z7r/+gos3aXQWKClek9GxvqBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3wbstf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:21:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso123309281cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779265316; x=1779870116; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRxXceYW+ye/57CGt2L8ccDYPJ39Z0WwwgijGkL+MEQ=;
        b=f1nFRD6LqZSN/Z+FJomN0IANhz5up8DQgJdyTirjmklslkrTJsYNzjJr5VJXCyr1pb
         Mm7PUbUru8St3bFBGqMz3oYE863PfyUSorx/CfAHaDxmbMsSr/bsb0aLRJILzSRIwhT+
         X0GO8uBVL51mCFi/0kBZfdMRgq5ZAXSWPYjTGe2kBhggg3oEWxJGAEWDX2vVEvZYRgCe
         WbY4cup0h9OpJPBOyJJ0yHsLp5HdlIXZBLXpYLkO7vmV/u5x/O63IoMZFB9QXgjrCaPQ
         ffk0L7/s4Kcxfr+bJGvJfZhaUJOjffWbq9jm4SVzSfUHwq1bHqH4XPyrNqqR0bA23FH+
         s/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265316; x=1779870116;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRxXceYW+ye/57CGt2L8ccDYPJ39Z0WwwgijGkL+MEQ=;
        b=Hz5qqv0jWxV8UmmbEwR8lWcMiC/ciLKP56jl+nweoP4+hHDKKOBtHxFASjEmskyUgm
         g147BKbadmqAkEX3/QxlEe8BIkooCq5+XxSrF4qRnYjKaPk2Nm41mLDRSae/S9auWCMF
         Zmmf4ZvLAPq+Il2XSdZ8PliLuUpqQfz9hiH3+FdwvXheApjstd1FPdmOepKMCfcY/NqL
         AQBgA+UIdsMY+kdUQZOATi21HSLB5dasj7DIMujnX8tR8uBLKKGc57yqnFIqbI6TlCtk
         0RZpGeyBUveE/W7X53bsOvrYY7KuhYtBVhRKQweXKmEsvMMoRKu/z9RNIogwuYyTp0YT
         32Vw==
X-Gm-Message-State: AOJu0Yx2Kjchz0KvvgedCC7rJYIyhGD+0cXy8NX3oc+RPlKbKazkCM+K
	sZUnEDgL5o2XoTpdep64EZIq5VwXLBHo8KflC2fPmjko+yodSQ65QLe3V7XD84PPnyMLegPVE6W
	Uc4yDWd6CCcoQBAcGhMpPj5NHL1SbEIo9nY6TY21+p5mUKWguGWdI8Gmv/KooHuQuT74kAxw=
X-Gm-Gg: Acq92OHTjKRtTKFck1ZTMK+mWeXf1fOyCS6iVcoheyKCcd1hmeTNaK2paWBmQKy8yJ4
	F2iY9yMzSy2A8hEjtgSBANaWDbup3Lcbu5DFQ6xWrxdDMUENQqW+9VvXTQ7jHjAjNHCAXjAgmlx
	0GCsXPkWB0psvmCPVSiYHcYhhmXsIAC+WFM9eY4nG18PPVcMcYTCq21jeITc3zzqGxDMcKCs4Nk
	42YwLJrl6XZW1tthlo33Nu+cZ/F8pbS7wgFo3Idv4PB9zOj94A7yF8G5wmLDjnyo3s3lKGU6AQf
	48dZPUGcsx9uZGKMR7mb100zppXgLbSuQSWxfK/Btyl6Y8leXPz0eId6dIkgVij5C+IWyei6AQ4
	gQOUdVaemdjlV4wMjyvwKO/bWsVu/+X8HhyYwWmHKL1O1RFQSlzg=
X-Received: by 2002:ac8:6a12:0:b0:516:6749:4036 with SMTP id d75a77b69052e-5166749619bmr176111961cf.22.1779265316009;
        Wed, 20 May 2026 01:21:56 -0700 (PDT)
X-Received: by 2002:ac8:6a12:0:b0:516:6749:4036 with SMTP id d75a77b69052e-5166749619bmr176111741cf.22.1779265315540;
        Wed, 20 May 2026 01:21:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm51518570f8f.5.2026.05.20.01.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] gpio: add kunit tests for GPIO core
Date: Wed, 20 May 2026 10:21:41 +0200
Message-Id: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABVvDWoC/13MQQ6CMBCF4auQWVvClFKNK+9hWJTSwkSg2EKjI
 dzdijs3k/yTvG+DYDyZANdsA28iBXJTCn7KQPdq6gyjNjXwgsui5JJ1M7mBGvZYJ1pYe7bYVJV
 AaxWkzeyNpdfh3evUPYXF+ffBR/x+f1KFlz8pIisYlmi0FFKL1t5cCPlzVYN245inA/W+7x+Ms
 ZIjsQAAAA==
X-Change-ID: 20260326-gpiolib-kunit-d7f1b5541ffa
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uHESdCJVaaqQg66ue1kgOmBIiQYfXseQnocX9sdF2/8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDW8XRdthSXfCvaUNx81dJCc6HxagYtdhk7aja
 /0Dq7VBx/GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag1vFwAKCRAFnS7L/zaE
 w+N0D/sG9HuyWscNV+wZX06V2tHtmL805A2Ro2BPfHee1KakifTi4Ln3i5yLMrDGdQKyfv61ByP
 UB8p6kMe2opqGvV3kiCTkTLOzH4mECxeBuFmP8xfhWLaEEkehnuDV2YQf9WZddw3qD3j3BghuSN
 RAaxzlVDbaDTl8zh2TGSU4UF71KqTftmWk+UvCEvOSjidnFqyw0XYglWWQOkxSpBNiQ9GIVhRkZ
 h1df17deRJOt4ZTjsa/yqYmcQyTK9tlH3VHxPl/6nnnHBAQMIif815cEfEp9TppxgGdM98Llw3w
 yChp/L2+zAlqt2hnVLL1FxWtA8CHqetmEje3WfiyViVFmxBvq0iH3uVKVl61oDSCJaMDRbWVEVE
 P4GWsucgF2p2/G2AnsfDuS+VRPfa7x1NR/Lw6IbXo9DY3jiH41RUcjUnQk2DYxpJGDK0Og3XsBh
 xO2jvLc69CSrMjdk7tUd/qk/w+MKSMOGPN41MVvK2zUaocfqJmNFhaMsH6uLJ7eB8Mtny39+vKh
 i6TyG/vzu0iyI3EBuMyxLrOyljkZSglZ43FBmfTZDltIAF2QftrjRVoJv8MLb4k6Wp8mg5yH3S6
 VuGGy5L6HbCdJ1BNnS4QDWOF0pujw+L3pqc/+bUvUwbHgv82b3IjdOyi96eAW2CD2PzEfbDQ3Oc
 S4QJXYFyA5XEKcw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3OSBTYWx0ZWRfX5OFZn9p+M4Nw
 mUNS5rM+MUdgSl7dOHE2suogyM2sq7BG6YzzSKRb4qPv7ik0GQbb8VV76a1y+3CAZfSpwRcl67V
 +58SuESMOe4AilsKS8fx0hryjZNTjfn16NpN9VSDbWUgMmIbKtsDQ+Ruow9e7dkpX8EcpRwupjf
 Ftt5FvjxvMeSSi5nh0FeR9k7l2p7OD1QVfANN79gxXb0W0AAkEyecpC/96kgG8fMBvnkOfZHPcc
 Q1SMntrFzWOWo/vLVP15HzGX2PETKH89trVt2W4+ovDchHGMwuPLB57KTC2X36BYd1TKOyQJ1Mx
 ytHsXa/4oTeLXZKfVx9uvtPPevTMF6nVa/YMJV8LhfHMIOAmPjJkTQ2Sf4HEc1klhHBFYACd4oM
 o2A7SriDLSr2DJgR8q7FI7S1IWa9QfLn4VSDkUjndLXjpUWrcMntAzjTW5CXxGdBoTYfPzJNUjk
 V30+lHpydFVIGN+MhXw==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0d6f24 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=MtzmdRDdlofpVA7LM9AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: CVdduU7EZ5xWoTQKoSa3Z5Kv1yxuaRME
X-Proofpoint-ORIG-GUID: CVdduU7EZ5xWoTQKoSa3Z5Kv1yxuaRME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200079

This series adds a first batch of kunit tests for GPIO core. I intend to
gradually add more coverage for functionalities that can't really be
tested from user-space with the existing kernel selftests or libgpiod
tests.

Merging strategy: with an Ack from kunit maintainers, this can go
through the GPIO tree for v7.2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Remove cases of kunit killing a thread on test failure with device lock
  taken
- Fix a platform device leak on test failure
- New patch: provide kunit_platform_device_unregister()
- Link to v1: https://patch.msgid.link/20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      kunit: provide kunit_platform_device_register_full()
      kunit: provide kunit_platform_device_unregister()
      gpio: add kunit test cases for the GPIO subsystem

 drivers/gpio/Kconfig            |   8 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpiolib-kunit.c    | 358 ++++++++++++++++++++++++++++++++++++++++
 include/kunit/platform_device.h |   6 +
 lib/kunit/platform.c            |  46 ++++++
 5 files changed, 419 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260326-gpiolib-kunit-d7f1b5541ffa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

