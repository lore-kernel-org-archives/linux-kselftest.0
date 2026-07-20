Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0753E6383
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542513; cv=none; b=ZniXR++Fr0cEv3QegcwfYIp2OvAcfsnGLLu1dbtPzXUbVuVOEIA1T6pwOO/hVfT4fzAbTGaKxg41sTokNAxP6UKKFHDtXi1YqLYWwvHRpHB2lMxBdu0PlblNkBNqCQ5JRar5bQGUTWnCTQcFrXV45tZz+OM9v2TTcsMrZVuG3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542513; c=relaxed/simple;
	bh=cC/zmMj2BA27d70adCp6TV40MLwiZxOrTLBi3TyZkwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJPFyfe6Gdx/IgafRqaoRlSZfajPJdUQ4q+SDfJRmadqMiPChrFWDwl2UIUA/tUBoUnmTqHknDK/+AR0AHvKncgfITkaUJh8Rfgt18XYI28gt1lGpIaSYDxINJm/wKAOu5iNhPBdvGNiHR8FmAO7LEAW+b1m+eqIPGL57P2xB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWl9FDtf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrYBx3o4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWl9FDtf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrYBx3o4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vjk02238930
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 10:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=; b=AWl9FDtf4RJfvsGB
	B6mMGlEfvfkSHq6Cl+zOJjAKBvI4RhtELriKuJbrET8doA+hDgBqPRAlsQ4NPTbu
	K0br4iwyMFC/lo60DOsrDmq9V9YyfiJK5V40oXj5rNExPWK/DNAQ5XF1l6KdDjmR
	xt/Yn6wugVy9hd+KHlIc11ibCH2OoXXEz2pZQ/5cTbs5L1vSMSA5bO+9aJTmkX7O
	aVg+wNy60ysq/Dez8ApklyY5O1GrCF4thpz0UbsRhexVneJwBRMMRt+p2relHPbX
	0EIKolYqFoEw4YY4Q4Mz7g9vawLiGGsf4ZS+LYYDxPw89UE5uem1UxtHYzbEJL5U
	lXi0PA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre89g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 10:14:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so264883301cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784542498; x=1785147298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=;
        b=jrYBx3o4MxQvPMpE8UzqD8kRA6H/DzItWThJO4NOpfPXotOrWOWTBdPAelxIILEezC
         s5rLOccGbleSCUvwAxO5qmTaXlRzNnBPhSo80ZsMhM1PnZ8ay1g9/TDSWRy+Xhh7DVWS
         /c0AYmMbLhrKBSkM84AUKDtoRqkzxft9ZMQbdNzfdtvk5cCnDN5/yXNFWygTUy4meVfs
         thDQTEY4MCZQNo0zG+VWVZ2/aOCL+LwWEgzOVKhyOdKQ1450deUdLIcFJvup7Vwnl4Hn
         7PJB6WmjSvedFPEZRVuy7iUj8ptz0Ni+LuJUUB5AKRvTQAr20564E9K4iy7Ht925Wl5/
         F12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542498; x=1785147298;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=;
        b=FwN2r5uNKeTi1zsMSprY6Tplpb+ummWRRpSEYr7/GiTiTL8Hh/51Bh5cWxuREWDibu
         fgi+widsqZDXZLQSAMQW0v/qf0dGBPkoLZaHKtwSiq0CNoCJddRDpd2DMgaBIV617LL0
         LWMdjYe7XyHEwiEM/g1fmOFKcT2LNSmjatntIZASgpfEjXrfoRA8ILEvILZfnMteL4tg
         QIkEpqWaaBm6aCGgA5BD3ULu+K7wFkxHcJv+OqooOmAIvccQD3rj2Yl89YvZbY9i4qaF
         EDrMZrZ14FIafKuprUM2OqLftkEM74J/Jdc40SFeSTIwlU00TBOfQP5GLGJHBs5xwgRI
         TPqg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4FaTC9PQAHtYnFgZVfssDrxsXgjIT+X8IztPf/dWNZRATTd4tCXe6FhIJjvXC0ib8jgJ05XFvHdAtMf3WAew=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvemDpQH5cAyq+PhBg4bKRCdDnyYoABC2AQuOxYTdwmpPXvyW
	8CQGeuY+kOqzXJS31x6kv6HPvQXSn7aLoMTDU9UmK0o/PbPwi7itJ6UvMhrxE52guvwEhA/FxPv
	u6KZVEpBh23T3fspzmyU5/WilGCfXC11fTLbhucnJ7dU8QCCG1yT4Cd65GJV8tB3KyPqwZ2M=
X-Gm-Gg: AfdE7ckf7v+fVChZP8iDCDDZIuniKPpvsDbgQRqWyjQIEwM7nbmr1qpIENVhIEn3T4J
	8eCuCjeXxDTrIYC2ISxzQNq22lf0eP4YLQew50XFZXGDOa9ueVkoknryI0bYZ3kGcBRZfHT5U1N
	3eO7X+J819jpbTV/EMyLkkunPM/LToUUzWNNrA6xNc4hkYfJ7XnyaGGeM+EMjiDaJFcdTcpw2ZZ
	MV+ZVPdV+0SkhIRUyCO6xijRQ2cuGoY/cIAS/mVUSn7Uh9iEs1Ppj9kB0mESZu9ydkTYZF/oI+U
	CFH+A8zJZizAc1v5bJG7cfOvvFc9AKlT0i3rVDOobaW13gX4r50aouKumx+h9xluP86Ald+0Y4y
	5EXFCu0MCAIAKLaLc43Jhn5ryfpnv
X-Received: by 2002:ac8:5845:0:b0:51c:c67:2042 with SMTP id d75a77b69052e-5213e77d7a2mr130027761cf.53.1784542498151;
        Mon, 20 Jul 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:51c:c67:2042 with SMTP id d75a77b69052e-5213e77d7a2mr130027431cf.53.1784542497790;
        Mon, 20 Jul 2026 03:14:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6fa848fcsm18620675f8f.0.2026.07.20.03.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:14:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5] gpio: kunit: add test cases verifying swnode devlink support
Date: Mon, 20 Jul 2026 12:14:53 +0200
Message-ID: <178454248867.23896.4781577626735793708.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com>
References: <20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNCBTYWx0ZWRfX01sRXGxqyIcM
 +f52QYBIw2siIhOgYIDMnIBx6V5iEHxTmE+ZstPnCttVLWgziFYmJReotbaANHoGExauFHtNu90
 DRYKQXI47h7wzMj7M7xqdSobv+bKVhI=
X-Proofpoint-GUID: 2Nc7I-WpLVSWg6cuLKk49JbbKu4uzcdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNCBTYWx0ZWRfXxpa/N+dvVncH
 ofxDlc4ry5M55qKr25Mv05JVT6ufn2Z5Gn/5aELSEEneluevQP4hX4m1BtgdlKqBJA4Oenzwid2
 GXfyqaSQ8ydDNKj+C6Ku7FeAel1dvVhAB1tZ5XHcQg1WQSFYKUz1tOWUCvsOjUCMQOb8zeNEtRA
 o2j4Q4jJnxY9ERK9gPKvnbfbYOC8UoN65aWUzAlausqFfdMKRhoVqHXI8oKXwu/Xt69/DNTYEMk
 Pq/UCwmvoZLPzg7eV+zIs8SfSlrSH/aG+Simzoqn1AEKpz23YL/SdAPwfqxjzc6batkVx+ez4UA
 97ntGKzl3Dbg6xoKJ/a8jSaSUPJCE4gx0MDEaUTcObjDc+6nVNkCqVr9B4UkhNb08o+ml4yGYyx
 vRT1IXg9OB2TnTwE/wY3OVPLXtXbmcZQ8BVHsSasWCO1g2SUsbik1TsVDLF5ylRdc7h39Mrldyv
 6VPNp02mlIyFZFRrVeA==
X-Proofpoint-ORIG-GUID: 2Nc7I-WpLVSWg6cuLKk49JbbKu4uzcdx
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5df522 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=N-8F-g_hktDZAXegwvoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200114


On Mon, 20 Jul 2026 10:15:31 +0200, Bartosz Golaszewski wrote:
> The software node fw_devlink support already has its own kunit suite, but
> that verifies the fwnode links in isolation. Add GPIO tests that prove
> the ordering works in a real-life use-case: a GPIO consumer that
> references its provider via a software node.
> 
> The first suite registers the provider's software node, adds the consumer
> device first and checks that fw_devlink defers its probe until the
> provider has been added and bound. The second covers the fallback:
> with the provider's software node not yet registered no supplier link is
> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
> and the consumer only binds once the provider shows up.
> 
> [...]

Applied, thanks!

[1/1] gpio: kunit: add test cases verifying swnode devlink support
      https://git.kernel.org/brgl/c/9672edf75bc7ba3fb5b7d529936548de38b5908e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
