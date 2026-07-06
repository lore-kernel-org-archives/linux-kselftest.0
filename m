Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0241613C
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342477; cv=none; b=nE3w3CaXJzSz5UL6Dr4uULgWKHIuBpWXLMJqjM5MPrWThwrrqlWXM4NAC5LzBMnn2rX/3pgVPB4EQn0hqvs4iixTekGx8XLw9RXk/mhMLIbD5u9Tre005Q/NUs2/J+kP96PxBO2GKHJ47BTKzYb/oOQzxif0j9GzP8lJr390ttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342477; c=relaxed/simple;
	bh=j/ZK6ExUuxxG1XJGSDlCW2aa45sq27hCD52obe1DfHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U0HbchoOXmtHvUyW0ozmk/7ger10BC9GIGhM+YxTr58qjJj36Qv0ajfhjjDQfLZ/6qhvWi57busdZy+N2zN7uPXAhC8Zhm1xG6EWCneH+TmYwb23yRM/qkSuyDqI6JWb3nyyfi3MvDITGHFGfZgKfnJAUqDbX5CZxoXnACLe+sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbXN+urT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsIZKCnb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbXN+urT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsIZKCnb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTbp317147
	for <linux-kselftest@vger.kernel.org>; Mon, 6 Jul 2026 12:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b0uvwgvESdJ1e3fK+qKM0F
	pZYStYyRNLeA0rpRF18uo=; b=VbXN+urTyJRLx2ACHDzsNAPpAALgCUrBh08uoK
	AhsVuC7SZJGRxAh+OsD42P1cqbjkoFmh11UjftxCggIFs26Dfzg1nX0dch50k4dG
	kgKunl5PmS78G6q+LaSzs0rMbTsCu39iWGl5649zEE+OBI/uthngD7XYTG4tE4E6
	RcsxH069m6JZl/5N95KS94r5bcm6Ce2FQM0xDJIm4dO9oM0seQ13CyT7Onh1AmPV
	Gg0ZJCfETuwtp6FPLfYgups6+8MqCmRa9ezOWh0Nii4H859vOdYP4XbXV+9by2Mr
	uooPM2IfBdMgL7SnK1M6sfG8jj79ms6yiDeGrjK8rdocJByA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7hacq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 12:54:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915f6ff639aso545551485a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342475; x=1783947275; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b0uvwgvESdJ1e3fK+qKM0FpZYStYyRNLeA0rpRF18uo=;
        b=BsIZKCnbJQ0gFg9x1hU99nTiWdlkRgCanyiRs71bbCLvbbWQYk3fJSDy3lMFe97VJK
         qvFVm9POpbLPEWdD2Suaqio2QB5aysHvp10rKzoyhRxUf1rv8OX0wbmij+Y28oiAUaE4
         bB0d3gwpmENuyzXL8CY5Yz23HylbzZkCyPEKwSdbmSLQeTKMrQttL96byCH2Bpvfqw/0
         j9tqhzNp7utAIB3cateXnYLAdvhcGINUkciLjDk9cH1lz08d9cPYUIdswGNmjVSj4HsD
         OxAnCkn7azrkmMLIhfglq981b3YjG+2HQy63X5DRJTDTHnBHoSIGWUvwUIkARZ+7nvMS
         qjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342475; x=1783947275;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0uvwgvESdJ1e3fK+qKM0FpZYStYyRNLeA0rpRF18uo=;
        b=sPVXkBzWtHcM3JkHyi8G+SjA7kvfLrhskJYWz5imN6f8+uKdUq40l5tEK6GZxBzmWD
         uwGTWuUBXRGdkMwocqmuj9XX5I80x1s3L6TMgv7kUR5B7UemECOL7uyfYRbwMxgR3vGT
         +MAYn5fLJgUb0MRz5Q4764ytl290B5fMnhZtY+yy1EsU2EGgl6jTZbyS1iFPRx3eLQCz
         cE78Ln5sU0m4FJQ3yABYdQr3yzQT6ZS1G63jf5QjjkNtT7jCIdGnADvO1UOTZxT49O1x
         0OpAsmPQPfBu2tvSgIvTwOeKgR1vxrQARozDgMYVZRi/Qq2lIjdoTfZZtvVksYBLjsUF
         ZFNg==
X-Forwarded-Encrypted: i=1; AHgh+RqTm6Vo3TyZxdtHoPMxtf84gfA3fAprQPGb5nH5gS82l70OeT4c7jgo2LgjfPfZvzi3IpyyHsqofXo36NkhkLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSWcyzkQRiSb9wNZoMBEpZMDZXWJP/mDubp1xBFty3veMRvIu
	jh3heMvlEeJXHQq8DMFhyAveseylnqRiuWUyDOOzK70+oYlfwZdXXuJLFiPCif4G5Lddudd8SVu
	tdXxufsRUAbrv32UPRYKik0H/Ggd5BI1IRufVNYJdbSOwC/v+MTtmcjhDAJBV45lIgoiRScU=
X-Gm-Gg: AfdE7cncuR3S/iB4Ms72n08KonNFeD6z86Ged7lct7vt/bCa1xd7IbmxJ2q0IAz28X8
	RNiq1X4GFJusSFdC4xygko4lk/OBXFJv/G9Gq9L51gmw9ChoBJt9c+iyEinjyWHVF6ltzCRNKTa
	VhtgWoulnuVrw3odf1IfyParc+hrY9RPKz0r/ENvpZqFkhNMb63L7CptvhRZVoq0XkSKsR6NcwS
	ryz+CE4oHn3yx795lQOeJ3dQUDtrVp3ED/wfVQ1mmZL9UVhQZ+06zjpklXdN2QE/ydqeucHzsdK
	Oh4IajYSmZ6zhGH7bubfUHV5XdDkY425JgglMGZj1SMBV6x237gyS3nZ4xGHVWWPGdP/4zMPVJh
	HzK06QLQmJbbWPpiU+5VwNzPVEIH1v/VmQXOUuYuh
X-Received: by 2002:a05:620a:6f06:b0:92e:6a0e:a192 with SMTP id af79cd13be357-92ebb57e75emr57466285a.49.1783342474546;
        Mon, 06 Jul 2026 05:54:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:92e:6a0e:a192 with SMTP id af79cd13be357-92ebb57e75emr57460985a.49.1783342474072;
        Mon, 06 Jul 2026 05:54:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] software node: provide support for fw_devlink
Date: Mon, 06 Jul 2026 14:54:07 +0200
Message-Id: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+lS2oC/22NwQ6CMBBEf4Xs2ZJSgYAn/8NwgHaRjdBiV4uG8
 O9W4tHLJG+SebMCoydkOCUreAzE5GwEdUhAD629oiATGZRUpSxlLXixzqDoF2EwjGRvQhtdGZ1
 jobsc4m722NNrd16ayAPxw/n3fhGyb/uzqX+2kAkpulrKouryrDrWZ8ec3p/tqN00pTGg2bbtA
 1QvECW5AAAA
X-Change-ID: 20260609-swnode-fw-devlink-cdc8dc4e5cb4
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/ZK6ExUuxxG1XJGSDlCW2aa45sq27hCD52obe1DfHU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WBYQrpy0ZHmwjOS33DDQLwb1xXf5+gQKAD5
 zCVZbGJBKqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulgQAKCRAFnS7L/zaE
 w9NPD/wO9u4RjtzAd/KO/SZCDbQHuPhkalkh8Xr7gIsSTHw+oKCxzvf2wSR+DSmlELrGqjd9pUh
 C/Ksq86FuPN+JnaaRt3dGErLGTuTq3zALu6KNWPd4/ekUzK682W9ps6Fv81MueyNh9dclA0eSJ2
 GdlREszlGGdXPA1PMjpHUNks40RsfXqXonSsbBgbTPvDzB0XUEz7K+vWSSYSA15xxvS4GHgk0n/
 PNHHyAVUj+O+ToUIE1zDc0HeTspMLxvdPbmlundeNg4RWkgmzLYyMboeCZzXv3j2vCvxc/Q5RG3
 SBxWLwxfgMCe817xmi6Mp6Us2UaZ/JxmuRWHBvqZ8HH1o/Q08WTtjtSI+CrOmoQt0uKlyJR13I5
 rpj7UOT6+Hk66adqfRZ019jyRBLKpT185TQXlK97lY8+jsg7CObtv9/nS7o1bfgrPywmuozt/oz
 cqOBcdfNbCfUKKrj9XQyS0g5sRPv556ykS/ZID1Kmfb0y7cs9oyaplRUCMKrxNK96lF+9+Sl7+M
 6SI3YFpH2bwlozCSzRsqnwo7Cm+2bdfMmCzbv86UmKJ3YTmXPgArKOKb0kV0g3/ur6VWLyACMyp
 DtPd0VbFrhoFKuVqoMW2bDnwoi+bgkwNO8OJlEXo7VrEHge+6dMQgFa3UMPhXNJfKKmxAPi77rk
 Gc5jOBH507DyGYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX5mW1M/gnwkBv
 HHK71jd1XW2sHQSPzXtK0hOiqQo6RG+0gZ2/kKEEYDBSnrZL1AH3fHCMEelkMMjg6IY8tBKDkzf
 K/GaHSzizGwv6jWWg8YhHvYlEwpT0B6DwI+8jn1LbIqsoRxwIbH/mP823p2u3K/jJ5pti5D6cfv
 dzJSDFcvvpzzxOHZo0IJgKAz2/sjJhEwO/bHmJNoeP7VvLbhUm+rJmITvE7G6iyY3NIL9jYwcMO
 HnXkLg8R8oDao1PVSg+wdltmrXL4o4G2ULelUixyIa66sN7OEpYr4Q25KsCHFs/VgyjjnmM9Ec1
 Q0DauH0c+7Ijuxd5ojxS0IZ1b+/TK93UQfDhyInhq3Vpd8dF+rKLeMsE1nW8eCJV8r/9VyoI2ct
 bajBXXdPktQFsTkkka1SdK0lIPYX554QLGaa0LpHamWtg0SMbCBjGpeRSghz2iTaD/lWZ81yx1z
 hsY/GqsY5Yyn13xGBGg==
X-Proofpoint-ORIG-GUID: Ly3dcprqn2Fg6Fkhltb6IGmONW5uC5H2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX00RYi7HKmJax
 TuIKKpr4gImMLSTr1ztTJK734ab0s6YjLdrIfwB60h5hB2ATqQLhUl+NClXIGa6poMrCCAihnGl
 woPXRq7lUE2R6NUXPIrmyqrh9FEmGhs=
X-Proofpoint-GUID: Ly3dcprqn2Fg6Fkhltb6IGmONW5uC5H2
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba58b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Je3Peepqufej3slHyXgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130

Currently only devicetree systems have their devices' probe ordered
against their suppliers automatically by fw_devlink. Software nodes have
lately been used extensively treewide to describe references to resource
suppliers: most notably, the GPIO subsystem uses it in many places. Now
that the conversion of "dangling" GPIO chip software nodes to using real
links is almost done, it makes sense to ensure no needless probe
deferrals by implementing the add_links() callback from the fwnode
interface.

This series extends software node support to use fw_devlink and adds test
coverage for the new behaviour.

Patch 1 adds new kunit helpers that will be used later on for test
cases.

Patch 2 implements software_node_add_links() modelled on
of_fwnode_add_links(): for every reference property it resolves the
supplier and links to it. There's no allowlist like in DT - a software
node only carries a reference when its author explicitly wants one, so
every reference is an intentional supplier dependency. Graph
"remote-endpoint" references, unregistered supplier software nodes and
self-references are skipped. It also mirrors the device pointer onto a
secondary software node so fw_devlink can find the supplier device, and
purges the fwnode links on release.

Patches 3 and 5 add the tests: a kunit suite for the add_links() op
itself and GPIO tests for a real-life use-case: a GPIO consumer
referencing its provider via a software node.

Patch 4 proposes to add myself as a reviewer of software nodes.

Caveats: a supplier software node must be registered before the consumer
device is added, If the swnode is registered after the consumer was added,
add_links() has already run and set FWNODE_FLAG_LINKS_ADDED, so the late
supplier is missed. Graph/remote- endpoint ordering is left out for now as
well as there are no known users.

Merging strategy: with an Ack from Kunit maintainers, the entire series
can go through the driver core tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Use loop-local variables where applicable
- Reformat a long comment
- Keep trailing commas on array initializations which may potentially be
  extended in the future
- Add missing headers
- Update MAINTAINERS in commit adding a new file
- Initialize arrays at declaration
- Fix signedness of ints where needed
- Remove unneeded DISABLE_STRUCTLEAK_PLUGIN switch for swnode tests
- Link to v1: https://patch.msgid.link/20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      kunit: provide a set of fwnode-oriented helpers
      software node: add fw_devlink support
      software node: add kunit tests for fw_devlink support
      MAINTAINERS: add myself as reviewer of software node support
      gpio: kunit: add test cases verifying swnode devlink support

 MAINTAINERS                             |   2 +
 drivers/base/swnode.c                   |  79 ++++++++
 drivers/base/test/Kconfig               |   5 +
 drivers/base/test/Makefile              |   2 +
 drivers/base/test/swnode-devlink-test.c | 339 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 273 ++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  26 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 116 +++++++++++
 9 files changed, 836 insertions(+), 7 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

