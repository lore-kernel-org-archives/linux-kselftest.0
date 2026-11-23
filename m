Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471295;
	b=og80Cag3/BNWdoUYZXe1nDPodVflNlZ+JA8h9DMrzkpTKXGuYp4axsqAUongSExhG9HF
	 b9RwiRmOxK3nPeFV96JAF8Zs1qwj6CtkycstWsIWKTpXHofLCZseIsqaQZU4x2ZxoJzbb
	 rEDZGn/7hfujuyn7GfR3cXr63ZMfEP0KJoUARheMmLARxjCNnXRwPn36/QFTNQ8DUTmR2
	 ixujM0vudvYICufjutzJcR3ufrbE++6+PXE7y1GYwNHzU0dZgV5yJLHHNcwyIUVuIwJfm
	 yIkn4S+8PSk9+c+5LMOHYnn3AI0v1sZlOw9bZdkdMEpFQRhEGMlQgfpvZBpiG2iOh+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
	b=sRwjRZz6tNEJkdjDVN4EBeXVGUmLtBDTDYdBAfMJiw7XJzxCbXUehDw1z0zCpjFvrznz
	 dtGu8foyhyaUUU+tvBv6ikEmYB2UhU/oAGWEGOxM1rtUNaB0AOQtnVDBpjnodZUuZAs7N
	 Q6UB1PfBqVBOX7G4Up6nOTJ+k1okCHshLfhjlLOmD4rJcrleSdxfakOEZZKuBiK+rk2VR
	 yljyl1k9ZJ5P/grsOI6qkUyhgWUUOE/KSMAiGBTBgN/f9RJ9NewhSRNPjruVZsLW+Add2
	 vLbb61d0oVQE53z4rXMYRFzKNisNhK18Zk9j6jYTduM9GP5f6R3SxEDM1/Zek0LJGqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=MsrTYuOJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A54C606A338
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 22:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A54C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=MsrTYuOJ
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJwNe22658817
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:01:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=HXlZPN3cIE8
	dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=; b=MsrTYuOJYQ2wytJCLzkEX65+iJt
	K6N23+oL6xEcDGJ6PnEdfU42/bHNwn1aZcR/d2lCBKBQ7Hjj5EWmqpCETDR9eQ1F
	hl3GntDVNxWEv7byptEAlCVTSzTGeKygL2vYEP366PP43s7n8Fa39izCDAto3Fdf
	iPIIXEISjxVunEbIg8Yn/yVRpvBRcQc+0u4ptdDH2EwkDaF/8mwK246FEvT6hxTu
	d7eYm0b6mO1LTl1Np0uBWTtI0HM68lYEvSlPCZsdeFOTuP8hsDqM+/qjp0qtqRo8
	DhjuNo74AJTvHSy2mYz/hx7xhE6DfnRTv2ksulgkxzIKCUsoYPC/EzZGhew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j3wx9hc69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:01:33 -0800 (PST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so4018291a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795471293; cv=none;
        d=google.com; s=arc-20260327;
        b=oVxYPuqQmOiGp7jW+tx2Ox7ArpGsy8otA1+ipL1Z6c/4qXcsR28dGTsGysbf/Hx9tK
         71utW2mUFVd4fWQCnzBBoWYAOYGNuGHvFIYC47Loz8V/lW5jKtluAFtCmMh4lVKPrIJH
         8zp7gJp8i3L+sgFnFRlb5PLeaz4aELJ3fyUKD9xm6eS3aFGiYslLzXojd0kQ8XpjPqJg
         iS6oMOHcF2TbvkE4xmdgLnsTbA6xJn3D984HQZWY+Aqaxiivg5VMxkhgwj2zpDV47PNp
         ET1s6/CpqzsBZ6GIiS+uagL3442NroRoLkc6pV0TuzVvKthrNk4yYHOmiOzCtliLyjYX
         /uTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
        fh=NQunrZruq1njvwo1qobumTxXDWQc6GVrPxst5dLOCvo=;
        b=Jkonpk/8RHqqqn9XKzO0jqbRN4V55pnQigLV7IUQ186ZMc/eq//td+FHqBTGV37mO0
         LDy+I2gx5cBOkhI9Kfk/YF/4uj/0UUUALOfrP/Lwk/xpPv5AO1ZS0H2gctWSrGZKyAJP
         D1yQS/tyA60IpoEWALCE8kuIE4gd3K8Q8XKXGWeO2btxbbQqLClJ9ACZ9ZeNgk1PM1vz
         wYZC0X04YsesnkwapuLo12Or77wfxEOa2TvJpg5ipiv/YUgotxZ/IE4Aw5VwDcmYyH2S
         Fy/l//OvYSqdSI7IbXNCdPC3HpJ6RZO69RAnEPO872kQ8AGt4ZYPR0A3BNqF0B9NC1TD
         lo8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471293; x=1796076093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
        b=C1Jr7dRgkwUbTsfXYRo3rSrJ3Gh6WLC2rxJ0eopizbGkt2djFuaderqAJNO0LXWdt2
         Ssjl9n9J1/MbpVQiT/aRjocUDc8fiIKPK0sJJkOp5mXxcLsilr91p8S9kd75lijjqY/4
         Z6oYRJLYeloA2fJHeIhqO36mXnsDTZN4CWrzHLfGuEz0v4cQXWCDJeNnJYiG1QptvqWc
         g39DuF2+IC0h6y/BKW9jpSEIdss5whpmbWnZwKa0C+8ickb0BNHi21McCTMDxS74Du0K
         wx4Z5OEenWfwS5IJbpoX1Mi+3/JbCIO4c4LtyMMm5t3qoU/xi7F5IZD2fSDFWf1JRyfh
         6WBA==
X-Forwarded-Encrypted: i=1; AL+hErGVrR5wdlXRZCqvHd8cybWmggqamtl+qbB23NUS4yZihJ7nmM0iNpDxWAQS5oFhTaEBCzHbA1BcdrcyFA6xJsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z//JXzwGxwloMd8N8KNVQWQNpX4Uje5RuPmfa3ehsxW9LUOWkQE
	0nm4JDGtje90LhZzOJMRlH7dEG2/IPdZQH3S3froa2Mgjw7gf+CFe1m1Q2gWpIEUzzHYS3HZwkI
	PMqozy5mMo9UbFeal/ixCPVD+PXXaplqvxb+plxupti+NCAsCH4KenyVFm68xkNdMketI8+i6s2
	qRDLnyByw5ju+CSLKlHZOA+GdM6YF5Q/uqp/GCBSGOnoY=
X-Gm-Gg: AZFdTZdRaOUDsIFkxegllL2U1A28k/ocCQ9pyyTvN+biFg0TAYnRhyR6NMC5HdTIE/t
	zRNACncxZcJn4RRDsQLTD68vTK0m+Oj149wmoH7PreB3TS5WABZgmh1mOOi8rKvy5lKOJHehQCg
	cEl9CBBmNdzWD7Ii2IkJ68iz67YXo6/Grx2hqaMBQfnwy6dBKuqHGzFZswe9oZlhoZb4hq0Rd9F
	7LSfoKDPBYI4+EKnusKAEC2SyltppaRGtSX04y50miTfxpbsUE=
X-Received: by 2002:a17:90a:e705:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3b41c7e11bemr11000752a91.8.1795471292955;
        Mon, 23 Nov 2026 14:01:32 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3a5:147a:3b63 with SMTP id
 98e67ed59e1d1-3b41c7e11bemr11000723a91.8.1795471292482; Mon, 23 Nov 2026
 14:01:32 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-5-toddfreed@meta.com> <179529586053.3135.7106623626318776669@kernel.org>
In-Reply-To: <179529586053.3135.7106623626318776669@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 23 Nov 2026 14:01:19 -0800
X-Gm-Features: Aa3M54qKoeHizOx32dSF-QEKNJXmc6qKuSfI7qtOC8d-AkJeAsj6kZH5_ClB_hE
Message-ID: <CADh2yMxeyoDYgcp6WpF6F4hcLGvt+DxKTWLQQi7HrUo8fit8vg@mail.gmail.com>
Subject: Re: [PATCH net v6 4/8] ipv4: icmp: don't quote decrypted payload in
 icmp errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=aY/0Dhot c=1 sm=1 tr=0 ts=6b04b7bd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=vS69VSOLqzyyCQB8HVkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: 06RwlYAxYLe_YBEdgBUnrZsIdP3xb2FQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfXzne1kb3BO7kG
 zoQNxi7k35nbVPvmCje1YhMrvvzDNqDed0NNvYjaVXNp9bmqRbIyf9n4+kdkehLhBdwu0nykj3k
 XKL44DPu2pdHA62viP6jaMn7Qp4atsY=
X-Proofpoint-GUID: 06RwlYAxYLe_YBEdgBUnrZsIdP3xb2FQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX+Nk8NRhklYP2
 w5tLZHiBdXpirNtIwbKBZN882FYX1YWmKpVJir1avWw2jT9IB9GVc8H/LUGZHus6oUoKBxCmJ9x
 6Ot4CiSdwrGOPbPeS+aW6x8eV4F+NOIRZHCf8WJasV9UGucQUlp5gP0C+GzkB3vayvcKwV/d0wV
 Dqc0mAL5jQz5z5YbdQ5hcNjUMxOYEU2WaHzouNK+qbbMdtIBozXN0t9XY8iCHOn2qiGRv5ENn9F
 QB5wmzAX+hnPdEULYd6sFwwX6JuhX0Nxdz7Sab02QEkldUlCA9drVpArEpcFCmKlA3XqXVFjFLy
 d9tA4Po+icW/12EBhF4ml5jLbAQy3S9rGYZnje5sMWGapxjJBvB5KRrAY+WQBEv0G2QDLq6/6Ce
 DkznacV0fI0amKkZ2fzWel7pE84jh7kIrkj+mDSkVNkOR43w8js77p5SjUhSxqJM8AL4gJqvLhC
 fn1HjPPjPpfghWKT/ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

> [Severity: Medium]
> This check only covers ICMP errors sent through icmp_send(). Can a
> decrypted payload still be quoted in cleartext by the other IPv4
> unreachable builder?
>
> The commit message says:
>
>     nft reject in the netdev and bridge families builds its own
>     error (nf_reject_skb_v4_unreach()); a separate nf-next patch applies the
>     same rule there.
>
> This patch carries Fixes: 784abe24c903 and Cc: stable. A stable backport
> would then make an inet family reject of a decrypted packet send nothing.
> A netdev or bridge family reject of the same packet would still send
> plaintext.
>
> Should the netfilter builders be fixed in this same series, or through
> nf/net with the same Fixes: and Cc: stable tags, rather than nf-next?

The nf-next series in question,

https://lore.kernel.org/netfilter-devel/20261111003111.3826942-1-toddfreed@meta.com

 1/2 netfilter: bridge: don't refragment decrypted skbs" (dd5e0f8aebca)
 2/2 netfilter: reject: don't reply to decrypted skbs" (01538dbd6b9b)

patch 2/2 reproduces on net/main. I believe the precedent then would be
to send it to nf (not nf-next).

patch 1/2 does not reproduce on net/main. And it no longer reproduces with
the net-next series, "psp: introduce socket-less psp associations". I will drop
that one.

-Todd
