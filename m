Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911630;
	b=w5xgkmjjTu581xivRgSNGAj8oIaHk9t00TlNpso0X2x8COZAG4jGDZm4dOYPEjOCRxlx
	 V8R6T881D8/JZ8j6QCN78CXP8dSd1QI7tPK1hh7m1DhhUMNxmQbtZhHr920a4LQfcq+ZJ
	 flR2JJm6FW/I1IWRsCqi7c4pj9MHg9bddLB9EzM7NtjgCtUsv6dr3LcDO44sxH+r5nsQs
	 henCTeZ84ahxSreol4kOkEJQ8xL00n44dpq4by2s/StPkoSRcWxlAmSMwoR5mWTT/1wnc
	 5vKZrmp0tqBqLLTJVNdS4ThbTnlERAJB1YswIOKgCXW8uEvRbP2zkcfSg1eXtAxBLSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911630;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=Mwp2JsfQ9y1vNZwCYUi5p1qF6/L43HTWSe+6S+JCKms=;
	b=U4l6AnoCs9g/R5or6MokGyeHxaK4QJYelXU1KZpVH4rJ0BgvhAPealh2hh3bNE8yT5y2
	 EkCN4CBSIFC0vljm4vBLrvQ2z0zd5+Upi9Mk+uRMOYs2vZ8Uzk7LIXOzDfM8cmhNGPaYi
	 8KGAiUVEUNDa1Ed+0Uyy+4eGsFiWIf6Sjb5jrvIv5rNe0EKAn1TqurwTHzeIhXAyMCnSI
	 qzoosAQ7VQzbARPezz4J01xzvGzu38aSO2cy5c/Aw9Mi0OMWrAs2t9HjzhmEnSaPqnGXJ
	 SkQpImBJpjD9Q/PTRsulataqDeuQTE68mxPoq8OUJc44e0UXqh1rwoDNwRE0EhVGcyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD249606A31C;
	Tue, 17 Nov 2026 10:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD249606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 18E03486D2;
	Tue, 17 Nov 2026 11:33:41 +0100 (CET)
Date: Tue, 17 Nov 2026 11:33:33 +0100
From: Gabriel Goller <g.goller@proxmox.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, dsahern@kernel.org, idosch@nvidia.com, nicolas.dichtel@6wind.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] ipv6: always apply all.force_forwarding to
 every interface
Message-ID: <avwtH0OKZzGYQ1lW@luna.proxmox.com>
References: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
 <179475857004.2199510.11986005836315752622@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179475857004.2199510.11986005836315752622@kernel.org>
User-Agent: NeoMutt/20260504
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794911619870

On 15.11.2026 16:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new selftest test_all_force_forwarding() in
>   tools/testing/selftests/net/ipv6_force_forwarding.sh fails every time…
> 
> --
> 
> ipv6: always apply all.force_forwarding to every interface
> 
> This commit changes addrconf_sysctl_force_forwarding() so that every write
> to all.force_forwarding is applied to all interfaces, even when the stored
> value does not change. It now takes RTNL for every write and sends netconf
> notifications only for actual value changes. It also extends the
> ipv6_force_forwarding.sh selftest to cover the new behaviour.
> 
> > diff --git a/tools/testing/selftests/net/ipv6_force_forwarding.sh b/tools/testing/selftests/net/ipv6_force_forwarding.sh
> > index bf0243366caa7..383d1ec64f1c1 100755
> > --- a/tools/testing/selftests/net/ipv6_force_forwarding.sh
> > +++ b/tools/testing/selftests/net/ipv6_force_forwarding.sh
> 
> [ ... ]
> 
> > +test_all_force_forwarding() {
> > +    local ret=0
> > +
> > +    echo "TEST: all.force_forwarding"
> > +
> > +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.veth21.force_forwarding=0 || return 1
> > +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.force_forwarding=1 || return 1
> > +    check_force_forwarding veth21 1 "all.force_forwarding applied to interfaces" || ret=1
> 
> [ ... ]
> 
> > +    # Disabling all.forwarding resets force_forwarding, including on all
> > +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.forwarding=1 || return 1
> > +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.forwarding=0 || return 1
> > +    check_force_forwarding all 0 "all.forwarding=0 resets all.force_forwarding" || ret=1
> 
> [Severity: Medium]
> Can this check ever pass? Earlier in test_all_force_forwarding() the
> script writes all.force_forwarding=1, which stores 1 in
> net->ipv6.devconf_all->force_forwarding.
> 
> The later all.forwarding=0 write goes through
> addrconf_sysctl_forward()->addrconf_fixup_forwarding(). The devconf_all
> branch there only updates devconf_dflt->forwarding and then calls
> addrconf_forward_change(net, 0).
> 
> addrconf_forward_change() clears force_forwarding only in the
> per-device configs:
> 
> net/ipv6/addrconf.c:addrconf_forward_change() {
>     ...
> 	for_each_netdev(net, dev) {
> 		idev = __in6_dev_get_rtnl_net(dev);
> 		if (idev) {
> 			...
> 			if (newf == 0 && idev->cnf.force_forwarding) {
> 				WRITE_ONCE(idev->cnf.force_forwarding, 0);
>     ...
> }
> 
> Nothing resets devconf_all->force_forwarding (or
> devconf_dflt->force_forwarding) when forwarding is disabled. So
> sysctl -n net.ipv6.conf.all.force_forwarding should still return 1 at
> this point. The check would then print "FAIL: all.forwarding=0 resets
> all.force_forwarding (got 1, expected 0)", and the script would exit 1
> on every run.
> 
> ip-sysctl.rst says the flag "will be reset on all interfaces". That
> matches the code, not this assertion.
> 
> Should this assertion be dropped, or changed to expect 1? Or is the
> intent for all.forwarding=0 to also reset conf/all/force_forwarding in
> addrconf_fixup_forwarding()?

Already fixed with
a76e8bf4be55 ("ipv6: reset all.force_forwarding when disabling all.forwarding")
AFAICS.

I should have added a b4 dependency on that patch, then maybe sashiko wouldn't
flag this...

> > +    check_force_forwarding veth21 0 "all.forwarding=0 resets interface force_forwarding" || ret=1
> > +
> > +    return $ret
> > +}
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-ipv6_always_apply-v1-1-8df846631005%40proxmox.com

