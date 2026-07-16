Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2770E408604
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784203250; cv=none; b=RQFrBE2kizLq6zBTNEaBOi7I0zJHdFHyTq/dpst/aaTJrVRNT6cI0kUPPkEMD22zSxtNIFYuMaUdR2fIjd6n4sc9fcHk8RX9tex5x3B8Bp6jtZN7StI9SEqwGa9kqonYqqQ2xv2luy3YP2QLtq5b6kdhRYDmH5OHiPGGxpMn6lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784203250; c=relaxed/simple;
	bh=YcUzI342MNdvLV1HMzeqi6BKbIShNHSUNw3360dxBKY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fYcA7ocfxQpQYzjneqMg/bmAkDJJUuEuMm+vnZTeIvvyU7NhMy4nb/sVVJp+/gOAC/mOlb9/5Gnv72/Cmly4XMMC1YwLfMw6xL9QIovi2OdyiFsAStjlJLB2ZFhUBZYsj/LAftntEIo/A1H4GV4VaNV62XBVKo5XqP19SoeW28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g0dUSpUO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cQ8o4FPZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xZY5xK+6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dh8fVF3t; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g0dUSpUO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cQ8o4FPZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xZY5xK+6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dh8fVF3t"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E07378944;
	Thu, 16 Jul 2026 12:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784203247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGLkGm1dnLCW+gt0t3t5cZcuw1uKrPacYY6vJuOeUVI=;
	b=g0dUSpUOuyWg+IELnMw6/Vua1YS65WU5L96+zlgNf0MppB5N8sB4Ft0jfSrEnkVsdTf8Rk
	CCGCTM73Mv2i/NgCHyE2dpI1jJlSCXcD/jiZ0hLvNMC+WBMCUIDJXO2WJ0zVxwhse1YW8g
	dr12RzkqZxD9mIjnMLRXGtS8t5zqvU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784203247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGLkGm1dnLCW+gt0t3t5cZcuw1uKrPacYY6vJuOeUVI=;
	b=cQ8o4FPZFXTklJ/DKkiTePGV6pKdelYKNJsKm6tKp5fIBn4F3r+ybfVgU0XNwMJbzQ4pKp
	zRymzUMzw9d3VKAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784203242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGLkGm1dnLCW+gt0t3t5cZcuw1uKrPacYY6vJuOeUVI=;
	b=xZY5xK+6I9lGkBp9SC+PknFDujMfWSRqXZhWfQ2Ibuo8LbJ4YoP7kfvFB9lkhz+V81Lbhk
	G3GgQZJ4lLo51D982yjwzet6VMyhrYq2GTNNrgdwyuzPktlU3DFenvQkA+45xlEEihok00
	HdGGxcZUnsARA8b4/gPZ7KY6nOashpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784203242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGLkGm1dnLCW+gt0t3t5cZcuw1uKrPacYY6vJuOeUVI=;
	b=dh8fVF3tcvWkcVDpGNw/z5Vx+8wX+eaPzFECPCUCojjOWntrHw8KxeI+0QUtAOf69zFcSY
	EzsDBh03QK4NpDCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 743C1779AE;
	Thu, 16 Jul 2026 12:00:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mHtuGenHWGpwLgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Thu, 16 Jul 2026 12:00:41 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v2 1/4] net: hsr: add PRP interlink (RedBox)
 datapath and duplicate discard
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: Xin Xie <xiexinet@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Felix Maurer <fmaurer@redhat.com>, Luka Gejak <luka.gejak@linux.dev>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260706134131.61659-2-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
 <20260706134131.61659-1-xiexinet@gmail.com>
 <20260706134131.61659-2-xiexinet@gmail.com>
Date: Thu, 16 Jul 2026 14:00:30 +0200
Message-Id: <178420323080.16062.7813915035618214520.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon, 06 Jul 2026 13:41:28 +0000, Xin Xie <xiexinet@gmail.com> wrote:
> A PRP RedBox proxies SANs that sit behind an interlink port: their frames
> must reach the PRP network with the SAN source MAC preserved, and PRP
> unicast must be steered between the LAN and the SAN segment correctly.
> 
> Add the PRP interlink forwarding rules to prp_drop_frame() and give RedBox
> nodes a second duplicate-discard slot so the two LAN copies of a frame
> destined to a SAN collapse to a single delivery out the interlink.
> 
> The destination classification (is the unicast DA a PRP-network node or a
> proxied SAN) is resolved once per frame in fill_frame_info(), gated to PRP
> RedBox devices, and cached in struct hsr_frame_info, so prp_drop_frame()
> stays O(1) and does not walk the node tables for every candidate egress
> port in the softIRQ path. HSR RedBox frame classification is untouched.
> 
> Factor the LAN A/B duplicate test into prp_is_lan_dup() so the new PRP
> interlink rules do not change hsr_drop_frame() behaviour, including the
> NETIF_F_HW_HSR_FWD path which keeps using the LAN-duplicate test only.
> 
> Publish the RedBox state before the first hsr_add_port(): the slave and
> interlink rx handlers are live from hsr_add_port() on and rtnl does not
> stop softirq processing, so a frame could otherwise be handled while
> hsr->redbox is still false. hsr_add_node() sizes each node's per-port
> sequence state from hsr->redbox; a node learned in that window would get
> a single-port sequence block, breaking the interlink duplicate discard
> (WARN_ON_ONCE plus duplicate delivery to the SAN) and letting the
> supervision sequence-block merge read beyond the source node's allocated
> sequence bitmap. Publishing the flag before any port exists makes the
> per-node sizing uniform by construction. This is safe: the proxy
> announce timer is only armed from hsr_check_announce() once the master
> is running, the packet-path readers of hsr->redbox tolerate an empty
> proxy node database and an absent interlink port, and the
> prune_proxy_timer is still armed only after the interlink port has been
> attached successfully.
> 
> Additionally bound the supervision sequence-block merge by the smaller
> of the two nodes' seq_port_cnt as defense in depth against mismatched
> node sizes.
> 
> Signed-off-by: Xin Xie <xiexinet@gmail.com>
>
> diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
> index 5555b71ab19b..5af491ed2b72 100644
> --- a/net/hsr/hsr_device.c
> +++ b/net/hsr/hsr_device.c
> @@ -768,6 +768,15 @@ int hsr_dev_finalize(struct net_device *hsr_dev, struct net_device *slave[2],
>  	/* Make sure the 1st call to netif_carrier_on() gets through */
>  	netif_carrier_off(hsr_dev);
>  
> +	/* Publish the RedBox state before any port is attached: the rx
> +	 * handlers are live from hsr_add_port() on, and hsr_add_node()
> +	 * sizes each node's per-port sequence state from hsr->redbox.
> +	 */
> +	if (interlink) {
> +		hsr->redbox = true;
> +		ether_addr_copy(hsr->macaddress_redbox, interlink->dev_addr);
> +	}
> +
>  	res = hsr_add_port(hsr, hsr_dev, HSR_PT_MASTER, extack);
>  	if (res)
>  		goto err_add_master;
> @@ -805,8 +814,6 @@ int hsr_dev_finalize(struct net_device *hsr_dev, struct net_device *slave[2],
>  		if (res)
>  			goto err_unregister;
>  
> -		hsr->redbox = true;
> -		ether_addr_copy(hsr->macaddress_redbox, interlink->dev_addr);
>  		mod_timer(&hsr->prune_proxy_timer,
>  			  jiffies + msecs_to_jiffies(PRUNE_PROXY_PERIOD));
>  	}
> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 0774981a65c1..efcd0acef38c 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -440,12 +440,37 @@ static int hsr_xmit(struct sk_buff *skb, struct hsr_port *port,
>  	return dev_queue_xmit(skb);
>  }
>  
> +static bool prp_is_lan_dup(struct hsr_frame_info *frame,
> +			   struct hsr_port *port)
> +{
> +	enum hsr_port_type rx = frame->port_rcv->type;
> +
> +	return (rx == HSR_PT_SLAVE_A && port->type == HSR_PT_SLAVE_B) ||
> +	       (rx == HSR_PT_SLAVE_B && port->type == HSR_PT_SLAVE_A);
> +}
> +
>  bool prp_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
>  {
> -	return ((frame->port_rcv->type == HSR_PT_SLAVE_A &&
> -		 port->type == HSR_PT_SLAVE_B) ||
> -		(frame->port_rcv->type == HSR_PT_SLAVE_B &&
> -		 port->type == HSR_PT_SLAVE_A));
> +	enum hsr_port_type rx = frame->port_rcv->type;
> +
> +	/* Supervision frames are not delivered to a SAN on the interlink. */
> +	if (frame->is_supervision && port->type == HSR_PT_INTERLINK)
> +		return true;
> +
> +	if (prp_is_lan_dup(frame, port))
> +		return true;

Since we already have rx (enum hsr_port_type) here, can we pass this
directly to prp_is_lan_dup() function instead of passing frame?

> +
> +	/* LAN to interlink: keep PRP-network unicast off the SAN segment. */
> +	if ((rx == HSR_PT_SLAVE_A || rx == HSR_PT_SLAVE_B) &&
> +	    port->type == HSR_PT_INTERLINK)
> +		return frame->dst_in_node_db;
> +
> +	/* Interlink to LAN: keep SAN-to-SAN unicast local. */
> +	if ((port->type == HSR_PT_SLAVE_A || port->type == HSR_PT_SLAVE_B) &&
> +	    rx == HSR_PT_INTERLINK)
> +		return frame->dst_in_proxy_node_db;
> +
> +	return false;
>  }
>  
>  bool hsr_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
> @@ -453,7 +478,7 @@ bool hsr_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
>  	struct sk_buff *skb;
>  
>  	if (port->dev->features & NETIF_F_HW_HSR_FWD)
> -		return prp_drop_frame(frame, port);
> +		return prp_is_lan_dup(frame, port);
>  

Of course these calls will need to pass rx too.
