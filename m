Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD34402429
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457351; cv=none; b=jpRl9VRScMjg5HLxMVnWT9LLXBewLErokwZvGCY1xPkN6O2f0cLqK+A1wpz01RvlntOJl+q10h0at8jzZ6Hyf7VJzJVLKBr5pcnil/Sb5vsgSRHCllIuURBM8Tq7E3KJ1s1kQaGykkKRVzsbTcjZevEAJT+yvUslU/N+uTDSys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457351; c=relaxed/simple;
	bh=t3GMhU5BiDcAMpoxPcbsowAatqnK8Fer8zJ7S43It88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+gTF9s8CrUCUGUmEVPU6+zCtC50ClDODdcE/d5UpVLano6B6DBeh+jmn0ieK84xBD4Mj6/J+DeDFN3isG48Y/7FRkGoUhLFifN8CMR2l1AnLCdlfp/GnH0RE8cWsDk12IiNDUlPZTbRNmE/2fDMYSLUGzs7Kv/V5Xgv9FHocAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtGe0tmg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFonWNAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtGe0tmg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFonWNAu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBx3Tt1298051
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 13:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=; b=LtGe0tmglXAtzxpE
	WNmZPVo9zftc6/rHgKnQZ4jjt7x/ny7UXujoId57UrATIMyskSurmjOf2QEuvOf0
	mmsSZCotYwvq0brIyeHN7hPudUIyYev+Awu+1+N/bPAmdit1sC81UzzyH/TQf4J5
	jFGaPdwcsU/00gIydghxTrpCLFGPcnNADVN5Rdiv1rkgBciFuY7QDmDRyb5dqWZP
	/AfhC92ItACVk9H0Y2Kv4UJ86yAlcu6SV8YcExz+ZMEYIHG9Lki+XCSqk+SvChUE
	nIZDq6E9gZpnbBenTDcH1Sw12o5hW8UsK3VpxHWn2b5w0H061fT4O8TcJkG3RQDJ
	wEyyew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0b5yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 13:42:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d53eeb8aso22757641cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457348; x=1780062148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=;
        b=cFonWNAuyFUsu01VHvolCk3bG4v9b38BS/4iNjIechk7LX2CmMnmSw3ED4l7kQBmQ+
         Lva8X4YiTIZZCaPZez/DPqiRE31W9+OyfPQLFcYQhSnuzb4r0IKhBL+uH/Wib/+Dud8m
         g3u75M/5CN8ef+bQ72E/r40HDVf8obfRm4mQtsnK+NTrWnQVPDDmeUuzSGQYTE2+WRu+
         7GQluco3jx0dPiQgxvO/4Sl7AI9upFHdIOY7OKd+jZR4Enwsfk0CWz6DRnC6lvSVubWC
         c7hz46UjXWgpJkMcVVpuHUfXhIPpNbEjA8qgVoM2u4NC/rRNXdFVz9lg/eHC7gH0QEQH
         fgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457348; x=1780062148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=;
        b=r6HCqYVHjdmm7hyozZVdtgpnXztlEt91PVPhVozw/JB9VN+ag2MGM6IaoOofZzv8kz
         LhZMNao+zn47c4ek5+p5k0Sft9GCMbh9b+V/p56Q8UBxPiaN1rQBNodZa33KhZcNbjNN
         K/t8XZ4RcpnmzP2nlsV4noybCeGAcGD3I3N1g72m829e7dRdgjn7CVEj1Mj0Q1wwmtQ7
         KM9bAxBlguSq1DgzqfbZ/bZLCl429fMq0ApoEfMSRP7QW0A+SEquxuEYSV7h25OewfZo
         MVx/kDeTTDG/qmaZJE7BEHZhyhNYT2a2FMtiVJR2jzUnZ62c1IWdnsJmsFKIKwJRuSQO
         yAgQ==
X-Gm-Message-State: AOJu0YzWznngk/7v1ZGm34MIrsRFcY+j5nlpeGVUrzGpq3FH3kDpN6KN
	XUDgTgZFFLaOi3Kj04HfYC+nZd+WR5NhwJBqW7vsuj6JCMXmmrninF3aLhd5qeNXIVO5C0YuHOk
	TkdAdGHC6nk1vtQnnWxrDADLk+h374CBALyH+SbGX2+uyREEE3+GxqbiEyx18/3LTV3dBjVc=
X-Gm-Gg: Acq92OHLPmWl+LBoSVyWl00VMXyGeHQYxf49jmCb6THMn7gT0e/XzsDsMcwbAwTzM7k
	zQXcCsxrimmxd+WRx5fqP+oMUut+dM652dGG389iPRyt4DD6R2gErlrasJAdCQJiUJsENtI4HoT
	LcTjpv++/U/3HhGxzTAv8XgMfZexIuBpk6ag0tDIJmIf8GqlhfirID9yGJKkJGOGA1L2OPv4JQb
	PRv3tzN1MsB2VPtc5CXybo/IiiNxVd+gW4v+LN1WVdgEMxjf2HKTMvvBmgfKAIz5meX7omisS6W
	yL9kSBzHBUkZjJYU0rm0InbLiURtj2yb5AgXawK0mlfjNrFM+oEjaMrJI372+71NtcRm9J+4I7w
	XAOB/n/10dy++wW9D0C2JgOpeH3JsSqNQmepgyn5JWc0fdODCjA==
X-Received: by 2002:a05:622a:4019:b0:516:d612:d1d0 with SMTP id d75a77b69052e-516d612e01dmr38083081cf.44.1779457347881;
        Fri, 22 May 2026 06:42:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4019:b0:516:d612:d1d0 with SMTP id d75a77b69052e-516d612e01dmr38082551cf.44.1779457347398;
        Fri, 22 May 2026 06:42:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f548sm4886546f8f.2.2026.05.22.06.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:42:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:42:16 +0200
Subject: [PATCH v3 1/3] kunit: provide
 kunit_platform_device_register_full()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-gpiolib-kunit-v3-1-b15fe6987430@oss.qualcomm.com>
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
In-Reply-To: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t3GMhU5BiDcAMpoxPcbsowAatqnK8Fer8zJ7S43It88=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEF09akdtuWuz0HDpea3//v+tQj9e8KPiyPgit
 jZnToGq6rSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBdPQAKCRAFnS7L/zaE
 w9CIEAC1OPkgYBY0TsdaGT+nsD1K+xnFnem9v0LXfFvtLmw2LGuPBgWxOAzFCRdP7qisriHzqtp
 uzxJfD4ubqQ4Co2LatgTuhcJ72nuDmASloYepiA0NEnXdwf7e9DvQ247FhEL75qIV6pYzjbfHbB
 c7mPRtuR3gtW+KAPiUeRDA3c6XNPV6jhvs0ORr+2+CM6I6xQjggFpJcS/loto3Pth41UZOKCgGe
 9Bs/lfcu5lShmGitUE+YU37KgP5uubyPpp8cDpmjY7QgXBGJn5F+HdtVZpUXDQld1HK85q/wdiY
 DxrffqyuLy8zEeP/O0pfqUkWe5dofcZV4P+UVa52BYiWhlma98a74q1PsJzqj6f5mNz5ZHlCeNf
 x1RL06JZQ3QNyjfRgIgM1aTgHHgwGW82rtRPhMCvMn+jilCPiwd7oRzRfQVi8rDqSg8dJNLfakf
 4GOJgFGRZwNcFlfmwzlcBzW6Q1ArERU6lue8HVzbPNgycm7ImIaQFtLhOUaGXq5z3nHbthOxlZS
 joOzKtgQgfbltgcU0lJxbf9GOKc+h8034aZkqTXsq9mH71ChD8vU5NoCnmDHfG7kx2FfCNFUVDM
 5CNFeZNdG7Wc8vkSbEKP+W2eeahd5XBNtKmqcVYx0L1TRGViXNgfk0jwQvrCeAU82kVeYN6kge4
 sx4AMRjlULgCRaw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX8iqypgN7mhmR
 8Udkw6epGJkT/5ynAdhSHlUy/nmg4UvTBP9UgjSwnLNtbWPQyfr9StH+3Kr2/zTJ7YRGd97+poW
 q9SyPM5upVLQohwYzkQu9Rb60ZufQkc13xyW3gtWPb3vWVYp9geOEMJd9ZjgrcJhE7nr6ZLL90d
 PnFE0ubIaZPRAd6iZ9Tg7SNsr28loEqBOCxI947z9h5YLIh4KTHRVZAADocD8HQgGguloujZfOs
 0Rohjt5Qic2cZkyYziB93yLzLctEznWNEiJOHxveyRBMtwpMYTFlMCyMbNuMpNPvqb60zjpjC5V
 Cy3Q3YpQisPULXBuloUxduqndX8H3orYS7I0fonBJ+7ekPHj8sm+JxhCtDAWTtCb2U0p2ZLI/TH
 Yzi18SFrFB28NuPM2FO8uGnWqa2oKrMm/Wpb1TdDwok7Tj9ZZvJY3zHV+Gk/MyqE74vmS1TOkLy
 4QxBRe8tZWgw1ZNW7Ng==
X-Proofpoint-GUID: x89KUPWorIUIZERVBEgLNJzu9IvOOnf1
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a105d44 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3Mdbh2SI1NvihuWZMnwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: x89KUPWorIUIZERVBEgLNJzu9IvOOnf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136

Provide a kunit-managed variant of platform_device_register_full().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/platform_device.h |  4 ++++
 lib/kunit/platform.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/kunit/platform_device.h b/include/kunit/platform_device.h
index f8236a8536f7ebcee6b0e00a7bd799a14b345c1b..8cad6e1c3e7efba862862b579089f2f317784a73 100644
--- a/include/kunit/platform_device.h
+++ b/include/kunit/platform_device.h
@@ -6,10 +6,14 @@ struct completion;
 struct kunit;
 struct platform_device;
 struct platform_driver;
+struct platform_device_info;
 
 struct platform_device *
 kunit_platform_device_alloc(struct kunit *test, const char *name, int id);
 int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev);
+struct platform_device *
+kunit_platform_device_register_full(struct kunit *test,
+				    const struct platform_device_info *pdevinfo);
 
 int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
 						 struct platform_device *pdev,
diff --git a/lib/kunit/platform.c b/lib/kunit/platform.c
index 0b518de26065d65dac3bd49dd94a4b3e7ea0634b..583b50b538c79599ebbf33e261fe2e9ced35efa9 100644
--- a/lib/kunit/platform.c
+++ b/lib/kunit/platform.c
@@ -6,6 +6,7 @@
 #include <linux/completion.h>
 #include <linux/device/bus.h>
 #include <linux/device/driver.h>
+#include <linux/err.h>
 #include <linux/platform_device.h>
 
 #include <kunit/platform_device.h>
@@ -130,6 +131,36 @@ int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(kunit_platform_device_add);
 
+/**
+ * kunit_platform_device_register_full() - Register a KUnit test-managed platform
+ *                                         device described by platform device info
+ * @test: test context
+ * @pdevinfo: platform device information describing the new device
+ *
+ * Register a test-managed platform device. The device is unregistered when the
+ * test completes.
+ *
+ * Return: New platform device on success, IS_ERR() on error.
+ */
+struct platform_device *
+kunit_platform_device_register_full(struct kunit *test,
+				    const struct platform_device_info *pdevinfo)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_full(pdevinfo);
+	if (IS_ERR(pdev))
+		return pdev;
+
+	ret = kunit_add_action_or_reset(test, platform_device_unregister_wrapper, pdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pdev;
+}
+EXPORT_SYMBOL_GPL(kunit_platform_device_register_full);
+
 struct kunit_platform_device_probe_nb {
 	struct completion *x;
 	struct device *dev;

-- 
2.47.3

