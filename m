Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEBF38837F
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941320; cv=none; b=fu0/6Qy94MEifayIKZEnXkpT6oCJmrx4CNSujXRMq1Jt3+8Ogrh9tiLXyo3VrMhDbCuUM41BEHy/s/6yjTKL41NMTx1JGVVYkjkwdXEQZw/gHhWX7CNhQxBFA59XuHZb9NU1Xg/YuY8p1577OFckWSOV2OSrUMLqNgBTC/d43gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941320; c=relaxed/simple;
	bh=W+4x54SXHSvmG8iNR7zCrefhHtiBz/ghaUo8GDg9VJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7bjMFKUPw3pG3RIjNHDHBpcG7xNCBRe3AGxqw+t6aRcT7ltiiPuAJhpMHc6Tug3aS3DMiAgHYOPTza/8M/xFYHQX6MscGJmQFE+OYpV8glhCKEbXrFdWGZDPX+l1209ceEscKJprSVFw9+q7dq1+ZSBE4ECLsZaV5mYS24mHD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JD/KNSWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORP73FBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JD/KNSWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORP73FBv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77NqK810499
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=; b=JD/KNSWnQspOuGRL
	zJfe73pU7DMXV8BzPKic7F7jAwWshVjoFiwKxOnShbid/YqaUDQV8owzwHr5Dj/2
	i096Ql2A4atVxGvut3zn/Y099c/DIogel07lgYwRFbKhhPFls4R7STFF/hwiROeS
	a4XVHMLPjqdHuzRwSLLrZMT7LkJm+aj8v/P6xSnaV8KJA4wOjww2aGXqCYIVvb2z
	Rgfls693TApsqMuQ0vgZWYpYyfKuimfKLdYP8XNkJ43ssyH8lMpcv8t7rm/ZpECS
	MKcYAhFjrRXPuMOr+DyUQpVINzWbRdFf278OD8P/dQCxBkc6rVqYDTe7IoWtO7hA
	SDKl3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsrvyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:15:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c2af04aeeso41958001cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941315; x=1784546115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=;
        b=ORP73FBvrKvtJBoI2l/b1dOKwgjMpWgxg7c6Lew7IVtZlBLHLf2ByWnUpv81jEEG4a
         94EDLFDSLanOG7Gg3OnvPFngTVwctKp4Iq8L42cTBe+XZ5o5XPu9nI67CQBAyBVlXWAq
         KsAF9iTarQO1l+RiT7GC2znueO+PWqKLl/Gdz0ng9SHKEov9bLbXA76IsHzKa71J0fZa
         5j/ZCNX0YsxiEcA7OD36cg2enIeWZ58/5k9MnfKMDijKbAW+NuMKLkBwIOZ/VUrcA7G9
         uPr3Qg3/2H7LVzka4TJ2fWLm3feNAYqjyWPryEgnii2DK4dNCPEzKtLprxBKwtoafg48
         6/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941315; x=1784546115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=;
        b=aAnw2lK5YhSGQPkdxZcHTbkQUtOxMoc0srAAShrUFtgItvw2ceQMD1id1SYGpvqyBO
         PybQGOz43X5KBbS6MrfbFOOWfoXfbZPjMz4G+Vh9efpxOwv41gsQBAjBPyvX7V4f5aZH
         FZxKL4k6DKUvHUHzkUo6FYfsgsOtzs9go4+L5z5FOn08nr1n2hIR0SeXoFzJf83kx91G
         XSFdPQvHZ7zE6qebOVwl9oQPbuoqRoVxw+zvINO2JHvR4KHl4LjZm5gOBGxdI762xJ3D
         wfHq6yTxqmuqbonVZotH/rcvn7ExV+O8+7KtPz1Fo/dDQjnEftGIRTqoU6whhpivYNJ5
         W8Ow==
X-Forwarded-Encrypted: i=1; AHgh+RqcarX0NlScVIORpeTdgACSI/9jyU6YAHQBBvuYzCtbtuOTP6bUN4C3kSB9r3WmBK+mOdw8UaQscr1FIJ0gxgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Az7BEQb3rpdPD1KtHfck8cl/LNzYlf0NWH/gQY6ogSCZPyTv
	n+bVKqEZkNRRyLmX9+qooAl8ODD44dYYhRzYtn0OKV5lXHlU4X0G1O0YAmfcn0xCi2+xd4muVzz
	Vsat1wMVxG2QiRU2ue0LRmflVTbVg7kLaC7tUgwcXyHcAW+rAHRA8Hidr5K9likt/EeqpPQg=
X-Gm-Gg: AfdE7cmznJitrNnEd/xslTxry1akIwOpSz3UrYQtGb9VhWJUTOhxy2OipGgIp0i+fbL
	K475tOIfth74xEQcXRv8PtmK8PMTWKt2pJSkH8+ztPL/RqCpYpUZre0lpDBq+OyvRhf6WEea9xZ
	rKWQINKF3IpcvwoQGRdhfnsVtzyG5ubhc+LJt91i6TtEIoGkmA6U1NtL7Zvte0YmIObaypn8lBh
	fZq++OhwOBw7sI5xUspCHeXFTO13jif2T91955blbhrjQcBgWbzO7KvgAtj+RQkrT2hy9PhdugM
	ZOfCoUIIiX6knWUx29zFq92Ye5Lc4XMgOGf4lfzpNKBDvVQL25ok9Mupp1Mp5fSnDgQMxGWz4wY
	ER+nzX5wQA0NQskTaNiBcTcfwhwVZN8NOaQ2hhOFF
X-Received: by 2002:a05:622a:5513:b0:516:ca56:a44d with SMTP id d75a77b69052e-51caa02e1c2mr128571781cf.6.1783941315434;
        Mon, 13 Jul 2026 04:15:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5513:b0:516:ca56:a44d with SMTP id d75a77b69052e-51caa02e1c2mr128571201cf.6.1783941314689;
        Mon, 13 Jul 2026 04:15:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:14:47 +0200
Subject: [PATCH v4 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-fw-devlink-v4-4-d4f2dee27ad9@oss.qualcomm.com>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=W+4x54SXHSvmG8iNR7zCrefhHtiBz/ghaUo8GDg9VJY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMiy441BqBZXkzBL7+gB9+mfFhdM4Y+nxwH32
 viBbBXLEfyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIsgAKCRAFnS7L/zaE
 wxGbD/0XjM5SUCmLLr0/CpZ2O4eglSDLMnTe+PCk4WFrytuv0nkkklMcmuO/rXJ73ryMSYNRsOz
 gw6KArw5En7YnHt/oTL52z7uiyj4Crm7aN1M78N78Dw3ltpUv5keC5V/vexaXO0+YAZnqqr/B/K
 IDoZVdqTtG9O55r2/ChQmU63N6TsDL6nsC225TJgpjHwJ95QOONzET5WM8Io+t5JQREjriZOyUl
 HJ8Sd6x9jliHz6ohBhFOtQrmjvgpMYRJL/8RVK/zqd4tRS3NStZ/FzM6+bV/RgcYodKnt/Zvhtj
 6qwc8OE5RxpkWiB1RqTwS5p/aeH1Q3ys70ZO1xKT9Omny7wncY9zqr0//PV1YhhSRw5FZRSt6mi
 d5mQx1dmFMvgiZJtpINX8a87qPQeulvgfNoX6RMwyA1WeZ4TvSU+fcSYzJRSsFgpKGg9r4nDKSG
 40k9iaOplZDo3y2kL4xIH1zMUfkNNAekxbIbsgPm5G4jeQa1RZjHoE7pm69aEiH1w+CwlJqEftC
 GLybrwHegXBXYQmIRMmlLFF/xH3rEYB4W76O2HK/S3V+nhowH12umt6gqY+vqwCvE9LA14DWPt5
 GDGcYc5rzIx1N/nDxqwrRO5UqH0mOgIqo6yVh9FLjFhnqKE52Gqd/4DlkO8KVfoXnfNP3z8o85P
 iAOUf/P3EMQZU9g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54c8c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tvpOXC7k8EewuiM7otmnvIHb9tqExlBJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX8qjBWpSP1V/n
 Ov3e6KO5yDr70WuR+Xp3ucQRmbDko1IYVLEfP6B5DWU4HRbF8YaIhhuPKkqpAUbXFXaGgq8Ogmw
 2c4mVuI5flsv40Dsj1tKb/bEJegcg9E=
X-Proofpoint-GUID: tvpOXC7k8EewuiM7otmnvIHb9tqExlBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX8GhmbSyI5a1U
 Q/LNl6Cxrz/PQBj6WuApVlb8EGh+EOatzm//J/k0k5G02Zi+GZNelC3N/LL5O7tBBnH/q07Id2p
 0vIxp5zIg1wnRkLl3iwtp7MH/4QQqx9C0deCxvdZoB6N4DQeJX4mZ2+TqPiVlcgkUwMXKIDkRi3
 UMjgI9cnJkw3rHAX7dZhleNL4sWk69gsZFYQsDlKFFT7C3ojfcN9wcLMfMjv0011ptlIl4P78pr
 qhfw4jOc0iUNRtD7Fyxudir1ykSPbzX01yDsyy7laJMGbyZi5Swjl5pOWtbUOfpjSGaWghuiS9Y
 sHV7m56BtUE9wWcsybQSeRz0bXD/7TBXKj7JswgpN1vcXJK3L6hLiXcp0ZfJDHIt7V6MSFmaDU0
 PFjGBbEgtAZwx0RS0PJmjSo+doY5x9eGJwyYwrn/D54sRFLaiUr8qHdv+6IJbVD8ixMhgs+p46e
 b5tkE7Z0RLAxT5C7ehA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130117

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f9dfb14b9d477fc0331441f96c158b0474f63026..a7a5d81d30658700b3744e0b2994211d75074883 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25102,6 +25102,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c

-- 
2.47.3

