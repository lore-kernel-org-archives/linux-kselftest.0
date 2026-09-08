Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE302E7623;
	Tue,  8 Sep 2026 05:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845802; cv=none; b=e8/UJqRZT3X9qDdH1lhM9WpJQCI9m6G35vmmUFiawQHG+orByPcmcQReU+m27PlUsdb5tOZOf4FHJqOdPXcGPuR+X1GuEYaxThB80HMM2odieO7jzQEDvmF90bR/cGvyN7SWi7KVB7lDYKKBN0HmwTfDhk9pTAYncKyYnnktzBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845802; c=relaxed/simple;
	bh=oL1tC9u9RzhU2PL6dZVLf7oxQFr7lsRQFjOMCjgg9x8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok9hU4OsgMEaHXRoheVVutIKMER/FXj25qNrIy+cRvQAmxMW7mxyssN7DKEhw+P4blrDa9ONogepCN6SIRlHsxva6GHUHlnHNZ4WCz5bZwA60Q0ojaE3dqy0OuuSYUdlRALV+MnJlO+WHFLN2vGdpPBjLZ+Skuc1jek6UWmespQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=BihBDKLs; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="BihBDKLs"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NoiiN4052707;
	Mon, 7 Sep 2026 22:35:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=L8bQVcZ4XERxz6R2mCbfmBMtR
	zXuotUJA5hLPxZbwzA=; b=BihBDKLsw4pynSGhwHdPWhTYqd5EIYdgjEDjj2k/H
	nyQc2ByMQXzkPtQLr8bclg7jGV5vC/+CQPDTFGpFJov/o9ZzESX22vKrFELMK0Np
	n90wwp9ROCw6znY9McFq97V703M5iatV+CZjCXd8nniTo29Slpp6hmmjdTHrna8w
	neJEvGlk7RnqwA1HdeZwdNn0IE5EQ4ziBuRVgSqmfpPxzCEDlQ7slnx5aFpJc04b
	VSXVxbN9gfJ1M3u2LkH+Udj+LaS33k1wmJ9h+1mpCq70N8ggJjMVotbLV6bxC5AD
	xna41MnZDtpakF/lL8NhnZOwoIb+b9eLl4LvzV6Q/SbEw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4ghupyaf99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 22:35:36 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Sep 2026 22:35:34 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Mon, 7 Sep 2026 22:35:34 -0700
Received: from rkannoth-OptiPlex-7090 (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id 1D0A83F7078;
	Mon,  7 Sep 2026 22:35:25 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:05:19 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Bharat Bhushan <bbhushan2@marvell.com>,
        "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
        "Chris
 Snook" <chris.snook@gmail.com>,
        Eric Dumazet <edumazet@google.com>,
        "Florian
 Fainelli" <florian.fainelli@broadcom.com>,
        <GR-Linux-NIC-Dev@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
        Jakub Kicinski <kuba@kernel.org>, "Jian
 Shen" <shenjian15@huawei.com>,
        Jijie Shao <shaojijie@huawei.com>,
        "Manish
 Chopra" <manishc@marvell.com>,
        Marcin Wojtas <marcin.s.wojtas@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
        "Russell
 King" <linux@armlinux.org.uk>,
        Shahed Shaikh <shshaikh@marvell.com>, "Shuah
 Khan" <shuah@kernel.org>,
        Simon Horman <horms@kernel.org>,
        Subbaraya Sundeep
	<sbhatta@marvell.com>,
        Sudarsana Kalluru <skalluru@marvell.com>,
        "Sunil
 Goutham" <sgoutham@marvell.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
        <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next v3 07/10] net: marvell: fix typos in comments
Message-ID: <ap-elz1ObdxcutDv@rkannoth-OptiPlex-7090>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-8-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-8-hemanth.selam@gmail.com>
X-Authority-Analysis: v=2.4 cv=AYyB2XXG c=1 sm=1 tr=0 ts=6a9f9ea8 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=QXcCYyLzdtTjyudCfB6f:22 a=pGLkceISAAAA:8
 a=M5GUcnROAAAA:8 a=tqGoz1Is73OFN3djMG0A:9 a=CjuIK1q_8ugA:10
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA1OSBTYWx0ZWRfXyOtTkmQm1q4x
 SUjKFIJV5r0rqLrG6heVXaKN72MitGgLDmd8Bv4FbcX8Y0xrsYPTwWZFvu9ewyVL6Di9EfFKk1L
 4YLk94IAoz86MBUbPxVe5p/xf2SmW/xfXQHjIVpGQv64xYB13I0s4rE/L9cnkJRQGVQXV7wBEoU
 Ym5QSuAqWh+z3q5YMXYDeXDjxOfsz18zOMMmL830aWLNAZlDpN0vxhLajUAxxL1PmYnjfPr6sWk
 uByWJbUf3S8xiXKq5xbeuA+0s2Cc0KOrNbNDiaKkLJbv3vdgPSYqwYL/6gt9we0ZpnCE1mBnN8I
 +wyaIp7fRIu+VDxVZ1culF1mKzlm8erVlmuLvZE9bhartfQKQdxsqwh9fGlxqfl+gQDVCeN197Q
 7QL9cwVZEkBt1GmVOkXmMWexGe7YQZIdJHsx87R5s/aBI7KL9FQPH2AvnHwDlK93cyljG+zmKeo
 EEUTu45739cwJluPVqg==
X-Proofpoint-ORIG-GUID: vGLgS59Z7ZapmCskxREr1hd--snyiUqy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA1OSBTYWx0ZWRfX+gdxfEt/IaoT
 R1bLw9QTDsE5rTF0QUOGiIWUSyFbSstK6ypH/ds435eD0V4rUUa312PvDlJxP0j1XmA+Lx19DKv
 ByG2LrwN6PJXp52vWuquepGgmVyrW2s=
X-Proofpoint-GUID: vGLgS59Z7ZapmCskxREr1hd--snyiUqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01

On 2026-09-08 at 10:55:59, Hemanth Selam (hemanth.selam@gmail.com) wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
>

For below files

>  drivers/net/ethernet/marvell/octeontx2/af/npc.h         | 4 ++--
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c     | 2 +-
>  drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c      | 2 +-
>  drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c | 2 +-

Reviewed-by: Ratheesh Kannoth <rkannoth@marvell.com>
