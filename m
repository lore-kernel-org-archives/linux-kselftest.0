Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7BA37997C
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 22:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773960947; cv=none; b=FD7j860xXuqH5vuoyULW5ZvJ88MeDsHJKuPEj0+ZCl4K4RthtJ9U+nveOVeo8lJ2LaXF92gCaRELbqwY0hcs0rZGm9due4mX6X/opE8BPYqKGasGK8xUihgXE8EjT638rNA0ksgEvGoHqLErRo+6oX8qxCImOzyKWADoz9ycQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773960947; c=relaxed/simple;
	bh=i7MipWj9sHBdfSHGjRKSPIm5ZRjwYZfYp01SnJS/juM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qhz4HHX5G03bc4NtHL0DMOt//1Qq1aiHrd+A37VaIoS345xu1AjmnHEcuzUgTG0SQTop/2KzHRBom8p67qxcxe5T/Qcbvh7TeQWvb95eVPZHF0oaeGecrFXM4CE/D/b5vsa79tH9pB8YbXn9M/8lr+vYXF6fQ5FcxOtwN5EOIpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=jSniGa++; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="jSniGa++"
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JM8XGG1034757
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:55:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=9IPS5TmzCBkUYq50HKth
	yh6opnGe6lVtdHPipIOQpTs=; b=jSniGa++7ZCOOdJEGsdbkAbxz1ILM17NcXhm
	4rCFj2H+AA2f/rLU3ouY3Py/0jE8zPlPzmEAPON1SaAmxEMNphue3xlqenYJDTbe
	6AVqm/xNbHPpydL5PMK4mAoxxoVS8lGapuCqU7L0ZUMR0z1DxqzIihldHw2txLk6
	MxZbyNCyZTKCq4/2ijJPsU20BGjXdZ5HQ0Tv5osInVeiU02bfiLnhrg89kqKLsen
	3TGa+Irgd29Yvf3AuB7Yx1B6A9MtoIikcxsJjmo1B3dErfnuzJUQfTYRI2VwOW8C
	QnBPmrKR/kmLnfYgAQi3HOqR4AktqYEzGNQldn/YUn7B8tyKbQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4d0m7ur4mt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:55:45 -0700 (PDT)
Received: from twshared6524.02.snb2.facebook.com (2620:10d:c0a8:fe::f072) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Thu, 19 Mar 2026 22:55:43 +0000
Received: by devvm6375.cco0.facebook.com (Postfix, from userid 721855)
	id BAB72718EE5A; Thu, 19 Mar 2026 15:55:38 -0700 (PDT)
Date: Thu, 19 Mar 2026 15:55:38 -0700
From: Ted Logan <tedlogan@fb.com>
To: David Matlack <dmatlack@google.com>
CC: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
        <kvm@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Matt Evans <mattev@meta.com>
Subject: Re: [PATCH] vfio: selftests: Build tests on aarch64
Message-ID: <abx+6mcpGwt0MzrG@devvm6375.cco0.facebook.com>
References: <20260317-vfio-selftests-aarch64-v1-1-2266077563e7@fb.com>
 <abw5ng4M14Je2OfU@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <abw5ng4M14Je2OfU@google.com>
X-FB-Internal: Safe
X-Authority-Analysis: v=2.4 cv=ROy+3oi+ c=1 sm=1 tr=0 ts=69bc7ef1 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=8elwO82fXORLTBIkMd32:22 a=VwQbUJbxAAAA:8
 a=VabnemYjAAAA:8 a=FOH2dFAWAAAA:8 a=4HMHHBYQn7QH22SDB_8A:9 a=CjuIK1q_8ugA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE4NCBTYWx0ZWRfX4y/rs10wuaLv
 pOgVAvxS9xiByqXiY0I1GcUW2dI+afPNUkbek9nN+DJojGD7PwN2SBF9l9FhKrj0E/8vPfi8d8b
 3bjybUKSSDAvQiNL2q+2rCSRD3tDY9dMu6gRwdWoAsK0Gt7ubG5BAcloyNK3VwJ9aOi+x16UNzO
 fBXPIf7VAi7BtX8Pgkk6szLNzxhHf4+1kDXZJrpyeAzVqMXkSAEGzfnb+JBQMScWsMR7/FDjJG7
 awDDHudW7SiGhWG6nS9E8bTbg4PnPe/XATRX3pwyVUg5Bv+YBsrPXtyIGe9bUHOxywz2Idv7o6s
 MYdLxSCkHmex1ASePOVKRehrUc2JI8viXNSx08dCScclWNBY4cSq2Ry44IiZLgk3eSt0khhBAJk
 UfV8oGWHeSt2nrO85cZVkpKdscshm4835ba2oGAiOc8W2lVx8OobeHLD5LEEzKagt0G4o5sjSGO
 zMAd4v55Ib5DCU460Cw==
X-Proofpoint-ORIG-GUID: o98ypAvUfdABjapa9Gt3DFn9mZEjFCx5
X-Proofpoint-GUID: o98ypAvUfdABjapa9Gt3DFn9mZEjFCx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01

Hi David,

On Thu, Mar 19, 2026 at 05:59:58PM +0000, David Matlack wrote:
> On 2026-03-17 04:25 PM, Ted Logan wrote:
> > Also build vfio self-tests on aarch64 variants, in addition to arm64 and
> 
> s/self-tests/selftests/
> 
> > x86_64.
> 
> This could be worded better to clarify that this is about fixing the
> VFIO selftests to allow native builds on arm64 host platforms.
> 
> > 
> > Reported-by: Matt Evans <mattev@meta.com>
> > Closes: https://lore.kernel.org/all/e51b4ff2-13c4-47d4-b781-3dcbd740d274@meta.com/
> 
> Please also add a fixes tag, since it was not the intent of the original
> commit was to disallow native arm64 builds.
> 
>   Fixes: a55d4bbbe644 ("vfio: selftests: only build tests on arm64 and x86_64")

Thanks for the feedback, I'll add that to the next version.

> > ---
> > Signed-off-by: Ted Logan <tedlogan@fb.com>
> > ---
> >  tools/testing/selftests/vfio/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
> > index 8e90e409e91d..98bc8d6271a4 100644
> > --- a/tools/testing/selftests/vfio/Makefile
> > +++ b/tools/testing/selftests/vfio/Makefile
> > @@ -1,4 +1,4 @@
> > -ARCH ?= $(shell uname -m)
> > +ARCH ?= $(shell uname -m | sed -e 's/aarch64.*/arm64/')
> 
> Perhaps we can just include tools/scripts/Makefile.arch to avoid having
> to maintain yet another "uname -m" translation?

I took a look at tools/scripts/Makefile.arch and it includes a
translation from x85_64 to x86, so it doesn't look like we can use it to
distinguish architectures here. It sounds like the simplest thing to do
is add aarch64 to the list of allowed architectures so I'll do that in
the next patch.

> This would make it harder to prevent aarch64_be though, which Alex
> indicated we might want to do.
> 
> >  
> >  ifeq (,$(filter $(ARCH),arm64 x86_64))
> >  # Do nothing on unsupported architectures
> > 
> > ---
> > base-commit: 96ca4caf9066f5ebd35b561a521af588a8eb0215
> > change-id: 20260317-vfio-selftests-aarch64-636abf0f7674
> > 
> > Best regards,
> > -- 
> > Ted Logan <tedlogan@fb.com>
> > 
