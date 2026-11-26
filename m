Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670211;
	b=udQ345VCm6kY2kSfWYQ3xGRnuIi1VQNP7b7+9D2BTKOsJOerEhSx5m6fH08l/Ws8cHfw
	 44WIUJj4Cw0NHQhQPKM9IWn5e3tHEFm9a48KKLqaILckYkJ2ccom0+uloohzXF5Adgl5o
	 99hCA/0B0Csz+EeicvXZ/gXC9K+dLNUw/v6zXq4LK9WIyT5xnlogOPETf7bXz3gxxYm9g
	 WETRhkc3/msaYvobmP3YCh1hBdKeHip7vVeTH36nCXu/aBea03oSLm+CvvlC5kC8IgQyh
	 PXtmwXrBY9MA+UBeSnULsUZtDQwQRfsFrZPE2J4J56wMbSAipclfYXuAQbsBhJ/ermA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=;
	b=tmtVI+5x+bb9F2E7ae5KZ3YYqUivajh1pfcY1T53XVpXpZZ3TbnJwk4mSZwBx32VO9zP
	 3tIrTQps2nhldT68Vw0NVnRWSyXRKV85Bmij/m9qph9W1GuaQxwwBKQi/GzFJVikKPhsH
	 33+y2qBiFqKGdZA74n4eHJe+36dKTqYIB7LN/HkyMh+nVJZgC6a4qlAdQBYEAbBetRZPz
	 yO/vgbXukom7G1E9FQ5PAp6CYN62Lzk/0APln0kra/TjpIN56SDUEdeRpeARwAYHtUtcO
	 dkk+GGN3yUiKn/QMfHq8MFt3ZeiVunbGAMLV/g+kSB6DlgrDfVlVyOsbu35EyTU5O6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OIt53Uqc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5yl7FDM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35FB606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OIt53Uqc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5yl7FDM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36X9j1647654
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=; b=OIt53Uqc1f+vMeFJ
	KhHrCNpnqug7fCwdv3e7ahd6S+nqP2n8UKF6oPdTH7HEy9+u2GykII0kC/xArNQL
	S+VnvJLTgqVkdjiEV0fq0dpmqrq1rVlrtGoE826TCmDV9+oZG6Sbm2HXs21xdcU4
	AbJdkOhUNHt6f5Cyd9esvXBSuHdEFHfF36o6ddl/+x96WcR8KIBFwX2fQevVaXDA
	5XL+HP3OgfKqHJKegjn0pu2ev+Qoqzt7V53O2VenYhLZU04AuTDziRC6PJnpIC1Z
	SVzfqfP2Pnj30h0nTfPusHTGccI7r0Ad1NNbJDW85o/Nqsj7wx+55jvpzxrSFfMj
	Pfg6ow==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahttkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:16:49 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67dae919cb1so9585201d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 21:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670209; x=1796275009; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=;
        b=D5yl7FDMf9fv8+guvb7NM8edWjQYAxjWFHoCpF9u3BJZk1aiquebqHpZcNuPaRsxET
         eOtDr0SM/Nn9GMT+8Ja3I6P0LZ/I87g/J8y237L3N+gqqy35tbj2TFfwi2pnQ9sQLHmY
         fQNbdXCKJOu2vyGs+8SrHJo6IQovJ7dVydxxWrsQOHWEyPetej7myGPzxM4/220aNsif
         gSGv2yCETSjyZZIamvQDjq00WgpniogclcVwTKrA1ySJUUt4dV5nd8rM5VE8ttFEvPry
         n1mlPPmjUDDp7d8381f0dWbIE6z0mQwy8X5ULUSQQ50FmxYPPa6DudDUTNPLpkxBwL2L
         tMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670209; x=1796275009;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=;
        b=d/2TAOqsi+PJhOc/yS8tYdS4Dhi2yr/+nioydRhCINg4XoPBMUTsAXiCgv1M0HPWT8
         BMFEYPSwkV5qJee/ne/RoidV98OpIJk9Hvu95X4UxpLEMkiF8J7WGCK5Rz9AhFpXdwIv
         NcnHXrFLTWCbvfcfGiFvAEdFkn7QK+AIYNgfu68SoMuRnyNWIeehMSrzWglZCAo5AxIn
         BZPBSihcCqlBrIPfTCjSpL6aGHOFXX/y6Lml05wjyN7o2n1iYfpDSrlzRmpdc7nBC3E6
         IUC1+aAFdCWh2NfvT+2PMf255SeJ+lYJfB1uULvlaiWxrb7OWaoVZN32CN757C5aL1k+
         iFWA==
X-Forwarded-Encrypted: i=1; AL+hErFuAmI+9aYCGBgyOWQBAlQ7XNseQcrzOSjjZgS50K+FkGflKcSrsYNhfimPXeujdDqtiCi901QqYgIFQJ8mKeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qgAbDkmT8g5syd2EtYNV+L0PNWq5OVFXzEzOfGU2q5xg/kxdu
	gDtNuprmfbinTLzRrMF1SGf4mvA9it8EBZm2cIQuhLkXhYVVIQpgXvFn0SuXHqLISCGYYJcAjEB
	gsO64f6gmXo+9SrShfgOfo+HpbJvgPaznjoaHZm5B4isDX+zzIdsmoGIPqhISbdcmSq5CAPI=
X-Gm-Gg: AZFdTZd+gs/x+kV2uKEa9B/cCZqelrascXCaYLzGIP1E5KLEYg57e02iqL3u6/HirM1
	/8bdubO6rjoCBu22GQcXJlSMmLJN1ozIwj9K8ddVyN5Ig3htc5CVVDFoIjAFHISRgoD5uISwx24
	o7xF3iJdmm8sBi+1ZHuGWKkdFQIzE+Vy5F7Ag9GnRJyCVKVF+nFwNwfPZIoUzGIiJFYFHDGAu3D
	VxNtgLwZjx33jO5phz4YTn2/x3gPZjbeOwg5j8dzeHcQPi+jh9jvdf6kB3HVv/yJ1HWUtRYI+i8
	sWDaOSEJQBJ7O3P4S7hRVavc2sqVLi7GaE1dfqL428zdc8CNgL8Ih9DEh5okZRWv7/6xez7N5C4
	JODz4NhHb1qgY315aFRdG7I3S54bdfaGKlMAmRaA2KGGHJiCiUelKKNuS+29eN5JFrdzfFaGUHb
	l3SHYujqHwKQ==
X-Received: by 2002:a05:690e:43cf:b0:67c:2ae8:dc65 with SMTP id 956f58d0204a3-67df44e4e20mr4709802d50.46.1795670208713;
        Wed, 25 Nov 2026 21:16:48 -0800 (PST)
X-Received: by 2002:a05:690e:43cf:b0:67c:2ae8:dc65 with SMTP id 956f58d0204a3-67df44e4e20mr4709789d50.46.1795670208139;
        Wed, 25 Nov 2026 21:16:48 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df31fa545sm9644255d50.2.2026.11.25.21.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:16:47 -0800 (PST)
Date: Thu, 26 Nov 2026 00:16:43 -0500
Message-ID: <4ea9d48592dbf0e1120f7db7305aae37.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v9 1/4] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
In-Reply-To: <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
 <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
 <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-GUID: N6NmI3jSsngDW9bCpH9iZlwSNb4XAjGE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfXxOa+poYpe7nM
 D9IDEZDlo8mDnkcyvwRM8NkWOrREGui9Bknrlumt8WbY8AkAsnx+2WVWxszfm1ZuvFh7C0uuqZ2
 +YqAxF87dZps/dLc+3WH2PKK7II0z9Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX3FKy1RsWj0Vq
 0YrKpXG5zWqxFGi4OPqcqC4i/0mw/wYNdu509zNqJwubZY88rDLTfGsR6Bti8LNzMML2Yz5cWTl
 rZCCzVmqlc8uwqDEJysKFmonL6HkD1dtMLiKQ1HycK1e0aJ1eLy7b+OUahLL13tSa7/nAByzV6p
 /bX43ATTGdEOIkZkfXSyQXTndp/Iqvbww7hB6mSN2LDDmdfc0AA2vetSI+aVwS69iwNV23oYqwy
 V/G6s2AiTgvc4C3R+7iuKEJAtZdX4PEKM/V6kYestgxPDvj1fi6wAxddpbjLeDIUF87zIVQI5xE
 AwhIppT/zwGl7KenY2a8a/WLwy32hPVr264O2pgVeZNsQJO4qa+uJg+OX8nWv5vwW+8vhsM8ADU
 swaAPSudIHvH6mKQ+flzZKtn4t0D3CuCvCIOflg9itYjc/GouzMSJXfhGyPqj6Y6XBpx1E93ikW
 Y+/aRYdp0TnTDsa+3nA==
X-Proofpoint-ORIG-GUID: N6NmI3jSsngDW9bCpH9iZlwSNb4XAjGE
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07c0c1 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xvfqbYfxAAAA:20 a=KF8kK5mtAAAA:8 a=OGjWj8McAAAA:8 a=IWwISAFmO_-9T5kqGVcA:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=zNK5Gj0fNQ2RFkdt29ku:22 a=UYjydHh6ynBBc6_pBLvz:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

Hi Icenowy,

On Mon, 09 Nov 2026 23:56:47 +0800, Icenowy Zheng wrote:
> 在 2026-11-09一的 07:47 -0500，Guodong Xu写道：

[...]

> > +enum {
> > +	RISCV_ISA_BASE_IMA,
>
> I may have missed something, but would it be worth to add a GC tier?
>
> I think many Linux distros have GC defined as their baseline.

Thanks for raising this.

A single bit for 'RV64GC' seems to have no user to me, so I would
prefer not to add it. Allow me to explain.

G is a combination of extensions defined in the early days of the
RISC-V ISA spec: the unprivileged manual defines it as an abbreviation
for IMAFDZicsr_Zifencei, "our standard general-purpose ISA" [1].

I checked, and you are right that it is the baseline in practice: GCC
defaults riscv64 to -march=rv64gc, and Debian, Fedora and Ubuntu
(before 25.10) build with that default. But my understanding is, G is a
build-time baseline only. Nothing checks for G at run time; on a core
without F, D or C, an rv64gc distro userland just takes SIGILL on the
first such instruction.

Anyway, what this series intends to export to user space is the profile
level (RVA20U64, RVA22U64, RVA23U64). For example, a glibc-hwcaps design
can fall back to rva20u64 when its run-time check finds no rva23u64.

PS: In those terms the counterpart of rv64gc is RVA20U64 [2]
(excluding Zifencei, which the profiles mandate only in the S variants
[3] and which, as noted in hwprobe.rst [4], is not intended for direct
use by user space).

RVA20U64 and RVA22U64 came up in the LPC26 discussion as well [5]. I
would like to add them in a follow-up, probably not in this series, if
the reviewers here agree.

[1] https://github.com/riscv/riscv-isa-manual/blob/main/modules/unpriv/pages/naming.adoc
[2] https://docularxu.github.io/rva23/rva-mandatory-extensions.html
[3] https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc,
    RVA20U64 section, the note on Zifencei
[4] Documentation/arch/riscv/hwprobe.rst, RISCV_HWPROBE_KEY_BASE_BEHAVIOR
[5] https://lpc.events/event/20/contributions/2626/

Guodong
