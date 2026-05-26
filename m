Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0643B7B6E
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787220; cv=none; b=TtpfjwkxqE6HpCYC0hQoZKEOUFzwXvZO1zbxU/fjCLtR/FFcGiJvfz27/9aCEKaEQwYlI3OS0Q1TafqHxNA3hh9+HOxxR+HTYVd8VYs/x1yENgjMwtMw+10/OQlD4TG/xKiPXVC4fn8i3nzaUaxG7Ky4ba27o0c5Hq1gzmqLrSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787220; c=relaxed/simple;
	bh=4c8ObGZjepD1n8Jy7Xwq1DEYon7g8PLwrQ777IG2WR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJmehlokjEFqiguO7cw744ucKlvAsHaQin1CSwIYfqJdDJSv2YE5ggkFcq2jg3vfhdkMCqmBzcbQwCYWvmoWx28ixgZpnkF0LfWD6fT7RHghxESwrPvd7yFFeR988JExM5GqUclFOwgyBWGRQY6kZ9LPd9IcF7pskjJpAQnhW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0fsDNg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ugo5gAdH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0fsDNg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ugo5gAdH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q63dPZ2145970
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 09:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ru/2uchGZWEYz4N19Mo1DK66FMzqS5iB+K/ItgMs5VQ=; b=I0fsDNg2iWBV3ltn
	vEmYVGJh6X6PZVTMXQl0UKWmIrEGZU7Q3B4ZrmQm/O5au7O4UzI+qtIeIUdt0Uyp
	VBDiIIdvmR46BQGmqKd6dqFN4wSBUJ4n+4wpx/+iVVtsm+MVoAA5ddmUxGTKo1oN
	psnRZ+S5Sqipohf2hhuzV4zprqGeJWh+4IUDa+55/GCI8va8vBPiKvfr9w21MRwu
	u0/aCZwNN9U5w9HrUjDxKmqOkQ/LWZc6rla7jHmsNSYHAx+fa4Nr46DHsEOm1s7q
	Dkj6BrFbudfCwpg5Vt6a1gn2rIKykAo3bByW9eNbt6GR1d8V/akKUCPOvOermL4P
	WFLtAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv3xgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 09:20:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso26003541cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779787217; x=1780392017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ru/2uchGZWEYz4N19Mo1DK66FMzqS5iB+K/ItgMs5VQ=;
        b=Ugo5gAdHda1hKaPwd7KwOx18fCj7KIUpaymKFJX/Nlx3VVx1fU8IrhVGbIqq7lASQA
         aABC8Uw4/5gbZZRq2R1I6ls/yBTV6FsgHF2hexGGvA3aFYoZj+FXSlgcgJ1Nna+z0ugb
         DV6kLZU90MH/NG9pw7BycLP3Tm82TUgcBkvPSAWYVqqNnBxhwWj74asj9JYEfOZoDaN9
         Sb3DTQ02XLPJ/a/Nj6qhGEhf38p8OBiThkM4A1F4U/gBRAJQvFF4aDL84fTToerfiWru
         bhykgQjQ8IOSEdKAkSzCUJkgPsct09cF08IVamjcqK5Pjv/+xQJqf0idDXa3Ve2pobHm
         2u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779787217; x=1780392017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ru/2uchGZWEYz4N19Mo1DK66FMzqS5iB+K/ItgMs5VQ=;
        b=A0Aax/nmS5gC8oIDiwl+gSjceqIFwZi9X5DNG//8cGbj6yUkic/1uGDlov3g18UZaT
         2ZVq1i3dxSzBRx2VxlV0x2/Pyg4nm5encL8Rgh6nOIkI5mAy2spRzXavoeI4IIsm65vE
         Dtslbna0FOdhKiMdBneEEILTUpfsmiBIxMJUF0uGNTKOtMZx687jEzS/zEKfDBs/1yl4
         CCmNw7RCACwZLHzBtt+50QYRJoqj2nuQfnFRWU6bfmMhpJDYYtw40l91o3GedRVT8iS7
         CrgZcM7avYrgCyAJCqt+6Y6d6LrECAUjsXW/QYGbIgqAsjNWbDaiKTo7vdO1fHqpeC8T
         uT3Q==
X-Gm-Message-State: AOJu0Yw5SL+Gc2KefbzZ4ZTpdwQnHeBRnKh9dQhi1bBhN7oA/PSpJUv4
	Gqr8JTLfeYsPQ/LnmEcy9MHe+/HmpjIE/usj8HVgtqB+QLv499Ja5D3Xo9N9r7zbPEuRtUWBD5r
	wkVWoWuf3BeuQ97kBRXSXgHmhivFNtAtU4NQ5o8q6B+OOOJBGbvCm9+5b8RRznOMh8BLT0zo=
X-Gm-Gg: Acq92OG+0PsIXUC/DG3uSyTocKmYyuby1xHyL96c6pP7/w7GkVQz9+O3dSG80gV3uM2
	3tAz34M8KsxQPYHPqTjBeQjTI+VCmUvjLJ6kHyDCQRtbECAKMOo9P8dtfpXL37nLlB0T1ObSifa
	uqA0/z0fKwTA2TRszIk6NK7LTEVK4r5EYpxKL5X2Qbki91+RK/nXX3HdB3ornn/HeU+IUgie9l1
	dB/0ToKv1o/FMXODiEtIYxZfiD4+oauxAjaS/JeRSr0yRg/c+xTFIKhVr0kDDnjyWKKmns1cEHw
	eRm/9pRYJ01pyJe+YANbb6bFfJHqdf7gshzHovmmhFvEP7TgkU/+ciuMpirs6nfO/ZHWhjGH9Ov
	efX00ZW5CG7tonLF9xl2PlQD+4owI3tzdPwoWWbifABkg6GSOsA==
X-Received: by 2002:a05:622a:60f:b0:516:e0e7:6e42 with SMTP id d75a77b69052e-516e0e77392mr148426671cf.13.1779787216757;
        Tue, 26 May 2026 02:20:16 -0700 (PDT)
X-Received: by 2002:a05:622a:60f:b0:516:e0e7:6e42 with SMTP id d75a77b69052e-516e0e77392mr148426431cf.13.1779787216361;
        Tue, 26 May 2026 02:20:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm32741008f8f.20.2026.05.26.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:20:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/3] gpio: add kunit tests for GPIO core
Date: Tue, 26 May 2026 11:20:13 +0200
Message-ID: <177978721098.28605.12536912087921643875.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4MSBTYWx0ZWRfX+qTHDqj6dUWl
 CDKK61AJtRWwFzZJrl7hqEozA2QzCf6jt6VVJMwHot0Rob+xMbxFrdB7B/C/maltIEoJzb6spdL
 XEL2ra9Yf360W6ke/76bpscB4vKInvsz02IRCyve4nJdLkkFqoR6tIs/lnjrTiSF5WExxmzTJoi
 PIv3EDK+8l278QWiyN0h6RbaOTHad6PXsBeQykZRLfTNUJ95JqWGLY/65RtRlE+nuVf3NJ4BhPi
 oW0YOh42XGoPXwrn3kMGnMRnJ8bfvCFtEK7l3NfnWqBjU5i2x7v2UQkKJpPgiVE3Sya7TETf935
 qlL6w/jUguk9xr/6U1R3Dc+hn8RRn+bA5HHwYzcZHJCxMDvK4XG1kIGyNrhBtd0jBOOMmKjeDu0
 QC5mUo256tH0lk7opepohpJLKGn5YJ0lfTtFA15P4rTTBElyITxTCl6/fSTU8Zcb8f8s0uZ+VpH
 h26UK55JzeGdb2zEl7g==
X-Proofpoint-GUID: 7XSe7NENsSvUphMxUR7OIBLGwEE_2n6-
X-Proofpoint-ORIG-GUID: 7XSe7NENsSvUphMxUR7OIBLGwEE_2n6-
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a1565d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RTO6nTXuTbuEUpUxxYsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260081


On Fri, 22 May 2026 15:42:15 +0200, Bartosz Golaszewski wrote:
> This series adds a first batch of kunit tests for GPIO core. I intend to
> gradually add more coverage for functionalities that can't really be
> tested from user-space with the existing kernel selftests or libgpiod
> tests.
> 
> Merging strategy: with an Ack from kunit maintainers, this can go
> through the GPIO tree for v7.2.
> 
> [...]

Applied, thanks!

[1/3] kunit: provide kunit_platform_device_register_full()
      https://git.kernel.org/brgl/c/4c237ab773c93959aa2a7750f9dba772b5f1baee
[2/3] kunit: provide kunit_platform_device_unregister()
      https://git.kernel.org/brgl/c/136569e6bc7b2d62e6777ef47caf0a417d70bf4a
[3/3] gpio: add kunit test cases for the GPIO subsystem
      https://git.kernel.org/brgl/c/a6d2a3b403cbcbcdb3ffdb63e52ac090c1003d05

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
