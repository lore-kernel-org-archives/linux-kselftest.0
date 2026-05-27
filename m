Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A13254BB
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896720; cv=none; b=dec4nOIwnYVSuhVrZQTvU4j1bkpCCE+MOFrqHwdPZe4ujEwHObvxnk8M4hPIW7fg1t3PsWwPllH1N8R04Qj5oZ3xaFV3UkiXdE04mH4TYX+r281ir+FGXQEcG0Ex5Pr7xw/k8gdMVl6kmcSao9YhvmPW3yG+d3iI3iAjtQNGMj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896720; c=relaxed/simple;
	bh=UyFTo/w2M+a3Jns1IeE99BbPeqspH1jAjfYFH0sjf30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ8p5CkexpCEvcGq9Eo4sY4NyWr2Tie8kB+AY/ekduY52sgTMtwFBd+Yr2eDqRy5XHcPnTbHkKTpRVYuNzg6VjPS6amaCvsE/FYRz8mbVPcQmUviPOYEVAipJQqV8krpS61QqEX3DRpxN0dlVhaFFizOY24MWPzRwNtZG5faC5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+rfGcjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SljQj2iz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+rfGcjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SljQj2iz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R9qxdQ195638
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 15:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/CAOuwABW/NK0zT7PazBOrFx
	nm1aaFtR/UaMUOazE7M=; b=f+rfGcjE/MvH8t9xNntcx8C7P7IfG8DTuuzgOCkH
	I03Q5Zuf9XBmluzJN21mXjtcHKeV4X/vCJ4vtrVNrWGyM4cRmgh9TaiCWe8k12wo
	Nd5MgZXlVqSNdPFv4JsuNagnvvFVzQ/E/rvrUi4DBIjTmxcypxpNYzh58HzrBIYM
	fmEOpQLZrSu539xc6h04TM3o1gCIynTdm9VIDMhsVF+IDHUKfSGyI742Cz/NuXdn
	35oMa9wu0ZiBanVUadE7rybAeSH11Zk0syW1sSSnqG4nnn5YJ4MI2lOrQN+kJysD
	9ly/U640HIBbNkuJK5lHjNMZs5hcVZAIZO+Xx9ikyEEp6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxce9asb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 15:45:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso13444222eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779896718; x=1780501518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CAOuwABW/NK0zT7PazBOrFxnm1aaFtR/UaMUOazE7M=;
        b=SljQj2izyTaBNEiumgCOrIHoK5WSnK3JLVjvChwrwnd5VqVX7WehpIbqmJw9BCTHL4
         j/DtUigHlJv5b+apa3YPZvQ4lnEspDxOA5jdfnRR+ejtB9Q+3HNnDV1HpLWQgKW9tC/D
         OawLVf+Ic0anSJpUvE0cjkgIfgq9AF50mFE6vus4khElhFoWbbqER5vNgRJUcL7pc1Ay
         zZwxHJZ6g9fCAYZBaGtt3JrXGjfJCQ14YScdbM9VflzUgewrivrvgRQzkLualu1zPGD2
         E0lCQ2qChNw8yUY5xAfwPpfPTiNhLsDrjrLshLldzL7Kc+44TqxzLL7jMkTB6TuPjOgh
         6T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896718; x=1780501518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CAOuwABW/NK0zT7PazBOrFxnm1aaFtR/UaMUOazE7M=;
        b=l7eX2sjPMMl3CxWELOlIie3FnT6Y/7+bGgqtwtyrbkHV4hKKvATR1H5cmwFJvOAUM9
         cR9ivuST3FBLyU1bulM+h5zx5XlGGeXGP0CUXdO6dA+DuqeHcwsc0SZ7ZpdKHDu+XZYF
         cjklia6SgzlWUVa05VyHB23rr64dDqpF2N/KeaYtDZI/fhMGj2DrLjBPwaF5QhsSIWw1
         NEY8c4+8OHzY9xrmLQTvsmpchyq7RlNeo27VutBDjITyikmKAftkGOktME3JPeoM0EuA
         5caCr0G1w8eYO8LhEX8bwiFQV+qVKUGuZ3jcmhsg56S+Qm0tQ7cU0sqv3GNosQflOITl
         lWdA==
X-Forwarded-Encrypted: i=1; AFNElJ9wrst8ziEovbhUza17Rt+/SOw56EdQOGhnAq+UYizLa6ifs/IfMRIsHewabZrl4PU/M6cyxmR+kCbQ6hv0RXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVs7Zg6FwK9N6sBNdPdKTPCBIVPbNXqDuqFtqaVItdVuHAtGx
	CfdhA+zuQWfKjgVLDww54DKjgix/WK1I03+E/+PXsLTmoXgy6C0ypEcI5Bbf/McaOdwaOIib1UB
	hG3MvySjvFkxYp62AY6fzh0LGexOS5f6ubUgCdVPwPXRElUsZ3U6ehmizh+G+fnnqgrzhF8E=
X-Gm-Gg: Acq92OGQ1Hkb86EiNXiP31s2qvN5RkbhU9VWU6JOpeOKRfzb6LSZAnZPlvcJzxrddCI
	SGGp2g0wl10mvXfz/C+fHU3eXYwCxyhI/MfSN2EOia1SvAYPfB27zkqS7tZb2tzlbgjy/yrAjtc
	GU0YrfNJVc24HHpbIPVm8fzAIjrbEx2vy1S4To2r3x8cA5PREsqDeervkKeY8aajebuTvTOqOV0
	vAtv2tJN5HqTjljKGfcTyQfCKxweJUHcV6g7P73JpjxmiwoLRM/J13Zp/DFdx9sGnuSwksCgFR8
	a0InZ6RbMrGcFE4F1VIoLw6v7JitL1YS8KZq5UuPlLpHzCSp8X8/6BaN0dYwflpyf6ZCcFd9Cu4
	buSKUaWEOvLMbrYJlbOLok3wxtS6utgU=
X-Received: by 2002:a05:693c:65c7:b0:304:562c:2338 with SMTP id 5a478bee46e88-304562c3085mr5987644eec.14.1779896717842;
        Wed, 27 May 2026 08:45:17 -0700 (PDT)
X-Received: by 2002:a05:693c:65c7:b0:304:562c:2338 with SMTP id 5a478bee46e88-304562c3085mr5987616eec.14.1779896717248;
        Wed, 27 May 2026 08:45:17 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4af0sm13044572eec.3.2026.05.27.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:45:16 -0700 (PDT)
Date: Wed, 27 May 2026 10:45:15 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 02/10] riscv: hwprobe.rst: Replace tabs with spaces
Message-ID: <4otlnil7qj53dzlbvu2wd3gvzzgs5cszo3merkcb2qbbiudw5n@4i2k47coybf4>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
X-Proofpoint-ORIG-GUID: 4YhQY3nEIIqJXffgpjU3acaPrVxHN017
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1NyBTYWx0ZWRfX/ckogIOmNuoX
 4Qgnkjbt88le5YS2cnrGKp36WpfDr7S9Lh6pw6ivjXHZqUvTExnR4Jg6TkMnwOElOaUkRcLiAGX
 d7Q8yCb3rfW+AjYEi+PRJDkinMVqBcB9IItZPjjN+FZQ/3fQWBPdpF1b/RY+s8pVERJMekWBdz+
 noGJd7j2LRXrwDhlYVpBZypJkzbcsxotBHRKv5DSNEhYc7XP/1QYVa351IgZe/uFkIkQQbI7cnt
 FLzaG0gW3KxbDEPgqjz3y3RHD9QW+9/M/n1yoreRloeJAWtPCCkSlwB0PlYf5tBKuT4a9vUPM2z
 Q/hTvLKaUEoSSIVpiT9QUWCfJT3ajdSR2Q/TlCOLKQ8WLys+8hXK8+SpDkMqn9+wNB1mwlfFJ4m
 sACgUaFGBVktcoSWr47o7DdJor1lKr8DwMQldssNU5NKwurxFcrVbTYqkvAV6Ee77UKceqt7ikY
 yb6IS4Ly59Ndeo8OBHw==
X-Proofpoint-GUID: 4YhQY3nEIIqJXffgpjU3acaPrVxHN017
X-Authority-Analysis: v=2.4 cv=SIpykuvH c=1 sm=1 tr=0 ts=6a17118e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=p7TuRdreTiM3c_8AigcA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270157

On Mon, May 11, 2026 at 09:34:47PM -0400, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> A handful of vendor-extension entries indent continuation lines with a
> tab character, while the rest of hwprobe.rst uses spaces. Replace
> those tabs with spaces so the file is consistently space-indented.
> 
> Cosmetic update, no functional change.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: No change.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

We could just move this patch to the beginning of the series and also use
it to make all indentation consistent in order to fix the consistency
issue I pointed out in the last patch.

Thanks,
drew
