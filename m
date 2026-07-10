Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B8D230264
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691521; cv=none; b=RA+nRV1twt8HrlkHmDv1B8Xk6kF2qBwSXzefaBMxNFzNveXE+fTUprbyXRwqW9X7VXqo8uKcN/y20CBbEjU5OKTU68I1eQCLXu7/Qdi+9KeA1wWkaXAwrYqfqI/jcERP5A+Yr6UsB9Y1r7nQifykVqb3WrXE0wls2PC4G8pyHQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691521; c=relaxed/simple;
	bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9ZddRXLAcgnPg7IFqMOTE99XHwMcPjDnRX6sKGTJl2Ei9bvVBod2B0N4ejSnmgZj3eQfGX30FBocpON0pbjickI+byLLlHTCdscfW2zHEks+coBxJhA/LzubyeZpZoAONseCxbzffP6cqkp8QuTGwJNIHxAUNOk4gTXafxVRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3ySqATy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oc026SDf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3ySqATy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oc026SDf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5ueJ919848
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 13:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=; b=F3ySqATyHKbPSeSH
	ugB/fD+6KO2wJzEN6VpmWMmQfMwQjYHaMBRlHIMe6OjQdZDtCS+FAL+APZSICeY3
	FqqdeYqTMDcuNBgslxX9aPeJ256MGDQ47y9mt6weF6/8XT3NvMzcGIpUH7gGaQ6a
	WjMIk6lHeMF8ME6eigPCUM5mqjqwnm4esaToAU0UFkT86xK87kJQdHErUuoKUF6O
	Lvh6PTVNeAlcJipZg9wS1E/dU3eU2oWUSfiphaLYFB9tui1gNMPCWf9MLiGJ9Kgo
	/J2SHb0afwipAkiYwgtCq4v6yFzx8grNMj7+mqF8pZilWZM0sktB6F4SIRQHphTT
	72OTSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte3c4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 13:51:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so181245085a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691518; x=1784296318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=Oc026SDfNQ0qNjbeEriD9Ay7uccTVca+FWj8GHBtaPcELXv4Bq1sb9V2nNV80O9qHC
         70uutP+ZYXtBt/koY8Q1+uKjlEF8FfIw8UhEvuSTKGHPS7G7R7nOzLS0w4g9vIuqRIG2
         dtYCnA1KQY6NJ/i8IIHhd0ESIOhT1c5O+dB+XZ2huZYuc2Z+o32OhrCiaZoLsz8A63pN
         +910qJtqTKExPTcWc2q2p88jid9PvUR65+CLKAIUWvGOoY+tzDd3ubm2xr2+Q/dj8sJY
         JBWD3EHj3aGfDpVHwod103zuD34z6/itMsWOGW5YcpnQrzMaxwpmTWax+yL/RP2ffWb7
         CnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691518; x=1784296318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=gqOSPMx+yZrEM+VvXUnHFzsH8JiJSj64BDtp95KM/VcwXvcilIA5EReQtxs9/MlA6T
         QbRH3DqA1YiQbRXVWO1IFmYzizjdcX7p3FzqhVOt3u/78ERasDyedMND+rgSpJ7okjxj
         Hv0ZqLKuG3m9oy568pDthmUW6n3c/BLJvzP8p7xsGKwNWfKHMTCx1fs4qWKHPfCnqvnC
         YT/Diey6B4xwnRTv1gFcPqqE5TlC9OkdIDtwIrYTLuGhdL3Y0IpYfot7QnqSx6MqlkBp
         w2/KEDyH1ws3mZzV5bL4+OMVIKeP1o8zuHA9uWPC4XwJaC/kAw4iK7Yt7Aai/VAZPBK0
         dqSg==
X-Forwarded-Encrypted: i=1; AHgh+RrItZZhjHOys6zneyJtmpttOH8kE2JjTaa7Znw7pkUiqPJcfDA6W23VWavq/hsQcfqsN2jaJEpv/5l0/ApWaJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXprmJ44QVfS0yasH5Osn9qw1SHYE9KPPL6oe3QNEM+S033v8+
	3bNKWUyHd6ptmwu7dk9gDo14pXC/9kpQuP0543BOsp5M7l4em3ubGr8+++NzsvVXoeFBwrMwoad
	8wEaQ6nXCrIq3CDLEBmL7emr6j6FC3VGu4rf7kBMrxATjznrOPGB2IgnJ6fhP5dk4g/FONAE=
X-Gm-Gg: AfdE7cnvWBcczi0MUpJesCk1cNVSUABngPOWSUOJ5dxzZS8kp8ESCj5LyLop92aow+8
	FaHDqpZ6MLp9a/RsEhF4ethg3gHDqChGQOn9oenObWuAsmXJsb/42mIABF1Y2b88E1m3JFPrnvU
	IlYAyMoiX4+r0TYD+dBafb5MzgqCzHXh6QP+RKQ+05nbgGlDdlEqejdO5f/Jo71MRZTvIRrsslW
	z1cm+d86mzu5mN7ZU5L0C84aIRMyBmSNkvtVS4uwoPGrhOVufnfstsPFTeMickFT18ooWAVd22s
	U4dDm1wS8Wtw1J+2gXIpm3xiXquRshjjX7g19oeSnNsIFGy55V2kFEygksWLb3kb3MP27kLGs0s
	IGOL0IldWt/j6zX/n3xOSg3+mHfzvrBVO3BI/s+XA
X-Received: by 2002:ac8:5f4c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-51c8b2aec7fmr125426931cf.12.1783691518104;
        Fri, 10 Jul 2026 06:51:58 -0700 (PDT)
X-Received: by 2002:ac8:5f4c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-51c8b2aec7fmr125426501cf.12.1783691517650;
        Fri, 10 Jul 2026 06:51:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:23 +0200
Subject: [PATCH v3 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-4-993f31874e40@oss.qualcomm.com>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
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
 bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPju14ZePJwCsYAjiYhx8i5rjT5UTbEC9PAiC
 443aOSLN+WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD47gAKCRAFnS7L/zaE
 w3UKD/9BiRulUtSRsu+ohMhsfYeNZYC/zsyq35GANqEkhKyU76r8Fli1KjU3pHnabL9XE5f8owq
 14X4eblkJWpyBej453pKePC/c97tcsKEYKPf3UBUSmHBUu8z8nyDonDQrGW4NeuAKI5BQnqFTmt
 isFpnJNKAe4Pq416vnY56HSdM85KZvviEX7mEHxmyITHf+O6C7dy4iMnYojkX5UIvvpAoICDWAa
 HPr0vY7B7Df8O2/vifavIDtUA/Qw3XBgULH3jELalHz/h9OMWcDPmS3jxRaq58M8ZdVSQ8QW0FK
 R39uMNGn+Bv2MflNRLRAHLp/YuBD7TXSQIqaatRARwqXwHn/rkcmM2tkn1MUoRtZDy7P/+FXc9J
 X1nLKucD6UvV2g9zC0iru/vtBpABVt+Mv4QpwahJ33lB6amKOYmFKwsVS+LiLphdOpeY+rj3bUw
 CIuweJjVAVGflWl0cf0zoeUVyZDyoAfHSgfFSpbfrXnAiTrtu2ob6CnOcEKqgZNxowr68H1kd7D
 U3QDBBMFrdUkm294dPJjEHD3njv1IZbuRYQOBR22e68sLUMY/BO9WG+2KaxOEJkgeMzbFmHas7y
 BwG7YdxUgJH7H5UwM+JQbwwcfryU+Rn+Xrk/q3i3R8ulCm73INqvvi1K3xOTTg4sanfjQzZuNHV
 osiKy0L3HjkFuPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: rtR1h3mxucOMyyHSIbbIfudHozyqPv8p
X-Proofpoint-ORIG-GUID: rtR1h3mxucOMyyHSIbbIfudHozyqPv8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX0E1XC91eG4J6
 qWNIZn6roCyWm5HCyNhp8nwSqL3wVykF2CI66PjoLxFbBgNgIffXLVkYzRJa33JrD66L6ch1V+7
 WOimuZ6H2p7xdrmWAwjDdToz+P8h8uP7MCobNDk2d8zcClZNjS+6vvkGPdkaDOEeHu2m0DmAEj4
 WbWvR4VSvW1vlH9AHKf5XpZLqwV4nWBXHOKBaEebvLzGqV/fgj+qQ+Z/psn1vRkOc/2OjMhPvYW
 Ybme+WLqEw9THunTYXsrrgW1qy4mtyKI5ZSsdMMcL80QKjsHmcimT8Z6iIwqX0JNzHQC0zj8RkD
 p2+rHp1wOBm01hqgEcna7qBfUZLdUvWpv1aVm9hkClu+VRUGK9abjSlpTo79ynBOdHnLY4WaRro
 F2+YT3uWstXC2kwwe80J98p7kQpW3WsfHU/bXotlu+9cHaEpquoh2rwq8ZkT9//OCKWrFdRaYHV
 zC3357/Oz5flVIessQQ==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50f8ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX4w1m/SpJ5A4F
 SKDfnkGJQzzLDpOfBvmYdm2Aw7t245xLdND+WGsGzhUMs/VfrEJI8WwBMPFopRdEVd7ALioEE5M
 ELIOlBykgAU0XvJoS7/HXJaj6XqBGG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7741614c941ceed9e46e9caea72bad77cfb7618..da886aa69f362f4cb9dc529a26f8dfc67649d7c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25101,6 +25101,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c

-- 
2.47.3

