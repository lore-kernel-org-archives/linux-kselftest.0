Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513573;
	b=G7AwXbXUrUojkxPG/w6htzpmgU09WiiCBK8vuEOPboXn68w64+GWDrDEru71WJwao4M2
	 9Izp08kMIF8ki6dJIuN41hrbKbkZuhMH4Ys/Hr0nEYQ+ardcVEAE2A0s2scFTExTUjy+5
	 nqiAXGJd46CAOsw6AajWpPgBS7bHtMVklqJXjzZFO8rDRsjjX/2+euEFyWcuAinue+Lk8
	 QTQvEWRPYQ2hxz4GCtbOtHjLkPOUVKrGhwrGhpDEwS3jZlcNoJxFlbUyK4Mlu23zFhepA
	 KJsxOYNyxjXHrB7BT9neaO2v/NKjrKG67y/DGm+QAph0KLCvSAaDDIeX89QDU7wRvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513573;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=QgOaD2sGhHLvgQ/WAadfwK/Axpzdwleq8en3NwgVOJo=;
	b=S64ao/OliVm7xXkIL4WoI6DflA3a9z6n5RyfH7v010l7XmvpfX0VloLNAx9RqrSsFaCl
	 QoVf6bUGi/jzWWwob2yHSrqOJQ/xzXwuC7WlcpaoVLQnnN7f4VFYT0GgV54SDGqBnX57k
	 DGBban2YXZy6i03X++NH8wCMe/km2vaSVV84CDKF49qrWJrEuLEFyQm4Nlw3FlCCJQO4/
	 eKmYY7dMJvxf7TNgE2Yyg2v0TVNuC7ZscngWoTwQrbqOWybWVz8FpNF0+OKncN9pViZQh
	 wbjvE0iT8TOTn/c76ler7rjh25GZ2d8ZLg/xb2iGoEo1c79hM+t0kVUuIHzdPRks15w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=fEVHWVNQ;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A696070AB1;
	Tue, 24 Nov 2026 09:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A696070AB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=fEVHWVNQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795513572; x=1827049572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QgOaD2sGhHLvgQ/WAadfwK/Axpzdwleq8en3NwgVOJo=;
  b=fEVHWVNQYv1mwoQ86r7ca0GyxF7DC745kASKYlZMVVpNBCjyrY3G+X4h
   I5GGJgyOO108XpmiVNg7dj/ICEFb1uAQX24W/GmkkcKYBVCHY5si6OiEh
   RhWpfDT0v1Yc5k5Q9V2/yuC4IIktpDqlvTKQaCcrvZgURA8AVukZabD2M
   wnghHQK5zVtW8oGi/UofbNO7FrEwsrP/EoQ75WjbCGjA06cTDnYUZdVUe
   4dpqy/hjECeSRatTDgW3tZ4hvPq1xDBgPwC3Z9UPoY5/zKc1GXi8V+hh1
   Dr/2C7GgosepsDl5y8XFwHRNIYJT2vWzzzBEsNsZOuf1e8cToooOAn7g0
   A==;
X-CSE-ConnectionGUID: ROr9ATzTQSmqXCPMRr+lpg==
X-CSE-MsgGUID: 98RO/pf2TwqqC4417zjIlA==
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="34796943"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:46:08 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:26892]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.116:2525] with esmtp (Farcaster)
 id fcd550e1-f261-4abd-988c-9c0171865421; Tue, 24 Nov 2026 09:46:08 +0000 (UTC)
X-Farcaster-Flow-ID: fcd550e1-f261-4abd-988c-9c0171865421
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Tue, 24 Nov 2026 09:46:08 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Tue, 24 Nov 2026
 09:46:04 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
CC: Fernand Sieber <sieberf@amazon.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, "Shuah
 Khan" <shuah@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel Gorman"
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "K Prateek
 Nayak" <kprateek.nayak@amd.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	"Josh Don" <joshdon@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <nh-open-source@amazon.com>, Fahad Mubeen
	<fmubeen@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Misha Karataiev
	<karataev@amazon.com>, Hendrik Borghorst <hborghor@amazon.de>, "Ibrahim
 Elshahed" <lshahed@amazon.de>
Subject: Re: [PATCH 4/5] sched/deadline: Don't charge core-sched forced idle to the DL servers
Date: Tue, 24 Nov 2026 11:46:03 +0200
Message-ID: <20261124094603.67808-1-sieberf@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124080737.1988-1-kmehltretter@gmail.com>
References: <20261112161548.78189-1-sieberf@amazon.com> <20261112161548.78189-5-sieberf@amazon.com> <20261124080737.1988-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyNCBOb3YgMjAyNiAwOTowNzozNyArMDEwMCwgS2FybCBNZWhsdHJldHRlciB3cm90
ZToNCj4gV2hlbiBmb3JjZWQgaWRsZSBlbmRzIGJlY2F1c2UgdGhlIHNpYmxpbmcncyBjb29raWVk
IHRhc2sgYmxvY2tzLA0KPiBwaWNrX25leHRfdGFzaygpIGNsZWFycyBjb3JlX2ZvcmNlaWRsZV9j
b3VudCBiZWZvcmUgdGhlIGlkbGUgQ1BVIHJ1bnMNCj4gdXBkYXRlX2N1cnJfaWRsZSgpIGluIHB1
dF9wcmV2X3Rhc2tfaWRsZSgpLg0KPg0KPiBmb3JjZWRfaWRsZV9ycShycSkgc2VlcyAwIGFuZCBj
aGFyZ2VzIHRoZSBmb3JjZWQtaWRsZSB0aW1lIHNpbmNlDQo+IGlkbGUtPnNlLmV4ZWNfc3RhcnQg
dG8gdGhlIHNlcnZlci4NCg0KVGhhbmtzIGZvciB0aGUgcmVwb3J0LCBLYXJsLg0KDQpUaGUgZml4
IGFuZCBhIHNlbGZ0ZXN0IHdpdGggeW91ciBwYXR0ZXJuIGFyZSBoZXJlOg0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3OTU1MTA5NjAuZ2l0LnNpZWJlcmZAYW1hem9uLmNvbS8N
Cg0KVGhhbmtzLA0KRmVybmFuZA0KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRyZSAoU291dGgg
QWZyaWNhKSAoUHJvcHJpZXRhcnkpIExpbWl0ZWQKMjkgR29nb3NvYSBTdHJlZXQsIE9ic2VydmF0
b3J5LCBDYXBlIFRvd24sIFdlc3Rlcm4gQ2FwZSwgNzkyNSwgU291dGggQWZyaWNhClJlZ2lzdHJh
dGlvbiBOdW1iZXI6IDIwMDQgLyAwMzQ0NjMgLyAwNwo=

