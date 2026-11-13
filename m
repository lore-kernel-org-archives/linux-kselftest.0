Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608567;
	b=ub9wozlkq9gvFK9/vh/qoOy3gprU3xTT8753nY83mzHDp4ZNRPq2NXrF5JXHxdtBPbHs
	 LIPbFjul5m+GL+Ui/+oYW7BK5QsTa7QnCnwFfQYry6UGd9LhEGzEX/qnMTUxQuec6D3Ki
	 ERB9NF+YGbw6/tvKETQw9Q1n9U23rw8lcQa+E/6TfLsvnDOVC199zHfXG47KwQKMUd/dD
	 eRHOJUj+du2GkOq7w9b2lg2chCW14rTDk4wT+CcOb8nApmSoplTomW2UvrXh29ji3mKtI
	 Ka2odxx30maErXvF62gSwHO785uBAU4joAF7sK7LPQf8llApstUAwnwBSz+DXiuu+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PuWQ2BwaMw0F60EupC+5yCUtgb9A+hweuIMrIgnawM4=;
	b=xxoZXHLESnBqvAFWDe1eOxIC1JrlZr/B/nPr3x3UwNmQbPa1+rFnujO95LijFvblquBj
	 Px4CXELibhxap5A979FQwGAVDXAWzS6zVHhwLuviNv18JFH+MqKUfQp0xMnz3a+rYGv3f
	 7P0bI9wK5CMoOaVIZyYgvLxvJmFv7Hn+FqLtfDG2II+IAF7kkvOONctiqRKl1IAR+vkcF
	 jdzueKJ2usjVGcRfKLF4oeMsFT1UNS0Qn/VLGAXndHga2IAWfnbVfV7xZR2bH86tthX2q
	 e8/iVbdA4k1meWgJ897r2aaQcE7eYIefYPRpUHnNoqhxE6bOS4MNRRp1G6pg5u/ql4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kt0eGjZ6;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB539606A88E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 22:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB539606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kt0eGjZ6
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so446941eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794608566; x=1795213366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PuWQ2BwaMw0F60EupC+5yCUtgb9A+hweuIMrIgnawM4=;
        b=kt0eGjZ6lI9yQVuQ0WalkgZYGqnAu6quAkbn/YNnSaNNY4bDxmg7vWu5L/iCEKeRq1
         BcHDv16Nly2AE2lgZ1szXyCbpA//4r+TIy7pmoIrIaWlaAuhxishgr/nf6iJy+MF8JHL
         MnFiQ8swqhS0T9o7CW2+KpZh79x4DzoeNMIG6AbPH6bu90SMA4+yEXC9cAzM6enI8Y0J
         2N0H9Y4xL4Kj41pYFL5pMsv1U33XLXGZlmtM3S4WLqvVUbDJ+yObSu0oCraJ4gIg+Qrv
         xYsUdpVKLCo1UNmumy85tcug4O2Qi4xN+kSO2xy4WFG7/h6Nu2vesGAp6pwgnTMh6ALv
         Nypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608566; x=1795213366;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuWQ2BwaMw0F60EupC+5yCUtgb9A+hweuIMrIgnawM4=;
        b=xxefgmgm1q+tzq9+59Oi8WPc6jQQY4TeP6LuzarkcupR2AUq9IX/JgmPN3RPLvLE2+
         jMwlA3fauVjK/cFNyAMwHy8nD+T5MyjFuxLkcNd2Ct7pqXNkMxAJg9hHq27If+5d0nR9
         OGgr5g/HWUZOqcW/ptKDEB+jEVw1JIc5C/Uhd7ayjyN8U01LrHLc+oOcL4ZDHpRxo6uS
         k3kiqUgDLCcSPm0TTNdmvP1EuzH7qzoGGeXmf11FSjBFHl00nTZYQo5Z5dPxP7swIiOY
         bm/qMDB4a/vEYysSuJgNImDsMXSvHL9I/h5iUjpDcTs59Q6Ixpq22VK2bNRPjuGFd40W
         AmFA==
X-Forwarded-Encrypted: i=1; AL+hErHAujb1Bw1RDmuiOula0nE8QpoWbwpvygp+smVx0Tnhp7xztEcHew6m4hnyro80zOMsbwoVGgv/W3suc/7POnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l62Sj1e5w0ndmuDxNHPDy4fqP2758ujyDhKFzixqBCjcYxh7H
	s8vtPelnlNExdslCR91h2dtdEyZHtjWJzzify7n2yW5QyHa6HiPpeIcY
X-Gm-Gg: AYBFou1EV0nwrk5ZRGZnEDM6H5lydIInF3mZ4eH6hgLcEOFnX0ToFZQ9GyvKvKLquwd
	MfOeWuqCvp8CgqIthJij+Vee9/Z8O/qBkvisI+ot7bENmGKZLe+0OtO8/qJAgBG9x1RjZXjhpvm
	6FbsRUbo7AiscAqyarpk1qfTPj5cs5n4oqI4WlawrjF1hBUK5LddCpUK09IkWh3ZrD5HudHZKL4
	i4GxMPVexAMd6AMXgFgnyAFKYp7606t2aW5OKleG+wcz2SC1g7LE0ZlsQz2J0q2xFRrrSkaaVq+
	24x9OCn5yz2aAQpNGVqd7ZdNbg+m39AIoVSuqxwt3vT2SR5rYqGOoxUDaa39ILlA6+TTqkqHMrf
	/be1AAeQYx7bKMfd05uSO1fThBxoZusDVTlxPlenOgCJMG/o87nxaoOhMyH3iZSNQGmpzcGIrF9
	/+inapXUH57Th7UQMoI/NE7an1Z8PNyLW11bYS1r7G3lMaEFSHSNqirnPdscPFFvfQ7GunJkU6g
	E6j1OBJP65M60yZuLLkdlZIpQQtmICoCCIIuApZGI36oVvDaFFsY0A0OVfj1XsegWxE3ohgqOhu
	kLkMcgmWK4nw0wfgJSA/Fic=
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr3171439eec.16.1794608565735;
        Fri, 13 Nov 2026 14:22:45 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10160338eec.3.2026.11.13.14.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:22:45 -0800 (PST)
Date: Fri, 13 Nov 2026 14:22:41 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jv@jvosburgh.net, 
	haiyangz@microsoft.com, ast@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, 
	sdf@fomichev.me, bpf@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/5] net: make xdp config checks effective vs
 netif_xdp_propagate()
Message-ID: <aveNqpUudFjo0jA9@devvm16445.scu0.facebook.com>
References: <20261112235027.4072149-1-kuba@kernel.org>
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
In-Reply-To: <20261112235027.4072149-1-kuba@kernel.org>

On 11/12, Jakub Kicinski wrote:
> Bonding (and netvsc) try to auto-propagate XDP programs down
> to their lower devices. These programs were installed directly
> with .ndo_bpf and not recorded in struct net_device of the lowers.
> This makes all the config checks for features incompatible with XDP
> ineffective - HDS, memory providers etc. use dev_xdp_prog_count()
> and do not call down to the driver to ask it whether it has XDP
> installed.
> 
> Record the state appropriately. dev_xdp_prog_count() will now
> "see" the propagated programs.
> 
> The issue was discovered when reworking HW-GRO and XDP interactions.
> I was trying to make sure HW-GRO is reliably disabled with XDP,
> and discovered we have a way to bypass all checks with bonding.
> Not treating this as a fix since it's admin-only self-inflicted
> damage that nobody is reporting being bothered by in real life.
> 
> Jakub Kicinski (5):
>   net: don't safety-check device features for XDP uninstall
>   net: move dev_xdp_set_link() and dev_xdp_set_prog() up
>   net: record XDP programs propagated to lower devices
>   selftests/bpf: check XDP attach on a nested bond slave
>   selftests/bpf: check replacing and detaching XDP on a bond through a
>     link

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
