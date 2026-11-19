Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.74.88
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095168;
	b=shnSk3WD66JxkhVrX77rgNCbldYFGlnqWHDlR68c9t48y98eLiZIbQfWAhoeMpRIIfIG
	 DnGQpSbn2wvUlOnLfDEv6XciW0vddWaHJXDK8w5bEwuOlBKp6Ilpx7u7MqJ/fz5HctL6h
	 9M02g/IW1ElDoCEK35UufXM9Rjef3o5krAjsL8Zv+WX2tuWyJG/BGRMO+N8iWv4LodO84
	 yphPVnbXdcRq6uuVclm03Cz/3UJYrBxA6SEmVjjvY3Q4FiCfOa7WHUYejnDDdi4MEmWwi
	 1xdWOzMdQ9J459zsDR0RjB86ObBCC0YDnBTva0R8cighjYs62ax4iv5XRhWxioWFbIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095168;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=Tc3ESe3JZqXFraISylXoQOb2N2b+1RDdSzgufiOKQzE=;
	b=GstrUdi23EK5FEEd2cP+sdNawJPmTAx+AdKor5BQeSERbB528kf59Iw6lmNWO5T/cRW4
	 Yj1Po/ZDtA3uGC1lwZ1oN7bG+1/TButtRe0VEla/zEH6lz+j+yiuTXilK+j6FXya6iLTU
	 e+NTWTdCskzHQyfHdu8HijsvikR55fDUH29H8kdGoC3nBOzh+koBSsBwYW4qehpTrRmQ0
	 zW42F8/7hpQQCSvMaJXNDEV6gQXhGDVPMs3fSR+wl8HnxAUbNoRfljLxsZ9TeQJ4KxcEH
	 p80ZiX82UguhDt7bHnnxSztmzO4/MezcRgJY/yOicu8Y1deUJ4bOn/eSdh8VB6Vd5fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=M0I1MTD+;
	arc=none smtp.remote-ip=57.103.74.88
Received: from outbound.ms.icloud.com (ms-2002k-snip4-5.eps.apple.com [57.103.74.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CE606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=M0I1MTD+
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-0 (Postfix) with ESMTPS id 611C11800104;
	Thu, 19 Nov 2026 13:32:44 +0000 (UTC)
X-ICL-RepId: 01a1f402-74e2-7576-b5a3-3dae9037e027
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1795095166; x=1826631166; bh=Tc3ESe3JZqXFraISylXoQOb2N2b+1RDdSzgufiOKQzE=; h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:x-icloud-hme; b=M0I1MTD+/tOItEXUYEfftUgihbCzj34q0OQqjlmMQnGomsTx002b03xjgiJHAzdp3aAtlRziTFquMm63WjX+dUbEEJst0T3zWWqtprhLbGjDZ17OcTQ2uINuk34OZer/060UpS40DJARjOv7aQm7jHqtjhQjSbspytwtzRNoYxkfM+JsYAmBcB9D5XWiA8ai4f9t1sMTcm0La0HK619W9RHhgULo+yTfPt5FV3zXY3aP+7u8GCTEIuCm1afqxxGdzgeyIcPGDWrnsCAEwW7avkCGTyOEYXvXF8WO4JWUQpcwg/tGNLVTHR4k/4/f0FVUCMYfVhkn5Xa6FyecESiJ3w==
mail-alias-created-date: 1621344842221
Received: from localhost (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-0 (Postfix) with ESMTPSA id 20D031800285;
	Thu, 19 Nov 2026 13:32:40 +0000 (UTC)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 16:32:38 +0300
Message-Id: <DMZ84JBLQD08.3E6KHRQNK83FW@verdict.gg>
Cc: "David Ahern" <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v4 0/3] ipv4/ipv6: Cache pmtu on all paths of a
 multipath route
From: "Vladimir Vdovin" <deliran@verdict.gg>
To: <netdev-bot+sinfo@kernel.org>, "Vladimir Vdovin" <deliran@verdict.gg>
X-Mailer: aerc 0.22.0
References: <20261117193141.27004-1-deliran@verdict.gg>
 <179494427164.3291.6413261457824057937@kernel.org>
In-Reply-To: <179494427164.3291.6413261457824057937@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfX6z+JpH7Tmf8N
 qftqUzD5RYIPZbbB4sstzx9VYpxJ0vugDWnTT7ykkr62A33ycby9p0kKOwv+0DyvBkNc/CiZmk3
 c4tCD98FacYjZYT0UfABTjXXXqkS3+g=
X-Proofpoint-ORIG-GUID: usP5jA0ZpkwNj_6TWbSd-bIBYmUTjmdu
X-Authority-Info-Out: v=2.4 cv=L5mI0OT8 c=1 sm=1 tr=0 ts=6afefa7d
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4Xuvw5ty44FKcjjuTMQI:22 a=788SybWvmYwSByz6lwXL:22
 a=1OqCGUWwC2Wpexm8AmAA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: usP5jA0ZpkwNj_6TWbSd-bIBYmUTjmdu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfX53kMkk3oB7en
 FGeji2rNEmlOLvzPOrO4jVioIql/OGp8OCNZF+F+VR8QKQGDTYyaZDIyfS+QvgKwb7QdjYRR+1t
 e7aSLKfRqAhJq2TVJK+Ck4wrRgOw1j4l9GjGaBpFHRU8PW+ehmw2rMvASW08uGi46FhLZh30YMn
 Dx0uSB4l9dJGS+x+6w6VNBSihl+pyiDoygErDN2BrtTcFvRoLnK7bbxL3jFVSgSQAJZWpwKtbq1
 TFyVM8J6vvvonwML4IzpEp8sHPFEn2p/ptvJNsqFQ14pecu9AInYNCYKIWPu/1FEeBD/isdetnT
 XmsW/Qt+Qs9g9gPKxavPnV4c2ScKJRVfxwtpkJ8GlKxRvMKBZUAPnY9HKrEDz4=
X-JNJ: AAAAAAAB4Q7HnMXF2dErNg4bF9ZGQSg+n710kLWBCQnpc58tkm6IVUyjRr30TEK9+YyEtF
 L/KWEEzxafePDgGr7fG8hX/q27fbUA/yX9KTEM8MJ4lv/XKOW1IHBMciT2yLDeyXkhtXYA
 RMPlcqc3wzgTsKKIBegeaiG6w48GqpPRqJLWWOC79wkhWGmohIm6/iuZoYljjNSKjqTSeg
 js2TNd5SRJAwabGaMFK/vICdnb1lthpopfcSFPuKh8wbmydeYn6dO3nw1A4LltVOaXvzc3
 0weYvX4ByYLG620feFH1qBTaCGoeKUKatQoiW1pvhTkGcX6kCM0aLWU7PxkgizET+OZ7NV
 al4GkbQ/Be8BlrOXbIiaiBebq1EjqhuGRN8+tmWGB18M9GCs/elSm35RMb+r/y00p9psRY
 vubL5XxRdIujm81TFK2HR7M/7NXlYjwuSxgXd4A8IKMmlScwzlyS/ZPfQyD3RxsmU3Fy7j
 liENV4jX3P97eZaBSXQv62CVDC1Etf+NlK9ZnaiKr/v2/QVrgqbW2Jo5K6U28vh8+wEWIR
 3Vxk+gCRNgfYSebQv6k4XNsOwnStAEF9m1JQFOuSVzM4oXtjboA5bsd/hf1UbiSWOJUpY+
 LIWto3k0ruN8xPKw64kTx6bERbTKh1qmxQN9ZLyn6TF6UyjPTetDcaXNgOW+sH53WiMPOL
 z9dOu3gaimmGjUJ2VXAYWwtBHwk4nQtsXunHudUVA3yeEV0gU/m3UwHUshdjAw82FB7Jxi
 MvPl47lq4MJaPHsRGlrKh86+g9AXS1EZLKccRIPSvwQAAd8Sw7fdi+cEhQa2h36vuvR17v
 HlHrVnE468tfPegjgZ6pz97YzqC3QYXXop3uTILI+BCaWoCBEw2rGDB1eVJQ8oJSwRtlgF
 PePwvHquS6jHd/cZUBTzfcEXB2Qdyt7HKmDhhtpKkEaz9D1HhkiuuhLbPYkgJYC4pwJBgv
 dm7TMa5Of/c1O4h/UDHDMveisVw5lWvNru4GLzrtx659Qt4Ql/tDG7LiOK9EVB21jyt9kt
 EZ7370jkFOvLb/fgprMBmFWNG+5Vt8SwHwT7HSSe/dhlf1F7H7IoOulFkdRfUArZ+NXzEr
 7pTJ8/CkpqTWdtcXrBhWk0+V4EzOivc45MXb5v45sk+MXuEmrYAODuFJQnrM5OZ7QBVPQe
 WSgvy3lTWmlXa56Cigc41/FckE85SDoSogO2FLhpXnY3mONCeYaLRmbsYP93A7y4usetQP
 kQ5f/x2FC8x45ZIu2Pfloi0YauJ+VhrU8af07SiYUWc2uzAVaxNsN0O9vYcSQYDBjEYjjg
 qatEoPfk2aOqzSiCfvSjYbSNEN/jiEWVMOx1A2Vg==

On Tue, Nov 17, 2026 at 07:37:51PM +0000, netdev-bot+sinfo wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.

Patch 2 fixes for IPv6 what commit 7d3f3b4367f3 fixed for IPv4, a
production issue back then, the cover letter links the discussion.
Patch 1 was found by code inspection while reworking v1 after the
Sashiko review of it.

