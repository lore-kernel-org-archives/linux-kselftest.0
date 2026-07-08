Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60B93E0256
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496777; cv=none; b=um79+EBkD/lQ5nARuW7QLmEnIkkslKNqa56YU1wNmPJMS4Civ3AmuxkzXkhYzluVZwNK0sBIz+ZjqboeLBWMW4vWjpqSZkyijt+zGob9i01O0h9VUgkql9YPJeKU/994N6aY2AUmA+bCnq2BgadDTkaMIoj273bPW7DMJzJMIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496777; c=relaxed/simple;
	bh=VImDP7yvX4cjKuVDl7PwWUTHbpr+bQEFR66LJVX8tC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDuoHVJK/EszitGMHkuGNJhRQlm7tXuQ9WrRg+Hr3KMua+e+ivjrTCXIY8/lQV/fxccpD/HFaIpyzCRAc52OQMjeMxHGUtDXI4D9YCiqe9wR+KiKnSQXTJbH/xqQ9uWIahd0EnorHTALkJBq5761ftIVJJko553xykDIrWNbTuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=en4b0veg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dV0rhN0K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="en4b0veg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dV0rhN0K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842atd1667884
	for <linux-kselftest@vger.kernel.org>; Wed, 8 Jul 2026 07:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ms80Nx4uNUP6/6LdRJl/Ke38PLjN2iBp215HZExUgfw=; b=en4b0veg/HgMMi3o
	hTXBJ4iypPUpDf0PlS6lMzwE9RrANa0r7+6Qj0K2KpjEP1nDhpDxrNaYULO2qlK2
	wTxzGy4FibKpPykGzULVNDQ9kmAQaKkR6wd39x/5JqfxHIyZayVvI2jCYC8EcYQp
	smyJ7+ippFbN21BCJQA3UtfLNMtJSTRQ2fg3aDN6P5ltxvSK9XKYnZ8nLHzZCrFx
	tRX1FwHP4LQimLBJP/zRv85Dd/ro/KpfcEymtolHOPIJsgBj6sSnCYBiBZJkGA7c
	uvIVmSdG4J98ZOdTqiHTueWFgOMJETGCtV4W7tfC+gAZecYjqzrPAEi5+FQl9bE8
	Siqc2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5ub0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 07:46:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8c689b5fso3876111cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 00:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783496763; x=1784101563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ms80Nx4uNUP6/6LdRJl/Ke38PLjN2iBp215HZExUgfw=;
        b=dV0rhN0KW7oV3EnthNU3a+o9DYVJcVpBwwFSA8HdKFmE7s1BKc+nDNbVZs1E+BCXtH
         YxZZwY72EEWuG3if19j/WsydIySZfpPPxiwJCxf86TV6uuzIhM9pIlUVvSM+8Isgk/8Y
         RYMYxdZN6DBLcCEFem3ePLnZOKRwipFILeWIZ7Xv4jhjSbdJF85dHZXTrdAtW1sEnFMi
         qmSGBRE8GPcyYXx3+nU88LPtwUxVYdcsmyYbg2kmm+jc2bTgJsEbBsiA5by8U1M1SvcW
         UzJT9zLosAQp/MbK/uxvI8B+pujal3a+8Ze1FXTcFwfrBq/e0quwZxAQaYDGWfidcyxu
         eVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496763; x=1784101563;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ms80Nx4uNUP6/6LdRJl/Ke38PLjN2iBp215HZExUgfw=;
        b=e9ndbPe8q08PQn+S/sSIgTR7Mq1UgN6rjhC3RuvetLE78IgFrrbreYRN2cN906RLJD
         hIbBYRnI4j7bzDfMWxPy1K3j/isevFOMgsZReSA/fiQQMp9CcbIbx96ZvEG1TW1e1EsN
         aCA7oExI3PqVyuXhGI8wPuPvOWQfsuABdEXB09BsqckVxsmGoZ0sZFfrStOGuc/HBKx/
         zLTkcOPoempWnD3rn/muRXFAAv8B0i10L9/NBtad25jcCRI/KhioJzVi+7MbOgcyD+Ya
         sEneUPqi/1PhhjDBjCYO8HU6nJlLIajYqk7WG+yYKmppHZ7u8T0dSMXf2V5htO9LYScE
         8MMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhYXBp7RiTQKisV3r+ODVDX0eGvK8FfmiOU1ONE7uWm62kWqOFHaoCqgahC4KP4tE1oeRXwx5nN5MKo7tIUTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmCWuSSCPloOklIYtgWkxzIe+K9kRv9iy2KxccNl72cfII+juV
	DWaNue607eTgFUlCIix2gDAdtjchT8awUD9sHhJl6TNJgePza0SZp1wFU+Urahym6Yfs4sTGEO4
	JVH3NKMLTs8MT3NYYouDolv91CSRVoM2jZJMmdMg4uTAyypVLjmW5gxxCYdsyhNaQ4UD3uhM=
X-Gm-Gg: AfdE7clIAtB98/ZG5kPijiKn+e82vx7ITptQ3hVTO+OUWM1AOCAUmpeTOr3F9PsZEvS
	GKBQhAY1oks7PNwRfMV9ztSZrjDJ9D596IHOauL43JhOtMops4QSxaF6oJcY4T0q9fx7lxSXPLh
	JS/2D8RuGn8ESXqY3bDXgsPEiul8hneTSqQj6hWlJ1giTj+pug2uH/DLEiBJfpl97YUNcwLtz1p
	sWbleuem5vAQ0FO2IQDkiuFfxg2Mo4SS99pOCfC7Jav4LcYDwhGX2ODopbQ/Z8KjzQesgA/8qxG
	zhrrvHykeBdSPD1RV7fIt3t1OgWq7ulXUhxnUs6FUb/aMOzp9KSK75YbeHvsmfbfBwf2M4sLs4r
	vTjVBV/h6pldHX4v9bVzwlw9NQc8VTveZMt1ZgQ==
X-Received: by 2002:a05:622a:1819:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-51c8b4d60a6mr14014121cf.42.1783496762955;
        Wed, 08 Jul 2026 00:46:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1819:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-51c8b4d60a6mr14013971cf.42.1783496762505;
        Wed, 08 Jul 2026 00:46:02 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6d02:5f1c:554:8e46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm106596135e9.4.2026.07.08.00.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:46:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Cihan Karadag <cihan.cihan@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shuah Khan <shuah@kernel.org>, Bamvor Jian Zhang <bamv2005@gmail.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: gpio: add gpio-cdev-uaf to .gitignore
Date: Wed,  8 Jul 2026 09:46:00 +0200
Message-ID: <178349675024.4592.9940096887390171016.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707235707.1349969-1-cihan.cihan@gmail.com>
References: <20260707235707.1349969-1-cihan.cihan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E2er2ny5WRvif76IoLgPmoJkTWXslF8C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MyBTYWx0ZWRfXxZgPdE3WrTUW
 P6FoqLDYkScVcFcZC+mRfuPASWSGm6BD5QrJG4r8c9Z0xl1KKD15lM62olFw5MQa6/Uhl2AFIzD
 XdUwz7f9gLdTLjxiAoGUA7GbkSKnSJs=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e003b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ULS_bruEoBdKV6tKf0IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: E2er2ny5WRvif76IoLgPmoJkTWXslF8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MyBTYWx0ZWRfX2xP4quChDyRT
 6gnZS0DcFl21QzKp62FT9Ol7CqfWWa+r6AuKe/Xchuo4e1k0iaycnfXr6mUe6mdY+3fP0jk7mTS
 we8pcm+e4PwS55oidAK4OJmo6ACn1Px667z/Mbb5zkXRGD9qBYhJL3hAEWjmPR06YqBfDXfteJO
 rSlxGAsB5YbC0JP+0lexkd3MvprsYUjGMwJPEjVby8ATnhlUaoT8dkdY2gWUkIit43O5HP5LY+g
 Y/LkzU4RGTEJczjCzBc3ac+Lz83BPErGZ/AervXWvgGVZYLc7yxKnjYLlNx5/3M7b1+GR2A51V1
 UzLw3nwATLTYEkxf5X7UyUIJPZcoZvgVbeQT487HGLiqbZnJ2F/hx9t/mx865vUUmEgpWq5clur
 xylr5MuzXU4BjsAB3tmHHWlCcCOCeMUdvTrX8B6aP99jDlfOJRbXfLomatbPcjpweoQzTBIm57f
 goXp7QN5U0cIu19DQBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080073


On Tue, 07 Jul 2026 17:57:05 -0600, Cihan Karadag wrote:
> Commit c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests") added
> the gpio-cdev-uaf binary to TEST_GEN_PROGS_EXTENDED but never added it
> to .gitignore. Building it with:
> 
>     make -C tools/testing/selftests/gpio TARGETS=gpio
> 
> leaves gpio-cdev-uaf as an untracked file.
> 
> [...]

Applied, thanks!

[1/1] selftests: gpio: add gpio-cdev-uaf to .gitignore
      https://git.kernel.org/brgl/c/4ad805f0e41acf56ac54855c666d34c59ad66fe7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
