Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27366329E7E
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557104; cv=pass; b=SqMqEg3b1Nre083HTi6yOVLzL0KVnSEbhoeoAMcH9T2NJH0JcufWFXrz21cWBfd8bSRx40PwOq1XTqpwruaS1MpDP8Ip7dSmKIFen7Eqi/by3q1TalvnVli6BYI8h2OIT0TGPD2unLO3pVJPPy/CJbtmPzJYaTvCPqzNE0ueQXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557104; c=relaxed/simple;
	bh=ObnjNsk8R+1s/j5dZzKFy+eMS6WJBMJERfIFad2mocw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELHAa8uybT8ukD4ZRb9SrEqsr5gV2sIDPlqxjpGMTZlEuH2jj58KP0F5lr0U8i7QpyVOkgNPZrPEjNVf8woJ34OaIoI7dwC7eyx9HEhtWmjGILKpHaBB0xXQlJBNpPEnj9m8j8g65aWVtBE3T3/kg2NqAnooUB0Lr+wOQdylO/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4pPZXnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ba4YTyUB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4pPZXnY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ba4YTyUB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ZIR51584837
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Apr 2026 10:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObnjNsk8R+1s/j5dZzKFy+eMS6WJBMJERfIFad2mocw=; b=f4pPZXnYhD+F3J+B
	ohpPYB7iiQsK8DcyYdnQ7Hj1phx+h/czfbNA5IOTZx9TpRgYqa3fSW8Tcb8SRIcg
	HvAPIr8wV+TYQGv4dGdJ/JaPkFEKgUG9mfJUMU8ck35RIkUQnL/Fyf8DrIp1Le1q
	qysgb0KSHWA2NkYLRvTPOeu/QFJzEQfjXGZseAgo2ylgo9qcNPGfmciqIpWwSwvs
	bSX+g2QASRqu5mxGQo+sbrjchsVyJ5XdAzKxM5su+0WDjFydaMRYaSILvv2966nY
	ifvo4cvpagMUIHkbi5XDeO/Pr7HkrYvb2So+mNUoY0AZ1tkDEanbXMpzcYgUPoxf
	FzKTKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9t85c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 10:18:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d3e4c19307so956183385a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 03:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775557101; cv=none;
        d=google.com; s=arc-20240605;
        b=CSIjop5XLHVMwMIkS4pz9nUYd0ZDXicgK441gJ6eFAXLuyDlmHaHs4irVblZ8AIdQc
         SMNgYsI1YG9XsX4s00/QxhXO91KVFENv+Cl4mr/7EqSvLIswhwVQQ1MSzDntnNiTMRk1
         zxRcBZu9I+ToKjEHsOASP7ydobvRx37MwtM9U+8E7DDzmz7dY9iWB99FGyqMefo4Q0sS
         SRR2e0V484qxTi+C41zlVb8ci5TXP+Akj+7jMkRj76uX3hnLffcex5MnAyKfP/M/8ycY
         X2O6OM639LQg8uPtoz4zBqKE9fBig2KCgr/3UyZiQqTuL93wuDjV/mMMhkslBOsbdVsT
         ey2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ObnjNsk8R+1s/j5dZzKFy+eMS6WJBMJERfIFad2mocw=;
        fh=d07IWfh1kq/2wybnvf1yusWtLYWkSKwpTENmWA0m95A=;
        b=jvXTc5rgyD13tWwu2j8yN3m2vPrIhiv2Gwvrfm6QwfWm0DTbmfQdPwgs5bODWaa+gm
         Uun25hKbAzcehcJPFWUawjp+t7hwx7INynQoZ6mT3wCi63/7w7QHRanuW7VQvQbWGrLV
         SoFZd28ZPuUJZDVLnMecj3WqpzeTYIpKcSwCzeKThE9TSeuJrRyi2+3yE6YtxCEQGRDr
         Tf0K6E/ibSWC3/y3cKK+Af2CT7rF/bzBdlt2FDH6g1YjN7y6dtAu2UG6kCZwt2VR7jxV
         whSZ9Lx6h5AMlhLHH+e73OimDXVofgVEgQgFT6OhMf5dHSdWYrckNKQZy3qLS78+khKQ
         07wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557101; x=1776161901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObnjNsk8R+1s/j5dZzKFy+eMS6WJBMJERfIFad2mocw=;
        b=ba4YTyUBDiH4MVXYO0C0pYNFo5n7JG6NqGdkHN0l/GIqko4bEUPx/D7zVNO59SFnem
         Nbx8FtTTyWy+M1qjWXgv3SnIfooDWgJH0QU3A2Td816kf9hNwCSUV8yjqCjq05mjZDoK
         eUpMeI3wdGf4qIUO62q70JqMAaIh2HaMTKlweVZ0NqxiFrbRQka2D3WpusP/aTVT57D4
         9gcUJpxZzfR5QVbxfHMnBOsXqjs0SeScCUdyOQsGffKn6+g/d7tX2WjB+TIBxIBJ+3vS
         PhjW6vjSv/n8sGQtYsaV/M877sZfDwFp9tPB3VdR38H4sWuqPmAXM3ypqdGuZhuE2pMY
         Z05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557101; x=1776161901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ObnjNsk8R+1s/j5dZzKFy+eMS6WJBMJERfIFad2mocw=;
        b=HCooRBq4qWdnyzGZXFqG2y8Xu6/ODBBT9uhTI0dJnrWsE2famKxOPmTXVnqvVtRZSH
         yWFse/Ws2fjKnbiEsdQqohIC0oalq8IPydYslfajuBRTOeWMRBztd4tp/vEcOw/Epw5B
         lByX6Gx8UTqN6F28TieTL1LknTdfEwIEJtLrjEN5pcoHIKOtiLfJ3XSwA8F6NoJdH94y
         F46hKbkwMbEa6RSdxmvfRR+c+n6J+rBrS/FJ0X0G/5B0Udx21UPOFHxBeYuTl6ViX4D7
         sLIb/llr0bcdrBvUpRvHFLN5xaJMGLv9PfNx322YA7v3MG56qksP56VE7t1Dz0dPqgui
         cY4w==
X-Forwarded-Encrypted: i=1; AJvYcCUQk7EhyPIfKHPL2tbgqU/iWbEqET3TliNFrxhG9ECnng3dMyj/oBdUKpPMcNmqMVQCo21iEAkwDgZBuJ5TT9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YziIpkFBMAX1C6i5q1Gu5oz3NeXuR5AjTqXiW/96b+YOf+j0IlK
	hIdyPiflJ9CQavu4nBXZEXskXAtpdQgC+9f93DwrQG8LZtAM+Pprwz81xPBW+Fkjv85Urs9c1pE
	GndCKfAjYIXq7ywXC+bOw+sBG0Tx7archAwftasaXY+rMoCCZQOvfq61QxpirW5zm/6a+6UoMlp
	/zvvUi+YN36Fe6plZQJIXoMOr8K0SG3/n9izkV0FDChpjZSQ/SG1F9pA==
X-Gm-Gg: AeBDies1ukHxC84cdGNIPyK7yZVYTA/fy9JUMhXyv4GYFrbIejZS2yz8eyK4ztdnnfI
	3Z31FZiJ124c/XtLhwYZB97LzB1izOM1PHOqVNEiIMeIF/zq5yknFatIGYTTHW3l0ibkYGKqzX7
	StSGHyukdrXH6Wqwk/ckNBUnV5q1IX7z3bXgqwP2Odc4UtHKm9Zjedan+iasnbV5zCHDV0hPdfL
	TXemGc=
X-Received: by 2002:a05:620a:404e:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8d41c6abe9fmr2357253985a.19.1775557101389;
        Tue, 07 Apr 2026 03:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:8cd:9665:9ef3 with SMTP id
 af79cd13be357-8d41c6abe9fmr2357251885a.19.1775557100987; Tue, 07 Apr 2026
 03:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402102953.2984284-1-mayuresh.chitale@oss.qualcomm.com> <64d44f37-7d31-46be-b9ed-cc86969777dd@maciej.szmigiero.name>
In-Reply-To: <64d44f37-7d31-46be-b9ed-cc86969777dd@maciej.szmigiero.name>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:48:10 +0530
X-Gm-Features: AQROBzB0qcqdfjosP92annvEyb_7a5bp2GhJjVdK5-ke3HSPxUq9cisp7D6zOPU
Message-ID: <CAHuiULDWrraUspHZSDCR1HFZrZdevr7x0GLy5rSni5T=N4upgA@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: memslot_perf_test: make host wait timeout configurable
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4d9ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=BNrK-vKlxPOWU8-VGi0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NSBTYWx0ZWRfX8GkoYKqzCHZW
 6BV3T8gUiFo8R1NiExH8sBAW3wKpE+/MsVaxp4HG0b2u0VWh4Hu+C6Bv94lUPDNJDrcEPQ/ieoJ
 76dLufKV0S+AcfFOEHfGsTJkDnV1a95OW7FP3ecywpy89OxLAbXnYjuuYAunaZTFK2ndYoTu4iC
 ujMtj9ZzslzXf66SVYMuGD5q+UqY6GGTkZsHTa7P7qPE512O2+k0PUzaRzYj2iDsjZTHIuv8Gbi
 oB/lxfB3oNs0zaaTeRD6gbz6GWpO0FXSZ6O/3yAxmcLQezqLFUk6C2xAhoueUkHF7eo1xXcxqDv
 MtTr5tzOOTMT/MDfd9VbYuYstX84cEuUl2shjSykIQTmCs9O1vs5wXG+v0MtlVN/iwZiXH97kQj
 XQGE8FY2mJSW6vWSkSkUdiGfGfSK00Z05XS946XuN0e2VdTOuhQz9HBxZa/g1wfs/VacZY4KZAw
 5cUJoRWElx45p0Ikswg==
X-Proofpoint-GUID: OjKczHnVEVwGIdQLbXF13EeGTgxv3yHV
X-Proofpoint-ORIG-GUID: OjKczHnVEVwGIdQLbXF13EeGTgxv3yHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070095

On Thu, Apr 2, 2026 at 11:50=E2=80=AFPM Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:
>
> On 2.04.2026 12:29, Mayuresh Chitale wrote:
> > When memslot_perf_test is run on qemu, sometimes the RW subtest fails
> > due to sigalarm, indicating that the guest sync did not finish within
> > the expected duration of 10 seconds. Since the current timeout value is
> > itself a bump up from the original 2s, making the host timeout value
> > configurable via a new command line parameter. Now the test can be
> > invoked with '-a' argument to run the test with a suitable host timeout
> > value.
> >
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
>
> Out of curiosity: which KVM-enabled setup takes more than 10 seconds
> to run that RW test?
> Does it have like, multiple levels of nesting?
No. It was run on the Qemu Risc-V Virt machine.
>
> When I wrote that test I calibrated it on a mid-range x86 machine,
> where one iteration took on the order of 0.01 s.
>
> 10 s time limit per iteration is already three orders of magnitude
> slower than that.
>
> Otherwise, the patch looks sensible to me.
>
> Thanks,
> Maciej
>
