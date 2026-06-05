Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4BE352C5C
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664047; cv=none; b=sEos1jLnyMF7+D/K2KYdbZfINkfn54ohvgIR33CsFUp9pAUitl+QGX+/UFEE/zzkGsZ1oyAIvgL49iNQ3tk6bcVsS4XKp+3vQK6EkwHvXWDEA428nJsqUe177n+eDjAjcdTLx86WabcA46C6tK+CiZeba6dkQV1RE9IMmECpVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664047; c=relaxed/simple;
	bh=4BdkasZGBWmvzkcQMzObxj+iFSYJKYsxLTlK/a/FMVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L13oRt6oyUiZAMUJ9rA7mP7VUWAdXqFs93yudtrzUxkNAgBVQYUTConhGkt2gZ+XzjS9qMvduXCJa9In9zF0AjiCINCMhZebdqSi0udAUrXN8Sb50q6zcCMjfZJFTH0lc9Q/3E4vIcJ5I9HYqf6czLuzlqzEdMcb8HEYs5Ntkzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krC6lIYC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krC6lIYC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490be03d47bso15619945e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 05:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780664044; x=1781268844; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ESsFWXNVrBZDPrJPvZQn7pIbZnaDRK4mOzY9lR1X5Y4=;
        b=krC6lIYCDmBYbqlBAiOXoHC70WWFbukC4Dkm+eYlhfALb7U7lFBHESdZBOaHOcLs8d
         zlA6g/NZkv18O4Ze/lPHM91YEX8Rs79PA4Lqt0/wEaqx4KxVUVm24IOFADneyjpU28/N
         ybMVqsqxq1Ecm8Nt8eZWKCpP2temVh9DUj0kT9Fp4/dw2m2lHI/Oin/dYGnLtKnYSFHb
         baNdZkyITSWhYjdZz3yc5L/Yd/aDhGA1qmFqe3AbR0YaXlEbSPa3iWdVWp6Zdw4SLVaf
         Z67JMu38pj/Fe6iqxQ5OEc2a5/ygtOzwbNaiFKHlCHFq/ZlPA3p5BgtskY7mF+Nr75x7
         rMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780664044; x=1781268844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESsFWXNVrBZDPrJPvZQn7pIbZnaDRK4mOzY9lR1X5Y4=;
        b=LBU+NZxf0BVSdLbe4PNMoDCXPpeFZ5BCfzyYvbC+uS/o2W2TNW1CdtZWIzTrWEXL33
         0zG8yrSvwfxr+iwv+jh5BMYbKtSnxWfVtpBn6/pwwzRM2SrWNrPmMWRRyjtregtLzQY8
         7jyfPmGHMWyLVxERSHtMrgjO4CS0RGZ68szXf+JxH8MdEU2ggJ0IT978dztGPiLVr0AN
         w7Js9r6q/A9Xg3XguSZ3jPoD6lN1z5Pr9UdRwa/VZF6zb2TlhIVlW8lpqmsLE5djtLrV
         3tWtDn/sywiBs42JKlz6m7fuDGGtGkHXN8UZEAQ00w0vgjckgtAGumP23Q44MQBSMNXN
         XY7g==
X-Forwarded-Encrypted: i=1; AFNElJ8EfF6SZyorK0o5kzD7RHKbvbPKHediJmb5RGXcvrO3j+2Y18veAXKB4v3SxD80Ss/vAoS8NMR1VP3meV68WxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wK10Q7Qibbjm/3SPHGnt+6PvebL0ydHysGC3JDu84uFzZ+MM
	YHmlGw2xOWYEB16nnBnKCrxvpXAQymyqc9u6WrsVAbP5IBmINjtvp2LG
X-Gm-Gg: Acq92OHwedn+NMxXGp0KoPlQoAWgsbqEsTZGGWoH2XUr/dqEHVXWt4vGRZEZT+Avk0f
	BxHTjeaxfLW6GBfD34f4qq1OGiwVIGOK8zTVf0NhNAIt5FJFDaSXswiRsqE5JX/HuJGs5sJXpCB
	ZDtUMydtHONL8UzTIBZiMFvwUJ4r0dKqOTbd3l6Ah52sknXPC2H9ip1Yi6oxmLq2w1rfbPY3S3U
	YH2ssJaluMtVMKODdKA7X/c758rQUnIBRl9GGKueL6Bv/DVZLvVT5ww3VdH5sncyWdZ/V/4NShR
	Ypet3WRZGFxVJ6+ds8SFNZfExShSIixvM5qZU8522j2dUEGeokoIImq5Eac715SA1x89ahWpIro
	WYNK95VtBaJJMjBXYHrcMwLiYy0Exp67fHapS2L+SZ1lNIDPePFRumi3HSG7vE6x+ansUxUd/ac
	ShN8RzBpGue05rIYQnHOplwC56a1cxRoQ/PFGvfbhctPQ=
X-Received: by 2002:a05:600c:190b:b0:490:be9e:fd03 with SMTP id 5b1f17b1804b1-490c2589a02mr52233325e9.7.1780664044371;
        Fri, 05 Jun 2026 05:54:04 -0700 (PDT)
Received: from cedric-laptop ([195.225.166.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d60a79sm27083045e9.2.2026.06.05.05.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:54:03 -0700 (PDT)
Date: Fri, 5 Jun 2026 14:53:57 +0200
From: Cedric Jehasse <cedric.jehasse@gmail.com>
To: Luke Howard <lukeh@padl.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>
Cc: Nikolay Aleksandrov <razor@blackwall.org>, 
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bridge@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Max Hunter <max@huntershome.org>, Kieran Tyrrell <kieran@sienda.com>
Subject: Re: [PATCH net-next v2 3/6] net: bridge: add 802.1Qat stream
 reservation admission control
Message-ID: <n2pi7h5nvxg3xvshtcxqeizpukp6hphqa7kodbe7b3ioc3kcq5@n34fgocvaicm>
References: <20260602-mv88e6xxx-8021qat-mqprio-v2-0-72be14522e7c@padl.com>
 <20260602-mv88e6xxx-8021qat-mqprio-v2-3-72be14522e7c@padl.com>
 <537410c3-ff4e-43fd-834e-775cd1bbe89e@blackwall.org>
 <E1253C6D-F6F0-407A-AABF-FCAB57100A1C@padl.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1253C6D-F6F0-407A-AABF-FCAB57100A1C@padl.com>

On Thu, Jun 04, 2026 at 03:39:25PM +1000, Luke Howard wrote:
> On 3 Jun 2026, at 5:35 pm, Nikolay Aleksandrov <razor@blackwall.org> wrote:
> > So looking at how this is implemented, why not put most of it in TC?
> > It is testing for skb class, for tc qdisc, I don't see a reason for it
> > to be in the bridge at all. You can filter the mcast groups and simulate
> > the "reserved" flag, it has to be set manually anyway. Adding new
> > tests in the bridge software fast-path just for this is a waste.
> 
> This makes sense. Maybe it’s better to use flower+TCAM to implement this, and have our SRP daemon manage flower entries in addition to MDB entries. The mv88e6xxx driver’s TCAM support is recent (hi Cedric!) and does not yet appear to support the 6352 or matching on PCP/DA, but one presumes this is possible to add.
> 
> Alternatively, responding to your comments, the bridge could mark frames with a “stream reserved” DA with a new tc_skb_ext bit, which would be surfaced to flower similarly to l2_miss. The rest of the policy would live in the flower rule. MDB_FLAGS_STREAM_RESERVED would remain but IFLA_BRPORT_FILTER_STREAM_RESERVED could go (we would dynamically enable the equivalent in mv88e6xxx by refcounting MDB_FLAGS_STREAM_RESERVED entries).
> 

I don't know if this can be done in TC.
For the usecase of SRP the Marvell has bits in it's mac entries to specify is
an AVB entry. This looks vendor specific, and other vendors don't have it.
But the concept comes from the 802.1Q spec. The spec describes different types
of FDB entries. One of these is Dynamic Reservation Entries, which are created
from the Stream Reservation Protocol.
The issue here is the Marvell switch has an implementation where we need to
know if an entry is a Dynamic Reservation Entry. But the linux bridge has a
simplified version of the FDB described in 802.1Q.
By adding a way to distinguish between the type of FDB entries, it's possible
to program a Marvell which has this distinction between Dynamic Reservation
Entries (or AVB entries) and other entries.

Cedric

