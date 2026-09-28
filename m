Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D92D592D
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599191; cv=none; b=nJcvFdRjns1zPIY/OhxR8efeBT7Fa2vH3+SjYoQULmUdcSSK+1XEwa15Q4fVdruHYBuZaVekZ+xedyrarJ0/OC14m1n5fFHHWST7oVy9L/p70EnBzLqL8xtV8koc2rqiYgzA08Zq6FqzRll2eKMVnxdl/euU9dPoIWobe/Vtirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599191; c=relaxed/simple;
	bh=HhG09UnjFLJrbNF2of0ds2Qo6nMJtWw1g/fH0tK8Xdg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tPjguDpLqdFDSe6mCZPq/pbSi6edrOlbeV6jx2GR37028/LcWkNxhBig09J5J4gOC2GwThYk3bdpf6mXAjVIVOBrvA9WBTWY6L8M/uM2r5L0sUsbjp0LH5WsaIz6/AGTUjl5Us2PMbFrh8ahe85XLDzWvLJpt7LL1q+eLR/KC2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CPva2H21; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MIW+WbPO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CPva2H21";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MIW+WbPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790599189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HhG09UnjFLJrbNF2of0ds2Qo6nMJtWw1g/fH0tK8Xdg=;
	b=CPva2H21w8McqfYlHDi6XmY3v5NpA/1BdkNzglCQerQ5+Xe5sB4u6ZMXJodaft1cyz6MaA
	bGRhTEHeWJ4OAvih30hB4S2itbPRcTbP/tKaolB4yAtWqrWEPjqAliekgCwawYqhL99cQe
	ZwD+DMNSiHtuUfk40AqDvtscAje6SOo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-nDcf88-HPVKvFzfQ7GXAKA-1; Mon, 28 Sep 2026 08:39:47 -0400
X-MC-Unique: nDcf88-HPVKvFzfQ7GXAKA-1
X-Mimecast-MFC-AGG-ID: nDcf88-HPVKvFzfQ7GXAKA_1790599186
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4887efa4486so2313387f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790599186; x=1791203986; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HhG09UnjFLJrbNF2of0ds2Qo6nMJtWw1g/fH0tK8Xdg=;
        b=MIW+WbPOVcZU0kmB66rmHLHz7c8b6Sw371D5DB9NZ0MqVfnxLdA7rdqE8SVAWDJRVY
         3hj4coCquon1dIj/Fel/03TYzJdkPj8dphUsvx3bgG5RIygMqIpdIPyN2g/yPwIKhlCB
         5+y7xqE7KGwOcQlPAqEE/NzuT65qIxbVPtBwkGw+oioAcHe0H8wy8hQTrz3/dDN0gOIP
         7YisCh2S6D0xwQS0FewbLW0YxRtD3NmibnQOqBOuRsMdTvkQ6/iUFczxVGkZzJUh97Tc
         FvtoDg5tUJEZTaoXMAu4JXF3T9T0pFODKp8vYYGg5vXVjamyfeDhRoA2SGfc0V467qCo
         HEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599186; x=1791203986;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HhG09UnjFLJrbNF2of0ds2Qo6nMJtWw1g/fH0tK8Xdg=;
        b=jWegDUMf8WQpH0J1TpcqNedj2l+WiPpMLDT6DQT1J1jgxcph36zwTw5o0eVSMtdIyy
         nQ1WseljidDjZtNT2i+awT8C6TgE98PZhwU1pI9XxjrCbnlcJrfJE9pKV0kNPZ1TT7OB
         pe8khXRZrwOLVsmyqQz17MSzzwA4zoLySqDVePv2p/EtLxPJdbS5BSQRFe9fYk4VcpIt
         RYt9qxXZhviW48ajatHdKEHhfgc7M4Pqj5NtfjjVNl+A73cP7ij7lxbOlG7ObISlCosN
         mgfXve5AtN90WdM6IHJm+EG0K7hbloCsk5LbhMgo7Hz3vmAGrLZPdsrGbHNdzgJMpBx7
         Xgeg==
X-Forwarded-Encrypted: i=1; AKwUvBx07DPQ50Rke9IsiboDXZcw2tewyQmEI4ZwDUKSAzpxIJWNQTlEEXpFZ1tJVR+4N1B8lD+lEmO47TYqLo1jbFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgmQp8RR191XVK+kBwN29vzi+NLI/Nn+6ojgr3VIwdOt5UNuI8
	0Hoq4ss8MmscAL2CT3P2UsyI9HubdAPsPlRQvilF/O2aFFqr74KXbBqBsYvgcpo41Z8mVwQ4eab
	hNplYYEOgAWU6UbFDlexJkvk+Ge2Gcv0fTuPkkktpzGtMutjJeaMfkuRS9VBsHXk6IyqKYr+3eM
	bJ7adhCrdor4+ffPc9oF8pvYncNlm3TBPBEddH5R4MOblqa127vNAu
X-Gm-Gg: AYBFou3ILgOsFXeRBMFH/KLkewcaa4/KaIkm9siH/ISaRgor1IVb+oBAsu4ejRuplEe
	gZcTnhWeZDQev3svy+4MRHLjez8u8fH5ZaEW7aQgpDCUQ2fVIDCIBlont9lwarbaoeycV6ZSwPb
	n562u5N58zz78MKZCscBVIPWDgvKE2ojLNe6goorPFDueD/TkPACeyTpBbA2Q6Fs1fhZA0O7FgC
	bhuB+UQbADL1XcD8vurnN+Mah58yJpWytpd+H224IHipDUTaEpSs5Ix0SyS6EZsAGfM7b8b8ZBn
	BtNaEdBxJ16foSAqrnwbqw6Lbb1gVHsDUMcPEqSciifKYebOjNuHw8x4XWVwluQvJevKcq7FFwr
	/z+ee/iXylyJbCF80WyK8C8GrxtZ8rZw=
X-Received: by 2002:a05:6000:490a:b0:488:85be:d280 with SMTP id ffacd0b85a97d-48885bed71bmr9953634f8f.6.1790599186174;
        Mon, 28 Sep 2026 05:39:46 -0700 (PDT)
X-Received: by 2002:a05:6000:490a:b0:488:85be:d280 with SMTP id ffacd0b85a97d-48885bed71bmr9953589f8f.6.1790599185565;
        Mon, 28 Sep 2026 05:39:45 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([24.151.142.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm27872549f8f.27.2026.09.28.05.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:39:45 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  Eelco Chaudron <echaudro@redhat.com>,  Ilya
 Maximets <i.maximets@ovn.org>,  "David S . Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah
 Khan <shuah@kernel.org>,  dev@openvswitch.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] selftests/net/openvswitch: add SCTP
 flow key test across conntrack NAT
In-Reply-To: <20260918144647.2024095-3-houminxi@gmail.com> (Minxi Hou's
	message of "Fri, 18 Sep 2026 10:46:47 -0400")
References: <20260918144647.2024095-1-houminxi@gmail.com>
	<20260918144647.2024095-3-houminxi@gmail.com>
Date: Mon, 28 Sep 2026 08:39:42 -0400
Message-ID: <f7tik3p8s8h.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Minxi Hou <houminxi@gmail.com> writes:

> After conntrack NAT rewrites a packet, OVS refreshes the cached flow
> key in ovs_nat_update_key(), which has a per-protocol branch for the
> L4 ports (UDP/TCP/SCTP, conntrack.c). Address-only NAT cannot tell a
> working SCTP branch from a missing one: the ports survive unchanged
> either way, so a post-recirc match on the original port stays green
> even with the branch deleted. The suite's NAT coverage drives TCP
> over nc, and the merged SCTP test has no conntrack in the path, so
> the SCTP branch goes unexercised.
>
> Add test_sctp_nat_connect_v4: untracked client traffic to
> 192.168.0.20:4443 hits ct(commit,nat(dst=172.31.110.20:5555)),recirc,
> and the post-recirc flows match the translated tuple,
> ipv4(dst=172.31.110.20),sctp(dst=5555). Reply traffic is matched on
> the restored original tuple, sctp(src=4443). With the SCTP branch
> broken the translated port never reaches the key, no post-recirc
> flow matches, and the association fails. The probe flow uses the
> same ct+nat action as the real flows, so a kernel without
> CONFIG_NF_NAT rejects it at flow-add time and the test skips instead
> of failing. The config fragment sets CONFIG_NETFILTER_ADVANCED=y so
> CONFIG_NF_CT_PROTO_SCTP is visible, CONFIG_NF_CT_PROTO_SCTP=y, and
> CONFIG_NF_NAT=m so the reference build actually has those pieces.
> After the association succeeds the test pushes a known payload
> across and waits for the listener to log it.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

