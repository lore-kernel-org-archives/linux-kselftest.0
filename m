Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BC5226AF
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874642; cv=none; b=bZ6Lc7Z3L6CDHDcccnKdRhNy15QBCvP/82Vl9HSCoSG0rlUSfZKZDe09J3BvvpXNmbnSIsXoePdDqXRwyd2UIibpmaw42hRi9XfWa6CRrD2FECmJVeTLyAIP13Kl2Vhb/AvVlNDBd7W/+TRptbl/m9Ziyg4i88e/oMAJq78Knnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874642; c=relaxed/simple;
	bh=HjL3ALwC7SlTlh2ou2svi0eynvZcnZM5c6HYrssqJlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWLYZNGnrgv48tGojI9gSFIxcEz7mT+KE5goyvMQWK+mv5WDXxyTDsAFVTTyWQyBXr9t/ACtdQ/HsWfePkhXGTVlajfw2geteo6iFakTBzDU/Uhj8q19eRDaXIJGVhCasbEK1XdmowNP4nzkhHjc80Xi70uNLteYbCGaa7WKPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=l/mpJbYX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="l/mpJbYX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so42619725e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 10:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790874635; x=1791479435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3VS1hM8D+yXpGof39/wZrbvIluuKpraEFame26U78E=;
        b=l/mpJbYXV0TA2Wf1j/oVQ7ShKuvv+EPkvAIxNlm0YBIysLtqsjaz+Dz5tzQf+EwFj2
         zTzh/rPwFmh6IG0iGYlgEEiZklafzzL6GgchGv+Qs7qDgD4+NuS9tV6Jv4KENo497q6C
         7iDHWyUk0EG4W3RgyTCMoCk0yEDVcKXkrqLgzRsFf6LhOYuDU/6BX78QKaIjtj2QZNTC
         QCU04oxBzm9ONdN5vcCfSup5oKb5FLGy48mPZ5RM9m5PCoz+dZ8IGcxt1rtkA0YQWsAg
         sDJ5RWcD9Gvos0ZmoQVH6J69JLIlU0CoTDceNyQmtgu0XiEI+0gUmy8rhzPNvIy/1IqN
         Th7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874635; x=1791479435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3VS1hM8D+yXpGof39/wZrbvIluuKpraEFame26U78E=;
        b=fFhfANKZ20OJtkyCr9BygHsrknNz5fdbXqBQTnhOrYtPNzlCb7W8O5F3bqRMrCwDjg
         xgOKGehMti2hKOz7HEQNUf7O3umd7xcxTi4O/pz5scdCyE/oVVdw1w9YKhtT9T+re7Xn
         8jO3YcHneI2nsqw9fBy9s0mD89dx5BHSBk1q0W+CoOUHkMA7jN9LbZtCseS/VXqSSRCN
         +5abwy309konlCLRFql7bzV43TFQO3Suc1+fIfVztJ9pqiBagaXGUQA1xdyOddYlx7pv
         b1S4IFdos40ozAWtxmjw4H1hvf8nPdVOoSO/iTMJtnKsPx2Jcm4eIOVOmqviwFeumjmL
         pQ3g==
X-Forwarded-Encrypted: i=1; AKwUvByeU3lylRMuimvlFq66okxaZcx/fAipo4fKI+ONT4jLR77fx4vqdb1rRosVuJ1kLyE/JrEfGz30+DQTwnVxBH0=@vger.kernel.org
X-Gm-Message-State: AFuF++lX6TH1fpVOYS17V0uAx9l2v2PaMIhSMWorgM6fA2osOw9tAO7m
	TmKSGrcnzWTRVuj9F11gvQ1w6Y36BaUel92AjQXqKG2odwltqLTLjcmnFOvh9jXBlVw=
X-Gm-Gg: AYBFou0zWZDthHkxH9C1Na000DohR9u8A74g2qJNex4IZ6H7HUjGIYs7YsZP0AfngSK
	ctb631DhPQZ50jIV/30lzkR7gQ/fpi39Le9jezL2hDafYbtEjOhIypC4MwNWVishLU4iyySNnYh
	zXFqxkrMvxLtgRUX7wxzRH+RXq5kKfVk/OHKeb/iLNk6pGnTJ8CEkIIADvaXamoYC/uCFr3nE3T
	uzWlYp0zIleNKjiWC7VCWN9SzgrHL7Z9Qa2t3TRqd4Ce6ofUKgyGrAvLBLXKc7671GZq0mbiCQ/
	7JL6aZb7ZDQfpRNBG7hwUxwKbMKSz79zptZrlAVWGw94uKFFc4oxRctEc3VdLcfZ1Vl0jtiIV8S
	CJEgcb5OKAN+qLrZvYBn64CfNe1Pq49Ko3eh1GQJL3ibX+GMb5Ejh1JciGrMbhW/WV9+j4t4Y/g
	57o2f4e9l4hn3is1YVnEa9f8yEUwoUxs9pUNaIxAaqV9JIkxrFP/OVTDAQp9sibEaSVzL4VYkv8
	Cfa3Ld9vkBFf+A24JH+9jJLaRFQM5583yb9BXfFMyQNZVD4pQrQNvPwQmhnHgXGyPqQhaxBrY8R
	FDBA9Dx+iSituv0=
X-Received: by 2002:a05:600c:5584:b0:49f:ffed:2cb with SMTP id 5b1f17b1804b1-4a02755f828mr3846065e9.6.1790874634486;
        Thu, 01 Oct 2026 10:10:34 -0700 (PDT)
Received: from localhost.localdomain ([197.51.130.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0278fb6f1sm2496985e9.9.2026.10.01.10.10.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 10:10:31 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] amt: mark relay data as a UDP tunnel packet before sending it
Date: Thu,  1 Oct 2026 20:10:15 +0300
Message-ID: <20261001171016.88208-2-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261001171016.88208-1-omar@blockcast.net>
References: <20261001171016.88208-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_multicast_data() copies the multicast packet, puts an AMT
multicast data header and a UDP header in front of it, and sends it with
udp_tunnel_xmit_skb(). Unlike the other UDP tunnels, it never calls
udp_tunnel_handle_offloads(), so the copy has neither skb->encapsulation
nor an SKB_GSO_UDP_TUNNEL* bit set. If the copy is a GSO skb, the lower
layers see a plain UDP_L4 skb that has an outer UDP header in front of
it.

A GSO skb only reaches amt_dev_xmit() when tx checksum offload has been
turned on for the amt device (it is off by default, in which case the
core segments the packet before ndo_start_xmit), for example with a
UDP_SEGMENT sender on the relay. The default configuration is not
affected.

Call udp_tunnel_handle_offloads() on the copy, as bareudp and geneve do.
The AMT header and the UDP header are pushed after that. Two details
need care:

 - udp_csum is true, because udp_tunnel_xmit_skb() is called with
   nocheck set to false. The GSO checksum of the outer UDP header is
   then completed for every segment, which needs
   SKB_GSO_UDP_TUNNEL_CSUM.

 - amt is ARPHRD_ETHER (amt_link_setup() ends with ether_setup()), and
   amt_dev_xmit() pulls the Ethernet header without moving the mac
   header. skb_copy_expand() keeps the mac header relative to the data,
   so, going by the code, in the copy it should sit 14 bytes before the
   inner IP header. The tunnel segmentation derives the length of the
   outer headers from inner_mac_header - transport_header, which would
   then be negative. I did not measure either value; what was observed
   is described below. Reset the mac header on the copy before the
   inner headers are recorded, so that inner_mac_header is the inner IP
   header, as it is for the other tunnels that have no link-layer
   header.

The call also changes what a plain, non-GSO datagram looks like when it
leaves amt. iptunnel_handle_offloads() sets skb->encapsulation on every
skb and clears it again only if ip_summed is not CHECKSUM_PARTIAL. A
CHECKSUM_PARTIAL datagram, which is what the stack hands to the driver
with tx checksum offload on, now has encapsulation set where it had
none before, so netif_skb_features() limits the features available for
it to those in hw_enc_features, and udp_set_csum() takes the local
checksum offload branch, which leaves the inner checksum to the lower
device. The other UDP tunnels do the same, but the selftest does not
cover hardware checksumming of such a packet: the egress device in it
has tx offload off, so skb_checksum_help() completes the checksum in
software.

This follows the suggestion made by Eric Dumazet on the earlier
[PATCH net] "amt: do not offer software GSO on the amt device", which
this replaces.

The problem was found by an LLM-assisted code review of
drivers/net/amt.c while developing an IPv6 outer transport for amt.

Tested with the selftest in the next patch, in a KVM guest running
net-next at commit eb0c18404c89 ("amt: pull the AMT header behind the
transport header in amt_parse_type()"), x86_64, CONFIG_DEBUG_NET=y, AMT
built in, eleven runs per kernel of the final selftest (22 guest boots,
two at a time on a busy host). See the next patch for how stable the
selftest itself has been. The sender is a local UDP_SEGMENT burst
of eight 1200-byte segments plus a 100-byte tail, 100 bursts, IPv4 and
IPv6 inner traffic, with "ethtool -K <amt relay dev> tx on" and the
relay's egress device doing its segmentation in software:

 - Without this patch, every GSO skb (9728 bytes for IPv4, 9748 for
   IPv6) reached amt_dev_xmit(), none of the 900 datagrams arrived at
   the listener, the tx_dropped counter of the relay's egress device
   went up by 100 (one per GSO skb), and nothing was put on the wire.
   A function-graph trace of one run showed __skb_gso_segment() on that
   device failing with -EINVAL, from __udp_gso_segment() under
   udp4_ufo_fragment(), and the skb being freed in validate_xmit_skb().

 - With this patch, all 900 datagrams arrived intact in every run, one
   AMT message per segment was seen on the wire, none of them larger
   than the MTU, tx_dropped did not move, and the gateway counted no UDP
   checksum errors. The trace showed skb_udp_tunnel_segment() doing the
   outer segmentation.

 - With this patch minus the skb_reset_mac_header() call (two runs, with
   an earlier version of the selftest), the packets were dropped in the
   same way as without the patch, and DEBUG_NET warned in
   skb_udp_tunnel_segment() (pskb_may_pull() with a length above
   INT_MAX). That fits a negative header length, but the value itself
   was not printed.

 - With tx offload off (the default), and with non-GSO datagrams with tx
   on, everything arrived with and without the patch.

 - The existing tools/testing/selftests/net/amt.sh passes with the patch
   (discovery, IPv4 and IPv6 forwarding, and both torture tests).

Not tested: hardware that offloads UDP tunnel segmentation or the
checksum of a CHECKSUM_PARTIAL packet, a forwarded UDP GRO packet as the
GSO source, NETIF_F_GSO_FRAGLIST, KASAN, and the udp_csum=false variant,
so the choice of true rests on reading the code and on the patched runs
above being clean, not on a failing false variant. sparse was not run,
and the existing amt.sh was run only with the patch, not on the
unpatched kernel. Only the IPv4 outer transport exists in this tree.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 0277e4cac..1f0afc11e 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1078,7 +1078,18 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 	if (!skb)
 		return;
 
+	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
+	 * header, so the copy's mac header sits 14 bytes before the inner IP
+	 * header. Make it coincide with it, as the inner segmentation code
+	 * expects for a device without a link-layer header.
+	 */
+	skb_reset_mac_header(skb);
 	skb_reset_inner_headers(skb);
+	if (udp_tunnel_handle_offloads(skb, true)) {
+		kfree_skb(skb);
+		return;
+	}
+
 	memset(&fl4, 0, sizeof(struct flowi4));
 	fl4.flowi4_oif         = amt->stream_dev->ifindex;
 	fl4.daddr              = tunnel->ip4;
-- 
2.43.0

