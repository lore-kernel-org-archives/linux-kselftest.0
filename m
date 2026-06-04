Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249603D88F1
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562207; cv=none; b=G1pLyC2l4nIZ8lEMR6ZbesAbUDxHxNh9cGhqj45zjr0XYmAzbHLAqFVgyJWWwF7vZpV3rcCScXaHQ/GLudlbYk78olj740ke1T3+ejnjDvc4jJCL0tXfnKdombYuEvWkOLNc8uzH2K6WboYDMbwWCm57RfYLTnwWzU3ePCb4rPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562207; c=relaxed/simple;
	bh=CBt6CTRoYgZmxlwS+t5leQNFWHs1ywfzHiZcS4OB+5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GivkHVlMMRkXBw1aciFUmsS4NsBXMqYx+8qAXwpB7y704MiFdD4b/UDXdQvTb+BZqxHN8PasWXH1WMtH6jej78V6sNTvL1Rte1a0+d1RNEl+kbEUhN6ZTn6yBG/93fVvDeuRWUl86lO+F7Wq42M50tnB6WBCeZQjtvwSzZJrv7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdTIlNMi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdTIlNMi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso3978905e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 01:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780562204; x=1781167004; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBt6CTRoYgZmxlwS+t5leQNFWHs1ywfzHiZcS4OB+5Y=;
        b=JdTIlNMi+MrcnbupB6cCr0oPBDYQsS1uLf0N6CisDsCYdzA3fbkANPXAYTQiH0OeYu
         Kz9m36MSnvbKLCoGoATVixUPi7hQnnWVGG5Dn18kOaC7Vcnno47kXMAw5AxIGCmqUh8+
         WG28TbVtveol7gwAbQ8dG/EM58IUNn2cpF3iqSYhOVwyhpvfuufjWRVlAnTzJCAKLU1e
         RvFnBBOlbdNS5JICExs6yHluVaymPawHbYV4Ly/QvKwpF35hqSnOK2ONwfQkfpj6UXeQ
         8LaxK30PEiM8odjBdr7oi7GM5I+fgyYRq9X5NgjVbgDuETvXJsZPJl/zx15wZCF7Vu7g
         oxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780562204; x=1781167004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBt6CTRoYgZmxlwS+t5leQNFWHs1ywfzHiZcS4OB+5Y=;
        b=m868yuafs3oOiudb/WkX16Y+q5ua+x1N6FJeqtpWzSue1aq2Gn8m+0Wl6vW4KudwR6
         Ana+KpGIKIdPzKbFbreOGhugcxwQ42g4wKSJAU/nrvQVRJ3ZeI+/ILk+HcAqO3ehHQzL
         Ed1D4MIBGMN8AFSQaxkdgmUNrS+1XrNAJqV56ZLyZ5YwM/eOaxk4VKHVF3yMLgQS3BC1
         tn18OqmYBU33GiFfmgwvLS6ujh/49gect55qIM3S6FjEyQx8nTllClv9BTheFobthTKN
         4aT5GxD9nnSS8FwMivPIoTuR5UfOJFsxMrW9Djce9SB8WX+noDyq2+DbbS8pbdrY7Jac
         fDFA==
X-Forwarded-Encrypted: i=1; AFNElJ+LPRJ81YGAGSgXn4F04Utk6TuJrIC1nLiGO+XVmlQspy7D4uusIcJaGKPoovQBpJFSFIXJO/1OhJ5s+Ih6bZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrRWnNKhUAczFeq1bsQ0lu19OuUgo4PSwGJfrXWctdunMMGI2V
	JnvypCH19cU/HOOjo7BvaAVs31TixB278WmuzekiGTfZ05WVwi7OkzfB
X-Gm-Gg: Acq92OEjO3yoRwrMlpnnrcBrMTy/LPrJK9crJbQqQBCyRhVjDo1x13zHjWKB18DdbiB
	lpWq6Q7260s0l/BwJQXwnt+zQdH/5x6xJgE3UVP6RMSIWMsSG4fVzqUQ8wBJ5PCjNf8qv0ALq4/
	ugyqYex83W5Kq70rlFvV0ZvIKto7Ay89xGpq2Gl/cBVrArnJ85GTndiZc3lXG8dek9EymX/y11w
	JnEgDrllIT+hHbx5IXMn2mDeZk1BXaU7GTnwRXnRA3k4bX/kiPiRdMRvwsrTx0aD7rq4ceYxVfy
	yFItXNSkaEfl/WedbgZQ8T7c35oUG1aLZrRmRIx8scEAixqSOoGvHfFiCm1DIaaZKA4R9KW11bI
	rGS260cSOFT4NSQeAeJR3lcWsO1xPdUaacBmYhgkZS3kApI/zSgLAYFn7NfNXF7kk+cwVBc5sRh
	pqgjAMeKTFZEEpOwfe4+OarGffVWNtWDwkuwmE7Ra9YTQsG57ru2DbJtqYpYeQu5bgusiUqD8jq
	2AF2wovBdTXR85YF9+XeIFXTl2v6vDM+e12JE5n8PVeM08=
X-Received: by 2002:a05:600c:8184:b0:490:b3f1:e41b with SMTP id 5b1f17b1804b1-490b60e20b2mr104501265e9.26.1780562204213;
        Thu, 04 Jun 2026 01:36:44 -0700 (PDT)
Received: from cedric-laptop (2a02-1810-cd14-9200-6809-bbad-785c-8e80.ip6.access.telenet.be. [2a02:1810:cd14:9200:6809:bbad:785c:8e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918fcsm61056715e9.3.2026.06.04.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:36:43 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:36:32 +0200
From: Cedric Jehasse <cedric.jehasse@gmail.com>
To: Luke Howard <lukeh@padl.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bridge@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Max Hunter <max@huntershome.org>, Kieran Tyrrell <kieran@sienda.com>
Subject: Re: [PATCH net-next v2 5/6] net: dsa: mv88e6xxx: MQPRIO support
Message-ID: <iwlidn7t36oax3t3y6o5jr3bfm24t3uw4g2toqam3izkmafnxy@sphgjtjrkqg2>
References: <20260602-mv88e6xxx-8021qat-mqprio-v2-0-72be14522e7c@padl.com>
 <20260602-mv88e6xxx-8021qat-mqprio-v2-5-72be14522e7c@padl.com>
 <t44kmhk6gqxnwhdvo7svouexwelwsya7zgukpbv3cxpfsmutqa@y3rjoj3tvqce>
 <808529B1-E40A-4E54-A654-86F1B6D1FA66@padl.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <808529B1-E40A-4E54-A654-86F1B6D1FA66@padl.com>

O Thu, Jun 04, 2026 at 07:36:07AM +1000, Luke Howard wrote:
> I realise I misunderstood you: this is about exposing the 6390’s egress FPri to PCP mapping via DSA/DCB rewrite? That’s really cool, and orthogonal to MQPRIO; apologies for my confusion.

No, it's about configuring the ingress pcp to QPri mappings.
The patch has been submitted to the mailing list:
https://lore.kernel.org/netdev/20260604-net-next-mv88e6xxx-pcp-prio-v1-0-f9d10fe6cdc8@luminex.be/

Cedric
