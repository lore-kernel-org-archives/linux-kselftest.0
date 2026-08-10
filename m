Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849E2FFFA4;
	Mon, 10 Aug 2026 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385692; cv=none; b=jp78NapToB5yEzmsIiomcHrhLC5/vw2PGEjj+Oz3LNZ7d7nmPA62wgXNzL8KVc5NOVm7zVPmzV/IZyNflIxqEU+deNxieeOTQEKcR+85lTUmUxNxP94g5F4JMlBf+8+0Wpn9C0hblCRH7U5um/CDD+uA9ige3yW8ZeJBCX22Xoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385692; c=relaxed/simple;
	bh=7FCDNAJf754g9ThUIWfhj0JsG/kwCOjfqjOlpIMGuds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+vxSZTiVBQvs5eF1KNz56sj0GmUuXr6yoas7MWbfbiz6jY6mE+/KYQQi+tzcYNxqWR5PFjIqktHovOvwxqJOiFmypyRtnZ0F/H0I76ruweKhYQOx2AVbc+ZtVX2gtccMVy+IDoJoi3JvTCpoGv+FRXco8KfWDCYdgbOFBouKKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXyMVZf0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXyMVZf0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4017B1F000E9;
	Mon, 10 Aug 2026 18:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786385691;
	bh=dMZrLhd95Z+l3YT7FvBLisejImxLm9Qc82s/7wFoEZk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lXyMVZf0JVOO3VasjDG88/5wEbtb0ZnOLMMncRA7qqseMTRgpihDwmvd3K7Iyy4OW
	 qFIp5f3fyG1bgP/lCe79jVRkO9riOzSlXJQJOvO+W3njxVkC8ayHpCacQ1SuZG6Agb
	 8Ge5/CcfxXvlOGNJMDHlsn+1S4ivp9HTdx8ksJtXBWcqqagdTDo8SVAhQz51Qc6FKC
	 WELsHugdqi8FkN18O2Sq0nsPqFh5Nq3q9nxGObpmMGWRp6T5EMy03sWXvOY1ADw6fW
	 UUdwZnPlAya42sfwV3fkpeYB0nFDnxdzQmWGf8r5lxqaVn4e8/qtmqYoIZLdu+O706
	 d6X4fJUal3vWA==
Date: Mon, 10 Aug 2026 11:14:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jv@jvosburgh.net, shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: bonding: disable DAD for IPv6
 addresses
Message-ID: <20260810111450.176b34d6@kernel.org>
In-Reply-To: <ankxIiVLu3qY5jw5@fedora>
References: <20260808162345.2442594-1-kuba@kernel.org>
	<ankxIiVLu3qY5jw5@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 10:02:10 +0800 Hangbin Liu wrote:
> On Sat, Aug 08, 2026 at 09:23:45AM -0700, Jakub Kicinski wrote:
> > bond_reset() waits up to 2 seconds for IPv6 connectivity.
> > With default settings DAD itself may take almost 2 seconds,
> > causing flakes on debug builds. It used to flake once or
> > twice a week, recently it started failing once a day.
> > Probably some downstream changes to scheduler, or our machines
> > go busier.
> > 
> > A lot of selftests already use nodad, let's use nodad in bonding, too.
> > I don't see an obvious reason why DAD would be important to the test.  
> 
> In this case, how about add nodad to all IPv6 address setting on bonding
> tests, e.g. bond_options.sh, bond_macvlan_ipvlan.sh.
> 
> After that, we may event remove the sleep time in bond_macvlan_ipvlan.sh.
> In my local testing all the macvlan/ipvlan test passed with nodad set.

Can you do that as a follow up, please?

bond_options.sh is the worst offender for flakiness right now.
I would like to squash these flakes ASAP.
