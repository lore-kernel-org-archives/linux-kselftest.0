Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119855;
	b=P++yhPIQLuXAHpFlZhdg1IsjP5J8EfjkwAdKSAUolxVJVBeRB1R6KiQq6c+RniIQQL1v
	 EwSa3MdaN/ZTEzdEy+hkuHWvcqLOyERJfYVs+PfpwFWgz7hSle198mkoA7Bei6lXVm1R0
	 SFC81mrnGvE3YUo6BCSsaA2ED+CaHTsIK2YB2ML1y54LKkcSQnMd15Kn656XvE9VaXJ/M
	 U794hJK8RUH32GQBLE99XmLamTJhKW+IwOoYHvyCzp0sJn9T1KQ/utG7XAOqIRTTHblLx
	 HogCbJdpD6o0qIuifF9aGtGqJYAydTZWakZzMfRCTjrdYGMD+2RCOmUeFPS3Pmp1PhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=TNVT5SIENBUHIp7NEAsmxJXryvr6yV5ijHD5gywhn5Q=;
	b=HvuTW91WWVHcdXLGdqQp1+jncEA6iMQvLs4uaOUmShO7RCyTAX0qlKuOQ/mE+2/lK9Il
	 3c+b4s7p+JzVvAA8l7kq8DB5mwzKN3gStOYB3Ix9lD1kLgDdExgijwZs/T6yNSSQRa6fy
	 KcsGAlU2tPY79R7N78/xzY77hbVemv6NVzU1U2iVo3ZcId+7Oo1hiA8ZXJOXwBUr4KMFU
	 3CRQQncpWOBdo/lFfuaERwH04pSl/uLa7z2i7d8aBSg09JMiV4eCAKD3bAHDmss49x5xf
	 hfXqk7f34rsBI3idpMLYjhEcyH+oB2p0fdCncjD1Wlbvpl6BuzA2jIvKpW0IWULZOSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CvGazHpM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B12606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B12606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CvGazHpM
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDn5E92906702
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 09:50:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=TNVT5SIENBU
	HIp7NEAsmxJXryvr6yV5ijHD5gywhn5Q=; b=CvGazHpM7r6oRX3bfZbviQcSr1N
	4E0Myd1oOxoHpURR8O3ygO/Dpk/n1BaOz19buAwlnVLr0933AuaeEvpDCFHFgYz6
	abeMKNuKfzjQowKx+jhyOIDNoHJxkAcx98V9472nirEz5YyvT0sbM7FfdvAjRys0
	myg9dJmXQEXflfKncql+ipZFqVziwE147BeO3Mf+MZRkZ85jYo0DUmrHYwzFSUTJ
	fuky37CemmmW6A5xNs+7SuYVHono0IQjLn09R2nqGqXdEjB/jtzeZIdsxjt0ZtxA
	1donqVG410NYAK6Gju6/OsKk5vwG5hhXUeThTDdEFiP5RIa1aM+2sYN+e0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgtg6twx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 09:50:53 -0700 (PDT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so76571435ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 09:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119853; cv=none;
        d=google.com; s=arc-20260327;
        b=MFTu9FOHPC+nd3sCZNEr4n1kHdJeQOgWz1ZZJJp04PhLXMJ8kvdpeIwUVMXkzQzE0Z
         lTmR8Kfyd2qe7SB9qK25ffV9v4Tf82a0XdLkWjI27mYM0fzdWVqe3b/ThQ/J0NxzGPB1
         jAXLzuYZmDj95UcjWcJFHEUkcCTeqpMfYcIhCRNm1TLsQ+Jl5coI9Rwz1ZYewP9DXgSH
         PHnnWF97ROwBLwzO/kH1z4BjU0wFt36Yp1H5LmWYgJeGLqXi5Omo0MLdIdv7eKrMM+Q7
         IaQ+yheL1PkcfZjwRQqzc/2qhGFqg7RJMCFDLGQxo1TqNqaVCII2qnYht13ZVU+tm/KF
         VA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=TNVT5SIENBUHIp7NEAsmxJXryvr6yV5ijHD5gywhn5Q=;
        fh=/dLiV+tWlWVdttB6ecOy1iVGLitNhouBXEtERcpZ7/U=;
        b=cXp/Tq8Dz/ZEz5c/cV/iIoJa34UX9a2JkeEwQSjnHVQ9rgkJRYuxZ0HiQlhbWXy/Fj
         SUNFqgwKgKsassJk9PBS5mCnybPhlAJzkruvVTXPBL9sGQ73PyJdV6TpIS25ombNa2yi
         ZCmt+YQ2/OFJ+kxxeBATMKs5IvMk5uKCd0z3xma0V0iyeAVkk4pcQZiAFkhvRxyaIbJm
         quXYU8kFUYDGDv8WU6g0DFIHhqQYdVUdMfRIeVgjUchGZrbSPcYRk6YKaMfGnxe11EP7
         uTal9ATAryTbNjifWA5nPF0F9TJ0fF0IE+otYS1T+qN5Gdxf2hmNnCIr8sbVDZcpYykf
         duUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119853; x=1793724653;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TNVT5SIENBUHIp7NEAsmxJXryvr6yV5ijHD5gywhn5Q=;
        b=YUO1b7s/Q6MW/uBh95n8/3UHUj46DNQZVCtxgVqG+vSHy3rnOC4hHYe+XVVd53hmh3
         jxEfg0pneMdTtESA534r3D96ZAV6aEWnMGLNf9hvROSc0ulvQfqPur7n7pyL3AO5ktV7
         wwvlUoKpjr0+GSWCocKyFp1/fagxFHr1VrForv3dup8NLCCLf19yqgKoxxhSuMd8Gcko
         o2bRk97tRsAbzIg62CZpzb7CFZwhPgUDsCwxdsCnGFz+Naz5pKCeYj200RyqSh4C8Dq5
         kDQkhTEGC+pN+RZlWGaDKzR+qmq17bVjOgERrpbRvFZDpU5le0JYeJ0r7e8TE4HoNhwI
         r0lg==
X-Forwarded-Encrypted: i=1; AKwUvBxMFhkMi2pzo6GOPh4VCtGyyQZpLHKxCYbbx2phI1W4qYYnu8UJ7qyScpzIt3CON8Wz17uuL/trL614+60xLZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYISbdXrRk/Th99oaOABfV0Y9uee/Z+tGDePpuzlHPhNb68Gf1H4
	UvPvWlfZezIJDYy8Y7s3jj4f9EEpEWC3W+9FaQ0WUGD3ms+VgbR+5oMHy3j2sOS0NbQknIqmmYP
	/ElaDzenlwh7C+QUmaVApE9SmVW5FVG38FA117R2ybxNgYtEOda6RHHYqgn6aGdW67z9T+21MYl
	AIAiB3BjzQu4FKpKcwP/HZehMmo+aoP6aIdyLQFyR0KMo=
X-Gm-Gg: AYBFou1vpHNPzg2QGEOZVzP8JvqyOmV/ZMeZXSpZEKVuSeXeDVoQwNz9BUOUVNWI0g3
	g73eidw+UUj6lX/GRT85zcIFlLZZO4g+ZHozgjhLMDtI7fQOYbsc1q4t7qVz7HOuxlyUzk8+XPw
	LVg4LvkCEmYQD0BclwKjJYcwN3nSCO+mmiTlrSuOXxeW9BE1mGNKvkBtgPbRNCiD5mYF5488qWm
	2KysVBo3E2wHqXaX098L0e6mrmFIYQz
X-Received: by 2002:a17:903:2c0e:b0:2e2:c995:b00a with SMTP id d9443c01a7336-2ea9c83f0acmr97399225ad.48.1793119852787;
        Tue, 27 Oct 2026 09:50:52 -0700 (PDT)
X-Received: by 2002:a17:903:2c0e:b0:2e2:c995:b00a with SMTP id
 d9443c01a7336-2ea9c83f0acmr97398875ad.48.1793119852321; Tue, 27 Oct 2026
 09:50:52 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023234640.1459291-3-toddfreed@meta.com> <179288570143.3134.8925369868949382653@kernel.org>
 <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com> <DMFQ63T8HLVV.3L1SY71TO7GHU@gmail.com>
In-Reply-To: <DMFQ63T8HLVV.3L1SY71TO7GHU@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 27 Oct 2026 09:50:41 -0700
X-Gm-Features: AclHuK-jcpXRH06paBbeGResR_5OkEC2X2pBFWTmfK1GHPn1XqyQ0qM4p7DKnUE
Message-ID: <CADh2yMyGdz8XR263w9PbMf+pM1MvNh015CUX69NdYCMfjFnv1Q@mail.gmail.com>
Subject: Re: [PATCH net v3 2/4] psp: support ipv6 extension headers in
 psp_dev_rcv() decap
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, borisp@nvidia.com,
        saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
        mbloch@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        willemdebruijn.kernel@gmail.com, horms@kernel.org, shuah@kernel.org,
        cratiu@nvidia.com, raeds@nvidia.com, rrameshbabu@nvidia.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bjorn@kernel.org, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: AA5kkPdf3LaCS-jHHGh5fEKle2lANcaM
X-Proofpoint-ORIG-GUID: AA5kkPdf3LaCS-jHHGh5fEKle2lANcaM
X-Authority-Analysis: v=2.4 cv=OJqyTiaB c=1 sm=1 tr=0 ts=6ae0d66d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=YJpWPkmKExx_aQuJnOoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NiBTYWx0ZWRfXz2g7hCqISIGt
 ZLmA80Nth1jp+2kRMEmHyP102yAOcgiqMvH2utNPDcYp0/mO7LUEIkcG2Y2K6+6WfNd3AYyYwnY
 /21zmaiHleTJP3DGUjPSx7gETObZ7Pwf63vc0PsgpAZRp84rnZqx3OGZdbw0C0PyzMvkmzyLe6G
 SPwKXLqh2cLJ8IZFWMYlb5js7tZVW3dm3ZQCXxDs7wyeQCuwq1P4l3WOBNlvOupWfIH1DFJwVjB
 F/DIKCrAWP6so8PF1LuwghUfBka4uFjO75nixCRPyhS5m5Zor+QEnb+PxUQY7H5rxGfpTTRzU4v
 fbA6573ksuR1MoROeeiPLc0xZC9GeGDapLpc9osa2bBEUGj6sxJcWn03NS0RSIgx0hb7pKhaQtI
 srZTjAtgOS4nzmEb89/2y+VHQN8RtjxwWeh4M4OteSFEwLzaHNMl1+Bl8MXtISlJG7+TtciC1c8
 c+ZCpFjiqNZw5tmKwEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NiBTYWx0ZWRfX25t32J4y9UOa
 of75H1hdaCm2MJrhvux82rG3vDnTAdFMQPP1CvuHoqRogLInluXpTMYqwOLBk2ffiavtx971e/P
 gddQYlfb6U27MfQKdj/C4+CCQVtyw4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01

> >> Before this patch, all of these packets were dropped at the is_udp check.
> >> Forwarding the decrypted skb itself looks blocked by
> >> sk_validate_xmit_skb() ("unencrypted skb with no associated socket -
> >> dropping"). That leaves the ICMP error path as the open channel.
> >
> > Agree with this finding.
> >
> > Ok, this puts me back in mind of the approach in v0 of this series ; just drop
> > packets with extension headers. Actual support for extension headers can be
> > done separately from this fix.
> >
> > pw-bot: cr
> >
> > -Todd
>
> Like Jakub points out, this equally could affect tls offload. We need to
> be careful with any features that can result in device-decrypted data
> being sent back onto the network. Another gap that exists currently is
> xdp tx or redirect. That would also affect both PSP and TLS offload. I
> think we should try and make these features work with crypto offload,
> rather than building up more and more defensive checks.

Adding the skb->decrypted check on the ICMP path makes sense to me, as
a fix for this specific case. I am a little wary of fixing the known issues, and
missing some unknowns though.

-Todd
