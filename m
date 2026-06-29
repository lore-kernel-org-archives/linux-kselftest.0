Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2092C3624A8
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730359; cv=none; b=lzJiTHkEIbb1Efn2kuiQgr/ozuWiEOfgzSepKDnc1/RSAlQo0/fhzTXTUs4lCwQ2uY/C7PeGulFh7+VOrpMW9+dIqFvCRfC7dC2IW3kep7TyTJ16C3ZYzfSOH9SQUDYgxgq88Ohlp1TQpZYHzFNr6nUwQQiFzba0KeJBzT2ubUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730359; c=relaxed/simple;
	bh=sMBANx47Nhnc7oTIakrAGi//Yva0S6qPyXhjWsdqQ0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TTIp/Dw7x4IB8vsBZXz7T6N4RL/6Kd6Nn3rX5AiFGM3hXQwsN7JzDV9F3OHCwugn8AY/mVfzIceI5vpdMl/rYnLv1Vqo54yEGUEc2lF1J36W+iXMT/1dnpzobY+3f10Y9w512KPUb2qdgDh9dhCYgCzrt2/jCSfbeb8TAJ/A0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zwc9TR1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOlst00D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zwc9TR1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOlst00D"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATbtp2656441
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U11R+DW1K0DvlVpS/+RfSj
	VuIxy07bAzTDI4+2onV5U=; b=Zwc9TR1KYTjrB4eY3ZST77cmoPtscEwvcdFIdU
	RnGt1rEurBsFXaFKisBuIxdad3VhV7rhcZ1sZBlyvi16jqfS0AKcKXTHaU4hXwKb
	232cJC9+iWgi1A7CuzAXuh6wIm0nPO6YrP5PjgH5fGfp4abkk0q9iLVUViyqs7Jd
	1YUUqyaIOAsVxc2UEyqZ2VYZMKqX5hAQbvEfSBjZkAimAdU+TM6mWleQpNChjYGr
	xa1C4eOZimtIZy5tdsVWRbAjCj8APw+IFfQM1qxZPQuNTMwd1WFyGseKe6TWute8
	fuU+Q2Pb4w14DXsiNUubKyRm2tiAcB1zqojxdF7/gYLdaxRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7ge74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so105251385a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730356; x=1783335156; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U11R+DW1K0DvlVpS/+RfSjVuIxy07bAzTDI4+2onV5U=;
        b=MOlst00DsTu8WIaShlxdGb5pRn2EF5Xdr7TK6rrT9rjRk14m4C7EEs11ATgBEOV/BL
         lRt67sNZLP/ZXAqvFU7xdc+5kw+tT0eZeHAJQaJ0mrOxKaWgvtkA7z31QPq5dD/rf0M3
         F1HeRImn2+5b/SWPzH2Ww4w3pmUJ3l1TUFWFPb/DaOaQBtEY6pfApx5583IJ/bu6M0xL
         9K34AXIJ9Clq0MTvoJJ5MZilckpKB8natWxSXMPRKYBa7Ti8ORROs5uyfRKIHvikX1Il
         jXlPvPsSUA+ETwJXJiPe8aSVGrZTaB5MntSzD20TnwavuzDOptztX04XYHzuSk0NLK0q
         RcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730356; x=1783335156;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U11R+DW1K0DvlVpS/+RfSjVuIxy07bAzTDI4+2onV5U=;
        b=P9EtK0bKLNViPKE2JZTSLl3f+i5nAXqFGyRiYFDQ705wxE4HLiPDWfE64cD6e4y056
         FnT3wQS4uzqCIoElwtZvzBlX6PK8wJFQ4Tz3NpGTePIkX6dnvhFfnQOjsiaETjmaePY9
         ZIqv5u8fmVpGBAsVWoEBF7Gq6QaSqITJ7jV4h77O5QE0ArDcLk/virmkeBDF/g8uNgF6
         88fRHTerp/Q1g+VG36v6Lge4Kl9Gk6S+fQ1OiLa7nLOeaFHenNx5z6dJpnpZFTvAtrXo
         UNl2gdGntUlKjVjxpjXdb0Znn0L6nQW2tOdFfWZo/xVzMKj6mrylsUAXYdDmyQZEn4zt
         34xg==
X-Forwarded-Encrypted: i=1; AFNElJ+S5yLiWohscKj2d5/IovqtCGOk0G6UPsxslKSvN08uOtQpdbf4G1lmSVzsdZ+fRUY6qDAuFDEQT8vEnk62PCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YybqjHYoejUkJMCaMS3cXH3JqHkoXQnGoW7FB+kygcvaA40RNks
	+9nTrQPmKX8Clk90zXe2tOkZFJwBjAwxbs3knsAtcGgwg3hVAo9ZQiA8dZANLs5DWk3gZi6iueh
	JghHn4I+FT9UWAjNvGWOzdXSzubNzvgE+vZspPMXT7B0ErPr55W2MV/3CiDzCnhfcN+WjFn8=
X-Gm-Gg: AfdE7cmu658A6CJney7HKqDVbEcF10XDRjvx7JR3z3xEF1ujTlse+edhKvf68M61nNn
	j5VJMJcIZSWehVxG6pibQqeOXPUaOGaLHGrkz0McsBWcqgxR+NP2iOw7S1VcYcKGLGtt+Xvom7A
	4S/Otpd7/Xr1TLuoR62WUiYLWT/0wQ5DR/PnJiCZuuavWfZ6asNEn+j5FZXMZ/RcRyFa6EtKllw
	PJcieRKa9IeI9JMATdpT8fTkI6lWPPsUdw6xQngoTNQaZZHIBBmmpsZXRKG5IPf71WaBZHEPZ/s
	qXCua3u96eSmjJ4RSdiyDZD3Y7u2HfUiCoXYoTzxrNfBVsXkprgeflfmfpgZWFN0e7GyusJKtEh
	9lrY5jknLQuGuUOAEcg3MxD6mqiJNnmselHfgoNPg
X-Received: by 2002:a05:620a:6187:b0:925:56bc:b8bb with SMTP id af79cd13be357-9293a3c4dc2mr2126708585a.9.1782730356221;
        Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:925:56bc:b8bb with SMTP id af79cd13be357-9293a3c4dc2mr2126703285a.9.1782730355526;
        Mon, 29 Jun 2026 03:52:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/5] software node: provide support for fw_devlink
Date: Mon, 29 Jun 2026 12:52:05 +0200
Message-Id: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVOQmoC/x3MwQpAQBCA4VfRnE0tseFV5MDMYKKl3UJt3t3m+
 B3+P0IQrxKgyyJ4uTTo4RKKPANaR7cIKidDaUprrGkx3O5gwflGlmtXtyExNUyV1DRVkLrTy6z
 P/+yH9/0AxskT72MAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sMBANx47Nhnc7oTIakrAGi//Yva0S6qPyXhjWsdqQ0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5hKkNN5givpV9eUSYn3bslTOtY9JHZk779k
 FSEh9H3gnuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJOYQAKCRAFnS7L/zaE
 wwiLEACBhoG1xU4psmdAS0pn+KXVz6t4DQGfGc+hRVTlE4wHh/cmWZ+z/mxF3gi41HRvkLarDvx
 8WA4Zuz2FvKz75IdPfqXvaN79NMGM0SdMmqxSAgxSmGmF/fYHU/ij9vIt9RcikytbUzR/3VKx52
 UVa3Ke5KUu1gAxdNKEnJB9OUpmhXCE6YPgfUR7G0ijjpEupO2ELYISJr6Mq0ofFC8JXwUTKPCk0
 sle2LpF+Q7P1/t+vmVz7TgBhy7Ei43tAl5LKh3nx2ptZx0OC/iT+mFlpKpDPWIkK8Lh4qTHGob4
 LHRXGYexb+brcd7KndwaIc0H0p3CsPn0XzY2X/Y4aNUYGfVoYZsTs2GQTTeePXcr4mrZQgw0QMg
 tQsxXj4z+LOx2sfE/bPLMCFSJ2menXFs7dUEF+zQ6tm0f3Gr+HRoX8fLcYa/bSqjzFWSFXUVIXq
 iB97XsOkmOyfDx9l9rtoQa5kkbTsDwDYamGnqEZhHwCe3ZHloSDscaTHe2CUwPqKM0X6o3Ax7BK
 oFp28nVLHXVi0bCO3OvOe5kYQe54XEm+8yPS2y6kuRpiqtxl7EV4uTUJfpXAZj1lRpvBQ4eDiQb
 zTY2wriaigxtCGiX5mR0XS1NWyC/wFHJoVGq7+8CMPg5qZeRrIYpK/X42TC1kYXiGLDB3z/Aopz
 BaMx9qR4Kq2lXQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXxt3MUeqCRENC
 9xDvEBLm5WCjV7/B9xtL/T21W+LcXxejsLCHvnPMvtI9tcxEM9OBHqWPr+7Fkyznt8+O1Zg/gZz
 YSxrTroleCG0crT9tVAV9jscsD+aE7Aa8oPvqCnglPUDMLNA6zRK3p7l8pMOQJdH529Ui1JA63s
 22ekEQxg1BZ71VKxrgVPf+rb6oZETv/CImaFIb3iirNUgvElFY6QzylcJiJH6ZelgPndXX0qzln
 ghvv2AHlx49neyf61tDW38Js1eUcm3+9FvQzs9rGpbvE0O+i69uv72vuU3UhKgvEG3xkmf+eJNq
 lguo+dUyyCF1n8jHU83/b5yvu5oge1cpHfGSMI19yIaaYqxti00PF4D/8nWtKEjU55xek4vTExh
 WJoygxKLxzXCPK1++s3pdZOQhCdokhgj+DkVB1k7Ez+6W7mJie9naB0hBB5JHmesz646vbQDl5f
 Z45qvonHnYeHRYAltLQ==
X-Proofpoint-GUID: gIh0ZTna58tXHcCN-hgvF5xBTyhwyGG0
X-Proofpoint-ORIG-GUID: gIh0ZTna58tXHcCN-hgvF5xBTyhwyGG0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX6EIiVfQ/3KMH
 VMVos8A5j3qiCKOaY146G8gZcfMmwBhfoH2BKwXCDVhmq0NvL4mtHUr6Nwvac7jThKNEQze8bvm
 7YDz0t1tf2CHCAzNlAPz64jIaoPmaqo=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a424e74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LOQarlIh65NSffUShZEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
 drivers/base/test/Makefile              |   3 +
 drivers/base/test/swnode-devlink-test.c | 336 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 272 +++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  26 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 116 +++++++++++
 9 files changed, 833 insertions(+), 7 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

