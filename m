Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079982;
	b=UWeAOCTCA0bkhje/Xz/tJq66inAaiD+soWyRVYFj7zZmeLnAgZSG4MyX7r49PynrhOUu
	 52a6Lmm2FDGFsGhFxj6xQdxim29O4U9rgIwbkOmFPErOfaICwTBLE6DxruGJNoXqAQJuq
	 V79+dRCx5KFnRij7S9MPC2uQWUcm4iPOxj9U6nf+lbmSF+1rCYGVswIMtdPunpqV5Lqtr
	 EUwSznpdWWA7Ih13mprEKRgwNOVRtfF5S2BniaIH0wXaHP+MvOKewt4UyM3ZMhNB5QB4C
	 BfjOoU7SguL+Qf/z0LtF6PD1+DppgTWeqOXRqpaK+SU4uPI7brULQjgUTA1DqXPKWaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079982;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2iw/MxeNzy+5Z/Oem69v/Opo9BBkaCdPMTVmK3Co93M=;
	b=zUxEmqHLba/nkhN8sDq23z65+aggH8BaXAECC1biD3QoySiGq8cFo4P76STYsc2+fzfp
	 vi6gejCSmUERjR6MG/Zg2qjLK0fEFWLGOCZFwtstjBSwuicy3ghW9ZFawg8iQOo5EilqN
	 ct2DP6+VWs4vaPwtIrG7c+2hlfAOtmKPZQ42csHfu+kwJInjYp9MqPsB+VqQPQ/t9Xhxe
	 uZjqCEO95U5i9yaEUTHwr4chG3ldes9WTPT6VF1DCw+2QPRVc2MMmC+l4grDNke76zvBZ
	 vj/xYtmsdCUdBK3H05mK1GhK7GZjz7cyyY68rXmmyC6wnLrCL0Zsvci2LD8tLxGcmmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECgxzHyy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4737606A324;
	Thu, 19 Nov 2026 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECgxzHyy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A781F000C4;
	Thu, 19 Nov 2026 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079982;
	bh=2iw/MxeNzy+5Z/Oem69v/Opo9BBkaCdPMTVmK3Co93M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ECgxzHyySk2vdy9yxSSEPjJ+ftfNxGmK4LdBXzvjaerAOfbhEf/M9ItcOqbkZFTYI
	 /QCIeExjnxRLVeYwVHHBlqin6VM50rTXUCeMgCIHpLOLkwb90CYzJNkhLpoWDblK7l
	 jjBOjYA5tJJjZflY2IvbfeB8RcjOI8qYXGrGUb1UXmFjqSiHPt8hcRWsCPQW9r762k
	 cD/5OtGsDht/ohGfY9VkFUFg0Yf8S2LL4BjVtn2nLCzJBSwiBCvAH/1RsqqM0ez6Hb
	 U6IrcSq0ZmHLTNqpZclern3pXmBDhRM8gz91hofbuIRu+/IMfSOwNdyjyHyw4gn86t
	 ZLq6bnJhAtqcQ==
Subject: Re: [PATCH net-next 3/6] mlxsw: Enable LAG collector independently of
 distributor
From: netdev-bot+sashiko@kernel.org
To: idosch@nvidia.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@kernel.org, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, petrm@nvidia.com, sridhar.samudrala@intel.com,
 jiri@resnulli.us, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, razor@blackwall.org
Date: Thu, 19 Nov 2026 09:19:41 +0000
Message-ID: <179507998105.3136.16224636454143398218@kernel.org>
In-Reply-To: <20261118083442.1061289-4-idosch@nvidia.com>
References: <20261118083442.1061289-4-idosch@nvidia.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new collection-only state (SLCOR collector on, port not in
  the SLDR distributor list), reached through…

--

mlxsw: Enable LAG collector independently of distributor

This patch adds a collection-only state for LAG ports. When rx_enabled is
set and tx_enabled is not, mlxsw_sp_port_lag_changed() now enables the
SLCOR collector and removes the port from the SLDR distributor list.
Without this, a port in COLLECTING state in an 802.3ad bond with coupled
control disabled did not receive packets.

> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
> index 815e8d8e31856..5a6dc033084d8 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
> @@ -4515,11 +4515,26 @@ mlxsw_sp_port_lag_col_dist_disable(struct mlxsw_sp_port *mlxsw_sp_port)
>  	return err;
>  }
>  
> +static int mlxsw_sp_port_lag_col_enable(struct mlxsw_sp_port *mlxsw_sp_port)
> +{
> +	int err;
> +
> +	err = mlxsw_sp_lag_dist_port_remove(mlxsw_sp_port,
> +					    mlxsw_sp_port->lag_id);
> +	if (err)
> +		return err;
> +
> +	return mlxsw_sp_lag_col_port_enable(mlxsw_sp_port,
> +					    mlxsw_sp_port->lag_id);
> +}
> +
>  static int mlxsw_sp_port_lag_changed(struct mlxsw_sp_port *mlxsw_sp_port,
>  				     struct netdev_lag_lower_state_info *info)
>  {
>  	if (info->tx_enabled)
>  		return mlxsw_sp_port_lag_col_dist_enable(mlxsw_sp_port);
> +	else if (info->rx_enabled)
> +		return mlxsw_sp_port_lag_col_enable(mlxsw_sp_port);

[Severity: Low]
With the new collection-only state (collector on, port not in the
distributor list), do the error paths in the two existing helpers still
do the right thing? Both cases need a register write to fail.

A move from COLLECTING to COLLECTING_DISTRIBUTING calls
mlxsw_sp_port_lag_col_dist_enable(). If the SLDR add fails, the error path
turns off a collector that was already correctly enabled:

mlxsw_sp_port_lag_col_dist_enable() {
    ...
err_dist_port_add:
	mlxsw_sp_lag_col_port_disable(mlxsw_sp_port, mlxsw_sp_port->lag_id);
	return err;
}

Would this drop ingress on a link that both partners negotiated as
COLLECTING?

A move from COLLECTING to ATTACHED or DETACHED calls
mlxsw_sp_port_lag_col_dist_disable(). The SLDR remove succeeds even though
the port was never in the list. If the SLCOR disable then fails, the error
path adds the port to the distributor list:

mlxsw_sp_port_lag_col_dist_disable() {
    ...
err_col_port_disable:
	mlxsw_sp_lag_dist_port_add(mlxsw_sp_port, mlxsw_sp_port->lag_id);
	return err;
}

Could the device then hash LAG egress onto a port that LACP never moved to
DISTRIBUTING, while bonding has tx disabled for it? That state matches
neither the old LAG state nor the new one.

mlxsw_sp_netdevice_port_lower_event() only logs "Failed to reflect link
aggregation lower state change", so the hardware stays in that state until
the next lower state event.

The patch notes say the hardware and the LAG driver are out of sync
"regardless of what the rollback does". In the second case, though, the
rollback turns on tx distribution that neither state wants. The notes are
also not in the commit message or in a code comment.

Could the re-add be skipped when the port was in collection-only state, or
could this limitation be documented in the commit message?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118083442.1061289-1-idosch%40nvidia.com
