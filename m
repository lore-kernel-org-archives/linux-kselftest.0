Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B963B2FF4
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778104862; cv=none; b=qKMs3b0tLBv7XA11a7xz4SD+x/d6B1+H47uGpocC3tXKVfWl+7dXKQyujTee9/47Pgy83i4QUVO2rx/xZpLDC5bwBslL2Cr+tfHauP/fyycDAcUR4WZ/5zfszakOCFY1HYgc950WeYumCCk+f5oj74qRsqBf+ryNo5HVlNnilqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778104862; c=relaxed/simple;
	bh=IXZ4d32H+jOcp8VYWQpphT/u7pzhnl3CNMsqVR/2JKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+84mSjYRnOLtIk35mrNDdx4L8TdSmPzVdYE47rqhqJ3kzVS8hnkWhY7ZUGLU90rvWUsOVdJG/OvhfjYyeMZKDLYboXfQbme1DvgUfOBetffcwFnzWzPqPs4/CUqMZd8ZKEHikt50NbVGVOOJFn+zSAQyE1yXIW7bClV2A3xhkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SR6oKNSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0vqaUAz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SR6oKNSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0vqaUAz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646FF6Go443144
	for <linux-kselftest@vger.kernel.org>; Wed, 6 May 2026 22:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aZPxIliVcF9OGztv2uIgcJGk
	CT8mmquqC1ZufniuUCE=; b=SR6oKNSlVvu5Oi4g7EAbzQbJqL70VeUZkFFoQr7d
	jBTGJhE+nNHV7VIPGBmbgJvVk94vulDk4vSyBaQdr0VA5aT4g8uEpcUXXT7q0JoP
	OLCwAnATUfCoKhuBlsGJh/kce1HoHHTpuvlgE5+SRwwPboydQTvpPsxucipuWjpQ
	FolwM6ppk6NBKBrvz+2DXaJ2ByuHnVvXZqsQDQ2fCsQREk9X3qC1J5H+Bg9UUqVE
	BBM+drUf+fkYJo30GFOq8SF3eOyE7GEYV2IQkMpPevkjuyf2D4P6FmTY8vPwBJeD
	ugUnK83b7jyBxEYuha1Q/Q7wi+mIbCd2p0uK02UclJEZMw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299jvc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 22:00:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so324944eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 15:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778104857; x=1778709657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aZPxIliVcF9OGztv2uIgcJGkCT8mmquqC1ZufniuUCE=;
        b=J0vqaUAzyWV0wsBCQGYgYamis80/tEbKs+DFuunhgB0x2Fwyviy2/sQcsXmlLwULaZ
         BkTTMe9N4/merJdbIG+z9TM3KpiWFzUdNhaXU4CCphbtycHxys2+7uXFGLpstqoFgA7h
         tzE8xB5ayhXbHru4jpTqJC+H8ab774Y4w93KdSbTvP6h754kczSmwnlBgN+KV+ws9bAx
         FJuWhvXIGSUfArlsW1iqWKsUL5dncIx2PByNRhaaU9NHrYCJ0pe27ILctzBFxE9miDXE
         f/kbYuR4IbQXF0T34iqQH5rfdgESx4SGBkuUel2jv7613820n4SFWipq1T1BuRBC7hLA
         45AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778104857; x=1778709657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZPxIliVcF9OGztv2uIgcJGkCT8mmquqC1ZufniuUCE=;
        b=nQaLHE6HGnj5QWdSNsPAY5QCBQPdTufVUz4wcynHMV+KLWVCd+/tQDdlnOdrMfrDaB
         dbOH5ilztHV+o8CII0z0G7ECAAht1N+xqz6yhIJTCBUO9XkjrjsYWLf8HZUdTJolWJ3P
         roNciSLDf0Lv81DDBjARhnJ/Rs3yN6M905GH1dyPov5xwG1ChXUZeTOLrwvUSLbpJ7Fv
         Q2B1hKbqcPyM6B+6PbNck9TsyZ8qgnY93/k75oyDhKxgU2PFezeZEEF1jjaapTFbPtkf
         BS7crIzYHDDAvYlV6KWii7oJunJ+cFC9yAMEQYQ3Ut7jvWRMavSVlgsO6Rv9BNt5SmZJ
         5BWw==
X-Forwarded-Encrypted: i=1; AFNElJ+jU/m3m0lQJCoJkemABZNWRxbUFwUPhQoYkXFLPSuvgAxB1i8rwoOxxhKF+URFqn/I6Pdcr04cumPqhsBWdQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhcTADdWJnD8oM6wzFwM/E03+xGeDcNsonUw0mjo87T8ayR0j
	4cdqQk4sfsKUY0f8qPP5gB6fcXk1cUtNXlUGJGqIHmuHa1hB2bcEcGVqeQqtW/zSLwcdo77GpA1
	GA3xiO5vS17SjeSR46O1olLJ3lnlsoVVR/tcPHiIbw7HvlqT8Psx1GKwqAxQ0RVt76+fs1ZM=
X-Gm-Gg: AeBDiesPwKylh21ugJxSwS4izQTTb4T9GjE1lBWGJYIqZOF9aGqH7fh2bT57R6gtehd
	bsXPsWm3gnmCxlb4vefhgixaZJSiToEnuDaVxnCxrgfFeMe0/EadfRLHnzZZX40mD/eYEXp9vFf
	YKaDrguckIc957Yw2+N/E0cqyxZhAL+0R5oQoi8T04YhaDWSY9hZWHxMTSOmg6W7c4yXFXcPznT
	K3IomUxJyrTRcMHGxT3+JmOF1zzB1kSBxW6pIT3RB7Wh5erRv8c0Sx36O+t6NOY9dxTJ/GtPR5t
	T/xPeA+QRP+gZ7F0Ew22JRKlWrHdmrfvnzH55Fd5bnOq0YxR0eNKZlns3/NgENuZSoGV/OjKfgN
	573yyDWvsbM6uRElLm/e4TdnUkItFcc3fbCLHLbvdeg==
X-Received: by 2002:a05:7301:9f03:b0:2f4:3a9c:819f with SMTP id 5a478bee46e88-2f54d79b972mr2873491eec.20.1778104857217;
        Wed, 06 May 2026 15:00:57 -0700 (PDT)
X-Received: by 2002:a05:7301:9f03:b0:2f4:3a9c:819f with SMTP id 5a478bee46e88-2f54d79b972mr2873464eec.20.1778104856617;
        Wed, 06 May 2026 15:00:56 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f5707734a0sm5901626eec.31.2026.05.06.15.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 15:00:56 -0700 (PDT)
Date: Wed, 6 May 2026 17:00:54 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, greentime.hu@sifive.com,
        vincent.chen@sifive.com, zong.li@sifive.com
Subject: Re: [PATCH] KVM: riscv: selftests: add check_supported_reg() into
 get-reg-list test
Message-ID: <kysjvcg5shcuhgsd44znceenfjw65djs4wviwp3psruq4t7n4c@ppj62upl26wf>
References: <20260503-kvm-get_reg_list-v1-1-c16f9b572e9f@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503-kvm-get_reg_list-v1-1-c16f9b572e9f@sifive.com>
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fbba1a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pFyQfRViAAAA:8 a=wBkBAAe1paUrZEgFcZ0A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: w4f9keKgPOzf-TFrOKGyW2uagNxkid0D
X-Proofpoint-GUID: w4f9keKgPOzf-TFrOKGyW2uagNxkid0D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDIxNSBTYWx0ZWRfX+VLt7lT4l6gv
 waOIhrEk7IxIvngwJ4+4W8gThmpCqA9CR3srZmCp4ISibiP6Xc/JZLUyRBY1bTeK6kQpd63lfQc
 46TdUA1rFAoQTCKLkifLmV8MZYRnVohbhJMQyDalYfhhI/uzV4YT0AgtY4bMZouDPVgsz0FGsS5
 /OCkU1HuKH4NLytbdqEEJMKW5pxus2dO/jvjIlg4EwQBAxFASoxdob5G565amTk5ptpyT9f6q+8
 kUJeDUcDn8bOQNh1us0O9qMuv/MDAnGFi2J6urR/eX1YVhdec7IKrd7t5DKdZjoVwLD4tBjRTxb
 VnxtV+rZ6GmJKCgwi50niM7fUebGRmaQzlzeAR4t+pqKUixVzhlipmDbQ+0Lx63LMUxqC3hyd1T
 a8gs5SRTpogD/c+XEqbnjt7wUHrabSznRE2S6DdiLuOiYKEZKlr7QpCYyVztff2/AJT8CmQmQW8
 zeAu3QgSur0X6PwEZbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060215

On Sun, May 03, 2026 at 09:00:53PM -0700, Yong-Xuan Wang wrote:
> Not all the registers in a sublist are supported on a platform, e.g. the
> SUBLIST_SBI_FWFT list. Add the check_supported_reg() to remove the false
> alarm of missing registers.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 8d6b951434eb..d7cb9b5d37df 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -28,6 +28,18 @@ enum {
>  
>  static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
>  
> +bool check_supported_reg(struct kvm_vcpu *vcpu, __u64 reg)
> +{
> +	int ret;
> +	u64 data;
> +
> +	ret = __vcpu_get_reg(vcpu, reg, &data);
> +	if (ret < 0)
> +		return false;
> +
> +	return true;
> +}
> +

arm64 implements this function to only return false when a register's
corresponding feature register isn't present or it indicates the feature
isn't present. The above would return false for all missing registers,
even when they shouldn't be. OIOW, the above makes for_each_missing_reg()
useless for riscv.

When its OK for registers to be missing, then we need some way to
determine that. If a sublist has optional registers then it should
be broken into multiple sublists. Then, this function can be implemented
to return false for registers in the sublists of optional registers when
we have determined those sublists won't be present.

Thanks,
drew
