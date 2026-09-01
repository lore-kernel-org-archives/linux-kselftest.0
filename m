Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F16E366048;
	Tue,  1 Sep 2026 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272479; cv=none; b=tGDtVKFiNEkIaqAIElmNKk9jtZMhUilZm8Vt0GJGGFNiEpM3hs2b+qdQrdiujGPF1S5ULV2mjYnCmlbAw9tadpm0Od6IhcJMUcS288L9C5JXHSBkbtRn5kmkgxcCAZmD1zsLRcaiWzTIVK16VXcLahkL6diNvAvJRD8l/GVJDzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272479; c=relaxed/simple;
	bh=WKx0dUE0doFC6+SAHC20I3U3fPMSdZd2MyvoNanlSuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhAy/Z7bMFe64SOw9banQAqjP5S1TKyFDvy85mzsZbOdKrXTshs1F9OR4t6QegkK+nxcCwQUJ7Q6Lig7JYe7f1rePgvWnxClSqrD+ES8j1NksmFUZ/woY+GlplEq61W10AJD7OIWbDt12FCq3+6SZjscw5nqUgVZ4OO6ozixf6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=t9fUmDEG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="t9fUmDEG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Qw1ecCgMMihyYP+SiQ//Ez6T8sZrR5bj2VsU7ndXDGU=; b=t9fUmDEG/FsEuhlufXePstuI5U
	zK5WPg7W/pwwBStlL2qLLV53/oLJuFmv8GdbgaJs3uqNYQe7o7sVyRicYa7oLmUjL6NW1c08V76Dj
	J0V3TYbw2XUzwDvWtcJijEaAl3hNzFYc0SRDcOtZxFjwJI/+j5w2CfUTBWE15Mzy+JyQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1PMG-002MrZ-Ud; Tue, 01 Sep 2026 16:21:04 +0200
Date: Tue, 1 Sep 2026 16:21:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <4892d03c-6493-4c1c-aaab-39d71ddf527b@lunn.ch>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
 <20260831150818.660de896@kernel.org>
 <apZ3f3vm5sUrcyrZ@fedora>
 <apaLl13Saka4Sw1J@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apaLl13Saka4Sw1J@fedora>

On Tue, Sep 01, 2026 at 04:23:51PM +0800, Hangbin Liu wrote:
> On Tue, Sep 01, 2026 at 02:58:17PM +0800, Hangbin Liu wrote:
> > On Mon, Aug 31, 2026 at 03:08:18PM -0700, Jakub Kicinski wrote:
> > > On Mon, 31 Aug 2026 11:28:10 +0800 Hangbin Liu wrote:
> > > > Add ethtool get/set_link_ksettings callbacks to netdevsim so the simulated
> > > > link speed and duplex can be queried and configured from userspace.
> > > > 
> > > > Move NSIM_LINK_SPEED_MAX and NSIM_LINK_SPEED_UNIT from dev.c to netdevsim.h
> > > > so they are available to both the devlink rate path and the new ethtool
> > > > code. The set callback rejects speeds exceeding NSIM_LINK_SPEED_MAX.
> > > > 
> > > > The default link speed is set to SPEED_5000 with DUPLEX_FULL, matching the
> > > > existing NSIM_LINK_SPEED_MAX definition.
> > > 
> > > This breaks TDC which uses netdevsim for taprio testing.
> > 
> > Sigh, I really didn't expect a speed feature could break the tc qdisc
> > testing... I will check the reason.
> 
> OK, here is the reason. In taprio_set_picos_per_byte(), it init NIC speed to
> SPEED_10. If the NIC doesn't support get_link_ksettings, the final calculated
> picos_per_byte would be a extremely large number 800000. The later tc taprio
> testing `tc qdisc ... sched-entry S 02 300` will always failed in
> fill_sched_entry(), as min_duration is also a large number 48000.
> 
> After we supports get_link_ksettings for netdevsim, the speed is 5000 and
> picos_per_byte will be init to 1600. The later min_duration checking in
> fill_sched_entry() is 300 vs 96. So the tc qdisc command always return 0.
> 
> To fix the test, I think we should reduce the interval number. e.g.

Why not just set the initial speed to SPEED_10, so nothing changes?

    Andrew
