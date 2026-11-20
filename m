Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195081;
	b=rAe8WHJzDkdTfVSqzhuaOFUaWYsBVIzeA0cps5DFLERu4fKP5uDVFFtm6LnmFanF0FsZ
	 wrUrJnYPG3niDp7vqrfHzansnYUKP5NdS31u+exeHA61pB+JewtrgKDekAU2pZfXBYmY5
	 olDvjnDhJRNmf4LcU/w/hz4ICjoICefxX/i3AHFTQLoA9wpB71Jb+rZtAG0Z9K7Z+S9BL
	 zFZj84rMxPOoJNXCyi2FZMjltIEtKl8dQp10d335P9RjmAZPAAi1DDHGIkv2L7kEUh3lE
	 Zm0s3AqkBCsRlcr+dWLQOzNHisieKezcA2YwSj05NIoKe5dBb3xJyN6K32kngFTL2Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
	b=1UHhVDnk7dx5hLqKJTvrywVASnvMMKduFfGyoJtqqk7ModrgzJnynEC5LGgDM1O14aab
	 OyVSPp6quLOD55LwI/S+76d0/AqP/WyLQF7+bShBKPs9+AdZXgTyptPFohsGRu+dakLq7
	 t2KI1eMl1lS17lzUS9tNnskdmCqgKrLkbWlz03sNu3pB4kRxFtBv2Y+BMxcd2FjtxESCY
	 gf89lEehtpL85VHDD/vg83B2KMLrCZA46B78DJ1jA0gObyG+nAtnR1mMQx5hW+yxbDS9d
	 UcPYqc0DRVg8DPo8e9X6MPaeNcUg0exPiBW7ftqmTdYZuf1hmmqvAK9QB2LKJ1gU7lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HvFsqWth;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075C60A2609
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 17:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A075C60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HvFsqWth
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKH3mmP2028073
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 09:17:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=wjfu+1o0XY4
	1QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=; b=HvFsqWthOwr5IFXRc/Tsjs2JhU2
	waqs9ZKQnjldht7nZxu9zYt3XhDvdDhpIYEfiGJJJrEARGhYqP4wrclpQ6/0EBg3
	lRul39UgevRZgaQs0bGKuvsQi0xfHdWI42hfp2dMFO4+23ry2xekopDamDQ+QHRO
	mXXtwTWmKRWeGnr/fcfD6YmZLWD9v7sb3z+OTz4taeyADWFoc5O08MrAVa+2lhfG
	EBi8+Aae6qA7wuabHWw2J1neVqtl3Unw9VQ1tfsa9cHkvdngACKt/gZSf3Yp+tsQ
	oC4H3peNvc4jyK4lcsQdMFqAsEQWukxa8zbJe+Y9Ra7kS18gy32bPs7JW4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2t99r4bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 09:17:59 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b691cf0eeaso1493694b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 09:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195079; cv=none;
        d=google.com; s=arc-20260327;
        b=dSwfdY3gyoXXf1a4ARp9IczhuSaLBkGgWefkywjFFlrGYgvgaEYlrJsAQaEBgzQIZR
         giUlGB2uUNH2+Qzgo6NgA9L6FvKPAMN5ePiK3BvkkGXxDf+mrmi25RhzC8EgC5hno8S4
         24FQjyY+DOGc/PVwfzZtGJaFIxDhdIJ+kgxX9FRHDXxfGpJPMOkjrBBrGDYbbife6ZFJ
         rrIGWtVJIYsdlrufYeVph9BjFxLLmi4tvqzueNRemIYzdCRZs+lu98gMDoOeRdjpdumf
         6jp+RoRAfvaloromm1Uk/Q6Aj268AYSh3NSK5iS7e4VfbVsGyp9VkQsk6E68S1nLET74
         7Nfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
        fh=OxPUrzDzzaRhVYm1WV3vg6fC46Ir/LzgD+q6+LSvhBU=;
        b=YlT9KN1hBoKXsIi9XW+EIHEDA9WZ2IgX988lfx0PqpdA1nntQcX1dL8jYwa95W9yNy
         L5BV0mjMncAQpbGo/ofS4lOrVYFOpQEcxoE/ooubJBZe1PFsT/nT6ftMJH1OUsKHyqoR
         QSAlgG3B5TbZ+AMBjvqQfbSXJAgvFCndgajw0jP4okGnYmDYL0gwd1S5fR7PF5qwVoFI
         pO01q/dKQM9GnNHnG7aBjDk2QWDriZaQ27O6QY2nosd0I8U/FhP1vU6Glp4/x9h3T5Nb
         lprTbPDPiST1FlUvb9iWtIkWhnkLKNg82dos5tFx8GhYdbQ5UwLbEKX320A0lOfn5GIq
         Vi0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195079; x=1795799879;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
        b=0n2LvKmQer+Ju/ThcL4tS58vhR0H8P1QuyU5CJ5ACJAPA/rCPJHHmJaNVBAiUe7C6E
         irfJ20+dSxAH23mEefuGHwnaXXZH2zAZ0Yc0rKMepzz465Teg2AqwkZjTr3gNJxsj8mv
         qhaCK4t+53R0jqqRz3a5+hZ1UpNs/h4yccm1Kl/Gb05+cV0HY36mLqyE1edL6r24Y2uk
         jegJqcvpM9pwf+tsscPeGWZWqTpzayle6RmXOLDnAxQF2s6raNe5UQBHPkbqAwWnLx/F
         cjs1+BxKLc6L8O4LC9fZnksKeCzGiC0vS26cFVV3POV9ki47U3K42L6tS0FWzmRA27Em
         +OYw==
X-Forwarded-Encrypted: i=1; AL+hErGOLV1zfAsQQw/Ix0FJ9nitBC3JpDQDEFEz2fEUFjEQVBRDnka0He9DRZs2g6R03wycJ9DCNIvQcYrb6VZmEIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bzCAh0T3kdM/2w3ey7lAPDDRdSTXQ318Ps0t550W9RnOXlgE0
	0RFxpB+a2i7IW/NCPQl6Nuf8H26NtijHn2Nb5peak7SYpNf3sSvH/vsHSLxWJ+an3DMcWb8dJvM
	g5sv2iWLgRwOaB+9pYUO/3STAAdusP3tl6cgBbE/jz7lSlDIo3kEUZJzD5THZTcOB0+W6yPcOUm
	LxZXut/qKASiG81EzKSXlamgdFjQqXMGeKx6T4QM9Gsy4=
X-Gm-Gg: AYBFou2exXV1Lhh9f0TPKpLH7xD++K3xbx9ArUFRUo4MbaulLd6wBW17oyjArRGnsmW
	LYEJj6/Rlqdc9PVfjOWkTcbgueYE0nebyXlHQShML7hWRod4XI9E5rP/MCN/ssclIzhwssLSqWc
	iYLAXV56bD30VujUXapMTpyEndsINk3u606ziuNQWxtiyUCAfJ9IxmCqxVzXmik4q4c0dEWkhdG
	qJdBf28f3ikoPn544Pmpoxi8XIvWVCw
X-Received: by 2002:a05:6a20:9f86:b0:3eb:39fd:bacc with SMTP id adf61e73a8af0-4014d360ed8mr3745390637.50.1795195078669;
        Fri, 20 Nov 2026 09:17:58 -0800 (PST)
X-Received: by 2002:a05:6a20:9f86:b0:3eb:39fd:bacc with SMTP id
 adf61e73a8af0-4014d360ed8mr3745344637.50.1795195078192; Fri, 20 Nov 2026
 09:17:58 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-1-toddfreed@meta.com> <20261117203137.804424-9-toddfreed@meta.com>
 <906302b6-facd-43c4-872f-ae40bc59714a@nvidia.com>
In-Reply-To: <906302b6-facd-43c4-872f-ae40bc59714a@nvidia.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 20 Nov 2026 09:17:47 -0800
X-Gm-Features: AclHuK-LgS6otYIsEJ3X0_WptWHRTeRKrRZOhEbdUdT3ro_BhN8Q7OlgsXmfnZs
Message-ID: <CADh2yMzLDMEOupGJwS8=3JbN-g4LR3ZapyBNaJx3chNT4_6pDw@mail.gmail.com>
Subject: Re: [PATCH net v6 8/8] net/mlx5e: psp: tso: replace only the length
 in checksum seed
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Boris Pismenny <borisp@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
        Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
        Mark Bloch <mbloch@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
        Raed Salem <raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=LvQHWXdc c=1 sm=1 tr=0 ts=6b0080c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=OFRVtpLxHUNKrmO6MooA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: mK77y7takZUXR3RbcqdpgZm_fI5QzH1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NyBTYWx0ZWRfX4BAjgQ0JCUb1
 Vsnvsc1MYw/LBTwvbjlCX2vNCfpUznK8huF7mkirsMX0xDG6/+E2WhCMnz4qhP4lKOo+WqNpMK/
 UFBP0YR1Li+ia3HV2m+WP/3Vdpl1P7eb02/41tt0VYU/X6PoXUSKSkCRaqssh/kFFx3PicJ9W9P
 I4g/F7MG+arGKIx4FNgi0C/1uOr1vR8njX130bwrnj16jhno7pKbr/fLqS8wZ5lGUFJ6w0IZ1V4
 X8Fuox/Sv9oXpIO6kHJOa+EYFR1xyL859Gc2CihbFNJRmrJHRoIyz/2uQ4ejsLIbu5Tvnk42ai0
 5YNcnyecxn7gw5mkA/wBS20GjJDHgqA33C9Nrqfj40IorCHHi4HvHqMcK4RipCwHcg9gtdndug1
 giLCQHFEsErRlgTY36O6/AXvOvZnNcBr0yE7qHFVzLW21sBlleHTWCSAOChUif/b9Pp78Htot0i
 49Hb/s496W6YHAHgwuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NyBTYWx0ZWRfX0a0+xEF7Cjux
 laQhuCTBllSulBtIPxWw43ch9rpzFQ63SoVlgJkPge22xC/zes9Q1UqKxCf4vkGv2oof8wM4RJp
 Qv+j8CmY0KSYdYUdhzA0dcD+pQF17q8=
X-Proofpoint-GUID: mK77y7takZUXR3RbcqdpgZm_fI5QzH1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

> > in these cases every segment of the tso packet to go out with a bad tcp
> > checksum
> What did you mean with "to go out" here? Goes out? Or is a verb missing?

Sorry about that. Here is the updated phrasing.

    In these cases every segment of the TSO packet goes out with a bad TCP
    checksum.

I'm not sure whether I should re-post if the only changes are grammar
improvements in the commit message. But, if it does get reposted, that is
how it will be worded.

-Todd
