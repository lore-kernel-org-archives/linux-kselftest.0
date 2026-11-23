Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448125;
	b=VXBZkLRVWBM9F+RlBzW47Sg9nRDoXKd2YZm+kGKJjNgm10CbFxO00r/WAckfhGkFgGHP
	 4cfp0Oy2vB1oxptdd+NwGLb1R9DQoc8MlkQzRu0TirWHA3vhKo/Ho1N7UUsuCg08CVBwg
	 eUsakN+R8nFDus04qmmwghUuBrNsrKTsNMXNxxWWZ40lh4nxWOeS+wJGBkNkHf70R2JiV
	 As1q8zYa1tiVMZZS29sIua4/3ER17eYa/q8Zya3DaTS9nnhE76Uf/XGkRPrOkDTyFmF2J
	 gzZJJsPSpB5Cl5APRhkNKz0uKcPHqjSjSLCE3wY1UlLBwOxgIMlO4iBZXBtC4TUeFEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448125;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=pF9wzKO7QpdVZiEm5sjWg86fJwPTS9jr8H8o/XbMXY0=;
	b=wrHxAZ972voXEYF9MqbHy+76TGzuT/erf72h8C1R5COyBvxKh7chlQYqxMqd8TMthoD7
	 MJ25FZD0xXQMJ5vy+m/aM3StLbEBguB82uVeZ+gvtdWeQXClIc/8hkIr5I/8+xx76hh8L
	 QSa3ucFPrY3DlTiyYrMUWSGmpCX4Ky+XlQIixrZBvhe8rlJMqLGFHi3Yh1OFpEMhC3DmA
	 7IHOmUQpQOM6rOkujB2po9jGbDAyp7bnTAC4FmQOqXn8tiTCl8OeyVGR2JoAVUnovXUrN
	 7l8y3ryD3tdfYWXSCmKkUz54S1Os8FQxuaoX1CW2xM8IV25QOhbamD24RYDYV5v0LZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB7606A32D;
	Mon, 23 Nov 2026 15:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECB7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 020694307B;
	Mon, 23 Nov 2026 16:35:22 +0100 (CET)
Date: Mon, 23 Nov 2026 16:35:20 +0100
From: Gabriel Goller <g.goller@proxmox.com>
To: Ilya Maximets <i.maximets@ovn.org>, 
	Boris Sukholitko <boris.sukholitko@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Boris Sukholitko <boris.sukholitko@broadcom.com>, Aaron Conole <aconole@redhat.com>, 
	Eelco Chaudron <echaudro@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dev@openvswitch.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC net 0/3] net: fix stacked VLAN header corruption in
 TX offloads and OVS
Message-ID: <awRbU3ZRECEqq8zm@luna.proxmox.com>
References: <20261111-net_restore_the-v1-0-6aaeffa601c9@proxmox.com>
 <488e10a9-ea28-41cf-9a8a-aa7431f6dd48@ovn.org>
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
In-Reply-To: <488e10a9-ea28-41cf-9a8a-aa7431f6dd48@ovn.org>
User-Agent: NeoMutt/20260616
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1795448121234

On 11.11.2026 19:33, Ilya Maximets wrote:
> On 11/11/26 6:37 PM, Gabriel Goller wrote:
> > Since commit 938863727076 ("tc: adjust network header after 2nd vlan
> > push"), a second VLAN push leaves network_header pointing to the
> > in-band VLAN header. The igb driver TSO and OVS IP set actions still
> > expect the L3 header, so they write to the VLAN header and corrupt
> > the packet. Patch 1 restores the L3 header in validate_xmit_skb() for
> > CHECKSUM_PARTIAL packets, which covers packets tagged by tc or BPF.
> > Patch 2 restores it in OVS right after the push, before later actions
> > run. Patch 3 adds a KUnit test. tc classification after a push keeps
> > working.
> > 
> > The kernel uses two conventions for skb->network_header when a packet
> > carries an in-band VLAN tag:
> > 
> > * network_header points at the L3 header
> > * network_header points at the in-band VLAN header
> > 
> > Since commit 938863727076 ("tc: adjust network header after 2nd vlan
> > push"), skb_vlan_push() uses the second convention when it pushes a
> > second tag. The flow dissector, and so tc flower, needs that layout to
> > classify the packet after the push. Drivers doing TSO or checksum
> > offload expect the first one. vlan_features_check() clears TSO for
> > multi-tagged packets, so most drivers fall back to software GSO, which
> > finds the L3 header itself. igb keeps TSO for these packets and reads
> > the IP header at skb->network_header, so it builds the TSO context from
> > the VLAN header and corrupts the packet. OVS set actions after a second
> > push write to the wrong header in the same way.
> > 
> > Which convention should a packet with in-band VLAN tags follow? This
> > series keeps the tc layout, converts to L3 in validate_xmit_skb() for
> > CHECKSUM_PARTIAL packets, and restores L3 right after the push in OVS.
> > If L3 should hold everywhere instead, the flow dissector would need to
> > find in-band tags from mac_len, and skb_vlan_push() could go back to
> > its old behavior.
> 
> IMO, having 'network_header' pointing to something that is not a network
> layer doesn't make much sense, and having two separate meanings for the
> same field is a recipe for more issues introduced or discovered later.
> Others may, of course, disagree.

I agree, a full implementation would have to revert:

938863727076 ("tc: adjust network header after 2nd vlan push")

then change the flow-dissector to not rely on network_header and find the
in-band vlan tags itself.

@Boris maybe?

> Best regards, Ilya Maximets.

Thanks,
Gabriel

