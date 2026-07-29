Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD0423D297;
	Wed, 29 Jul 2026 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284836; cv=none; b=EHSqez/G4gSUUD/I8iUryO/m4Xzbd45jy8C3d8eEHIPcSV4PUkMADtyKSmjpSJtJpFCdz9aLrwlaeKvw5bSYvMETt14bfiIyiFkH8U8GJG6M3XQ/DI6x4eB5RJ0KS27n0u24GPouvTfKhUFzjh6KQVg/i6ErKY/2qYWv1KbW51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284836; c=relaxed/simple;
	bh=MkZT+7fGmXsApEErl2/I/guIQL4Kcbtr9+Bj8yDBa0g=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=V9OIQNkPy9sRYVntdYb+69933GN0aIof76M29hTC58j06ZqTO9f5ghjd64e+NiZCWfc944QEN4Dhe+cfioygVr53+vieEN8gdyZqHlhd3B0+oQTX7nx8PRjOthEcesfqXD+NI2wg5kPjMp2Rhskq0oPw+iYKT0i7ehqL/y0F0xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Nw4AohJ7; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Nw4AohJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785284834; x=1816820834;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=iQ5llY6iOef1RRg/cPJrxuekU+yaAV2stezW1ZAqZT0=;
  b=Nw4AohJ7DGuFstg7pGiPbJwr3pjNuGMaIY3UZH7Qo2I+0nvZRSu3JhOf
   Mn3fkdx2hNVOsFNhpwTx9H1LvuaHwc6oStDJXrVQ3UOk7PG0mUTxzn4ys
   3G96Ssy1DjgJBN9RYVUIGxj62oK9AdND1l9gz+1pqXx0TMlhYt24g94eY
   FbcBjLsTlvwmiLuVs3CNdL+1ONJWlnF2cDHhhxnDRzz6ND+c1BzroxE02
   izJFkwNZAOoO9yai1H711xskQflmrXE+kjRWkhRDDYIujIH0LPee+gnip
   y5IhD9sLKYj3IJipBcjM8UqmFmb405G1ZlKk5gfFbBwVANv3Sks8klTs7
   w==;
X-CSE-ConnectionGUID: vN0n4Hf+STm89t1eW0hD1w==
X-CSE-MsgGUID: c7D5PAm5QmWrlL3vlTVT/A==
X-IronPort-AV: E=Sophos;i="6.25,191,1779148800"; 
   d="scan'208";a="24554413"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 00:27:11 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21377]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.56.7:2525] with esmtp (Farcaster)
 id 8d44f132-3b92-4639-9abd-0ffd540d3a4a; Wed, 29 Jul 2026 00:27:11 +0000 (UTC)
X-Farcaster-Flow-ID: 8d44f132-3b92-4639-9abd-0ffd540d3a4a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 00:27:11 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 00:27:06 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next 1/7] ptp: Add ioctls for PHC timestamps
 with quality attributes
From: Arthur Kiyanovski <akiyano@amazon.com>
To: Carolina Jubran <cjubran@nvidia.com>
CC: Jacob Keller <jacob.e.keller@intel.com>, Arthur Kiyanovski
	<akiyano@amazon.com>, David Miller <davem@davemloft.net>, Jakub Kicinski
	<kuba@kernel.org>, <netdev@vger.kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner
	<tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, "Yonatan
 Sarna" <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, "Alexander
 Matushevsky" <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt
 Wilson <msw@amazon.com>, Anthony Liguori <aliguori@amazon.com>, Nafea Bshara
	<nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal
	<netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt
	<benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon
	<darinzon@amazon.com>, Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik
	<ofirt@amazon.com>, Amit Bernstein <amitbern@amazon.com>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
	<vadim.fedorenko@linux.dev>
In-Reply-To: <0d9c8e9c-c418-4ba9-b24a-6070e402ffad@nvidia.com>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-2-akiyano@amazon.com>
 <e58af0ae-ad06-4f77-8ebd-f3678d6dde66@intel.com>
 <178418934680.25423.291292029139415698.b4-reply@b4>
 <79bbb277-e396-461e-8104-a9d62d47c299@intel.com>
 <0d9c8e9c-c418-4ba9-b24a-6070e402ffad@nvidia.com>
Date: Wed, 29 Jul 2026 00:26:58 +0000
Message-ID: <178528481829.4304.11280701780039479619.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-28 11:10:31+03:00, Carolina Jubran wrote:
> On 16/07/2026 21:14, Jacob Keller wrote:
> 
> > On 7/16/2026 1:09 AM, Arthur Kiyanovski wrote:
> > Right.
> >
> > Absolutely. I don't think that should change this patch series. Its just
> > a thought that we might want to tackle this at some point as the ioctl
> > interface is clearly reaching its limits.
> >
> > Makes sense. Leave it up to userspace to coordinate and combine relevant
> > data from the device/driver and the daemons together. Ok.
> 
> That assumes host userspace knows about the synchronizer. That is not
> always true.
> On a DPU/SmartNIC, linuxptp may run on the device side while the host
> has no visibility into that process. There is then nothing for host
> userspace to coordinate with, and no way to learn the clock quality.
> What should happen in that case? Would it make sense to also allow
> userspace to set these attributes?

That case is actually the primary motivation for this interface, not a gap.
When the synchronizer runs device-side (DPU/SmartNIC), the device knows its
own sync quality and reports it to the host through these read-side
attributes — no host daemon to coordinate with; the host just reads
error_bound/status/timescale. ENA is exactly this: the device computes the
bound, the host reads it.

Letting userspace set these attributes is a separate feature (a host daemon
publishing quality to other host readers of the same PHC). It doesn't help
the DPU case and raises shared-clock questions (authority, permissions,
races), so I'd keep this series read-only and explore a set-side path as a
follow-up if there's demand.

