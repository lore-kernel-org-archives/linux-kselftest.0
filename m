Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388259;
	b=Im7B2Mn+HvVWDemD2qS6lpLnO2V8RoE7PtUeOJ4WwoYpQtkbbMMyz9m9YVjEyAdBL9A9
	 fSOM/Ogd92BfMwYttnxpzi/0ol12Biavo9ySRiaGrAOmO2DBh801tMc5YOQH1pz9Ybrga
	 N2r4iBAmOvQxqb4+bca2nsQdQUfaokEyVzp0/47YegAO9wRe6D5Q0/ixpfYtaitOXmQ7E
	 vr+L12yXq/NuLEcekVpU9f6JZhHbAnRYReuyFz7RJRVbT5rJEiA2C/dMBPoCWCrChX5El
	 5LDtio68SVdREBN9lZ1RQzgSA4wwCbjGgX5Ae9KCK6FS+SSlgaueMVWtied8q+12X0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388259;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=pkezIO5EgOZugo4H5IpRr29h/eZHVxjAk1pOcW+pZUg=;
	b=MU/ZpprX7XQx8EKTki6uLWJwdXhxk6mHwhqVEGZA8ZmVpC0dVT6rxnBynt3gM8su2ViY
	 PI2EXNIpjE+2vs3upP5/MuNWoF33JRISOuIHQxxu21h5KV2MW2z4yL2AGLL0L27PZ5uUI
	 co6yP142cMDxNJh4RzVC68sMEPJfzLlaF9RFuhuX41dYFgC6Y5M09tQfMGzcovK3VTVaV
	 aY8MgsDeCuJcdKCpWbu/hjzXKhZe9FN8W6dKA8EE1MZh/dJOBeHiM8wmjEYBHW3z7sdJb
	 vCGuftEIUSCnZqPKT/GMCQiknGilkCLeKaCCHuV5OgYEDwwAmMbkDuBkBvM3P5aayAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8EC606A320
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 19:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B8EC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793388249; x=1824924249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pkezIO5EgOZugo4H5IpRr29h/eZHVxjAk1pOcW+pZUg=;
  b=O8VaaUTb2Y1VstjwYeiKAddvhIeQQLA+yprdVdPkNLhYMS2wO0X5V5nI
   Rn+eNxuqvJzIq005F4aE2O1v5TLsK4MvyDr2VQOTTsk4+5e+36BeF2i/K
   nN9dUG2xNFauylwajJ2sPrFuX2kgLVC9YVAPT52FkExUoCaR800WxjGaI
   thIP2F+/G7LsNVgkyPrQno0pjGTcULPCB4K0Dm15MtMNWJShV57Nzankj
   0W2TfxVyL9vXMeIsMkM3bsw3j2i2BfLv9uO6Yg4lbh6BGucLDJ5A5zObZ
   JFUzaavnywY2wSQm0nZmPJXn58MKmOpUalflN/e4VMBS/KVlI+q02Tsns
   Q==;
X-CSE-ConnectionGUID: XW7VraI7QoerkK5AUENd8A==
X-CSE-MsgGUID: ER1+0G/GSyOnJbhMTZgHJQ==
X-IronPort-AV: E=Sophos;i="6.27,186,1787011200"; 
   d="scan'208";a="32602116"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 19:24:08 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:24377]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.21:2525] with esmtp (Farcaster)
 id 7f75e6f1-28f2-4c6d-bf2e-bec889c1f73e; Fri, 30 Oct 2026 19:24:08 +0000 (UTC)
X-Farcaster-Flow-ID: 7f75e6f1-28f2-4c6d-bf2e-bec889c1f73e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 30 Oct 2026 19:24:08 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 30 Oct 2026 19:24:07 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: NeilBrown <neilb@ownmail.net>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Subject: Re: [PATCH v6 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Fri, 30 Oct 2026 19:24:01 +0000
Message-ID: <20261030192401.2543699-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179332437497.269288.7305999595462479305@noble.neil.brown.name>
References: <179332437497.269288.7305999595462479305@noble.neil.brown.name>
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
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Fri, 30 Oct 2026, NeilBrown wrote:
> > - any other file: the server returns the entry only, and the VFS opens
> >   it;
>
> Why is this a requirement?  I understand that the server *may* choose to
> not open the file, so that the open doesn't happen until after the
> permission check.  But shouldn't be up to the server to decide.

This doesn't have to be a requirement, for regular files the server can
open if it chooses to. I'll reword. Are you also asking why this is just
regular files and not directories too? I could look into that if you'd
like? For what it's worth, special files should never get opened by the
server on this path, the kernel opens them itself.

> > The VFS checks the open after the reply, as for other ->atomic_open()
> > filesystems, and the kernel releases the file if the check fails.
> > FMODE_CREATED is set only when the server reports FOPEN_CREATED.
>
> The above para seems to suggest that the server might open a file that
> wasn't created.

Yeah, atomic_open is a lookup+open on the FUSE server, and that open
might be an open-create or just an open. Either way, the server might
open a preexisting file. I'll try to make all of this clearer in the
next rev, once I've gotten any feedback on directional changes here.

Thanks,
Jimmy
