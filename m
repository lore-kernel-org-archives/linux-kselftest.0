Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311654;
	b=ZeVhNkhMPPk4AJ9imDHJUOfmf11vxc+1kqQKbwxahK3DaoJGOhIC1Yt/UfSp70KlFp2+
	 ZzPVdg4pKnBv60ziz6aTunD8xgYQAuG9SyauKWb/VOlFao0CWSW+bJKcCQKUMRpRTBd60
	 jmfdpKpbAHse5DmpzIfLUA7LsMHwwXPf7F/KKhGn3qAPJFgS2yHIc7EYgb62qvtJ+HPQF
	 tRwmyELSCnvPyb9L8oTAZaiwII6m/rvX/Qo7/97bNt/2KLyVYKd6br/0uhN1vn5K4wpRu
	 M3CMRQXagSrEPbYl97+ue8CP1x6nQs9/G8Nt9kgb4i1gXY4ZmtGXOxrpjKCC9dFPz/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311654;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=00Fdwn10rGQVzKW8pjIVBgoz/XU0RjZKEKOP68LF8SA=;
	b=dhBCx6ddPYRiHttxke055AACcUGMSZXzyP08klZmJsjQNmkWxvy0dZsIoEtUXyRJ1Ibq
	 AGXuCXAbQG5ayJqIvzeLFqMepSAMF+uSEDHetEOwDhVo8ELoQ4wlWitCXXxwDIVNYv4FA
	 ufrZTDzr9IeXjPwOLW8zr4vE9f7AmQ+bQaISdBSj0zRsAdiOvJg8eERkDe+ZNzbC41GBz
	 P69pMqb3MzzDuS2b/RVdJPcn58Btxjs3Zom+9lPNv5RGlRT18LwOMSRzup1a0DxvbV8v2
	 s9u2SEaiggbFwcqxsGMncNm72gDQTmUJik6KCCt5pejOyX6/4BmNZtmu+XCRIlTbs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=fGDDh90F;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041F3606A32E;
	Tue, 10 Nov 2026 11:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041F3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=fGDDh90F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1794311654; x=1825847654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=00Fdwn10rGQVzKW8pjIVBgoz/XU0RjZKEKOP68LF8SA=;
  b=fGDDh90FeQwzuXd2dGDIxVaLAUTC34HC9UalHX5/m2sE2R+4O/NarqTE
   psn8lpE8LH/5EEICMjFbeRfy+AzDXBtyGkKEmG664Pmf24VGp2VdoOAnR
   pCU6bVlW46OjAXy+SQYmRICAcVDM28U1hF7GhZjRgKX77DrHkx/uemiB9
   RVyAMtq8CA0xsy3+qy42v24XHXvMj+7vWO5dCKq7O8raKa2fuYFZ2nRKd
   EdbAIk88/oJhKSx1pnvtdC/7387UMMo//OFqumRTZLia0k1q6dDwYRCPr
   Sblp/U2PeWbJqFwouEQaiaRfloL5uWWUhOG3c7fIHUtOkXNyBdMweHcXS
   g==;
X-CSE-ConnectionGUID: SVXNrMN+THCX9A4p6AfVrw==
X-CSE-MsgGUID: k3mSKaVWSnKq2dUmFntIYA==
X-IronPort-AV: E=Sophos;i="6.27,205,1787011200"; 
   d="scan'208";a="33384274"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 11:54:11 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:22431]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id 739f06b5-ed38-4d68-8e1c-236e5caac1a0; Tue, 10 Nov 2026 11:54:10 +0000 (UTC)
X-Farcaster-Flow-ID: 739f06b5-ed38-4d68-8e1c-236e5caac1a0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 11:54:10 +0000
Received: from dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com (10.169.119.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 11:54:09 +0000
From: Bjoern Doebel <doebel@amazon.de>
To: Hangbin Liu <hangbin.liu@linux.dev>
CC: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
	<shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, Liang Li
	<liali@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] selftests: bonding: feed link monitor to deflake prio_test
Date: Tue, 10 Nov 2026 11:53:52 +0000
Message-ID: <20261110115354.2250237-1-doebel@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <auvnnIXQV2zufxtF@fedora>
References:
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Hi Hangbin,

On Thu, Nov 05, 2026 at 10:19:08AM +0800, Hangbin Liu wrote:
> If the kill fails for some reason, will we wait here forever and hang the
> entire test?

No. bash keeps a terminated child's exit status until it is reaped, so if
the ping already exited the kill fails but the wait returns immediately.
Only a genuinely unkillable ping would block, independent of kill. The
idiomatic form is kill_process() from net/lib.sh, which short-circuits
the wait when the kill fails.

Let's disregard v1 anyway. Your question made me look again, and it only
treats a symptom: the Sashiko review was right that the mechanism in my
commit message was wrong. I'll follow-up.

pw-bot: cr

Thanks,
Bjoern
