Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0123EC2D0
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946342; cv=none; b=aI6oSSRi8N3/LnhIuiB18CBVHfULk2UEo3osaMF9HU2Q/uJgNDUEgsZqtzMoqC8vQFxo8jmHO913L1u6blhGk+EYQwtEr5iYoW4UCZwC6Qaa3jp3sFLByWI8XyRlWL1FYDWKSRkvn4FD6woY5pWSj0BGQrmNyq1l/PlfQH5BzZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946342; c=relaxed/simple;
	bh=TvAvtEEduAO3Cmm+l/HLnOozcpsitj84g7KvLFCDf3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bH2Os1xwklPa/8YriJ0Mt8iqRtveb0MuaH31cDwGJdhkv2sKPCcUj5m8vyOyc+GxfkqQOizh/Rfp8RIMjBLJaG2ge/aNMHkSCB0DHHDAuVenCsecuUgYvvPUAq36XtSfNIlq5SSXm/QW3XRMtwD5VB1h+NovTav8xF4Nciy2WFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K53b8g/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpV+a3Qk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K53b8g/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpV+a3Qk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uNpt1565807
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9utNRt0442ZMWfVuXusZbM
	I78VTB0ODYf5NvWVk/l9w=; b=K53b8g/YRmqa8J5pJkcyQckwhfAqL3INYF6n2Q
	z9sUNOzx0sYufRQQxPZ21SYN5DnU7T1aZZfqbruWbHesJc8sYfcfgxhTVKu+bbJI
	fyDeeKdUTGXYU3O8BN+/wQDtwVB5NftP9v/AXttXlVQyo1JoWr3p1z+IB4lcr1+2
	m5UpGZ6+G5z53fDdP/cT8Vl9NJecMCI1Gn1pqjRlMVlcx+fFxiH8DTD6/70IQkHF
	sz3foln25ZOwgLi1KZmDrpFiglMiTVuQYCN53Szx2cl7VoEMrPHWqzA8I45fU+FE
	1ze5J999lvGNhfT/3EjyedhPOXup4cUlp5mzr8aBwdYI+BJw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wuxw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953c4a80ff8so2565983241.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 05:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946339; x=1777551139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9utNRt0442ZMWfVuXusZbMI78VTB0ODYf5NvWVk/l9w=;
        b=RpV+a3Qkd3XFutxTg2emRSaWpnl1vOkshGs9pU3Git92escgBbBbMLep9T4WlpyIN6
         7N9GjnW/rThLLu/jh6yGbQ2cum8dKF6vDrAP/mPnUlvFBg84hCnyxppo0x7woiMMs87l
         +oYAOgrisL/ZiY50pDlDSJV8QTNxXTs0/cU5jP1BF8rySmNNByd4C/RyymugA6tKni/b
         xYuaHJTpa/8/nmCCx2vJmeeUtSK37uoLbuvCN+LE5ktp9R1bBAIJOZM5GUVVty9HtLqK
         TIopKV2l2pKSTVm/ZOkJbrTiALNwfiJDL0bsnm0Zgz5Lg0N/y0mdWBoppvaLJRSPa1mg
         KINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946339; x=1777551139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9utNRt0442ZMWfVuXusZbMI78VTB0ODYf5NvWVk/l9w=;
        b=i+spJfiBwlQRLr2ARYgE0b4VGICjyGSnk01HCMleYpaQNUQzYXd+NtXOm5RlgkeLzA
         g6/qljs+HROxTbsxR5qZTWR59nV8FMMzvooxmCS5+hR80kMCSWQLG4kn/uBAKDZwV1lm
         og0kfMbP8r7Ehwa9yhnLNSD09ojXa8cju0/VQHuWFFf3pLPenUxUV5UqkEojYdrMX/qj
         oAAgshKuMyk2O6b+VvsOU7YhNy0SfNZwl5d+5Eu6I4iUY9fa0vIRfbQfOOWLo4i6x7AT
         W6ivC2Arc5gGSJ9Qer85S5oHePkk1QYHVn4pO7GOrRGTyhQTAYuo+fl6vaPgvensKuq6
         3TTw==
X-Forwarded-Encrypted: i=1; AFNElJ/raQCtYeEIMUygUrxyNM6XcI+0DuskN573yS/jfR6X13oYdNnu5tj/klJbqsGHd8oNrFjJZNMsinWJCnlSw7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1IcvUTFg7APV2+ci91hc0tNdbkuIQA0mrWjxV+YEVbslsD7Q3
	UN+s4t5yhBG694r4V8glr04zQBH11Y0pfGp42/0qj7yDSw33UQDSZJohSRo7RFBDq3oCbdPYw4I
	pP7vJhxAdWxkUkvAfWjWFvlNGwPRzW/6jcONaQ3dsXIYsAPKiZqAmehLpGAC3fZ0+rxyJU26RDu
	Gz8+A=
X-Gm-Gg: AeBDietpSJoF/SsBcPnd7RVTLQENldwCIGHz8pecaeT/QBxTgeMvh9Z7Z4qpcdpdwUL
	wNYcSHnfx8Eo0DbScz2Pxi2CQKGt9kaclKr0hgkH5lI+IjPJ1QkF938tELpFb9X0u7iHRzgBjW7
	5khwU8T9Gn92Fc/xXM8FVVEfh2h318+h9dH41rswaeWRrXLXg9Eiko1yfT7JeZrgJMCxoXBQGae
	pbP5jROEPd6LFFcq5G3vE0tm59vMMe7ZtBtz0cM8EICqPbSjJCz6ghoUkadDpXnJnb5v/ns2yyf
	RNiJUtG9RIf65iDPJugSfmJv43lWMeMPPTnAWVeT66aTWSKjtn8BufR3A2H5qXXexmsHmp/tiAO
	UrZb2WjmYr4eC+0+ePjXi/MU2XoSuksPyfy6DTJPj/aCAQUjHC9qtGhyZIgXgFg==
X-Received: by 2002:a05:6102:290d:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-616f772f7d5mr11773570137.16.1776946338801;
        Thu, 23 Apr 2026 05:12:18 -0700 (PDT)
X-Received: by 2002:a05:6102:290d:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-616f772f7d5mr11773552137.16.1776946338340;
        Thu, 23 Apr 2026 05:12:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:843a:1e93:1fb7:5d86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm426273565e9.3.2026.04.23.05.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:12:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] driver core: remove software node from platform
 devices on device release
Date: Thu, 23 Apr 2026 14:12:01 +0200
Message-Id: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEM6mkC/42NTQ6CMBBGr0Jm7ZBS8CeuvIdhQdsBmkhHO1I1h
 LtbOYGbL3nf4r0FhKIngXOxQKTkxXPIoHcF2LELA6F3mUErfVBNpVBegR1hpIkTIQd0lHAOkQZ
 stOltY3RtuhNkwT1S79+b/NpmHr08OX62Vqp+71/aVKFC646uVvu+dkZfWKR8zN3N8jSVeaBd1
 /ULUR06OssAAAA=
X-Change-ID: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TvAvtEEduAO3Cmm+l/HLnOozcpsitj84g7KvLFCDf3A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp6gyX4f0AqJZtoDVOO9albOmAXIePGyBT0QbZM
 WtlfvEgx0+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaeoMlwAKCRAFnS7L/zaE
 ww8jD/966ohKNrL+e0etDxUq9YWNClFh9S1gqy+dz+Jc0U34nqrblGLTYLTVVB8JEzuo9J4Ofgy
 Wz8r+enkzLp8Cv4xO22p6xpVu4Tw8f90OCFOtza8JjION69s4OKWM+l7CEiC4HiNeBVLxJa4BTR
 NxtA11a9LHgQtHXyXk3TvU457BvMMfcTm8pPDH8ghnOaJmRy4QEj0FLqd8RpRgrqO/VUJkZs4Z9
 7I6fVyBJERCSoBWFZEHOsfWNtOk6j+4hkwwZY9FptLTTt4NyeOSxkPJqi6MRyIZxOnh4aL9/ytN
 XaiwhQ3eNIdeq8Jx6JKrwhDKqVyqeknd2/nwkH5lAB2SHXyAB7RxEI75elXgS/zlKSGRQzj33+X
 4IrYFJ0oMc0ETYHfzq9kfRjXGXOogdqJEi/cWYBXk5Zay/fgpLGGHD1h8B98tfO47UKufHYSQ6p
 vdf97l1K1d7BASJf05fktkTQJy3hXMU4KYIfM9AviwQYrzor4JbF+hPL/U0soKrhWD11Gdk9jaV
 XUJ1yquW2YKFblHxGrWo4cCZ2myfSDqUlZCdegtrqjIUnH9rFblXiDtsbk4r5cbdTdUGvldc70q
 xtl5bsfrDKQpKsqyVpip7sBo3BhDtYIgrHEOyM2iaNKMSX6erjH9KEzUj62ww56/vOxs8xwrOy3
 YlinHL8MWm+9hgw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMSBTYWx0ZWRfX2tVH8EZL8DdR
 iudocHPkNh39NlPi4kSCx9s2IWWue8skZRLKR7I0amqZ4qwMRK3MNvv/sUidNqzZYOzAzWCnyiR
 e5qHVd3hYO6od1h1iL4xfqGsxX2LcrrJzWrI+5IDKmkE7ga6i+3UTe4Z/d+2e184jyoDearciBM
 +aaECDg0J4q78d2fvfljIqVAnuK/zdWJQgYqWvIhC+6hXciOZkYzrWACPSa6AkesAMnwaOqh1um
 eq3bztvS+/oXP68boBG+g/zbMZ+GDIRQyQEG+Xm9QN7FYATB6rpFVvmCKasIHU2uiAvm/px/wzn
 wtx1oxj8iKwPlLZtDkAHr1uU3u6SQaxexM8DfjzDuBoVWY8o3RJnUBhcHofMiG8oo8bXnQwCQyk
 /qfJTH5ZcGp05plOVX5so5/DKy/w3yoT3wpYPRfBhZrKZqRuQz2G50Dnr/lgQsxky5NgfBxArYn
 RsgtIY8fFUBS/2fIldA==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea0ca3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=arlgqegt7JSL4kvz61kA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: QxOVMdVcGwma-IV0k1-eOgHCpVY9GcMF
X-Proofpoint-ORIG-GUID: QxOVMdVcGwma-IV0k1-eOgHCpVY9GcMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230121

This fixes an issue in platform device code where, if we specify a
software node for a platform device using struct platform_device_info,
it will not be removed on device .release().

The second patch adds a new kunit helper which is used in patch 3/3 that
adds a test-case that can be used to reproduce the problem and prove that
the fix works as well as another making sure a corner case of using a
software node as the primary firmware node works too.

First patch should go into v7.1 while patches 2/3 and 3/3 can be queued
for v7.2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Change the order between removing the software node and dropping the
  reference to the device's OF node
- Address a situation where a software node is used as the primary
  firmware node
- Add a patch adding a new kunit helper
- Add another test case
- Link to v1: https://patch.msgid.link/20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      driver core: platform: remove software node on release()
      kunit: provide kunit_software_node_register()
      driver core: platform: tests: add test cases for correct swnode removal

 drivers/base/platform.c                  |  11 ++++
 drivers/base/test/platform-device-test.c | 106 +++++++++++++++++++++++++++++++
 include/kunit/fwnode.h                   |  19 ++++++
 lib/kunit/Makefile                       |   3 +-
 lib/kunit/fwnode.c                       |  52 +++++++++++++++
 5 files changed, 190 insertions(+), 1 deletion(-)
---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

