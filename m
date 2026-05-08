Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC043F54C7
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252224; cv=none; b=TKBlboq4nEAVNeaU5uRWlMIXsXVYCV2uy52TY0EW7t4rWTASnbBCaVjrJb7DqUr55OexQmL6E25zj9gR7d/cRw0exyp1FzqyGvUXyvNT5ZygDvSp5PW+sLRZyZs7cyq6qyRDKldFIyrFsb9QelLDWBCdVGx/wMbuwXmNCfcDwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252224; c=relaxed/simple;
	bh=4/aVJnWaXKkXi45aVG/ghAkKHKmtNlgv64ubRDm3pNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZfWf97Vlwb2aSAcdYZkx+XyuhrPq/+ZKdXuCewl8gOj8GkDqHDwF6wJ7Dj+gep3pbjcQTNaWD1J5s90uPbagKRs5hoXOvr2zNUary+OyKGv0TKYhgzQv0rTMZiGFu2jJ4Zsivq05CI+jFVtIUe+YkgaqFyD82d9Zt5zNfreSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3bMKqn/; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3bMKqn/"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-83537a80ab6so1351118b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252222; x=1778857022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKeh4P5RRX9HdRzyfTHqYV6PxblA4dDzAyEahLUA+Ik=;
        b=A3bMKqn/Gk8Irboq+VjkYR/RT3AMkP+uqrEWN1i6QzdfkjeKQeFGPEHxQOcNgVVCfb
         3BHfxwMeebOqbTkfNMbfaMt3dOOPBVmScJUowDz5LrgnEGB8ZWSB0vIJPKwqzkUk+Xek
         bOrlfoBKysN3MkFH5GCsFBGcnSxFY1DeVT+6QWI8MmY4PAhaWQRyJY1F8lIguVJv1BYn
         iwUUi2jv4WoQmeH8e5HLfsPdIEzbhIzTBE+wQrRzt+RT4vM3myf2jEOZSsZ7+pkrET1x
         8aa0PJk9TPozZc9utIvBCoaExaFcJieMoMI/sY4H1CgAacVTRrL9XW0vdmBUeAfVOzco
         /pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252222; x=1778857022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKeh4P5RRX9HdRzyfTHqYV6PxblA4dDzAyEahLUA+Ik=;
        b=tTctXgma1tCHTUwKEQ6xQ6MAp8wEeD7Y1OgMoEvm/YPj8cYGEEuXoegG7abSxS8hYo
         CXVPDiKYngII4GfY1xKyWMAOsM5j12DmlQThLsb1Ov6k8gH49wNwx+spqe6uAJtvChWU
         1e2Boqx7RgtG6tHp8C6K7MHnkfP5n0rX5HTm49sRkcodD3c2jXGMRAKQVN04g1wRGX/h
         zdHyQUHXCTGDU8ANMZwUKuNskAhLmdpkBMLCDnqWyW/A73ZZWIhzXFpST68P+P+cXshi
         urDa24uAHCzO+S1d+eQ1EWzcaXxMcNrFwoBrrEc31ERcVXmt5CqOUU9EBjZLF0ntdIH3
         6FEg==
X-Forwarded-Encrypted: i=1; AFNElJ/1c3mFxoDZw1vwg+kZPPYVxJwGhoFjWdEeMC9F/i3N9APfwYkgLTYtP3K3jy48uCVyRe24ZAZ7AQVTJaxtvFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMIBIIx/oCuDfmix+9QStkC18aw+Ds41yGHhGPMNr/zoR/s7Ho
	f8ugeTfFOscV7ewJhL530465beF+Sd0wVLrM1ID9UhJbjgU1jdj0CaPp
X-Gm-Gg: Acq92OE4crBB/Y1Lvse/gaFDeEzGlMi/OE6ZWv8ueXn7rOOwaVXFIAAaZ2BmAyHj5PG
	DnKTcQV+WXw8meD6oYPtWH6IeYFgOBreMtTz7voLbIztmbj7AeeOp5LVYxhtkeq8yG9Wbd8gt+v
	/m1i+q0L6tpJkaWCh5LvC7f1t/DfWFTb+SsBvCZugbggPA6tvtmFEFn84z0eQsurmtp0iEyhqgs
	Co2PcaznB5WCrhSbaPrIe3Rx801H17gjHXt39PfmUab4cPo2eaRQKB9TADcRXqhNDX8gzL9tSGv
	/djq9ZKCLz/85JW8ZcOIQSUGopPisGePo3tjTwZHL3s6h8XtpWdrr5oay94ZZoMC8qpxHibSTT0
	6ox0ShJF47ff9eTmLXBLSKDBAC/A8jFN8bcF7CIfns9N4CRRERX0G8KrnDunoPpgM4hPdxgN1Mh
	HFojpBlfQHKwaEmGD4
X-Received: by 2002:a05:6a00:4195:b0:824:374a:1407 with SMTP id d2e1a72fcca58-83a5c4bd711mr13683272b3a.16.1778252221575;
        Fri, 08 May 2026 07:57:01 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm16492392b3a.17.2026.05.08.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:57:01 -0700 (PDT)
Date: Fri, 8 May 2026 07:57:00 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, mohsin.bashr@gmail.com, willemb@google.com, 
	jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 2/8] net: netkit: declare NETMEM_TX_NO_DMA
 mode
Message-ID: <af35tYOAr5Xymm20@devvm7509.cco0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-2-52821445867c@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507-tcp-dm-netkit-v3-2-52821445867c@meta.com>

On 05/07, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Some virtual devices like netkit (or ifb) never DMA and never touch frag
> contents, they just forward the skb to another device. They are unable
> to forward unreadable skbs, however, because they fail to pass TX
> validation checks on dev->netmem_tx. The existing two-state
> NETMEM_TX_NONE / NETMEM_TX_DMA doesn't give the TX validator enough
> information to differentiate devices that will attempt DMA on the
> unreadable skb from those that will simply route it untouched.
> 
> Add a third mode to the enum so drivers can indicate 1) if they have
> netmem TX support, and 2) if they do, whether they are DMA-capable:
> 
> NETMEM_TX_NO_DMA - pass-through, device never DMAs
> 
> Widen dev->netmem_tx from a 1-bit field to 2 bits to fit the new value,
> and declare netkit as NETMEM_TX_NO_DMA. Devmem TX support over these
> devices comes in a follow-up patch.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
