Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F5385D9D;
	Mon, 24 Aug 2026 18:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596753; cv=none; b=RYq/TTAff7Vj3kqdRvP/5Cm3pajNRmYP7Uvbaj/oTgDXgbVCkLYtqJDMQm0MNwAIdlIwx+0LA/Uwzm0x+e6rND/mR3oOBhx+EFXYI2q8dzoKX65MSQXP+vAiFHjIlkB2uIaOst1g1EQarf7I+Eun0qun7K3pvKGB4jJ123t6pXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596753; c=relaxed/simple;
	bh=ZD9gXdWprmO7GvA9K7VRT5Ntk+QPvYYECYKC3D8n+y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxowK6qx9QWyUa3nJuxjk8DR7lpQKp6W8JaMf9ftmZ6Tupo17cbDkDghag2cL7NILSaTaBPM4zRRqJpH2RvyWU00pCqzxtZSsG+jgHkIrqzjKQTwDlx7mSPXem4HYG25af6JwouCwPmJbJFTjx2ownQ6pl/ZUbnQ09FW8hSqNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=WeNJTZOv; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="WeNJTZOv"
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFljUx513353;
	Mon, 24 Aug 2026 17:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=R5b7yviA6r+Y09SUjhMLTI6yOv
	0OMuFn68Auvoc5NDU=; b=WeNJTZOvLIQHWi9bOY1KJwCUokZavfPUnNo7tN0fa1
	r39r+POtELXp710qdgPNoBhW4mLfd5iLtjwfaWcPsvrV1Lmga3uJkH3iirt0Ho0g
	hUqmWp6OdcNDpc/y8gSJnm5pS1Z9+TbIBz1bHomGE6CnA4/3z08c1TRffAq03rR4
	pKM6rJ1UUb8XFuJMXq6OtNvTjVG3E+t51kHA5ULCTiSRiLOYO4I6dsZ0ZuEmvDnH
	YSz/j28JMEf50yEVFLNHliVC0OwSzgQ9IVBDxq34hzEb0raoGaUhH9dc6wVGzcbv
	GyAAgBgLSZFTOWDPx+PNdwvdyqpzT2duYNlcmTiHpkGg==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4g8nf4csjx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 17:53:55 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 7B8D312B74;
	Mon, 24 Aug 2026 17:53:53 +0000 (UTC)
Received: from HPE-5CG20646DK.localdomain (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTPS id A30678064A9;
	Mon, 24 Aug 2026 17:53:49 +0000 (UTC)
Date: Mon, 24 Aug 2026 12:53:47 -0500
From: Kyle Meyer <kyle.meyer@hpe.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, bp@alien8.de,
        corbet@lwn.net, david@redhat.com, hannes@cmpxchg.org, jack@suse.cz,
        jane.chu@oracle.com, jiaqiyan@google.com, joel.granados@kernel.org,
        laoar.shao@gmail.com, linmiaohe@huawei.com, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        lorenzo.stoakes@oracle.com, mclapinski@google.com, mhocko@suse.com,
        nao.horiguchi@gmail.com, osalvador@suse.de, rafael.j.wysocki@intel.com,
        rppt@kernel.org, russ.anderson@hpe.com, shawn.fan@intel.com,
        shuah@kernel.org, surenb@google.com, tony.luck@intel.com,
        vbabka@suse.cz
Subject: Re: [PATCH v2] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aoyFK92azAlDAPuF@hpe.com>
References: <aMiu_Uku6Y5ZbuhM@hpe.com>
 <0d2fc2ab-333e-42a1-88a1-6bb85538cbb0@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d2fc2ab-333e-42a1-88a1-6bb85538cbb0@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=dLiWXuZb c=1 sm=1 tr=0 ts=6a8c8533 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=NCWKwCw8Xy9Og0ibBRsL:22 a=VwQbUJbxAAAA:8
 a=PKP6BQZIvgxffBQvtucA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: oEQ8auz5mVTDJWkWyVM5fQfqFdhNLftA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE1MCBTYWx0ZWRfX4ZEKKjQBqG2r
 JmDPrBRa2soGDDoYl9vdLLIgHsINRmOfd/7RaeOuHRU17VZMfsd5HIZ/4Z2tXtvnzrLPelTJrjl
 ytm7cr9G+IwisruUICOHfpDE1u4YUtA=
X-Proofpoint-GUID: oEQ8auz5mVTDJWkWyVM5fQfqFdhNLftA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE1MCBTYWx0ZWRfX7Z4dDOz4ih0G
 Kp7146Vx9iJ3V9judH0qkquGXtnapspnIT3NgiIDnwd12A2OlnSEK7mcCw9SyN84AopOcL3urIC
 4DJe3mQKs1evHuZBurOPOJ+zcOAHK25zl2iyvNDpQ1zwqxsBu2Fu04xqYsO5RexsFDtqvFx6lml
 ocFHEZztSrU8R72+8wpssvAiYa3UMRFKbGdpexzqIFo16P03dqCsPADH/0VPt00xarO00S3Ui5O
 c9AjXZsjTUzHxl0s8s5kKi0CFxFnLqSlH+W2cLaB2gRP2fJqlZOeFjzdIXJ+k+4nEuRPf971YQ4
 sYB3aUBEBFms3GmDJijyQdS/0M/MfpTdBE261vsNGiURDBcZia4S1etEqc1NYbJvUUcGOaLog10
 ULl+QwZFfH80ztafHu7EGx6+mBq1ZYCpSBE9fUK3ENp3gr1W9ZZVJE3dRLnp9JxgeCZZXsmErCP
 hjWsnDNtfRJoktXBmEA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240150

On Thu, Aug 20, 2026 at 11:47:11AM +0800, Shuai Xue wrote:
> Hi Kyle,

Hi.
 
> Following up on this thread. The v2 patch once landed in akpm's mm
> tree (9ae6eefa4b6b "mm/memory-failure: support disabling soft
> offline for HugeTLB pages"), but that commit is now not reachable
> from any branch, and mainline as of v7.3-rc1 still only has the 0/1
> switch in /proc/sys/vm/enable_soft_offline.

Thanks for pointing this out.

Looks like this patch was added on 2025-09-16 [1] and dropped on 2025-11-11 [2].

[1] https://lore.kernel.org/all/20250916032512.AE588C4CEEB@smtp.kernel.org
[2] https://lore.kernel.org/all/20251111231818.52A60C16AAE@smtp.kernel.org

I must have missed the second email.

I don't remember discussing a v3. Can someone please remind me what we planned
to change or whether there was another reason it was dropped?

> The underlying issue discussed here is still unresolved for us:
> firmware reporting per-rank corrected error thresholds via GHES
> triggers soft offline of huge pages, which neither addresses the
> failing rank nor is acceptable for workloads that rely on stable
> hugetlb physical layouts.
> 
> Do you still plan to send a v3, e.g. with the disable-bitmask
> layout Anshuman suggested upthread?

I wasn't planning on sending a v3 but I'm happy to revisit if needed.
 
Thanks,
Kyle Meyer
