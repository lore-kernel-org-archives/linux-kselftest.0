Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD1C30D3F0
	for <linux-kselftest@vger.kernel.org>; Sat,  6 Jun 2026 22:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780784051; cv=none; b=kPoPoj8VkG8jsf2RWcKYJKmKF0MinHaWKmjRyesgDU5JJOIlGYCf843b9MozZKKQGgsEesL/Qa+N4IiYhP+cKdiu0Eq/IxeA5/jUrrVW2MsOIVzj/EtSlpOLxv0ZTGXR6O/AFiWALE0yYWJbneyh3oUadXowsk0G39kQsfAaZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780784051; c=relaxed/simple;
	bh=s5c6ul3C63xfvEM9cD74J3TRSk+sjNTozC8i6Xue4A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImTkLlBQsF1E6o7clzscdK6YRGo9dN5et7q34iatUrTXgpVVM2o0Glv37i9g0yLGsPDZcMM7eQtY3RY3iy3vucHlEXTUwqSfH2kc5LLZvL/YuHqCsFIYEsD5kO0vRzs7VL28V97BTrOFSENaLaL9tcRMcE4e+7Hn6MQqzBgXkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=YRv9gY3I; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="YRv9gY3I"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so18201175e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 06 Jun 2026 15:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1780784048; x=1781388848; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9c+Hlm2LHsdp+Cs0S88z9ZuS/e5nxWWRGBAgwrHV+84=;
        b=YRv9gY3IAArwcZYyYbAHkBgGLpc49JS96vN2NQez0SLcwwM2SV81G7+skkOXFg/UZB
         3agt32ili4/3p+nc5srNKxGDnGrOiivOUupgB0+Hfde0xDR0VHDLY4vwCzrP+F/N5t5W
         ycqFGMUaEcAj/jIlx7DQGWEmwyu1id5AY5YGDCnmIfTZFUJkZA7WRrltOThcSk4wwadM
         7e4TNOdcJkiPM9e+N4grjJLeBOnO2khZPHmuwjjKkEVewUsqdeWLifR+r7fa+lkQqa1H
         tnCWZGqU3aI8nUwOfKdojOxGKuk/MieXkGFMseRi4hlR4OZYqSWSK++KzF0tbWY7TRwh
         XtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780784048; x=1781388848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9c+Hlm2LHsdp+Cs0S88z9ZuS/e5nxWWRGBAgwrHV+84=;
        b=IUaUd1YPTUlQziA95pMaoUL4wvPFRh9Q+9IwkOIXfgQo7vOq4b2TQY0UOx6nMmgx/L
         PdS5/hU6zIJHYeIsVCcIcWv7FYqAzSQIQ6fND1UkUkZXsC9RR+w88EIT4Be87QFzChV3
         hXPrTLDJTzYJ1tQsWWIksQ7YY8wnJiJTEpADpSxrOZZV457EXy6VbpqrmcjexfzfOetC
         +vzjoHU4bzWKL1LA7cmcX1VGFJYbt8XJdmx89C7igOSRoRbxUyoWLAOIIQ0EYtOLMBnu
         OuZLV9I6zl7L8kXjbzGLbhyS6lFtUbBourBbxBJZ1+M+qx1jXTmAUBZFo58z96d6uE9r
         nFUA==
X-Forwarded-Encrypted: i=1; AFNElJ/gTQQrgMxa9Zg3T4OnDKWVVohn0R/GwYqezKJEaWV046x9ZY1s2hdyhbIb7dkQLgWU7X2bEazYFWy94KlMFFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqsDolnj+rds/jbkzueDiLCLR9xRN9tO04fCHLWyXuvUlG+yRg
	XcOGfW7Py4HlVD7tHzTI3CzLSlCsKqF7EQOGeZo5HRTOctnCfW9aRUOBbOJ3wPeCOCw=
X-Gm-Gg: Acq92OEPgoAcmgiqcNEYXuqOcnMgojES8NEcsZaaF71JUxPKfoxtIQHaS5lGMaOHwKB
	fRjxuUMnNuuD1OcxqgWHJKH/tVu0NcIDh7T106MV70uqW5EAvxwMK31JawekL9KRKE3seKlcv7F
	uWXDuIHAdycjQniElcKKv/GLIvioJ4c2FK0JdGn35g01rrocvUcd74sqdHxqzCfHHGc7rgzDvZY
	uFvm8ER263jt7lQe6H9flfHCeqwhaZ15711iyaIjDqOO2nscgEU8FDFM8K9F6jDgLl7nZIJCN+s
	7KrFZKi/Ios5JxBRVuOdgwA1xBd2JAHSiSLoUQyYe5zE2tzcp1Y1Ow+PqBBXPwM5uJvXckWkYaC
	CuAS8Tg2f+URPXeHehwOiWNho8a06qEZ13C4RMVhlw60YJJ9cXOQBaX2Soc6WpE2ni0tcuv1jco
	gZcroH07mcl4iDM3P1MyZfYD1+T/JUNk67a2bfJ5C4OKaN1m9DB17OGZGW
X-Received: by 2002:a05:600c:6995:b0:490:b473:8f78 with SMTP id 5b1f17b1804b1-490c25dd66emr159444885e9.17.1780784048113;
        Sat, 06 Jun 2026 15:14:08 -0700 (PDT)
Received: from localhost (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm269237185e9.6.2026.06.06.15.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 15:14:07 -0700 (PDT)
Date: Sun, 7 Jun 2026 01:14:06 +0300
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Luke Howard <lukeh@padl.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Cedric Jehasse <cedric.jehasse@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bridge@lists.linux.dev,
	linux-kselftest@vger.kernel.org, Max Hunter <max@huntershome.org>,
	Kieran Tyrrell <kieran@sienda.com>
Subject: Re: [PATCH net-next v2 3/6] net: bridge: add 802.1Qat stream
 reservation admission control
Message-ID: <aiSbrmlOunfxwvGu@penguin>
References: <20260602-mv88e6xxx-8021qat-mqprio-v2-0-72be14522e7c@padl.com>
 <20260602-mv88e6xxx-8021qat-mqprio-v2-3-72be14522e7c@padl.com>
 <537410c3-ff4e-43fd-834e-775cd1bbe89e@blackwall.org>
 <E1253C6D-F6F0-407A-AABF-FCAB57100A1C@padl.com>
 <n2pi7h5nvxg3xvshtcxqeizpukp6hphqa7kodbe7b3ioc3kcq5@n34fgocvaicm>
 <d0e650fb-4011-4d64-9780-a0ddd0ca1cf3@lunn.ch>
 <CCF20D32-6C9F-49DC-9838-592EFB5E88D2@padl.com>
 <a63eed7d-b674-4830-a690-1b55dfdc9a72@blackwall.org>
 <77CCA8EB-145D-4B76-B6F4-9B775C361995@padl.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77CCA8EB-145D-4B76-B6F4-9B775C361995@padl.com>

On Sun, Jun 07, 2026 at 07:49:26AM +1000, Luke Howard wrote:
> 
> 
> > On 6 Jun 2026, at 6:21 pm, Nikolay Aleksandrov <razor@blackwall.org> wrote:
> > 
> > On 06/06/2026 11:02, Luke Howard wrote:
> >> The definition of Dynamic Reservation Entries in 802.1Q (clause 8.8.7) might support the addition of a new MDB (or even FDB) entry state to the kernel:
> >> - add MDB_DYNAMIC_RESERVATION (a state, not a flag);
> >> - the software bridge only _classifies_ packets against  MDB_DYNAMIC_RESERVATION entries, and only when MDB is authoritative. Classification sets dynamic_reservation_hit on tc_skb_ext;
> >> - dynamic_reservation_hit is visible to the flow dissector so can be used for policy enforcement.
> > 
> > See, saying the bridge has to classify doesn't sound right. Why not do the
> > classification where such operations are usually done, e.g. tc?
> > You have to manually designate these entries anyway.
> 
> s/classify/mark, i.e. marking a forwarding bit for tc to match, a la l2_miss.
> 
> tc can’t see into the MDB to tell if a DA has a dynamic reservation entry so, without an explicit DRE bit, the SRP daemon would need to maintain a flower permit filter per DRE. Not needing this allows the user to set a single policy filter prior to starting SRP, e.g.:
> 
> tc filter add dev lan0 egress protocol 802.1Q pref 1 handle 1 flower vlan_prio 3 dynamic_reservation_hit 0 action drop
> 
> It also maps cleanly to chips that support 802.1Qav with priority regeneration or filtering, but which can’t support tc-flower.

Yeah, that was an expected answer and I've seen such claims multiple times.
Just because it is convenient to add it in the bridge, does not make it the
right software model. There are layers that do filtering, marking and manipulation
this must be done at such layer. If you have to create a new table with the entries
filled there then that is what your user-space software must do, or come up with a
better alternative. There're also bridge netfilter chains that can do packet
filtering and manipulation, that might be an option.

For the MDB to have a dynamic reservation entry means someone must've added it,
these are not dynamically learned, so you can just as well build the table
in a more appropriate place which can tag or filter the packet.
