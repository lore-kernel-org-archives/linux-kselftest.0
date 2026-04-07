Received: from outbound.pv.icloud.com (p-west1-cluster6-host10-snip4-3.eps.apple.com [57.103.67.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1293B4EAB
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566665; cv=none; b=Pv333YwKrsYsiT8SRUQAC2pNMh8STmPE6cUjNGwVxNwy1REq2sxxpquTce8V6Zv/kRCDy9Bn0ohGPj05ojr9pmUELppy3lePseDQuJ9cbh/rblHTFKRx0glIeFp7PoQvJM5SXiGBTPO/kJnbFp0Z3Ft8trvNa0nVRQKlMF4HM90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566665; c=relaxed/simple;
	bh=3Pow4xyFrmmWQkdZVrYnH6jvMJtuPBmrdIgg6ifOVeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAmioBIKjMZzNTi8vIe/zHIUix430DAR8NeVezmVszK39xSnxCrHkjBaGbizB32PfMLmWsFAHNphKfRMmDBBBPUPBBDfnwLRsKklEjRHbYo2/eOkfHQ4jEHES45Pew81x49mjHkYWpBr9DLzSKVQw1kiCwIksqqzZ87h0WXqM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=fNjY3adV reason="key not found in DNS"; arc=none smtp.client-ip=57.103.67.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="fNjY3adV"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPS id 5874D180081F;
	Tue, 07 Apr 2026 12:57:42 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1775566664; x=1778158664; bh=MwNjSqYarP8q6aSZq6TkHaXmSLKGgftjYIZbTyCrMKs=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=fNjY3adVvIsAK12l13K0wLhbcD8PfGBt3bK5Gi0wX8E0u89OgxpswDHbhF61QSrocMaBSl0RfnV2m1QQYuKBfAXNNu3gXhbPL+yjtGhOxelcirGad55DMG4NPIn3Iaz2WQRrbbj7g1u8K6sQrJaiaZEeEg/1JgDrFb09g8apzxxNULlUKpuwgfQRKxl8NUO7aGLq2tkFq1kXGhMuiTQwej+/2PcLwm7cQABy8ncldWGGCoafO5wbq/iCupNKK0hFZ3fEFQHUQKi3PPJoQ/qDyITxinhFA8Ae3ySGUVrh79MUlizd1MJZQbvEVP5jusx3wa9bXv5uCb5yP3pUZYGONw==
mail-alias-created-date: 1719758601013
Received: from desktop.y-koj.net (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPSA id 367E5180045B;
	Tue, 07 Apr 2026 12:57:41 +0000 (UTC)
Date: Tue, 7 Apr 2026 21:57:38 +0900
From: Yohei Kojima <yk@y-koj.net>
To: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/4] nstree: Fix spurious ENOENT in listns pagination
 during grace period
Message-ID: <adT6qbiJnTDg-Srq@desktop.y-koj.net>
References: <cover.1775404451.git.yk@y-koj.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1775404451.git.yk@y-koj.net>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMiBTYWx0ZWRfX/z+lhPUFm/4L
 NYY6FtswV8RU2uErJrKwLYHWis7kRoztKXhfMDbdaUQrd8AbJS6/9N7uvRNMlpDtwhxk3lt05Od
 CR46vkYxeqEq5NCtYMf8kW4GTfM+5rNLZVVWrwtoWPNcuOlthOogCN0cEGy4tgX1i206zUq/KhD
 54IgMYq8IATsF6q6iOdOQ9DRnU1JeEUIJ+i0YIL9An6tQ6pzN1eSdZjUdoZEKEIB++4htfHL1T1
 R+i5soAsX1zbbYlUGgcKzz+6AcWezrdRCsu+6kwOXjgg6Pccl+pNtmBI9DUTtPY+CfWBxatZGGA
 9pA/gSegcRnufN09p//IBgEaqoSOK0Y+wnNl5AkDU4In1EILmUxemVgTChmx1o=
X-Authority-Info-Out: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=69d4ff46
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VZRZDpyXCvfcKBHtkqIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: CbbtNekvhQkS5bR94AXknm1_EBHnb88S
X-Proofpoint-ORIG-GUID: CbbtNekvhQkS5bR94AXknm1_EBHnb88S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1030 bulkscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604070122

On Mon, Apr 06, 2026 at 01:50:36AM +0900, Yohei Kojima wrote:
> Yohei Kojima (4):
>   selftests/namespace: fix selftest hang-up caused by zombie processes
>   selftests/namespace: fix unintentional skip in ns_active_ref_test.c
>   nstree: Fix spurious ENOENT in listns pagination during grace period

I'm sorry, the subjects of the cover letter and the third patch are
incorrect. This bug is unrelated to the RCU grace period; instead, it
is caused by the handling of inactive and destroyed namespaces. I'll
fix the subject in v2.

Thanks,
Yohei

>   selftests/namespace: test spurious ENOENT bug in listns pagination
> 
>  kernel/nstree.c                               |  68 ++++--
>  .../namespaces/listns_pagination_bug.c        | 200 ++++++++++++++++++
>  .../selftests/namespaces/ns_active_ref_test.c |   4 +
>  .../testing/selftests/namespaces/nsid_test.c  |   8 +
>  4 files changed, 258 insertions(+), 22 deletions(-)
> 
> -- 
> 2.52.0
> 


