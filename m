Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F33C09EB
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589016; cv=none; b=ZlqShzrfZ5h4WrvjqPdS6ft1xWWh9j8NFqvDOU8/J5PHNWUR0TbOOA/JPmueHRRMhqn5/j1W4Pblxvq1PpegsTVOChwgE7bjwSOZThhSfwgy1fldqqCI6wGxSeNhTlfvrLQ7sahrqvl8gd0sH14P/XwvzyoMDE+/l23CiX2Jgas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589016; c=relaxed/simple;
	bh=Mpc15BTxXFPLS7siOrt94DVTxzgWbPGCx4J/ojX1QSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSepAESagvAyMqxidh35w7fWSvFRXKDkPnIWnpd2hDUVfObjBXr4agtVJbGj+prUvYUstum0pp/ajRuqk9OdpgscyF8B2yoqr/s21Y8gwvW23XtDqs9vYqFAX/O1oIFNLvk70SLrRhrDaNoTyhJJPDMXNeQqB4WOQJEsNmZjJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R57WYhlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzwKFFr/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R57WYhlK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzwKFFr/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EpcLm528640
	for <linux-kselftest@vger.kernel.org>; Thu, 4 Jun 2026 16:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8T3I1JSi6bPzTWMglkCJmeKM
	pAKkFgJd3nlCAFBxxjI=; b=R57WYhlKJl3K8bFUdl58ZqjkhTtCV46ZT5QO6j0A
	Kddjcmp6YEGcd8WIruVAt0ZMvC+hOWwkGsLEYz7Yb32W3tRSjhQMXgZc94DdG/6u
	YU3sFnnQtRqKdtqQjus9VHxy5Ee7e1r+jsPLX0pbfzq5ydcL/dpmaF0z9cdGphrJ
	/WYa44pwTb1IiQegKIZ9sqhZSST8w2Iiz/tW0BAkpcmqQsPp61iSH/YrPG4o0pxF
	PHXOOSiUGCCBEuyEbblKvDPdgi5d/iDCJwe1OMDiZjxZ7Cg1LrZfd6m3m8FpJylJ
	7poDjZlZipbJF3WIo4ECfDqr2LrUdd2XCKi/I3p96YyXYw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekbgdrbmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 16:03:33 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7e0533b7d8aso15601587b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589013; x=1781193813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=TzwKFFr/yAqAzsnz24uUZ2xYa0AKrhpiOmdwSN4zzb3G1FeWtsYG5lyd3Hsb+OUfMJ
         hIXbCczAD1Lns2anFm8HA2kw1NOKbMKhD8k8ZiQtae3PTHslV8T23VKPUMINx7dp7vHz
         xEHjxdssQfhQpGl1tNqO8daUw03uiuF9m7PHOHYH+a6h93cmIFn5fkS7phl/zWgALKnF
         vHxtgXmkFWk/A4wRHU8+ENAWZ998LoaEZbCoLcVsGM/0BLgyAKvtEUZ+dk9ko1Yw7NFF
         WTyZful/xUvQkTRB5/62Brdz2XW8eUpmTYia4q2M/1/FTRkzjcjlkB4HsIFL5caekQM7
         k2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589013; x=1781193813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=p2PkWAJtLkx339vqj30Greld9y88rabI2v8rOd+JbTCtkoIkm8jAVcYhQOdXWXIqYf
         ym+e4fvXJecL/HfCw/OTy4uRydLemaa7FrnvQyHh7Dsetek9xEAa/+owXYn+YI/hBkRW
         2trLVr0fikCc9Al6a78tpehZ52RFCd8DXySMxNtxqXiUvQMnN+bSS1m3qRg/qF1TkXNy
         /8p4WQuXlvFDTFmFhArwhVwhvoY+5ykNuiXxgsI/jryiSwIX4qVbNC5zkWk8maM7mYJF
         FgUURjJITXIF5qDQyEB1OHNX8UgjuoXATl4VxdyrxO1m00A5sGqLMjDmOHA2FGWsWtxQ
         sWyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Z4G1uFqk9Ayd8g9YT/6/bQx+UhoIvY3XdsDzPkoC4s3MZs0j5pM939S9vVnX2dwZIvqFb+h5HyqD2TSfw7Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb8aPeLIZBZGW/tmCSvmYyWpyOuEQyqZ6ahyrOcuh9uFV9hDe9
	eykvtSYDhxC47ZdEPMbb9KhblQojWy4N3HNwnZg8iv6C9NQJ6MBaJ0QUgaFtNoHlfjH7tDbhkeI
	rszvZFQjcqpahq+bsFfSprJkQCM4D4uAhkaj/nCJNvNNRkJ5G5CTdSYecKg/Lyv+eKFnI4o+/P9
	It2ZQ=
X-Gm-Gg: Acq92OHo51YCJxL5TEsdoAv/dgGf+WeBy1b3FwIZoUQpKUtYKewwe6K8MGXNeHOfIv1
	fH9ewkhft9ohcPaIDmBTnsGF8jJ6x6Fdo6dK7hkN0ZlFN0LCqKOAy9KbFHWikkKXDbIzoqtwcMz
	ismQSejruAEq1zJxSSGbqFcEww4r5iYF1tX/aiDIiM0W/rJSoSSilIWL2TSQJk7sseJXygU5xw4
	+fR6eCq9Ode9VyHshwCDGgbtWGKWDWQ8Xa0GqxJ9WoNnDUQS5SqniQskfqa1fwlCuLxRne9Y5JE
	Ptxa37dhV19H7DElHjDYvkY1W2znDkhXXlUe1cU70sWR03riP5EIM4WZCtuvdkRTvzcE0pxZ2jN
	oD+bS9aZ5igSzIoGm9jpwzK+IEf3xRGqZgF35XfE+AQ==
X-Received: by 2002:a05:690c:6312:b0:7e4:f6e4:9f4b with SMTP id 00721157ae682-7ea4b207bf7mr78696687b3.42.1780589013062;
        Thu, 04 Jun 2026 09:03:33 -0700 (PDT)
X-Received: by 2002:a05:7301:100c:b0:304:4f23:4466 with SMTP id 5a478bee46e88-3074faa488dmr4046204eec.15.1780589001468;
        Thu, 04 Jun 2026 09:03:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm6911110eec.6.2026.06.04.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:03:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:03:19 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v3 00/15] riscv: hwprobe: Expose RVA23U64 base behavior
Message-ID: <dyafwgy6wgahizpld2vfuk56nzhueh727u6vzblmasmw24vb23@uw46cc5sxpb2>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
X-Proofpoint-GUID: yHGIumSKQGv9njQb3dTz5xPGiX6p5r5L
X-Proofpoint-ORIG-GUID: yHGIumSKQGv9njQb3dTz5xPGiX6p5r5L
X-Authority-Analysis: v=2.4 cv=a8cAM0SF c=1 sm=1 tr=0 ts=6a21a1d5 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bmEhWVV90QwrJAxICpMA:9 a=CjuIK1q_8ugA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfX1TF8dRFj5Jgl
 9LDn38je4Af+/0FVxvk329vgWCyoqQBhA+qhWwtzfRQ17VEL7kuiI1YaF2Q+mQh+vUgvQSWDxEm
 7kWofWqvJrQ39Ufms37T4A5VYR22U+A+P5oUZVaNSjbZ7H26rKk/5LqYMH3bglidueQHyFVTcG8
 WnjUFqGTfTMl8kGNKasvmuN0aQPa2H4bjuf7XnXoiPUvgl3ub0GG04x9ZSOxcpHCNRRJq1/s5SP
 4OPLIxCK0Qt0x2w7HJdlPHk0pKceAW/SL4Yopyks4HXbimi9Aq/PyVATGDsuORcOIEVubVV0EZn
 WuHhbcANYuH06UHzKqrXtzRgR47ohpcIVjcVztLZ7IXZXuuFCBfKpQvp2ZzorHHBYeoE1aHSj2G
 w/LMvh3WLMN70ykO/pfad6ksgXBY3ddC2zEzrtWLF0myP/IRMe9BswegkTAzCUnMvbGihTrGRhe
 VEVHcve/jPxMuQwEejQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040157

On Wed, Jun 03, 2026 at 07:11:55AM -0400, Guodong Xu wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets
> userspace check for RVA23U64 conformance in one call, instead of
> walking hwprobe + prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class
> bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
> init time, and surfaces the result through both /proc/cpuinfo and
> hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
> detection, to riscv_set_isa_bases() without changes to the
> surrounding code.
>

Hi Guodong,

The series looks good to me. Thanks a lot for picking up this work!

drew
