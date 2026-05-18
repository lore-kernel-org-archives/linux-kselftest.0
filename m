Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF7A3FDC1B
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106462; cv=none; b=p1cM/02BF0LS6X5QQyLWA58R3opiINwoVAADGrjpRoyotpRJAMlDyJHLjCCXP4SLBmtDufFAYsM66CDyHbQs+59sM1GELsrW2muVy/vVNZx0QrIBA3lKlY/4QIiqNwSQqexjWtvR2Tug2JSghqVqUkMCjz4ngq89mwNw5Mop8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106462; c=relaxed/simple;
	bh=/ZLcAi0NAsYNFT9QZfyzBs+pJ4BxC0yxZ/AaaalRjvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5YP8odpPJ/qExNCi43ugLTyUk10vJMa3+RlnbKyxfykfPqDhF1WoAL9+h08fFgg4TiWxGzIAwRf2o1FsPpmXH1gdoZO0QdRiZzzPmdtGcX8cD1WIbpLCKX5xogVQvmLdZXRxzmIbY3xngN5LXjTpVUpfSVl1dQJ31bbYktoxyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=j0pL599a; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="j0pL599a"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48962cd0864so3235105e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779106459; x=1779711259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5AssGvWsP766p9mHWby5V0TDO49rQ+HM+32Gpbke/no=;
        b=j0pL599aKnjKCPc3GOaNHeCR1uuaOiAqE2o+j6ayKzDWYiJOP6Qt2PZiShgxd9FNQM
         jFO7WUlA16MW5kBrGQPOGIRbLqqHE5UK7e2Hlncv7SrtdvZoKHHgGoIxWfCtaZFLLbK5
         OMBDE0cYrzKpQI4bJ1bx28NTyD+m1H1n3rvM2MLsL3UnvBLtFc0e4QXyOvIrKi+nyQhx
         0ph5vcIqnYN2tsk51RIG10lOfspoAb42fH19iEqtivmt/xs9S3uHjU9f0BvKRxJonhmd
         c879QRVzBEUqtUdz2dw69vuwEUnBZetN9dN2gUxRponuCSVzE2/svYMlAdcE5g89Rwxv
         6Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106459; x=1779711259;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AssGvWsP766p9mHWby5V0TDO49rQ+HM+32Gpbke/no=;
        b=Cf5AEfQ8CVRPGEKA8rEL0S+8cMefrDiSBx3oO3+4TV5tlvQPjujJjzvzUkFMO/Dubg
         Ri12aQbifS+gKwzJud59pMY9BqtL+vn4XPNrJEiL8HEb8XnNdfC+kIPI7M5mng7uNmD3
         hGAA91Ijy6CaGgo6f4PyQX6N94v2l1SdR/tN8biRr9uXDLL/KicYigi8b8mnV9lLFlNB
         u1QQHogLNX5SpWBo/HF9BhmvHNOoyN8wAXKI6grkMnSPkzRnQnIqs8fvrUnw1KkCBWrX
         mq/eOy3mT7i6iFWcNFQOh4sPPngHeKC0IMDrAqLeGePjl4g5nNKbUMbaU0Ywp0x6WtJO
         us1w==
X-Forwarded-Encrypted: i=1; AFNElJ//2jQZgPJj/9XR+BjqMIltAC3J59iHc0HmvC+jDA9Z2DqVVpmjxQ7gEgxqlsUIxSXSKF6cY1KG3r9QFg4qvcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8AsZ2Iox2ikwJeYkMQikNJ6QaWN6jFurIrOOJPsCFMCWU5O47
	tIiePDCL6CBbKTDuHhjep5MJ06NTD2A4EMc/0i6rrDbdJTTiHSEx2mrpjsDjOrjt6PM=
X-Gm-Gg: Acq92OGCQ7+VCx5D9odKpOLVLcnV3l1pbcjdpvhRtoyutAGO7x4fToCd5NrgaZuyeeY
	bsth+w1Q7/SSVyg9yIfdmG3+4hSGs875XsqfHT3GSEJzcLEp5EM8aKXOmiHBwdOagBGG4pOIWP9
	bJ3ZFPY8+4sCj6/9JLw1banJGFhJFaNrIfPzlbXRz+YFsy+Foh87pvwnURuq/VKhlwLMl/2ArSy
	RV3tBhJmVZyekGXR55QWm80w2Xj2BnxTt70K2VTrAa3qk6HE38x6fZZRn1pyIHJorw/jQdLm3GH
	mo80/1pwVDA1TVM48zc9Lu51xKX1alwLyeM/IWQMn9oHwf9Lo8FU+GtY9EU6Rd4P4SezMQOUx5w
	NdeeYIFXJJKvQM64UlzaIOfAqsaDkyZyIPOjZKQLm6hvbpzI7kSzOG8d3RoHpODRIgP0fCx5Xwa
	GRWXeL7cyC6mVseb8VNIgnrRp7MPf8ije3wVl8Z4c0Qn93ffT/kjc07VV0Zjw8EGsVXQQUb5b0e
	qjk
X-Received: by 2002:a05:600c:1d0d:b0:485:c456:5e4f with SMTP id 5b1f17b1804b1-48fe59b071bmr112799545e9.0.1779106458820;
        Mon, 18 May 2026 05:14:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm258311125e9.0.2026.05.18.05.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:14:18 -0700 (PDT)
Message-ID: <40603dce-f801-42ad-96ec-c8c0a57e5aae@6wind.com>
Date: Mon, 18 May 2026 14:14:17 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 3/5] net: netlink: don't set nsid on local
 notifications
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, Jiri Benc <jbenc@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
 <20260515201937.2813983-4-i.maximets@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260515201937.2813983-4-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 15/05/2026 à 22:19, Ilya Maximets a écrit :
> For notifications with NETLINK_LISTEN_ALL_NSID the expected behavior
> is the following:
> 
> - if NSID is not reported, then the event is local to the listener.
> - if NSID is reported, then the event is remote, i.e., originated in
>   the provided namespace that is not the same as the listener's.
> 
> Userspace applications like ovs-vswitchd expect this behavior.  And
> ip monitor uses this logic for printing out [nsid current] vs [nsid N].
> 
> However, when a self-referential NSID is allocated for a namespace,
> every local notification starts sending this ID to userspace as part
> of NETLINK_LISTEN_ALL_NSID CMSG metadata.
> 
> This is problematic, because the listener cannot tell if those
> notifications are local or not anymore without making extra requests
> to figure out if the provided NSID is local or not.  The listener
> can also not figure out the local NSID beforehand as it can be
> allocated at any point in time by other processes.
> 
> The value is practically not useful, since it's the namespace's own
> ID that the application has to obtain from other sources in order to
> figure out if it's the same or not.  So, for the application it's
> just an extra busy work with no benefits.  Moreover, applications
> that do not know about this quirk may be mishandling notifications
> with NSID set as notifications from remote namespaces while they
> are actually local.  This is the case with ovs-vswitchd.
> 
> Having a self-referential NSID mapping is not something that happens
> under normal circumstances, but it can be a case in specific
> environments.  And it can be more common with certain container
> runtimes like LXC/LXD/Incus that unintentionally trigger allocation
> of the self-referential NSID via cross-namespace RTM_GETLINK requests.
It is easy to allocate a self-nsid:
$ ip netns attach current $$
$ ip netns set current auto
$ ip netns list-id
nsid 0 (iproute2 netns name: current)

An application should be prepared to handle this (it is easy for an app to get
the 'self-nsid' value).

> 
> A search though open-source projects doesn't reveal any projects
> that use NETNSA_NSID_NOT_ASSIGNED and rely on metadata to contain
> self-referential NSIDs.  Quite the opposite, ovs-vswitchd relies
> on the metadata to not be present to separate local and remote
> events.  And the 'ip monitor' relies on the metadata to not be present
> to show '[nsid current]', though this is more like "print 'current'
> if there is nothing to print" situation, but still can be a little
> confusing for the user to see an ID for a local event.

We (6WIND) are using NETLINK_LISTEN_ALL_NSID. Like iproute2, 'current' is
assumed if there is no nsid, else the corresponding netns is checked (which may
match the current netns).

> 
> Fixes: 59324cf35aba ("netlink: allow to listen "all" netns")
> Reported-by: Matteo Perin <matteo.perin@canonical.com>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---
>  net/netlink/af_netlink.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index 2aeb0680807d6..607ab4e4ac697 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -1482,9 +1482,11 @@ static void do_one_broadcast(struct sock *sk,
>  		p->skb2 = NULL;
>  		goto out;
>  	}
> -	NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
> -	if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
> -		NETLINK_CB(p->skb2).nsid_is_set = true;
> +	if (!net_eq(sock_net(sk), p->net)) {
> +		NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
> +		if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
> +			NETLINK_CB(p->skb2).nsid_is_set = true;
> +	}
>  	val = netlink_broadcast_deliver(sk, p->skb2);
>  	if (val < 0) {
>  		netlink_overrun(sk);

