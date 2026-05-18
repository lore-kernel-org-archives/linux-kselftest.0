Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231E48AE01
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113808; cv=none; b=cxCxppWoHpfJlTKrmuijub+5yj5065AU2EzIk5Z8J8ONfF5IE5wOK3t2BkRUy1Ct+oYsTSttv5Fd1Bi0P1ZBpsuU5qZpVtCigXKToYooLuF1Vht9eBqutN7H9blMFF99izgHIt5OEU2jkCkJN5N2CRK+4DdgNPlv2ilsR14CtIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113808; c=relaxed/simple;
	bh=Edd8Loy9LT03pLD/2li4NPnBeF+14xrJKrAhxzpnHK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uXJh0WMkynZta7vCiow97rOS88QHvsTUSPQWg/ZIzKcmt3Oq1xn+92TH1lW5ek2xknyrGpF/3mQGQtte+8DyLYsHFrCs6Md+aqA3UtytdxXYaFuR2HDixZ6haQqjbi0eS+Zno9YlUhNWDfjXWDvqJ6KolJy51sdFfooI3zbBnx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoI31mAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgDJVJS7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoI31mAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KgDJVJS7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDp8oV2893009
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 14:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n03IPwQ5AgDSCSatTOhfNg
	VzATjRS9KB7SNuggiIM4E=; b=NoI31mAdR3Y5gLTRM6ZBvXhghViNECLAEDVDlM
	VVhPswQPDitrgD01PtvSWp2l2p9prKCS2HFoXU5yT51Tm0SwN3ndy91XbtPPRQ+E
	1O23GA9TeuFvH+T1OPVMQC8nwsTvxUMzRVGrpnuLhKMGAt08S5/a3BrVwqAZHTBm
	wOduuMgOYfnrb3U/p9jLEo2SGH8iOrXBD6+bVAF/TByFdaZF0M78Y7uX3yW278Jj
	dawkDV+gehoT0cRn7yFPdN08VNb6MqFNecx0fzF5XNzlT2BMvWt4eWP7zKhwMsGL
	Ch9Z8xWhX6UhgBXGiwfKOB+n5GNW/PSWRLcUsWHICFhiNUwg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk19kvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 14:16:46 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dbd4fe0e15so7116718a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 07:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779113805; x=1779718605; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n03IPwQ5AgDSCSatTOhfNgVzATjRS9KB7SNuggiIM4E=;
        b=KgDJVJS7u01plqZSNlu7kQl2a9yTEo05bm3vgQeFlicGEL5uCL8aO/5/vxzrKo1UE+
         GQ4Xgod9y2fXQe2MzEGJJvAPMwI0qxTkAVTan/GGsywM6ND6fnaJoPQEfnK8zu3n9JWK
         b4+WdwVKNi8WgSbrAFjnNmAFdFhR+mdr8D0xPfX5Jl9PZ3zynTp0qFmuUhtRheTm/szs
         zbXA+4M56nr9RQ68T4vm0Bdgt4J/3zX1jYol9MVe90cpkdRkRlhV9SYkFJvbZJU3S9Mz
         VY5uZRQbpYZnpk/8GGVHwhO+g10sfSLw8XGhUy4f8Sv1bBsoV0C7+A+LHILda6i18eer
         wIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113805; x=1779718605;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n03IPwQ5AgDSCSatTOhfNgVzATjRS9KB7SNuggiIM4E=;
        b=FoD75JOm4wAHCHcjMHumYLAzpaUb1nRtOc8rGAjyrWIzYKznmnpwmADsWZeFS8dFER
         ls1/ZQNexuDerEbAxX93KB4i/NbmWAbx5JC2V/Ydbrfw4avpK9WeWNfslsBoAwvi3J/M
         U6BWUjsFaPPpT7BwIiAYSk784AK4ZjjC2dJ1hF+v1mfk6COfEoE1GolAg/L9llcTU0vn
         v55zNIG/6ea5FrHKFsc7LNQqF9iudT0jSS4HLByYY2MJsU9ztStrkkQQSjjuL35J6edp
         mys7/tJYoCPsBYPEYAbalCiti1dOVEqW9fn/iiQo+D+VeBtRGEWtOmAYxlswBJUH+bC2
         0YrA==
X-Gm-Message-State: AOJu0Yx87scwaelljb0nsU5ZOFcSoobivrU7/mbbyQth0Ci8HlJbM3lf
	wd3uf4U4S0Bg4S/TD4ENV7sknBifuvPExddOd9PBeUWKzEJccYfDKj3QKCtDkkZuzcabJY+6111
	zpvxE7rPmEouyAXWy/f0aBH6GQxpIMlmpoQ1i82x5p8butOQvASCx9J6wioQh1N66vqpLi0GYeu
	aqJeM=
X-Gm-Gg: Acq92OHak6xpvl28/2OVaWb5LHd2AUf9dSFetM9bF65orDR8DOBaTlkl4+YgmsZTzFD
	yG22mZBP+402HRS+AuNBmvlM68HH7WCjBQNcFCW6KE3dS/tIkrTzOhnAsVz/kCEzkUKTEkiyfPp
	LPQBLpO/G5DN8v2lHcwcIunI8OgmMXnzuCpvEJBkk9YFpN7e87MidzXeZf+SrUsQkGvLyHfuZko
	dBAk6Y3aznn+UwFKW05+eyOAX58O+iK7YZP4c5rCpgFAv1ksrUV3++zPu16yk0iWIpEAEnHqRCu
	0GIFW73c3gxSrBiCn9Wd/5Lv/q9wJMABQ+y0+vXfGhvAg0LE/LuwCqSgymhKl1NmBsJoXEV3M7B
	Rgn7Wy1HP6eGYd8I5/46qnklGhZ53BV1kjhipSrWRIjImhzFI+w==
X-Received: by 2002:a05:6830:6312:b0:7d7:4639:43ee with SMTP id 46e09a7af769-7e4ea071964mr11106753a34.3.1779113805139;
        Mon, 18 May 2026 07:16:45 -0700 (PDT)
X-Received: by 2002:a05:6830:6312:b0:7d7:4639:43ee with SMTP id 46e09a7af769-7e4ea071964mr11106710a34.3.1779113804694;
        Mon, 18 May 2026 07:16:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2949asm119371225e9.1.2026.05.18.07.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:16:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] gpio: add kunit tests for GPIO core
Date: Mon, 18 May 2026 16:16:28 +0200
Message-Id: <20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwfC2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3fSCzPyczCTd7NK8zBLdFPM0wyRTUxPDtLREJaCegqLUtMwKsHn
 RsbW1AEiWt1NfAAAA
X-Change-ID: 20260326-gpiolib-kunit-d7f1b5541ffa
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Edd8Loy9LT03pLD/2li4NPnBeF+14xrJKrAhxzpnHK4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCx9Db+8eE7GKXbl7wZRJ/T6B66/kgynFPXG/c
 pMFP7A27zSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagsfQwAKCRAFnS7L/zaE
 wy4BD/4ma6qQ45geCLg7W4rwuUqqk9lEJ1qpl1o0R73mDzooB2gRO+l1ncZWJ/BwMsWU8/MKYAb
 xYRBx6H4Urd8C12caM+ld8jTIsKSY9qPMGEsBZ1n1+u/rHgJixvZqWSRVf0e4SqSCopWSmsbuZP
 m8vxUPnidZYmTmdDOjroaecoj+iQWyhu3ufZU8+7T0s5pB70plpqf1abmwHXKB0l6rCLHpTw843
 gOkGrcTQa/IjS8s3BJ1ncR0GWTmTri9c+9m2AzQfWRKFDsdkqWeSbJ/3ljZpAsyI4xHkSyQK+T0
 wb4aHTrtQhwjurENZkLfxIuUhNkzsmTKGr/SN3+QjhAk+Im6/+bI/4GImhkFCAWlm5bpwdnVXVF
 tA/9W4lQtwDZKysJhdwJ4qJMmavyEqBXJkONPeROzVoy+jXfQtlt1pJVACU7PZhLuTrfNayDYVT
 rn3p+6ouVYzvaOGk3sRXOWyhwWa58oV0aAN6LsB5/qJP6BqA0Wk2yFDyXwRXEMi4JsLgV3ujKji
 iXIMQJSpqUUKrwl8alRf5iHHaLvTfmjdGte6jg71cb6u+Z8objk1m83AqhmlYuthfQKTR/ZJvkP
 FRDNmL3oBZZCBe1KRmpBUtc5pCqsi1HhCbgdbi32QYuIs53qubPPnOg3eQfClA4nzJTtC5AYGa2
 HJecO7pL7AvHT1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vp26nAGZuGRzT9yfWiiMLD8Iwxo-Jkz1
X-Proofpoint-ORIG-GUID: vp26nAGZuGRzT9yfWiiMLD8Iwxo-Jkz1
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b1f4e cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MtzmdRDdlofpVA7LM9AA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzOSBTYWx0ZWRfX7xIqj0czfdTE
 a6gqxyljtYqx1FPhdAtJKZUWmgldZrOlBGrLzzH7SNjzZ3jhErb3sciK+HIHeQ7TNDvArdc3ucM
 yUVTOBHfQdV7oTwiHOWHCMKAY14ZLyqV9/E5GSGo0+irl2uLv7XxlwookASnWqdGmweGaAed8qU
 7Qa1oTlZisQA9fNyLintV8E02HmJktTmqL8W8pZ9YMeYAdL+O6+IAIAkR9KTh3detd28Rpp7TSG
 aY25427sTI4ZnE00ex31skA4ON3freuBCIlr9WoATu3bsWkzPHJhjqOBwawu5WkI5dd2hyFEFrm
 ys3mmkrcfcNgjqeVwmwIGVdiDSlCSEKTq8fMgQV/NCYP6tQuHpVZsmwiTnl4wgGkenLfgXCGXeO
 OQaWnJHc0baTUzfox0s8+4exKIQmwwc+hXPZfbaeajwQDhbkblkMhPGzCcNqSs/zSdwlvVIV2ds
 qQKvbxSuMGgbYxLaVOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180139

This series adds a first batch of kunit tests for GPIO core. I intend to
gradually add more coverage for functionalities that can't really be
tested from user-space with the existing kernel selftests or libgpiod
tests.

Merging strategy: with an Ack from kunit maintainers, this can go
through the GPIO tree for v7.2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      kunit: provide kunit_platform_device_register_full()
      gpio: add kunit test cases for the GPIO subsystem

 drivers/gpio/Kconfig            |   8 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpiolib-kunit.c    | 354 ++++++++++++++++++++++++++++++++++++++++
 include/kunit/platform_device.h |   4 +
 lib/kunit/platform.c            |  31 ++++
 5 files changed, 398 insertions(+)
---
base-commit: 4a1989fb6514ca2a4b157ff4700bdcc8bdd9a978
change-id: 20260326-gpiolib-kunit-d7f1b5541ffa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

