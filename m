Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D57A382F1E
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434720; cv=none; b=nw2f+RQ14r3ZOsRxoXMQfhOcfUKh6u5bO8gsp3mQ3LjC6CuKPk54rffV84SGRDgsvkKX1rQKTpRVllnkQw2mAQiToPuxUDcrMVcYlOW7WjiSzWeeVOwq3CpGB8XdrGI+dKh++LiOOQlyg6smI9kR4IopRb3X/jw7KcTFfo2CPSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434720; c=relaxed/simple;
	bh=DR1AkpCg19vmza3y1XhaOoXFEA45xJVCNkq6eE85JyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/yQmYkYU54t9BQA1DzEybmIS94yQVYlb09GnoZzZE3Bb3ly3G+Wi6pTTy/6bePZ67d6T9GRZJjqxf+gCYclMzVU0QijbzZrQccwFIJTbcksS9aov6wkrSuS6KLY1eZuZlKl3WF0633bD+d3mJylg4ZM6/6nOL1GBUBFDXiDRDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=F/wREpkW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="F/wREpkW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43fe5574cb9so506126f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 00:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779434717; x=1780039517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+sd+YQcPZ4Wvn7Tf8ziui+EYH4Lu3lY9BCWXszm0/a8=;
        b=F/wREpkWGbxx9s/fyP+PbaJfHfeD6/GWtwCdsEtzDn8y3jvT6BqByijkYNejRW3Lj1
         1N0wXy+xRDhEEiyoDc0I7FzacdIilbY8htE3JLcUROSZ9/vQ3RxRJpxYGeX04cBYm2bC
         MCLPBrfw2N2cnOyCGowyjAli4Tt4B6x7jEc33BQNL9Fgw96MFDS0J7VSmQxJYiH6jUGw
         s0CGTSGuTZrByLcHmC/2KdNclSgcsd9E/PW5rm0DabuDXQJHxanrD+dL7/YJJfvy34Eb
         FcqyQAQr9yqgj3cHSnVHkvJ2kjG+cfzx/2j08gycv3xqs6zzLRGo3fczQh3uh2pMVk0K
         RWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434717; x=1780039517;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sd+YQcPZ4Wvn7Tf8ziui+EYH4Lu3lY9BCWXszm0/a8=;
        b=C0yOg2gKZ25aQLBlL0aFCIXBAry/AH62OAjp9XjBnbIlicCQbURJW1dg2NsOTLDx7E
         0gZ3mQ/ce7ZfgHJEkxGpBfS0cAhV0txPzcA3lHh+pdInGOt7Q0cmIoq6u4XBF6prfWW1
         WfR6r2ISyS2E/QPBS1v7speEIn9fjxiO52rprdKuar2BUgaaRvuJV7kurUeo7R+Gtx/m
         QKJoy0lsAKqFfjbY8w6u2/zzDWHxPHzjFR2WuE6DcBg+kMRiHL8173G0PwmLHt4sa/qA
         dSQPfqi/ayLhUVkbsQJvu0r8MQ0eJNijLrsJ9/6fk5sO/QiT0ZqH167NNgwm541FJA8r
         pMeg==
X-Forwarded-Encrypted: i=1; AFNElJ9TV2j77vtphZuOpkyssIZB04KUAinT86V/jnMlfQE1soodDrtGGFm/2liS35jiEigOSWU4foPumk6v6n9O2MM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjathFnqMbWBvGJOuk1Y0a6Hed4u/XFMFwvQLNAFZffhduh04
	1vc9QZqVzpQ636c+y1DIbYwDS3RKNurmvBt+ChO6FS7UNO8Ju8LVso0oSGwfqbfEOsM=
X-Gm-Gg: Acq92OE4G2k3QmhftUySQ0pc8WgJ71Dv5ijzy/LAPBwpO4hjQj0L05YzfO29OKNDvpb
	nTo2ymmhDlISRndIW9gSM+m5O6UNkLQr/UmTLbo1a8ZBhFLeJ+4HoyRzNRJgvmgN9su+WNrG6wl
	nbGyjMdz9vzlOVXY2xdwSu1BtpaX83Xm5rVBokm/XbqhUXcr3uH1/nyM3egBYUGDz63AIvqAA0E
	SyILharzbElNkNt3u/xtfef9CKIzv+AAvIET77AnhPM/L0SbSwuzaPxTP78Flc7HicybAaDBsyO
	hzLt0BIXoqkAbCBSkxxsLhWioHqCgESfzhPXlNOtlS1l6Dp5UZWnsU5V9nFL3i/IaEw6CYl7fq4
	Y3edEQVyLg+2p7JfwWF481EMV85YNWF6+S5S3ne1ksmET8SFdRuQeUx6bzzvT9RJroZ5Ct++BpB
	OrZZqDYPpjkCc8MV6kvQGjOWQWJmD3kQM1DUw4wlYnzmZl5dPprMSrXgN6BfIHrmbA1NqEB4Thk
	gcl
X-Received: by 2002:a05:600c:c4a3:b0:485:c456:5e4f with SMTP id 5b1f17b1804b1-490422529aemr12940665e9.0.1779434716903;
        Fri, 22 May 2026 00:25:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527f7f7sm41628455e9.7.2026.05.22.00.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:25:16 -0700 (PDT)
Message-ID: <c34e04b3-d807-4287-8c64-dfb3d7232802@6wind.com>
Date: Fri, 22 May 2026 09:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2 2/4] net: netlink: don't set nsid on local
 notifications
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Kees Cook <kees@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, Jiri Benc <jbenc@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
References: <20260520172317.175168-1-i.maximets@ovn.org>
 <20260520172317.175168-3-i.maximets@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260520172317.175168-3-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 20/05/2026 à 19:22, Ilya Maximets a écrit :
> In most cases, notifications on sockets with NETLINK_LISTEN_ALL_NSID
> do not contain NSID in their ancillary data in case the event is local
> to the listener.
> 
> However, when a self-referential NSID is allocated for a namespace,
> every local notification starts sending this ID to the user space.
> 
> This is problematic, because the listener cannot tell if those
> notifications are local or not anymore without making extra requests
> to figure out if the provided NSID is local or not.  The listener
> can also not figure out the local NSID beforehand as it can be
> allocated at any point in time by other processes, changing the
> structure of the future notifications for everyone.
> 
> The value is practically not useful, since it's the namespace's own
> ID that the application has to obtain from other sources in order to
> figure out if it's the same or not.  So, for the application it's
> just an extra busy work with no benefits.  Moreover, applications
> that do not know about this quirk may be mishandling notifications
> with NSID set as notifications from remote namespaces.  This is the
> case for ovs-vswitchd and the iproute2's 'ip monitor' that stops
> printing 'current' and starts printing the nsid number mid-session.
> 
> Lack of clear documentation for this behavior is also not helping.
> 
> A search though open-source projects doesn't reveal any projects
> that use NETNSA_NSID_NOT_ASSIGNED and rely on metadata to contain
> self-referential NSIDs (expected, since the value is not useful).
> Quite the opposite, as already mentioned, there are few applications
> that rely on NSID to not be present in local events.
> 
> Since the value is not useful and actively harmful in some cases,
> let's not report it for local events, making the notifications more
> consistent.
> 
> Also adding some blank lines for readability.
> 
> Fixes: 59324cf35aba ("netlink: allow to listen "all" netns")
> Reported-by: Matteo Perin <matteo.perin@canonical.com>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
Acked-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
