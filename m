Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EF039A052
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409797; cv=none; b=urfXJ72ikzFn05yirFw6toKtgJISpuTwGNIfRPj9dUtnVdRzPc2O62ceMBuZSk2T/vH9EVCXHOv30cYeNri3zKvemaSjCu0JdhebD0nUCj3Hxgq44or5UDvXl+6IAJpUQI0sz2/fXCxFLgXHNmOWY9VaAO1GfTKokSxxfNPOYS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409797; c=relaxed/simple;
	bh=AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QLg2poPwx4uYsTuiboCXODA/O2DX2jw0JWreeKez1kUZ5KanwfgCXx9liWN/WNrd7o5a91Q+ukJOLhDECY/01yG2c0mnyzRuqA2tTAw7LzsYeOY+u4P24a7eWKMsKGuQdwAPWI6arV7VflBWM/1n0lBc+vdTTfUoxqy724UlmmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwa5/QgN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1W82cb0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwa5/QgN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1W82cb0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDnRc5238441
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=; b=gwa5/QgNmnjGMtis
	1DLfyxp4IOGciKAHlnvjwVKArh/JmfSv2dzbFD9PsC9FOok6BxWUQQKm9nn3YqLF
	sgPI3FaOqQokp45U2VsAjcbRK5D8uIR/U6TVlzsilmdYg8iUGAIqsPO0at9ZoArs
	bFddhUpzFxBwFaDPrq2CP3ZgZBSbSyOE70pBsDW0txkXhTeFhratTt/MPA0cOLcn
	bcmUpbe/+jPeHXYhBNP42KsGooXPmEnO5XytciLNTRSebgXIE1mD5o20t1eTz4Ys
	Z5FGrCMokCA0rXX5wOEfIEhAUW852wp/oGmy0hBoZTTBDs0G2DTvKXxIJn+0drUI
	ywqqeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d9bn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:49:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so1386877385a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409794; x=1774014594; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=;
        b=D1W82cb06JpmJC/poEewcnF80cNox/c1GDudgDi/PI8wfqu2zRttXJw7Sdf3DlNIi7
         YC/pvKm3Ikd8XIgmbORqrVCn/msFfh0jkmVxusprvz1OSDyTfjipkJiSPPARZKYo+00Y
         f+zcqbPYtmom0LyKjG23dnDDx206ZRr42zQ7igouxMMu9fkjYij1eYaoaN9gXNvjxXmL
         qL7SSQ+8X+VI5shnMACtgOApUWPpF8jS/7RrJoziCvkraUvcNdqls46+Jji5n9n39KU6
         +55p3/CubzsovgUg3SJ0YXlRJyFxUhTkmRGi0YFrFdUog2aLizLRIzgWQjogE/rvHbe8
         7ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409794; x=1774014594;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=;
        b=eGrbk77bxyOyA2GsuTqijuZcYJkvgXF/Vzjyg4x+cG/JP1B4A7uzxomCT3Q9uxWYDs
         lBv6zEcF5YCM6aw9AK0NckRq3btJEqYgEkwdGGVbF0OMdhhN5Njty1Owg1omO095UmD9
         x0O0x9mkveXC9bREjGqO7A9snnOfsZf0JDb5hJNUU5ONPyyFhtrUrhpbiYOpl6oIGX2k
         yNjAkrdNlN/CQpPmUc2c/8JTxLSpnQOSAdE4V5zyWziqL4ufjrPIbQjEjQRHEbQkcr3L
         EhPXRCjhMn/MFPXbd8LRvWrLGgiX3vXKFAAsRuqQvRnGQrsqkE78RW8Mj7AA4LNgiNol
         x3EA==
X-Forwarded-Encrypted: i=1; AJvYcCXNHbnMzkRNiXhLIKKMxYjd3+jAFw40F534++mzGKbnnMy2DcHYBjmWC7l64aVDbiR/+pUU+7WQfhhSQPspc/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8H4IHQMTkVq7/Hsx+6zPIeMJbvaOdrT+NDRIJgjH3l1msQa3b
	BOCmmQLN1hbp4Vc+gN52kYhHculWeDMBzGzr2qg8axNaaSokSJ/prRmC5+ra1bDxuUkVP0fQXyF
	vDYLrUbTDmhR7w0DBQZTFZgjyHwApybxr2fU8GEpmN5xKWf9Nsl8MAf30uuyTmtAhmQ2Bzhc=
X-Gm-Gg: ATEYQzzKnh6ux285HfTRj6LQp5L41szPhOU/HSGQKqpsz/1tjJ6Ft9xeTPVmgs7W3up
	31PxdCFGTAwn0cTfILRNmL34cFITPds9Ir9JLRKTC34mYB2kdm5TjKzPs48mHnt39tlQG5fqWaP
	lbAFAjTQ32fzxcT4BMmv2ssGjtXIgQVMFEA78+GoBgj7iwwT6mXBJokNlBS04VA7rr7Kp5fWujh
	gSxI5GpsSBV96wB69WD7nU5fB6JzqCHttfim3eRi4d4Op/z0hKqdxrtgW1nDTCJkxtVCyjobZWM
	4H/938EnlxVMOGoG9wQ4dpDVoijkCKrJ0tgHSahsDTF4GcFmpIgvid8z+zLgvlv1oQOQX6j4ArN
	+2sy/mLyYGq6WBTn7DzOZWvUIe+WneOqenYGMiw63Qezs+om+RR9UypPXFZ02
X-Received: by 2002:a05:620a:5dd9:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cdb5f23b8bmr310878585a.44.1773409794198;
        Fri, 13 Mar 2026 06:49:54 -0700 (PDT)
X-Received: by 2002:a05:620a:5dd9:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cdb5f23b8bmr310876185a.44.1773409793700;
        Fri, 13 Mar 2026 06:49:53 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778d268sm29514875e9.8.2026.03.13.06.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 14:49:51 +0100
Message-Id: <DH1PAZDT90GE.2JU59DI89M0UD@oss.qualcomm.com>
Subject: Re: [PATCH 07/27] RISC-V: KVM: Add hideleg to struct
 kvm_vcpu_config
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-8-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-8-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: shhKh8H4NZitJcoWEsiJgyYT2meqbR42
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b41603 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMCBTYWx0ZWRfX6l1DqHsG6ZB0
 svN8NC019OlM1ec9XqhNLDMXSZ2otSV1TfqFkD/ZHQlMn/ChMn6apnhQfNgu1ju34I8qQXwq7Mw
 h3nxmK0hqqrgPxktAASrc6+XJbccByvIAa0JzeYZLkxSfD9JDiIbF/mwl+N600XXjTZiq6mq/+9
 +opKgsTt3TRz5Qc88QbIOCx487uEUr+WJbvvldETV5ac2UKZJpa9NmqKCV7HXLUFo7miBFwX+cM
 ef1fc9qDPnCSloCqwIvBCpfcZbtHaJxtfiYx9cQvWnbOjJaiOhvnEUyqnuIpX5nx4z87WC/m7g5
 wCmymrusI41gwNFpmYnS8Mei1lYQ+/FLDWb+pPmUJ4MdePdA56MxoipbxtaeC91y4UtokZ4om/q
 ZHJdJnzCcjCm310KpD+4hbsXv964e5UDpC/EHMgQ0Bv1VRvACcUyWpLDqvnZqtoWGWo4vte4RRa
 mRnYtwpVnnMw8DV5DlA==
X-Proofpoint-GUID: shhKh8H4NZitJcoWEsiJgyYT2meqbR42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130110

2026-01-20T13:29:53+05:30, Anup Patel <anup.patel@oss.qualcomm.com>:
> The hideleg CSR state when VCPU is running in guest VS/VU-mode will
> be different from when it is running in guest HS-mode. To achieve
> this, add hideleg to struct kvm_vcpu_config and re-program hideleg
> CSR upon every kvm_arch_vcpu_load().
>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---

Reviewed-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.com>
