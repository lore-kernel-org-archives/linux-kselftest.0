Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027270;
	b=TEMIn0mbJ25SAXa31FSn1ukdYv/F+Zr5NWfz4R5+75JM/eVwuy08+dCJEv2I53X9Lslb
	 zmBEiGncbC0zqUNg19j+zITJZW8dUXsJ3MuF/vKz48y+5nmSK6wYj9bU5YySFptfEgMkZ
	 ILbgKp5siK12PN1OFn7Xv2b4tXQTyD+rnHR2fm6cM/j4A1i0cIlPNdWozmcq6FMkISCTr
	 ZKMpazSc/jLHl9fYCt7Mgp334j5kwnba8alTyRWzA+40aHD/uEOXYS5V+feV9HfoacZpw
	 bp8ciDl1rFT7LOAuUnjDTrDoJwMIvagd1+5oqDZ1LnRX86E0KGG8GePq4FPMYeqNzkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027270;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=QeBBXOlfrLNkClrMkLRqTkyWIPY5S5c/FDhckbc/h5k=;
	b=F+rsZ4L66HHABKaJez16GJJxDKk4YEtx2bFkuZGx6E6r2x60GvzwdY4sB+EYOhqlnJVo
	 UdnuL8/9eyKnCM3j0xBjfiD1dssXfiapZrMfS8SesEtyFGmCnKfE30oVwKgpbfjliuI+x
	 15DJhp1HqQ+bPQRxPP9TZGS4xslrgKODEnfxyUNoL+eGIbKLst6Ot2G8f0vD7PDc4MENR
	 ATELvUZwRsl7J/U+TPCYFBW+DmJr+TP4wsJ+pR/R0OaC3OGind2kJ1bjAMZtw+5G3Uq8+
	 v7BOK9vAHhJUsNv/GXuslN7qhyHsHHQ3GXz72jrSTpy23El3JFmNbrrmdTml7YonDBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=q8BXsBcr;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE99606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 18:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=q8BXsBcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795027269; x=1826563269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QeBBXOlfrLNkClrMkLRqTkyWIPY5S5c/FDhckbc/h5k=;
  b=q8BXsBcrf7VLcl3QSPaIm0+hQEekbal34Yu6yB0JB8Zf+30ePv72vjdC
   glqyS7SFG0scij8m6/z2CQKtDhIK0Zc2Yz0yN0VZ+t0AGGXXka3O91PEh
   OA+Wev9w1N5Q7srCj32vUQlWAYs+qBZzyNxvt6bLpiR0U1vI1dLA+Idke
   XbtPPcCmRtt+HmC0pFWerwcnEUxI1BSG/LJ9CLYOQVEfIHnwJtnYO5axe
   W1O60k0m1lBwi82szKWNPFyOvcaqi4DXzJkUN/Y/mdEsn3OLku+CuZmO6
   eP7S4dIshHgUlLn30JX/2Csk3oc7SRSD+uh+l4/XgcJYECSk5SnqnbtYr
   w==;
X-CSE-ConnectionGUID: ZoBT2TxJSBK8JWyUhHdQ/g==
X-CSE-MsgGUID: gs6TZ0Q0Sxiv9o3wGAaKlg==
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208";a="34336987"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 18:41:09 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:24888]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id b365bfda-2b16-4889-bdad-109873107649; Wed, 18 Nov 2026 18:41:09 +0000 (UTC)
X-Farcaster-Flow-ID: b365bfda-2b16-4889-bdad-109873107649
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 18:41:08 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 18:41:07 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Bernd Schubert <bernd@bsbernd.com>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>, Joanne Koong
	<joannelkoong@gmail.com>
Subject: Re: [PATCH v8 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Wed, 18 Nov 2026 18:40:57 +0000
Message-ID: <20261118184057.630761-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
References: <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Wed, 18 Nov 2026, Bernd Schubert wrote:
> We happen to have an online meeting once per month and the next is tomorrow,
> would you mind to join?

Hi Bernd,

Thanks for the review! Yeah, I would be interested in joining the
meeting. Could you send me the time and link (presumably off this
thread)? I'd love to find a way to improve performance for this routine
pattern in FUSE, but I understand that it is a bit challenging to model.

Thanks,
Jimmy
