Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750078;
	b=Mn5YSv+8L2jxNaQpNDCH7Yiw6VhdLWeVkGOWYce6z7j0jKFq5vdse16yQ72xWqr6n82G
	 dfyETIIlJI6fabfm+E/SMj5zzHt001D+gC4Fk0fpSJpgFlWXKUTtCUwCnWtO2SPVzhUnc
	 tQf7gyCwULqnoCiQZetKUuKJxR2GS39nzmrVdXrKb30gdGCBb6bfIp+gRWQdsoPSw69zL
	 CpYUq5eXSc6X/GVh1Ia2Y9nu/K3nNmxqohnIaXnqKBnL9Vq2Oup+Y/sf4S5dChaNy8pgi
	 Z2QJEztsW9o6aY+x/bNl1vyoIzK9uemnoFYsZlwK0/Cgs4BHg5oInKhJP2+ze2X1NZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+hYB8vIdn3c1pn6RO0pEukndR/qQEe1QNgP3ixNwULU=;
	b=unfz6W1PzDzjNev40Psa9ndlr0D3r5VnOujVAL6p1ZmmVxpjO54S7WWi/gz2ZNlNaSFP
	 2qgIS0JRXZx31i0LK+7wCTKi9Eul8erBcrgVHtF90lOTWnw/HQBnQpuUghYTk9GP7sY2s
	 /FnTXH+ff8mcreyxToMUCGAZ05D/1gfvT+Bdmek7dfx50qfcWrhX4YNTE9o05S/Xs7DMk
	 7T6cfWL6wxyA0vwocXPkwwBQyfpUgVUpUsJCrNF+yWvAXbLT1RiKERPIEcHeMOj+pSRXZ
	 Cj27R1gSzYQ52o8u5H/WD/feMORkle1+JV0WjiZUvmHXx3Y7zI1NXNQIvtlzQBcndoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOjy4h5P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKRXc9Yw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DCD606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DCD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOjy4h5P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKRXc9Yw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FD4q1767179
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+hYB8vIdn3c1pn6RO0pEuk
	ndR/qQEe1QNgP3ixNwULU=; b=LOjy4h5Pb3CVpBVpvuvYpC4CCENHmGNfG5fHZe
	M1cUI/GHuJCMrxoE/R2V5fGy+IENjVqYUAb5CNhXO1+7c8h1cbos4OoV+23sO2jr
	oCU8NYl4GPVCSMiuHDQ/r+imvmZ96KLgh4H/R3ShzVAhAQk/ngE2SgrYwbZmeUEp
	clTikW288H5TlAC73IsWdGpJ777xyR2b41VKwYy521T88pmhhXg6EEqFZvi81r+e
	7hDlK4gNVKF1+EIhvMxolB5oAuCp1XMj+3ZNbrGTa+BSlYMy/hZwS/+bG4tc4iiv
	NoORRjCxfeVfkW33VrFWLLtsPxmySGBo9Nhr6wI80xdwreRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahuk6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:07:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so135407085a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 03:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750074; x=1793354874; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+hYB8vIdn3c1pn6RO0pEukndR/qQEe1QNgP3ixNwULU=;
        b=SKRXc9YwNtgAeGdeMTSS85LD4uOyah44YbxLDN4Hmdio7dh3ziP+tkzSbxpEgGQETB
         TtBbZMhrgzUrWVJjA7RUEKC3EiGxWELLVOPvrwse+ul1NytVvWW/ykv+Qe2k5dcZcmFa
         LrA7JcrRJkUmjjLYBwlx4HWD/eZuqTjaGIZNnPA67R23/wno6wVz0rzvwpTyIJWWh7UP
         KaCeMhL+AlyyYRyTGFxv7vySyQ9EwiWtWuF5/bcfxMKJGWzmWk7hpHIQKi7WJOyVgQgS
         GnNHxSaxNYG7xiZC0Bqp7RLZXJWhzM8kiDDBApalCy2ELelz/2elZV4+B7Ucmq+BFXTb
         yDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750074; x=1793354874;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+hYB8vIdn3c1pn6RO0pEukndR/qQEe1QNgP3ixNwULU=;
        b=STTyxQeNbNlK94xT9F3UgiyHAf0WRIZYKjOmz387Ur75L15oD8vdIDQSx92F/E+PWA
         8sVBXsLvbV2WcZY9s1cScb+8LUuT2jGEp+h0XsJ++zNymiVkRGHTNLpm79mZxF7AqY8p
         gypIQI4iRj4zU/qeVtwOcTccbDq4lBgyMLOViellM1vYGSShEpxnNtXgjUev33XV3NYs
         AnUZeCSci2qZWKu5/8BogxUz4VA4fzXQ9h82UexejxY1FGc3Mu+QvA1HW0+cBXZI4QOc
         YwizK/3gZ4lAszSFEMvgCOmG7k1xmKpBOidHbGPP8rob6KHLfVJt1ppivvghk9Bq4/Xf
         doNA==
X-Gm-Message-State: AFq9FYJDP1MBcHtVumTZE1hF8/4BkRI/q6I35yyWg1tvmqUTURIKP8/N
	KqZEMJRDYYiikrnA3qyIj5aeu+vyfVJYSBTGFuE5lnElZcthFrdGXCQXXxvewUgAM856IQX2jV8
	ORhVkvbFZKF9fuh0OYAnPROrdJfEiBS1FrRnBjUW2uWdegBOTpFyvm2cTpbN3RolAadHqjkQ=
X-Gm-Gg: AYBFou0nM3yCiPteLRTB7MdYLRkYTHjareQ4LoEoEAg4bQMhfbjHfTsP1HNum8FOiKY
	C3Fpq/9Vgjb89a+4IsG36Q+aTnzCsRPp8Rrh7R/yUX8988xCH6aIqJLT0YrYdJWj8tJ4H35nv0m
	8HgR3vvjjD78twYbN1frDL7MlqeQG9A8CHGIz/kx4cUUI0LafB97DnWxI0KEcjUMKtIrNIOZMK3
	JSJgShCk715GJRPgp7IufLWy5yb1crtLexYAnAqxbfmJ3FBN/guPuM/TBWxla9nfN31L7zMj0uT
	xgP1tRCEm7H1KX+MoIsN0AZVvJZt6Ts5pv0GFX9irKRytb+NNar7EuVnFVJ2QzEpuACiwc1lRZm
	dSa089Q0A+8rkWb1QvXeE5B4NHDEI
X-Received: by 2002:a05:620a:7108:b0:93f:1936:b229 with SMTP id af79cd13be357-93f6f8cd1c9mr328323985a.77.1792750074508;
        Fri, 23 Oct 2026 03:07:54 -0700 (PDT)
X-Received: by 2002:a05:620a:7108:b0:93f:1936:b229 with SMTP id af79cd13be357-93f6f8cd1c9mr328320885a.77.1792750074072;
        Fri, 23 Oct 2026 03:07:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210473567sm64223175e9.12.2026.10.23.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:07:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:07:49 +0200
Subject: [PATCH] kunit: configs: enable power sequencing kunit test cases
 in all_tests.config
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-pwrseq-kunit-all-tests-v1-1-a60f8637527c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPQx22oC/x3MwQqDMAyA4VcpORuI2RDdq4iHMrMtTLradFOQv
 rtlx+/w/weYJBWDmzsgyU9NP6GibRzcXz48BXWuBibuWuILxi2ZrPj+Bs3olwWzWDYkuko/dNQ
 PzFDjmOSh+388TqWcIvzrOmgAAAA=
X-Change-ID: 20261023-pwrseq-kunit-all-tests-004e89608922
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=968;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WQwTcfXCI8PIhYNiXY13rdO0dKuVAijHb+5YH/PdUi0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zH4EKrQyU23nBL4YeHaQlpQgy3gODlyQXS7E
 TQ5UJxBGCSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsx+AAKCRAFnS7L/zaE
 w7XED/9Kdv5cMUpKk2Rbn4zSVRkA66GE97XhmEXSyMwp0wGDrzoEmADXNgiGLB8LRCJe06q1fYa
 gEVoi7MXdK8p0A5mnO496+Qw6V14LLMEdjUj8ZUxBB71tke52jnFojqET/COI+aguaDWsAkOicu
 FEtjozfqD3BAUURftfQYtN372VXnQ6ywaQwsvn0+sMXR2jUae9xX4g47tKgOF3T2mMNblMjjvMA
 G7LGOuIvX4RwwFNhwp3voFGJwSwM/mf3XvEYBZSXcaDq2xdgLpxGXrrSuwAmlWp3DJDj1CfPFXh
 E2owayqJmT/R+FrSezOw20XD3U6yKUqC2pa7r61Nv7yrBdvKn75VxuQ0xNCGoaIP4K/3QjM0F+H
 jMnstKDHJDMJmKnGmQIrxZlzJRj5BC5XtFwOm8ZZz3pzFqyW6azL3O9w8J0q6WClxpxzFbmFzQp
 3PHNiqeEZYiiG3IUyRPrroj1SiDJ14i+fDv/cpiHsheUu3oz+rp3hlAkvKcBx1m0PoxfnL/s9Xh
 VVO1m1Maa13s2Wgn88DQifjsl6dj6YuUnLxzpkiemGE83N+W+us3SkUglDON9/G9iOQrGCxtPnh
 Rao2oSuTTq9wZWNjQDb144fOl3tx8CV8v4KqOsHYi3LHc09tZstFfq7OpcDjWIuI1o4r5kpznq/
 0A/lHWoPTMw6UWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX5hI7oSc4xVr1
 BHZS2WGdCpeN6IE5AzDMktPri5DPUnAiJM22zXX3+rW3w8mgzHsxVBP3xI2g1S1+pbt/4BWcVAM
 CUBjzCU0AwSPXs0R9Y5sd/1CIxch6QQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX4ute2HtKDz4t
 aXgu3xpJ9eooeH9CaJqZhWHI28D537sHSV/pa2NF7deFPaThDTNU8sRQ/37TopJe9BnDoC7xEiG
 sgoO7yXBJwhxLHyVNL4MkWzniAY0+CFviC4OsOgmxOslA4UBnUt+A0vZ3uvf66E78LEFXAOsrTp
 U66fCAHKM2Yvfuf6ocExO6ON0qYkOye99RmSVHKgcMNorfr98cLWR1I+Y8e3HGSxefgC06EMRQ7
 ldlqL8VI/fsgbsioHc/t1NC1MykYJVHSGgvIcu7vF5A4iUYqB/WGbzgLKGCG+CX9PM5ipk5/MS1
 X2CF53kdOasE0IDGRdUMd1th/UivJzoRXGi43oN0pQEb0XEmEao+llLjVWPLurxfD8XOI5A3R7q
 r+5KCu5Y9ev/Aw4Qb6iCP35yFOLdEmAQnUjRnqRBS8FifBeV0FJWSp1ZIlk5KC7ql4A6DK5ARct
 aufQxg/NIMF20Ab5rrg==
X-Proofpoint-GUID: rj1dEgQNt0J_AZcjgY0ARNpzEQuGgkh_
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb31fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=AVvskxiw9NI6PveStxUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rj1dEgQNt0J_AZcjgY0ARNpzEQuGgkh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

Enable CONFIG_POWER_SEQUENCING in all_tests.config to ensure the kunit
test cases for power sequencing core can be built with this config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/testing/kunit/configs/all_tests.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
index 31e930a0fb6912ff1daf20bae8ab007ba3b0e77a..2e95db076a26327f59e87d83bcedd0d7c686c240 100644
--- a/tools/testing/kunit/configs/all_tests.config
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -61,3 +61,5 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TOPOLOGY_BUILD=y
 CONFIG_SND_SOC_CS35L56_I2C=y
+
+CONFIG_POWER_SEQUENCING=y

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-pwrseq-kunit-all-tests-004e89608922

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

