Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123889;
	b=CRBH3bcYudLQ0kZCtTWDKlCVfiAsPre/XvroGumtsyKtA+dpH4dGMx3LlgaIdFN/LLOf
	 7ygj2ABRRvvabKopNDLk5Bh/ynSM5FK5NOx7nzGsYG2a1d3PxMWivaQgo+jmpNaVhSgrn
	 81fQv7RQMvTrbpjLGTpIRamYlBY6icbN4+2KIQJVVvqxi3h+tcOf+EaReLQV31H8fwGxT
	 2ttAhtkyOpL0vB2arPY098NvKlUpenUBtLWB3m/WF+GfvtyaU7SHRxbKDB248y6X1JNgh
	 R6Togpcgw5cFbIaDg8D/LJ9FzwK+xtCTAwEhfpLbvJcZJnnCCpiVKIbm5AyHH/gruhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=1SLwWY5nhyzce/BMXQZLOCKP7mE4tnUfLqJlnWOr9C4=;
	b=0MhOYQmYSJGaiVtZC2yE782whR+gLOjTGjrS23SEGhodf/W7WdiZN/d0Y5rXyMnpfSM/
	 fhgq4fsmf+UARNqO5vdnw8rkl3hHOGUEI/39lqV2fx0cbRCi6eALU6egDMsrcqYaZ/ocj
	 v9TQuwhGJENTxj+ZvUxot7APX7yls2olZYlnCdsyRGK7MlBTuRqkJjAduDSYL4PP08LGu
	 YJv388vZoSw2R626VyKIOfplTP3y7suZ4wNb0QJBtbVJlbj0Ddptc4ma6qc6Z4yO3G1Ou
	 JuPpRHksqhvB1fCKSVl0Z7VkWDN+MMwVAgTpKVxKC5OvV+4VYuiy022gvE+qVs1b74w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IW8i35GR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B802B606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 17:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B802B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IW8i35GR
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RGwnk11535178
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 10:58:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=1SLwWY5nhyz
	ce/BMXQZLOCKP7mE4tnUfLqJlnWOr9C4=; b=IW8i35GRgMONClqZI2OvdI+YMWt
	lbGNBCfDtJu8Dc/fyucXYPugZHQ8NiMKoVfl37wOvnt1jO8E1i0HqT5KdUOLN9KU
	xzv6eowT1GeapoSuHMktOIYQl+bD6u/tUHXJJAypgqr7uU9CvsbXzTB3tIatCvjl
	AbI2ALTb2EZOdpL+elkTE9SsnhiBeI3nFDjzW4x+47l9XFcO9EmlFHXz1rwzWuuF
	SHS2s+lWCD77gihNNzffxu693UkpGq3Dm5Dn/IoV37REIc9nDbKMbLrDuXzSllOx
	48A8MwWWKGoWl+Fv98Z5xBMaIFaxhn8IQLoo6birj4rZq7EZD9LNbaAda/g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hjv8n2xk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 10:58:07 -0700 (PDT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso192279b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 10:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123887; cv=none;
        d=google.com; s=arc-20260327;
        b=rSW2lhwxv8Flt+oOAhNr1LJc9LRhnCNU7E2bD4OaYY5hEjkFjky+OtGLPbsvNiy6GL
         y4E3JOj82d3nm4A0Bf+nECEJJWQMeKLnZD2yqVDC+nqhpKIUZFupDcCKYoLOrwEMD5q6
         60li/4xu2vv3gi+srd9vi328vAaerK6Cqcxl91nX+EbI6UsMmEzCslqIcA4UmR7Oo6hr
         5SKYNwFuA/+XQZRXyBBBXJaDRNVJr2v1KmnfFEDMnnzg+J50279XhQ+danFl2QHuC4Od
         cHtlymXbyesgHLfBI3Rc2AaqvFd4tzSgs7XyFRxC351mD3l3XybfxAucXf7E3nz5uQTh
         2QkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=1SLwWY5nhyzce/BMXQZLOCKP7mE4tnUfLqJlnWOr9C4=;
        fh=RUAfcNYA8sx9+uz0IWphRYY5wF21KkrafpJ7DD2t76E=;
        b=eSAqCnhm3FTRjYJeTX2BIjz68G7lwPtLSc7qKZtJSvhQrgFNBVj+CXlJDN5s0hCQlv
         a9l4ToGrboFbhDJX7UOjNHw7L0drp1iq57EiKPcTTYg+3mtAaxRBAHhBJqM5wdXQH6YK
         wBQZRMomF54GMmCUw38DUYeJ3g2l64M5telcNRa43fbIEC2FUHuRndLcXU0KjY9CJQse
         F5fcM4AjcYCu7nB64E0461LJKLyviMGTxv0sbw/30oI6D+PZaBkyU4B9rRIGHyiTtrzM
         JrP2LQXx2VIGD5FkLUsehiOblOfm9tbxsoDv0XgEAqhYUEBZnY9bGwTU63GJhzrBaaZt
         BaFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123887; x=1793728687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1SLwWY5nhyzce/BMXQZLOCKP7mE4tnUfLqJlnWOr9C4=;
        b=PyMPdTpSxLaeguZ5QjrIeaYB1iM4GWajPvc6ST6bY4pl8ZfAY9+6Bk4vSKLW8Faumq
         5hnXsL875YBPJG9rFAR3mR/uuRC8JDPvvgXk6z63/NatIBQXxT+4P9bc0v2gZNUouD3x
         G6JNpV13LR7P2GOpN1C2yB+Vk0LqeT5JuAxibUNBUBvpG1Cc0CXcKKfvrW2w8IHLg7sK
         GeN9g+EYrgm1UkvcMicMezOtLEJxjbdxCOcKkN2UdPE5bd+PFOUGDuaiDN7m2Xltrpdv
         qx5Wqlml7aToiD1GcKQ7gaj1mKfjOS7d2YbBp4oO6hd+Qbhob0/7qC1M11jyaFo1fVLj
         wg0w==
X-Forwarded-Encrypted: i=1; AKwUvBwVqy2gHw0lSmnR38p9l9A1NIh+XRKXx6DjCGNypjh7gYkb9ziYxe6O0v92vBCGOd5eAFarV6+MAnlDw61riAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqAxfVrc7/ryWL1LX3zrPcBtTaeWrwA7QqKwPH/FimiCxtjnZK
	IARy5gGK1gI+AtbDGfqR04hDyxKPSTry1VYfPIiusbiIKNI1AoK3UNAWrAynjsjyZtCAi30qyJ+
	Zs8CYJm3y/NIvKyJpH7n6llGED0D5zQ7xWft1uIH38Hf9gPW4i7yrdcqH0r9igYpmCm3C4oyQjT
	C0riSGocQkRvahVFT8z7rwdHIxWn+2ktv5GOZlTZieiPw=
X-Gm-Gg: AYBFou07D6uI0pisb0DV8gUimsQoZnpfTcs/4kydh5nHf55uqeHKk/x98Ykm2dZ5tMn
	MPAlH6x8Wa9KsKx/UvtzXcfyJ0DmY6qCg4CSxu7FZ4YmUQpg37YNJ0Yo+h+wYtDwthcJYnQVDl+
	ctO/N7wYVysRrL8Cx87cj35Jt/OfGuFsmUHU03iritU7Ux7IH0ZEYt7mcrqremIDGbOWAy5VdAU
	miQ5RqC2EQ5H1ohrTpjsDyxjf72SHM=
X-Received: by 2002:a05:6a20:7343:b0:3de:505d:d77d with SMTP id adf61e73a8af0-3e90232b771mr13651637.15.1793123887280;
        Tue, 27 Oct 2026 10:58:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:7343:b0:3de:505d:d77d with SMTP id
 adf61e73a8af0-3e90232b771mr13625637.15.1793123886850; Tue, 27 Oct 2026
 10:58:06 -0700 (PDT)
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
 <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com> <20261026175805.6d4dcae5@kernel.org>
In-Reply-To: <20261026175805.6d4dcae5@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 27 Oct 2026 10:57:55 -0700
X-Gm-Features: AclHuK9a9sPXLGBoQ5eEYEDdm6r3iIivGDQdeIyBtpGnfGV8DBsPe7nWqNJ4q-Q
Message-ID: <CADh2yMwtF3DxcD4h3zevCcmy5vn9iK8sYHoPrjoFPH5PHuNkoA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/4] psp: support ipv6 extension headers in
 psp_dev_rcv() decap
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, borisp@nvidia.com,
        saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
        mbloch@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, pabeni@redhat.com, daniel.zahka@gmail.com,
        willemdebruijn.kernel@gmail.com, horms@kernel.org, shuah@kernel.org,
        cratiu@nvidia.com, raeds@nvidia.com, rrameshbabu@nvidia.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bjorn@kernel.org, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MSBTYWx0ZWRfX/7vcyKnt9c/d
 q7gVaVxL8hD7LwtMWBk1ASPZxQWz0FXH1F50JGWrp1wiL4YIEcUXS4MFdDRcVfZGZyIWCuZUDHE
 Ttk9eTQ/6cWc4h3NDbXtAYWlf7FIQvEjrVwWdlB4vxXkNA4x0QWn0nN8KL1dZoQBje0+vo1YztU
 4qk1h/TCCrlFdZpKqyB4FW/20/qQOb6j/mmb27Ai9jgISZ1qvgqLQTiArqBP+FDY6q179ceov5E
 dNNZ/xoWOdzsqhSfYx+/eLcbZn4MPqIEWd18vQfJRKLz51bKTaxNDcqoPMYj9IxMUiAScB0gNSK
 9gzxVWO8Dj2nRO2EMLotmNfmBFO1Ubh/Wgvaz7Izl3oIzIA2CgcG3vzriAsSMSI8f0UkCh4dhel
 2X+L5j1SWw2tSnL5g7bIV11vf8lV0eswqzZcWQely5vPPBMCuzfyLkhyQk2s0IrNjf/097s4uYF
 IFYNKFy3zdpMUZPfNlg==
X-Authority-Analysis: v=2.4 cv=Pb1qFShd c=1 sm=1 tr=0 ts=6ae0e62f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=GCtVsLiEsvdnKASXBLoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MSBTYWx0ZWRfX8UeiqgdXQjLn
 5Uaf0rAlS86Bpr08wYvXo45Mp2ixdr7zbI1lMVmawrR38CXxuFa3qYQcv2OIYPb0C1laC6IctUt
 3lBPqJ7Q+vK6YSAZpfd/slsNhJA+eTo=
X-Proofpoint-ORIG-GUID: DsgaLzgGT0fseYydGXNHzK5EwsERNJs2
X-Proofpoint-GUID: DsgaLzgGT0fseYydGXNHzK5EwsERNJs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01

> BTW I haven't looked closely but is there no existing helper that
> would give you the ability to walk the extension headers?

The closest candidate I could find is ipv6_find_hdr() in net/ipv6/exthdrs_core.c

I don't think it quite works though, because it doesn't return the
location of the
l4 proto nexthdr (only its value). Also, we would still need to traverse the
headers separately in order to implement the reject cases.

There seem to be a quite a few "walk the extension headers" implementations
which seems somewhat justified because they have different stopping
criteria.

-Todd
