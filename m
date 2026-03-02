Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29413909BD
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 21:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772488662; cv=none; b=j6WBb9VTlGEWafFd7YLiwVqdnQ3EReGbJh3aVg8A/Z4nJS3L6lqaZR/kLp9bdEAZK3q4nF5fl1BXI2v62YEuLQD9z3iPO3dZkD7sejY19jrXgmK9sEysWJOJ4HhsHETOha0ebquRaM848i88A4doLUudrEkUXKBkflu9WUEm5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772488662; c=relaxed/simple;
	bh=rkLPlMUYiUKbkvwZg90We9QKLp263vaP+3vQEnbTceA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXYvkBEbVudl2u+1uoBcYki90GzVCjSUITQOWAjNyxqZDKWZ81NK4lhnMlz21b6UUupBs6hdmjyBWpS1dVPsNWvos9OelcuxLf1dfWaWGzc74bvQd8XqOwmRqz+v2OyTzRIZ+dukbANgXrBPt7Dl30+XsYPR+MJj5+ewkPhZnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QekejI2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMLItvVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QekejI2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMLItvVh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622IUh5e3561443
	for <linux-kselftest@vger.kernel.org>; Mon, 2 Mar 2026 21:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kKGEnQyVqddtbVsVaKzEMP9/
	0r9eYevQQlpSxYQoULw=; b=QekejI2mpiNgKb1T0/vwrfrCoNAOsem1o8Sw/ucO
	FHzM/wRfm4PxxcRiftZRmvgH5WcI7YV7n9cfJOH5RtmUKFgnzgo+lE0izVwDhVgT
	QtJmS0rUZLV9vNYNyjdaZj6nhHI9+BRckTWrNWV1pWx1io7ydCOgP+IA7E3vnuMQ
	JU8PGldNHy9DY+3C1TyWRmJY+XK7YhYgcIvKBR964pyrJ9V+KTNFTmJznWZLyvGy
	mbwpAETh2U8fhYV81pQU6KIjAu98mxVBOPWvz02FgrDALKS7ZzlHBkNtND91bXAg
	8XN7sDhqjzCTy0GT1hJ0TBFV7x/V+DMlyIfvbeIl3J/l/g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bva411-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 21:57:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1275c2ae713so8279703c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772488658; x=1773093458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kKGEnQyVqddtbVsVaKzEMP9/0r9eYevQQlpSxYQoULw=;
        b=SMLItvVhGHkYqLPq7u9h7zkSM3P5byMM4FjP6EktrQY0KW0ovffUDTMw8bomzRFsdL
         C6uA+oJybV/PC0ph4bod4opwE1Djzds6QeHizznIeNKC2k4NnBynp3tc5Cn713Jot+2R
         sHM21U8XU+lcodgol5t8dr/2lzUeadlENpIY7pWK/uwikYfX2adKaLNA0yaKulurJimB
         RtYtg4/Brz2EK+iQAsldlom56YSXwXY2xmDK0NWS7vPZrGBR2EiW8oHuqiprwi320Hqf
         XqzM/Fe6iyll3QcYLuQtJJtIHUqR0vN1x+Jih1s8udfGOblVEkMMPwuOqP1M5AAdzOTz
         8xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772488658; x=1773093458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKGEnQyVqddtbVsVaKzEMP9/0r9eYevQQlpSxYQoULw=;
        b=mFfGIfWsRtVQZpLODHWHnjUU9r7Oz4FIw+Mkwy3c+AWUEPNLTr7i1+fdcL/MM2DcsH
         8Nal+T70yLK0M5Sdr6QyOSRZxRsQXaAHpuTdyRJGHGD7cD2GSLiC/GMAmSpQHnNxRT+k
         Lgf4q6drTNnfJu/StORerlkolvuUu2Vd2G+EkAccM5ps2+w4Px4bw/e/2hFtqbzFAI7C
         78F5DHnesWjCpXRPRfIdHnqdvAlGD8bWdh5w6e3YEBxN6ldjPIhHzzD+GYCDHCRbeHuZ
         DF3FmahrrMw9yiPKXw+sgb8Mrhsmg3TQNYCvOoCdqfFYDijpiyz7s1OaerBpuKSaNvzR
         NicQ==
X-Forwarded-Encrypted: i=1; AJvYcCUobKA6D8/MVdykZE2fZewkTh+AjkuHhhi9Gt6h6P4nVdHsJbRQPeMQkh7Vc0vLv4NGKWwhlfULYDgd43k7ZdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3txo0zgAfrxUnzryR8lqpVD9DonUzV/JEl9bjZYXcy8dHmK0Q
	XcWdwry/eLOegAwp9UkwYlthgjFW3WOUbncYFCdyujvDcGTOi5AZ6+2/G9t2nLdQqfDIugaGElm
	S6GtiSd+Q2JyQ8PcY6cB12T/ENj9v5BopGH/UPnavVpAyhThdvEOvkXDbkalJ3d5HYsMS9E4=
X-Gm-Gg: ATEYQzya3rpr9odkfDECH0lmAtTCAwo6ho9pJemrzVjVvJEIuyaK17HeTKjN7VGh/Vi
	lTQrlP4e/kkelkd9DtLyXjouCTt+AFAwmGCyWjAKVe4FdH5Tm9iQdJYEN5Nn/xyiXN0Rx9f3BCb
	waNAEEVtJIxICPcUjCVRv3ZASXC8nblqAnsT9iJuNdcJxZS8blIhCqjcx+UinubALlNjpDJewsV
	Av/tlQqewoF4WvTNLKeBlm+gzBBSYC6YM5hAswcptJDw356CYseoZ0GLwNwSuhKEXE3TwqRkxOG
	t31g3ak1fDcW/d7c+qwrEXXzney9sTedTTfVpIIcq60yMShYXw3iuRL1J8cZFbUPDehxDS66GvI
	yRoAQyBy1Asmehw8xPfNt17Uh5Sp9biM=
X-Received: by 2002:a05:7022:4584:b0:119:e56b:9590 with SMTP id a92af1059eb24-1278fcf8749mr7439090c88.21.1772488658563;
        Mon, 02 Mar 2026 13:57:38 -0800 (PST)
X-Received: by 2002:a05:7022:4584:b0:119:e56b:9590 with SMTP id a92af1059eb24-1278fcf8749mr7439077c88.21.1772488658006;
        Mon, 02 Mar 2026 13:57:38 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdf662eb6dsm7208496eec.2.2026.03.02.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:57:37 -0800 (PST)
Date: Mon, 2 Mar 2026 15:57:36 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Albert Ou <aou@eecs.berkeley.edu>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v9 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
Message-ID: <kxssxvwvt2dyzznftbuudkxt7gonnceou4jrjswyhkhg5vrkgh@26sivnbte6mq>
References: <20260228005355.823048-1-xujiakai2025@iscas.ac.cn>
 <20260228005355.823048-3-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228005355.823048-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: 10UFy-i1aLq5mZJva0JOwHJfpabNnM51
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a607d3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=oAJ8CtkVvmEuxm3YF40A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 10UFy-i1aLq5mZJva0JOwHJfpabNnM51
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfX4lgj2soxWnnx
 4sLZ3vK+5I+o0VAQMrr9xO5wLzIhsPTI2+2Qi60KRLDvpZGFxYHs3SK2h+K3mGczcses7JxqM7t
 XRiy6WqtThA5ZhGdraLQnfdYEjZpjCzwvX/VucUSey6pxJnrQFMeQJxFoPQ66GQ5Em3LAzM3qPL
 VTcbk+UM2ET1Cufe1sSAlpJh7+OxufD2B04cX1ytO5DqzVTFuNSifTTDPKTh5Me19j/XL+DrhYS
 e0DTTTIY/F3WtrAy+GArQ59ybazSWB1lOQeZcgT76ED/v9/hI5tYJ1j8+xYoC43RDmbLqixhwHE
 O4lcdUf6C+/Vd2fQ12qXXHs5R0PoVm/C+kK0S7r35GqUvHs08SA1XeYL6UUZ8sKjvUH9BOmXtc9
 MbRaTBrSYEVugYcT8EWac8UNJn5l/KbaeGBwaqA1VW2hit/04zZMtxVZTjoRm7Cz11CEdJO80yo
 tz3ciiGGE+CdnnSZPFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020164

On Sat, Feb 28, 2026 at 12:53:54AM +0000, Jiakai Xu wrote:
> Move steal time UAPI tests from steal_time_init() into a separate
> check_steal_time_uapi() function for better code organization and
> maintainability.
> 
> Previously, x86 and ARM64 architectures performed UAPI validation
> tests within steal_time_init(), mixing initialization logic with
> uapi tests.
> 
> Changes by architecture:
> x86_64:
>   - Extract MSR reserved bits test from steal_time_init()
>   - Move to check_steal_time_uapi() which tests that setting
>     MSR_KVM_STEAL_TIME with KVM_STEAL_RESERVED_MASK fails
> ARM64:
>   - Extract three UAPI tests from steal_time_init():
>      Device attribute support check
>      Misaligned IPA rejection (EINVAL)
>      Duplicate IPA setting rejection (EEXIST)
>   - Move all tests to check_steal_time_uapi()
> RISC-V:
>   - Add empty check_steal_time_uapi() stub for future use
>   - No changes to steal_time_init() (had no tests to extract)
> 
> The new check_steal_time_uapi() function:
>   - Is called once before the per-VCPU test loop
> 
> No functional change intended.
> 
> Suggested-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V8 -> V9: Created a temporary VM with one vCPU in
>            check_steal_time_uapi() instead of adding extra vCPUs to the
>            main VM.
>           Made check_steal_time_uapi() parameterless for all architectures.
> V7 -> V8: Used ST_GPA_BASE directly instead of
>            st_gva[]/sync_global_to_guest() in x86_64 and ARM64
>            check_steal_time_uapi().
>           Created a temporary vcpu in ARM64 check_steal_time_uapi() to
>            avoid EEXIST when steal_time_init() later sets IPA for vcpu[0].
>           Removed unnecessary comment in RISC-V check_steal_time_uapi().
> ---
>  tools/testing/selftests/kvm/steal_time.c | 67 ++++++++++++++++++------
>  1 file changed, 51 insertions(+), 16 deletions(-)

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
