Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5131DDC28
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 00:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775089729; cv=none; b=UPlPvOwIWrzip5ajg53fKKWiCmp6BLHSyEEsOWKP9UIRDKQdTZleipuF/TZBJGN/hEGu3yBo9OJVz/V093QE2f8t1MitQUuwjMsgtdl28WaV5FztGCLem6h1N2yw2PK2f6kJ7oxBfoxdomMqVaH5XKprSnA6aOzTwa9Ag4r16PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775089729; c=relaxed/simple;
	bh=NsFHEc9cLIhxwHd8GCARIIYerKt25yqMowBZFNTuQ6s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=B/r4sRBypoSnJwq67jiAVpAzKHFjQIBM0pSWArnP8lWUBoeXVfRBeca0eL5AT8N6AyB9Grf9H3q7BoMgQ1JebuWlRbFMAUSoTOcHbPfbrUF4c2noRwYnyHYhPneyzZKDr7fjXk1ymkRkNyURku8h9rtKD9oVKiNYWGOsod1Ybmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZyxaZhF; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZyxaZhF"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6501d32b04bso362021d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 17:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775089727; x=1775694527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EG+TGuMH7iRqP+SEgh1/fCjYkx8AoXZpEYux/97XIDg=;
        b=qZyxaZhFXBrp9Fddl2ELPB719MzoC7PMpKO3lEqRjpVNhgB03tJSQ15MbjrZCTrYpd
         7bVwTOwVBsgqAjsc+mR/XfDAPAAoCvKz/Vawi4KSiPScE5cf7ujXW56dCmgPV85pDlQX
         siCSwO3UKCVyVwyO2bk3pB/I7eRYOlZSy/j8sRnp/dN0i55IxH9QdVzDLRS4rVF3QVNU
         BPIFeexvp0tCeGEPthVnfZfekgiFYP+B04NLnNGmjBBU7vPbyrrtuH5//zjBHcLBrrMe
         QTui1ZeZi6rPhL1JmbSk+fz59GdU0WM1aqVPqmHgbQU+oUxGmENtMdkHVNOyOrN4aI9l
         On9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775089727; x=1775694527;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EG+TGuMH7iRqP+SEgh1/fCjYkx8AoXZpEYux/97XIDg=;
        b=R9Ewm8+mE59jrcGWBbiYqW7sBuTlXbH4I9BT6sTpk1WKJpRgG7fxv52yR/7tC/nhmh
         j7eIfDEoQ1GqUAuzSVZu27qChOjhUWnw3Rpf2ejYzenVVpff7c4ZSMG67mi8AA4RTP6A
         b6vFwcMZ0mAC/7fJmuDeMpn8Wwj43S3N0JiWTMXCPMAX2Or1t4BFv4JOv+nMBksfFgg5
         j6gXNITImP1LAcdOnt7fYOfyOdEsYyHBsOxfp9R0U55ESWgQ0/vHZ9RC87irvOmSF1N/
         JEN1o1GLs8H0RNeMDVK3rQZTYKowNbWTaQCZ0mJOXoqKC5i2XWPPVIa9sDInPoQIeGFL
         N4Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUrVILoRltoMLhY8YLOqJ04QwMZht6F5kJ4VOy9x7BqP+H5dGfq0n5omqhAc30X1WDCuGiJLqdH/A76Ddx/u8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIPyu5KnXVFSImlCHuVZ8PPWUb5lHgA9k91CyVXQXDGQd73lIz
	IlLkurpZYPxgTsX7QOnGLgPanWMb/52VRs15/Ej6kjDX5YMbfCJ8x3gp
X-Gm-Gg: AeBDietVrOPUJ2LDVuxH0Hz5VotG7bAnAMe1+P9rgmtE7nNeWyJWz7Q74fl5f+8HGuU
	QJUKePtPezoVQN360UGr69rzMfyi2P8WoKBnbaaXL9125AoL8VT1UXkW5E9sYP8wnd58R0lhmbw
	gCmnCrrf9xvx9MPZCywrhVaNqZwfFblMVmbw6nnx/q3SyYtK8XrOR+9fBfWK2/zJO6buRFdSvkP
	7vBe+qewKr2LrxNDhPX+gCeG/ylIyAIb3/5A2m+E5IfMHQRPVy2KP3TdVHs+atUEhSn6prX6Tjv
	QdUlJROILjaX9ADD12LNSVvAC3xF8Unq1GYvGjN2vaIY7YAae02REKTi15279rLoQ/vJgafalho
	xd//ZBaOrskTtLjfFpil/PCcrBni0eD0vs4m7le3PMxMSjnIRjUDW6jBnixXGxwZ9abwbxKHf3h
	uOwfE0e2PpB0Sjk5nHuzHuUNuqvNUBBItkcr52bufNQSQRB2Tj0DWrKr6OQ6BqrLSed74cHjZ2U
	WMa
X-Received: by 2002:a53:420d:0:b0:650:2257:e085 with SMTP id 956f58d0204a3-6502fde2b85mr3979331d50.30.1775089727443;
        Wed, 01 Apr 2026 17:28:47 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a9cabaesm573157d50.18.2026.04.01.17.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:28:46 -0700 (PDT)
Date: Wed, 01 Apr 2026 20:28:46 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 anubhavsinggh@google.com, 
 richardbgobert@gmail.com, 
 linux-kselftest@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.14f444719030c@gmail.com>
In-Reply-To: <20260401182625.372605-7-kuba@kernel.org>
References: <20260401182625.372605-1-kuba@kernel.org>
 <20260401182625.372605-7-kuba@kernel.org>
Subject: Re: [PATCH net-next 6/6] selftests: drv-net: gro: add a test for bad
 IPv4 csum
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> We have a test for coalescing with bad TCP checksum, let's also
> test bad IPv4 header checksum.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/net/lib/gro.c      | 25 ++++++++++++++++++++++
>  tools/testing/selftests/drivers/net/gro.py |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
> index 762e88932ed2..a458cfbd11eb 100644
> --- a/tools/testing/selftests/net/lib/gro.c
> +++ b/tools/testing/selftests/net/lib/gro.c
> @@ -36,6 +36,7 @@
>   *  Packets with different (ECN, TTL, TOS) header, IP options or
>   *  IP fragments shouldn't coalesce.
>   *   - ip_ecn, ip_tos:            shared between IPv4/IPv6
> + *   - ip_csum:                   IPv4 only, bad IP header checksum
>   *   - ip_ttl, ip_opt, ip_frag4:  IPv4 only
>   *   - ip_id_df*:                 IPv4 IP ID field coalescing tests
>   *   - ip_frag6, ip_v6ext_*:      IPv6 only
> @@ -675,6 +676,21 @@ static void send_changed_checksum(int fd, struct sockaddr_ll *daddr)
>  	write_packet(fd, buf, pkt_size, daddr);
>  }
>  
> +/* Packets with incorrect IPv4 header checksum don't coalesce. */
> +static void send_changed_ip_checksum(int fd, struct sockaddr_ll *daddr)
> +{
> +	static char buf[MAX_HDR_LEN + PAYLOAD_LEN];
> +	struct iphdr *iph = (struct iphdr *)(buf + ETH_HLEN);
> +	int pkt_size = total_hdr_len + PAYLOAD_LEN;
> +
> +	create_packet(buf, 0, 0, PAYLOAD_LEN, 0);
> +	write_packet(fd, buf, pkt_size, daddr);
> +
> +	create_packet(buf, PAYLOAD_LEN, 0, PAYLOAD_LEN, 0);
> +	iph->check = iph->check - 1;
> +	write_packet(fd, buf, pkt_size, daddr);
> +}
> +
>   /* Packets with non-consecutive sequence number don't coalesce.*/
>  static void send_changed_seq(int fd, struct sockaddr_ll *daddr)
>  {
> @@ -1392,6 +1408,10 @@ static void gro_sender(void)
>  		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
>  
>  	/* ip sub-tests - IPv4 only */
> +	} else if (strcmp(testname, "ip_csum") == 0) {
> +		send_changed_ip_checksum(txfd, &daddr);
> +		usleep(fin_delay_us);
> +		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
>  	} else if (strcmp(testname, "ip_ttl") == 0) {
>  		send_changed_ttl(txfd, &daddr);
>  		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
> @@ -1588,6 +1608,11 @@ static void gro_receiver(void)
>  		check_recv_pkts(rxfd, correct_payload, 2);
>  
>  	/* ip sub-tests - IPv4 only */
> +	} else if (strcmp(testname, "ip_csum") == 0) {
> +		correct_payload[0] = PAYLOAD_LEN;
> +		correct_payload[1] = PAYLOAD_LEN;
> +		printf("bad ip checksum doesn't coalesce: ");
> +		check_recv_pkts(rxfd, correct_payload, 2);

This verifies that a packet with bad csum does not coalesce to a valid
packet. Perhaps too paranoid but, do you also want to test the reverse
case?

Can be a single test by adding another write_packet and observing all
three separate packets.
