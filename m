Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21A3BFAD4
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779901458; cv=none; b=OncBIkwh1JxU3RoYj/m0Qkm704BSqOtmVe4282+gXQYIA3mTMYl9XvRTiJMOQlc3TEaFjrYLlkw3fhMcuw0q7oneoDBXRSvTl/+ZM07eDZhUmlOSXV0WWDw4HDv/PZrjwfddp/L7dLDKrvpZ7NMQ2TLc69bS1mk0GsYPSmqZdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779901458; c=relaxed/simple;
	bh=HsASMyINEQfHno0rsw+42YhTlmX4Nb5LD4aBfiSfkGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqhbwgyAw2Nj9wzIqgZ/9Pt+PeL5nFiKClE87zunV90Z2bjL390vtMYXFvrbbWZFXenVTRixQFc6ToWBnTC/W5iDFy93o9VwgIKlDKJGmtiRbyOBA0PHxi3m4rskbvmHm/wr2iu+D9k4RG8RwXph9h/udbCqggUcggVMLRlmXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEhQsBXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvMZssfb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEhQsBXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvMZssfb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RGuUZ4195768
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 17:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6nha1feETo1rSKy37ATFEomW
	axLqzR6X6eFWdjB9xhc=; b=BEhQsBXLxYXh8B8T4cuZBzpDXJy3V8d+KSBqaJlf
	8sMlakShjajq9oljZ3x6QQUTUWxdjaS1K8zrY51pShQoNAtfCHbkF/qRVQ4806fX
	8Awxj+JRtqVusORT3KT+sztSa4ZJ2PoSXh92SrF6LKQlyhDhkCf9XIwov8+bcOb3
	t+lN4BDuP+oC99RaAC3XHQa7hX0pVxJtgMyxkU79vGGYD0FjiVv3YkvMIA+p62je
	1UPexMftSDe7A3quTUDCsQxZwKkysqk+ZtNzIxnIF0Xp4NA03HH7XflYoCUfNSgx
	ddqPAfK7LBeaGvoEanBhjSxltpWq0ekeP06TbBLuE6Gqog==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxce9nqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 17:04:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13509e2e47bso14495837c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779901456; x=1780506256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nha1feETo1rSKy37ATFEomWaxLqzR6X6eFWdjB9xhc=;
        b=CvMZssfbVL2T9P7QWlFa7kLGFpWlAX9tPvtt1fwcIV+VZP5mgTcmbrIJ9ZM0/lvy+R
         huzjf0ZeNrhplV41tVhJidZhzNV1JaaLTqhhV4Yaz5ArUIQF/8zvCbkEVKoP3b9dxzvu
         PDvQstcqSSWpD+MiSOlzbF8LuBSv9sJQ/apkFA6N7HK2+Rbp6pfwxEyCjPFBJu0ul+5T
         ZGylOJGuJ1mxR2NPqlPWVcFrtF6TqsYsT29vKZnymdCwlmWPLh1Gw3Jg1DzHisfe2oIL
         jXuAJnoHxnDaQG3SmryrGjIL7cC8Yp4ciDZjeMQ7MVRhXLhv4iJKR4UcFYg4wMrQrXVd
         KQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779901456; x=1780506256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nha1feETo1rSKy37ATFEomWaxLqzR6X6eFWdjB9xhc=;
        b=k3vtIo4yviKdyBg2shMzpwDmNok3R7lAHEmVVctEkwqfK4j3h66sIMHYAjvplYEw0U
         R1y1djsIbeWrvUEkLL71m64sc4RSVk46RSn9Rf+DsoTpuLUDbfluT9wv9XcIpcq74OzV
         rLLHLiRivNSbRWhbTibTwvlKHgLaGIzx+iIdpodkgEE9jX5oLOUS8owt0OFPqdA4qYRQ
         c0ES+w40v9pHtTZQRxu5p4gFJKbSnMNA0ZXj7oF1PyWgQKoS9J+smw+jtdKymq1Fr8Sl
         /a302SPNtY8PewoXFkD41dZlCKiJDPMeLV4oPwnLIwcIadMJNUqoNKFW3tJkLz1k6eI/
         wUcg==
X-Forwarded-Encrypted: i=1; AFNElJ+gr7Jc/AF07g2vQWpCPATSPgkbsa9b1LrURQvzG4toV8ZOk8390CkEkufHhsOGOmAUSlfxoiQv4NXbpn2+uFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpibymyykgAG1ltyg7rBrP3toB7faFHgymZhH+GNeB8EFKQNNU
	HIbvhKn4jXIVxin4828LghhRuufcmBeZLz2F28bHHDrXmVgYYxO1qfu1h0Oa2qqqzdG62BpZDRv
	wkqb6uxgCZOlgHOwA9SP3r16t19VDwMBb5mc/iYIZMn2WiRJ+ZJcD7ui40Mm2rPnuXZYKTVs=
X-Gm-Gg: Acq92OHBkbqEof2+QKOTFYAPCUkWXhyhY2FSn4YrjCwIHvm5i9PWro0Ni6oSVebPltG
	4v4gMICKtu/tIlpR8tvqHNExPY8Ieut4YsfhGO5Nw1LfyzX3Skp7GjSlXy/NqeZYh5QhjaRRtNs
	eTpK9GMNY88mnH9Q/v07xGCoCMov0IF8EMkvimY98mUyVG9Xs42LAsgJpxYQGSLmw3m9J/T2xa1
	r9r2iODC/aCJ6UgYh5tHdfCMyaJMt3cDeMkiACNxVN6kOsuFMiwrovbOU6h/+qR7R6DJXlGTaJp
	f8aT9I3Pks6sM5x592ofdk7YFsWwQ4FXAWDYNShknVStw5ysSVily5A0ycE9y27njyiE0gj0S3I
	uGqq9Peu0yWdIlw4K2sUd4pejBQJfn7vJLv+Jyd5ePA==
X-Received: by 2002:a05:7022:258f:b0:137:6c0d:b990 with SMTP id a92af1059eb24-1376c0dba8emr719579c88.25.1779901455916;
        Wed, 27 May 2026 10:04:15 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:137:6c0d:b990 with SMTP id a92af1059eb24-1376c0dba8emr719548c88.25.1779901455346;
        Wed, 27 May 2026 10:04:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aa88eccsm10819104c88.9.2026.05.27.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:04:14 -0700 (PDT)
Date: Wed, 27 May 2026 12:04:13 -0500
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
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <bfap4hslksgmfosoy2c4g5qgrhk6ofd72e6f3f2qxpojey5yuc@74jvqlfe3urw>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
X-Proofpoint-ORIG-GUID: MSrMfskJLyTQ-O50U3DPyzxdUkmXngfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE3MSBTYWx0ZWRfXyUuFotmCailP
 Pc8ZWxLqXPriyKzlsqMNd+8uS3SE+lC3qqpied2Bp1so0wljfjLsqNkTeP7AwiF5vfObgNRghm/
 C9NP/JaOBpNmuiWQFXnhIau62kVEV40xxqEk77InfcyhDJHyLAhDg6Rmyzdro+VaD5xUxXpAJD6
 AlaZWI9xWu0qr39aokk3BLeKyQcJZd22viz3qmWIH+Tbbhcr6660p6ZqkFaB2osbMETCbj6cZTB
 iWA37w3Y284dn1geQy7/uk2E2zO9Ac6+E15nDa73dVIMundOBsmTjiUmnh8Cf+lPMZ2MU89a0HN
 nubiu3vlWpBodVPGg0nEZDBN4F0yhJgsQJnzo96ozrJGdG9WQRPoGE6BN+17SGYn8A/b5rcNjdJ
 BhwbmZDgOTzIfZ9erROjkRcOvehwXqS9rZHwek64ZAdNVfrZ4l40+4Mi3WaXxBQwKeqva9ADo4V
 enukLCsVOTNbwHmEprQ==
X-Proofpoint-GUID: MSrMfskJLyTQ-O50U3DPyzxdUkmXngfa
X-Authority-Analysis: v=2.4 cv=SIpykuvH c=1 sm=1 tr=0 ts=6a172410 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DOyYl3NULbmlVlinG0MA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270171

On Mon, May 11, 2026 at 09:34:53PM -0400, Guodong Xu wrote:
...
> +	/* Zic64b and Supm with PMLEN=7 */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64 ||

The only mandated RVA23U64 extension we don't have ISA string support for
is Zic64b. I wonder if we shouldn't add that support too where it would
have a validate check like above.

Thanks,
drew
