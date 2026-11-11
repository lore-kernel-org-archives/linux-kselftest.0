Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422019;
	b=tQaoWMSk6LqwnrfkEUIiuXEf2ZfqOmRPwvSyXBirmqCLfzchlAY2tv7SluedyqVeXxLe
	 exxcuMw4Y0HJ16PL7B2PgVVQq7SG7bNjym4VaqNQ/ND8WYzZEhl0+iTIFg6TYtuDmNJFs
	 MC/Jx0ssPaxGp1xyxFOS6qALJv3+EM+m0/9q2f5HPyBS0V3crxwTEJtdRb345LNN/j4Zb
	 xG3AHbuIcRuW5N4u8AxCAnFq/ThA/Zll2bgqvwh87XyI0D594YaCL78Zaz3vBPU/KhbOR
	 VCE7ARlbTAuWHIXsTE4c1tDBwfKAnEKb8IODpopElSFEj5Xfg6cbrGgcdBuAIVmWo1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422019;
	h=DMARC-Filter:DKIM-Signature:X-Forward-Email-ID:
	 X-Forward-Email-Sender:X-Forward-Email-Version:
	 X-Forward-Email-Website:X-Complaints-To:X-Report-Abuse:
	 X-Report-Abuse-To:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zGnr7qakqygUVED8TA1cVhOKcrSAOCJQcMqXrkzQb/c=;
	b=yRrqBznOHX56J0JtVws/b+57G9nwWYQuSGuk3EKpdDWaC10PxCpodRvSR2KfrAGHZ5cd
	 4McprAkqNIPOAga4qBspeAaeIn85EyCxpDVVbVQC9EliGt1ASmpqs2Dxlt+6kz50gG4oE
	 c30xs0TWq/dBO8/2GhEyvKKfCZZ2/Izc2XzB/k1S2PFVOi1l9vJxRy4NIR3K9ZtTMzEur
	 6FpNf19UrDmBopjtW5cWE3WBZr3JIelZWt5iCVrEClDjDN6nqBKEZFI6B0bVOHdUXE4Pw
	 4Y6q7p/V1rATFIIAqNhtt4WimrvTzjSloCjJN6l8+ZyC+I4rbvyIX2wQfioHRABxeCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ovn.org;
	spf=pass smtp.mailfrom=fe-bounces.ovn.org;
	dkim=pass header.d=ovn.org header.i=@ovn.org header.a=rsa-sha256 header.s=fe-13eddc7e57 header.b=LMYletMR;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8F606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 18:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A8F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ovn.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ovn.org header.i=@ovn.org header.a=rsa-sha256 header.s=fe-13eddc7e57 header.b=LMYletMR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ovn.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: Autocrypt: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID; q=dns/txt; s=fe-13eddc7e57; t=1794422012;
 bh=zGnr7qakqygUVED8TA1cVhOKcrSAOCJQcMqXrkzQb/c=;
 b=LMYletMRKoaHa8HrmmphA6zYW2ZVhYKHdXWG7TkW+EmxFffhdvsJWxJ2L+JldxNM84K33NK1W
 OxLPG5drCs0hkU52ZiSa+GFZRexthA+uTeAebsUThtww54epQP2p30nep7j7a7jdvbZFwYg2aFL
 4Ee+Y6URfLm537i3EmlR3mQ=
X-Forward-Email-ID: 6af4b4f706a4c0728fe463b8
X-Forward-Email-Sender: rfc822; i.maximets@ovn.org, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.18
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <488e10a9-ea28-41cf-9a8a-aa7431f6dd48@ovn.org>
Date: Wed, 11 Nov 2026 19:33:21 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net 0/3] net: fix stacked VLAN header corruption in TX
 offloads and OVS
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Boris Sukholitko <boris.sukholitko@broadcom.com>,
 Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>,
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org, i.maximets@ovn.org
References: <20261111-net_restore_the-v1-0-6aaeffa601c9@proxmox.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <20261111-net_restore_the-v1-0-6aaeffa601c9@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 6:37 PM, Gabriel Goller wrote:
> Since commit 938863727076 ("tc: adjust network header after 2nd vlan
> push"), a second VLAN push leaves network_header pointing to the
> in-band VLAN header. The igb driver TSO and OVS IP set actions still
> expect the L3 header, so they write to the VLAN header and corrupt
> the packet. Patch 1 restores the L3 header in validate_xmit_skb() for
> CHECKSUM_PARTIAL packets, which covers packets tagged by tc or BPF.
> Patch 2 restores it in OVS right after the push, before later actions
> run. Patch 3 adds a KUnit test. tc classification after a push keeps
> working.
> 
> The kernel uses two conventions for skb->network_header when a packet
> carries an in-band VLAN tag:
> 
> * network_header points at the L3 header
> * network_header points at the in-band VLAN header
> 
> Since commit 938863727076 ("tc: adjust network header after 2nd vlan
> push"), skb_vlan_push() uses the second convention when it pushes a
> second tag. The flow dissector, and so tc flower, needs that layout to
> classify the packet after the push. Drivers doing TSO or checksum
> offload expect the first one. vlan_features_check() clears TSO for
> multi-tagged packets, so most drivers fall back to software GSO, which
> finds the L3 header itself. igb keeps TSO for these packets and reads
> the IP header at skb->network_header, so it builds the TSO context from
> the VLAN header and corrupts the packet. OVS set actions after a second
> push write to the wrong header in the same way.
> 
> Which convention should a packet with in-band VLAN tags follow? This
> series keeps the tc layout, converts to L3 in validate_xmit_skb() for
> CHECKSUM_PARTIAL packets, and restores L3 right after the push in OVS.
> If L3 should hold everywhere instead, the flow dissector would need to
> find in-band tags from mac_len, and skb_vlan_push() could go back to
> its old behavior.

IMO, having 'network_header' pointing to something that is not a network
layer doesn't make much sense, and having two separate meanings for the
same field is a recipe for more issues introduced or discovered later.
Others may, of course, disagree.

Best regards, Ilya Maximets.
