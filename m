Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239C7438497
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342485; cv=none; b=W8gp3pDao8b7Vqwren0ZUKb8ght3VE1oxC3lkI1YEwqGhfoOIdRBASI24AOK3NStFeYeov3YxlOn65RGovpe56MPrEcPLMY/o4WKMbf7Kg8AWfzV5AZ5Z7N2YIz8RdMTp/c2Z0Qsv4JaH7ceNqxG+U3SDhqVUiq2+t0OtKbwN/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342485; c=relaxed/simple;
	bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7e3vqN3gBcKWnRYYEBic64bBBQV9DAKij7C0Ad8hTizvLF5ynTnxovoFg9G3xXPsRLaOr8K64Gxwll7FQQNHKNCBUbKtlDUxuszUebOMzUjOj0qLasdShiiNcYD14m4FqU7TqMK9JfLkj9FZoGnqs5411wc9IVTTQHBZrOKQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njSdUWnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYGPShAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njSdUWnw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYGPShAV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxUJl361592
	for <linux-kselftest@vger.kernel.org>; Mon, 6 Jul 2026 12:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=; b=njSdUWnwl3xuSbj5
	TlAvRuKwzHIC+phu+eifbRMk9cS7+qenMJ5P0s6paHP1ExwiBWnHF2oEDUqxatME
	llJ2EEvmKmWsVGHvduRmHzvYhRpLmyFW6Gdw/s+G1IZ7qBFumzsPMaxeLp5bu2nI
	6siQ/upDkAB6yb4WjtVNPqd1ZpFOGpXUgnB/K7+3SD68QPiTT2KfyqWumD+l+u2J
	vp1SPllXZedjBHwXYNWy5blLPAm02q8wFZ5kbP3PMBTOgUKi8WAB2BaK8aCay0Ic
	BSG4WTZnFf7l3acS6VgmCtgFJCCCW5wxsL67wDCp8cp6nPDIbT0hMby+UmyYMqRA
	dPfFPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h513p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 12:54:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91ed0e140c5so540428685a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342482; x=1783947282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=fYGPShAVeGsaNNyGhYbowedrBiKcZJYvBjiPAyXdCkHvWAP44Z32vmPtRkMuc2z8HN
         G21S08jACxx+aXhSwCNkKNIX32d5xdTxFICHN6IyO0HyCxA0KB2jbTGJi8QtPZxQxRMf
         1azoTpCNpTH+d66ijzSUjXNoMKjRPh8X+gaYUxcUzbbQPhSMqwSSXHXn9odkkT1WQlmf
         r7PkFDze3tu3LyhlgJ39oOM47hclHb9PDCVEUZaTIF23ZMkVCtEhPhoIBbGxGEXmIKtX
         +jz2KSawLHJGkppkko8iJsSV+NJKwfvutK4Bpqa6ntI2Xo4HBa9f/4fmswf3y/mJcj0g
         4ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342482; x=1783947282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=JulC0vSAhNQFSb3W5dPso1KGCCbLvigRmLXazeQPIfzymx3KQQgQ8j6QTWOC0Vu+sT
         0dotnvMIE8NjXfpsecCgTDWVO+En4urRdMaoD2nilgXPu0OzzUkOCYYeV5c+yGGldij3
         kPJ8tMZQUFSTnvQkeZShbSU9+nxAmRWM67t5CV8vK3GECU34lOPUAbbVCoriGxg3QcJU
         RE76SHGK/D7xeQis5XlhHsaD/5XArd7qztlnmPPXDg6UeHjkOuII0qZsUqFAkiNRSkZ6
         XfsOkMhEI/Az9slKSrGjZv8kdVFFU4cjOefmqSG+fDAHOReRueQF3bzqZlHFb4JJMHrs
         rvrg==
X-Forwarded-Encrypted: i=1; AHgh+RpJ0b12upH5CX2q8yS2dcJQTWtQRU7W0VoE+qycEc5cYAAjIhToFUwxItaOp2XU5uYUr8ZEAJpQ7jRVnTQNjCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJBqDXea6EubraWuSrsISO6/VPDC2HXjWMiy+k1z9HtWO08lT
	l43MzytCQEgbTEaCo6Ry0dpqoEaDaewk87HVz37oQZMqGjIPp9HTf4Zt5GTQYDsmziWtmiTY170
	ixdxAuaPcTi89XBppdIEFWNdhZ/w+f/LsoflWQA0OhC0E/Smk3i3iPZOKGvk9J5qn2C17kZk=
X-Gm-Gg: AfdE7ckcdmE7HMJ5MjZgiH0BbokdhUQnpsFb0Rsgk3oXHut5ahoykR8SNwooNv9jjx3
	Gang8sfoz+q8thx9oC6jUMjA52dwgjWlvyB0h6QmCU4RIUI70DRlMeWAK4rW6MMZeSnx0jnj9oG
	FJi0/kdY+y6FT20Cq6sF0IhlanjohEjpqfNjtUHy+Zz6450d2OPhhRAr+FTRpyahqJ4beHuJwV3
	TfSCQlJMtAD10jZnIaR8IBlpYvsiC/KJb9HwhE3+y6I6xCt+9FE5LhwGTxTCAPn2CCfmHcDh1fl
	tPpf9NW2J6adkj1n6fH+Lwmd93dSv9OuujCUQIy7wjBMikpArd6mrZmpFhSwUI8i+1EWy/JJ4xA
	zSt+p+Qdq18SyZ2UAeDMiU+Jt2Rl70CSgan6rqLEd
X-Received: by 2002:a05:620a:198b:b0:92e:5ffe:7833 with SMTP id af79cd13be357-92ebb5a2bcamr54650485a.61.1783342482383;
        Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:92e:5ffe:7833 with SMTP id af79cd13be357-92ebb5a2bcamr54648185a.61.1783342482039;
        Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:54:11 +0200
Subject: [PATCH v2 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-swnode-fw-devlink-v2-4-f39b09d50112@oss.qualcomm.com>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
In-Reply-To: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WGF3whIW+RLqDAnJl2komv2tggoOcvqqnfv
 ocHtTbK2ZeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulhgAKCRAFnS7L/zaE
 wwaIEACE9xjgYSFMqIxeccykET/8UUPaY6JmKvllSX4L/pZkWNnEIoZlQYLc4yR+N/l8RSK/H4A
 CeEsKYUFGtKROlOlbDIYNRUI+z/sod7oTEntYOQ9n5+KVIanY7BC1VhFbF9VFyIycnu6DyB+IP5
 C/s60NpJgqoNBj9N1ZYBps3/n27llPa+Q+v3iNGh6/EgEEW0tCOuOOuHapXNuAN+7O/3pH/2kc5
 UyB60g+58cc1g1T9RZg+zhQei7eyYpjWj2QUc7/nCCgSf1gnr/eV6PyvmnMPW7OBX51vPhwJl2b
 1C/voXGoOpuDkFINlJ8Z2QI7NTF2fgHfOUei/IGlzNofuaEZ3qCqmUcPFvzy1xpHCOCkiSw+QCT
 1yYZ2fnx3Yc6hyFals3+5yytxFajc2rZfz5yg4A7TMB/+XS6us7riipgSe6e2Q2izjOc7pqV/Qw
 cB3JWo4TRsKvxyxM/+Za2P799buSsRIaljMqnqXhav3/vlZwFkyVzqrq5xZ2Tvzl2gcbhfB5y6D
 u/UjA2HyqLvtPX2GuKFyupLO1ME2KOxhHybEcLSkDhhQO8qP9lwsyEG0dNSrolNwwyxfVRHwLo/
 JRubEwo2kDbojKzthKid8G9zvU9sFnV0MwLpDSZpvSxz6MbTj/v2BQg14gi9/vAP3z3sQM7DEaL
 MiNUR9F+C9IQykg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: HGEkocpsraCp762agH2-y5pzf8UAEJDb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX+xkYAjTvcpeW
 Uf9AqqTwHFhOr5kpyZxpxpTaKJR5/4oLVL7IRu5ZLN2AD74wjmHPx96OxID3pJaPJvQQSr29Zmn
 Q8eDn3KCmcLbJM+6O5vrXOO0xyLaays=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4ba592 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX+kfoBldum8UO
 NLixtQMPrGhs3SxjDBAPFIWxxxDBH1QK8Ylz9uNnuKPNxG4MSqDYREr22dXMBoJFwcNwVstqKpZ
 quikfY9QCd3Oq4L02NU2jmd4QSDfDnDeu/uvPp8aDXThQPXvba+4eaNhk8ARQ94SSbO5qYWHqjO
 mBLzuUom2meKnm5xA4rDNZ4ETJODHEw/agFLepqHHKKQT5eahMtsyFbKy2BHjK5M1D/H43zTNQv
 vmlQK5ci9/Lh49qbzAQmMOqHQoDjFky2VWwdXbcNYVdB7cdKGPo6pLCPLSS4QYqkKR7vgZDKvw1
 Lzn9Y1MCUFOfrJbV7ubcsESoonkuhm3p3ipmhNoJfry42kYPR8XFyidR+4ySWdlpYt1lJk/0ORr
 LhtWGCy0nkOJzR1cyKuWYpAIVK7Am5PMI5IwVOtNRw8AvomJCPLkWyE03KXUUPMWwuq8OBGmMHL
 EHqcFGjIvXJDc1rP5Qw==
X-Proofpoint-ORIG-GUID: HGEkocpsraCp762agH2-y5pzf8UAEJDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060130

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

