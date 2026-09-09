Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADE839CCF7;
	Wed,  9 Sep 2026 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978961; cv=none; b=P/f1r6h9ABKBDdKNV0MDhcQIVGQIomjB7JEJJXSNBA1GRh5a8mCXQGZYYhVuy267BsPWPacITS97S0dsTQcTaxDr8zWUkPv6hngzwm6kxgcYusC0ozl/EGMqXvzrE6PqLuvwVMNP25L1IULcXLYd38AyUXReTWmVzXKfjzSae6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978961; c=relaxed/simple;
	bh=SbN8ljD9VsS5XPum2g43NGqCh2Ejy+nPQmJS2A8EPBc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CXCfrahnOqAzAVpKGxLoFNGt2/IwTNaxqECI6LbILm4oP33smPr6HEv10GiWLQZPB1oJJOr2utJ1wdff0g+vURVAGuAA6jf0ctf4/1o5imlfSc8UbSsXRGD5lvEmHquGWWMA95mQIfjgZTed5Gk3x42rhh9g6xWqlgnnFgUHv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb/LpnFU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fb/LpnFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFC91F000FF;
	Wed,  9 Sep 2026 18:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788978959;
	bh=XGIoWr/OIGko5c2ESvDFEgNnqbhDTUe44h1geBW7L94=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fb/LpnFUZnpV4ZBuFeg4jkX1K3hXGggiEOuiIWGpsIhOamFeoYE+RMTnSSfQ3CJTA
	 CcC/Q69ZEiUWcUZlyJtuIK3waSqvkUI8p4Q9FKG/z/RJaw5fag1NmLaL11hrV6Spob
	 ZUbVpdkQzcQEdGbn2wYzhT/voprGsWhRA/2OWmbvUlfwUT1Kp0pr/HcYZ5KFcImMru
	 betjN3IicB8AyzXmXxfOob+eB17EMRjHmXKDvpLn/PKXjnmBP8svwRfjQ6+2maBOCE
	 Loq6w8JP9/KX05Nn8GU4mspAd9u0t4Fz+auJPjeWrNdr+X2uhf1RzYges7pwIxqKwy
	 s76ZawMlcAOKQ==
Subject: Re: [PATCH net-next] selftests: drv-net: devmem: set reuseaddr on the
 sender's source port
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 bobbyeshleman@meta.com, sdf@fomichev.me, leitao@debian.org,
 razor@blackwall.org, linux-kselftest@vger.kernel.org
Date: Wed, 09 Sep 2026 18:35:58 +0000
Message-ID: <178897895866.219967.293435162679292319@kernel.org>
In-Reply-To: <20260908183420.1369630-1-kuba@kernel.org>
References: <20260908183420.1369630-1-kuba@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] Incomplete fix: the sibling helper socat_listen() in the same
  file still has no reuse option, so the EADDRINUSE/TIME_WAIT flake the…

--

selftests: drv-net: devmem: set reuseaddr on the sender's source port

The devmem selftest's sender has to bind an explicit source port on the
remote host because ncdevmem installs a 5-tuple flow rule. The port is
picked by rand_port() on the DUT, so lingering TIME_WAIT sockets on the
remote can make the bind fail with EADDRINUSE; this adds reuseaddr to the
socat bind option.

> diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> index 3554954a6691..b6e52fa9dda5 100644
> --- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> +++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> @@ -201,7 +201,7 @@ def socat_send(cfg, port, buf_size=0):
>      else:
>          addr = cfg.baddr
>  
> -    suffix = f",bind={cfg.remote_baddr}:{port}"
> +    suffix = f",bind={cfg.remote_baddr}:{port},reuseaddr"
>  
>      buf = ""
>      if buf_size:

[Severity: Medium]
Should socat_listen() in the same file get the same treatment?  It builds
the remote listener for the TX tests without any reuse option:

tools/testing/selftests/drivers/net/hw/devmem_lib.py:
    def socat_listen(cfg, port):
        """Socat listen command for TX tests."""
        return f"socat -U - TCP{cfg.addr_ipver}-LISTEN:{port}"

That command also runs on cfg.remote, and the port again comes from
rand_port(), which only binds a probe socket on the DUT.  The RX sub-tests
are what leave the TIME_WAIT sockets described in the changelog, and they
sit on remote_baddr:<port> in the same ephemeral range that rand_port()
draws from.

If run_tx() or run_tx_chunks() then draws a colliding port, the wildcard
bind of the listener conflicts with the lingering TIME_WAIT socket without
SO_REUSEADDR, socat exits, and:

    with bkg(listen_cmd, host=cfg.remote, exit_wait=True) as socat:
        wait_port_listen(port, host=cfg.remote)

times out, failing the sub-test.  Is that the same failure mode the patch
removes for the sender, just on the listener side?

For reference, the other socat listeners under drivers/net (ping.py, tso.py,
uso.py, xdp.py, xdp_metadata.py, ntuple.py) all pass ",reuseport"
explicitly, so devmem_lib.py's socat_listen() looks like the only bare one.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908183420.1369630-1-kuba%40kernel.org
