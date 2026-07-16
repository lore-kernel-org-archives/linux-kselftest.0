Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412993F166A
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784203486; cv=none; b=s9DA88D5uV676j2SLMNPSFQYnmMenUhQJfwZux9DT12YE8hUrCeGWzEiZAtflQyR9spPSifXLaRS+S73kIds1OefIUmrwfACVuQDdoAC8M5inq622pxhwQ46CKEnHs6idZSE6MMwKkIAw+H6z7Hz596fsyO7z4hGP22b05IRyXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784203486; c=relaxed/simple;
	bh=rqYsK8i8YERiWKORPSsayS8qb4bjiatXBWXqEVOBFKM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=WEPh3sdLhF79unn5jhn5X9NUnEWIGl2jvzsP3x/COgD7GZOMqrLrj6LHbOy7nXIC2MDNPdcTGT6r2MihDMIDynS7xJUEegaPko4ozPSP+fa8Xd1ych0QGKkOvHCQnYd3xAf81a/jFUhORc29JCwC7QeES4a/kIRc7uzvXUXEEvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 83A8E3DF3;
	Thu, 16 Jul 2026 12:04:43 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B566B779AD;
	Thu, 16 Jul 2026 12:04:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BQnXKNrIWGqAMwAAD6G6ig
	(envelope-from <fmancera@suse.de>); Thu, 16 Jul 2026 12:04:42 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v2 0/4] net: hsr: PRP RedBox (PRP-SAN) support
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Xin Xie <xiexinet@gmail.com>, netdev@vger.kernel.org, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Felix Maurer <fmaurer@redhat.com>, Luka Gejak <luka.gejak@linux.dev>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <178420323080.16062.15477610308661322679.b4-review@b4>
References: <20260704234704.4297-1-xiexinet@gmail.com>
 <20260706134131.61659-1-xiexinet@gmail.com>
 <178420323080.16062.15477610308661322679.b4-review@b4>
Date: Thu, 16 Jul 2026 14:04:31 +0200
Message-Id: <178420347157.16062.10991723462605746308.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 83A8E3DF3
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]

On 2026-07-16 14:00 +0200, Fernando Fernandez Mancera wrote:
> On Mon, 06 Jul 2026 13:41:27 +0000, Xin Xie <xiexinet@gmail.com> wrote:
> > This series adds PRP RedBox support to the hsr driver: a PRP node that
> > proxies one or more SANs sitting behind an interlink port (IEC 62439-3,
> > PRP-SAN). HSR-SAN has been supported since commit 5055cccfc2d1 ("net: hsr:
> > Provide RedBox support (HSR-SAN)"); this extends the equivalent capability
> > to PRP, reusing the existing protocol-neutral proxy machinery
> > (proxy_node_db, hsr_proxy_announce(), hsr_prune_proxy_nodes()).
> > 
> > A SAN behind the interlink does bidirectional unicast with peers on the PRP
> > network, its source MAC is preserved on the wire, the PRP RCT is correct,
> > and the RedBox announces each proxied SAN with the RedBox-MAC TLV (Type 30)
> > in its supervision frames.
> > 
> > The series is bisect-safe: the datapath, duplicate discard and supervision
> > support are added first; the rtnetlink rejection of "type hsr ... interlink
> > <dev> proto 1" is removed only in patch 3, once the feature is complete.
> > 
> > Design notes:
> > 
> >  - prp_drop_frame() does not walk the node tables. The destination
> >    classification (PRP-network node vs proxied SAN) is resolved once per
> >    frame in fill_frame_info() and cached in struct hsr_frame_info, so the
> >    per egress-port drop decision is O(1) in the softIRQ path. The
> >    classification is gated on PRP RedBox devices (prot_version == PRP_V1 &&
> >    hsr->redbox), so HSR RedBox traffic is not affected.
> > 
> >  - The LAN A/B duplicate test is factored into prp_is_lan_dup() so the new
> >    PRP interlink rules in prp_drop_frame() do not change hsr_drop_frame()
> >    behaviour, including the NETIF_F_HW_HSR_FWD path. This is software PRP
> >    RedBox only; it adds no new hardware-offload contract.
> > 
> >  - The supervision emitter uses pre-reserved tailroom (hsr_init_skb() +
> >    skb_put()) on the existing GFP_ATOMIC path; no skb_linearize() or
> >    pskb_expand_head(). The RedBox-MAC TLV is followed by an explicit EOT
> >    (Type 0, Length 0); padding via skb_put_padto(ETH_ZLEN) and the 6-byte
> >    PRP RCT remain at the absolute tail of the egress frame.
> > 
> >  - The hsr_get_node() hsr_ethhdr length guard is relaxed only for PRP
> >    supervision frames (prot_version == PRP_V1 && ETH_P_PRP && is_sup), which
> >    are untagged with mac_len == ETH_HLEN. HSR (ETH_P_HSR) supervision is
> >    front-tagged and keeps the original length requirement, so HSR
> >    malformed-frame filtering is unchanged.
> > 
> > Testing (on a net-next v7.2-rc1 kernel built from this base, x86-64):
> >  - checkpatch.pl --strict: patches 1-3 clean; patch 4 reports only the
> >    expected "added file(s), does MAINTAINERS need updating?" note, which is
> >    ignorable here -- MAINTAINERS already lists
> >    tools/testing/selftests/net/hsr/ under HSR NETWORK PROTOCOL.
> >  - git diff --check clean; the series git-am's onto the base commit.
> >  - tools/testing/selftests/net/hsr/hsr_prp_redbox.sh: PASS on the patched
> >    kernel (bidirectional unicast, SAN MAC preservation, RedBox-MAC TLV +
> >    EOT in the proxy-announce).
> >  - HSR regression on the same kernel: hsr_redbox.sh (HSR-SAN/RedBox),
> >    hsr_ping.sh and prp_ping.sh all PASS, confirming the PRP changes do not
> >    regress the existing HSR/PRP paths.
> >  - netns checks: peer<->SAN 0% loss with no duplicates and a valid PRP RCT
> >    on the wire; a silent SAN is pruned from the announce; zero driver
> >    WARN/BUG/Oops/RCU-stall during the run.
> > 
> > Beyond the in-tree selftest, this exact series (applied to this base and
> > running as the net-next kernel on x86-64 hardware) was also validated with an
> > out-of-tree IEC 62439-3 conformance harness (supervision TLV chain, duplicate
> > discard, cross-LAN rejection, seqnr rollover, VLAN/multicast/GOOSE frame types
> > with the RCT verified at the absolute frame tail), and interoperability-tested
> > against a commercial PRP RedBox (Siemens SCALANCE X204RNA) over 100 Mbit/s
> > Fast Ethernet with NIC hardware (PTP) timestamping: a mid-stream single-LAN
> > outage of ~2 s at 10 kpps was bridged with zero lost and zero duplicate frames
> > (seamless PRP failover), and the duplicate-discard window held zero lost /
> > zero duplicates under netem asymmetric delay up to 100 ms (~1000 sequence
> > numbers in flight), 25% reorder, and 5% single-LAN loss. The failover and
> > impairment matrix was additionally repeated on a KASAN + lockdep + kmemleak
> > instrumented build of this kernel, including a 72-carrier-event link
> > flap-storm with deliberate double-LAN cuts: zero KASAN, lockdep, or kmemleak
> > findings. This out-of-tree testing is supplementary and not required to
> > evaluate the series.
> > 
> 
> The series looks good to me, I just found a couple of nits.
> 
> Thank you!

Oh I just realized you posted a v3 - anyway, as there were no changes my
comments also apply there.

Thanks,
Fernando.

