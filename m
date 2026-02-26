Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D5D4657ED
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 19:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772135672; cv=none; b=hLCcLhxj5Qcgd9PoOd0O+Gvh32ZKsaojN9j6hYnMRhUjZ299xfEaXQJis4UYXxM1g0ne3N/erffX+cBBmxUgtZqgla/vTfms7DwA4ptJcAdz8KRTOMwcD8iFSe0yYGHbzdR3vmPa7Fu1pW4N3ozUyS1EUBIu2oSE5LRhqya3l3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772135672; c=relaxed/simple;
	bh=gGUscGY27edMw11lPJHTNPeh7Uf9+oR8ca8jIhQKtHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gjb4OS3YSWIf5zo46VWXEvG8OPMuoYTl1Ctp5dFrYt+kppY/6tJz5N70Cmk4y4HFfozaYsxSZTVpEmAtCF/iqnLSxb7zoyMWXCh20qK7LfIkn923GM5C4VjpCEApXhC7XnOcpyBcY24IzyO51z0C8Fbr4qzl7Yfy+gUAe0pZaWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQHQBnuY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBPYuro1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQHQBnuY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBPYuro1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEZJj1825380
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 19:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gkS2kEkiD1AazRxh9MEv+lrE
	cNwpZ9ngwbS4rZ3aYQY=; b=bQHQBnuY976RywjkkxRFoJe1aPFJ/Rc7+AJMIJmA
	y+xV9ItFDwrV5VVJB0WoORNHY3ApR6lEBMjFWILzqRaKb08DNmPQgvI09pZ6uSBj
	lfckXXnFndIkMCVi13Y4cS/FOC+SNPBuWAo2rpYzFC3/1TmZd9c0pLlrAIXBBAqG
	LNgSp49rX3g7BoCy0C+iLcmAK6OkH9QEtrs8O3axSSprqElupwd1tuLXwbK4p1mi
	KepYovkFCiN7wpy9Gs1QXWlb+I9U4W09ja3g6VbmI4PsB0+guOMfqWXkWtygp+wN
	GXD+RBobmG5w/pfGQD46E3ztudBgi5Kq5Touq62EVny7LA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v2c10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 19:54:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc87facf6so1405429eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772135663; x=1772740463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkS2kEkiD1AazRxh9MEv+lrEcNwpZ9ngwbS4rZ3aYQY=;
        b=DBPYuro1+RdFqxXqb9mY46vfpCE0ikk45UAeDJ3eoaatlf6AXlCkUa7oW8KwGHhRlA
         mIHXPrSuMp/ozA4toLKH6xTvCI15l7uBn051fBH2/5XyjvDe+3Adw4sdE3lLwVKCZUWy
         07FjtwZzAjs+ZPDVQRpqg9MY6h9Ucmpb66eo85PtzOEY2prfX+ZpddIJAIcKL4voVpEX
         bGNz5D0e848xLl8i2FCTCYn81OnKC3FfyxBJIqk8uztsmVTfRUaM5lu5pdZJ/gMRM1Vr
         deE5RTycabVZWQSNs7vfsFdxy28PCd8ZxYhOkeV5To/8bcytZP8zBIkuCba4LflnOY7y
         sTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772135663; x=1772740463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkS2kEkiD1AazRxh9MEv+lrEcNwpZ9ngwbS4rZ3aYQY=;
        b=JFugGZ9R3NlDLIELyS/kb05UN+DYPk1GKjbPIv0DhzKD2/q+fPHlSEB6j4suD+eqSg
         XExzXlkbSQOtpA01FuUx7y3zFb3wcvkXntxosmQRksmllZ4PTYV9UBet93RK2TOaKyqc
         NVkLIPKtE4byQ5jc18GMn898SLuoUTE6rjBcFQlkb5vIU0SCAr+lrE1HZNye2QB/oBck
         avRMUgzvr8/3iL9SN1AxuHPOd+YnhnzBLkA5lthBlAZWbCavj/mLQgAumhPnfkvAdQN5
         0kW1QgdNa65h9i7NTFeT2R8JHQpzcIpBXxF99Q3iGrtXVCZpLsDoRqvuGpczjVgYF5jV
         1dDg==
X-Forwarded-Encrypted: i=1; AJvYcCW6bvf+jLkjs1i+Pd0QtYbjRhVmCKrLrHwkh9IL2s1uGpj3rFZQasNrpXoOmATpdYby+l8TR1aNj6GLH6qqfe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyClrfqwXoG8OTO9oszQdQ8WX/MEjGlytFNOPDKj+xIsxsWD5xp
	qFe0E2m5OQS11Dj69xAZaMeBzYVCgRLt9RnKZ+5Y+DmyP5e5rt2ZjTz0BkaNXn0EsWdRVZjyvvf
	sVEi0io6e+f/8a0Om8mqcoANDAi4Ll/8vJ14rnDLucg4SrhFpllw48q7S26z+yzPW6DdHmxY=
X-Gm-Gg: ATEYQzw5tVqq8KUrHo2BjOs+Ce5aE88MwseDH3+jNyqXZPGWYfp7MWWEi33+bftKNEt
	vIx9et+0epPfqK8S9hZvtG+VTjAsDuoEIEjt4jCZh/8Lz9SQbmLVCDeK4b7Ml0SPoXsftQo/Di/
	O8KpbUNZdDwBB4icHFIY7xSpK8c890JwQ87aUe0uP8651nG9tYnakjPh2ehmIuhyKgRr0e06sIY
	D2EUwVdPC7E+juTXmv8ji1kxhEmjAlP4TJ7uwKK9X24VxlvnvKnYrvvb3x9XxnAN6XYEUU7X0Sb
	jPYAnv3fBNQEMjEncxnGvTHYXhr711Ro3DHNXlahLRNVEbwVuuuEl+2evlQtUmc/cvO8kYucajj
	GS3AdnHGeZdmSlnzi9D0EqZJo8vpBw7k=
X-Received: by 2002:a05:7301:5795:b0:2b8:26b8:3426 with SMTP id 5a478bee46e88-2bde1bb19d9mr133477eec.13.1772135662423;
        Thu, 26 Feb 2026 11:54:22 -0800 (PST)
X-Received: by 2002:a05:7301:5795:b0:2b8:26b8:3426 with SMTP id 5a478bee46e88-2bde1bb19d9mr133461eec.13.1772135661846;
        Thu, 26 Feb 2026 11:54:21 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f7ee87sm2493752eec.31.2026.02.26.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:54:21 -0800 (PST)
Date: Thu, 26 Feb 2026 13:54:19 -0600
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
Subject: Re: [PATCH v8 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
Message-ID: <kycoxbbf7krrqaqivzin6twb4vnbl7g3xfnx2qwotwxkjklxad@37c66df75wv5>
References: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
 <20260226083234.634716-3-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226083234.634716-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: 3RO4qGgVrJpLzKm1BAVXB29ItpKssRhx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4MiBTYWx0ZWRfX7kdqG2tiklmA
 5NxKidDSAaNIvqRYT3G/uq5Q0PO4l27/OkwJl0wPUfSeJ7iX0rOBEad17AyC3GcM5PNfOtxkqBj
 rZUHeNo+uRn6xoa2ty3iB2QDRpY7nVkHBtJ9RwmC/P9knHKvyX1prjn/qiuPN931Hkbu829IT0P
 ALrcKCVv7WNh22ry5i+OyDCXuFpLAWwiCssVDbUEMaLBVcy5zpkwOQopAaQfoHv0oVfq1gWktjx
 E4wVMMhE8Z8Z4kp5/0xPgPkldY8N/VxoSkjusr+FVZLou55lZtmRwDgUpXm5VEg+sPuX3DvHn4Y
 QQmsogX4QUtsLGpWJr2ToWswLavNvi4SQQxwTniLsT8dYBAK6TZ6erkLvBCDsiYgS4VllZ4a+xf
 YJzThh5oVpZsv12iNi4GAxG01lu9gIkaDu+gvviLM50TpjYSGeGaiytSswdm4DMaqhuorB6NKcN
 sz4zga1Lq5UlghVefbQ==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a0a4ef cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=a8_vTcVqeGFb8pxCYGAA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 3RO4qGgVrJpLzKm1BAVXB29ItpKssRhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260182

On Thu, Feb 26, 2026 at 08:32:33AM +0000, Jiakai Xu wrote:
...
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vm *vm = vcpu->vm;
> +	struct kvm_vcpu *tmp_vcpu = vm_vcpu_add(vm, NR_VCPUS, guest_code);

We probably get away with adding NR_VCPUS+1 vcpus to a vm which was
created with NR_VCPUS because we don't run it and rlimits happen to
work out, but that's pretty fragile and not a correct use of the APIs.
So, we should also create a throw-away vm,

 vm_create_with_one_vcpu()
 ...
 kvm_vm_free()


And, even if some archs don't require the temporary vm/vcpu we can use
that same pattern for all of them. So, check_steal_time_uapi() doesn't
need to take any parameters.

Thanks,
drew
