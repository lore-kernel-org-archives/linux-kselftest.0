Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751753AEF52
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183307; cv=none; b=X+ml9Bh48jEEK9VPkYYmYanfPQ2+rrTHxzzP6E7H1wdbmbQplMgk2dgoAfsB4jYeub5L6GpK7lP0sLXC0sqNr6fKruTBRvzWtWhCzSWSw9lkCUljtyuf6UFDM571o7DxwW29gx+FHpDzHl+QabvL+/nfmWMb8lEPiTyfTEc1+2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183307; c=relaxed/simple;
	bh=W9/tXbEVoeAbP9JhfEWWy3bLCtLX+Rg3EEuAgwan1bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npO0TfRq6aCqrYz3gsJbgQIPKEMrxq+sMtLzkQqVNn54JTLSKNlgWzmIZ5iu9C8uPNx79R/KU3MIKxCG2pNcbK/zi0q07ql+ElfldBvDL9xcZ+cEC0lsKH2l873bGfzD9lTl9Mo0FHt0uTd9axCBsgihPkpJRHyfprc7tEeV2fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpgZYGqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAAcv86F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpgZYGqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAAcv86F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2Jx5C2353259
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 09:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BI/2H9TQIECKYL2ep32z+bto+nxJK1Q/PShkz7EB0tc=; b=gpgZYGqyQUvGPUVl
	UHS1Sn184coDGXc9wOvzyBrO1gZ64IMuQYFROLduZNClMBx0iGySVvBV9App0w8K
	5doKdprpItp1eVVQgmT6paT1oiR/fIL/LO+2XkoIWY+5+j/bov70LqFIoFBn5dtc
	g7YZ87Bc2pcNtSU0NOqtahsMdO8ZEIzq00SFjO0QjQuI+nseuHH9mpFZ33BmUmDX
	Wdtq6yekWtCRGxTTQDmau9QPAKEKCpBYqO4Nn0SrVyzXEWXj5/aiFKYGnsZb9YRh
	+6nGv51ewMto5+oB9S2oaoPeHfaESE+XecBetlkUp0HFeT6yKWFlKP5xmn7iVopw
	FdL/SA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u4360-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 09:08:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so1342081285a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 01:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772183305; x=1772788105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI/2H9TQIECKYL2ep32z+bto+nxJK1Q/PShkz7EB0tc=;
        b=dAAcv86FyBXWmv5CbDeEr1a9BISZx3j1npZ2Uir11G+Zk54FxGQd8tBaxt8x4Rx55s
         +CHGNwrYV5Rqt28Ibx3eNiUR6aWd/ZGultPQSO0DDpEfEw3L/VTWFEam+s4yPbY0m+Ab
         87szi7ZBdbagCI0vRg6qDxqt3FUIcVum0HfwFXw2WPSP2n0O1eaiiaD+2UdnJ05mCbo1
         anLiHDOAjG5vjC3YmekA3wmTX5wGv8DSQXt6giJg6iV/lXI0aqC8YXNjbKe4nTgkqT0Z
         ADC5OtX5obA96MtbI0He3wJcLZMSj1iZUXdAdAl0zGvFLwEkerq3QIubpl6TCQMDqfI/
         +Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772183305; x=1772788105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BI/2H9TQIECKYL2ep32z+bto+nxJK1Q/PShkz7EB0tc=;
        b=uFNnvHmZWmMx/kgq1K5beWQcwpeGJt2MFFzZu+fak//9Prj4mkvtPWHV6nZnmapaHf
         U9H+X1IDbPadpM/eRxJts/33XNhKGVMK2azUi0GkAQZlFnGG1rHQuN15Fp9elmME0hqy
         ZXyCD304PE8SF+7/ZAc1+GUVxAausISFoU8aAP6nFlSyDgyXdEr8cJPTlTbUBjbMVakI
         gJZlyEzYo2r7ixu0ArZmuxLZS013vN9LEnglFKaHjOQawI7MREXt4E7lP30gjBtI9GyN
         k+neuu30W09E0xFRYJ4c6CR5azysUOJzcbgjyclP1rjDzzWdfHQgOFNTABZcQbxTMCNV
         IOkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIK38BpP5hfQn9V30zzKTviLlJgbyvQ5MN7Eiaeijmbq+Vmays+BFaQwNk5CfYmjBE4PPlT3EXTK3Nej5JRwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPPU3rpzIsOBap6iiUH/JjaAwgsHeDlcsh46PmjwelgwaeIELT
	Hh5s0zQLPDutgHDK92uaOthVZTWSwuIcmnq3coje3fmjcWhCI/hxtzqj6QLCvAWW7fOd3DauX56
	3wcszliAnOyeQyIkhJ8y9gGNH+LOrv0bVMgUOgaE1dCTkUPA/uYyCrA8zkoECtmlD8U9pirM=
X-Gm-Gg: ATEYQzwhmseu0rbDOzfn3HTmotuJLCuKPe2GdJkydNiM+c2oxFyTLT2ylt1N0P6w6/2
	k9sBZecs8v0MHDehdcHqryaAjsGUgaIVCMpS2fwQ+XeoeUpMnFTHOtFvy98YNQ21x8YiDG+0yp2
	lh+/Qhx+qPBn6eV26RVkNpdlC6Qt4dLHHSbXXADRkQ6lYYbsJjG21lGNdqyMRxBzhikde0/pqfR
	3IEGsogmr1oAws3c/e7/xrrwrGrTMQhsb8cmGGvaXrzsssSHIOF/zKh9q448q2HKU7Qj6BWzMie
	iUCEsIt4s2S39X7kbj3hncMpn0OgEk6/8ZmOo9yA/b1G5OgzDN8vNv9kn1GWKdiN/lDs5eztQqI
	zrmR4LWuCNb5ZlxiEJIGD5TQya+gtkjk9JR5SAiFsqlMxp7DXlzU=
X-Received: by 2002:a05:620a:29cd:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cbc8d83748mr257619185a.3.1772183304696;
        Fri, 27 Feb 2026 01:08:24 -0800 (PST)
X-Received: by 2002:a05:620a:29cd:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cbc8d83748mr257617385a.3.1772183304230;
        Fri, 27 Feb 2026 01:08:24 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8bcf:177b:d085:ed57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c763e78sm5640945f8f.26.2026.02.27.01.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:08:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/6] gpio: Refactor and add selftest
Date: Fri, 27 Feb 2026 10:08:20 +0100
Message-ID: <177218313070.8853.10933850528918669165.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
References: <20260223061726.82161-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3OCBTYWx0ZWRfX98rZN+gD8E2u
 CnpLj2ECneLLe/NddgILPHilRVQDOBU6z2+4Q8snNzF6G5Op7eii3qFqbgGN5IF57r8C/rwQJ3o
 c1Zb96JWg/CWgu+R41G3Lq2b/j0pbKW/Z3JdP+BWXOHaLvqTwK+CNn3sh5K/bGLdORrTaxgV601
 exXLzgGg9pDLuOXnEAT2g2Av+N5HFZLO7l53zjB+nl7tY5hKeRuI/tvgF3DIL1dWC3fd5OzA9pL
 a15z6TloUkc0sMs+u622Csx0Ul/aQUfzv0X7KiK/L+bRTP+opDceibeLDM4D5oPY9ZunrDwuSnr
 2WdNtQgqPBo2bxE5nM2BLkRKLgnlPJtoGLlwNMKDx3BIdwQ7AIF7I8QmiQoZ1g9AZHpkbvPB5SE
 oKLoSGGrl0EVOG6+M2u93c2z5Q5XPTqapmcO4j3ZdSDdKUw5pY2RM6lcCCLfo7xKOyEM4aZ00o3
 1SEA9BGfLCGJcqBNq3A==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a15f09 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JFjPEo_ycDqruw3l6ScA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bng7-C322BNopW0JLK6fuuxSR8XtebF0
X-Proofpoint-GUID: bng7-C322BNopW0JLK6fuuxSR8XtebF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270078


On Mon, 23 Feb 2026 14:17:20 +0800, Tzung-Bi Shih wrote:
> The series is separated from v3 to lessen the burden on the subsequent
> revocable work per suggestion in
> https://lore.kernel.org/all/CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com/.
> 
> The series is based on v7.0-rc1 and applies after
> https://lore.kernel.org/all/20260205092840.2574840-1-tzungbi@kernel.org.
> 
> [...]

Applied, thanks!

[1/6] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
      https://git.kernel.org/brgl/c/cc11f4ef666fbca02c8a2f11d0184d57e6b75579
[2/6] gpio: Remove redundant check for struct gpio_chip
      https://git.kernel.org/brgl/c/049f71131734c47a6aaca2472273aef2cd17a6d8
[3/6] gpio: sysfs: Remove redundant check for struct gpio_chip
      https://git.kernel.org/brgl/c/395b8e555dfcbab6b28f360e39bd048b2f3e362b
[4/6] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
      https://git.kernel.org/brgl/c/cf674f1a0c9893ee1acef832679562007a94250a
[5/6] gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
      https://git.kernel.org/brgl/c/ee68f18d1f0d943d93070eb8cb05598b8b7f0922
[6/6] selftests: gpio: Add gpio-cdev-uaf tests
      https://git.kernel.org/brgl/c/c7f92042d3f3d4f084794f5314fa10366084179c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
