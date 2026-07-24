Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4AF3F8EC4
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928617; cv=none; b=P8AeR1srfXvGOYVIqHlIps3aG0Qza1/N6NAOt9Gz22RyZCwyvMGYQPoyjzn11wTrSS+q5AbygK4VmASk/GkDOHpGLhBfVyVfUl6KDFF72zg2W4iOxRcTM1akxihDX3FfIcAA61P4NOijlysdMpJul9Y0vhvbM63ORByHV6ZjQvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928617; c=relaxed/simple;
	bh=4fJXDMhDePqyZd6EpKGxg+qBA/lHEr/AL/1IHNmbZvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+PHl4Q1HLa+qFNwvoHmVmU5TnH11cIEldCenPPsiurJBYwuFczA1O5IUpJAH3ptO/dZqmIBTj7KFJ1M/aTNLrRZA2PC71vm9zIEG6Qh7JNE4dLCSE9o2W1d+STYPQbKoyz5J6ecW9H9b21aPeZfkNxHOrNQe0l/jl8nnvDKfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqFNyWN2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqFNyWN2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so1617615e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928614; x=1785533414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CN4j3B2Ei9FzMjHSr8MR0rur8LVNuE/HG39uOAuMHu0=;
        b=gqFNyWN2p6IYwVVeBk+6ICwzbkypvb87UkW8UU8dtr27IxHKwR7ZBt7C2zbwJEUU0v
         T/ORwPxNrBWbMr+MeFwV9/kAJIY74tjGXQ2yCUhqfTSE1CgZQGqV9DPXzYlDZUfdE4Cn
         0/upv8i8tEHgyJ+92WsKbbqP3sTYon5W4n3RVRlwH4+FCj0emFVbhGKav4yXiyl24f1+
         0ef7H5qXAj9aqEBLZ2blBAAz56c0gJVx2fRXgx2SP1FbLG0hmiyMvRr6WJ4dssghYM67
         KTdCV1R+n8qIvt2rIlCXgntLV3nT4n+63PpB1BjfMTA9xbXXSt1B5ZCogSpnV71QArjT
         RTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928614; x=1785533414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CN4j3B2Ei9FzMjHSr8MR0rur8LVNuE/HG39uOAuMHu0=;
        b=NqNtTSP1WQxF6ypxcxEQn/lAgRanLUV3MMHxigJfZZTTNVku01pHDq7hFCHnkaTfRC
         6AEg1brwJQTd2NqxEhhubdiUYTkDAanVlIuZGVr2I3jjeajPWguO2aZXHG4K6SJ9LmSF
         AH8rkJ3ML29S/g37feqQTfK1m9l/b+Fhat5l53X1+0BBPTUNHPne9xnwYEJZ+3wdRMz4
         sPTHTagJ5fNG+SIwXnPO09uweBI4MT2VI7EQRGr4XkcsQql2brHmBaExSf2nK1zaKl7H
         iZp9q7TKLGHr8D08/lZy7d98cGvhROBNge3l5TxxhuncWwN1VGyLCpMA1Tt6T7uFWmtV
         xcsw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5q5+rGGxkODSbHMpBYlOD01XDkkesh7LeQ6kecNQOjSVqf8E1JjnNmO0hH9LChwSWigsVWBvoKFoakK9/8JY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOx5IsoNovs7tU0SfEYmkjCwrQOkZsVqgs0OTdPc8tv3um5Q1O
	H0ZAx7Avqjeb9v4ynXHm+8W+xWF3kgmxOKyUtH6Td+okTW+XTCuFet3B
X-Gm-Gg: AR+sD111R6IXB9B6P6BCVwOkUcVp9i1Hj1DQb0ErLLqZsg0x8IdFqrI4L5lUcB50FFh
	zIH732L6KkKRbGR5Es33rdFi8wgSPqO+23I9vlVC6jQAFbcmus4/5zxmGrNo9fygbJm1rsjXdlK
	7bSDUtZvb50FhvUcm/ASE38ZKNLpwUIW9G7zirFBGMOHYLqVSF8FntHjMqBdBme6rAGAVpsQMZG
	UVlWrRE+3K2uwhc0deUWa4rqnsIPCegczgbh+L96hDaq2eYB9gGpusZheUh8wz6F0lOzNlvfKZi
	376oeowGvpAtmKBSdF8C2lfLhXkwHUfqEjAPDrGepkje88WeiHA5t/S11VXmMAkaK7vBMi1vTPe
	ihfi/ivYhwJxjmjSWRatshbwB+ayHxChlO/T4GjcwYRoaE5d1NolDHpp9eoPQDOsh4xL9B48sMy
	oIf8Rz7DTlYoAmOit6wTpoInWzpdS07BNkrQfxBChBm48iWeRlzdUahyim/42XqC1ZY2+9Lt3Cl
	R4n9WAatUWGk4X6mlkr78O8NpoaNA==
X-Received: by 2002:a05:600c:4f08:b0:495:4505:dad0 with SMTP id 5b1f17b1804b1-496b56efed4mr368675e9.2.1784928613754;
        Fri, 24 Jul 2026 14:30:13 -0700 (PDT)
Received: from [192.168.2.69] (dynamic-077-181-161-038.77.181.pool.telefonica.de. [77.181.161.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm12709335e9.6.2026.07.24.14.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 14:30:12 -0700 (PDT)
Message-ID: <ef79d6c0-c232-4e02-a3f0-67c956486125@gmail.com>
Date: Fri, 24 Jul 2026 23:30:11 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/4] net: hsr: allow PRP RedBox (interlink)
 creation
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wsa+renesas@sang-engineering.com,
 jie.luo@oss.qualcomm.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, fmancera@suse.de, bigeasy@linutronix.de,
 fmaurer@redhat.com, luka.gejak@linux.dev
References: <20260717201457.54-4-xiexinet@gmail.com>
 <20260724131246.679974-1-horms@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
In-Reply-To: <20260724131246.679974-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 14:12:46 +0100 Simon Horman wrote:
> [Severity: Medium]
> ... unconditionally increment the port's tx_packets and tx_bytes
> ... inflate the network statistics for the physical interlink
> device?

Confirmed against the v4 base. hsr_forward_skb() receives the
ingress port; when that is the interlink, the interlink device's
tx_packets/tx_bytes are incremented for a frame that arrived from a
SAN and is forwarded towards LAN A/B - nothing is transmitted on
that device. A deterministic accounting error, pre-existing since
v6.11; the series does not touch any statistics code. I will send
an independent fix for net.

> [Severity: Medium]
> ... err_unregister ... omits a call to hsr_del_nodes(). ...

Confirmed. The earlier hsr_add_port() calls install live RX
handlers, and RTNL does not exclude softirq RX, so dynamic nodes
can be learned before a later hsr_add_port() fails. err_unregister
removes the ports and the self node but never calls
hsr_del_nodes(), and unregister_netdevice() does not invoke
hsr_dellink(). A real leak, though a narrow one: it needs a
partial-initialization failure after traffic has already flowed.
Pre-existing (identical in v6.11), unchanged by this series. I will
send an independent fix for net.

> [Severity: High]
> ... directly modify the path or LAN ID in the data buffer of the
> original shared SKB before cloning it. Does the second
> modification for the second slave overwrite the first ... ?

This needs two separate answers.

The specific sequence the review describes - tagged input on the
interlink forwarded to both slaves - does not occur in the PRP
control flow:

* A normal SAN frame received on the interlink is untagged:
  handle_std_frame() sets frame->skb_std, and each LAN output goes
  through the skb_copy_expand() branch, so LAN A and LAN B receive
  independent packet data.
* An already PRP-tagged frame on the interlink sets frame->skb_prp,
  but is_from_san remains false, so hsr_forward_do() consults
  prp_register_frame_out() before any helper runs. For LAN A or
  LAN B as destination it returns 1 and the loop continues, so
  neither LAN reaches prp_create_tagged_frame(). (This series
  touches that gate only to open the interlink destination, which
  is served by get_untagged_frame(), never by the tagged-frame
  helper.)
* A PRP-tagged frame received from one LAN is not forwarded to the
  other LAN either (the same gate), so it cannot produce two slave
  calls on the same frame->skb_prp.

The underlying pattern is nevertheless reachable, on the master
transmit path: a pre-tagged frame transmitted on the master device
(for example injected locally via AF_PACKET with a valid RCT; this
needs CAP_NET_RAW) passes prp_fill_frame_info() with
frame->skb_prp set. With port_rcv == MASTER the gate returns 0,
and both slaves then run prp_set_lan_id() + skb_clone() on the
same buffer, so the second LAN-id write can land in the first
clone's data while it is still queued. hsr_create_tagged_frame()
has the analogous shape for HSR.

That path is pre-existing (the helper has had this shape since at
least v6.11) and is not introduced by v4, but the concern itself
is valid. I will fix it independently for net, together with the
other items.

To summarise: all four findings describe pre-existing code that
this series does not modify. The interlink-ingress sequence from
the last finding does not occur for PRP, but the same
modify-before-clone pattern is reachable on the master transmit
path, so that concern joins the other three: four independent
fixes for net, each with its own verified Fixes: commit - I do not
assume they share an originating commit. Would you like v4 to wait
for the fixes, or may it proceed while they are reviewed
separately?

--
Xin
