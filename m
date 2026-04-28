Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA6258CCC
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368043; cv=none; b=RcERUlIuDmMm9T/pqyBXzwIRdNBKs0K8KQxkXWiH5Die3D8zaR+NrVw5CwPesc48VFDDfkYkwsDGOkpHilPQCLYDLoXipzkyfH8mipvzr1IvojJZxCipgoLvgY3WgX4nSwkOHat0/8boBhIWow/8/G38qbdA5zlXslhBq3FF5lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368043; c=relaxed/simple;
	bh=v704HvQFpji85zqtTx7vFtx2qOD8lmV93/eij/QpGA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GIvL0XHIcdKehC7kcJ9dD0u4gebecHs2S09cYZJn494GHtYax9RYqud/cnBusok6KLvC5+GALeZ7Gcl9eONkBnWN1wO/3a/lm5+79wQLexnv0yR2UiSlYgLBJNz4X++cpdduRu9quKx944eUgJ/8sqBC9QJhvyBGetNMuL3Kb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNnNzm00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiBrKPW5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNnNzm00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiBrKPW5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9HXwo662902
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZP5Mct8DuDFqqQxiTfCUuv
	QbXOYwpRO1ngaXvKtcaH8=; b=gNnNzm00R8NbUUt/tvD1s+CpBKiQJpPuioIVVX
	rzYMqvsf0BS1QRhl1XZ7FyLlKZCqzwAitE5uVGNjuNoPnCn62zQBpeiqJSy1GNok
	MQVQIKm3y+8VNibsKdukdSp/Q4WuiWRIFyGWfzV93+CC+i5GbCba7swJUBMHUFwW
	sxcHGMAvemLYD3HPPnua8lGV5Z77STu5H+k3yuFKjVNXnn7QI/b8AakHO/cU1lv3
	cs0acSZxUFDMScR9RAMQC+yMpPE/oIy23OLDo2hLUY6lVfN+xGeHR87d6z4Te8bg
	D50xLs9X5DtVIPxhAhSgNJzuvoGdGnPQoctaW/J8nVZKbvcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n37j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ee9a11aa75so1378764585a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368039; x=1777972839; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZP5Mct8DuDFqqQxiTfCUuvQbXOYwpRO1ngaXvKtcaH8=;
        b=GiBrKPW5MhEYz5qLFAtiyxQcdhErN8YxLCZc5TSxqNM7HMGY00Hmo3iVftV/UwCmgg
         hS3q40ZDWWiPKI/deunGMFd3CzIVhoJ7I6LEG5UBHuH0yWKkcDbzpNjN9zWU6WTA7ZCe
         u41Rpz9h5VQ+Zr1IxLcl1Nc+sIUGp+Mpj3L/mSVakoNnXxvoepmf6/FY/oZZlmv0RIQ9
         +tjCoG/5pZO5HgyRaKbb/hS3wQiGVz6A4df+7tFROO4Rjh3XOw4xl+43iZFhpIcQk0cp
         188WKkii9RrSbX4msj8hypTu+xE2ioAl82iWr0DUoerYkezcRdufvYXnb45VSddJTQ71
         GK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368039; x=1777972839;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP5Mct8DuDFqqQxiTfCUuvQbXOYwpRO1ngaXvKtcaH8=;
        b=gmalqpHhe54qCIJ7QMca/Gor6e5ZP4u4s9cmDUToICAKgN2cru3Uy3SuvEzeF72yzx
         jUn0SeVVd2z6KYKOrs2p0v4UZTJw1SkP3GJPvBQ/1/zRtePWpO2AoeJOy2jFIGjroUBm
         AzsSFbojci8rc7RY0KioQS2zEvasaQyXuoxNVXF7o4DHHS7Y1pVA4v9HpOAh4Tu3dhBl
         Wfq5dG3kHpqlW3WqKQcYUIKPdurNFuNgrbpl0Ym/6JN/CAjF51TXOBTsr5/bBAni6gSH
         AGv2UEVeNeWetX2OkKoalYK94SDSr2a2W5iqa+6KHUVcEucg4Ho0Fra10fWgYiNjYkWJ
         dwKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0mBs9Eh3CLmv9IlkwvBo+HAuEQOQAxBx5urTDcDu/lMMw8StuV2SMwueA73ERNv3oA4ZjpIv5T9+8AKbtvRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybh0G0pyzEIT2SXzYZaWXCgQoY4JCCTDh/oxPKQ+sile8nIlaG
	h5AB35b7dnkKi5ADiT++Dy3gr4zo/WfgJbiJPMvaWhiNnx+2DaIPlo8zs3WwbUoZMowT+rbOGhF
	t4eoCLoFPsU/BdC5T7pI5CwwlYgqhZlq+BRe8RHIwUgsGFSHa/waCPoFr/hmVEql3NzdK3TQ=
X-Gm-Gg: AeBDiesHCif0exxQiK9kq42FOt2vv6u3Gjkp7raiofJD9/DnNETDr1RkPGS3KrXk+JG
	PCh2RwHiQyjPT7HT15byP4pZLgGea2o3m8opNPOCKIfFFhwoFNyrvPTBrLmXpHsH4O9MuY5zXHZ
	oNNY9aEwn9Vslvrh+8AE9eB/4+PaJqEwEGbbj4j96S/g6a7kbdPRy6YCN4Kgx7/jBDR+vmnvwWv
	9vYGuHuiPm+deT0EwPhk8wHMU3CN35DedQOUbWe5mPS/df6HfJMwB/+FqFQsIfzgcI3m30P8Irg
	4rQkQC24I4LIc29NR7d6XWBT3RAE3E9vQUYMrigc+93COK0LRldZVkvMRwqvZM9nmfYGFEp6f9R
	K7rFuBzPPtjUqDHKCKKEMtxd7Yfhu6m1UWQMXEZVIpIDrNSRj027Ct0m7Z/OE
X-Received: by 2002:a05:622a:992:b0:50e:614c:661f with SMTP id d75a77b69052e-5100e12e8e4mr25846201cf.20.1777368039575;
        Tue, 28 Apr 2026 02:20:39 -0700 (PDT)
X-Received: by 2002:a05:622a:992:b0:50e:614c:661f with SMTP id d75a77b69052e-5100e12e8e4mr25845911cf.20.1777368039132;
        Tue, 28 Apr 2026 02:20:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7473:f19:2705:c566])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748f236sm15726195e9.5.2026.04.28.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:20:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] driver core: remove software node from platform
 devices on device release
Date: Tue, 28 Apr 2026 11:20:25 +0200
Message-Id: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANl78GkC/43NsQ7CIBDG8VdpmL0GjlaNk+9hHApcWxILChY1T
 d9d2snBGJdL/jf8volFCpYiOxQTC5RstN7lkJuC6b5xHYE1uRly3PJKcIgP5w1BoMEnAu/AUIL
 RBeqgQtXqSqFUzZ5l4Bqotc8VP51z9zbefXitW0ks37/YJICDNjsjed1Ko/DoYyxvY3PRfhjKf
 NiiJ/wQUf4UMYucahRSG0IyX8R5nt8Rk9EDHQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v704HvQFpji85zqtTx7vFtx2qOD8lmV93/eij/QpGA8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8Hvdv+9Qmy2YNzrX4dczoJT5DG6vM48Q++iAf
 7RMQ7XWHr2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafB73QAKCRAFnS7L/zaE
 wz9aD/4uoiKcai17FTePdUWidWatRsIaB7v2AHMZGpprkIyerzNBXojc4ZFIO3rNmUe0D7MG1zf
 6YxLf343oTfoVkvXrA5CeigceWsjsoADNxEUQQDuQwWpo/mMNZ6jli/XSSTxIEGksfwtZlDHw1H
 ftcihK2HErY0a3w5+kgQ3t2n6gUVQU/FnNNUJJOvVAm4OQqGhOLWFkxyDiOnvwch1RDx6EsPKDj
 yj5KKboIQLNflgwLk7a0i42YdywHhJujQlc+vpkPcRzZWA2kFwHGG1qG+ACcikU7ZJLoxQm5LFx
 KnNRPK8o3axXFVk9+j2xBquoakyuJBJB7OBAVObZ4RdhRegvpAFOW2doAfqQ9SbWKyZqe1mU7Ti
 uOC9iUr02TX39OCoFd8ucFFpODqUI6kRbmoQ0nBiR2Dz4vtENRyqTJuFvJYkQZ0l/xZ+mSoBUYG
 cmu4Jv0lrG2BMKg6/zFNElVLNyOQ2/PUpNxWuzClhspfkwGsja0S7tPBTCiZNYgoa0bzm9aMeG+
 VH2JjxlEvO8R5LDOGMCAI7lW7SwJsrQ3I4R1pgyRYgv+u9Lux3i9BZ3aRaPSdo9gqfqpEwr6dC8
 7QEWbAxCEpCfNXpHyGPLMOJvjs6ltUESiqFqZquWS8GqvYtn2ELUO7B2UMxAb+J2hbc8KspFzBm
 G6h3KV4ElO247lw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX1pt+eyQLNWas
 wLi7N0V635QUk2cZtq6Nl+vxdS0zb/XNmNY8BAtS0IBrFnkQtuzw/QnchWRvK3luGpcfcgYMn3A
 dwaKsVJqtI8sUVawaqpj1bMVBZ0s0vNb0PP/zfIW1KXdu/KRfj6AXUZJzMr0u01JPyXKfpZoFRi
 8/REswP3KhXvB/boZcMLeghvNJxjmyLnHw/72NJvOI/+0KyqyaAQKYu4PtDe93Y3sx/skIz0eVZ
 MKDypLQll7rgc5FKVXDfh+OvqAtTWm0z5qcR1ZVbswBeMdoUE1j9BqJR2GnH0dPldML7H9tV5aa
 94CDRhjGuh84zZAFMy+ttcjWgk/zPyemAT4JuUJeDX3Fq9RZmg5H6mKVijF/bl4L9ihb1QBvF4P
 Lej6uaBPdYEgOq+AbpB55iv2FMbZtwx5x4BubZbZDdrDVdL+kS2HvF/vmpb34hWAg9KoPyC86Ej
 3AJnsZCh8Wpx0Icf1lA==
X-Proofpoint-GUID: _NsiZaO8E4yBZdkeuJw8kUlVloWSLpJg
X-Proofpoint-ORIG-GUID: _NsiZaO8E4yBZdkeuJw8kUlVloWSLpJg
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f07be8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=lGtSNjaRAlEbDfKVVA8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082

This fixes an issue in platform device code where, if we specify a
software node for a platform device using struct platform_device_info,
it will not be removed on device .release().

The second patch adds a new kunit helper which is used in patch 3/3 that
adds a test-case that can be used to reproduce the problem and prove that
the fix works as well as another making sure a corner case of using a
software node as the primary firmware node works too.

Merging strategy: patch 1/3 should go into v7.1. Once it's upstream, the
first tag containing it should be pulled into the driver core tree and
the remaining patches applied on top with an ack from the kunit
maintainers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Make sure the reference of the primary software node we possibly take,
  is always released by moving the get() before calls that may fail
- Don't allow passing two software nodes
- Add a test case for that situation
- Link to v2: https://patch.msgid.link/20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com

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

 drivers/base/platform.c                  |  17 +++-
 drivers/base/test/platform-device-test.c | 156 +++++++++++++++++++++++++++++++
 include/kunit/fwnode.h                   |  19 ++++
 lib/kunit/Makefile                       |   3 +-
 lib/kunit/fwnode.c                       |  52 +++++++++++
 5 files changed, 245 insertions(+), 2 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

