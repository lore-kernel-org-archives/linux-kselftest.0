Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4456D41BA76
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784203255; cv=none; b=FU1uVL34Be76ecFvP7fsFgpvLD+ShBTFosdTTyBygp26TZMQNP3RC2xogiHHkGo7NMbb2XktqADSKtbItfzZnsMn3gkTZddZzXf6VhMZH78WEeG0En7c6ZRLo7b/wEWnaDyNC3D5B2kThpY3jKPDWNnwJE/IHH3uzFZxje0TKk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784203255; c=relaxed/simple;
	bh=ilIn7s1gcgdEgXQ+6zXpaP7vyb/s0+2n5yfJ3TBkcmc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BmpQsmagEC0VyuD6iBXQrtxlCqBLxyzpS3g9sokUnpUyskDPB8qhAhloy7rEM/Ty4YtbOtr9enU51d05jYeUCiGibEEI62Dd7j7OlD351+t/HOhsvJqVe5/0N8LuyJ3Oo18V6pel/ZjgOSFvacrzEM/UtvY3nMqWdanU5GY4aQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QvXuPSOB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9YOKw8aG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dg6UqRzx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h+PGfJU5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QvXuPSOB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9YOKw8aG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dg6UqRzx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h+PGfJU5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1DDD13E41;
	Thu, 16 Jul 2026 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784203251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9TSmIUzXNmauh6UViN2S3XQfm69TXzsovKOeg7pNqok=;
	b=QvXuPSOBjT5q81KOnl54bc+Wkk14PK1BAa6xfeIO8yfdoeO23SCjV0Uzko6UZxjdWry2MY
	m3RuTIHeTJFBE/WkIA0mDisAudzBgOUpbMSaSICZcRrCMp0Ua2wjDmxvKlpXRKZ4QXhQ28
	7F5wHLcLRy8Vm7r8ZJMVri9h5Kx0hPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784203251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9TSmIUzXNmauh6UViN2S3XQfm69TXzsovKOeg7pNqok=;
	b=9YOKw8aGXcoki/Vz5XBgRMKzs83/UIHBK2qswRbj3EjeLFGK53JrFtS1gYiKlJIUfMBWQ0
	K4qJdE/FFbA/7lCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Dg6UqRzx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=h+PGfJU5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784203247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9TSmIUzXNmauh6UViN2S3XQfm69TXzsovKOeg7pNqok=;
	b=Dg6UqRzxNxza+6/Jpaujxf6v+ZpIoih+PCDdxdLugipIEJrPOx0z5zaEIBMXpW5O2hu2Hl
	N7OeZuUmLVG6qCqmHFSK9gqqSSMq3AwdHXzzJzEjy4a0zDTZlL6JHW1SiHtFqbBeX1YYsq
	45hq6T53Yhy1lBUP6x7Hk0YjrZGgReI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784203247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9TSmIUzXNmauh6UViN2S3XQfm69TXzsovKOeg7pNqok=;
	b=h+PGfJU5kQOLfLEQVQiZJmi5ry+11oOwKF7tR1q5Mw1/i4oW3pepGP1/8pSChsd8Ve5FEB
	MrWETEDZNwVq9lBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51980779AF;
	Thu, 16 Jul 2026 12:00:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IJ31EOrHWGpwLgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Thu, 16 Jul 2026 12:00:42 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v2 2/4] net: hsr: emit RedBox-MAC TLV in PRP
 RedBox supervision frames
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
In-Reply-To: <20260706134131.61659-3-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
 <20260706134131.61659-1-xiexinet@gmail.com>
 <20260706134131.61659-3-xiexinet@gmail.com>
Date: Thu, 16 Jul 2026 14:00:30 +0200
Message-Id: <178420323080.16062.11665494757602926366.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1DDD13E41
X-Spam-Score: -4.01

On Mon, 06 Jul 2026 13:41:29 +0000, Xin Xie <xiexinet@gmail.com> wrote:
> A PRP RedBox must announce the SANs it proxies so peers populate their
> proxy node tables. The proxy-announce machinery (hsr_proxy_announce(),
> armed via hsr->redbox) already iterates proxy_node_db under RCU and calls
> send_sv_frame() once per SAN, but the PRP sender emitted neither the
> announced SAN MAC nor the RedBox-MAC TLV that IEC 62439-3 requires.
> 
> Extend send_prp_supervision_frame() so that, for a proxy-announce
> (identified by the interlink port, an O(1) test), the frame carries the
> proxied SAN MAC as MacAddressA followed by the RedBox-MAC TLV (Type 30)
> and an explicit End-of-TLV marker before padding.
> 
> hsr_get_node() must also accept the reinjected proxy-announce: a PRP
> supervision frame is an untagged ETH_P_PRP frame (mac_len == ETH_HLEN, the
> RCT is appended only on egress) sourced from macaddress_redbox, which is
> never learned from data. Exempt only PRP supervision frames from the
> hsr_ethhdr length guard; HSR (ETH_P_HSR) supervision is front-tagged and
> keeps the original guard, so HSR malformed-frame filtering is unchanged.
> 
> Also align macaddress_redbox so that ether_addr_copy() and
> ether_addr_equal() on it are safe on architectures without efficient
> unaligned access.
> 
> Signed-off-by: Xin Xie <xiexinet@gmail.com>
>
> diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
> index 5af491ed2b72..0973f9a94f4d 100644
> --- a/net/hsr/hsr_device.c
> +++ b/net/hsr/hsr_device.c
> @@ -372,10 +372,21 @@ static void send_prp_supervision_frame(struct hsr_port *master,
>  {
>  	struct hsr_priv *hsr = master->hsr;
>  	struct hsr_sup_payload *hsr_sp;
> +	struct hsr_sup_tlv *hsr_stlv;
>  	struct hsr_sup_tag *hsr_stag;
>  	struct sk_buff *skb;
> +	bool redbox_proxy;
> +	int extra = 0;
> +
> +	redbox_proxy = hsr->redbox && master->type == HSR_PT_INTERLINK;
> +
> +	/* A proxy-announce carries a RedBox-MAC TLV and an EOT marker. */
> +	if (redbox_proxy)
> +		extra = sizeof(struct hsr_sup_tlv) +
> +			sizeof(struct hsr_sup_payload) +
> +			sizeof(struct hsr_sup_tlv);
>  
> -	skb = hsr_init_skb(master, 0);
> +	skb = hsr_init_skb(master, extra);
>  	if (!skb) {
>  		netdev_warn_once(master->dev, "PRP: Could not send supervision frame\n");
>  		return;
> @@ -393,9 +404,25 @@ static void send_prp_supervision_frame(struct hsr_port *master,
>  	hsr_stag->tlv.HSR_TLV_type = PRP_TLV_LIFE_CHECK_DD;
>  	hsr_stag->tlv.HSR_TLV_length = sizeof(struct hsr_sup_payload);
>  
> -	/* Payload: MacAddressA */
> +	/* Payload: MacAddressA, the announced node. */
>  	hsr_sp = skb_put(skb, sizeof(struct hsr_sup_payload));
> -	ether_addr_copy(hsr_sp->macaddress_A, master->dev->dev_addr);
> +	ether_addr_copy(hsr_sp->macaddress_A, addr);
> +
> +	/* Proxy-announce: append the RedBox-MAC TLV (Type 30) and an explicit
> +	 * EOT to terminate the TLV chain before zero padding.
> +	 */
> +	if (redbox_proxy) {
> +		hsr_stlv = skb_put(skb, sizeof(struct hsr_sup_tlv));
> +		hsr_stlv->HSR_TLV_type = PRP_TLV_REDBOX_MAC;
> +		hsr_stlv->HSR_TLV_length = sizeof(struct hsr_sup_payload);
> +
> +		hsr_sp = skb_put(skb, sizeof(struct hsr_sup_payload));
> +		ether_addr_copy(hsr_sp->macaddress_A, hsr->macaddress_redbox);
> +
> +		hsr_stlv = skb_put(skb, sizeof(struct hsr_sup_tlv));
> +		hsr_stlv->HSR_TLV_type = HSR_TLV_EOT;
> +		hsr_stlv->HSR_TLV_length = 0;
> +	}
>  
>  	if (skb_put_padto(skb, ETH_ZLEN)) {
>  		spin_unlock_bh(&hsr->seqnr_lock);
> diff --git a/net/hsr/hsr_framereg.c b/net/hsr/hsr_framereg.c
> index 8f708b6e6c33..b3b106be692e 100644
> --- a/net/hsr/hsr_framereg.c
> +++ b/net/hsr/hsr_framereg.c
> @@ -293,8 +293,17 @@ struct hsr_node *hsr_get_node(struct hsr_port *port, struct list_head *node_db,
>  	 */
>  	if (ethhdr->h_proto == htons(ETH_P_PRP) ||
>  	    ethhdr->h_proto == htons(ETH_P_HSR)) {
> -		/* Check if skb contains hsr_ethhdr */
> -		if (skb->mac_len < sizeof(struct hsr_ethhdr))
> +		bool prp_sup;
> +
> +		/* A PRP supervision frame is an untagged ETH_P_PRP frame
> +		 * (mac_len == ETH_HLEN); its RCT is appended only on egress.
> +		 * HSR (ETH_P_HSR) supervision is front-tagged and still must
> +		 * contain a struct hsr_ethhdr.
> +		 */
> +		prp_sup = hsr->prot_version == PRP_V1 &&
> +			  ethhdr->h_proto == htons(ETH_P_PRP) && is_sup;
> +
> +		if (!prp_sup && skb->mac_len < sizeof(struct hsr_ethhdr))
>  			return NULL;
>  	} else {
>  		rct = skb_get_PRP_rct(skb);
> diff --git a/net/hsr/hsr_main.h b/net/hsr/hsr_main.h
> index 134e4f3fff60..c27cfdd9ca3f 100644
> --- a/net/hsr/hsr_main.h
> +++ b/net/hsr/hsr_main.h
> @@ -211,7 +211,7 @@ struct hsr_priv {
>  				 */
>  	bool fwd_offloaded;	/* Forwarding offloaded to HW */
>  	bool redbox;            /* Device supports HSR RedBox */
> -	unsigned char		macaddress_redbox[ETH_ALEN];
> +	unsigned char	macaddress_redbox[ETH_ALEN] __aligned(sizeof(u16));

The indentation is wrong here, could you keep at the same level it was
before?
