Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB2364021
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730365; cv=none; b=XMVpPFa1gf+Mb3q1ZfWAxcR+XrYXoDkB8xUoewZUest8FbFjEzzF38TnpJudBkCLDDfXYtCMLpAQGRjJpqFWUAH9PAwjUGyF5llypw5l9U6SpJo0w4qc21LCaQ6rs03j5b4bLjfZ1St9WaXLiYjgHDSQ7pEFM1EdADmFxNKffKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730365; c=relaxed/simple;
	bh=QYS3EqsqHNnRb2qyR1WrVdwQJM+VvU5Fqh/2g07zTc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDbvdk3v6fm3Fa0RORWEZerhXGiYBMGus/Sjbjpy9oJq7rzo2z+pw9JoxD5E5adyXMZTtU900hdvjbIgG8TyPgLQoJY7sTRSNkgHacMYaAj2AO2HJHwOgkoO2CpwKWJhdYG0G/oyWuYg9yVCXxXZkDbylseYCNo1U0UJq19AWNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqRQzctr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XplhjkNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqRQzctr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XplhjkNV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASrrm2601136
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=; b=lqRQzctr4Kajdav7
	lYx2um3APIHdIRxFP7EnCv74uA/yCPZPdr0IuHoKsYM4z6GlXM8rmP5DCf5eBz51
	FnA3YVGfswU8viV7u48eQGPDmipD/EGXfN1SOnvgoEz71EJrvFYS4T8/2W+JLZU1
	rxQL3Og5rGGfuBVhXx9alLxU9dN+drAPNaUj+Dljt6xQKcikodtPfv9ur5BFHJHC
	20AflN73fvRlBZQdQO9Q/bXB7z7m77eB8WKur1vUf10JSz1dL+1K4ogAtAWPIsTc
	QczPnIplWPB2r8kSI+pZ+WkBgpFdwz0hOkNKXJxNMAN+8CbhO2beSNxEaFzlBHCs
	lu9Ntw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8eny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92afdda127bso629727085a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730362; x=1783335162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=;
        b=XplhjkNVWMXX21hTocfw/4u/OoerVVZ+LtjOx0zLe2h2FuJvT+lt2yZL0iskgbaJ8f
         Z6Um+jFpdc3G4fJZ0yX8zqCapoY6oLWjzoJiY12d4L1ycYOVGBgw4PjkdV+zgR4zemWA
         zl8qnX5uH+Cy2foQ1ioZlD9BrDERnelGQcQfKaVXDDBG6yCO5F6SOIvrOtztjmP1EzxK
         4IrvwXBssZICbV0S8SfFTegnEc6vejC6lg1pI9BQrEcur9ZlmEioS5EDlRJWKtwY0SuL
         fCZdwHyZcCViU88hDT+LUIyVrA+g+Dyq/Jn3/heqVXkiPvaLZVufosvPepKB4WnaULhj
         aTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730362; x=1783335162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=;
        b=AWkbKGWxaUqojekum87P57VFwE+7Sh2qvXNKG2X8A4kNs0yBhUxbckE3+AaaEo4uLw
         lzP6qlYbxTf+SBjxbnlVkSDczv87TBiFtGUacOVuYtHA25v3lCeGH4NSzeZ3P9K7w+7h
         yHqTU+dil673giTtUi3ku4lP7t2JSo84q3EypkeUFtiF2hOQSZtY8bstzOynHqK6fJST
         Iq0v+QVy+jx7GTYUiPbuFqdFXqzTVS6b4Abe80ym4Qy/d1lNjn9fifkyEmnFfH0xGXAA
         OtlQFE2sL7rG/OhhUy4jVmw89j9+pBz5M5jckoxnVBOWATcVZ8KoEf7Xqvupw1NdJbbC
         Khsg==
X-Forwarded-Encrypted: i=1; AFNElJ+434R63iLDelFfk0IluIPuS7vT1EealKD7sH9CKFvdOH6KKAQVhaB6zT5+JAEaePC0+g672psjxWlo9RSgUTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+sE3oLlhfNH3tjNvEnCantXlhXtsei1bg5mmHr5/OC1yvBMMT
	spWJ3nhhC9HKpNk5L4JkBZANTyKz6NkzHkmC8JUosZuMwqut4/DolFUeTtVS7al26MyOF8s+/LO
	BeN/ldt35wbUZX411fBOXRgL60OBxT9xHLtl7P6R58pHXWZypLN0NchYo2aD0FRFBwvI4nNY=
X-Gm-Gg: AfdE7cm1LDTsI7hp6SQKOYJ8lxvWYMGpVPMTzBSrgHiSs6b6c3BJee1r0fAhISBaj37
	gLGPopmNHOuJcsAgdHugDdOeaqAC/Z4wXF9uySRY2qZhclCbDm8zqabLbdnoF7PCQppcU+XvpCn
	+ITt7LTcfdXC2volebB6D/l4g5qcA77z9Noi9FwKHS072EI15CFn1cKlPzPbt8shAyIDSV2DTqa
	kv6+H+QyntuWNn3vC9M5KP3WKQ1MwWRt1dsrghTFPGbWyZKz+i79ZqczerzBVEKIUqUDApMBufz
	+m9btmd8pFsAlOVDXu9TAaOyfgGGuKV5svYGQLUZlEAZFvq33C9+G4ukmI8ndpFyfEFiqwcAVjH
	RAPsqqpr08lhtkVxADCt18KaVkVqsTqeI+k8Zf72M
X-Received: by 2002:a05:620a:7119:b0:92b:6805:9189 with SMTP id af79cd13be357-92b68059702mr1417909985a.65.1782730362422;
        Mon, 29 Jun 2026 03:52:42 -0700 (PDT)
X-Received: by 2002:a05:620a:7119:b0:92b:6805:9189 with SMTP id af79cd13be357-92b68059702mr1417906985a.65.1782730362062;
        Mon, 29 Jun 2026 03:52:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:09 +0200
Subject: [PATCH 4/5] MAINTAINERS: add myself as reviewer of software node
 support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-4-b90058b41839@oss.qualcomm.com>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
In-Reply-To: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYS3EqsqHNnRb2qyR1WrVdwQJM+VvU5Fqh/2g07zTc4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5vAtDrLBxJ7wJSt3inQfdwNmzPhUgJvSVzf
 KKilDv7TSaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObwAKCRAFnS7L/zaE
 w0uND/45JdiqnKMuc5wUZ7a94clqHgiv92Vw4uq+Dt6H2vT1hShus81oLf7Az0Mn1+ZcdzO5inx
 eNYRIp8fz2ZpoT/6th+odyzuaJmtXtCX9sUQefkbocFl5tiYsgqMSRh7H8IYamQSvGNDM/wLcRl
 XSiMXhYxCf5B9qprngFNBNDx906crWvX0RxaHngioNcf2iXtpnumvKq1JacaM73djmyYrQOJg2u
 Vzd17L1sffP1Uf6+nhhVWDoyuAASM37vzZC5UMYr3+K2o1cjKECYdNfh8SVC1opRBjYLtgcNA6q
 QIR0awIpCX8jjCCsrMFOOMjPhW11xf5rXIQZnqYD4PMzhZ4zEjKCXT8DwVAKvzQNlaW931kQYCI
 bpeaTs2sW0Y+XAc6and8RyHWbCV/EII+gxghO2/OJJzZct+Ms8OEvN4kECINn8jkKB8ujR9Uwf5
 QwIrOrYACLqduoHLLAwoAPGuzjZiq4fSN0p4dS/6rU2CEtgtEWzoU9wk80VW7ORKXQj4beGR+qm
 fZfGoZVLk7A2YYK4f0IfUWDEyLVSaQyMF6YDJvEAyrWEggL+2h5q1kJxeOzwOtF5HF0kGtSvgwj
 nldxL4bakgFDh4R5P9SRskUl5GvrRvUF3ZZivjIctlqsVNwF2zj7P/iFX0jPKUCgkwB/LdHLvPn
 sKj75IPRiSn3IDg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXyiURxBSqHY0w
 grqVskA+/nRT0jSptMkwoCo5pixLXagWAD2Z1FqLP0NJln91td02z7rwC9WIChwaAokgQMzjV52
 RA06U+Is4DdBqmestcXTd84SxQ4VrIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX0wc+SVldwm/z
 SLKZn474zpSI25iZHFgS/bL94y9QAQvOw2lfLc8moB/9bG5cshxoN8izhzg0MK4/OMscc4oCxqv
 FK/KCoVCAKY1LfzCrEzSYPGg4deRaGRD7LSTwu8Lx0Z8qWCsIeXiwXh2bRK2Wi+nF9rbT3UcX31
 ZQDlw4ZJb6rmkKZr3xntKh0Co5ZX7cXNzdqp1xTktc0b5yQny86phaQl2ffUOrlx582ccBtENTA
 7DkTNlZ3iHvZ51ausP0HDjyUT6TTJ9khz2tMwgLCv7WFqfhXph03U+60DObHcfZSJlUBUMgnuCZ
 qdKLupgBAvzFICHgZy+Nh05Ddso3Lckso5jL4gbh72Y9zjjytJlIabqRd0NrC8Qmh7ge02RaVFS
 Mv3G/liKKq2yIxoQ9YVd7gUWdIxbGqHG+OrYGEV4T49bFbMijs7eQpqncmz+S0Cb8cYRKT9r7xs
 ACPw54IKgmJxrbI0vzA==
X-Proofpoint-GUID: 1Ia49p2gKn-ePSgq2FZRR1xb1nTKwaVB
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a424e7b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1Ia49p2gKn-ePSgq2FZRR1xb1nTKwaVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a994cf1b354f490d6c4e411588df88..e30aa3b63eff90bc0ccc39de774986ce17494071 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25101,10 +25101,12 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c
 F:	drivers/base/swnode.c
+F:	drivers/base/test/swnode-devlink-test.c
 F:	include/linux/fwnode.h
 F:	include/linux/property.h
 

-- 
2.47.3

