Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B743A4F3F
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557280; cv=pass; b=EMvgROHSFuc8v4NSfiEWf1y1SmLmwTKx619s2Z1L3iNUQRthgSUcItQCLeUvHgK7J59l3wmkuBCa7zETkUTINhED1rm0zaP6sLhIF6TqGsjJemB4DiPre+pkc66+e5oYb0LeHxWOjqRxoLYG3F4VnUTGTHccTXht0xOZRFTqKTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557280; c=relaxed/simple;
	bh=I4b2KJgsDgGll33udp3PExX5zTeYtVJMIJBKEnalk04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5lPGumspHGvxnIClFHs1+FDMWR6Ms7UAvpUFXfTSEd/bg3GuQmfWyELOlr74+IJd5cIxVQPK0PuDGC9UfkAHNPQwTp78L3l+Dyd+F1wCqmKJqqm659IdZ6JVf5V4NiyrsotuXo9otTG3ZrNQ/Z1Bi8KqB7yFhZCPccBA4oMsQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjmGiyx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jh8rW+tH; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjmGiyx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jh8rW+tH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63763WPj2328036
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Apr 2026 10:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4b2KJgsDgGll33udp3PExX5zTeYtVJMIJBKEnalk04=; b=DjmGiyx9DU9o8RuH
	SvJoZyKsv5yR0UYhodzaMZHJBKVr9TOFdRU9XOPcH5POtrSYx86jVNXsu/slM/BQ
	qHKU+T9CDseaVts8aXipHFq6/jmMYbo4VjiVpDYyTLrLWOR7l8ICvnmvCO7TOCpl
	s5vDPTcYZRKo7wppsgNL2tNmJicsIWhxXz6kvocuFubcqjdA6tEDQ+BfQMUNZpJH
	eeN3l8doZguTnobCMYqpulOKvqQkkF3juhZv47ENIjfKsnRo4hLrq1gp8ssdybv6
	QAOgVZFPs8kTTc9lJwyV5g6KoQn8LSA5S+p0+Y7So1LZojdTx3+yzAl8fjH9uDtj
	Dlx84A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4t8a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 10:21:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8950562d351so48639866d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 03:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775557278; cv=none;
        d=google.com; s=arc-20240605;
        b=kKujCRF51Y8Oy8KP96SMqbS593jo0BuQRVfXS2Ku+1MgpiSCh31UZfcSb3sRTjT8UO
         Umd9teOW5sFpMN34BpEOPKQEZ9Dy75EUoI1gGrgo1NiA37EYIH0tj1T/AARlnccU59CE
         tsj7hgOCYz9estle6Vmps4Y95/v3HrRRv+lIBHfWWw3sd6VpjU3HR1XeIelnEF1YXo8n
         A76jnoR1oqjW0Of0pzMK9RgdVstussYdOUf82QoCxt0StbXmMga5X1TK13QzPic87LAi
         j3BsLJIJT02JiqHDOQXuaGMllgGuR9V3UR5R0xcUsLGdrj6daxij/d6v9GkdRLzsoom9
         H4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I4b2KJgsDgGll33udp3PExX5zTeYtVJMIJBKEnalk04=;
        fh=xXf1GczVqRiR+btH/VLPenSF6GziVjivQ0fNgiGHUJI=;
        b=dCG5cFY+/g/AHk4S/byCIEnURRPzLVbJke333rNWERiY/Mu2CLfSodYtDqSt3k5iHi
         Hus39xKKOcTpFMJkMUJy6nkN+nF5PTCyWIYZe6MEKRZfy/FxgzebsB2rMqzo7hZa/Qko
         lXuJrL+OFJOA31X+ggl8M3iFm4Mr10X3nPVUMxVtWMsTKiAGDID0mvcIgZwum1DtCj0U
         nV2cQB6wImjO3tlrE/cV2/DqOsaTlwCbhwGeBvr7F8rxAVIYfqMAtv7vs88ezp9yxzpL
         3KbFmtg3fzVz/ztLBIUTLtVYUyLjDZs272QJR2UVs2KDizh6MCAGibaYIQ1JZtBR/6Nu
         //uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557278; x=1776162078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4b2KJgsDgGll33udp3PExX5zTeYtVJMIJBKEnalk04=;
        b=jh8rW+tHF95gmgu96s/EJ+3RfX4hLoPbCf3lSoKYoGIGrZeaY0L9+3hCxP9UPr85nj
         DJZk8HaGORnfp0W9PTC48H7mf9pkjy2u+S3UuSkeepBH6E9SUC++pyI3dfb9Y/W4n5F9
         7TeBZVdMr7HLbP+9AJC0yT1GfUJbmnuwcRgqT8lfpCz19L5xw/2wznNOrpB51P8hRcYD
         ykAQuIx4KWJ2TfhgEzeiagK1FtM9Y/dm5jpKUYK1wuG9oGcTYKzSPL73BCqd0n3JXP34
         mRYSkEVlWsG3osBw+gqHEqGhTG89S9nSQaAR4pWJ9MM6FyQzUB27dudGeOD8h4AoZtSL
         KXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557278; x=1776162078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I4b2KJgsDgGll33udp3PExX5zTeYtVJMIJBKEnalk04=;
        b=aNjLEjdWSHTw7SJS1jNNC6sHnzNmGUG+Vxzm5Z36XSQ8i3v1UcsrVwMwU8/iqDjO4f
         sn9hE/cPT3LeRH6AigxH9jwzEdoHyEyIZXZQqkdffduan+G48+vtd9goOSvC7Hrs5uiY
         UsKk0V+EhJO6UVGDtL2buorzu85JLneRVJNx2lNpblXuLwDDQzssZAO/ccIg43KO7U3Q
         37ZW9tkFBaYiOqxK2GwK4sIfPG5UOGqXES6mwtz8XuHGkMH4ZqMOv/dcq0/6lidJumtY
         IenGsCMP1YHrPv8kIXn2CqzEf4Ca8OUFrXctTgIvhUGP1Qxz0c6Zun3/w9XlLuG2Ota9
         TcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAgtOG5h80ymd6zHmJy9VZfnklt3UEI30wdFtBuB4vLzVuoQmeeFo/IpNMAWRwdXRMmcoymf+VtT9M+EMe2Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhPNWyd/NRXkZcTZ8UpYJ1wNy7/N/TMPTisg72CJ3/KIrrpbmd
	fB7yEkDQXIgPqJA0hnI2MGuTMbTxhQFNzEBIG67yRIt6/+SfdzZbEfljgE8kjHn+8XSHvHNoh29
	pKqMDuhZjIqSXto8KeHfpwDJkYRahOaMWZm1WKNzYZl9VtC22ZvO8IdjN7Rvt7XE+Derh/K7lP7
	M+vTMur2A6BAdvuFPjS8zbJWcz+2vdzt3eZXgTTAEqr7NnJA==
X-Gm-Gg: AeBDiev/1rCKUx9KfDi2Hox5N09wlwE1L3gzgYXX8yDsgpbk+KJpn7mwzlGRG39UYtc
	Z6FxLDtK0jxkZAVGSxRoLjuYvUoVg3EoIlEEpaegJuShG086DXQW5/h9SJ1X67cXls3wYLKYH/z
	2R6W38Z05mkOsrYAT4Fxd7xurwrsC4cHGpRqenUXA/6qtN/12f1XUhbp6ULGqpgnIeFaNuBwga7
	z9sPrw=
X-Received: by 2002:a05:6214:2aae:b0:89a:14be:4593 with SMTP id 6a1803df08f44-8a703d214f8mr270574136d6.35.1775557277921;
        Tue, 07 Apr 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:6214:2aae:b0:89a:14be:4593 with SMTP id
 6a1803df08f44-8a703d214f8mr270572536d6.35.1775557276699; Tue, 07 Apr 2026
 03:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402102953.2984284-1-mayuresh.chitale@oss.qualcomm.com>
 <64d44f37-7d31-46be-b9ed-cc86969777dd@maciej.szmigiero.name> <adQ6_MyjhnpJYJ5H@google.com>
In-Reply-To: <adQ6_MyjhnpJYJ5H@google.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:51:04 +0530
X-Gm-Features: AQROBzBc3NsMNpcx9CW-oR8ilWQ1jtDsR_uRyyJ9VQlCxouo5qJCi3l9Y34FMHg
Message-ID: <CAHuiULCkHojN1QEb7OSL0rozL_wYpw1Xts1pVcThFcDaQg3zqw@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: memslot_perf_test: make host wait timeout configurable
To: Sean Christopherson <seanjc@google.com>
Cc: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfX4NYCkT5a7Ilz
 wlPSjhBVUXuRrWcR/R+Jwz/uyFI/el9eLDo1a481Hdnky2wlG4Cd4+gSJgcAg6uT21MA1RZw9fi
 cwAWwEYATanoSu4WHn6ixrp8udgvh3Bd5HynFOYQwq1MHvF6xJ9e9bJoaVqEOwf/SDAilPVVuPF
 TIgoO/2rrJ5CC67IOncxqJQnOOrQMHFWts45P/pFeNczP555CYl3VmqlEeV+3NFdq9thYME2d4I
 9dRzmUK8WuvoVSdSA/yFEcS+4NNtXxXb3gcYaz/ILE46CagQVIJyU+ZgF46SynMsHBZyoFDMmkZ
 eW9rvpeZne3qYv7dggOsLGc0kEcl+F6wcW/HFadSpf9tBzJludIin7Kq7w9JUvdVnMFryHWn3aK
 /Y2ROu996sAox0U2YeJ4+Mg18PtHMOiZIGayse0wNAKdn/T7wBW0HA4pWX2/EfzF5322hj8hkJ6
 ddLm2U2y0lo5MdD+hSQ==
X-Proofpoint-ORIG-GUID: YGLfbL-Ihh3UU4h-PV7A1CT1_zYsmPk5
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4da9e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=bGZ-ABlMOwxLtTgv92gA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: YGLfbL-Ihh3UU4h-PV7A1CT1_zYsmPk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096

On Tue, Apr 7, 2026 at 4:30=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Apr 02, 2026, Maciej S. Szmigiero wrote:
> > On 2.04.2026 12:29, Mayuresh Chitale wrote:
> > > When memslot_perf_test is run on qemu, sometimes the RW subtest fails
> > > due to sigalarm, indicating that the guest sync did not finish within
> > > the expected duration of 10 seconds. Since the current timeout value =
is
> > > itself a bump up from the original 2s, making the host timeout value
> > > configurable via a new command line parameter. Now the test can be
> > > invoked with '-a' argument to run the test with a suitable host timeo=
ut
> > > value.
> > >
> > > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > > ---
> >
> > Out of curiosity: which KVM-enabled setup takes more than 10 seconds
> > to run that RW test?
>
> Hmm, I assume "run on qemu" means running in a VM that's fully emulated b=
y QEMU?
> That would probably explain why it's so slow?

Yes. thats correct. I can update the commit message to reflect that.
>
> > Does it have like, multiple levels of nesting?
> >
> > When I wrote that test I calibrated it on a mid-range x86 machine,
> > where one iteration took on the order of 0.01 s.
> >
> > 10 s time limit per iteration is already three orders of magnitude
> > slower than that.
> >
> > Otherwise, the patch looks sensible to me.
> >
> > Thanks,
> > Maciej
> >
