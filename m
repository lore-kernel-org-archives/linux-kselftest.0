Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A735B283FE6
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 00:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772153584; cv=none; b=tt/p+KoESdQrniEe0Rb4yyeu04FW2uurLS9xZ2Q3o4itswbsnWIJF5Y9RSGv0KFoMz2RFwonio1F7SH/MOVEACbnzxlc/dhSA8S6vTY0DhZgXPqW0ztdxvabH6/lWiMD16Zrm/u67wDxtTD56lfwstQNLkndGNn5TCWgSndOLFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772153584; c=relaxed/simple;
	bh=V58AsEXtDlXDbNdeDBd1zzEWI/NozXCvECRYKv0veUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjnS6HplfLA5wLexbODW3LeyUEz0tw83d/q9XxBlL24wPOW6x/bVUxmHKn3ueJTU+JJ/YM0QLtYzDkGPspzUtNyRrVX2vpGgJ5D6TwmHuNlGsFQSiF1Jh9Afm+uUnLBMcUD+BjlMVGGXZPamQzjHwDgxXkx+EAvFHow+ruwn9dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMBJobID; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMBJobID"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2add623cb27so9647175ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 16:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772153583; x=1772758383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9gbpHB3N8fWBNDFn5ovPsYhngGHkPr0G2QGOAHfoIKs=;
        b=YMBJobIDBmh570RCF1WW+1QFR6izNsYPEATR801y2qMr0DFqBi8cu1OZQOqa+ViNnM
         J28EloQ+m8/8Tx93S3qPD3b0fdFfuSDAXdtPyLLYA354KRtoTMeWewnyE61lZYoFOg/y
         iX+COvhxI9VG0+AbSk40LQZXQDazOO+Eq+tpBuQrOlB2pn4VG2jExZF9iOj+tx32ldfg
         QfwK7yxxpkaAtEWzszcluFrM7eL+RTotwo6Jt7vAABxVwAsraLrwBdetHzWNWbWLFzAJ
         989HNfjN5I1nuOw8WspmHdMiWHr1dfz5B0JLseLeSUssJfs4zgHtl0KVjRW7be/CInvR
         lmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772153583; x=1772758383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gbpHB3N8fWBNDFn5ovPsYhngGHkPr0G2QGOAHfoIKs=;
        b=Nm50n+CALZi+LRoyQYO2bJC4NxhqudLUdaqPKjUhfmdJh0KQDagBKaq2dA0MjOyORU
         7uED5bp/u2gDcb0IaYg5uNZOoA/byS5ds4aqCHxx2E7LeajAWIbMVHa8eGqJUMoTM4AO
         gSKoOVaO3cb/u+lm+K/4tV/du73NoOd5S5jsc8dU90gwERsSMlEILPLu8v3nFiRKgmhq
         W7mjc4B+RINu8lcgKzc8V1JwMY+5etp8CADlgRszjcP5/sr9OqY77n2WXHyyRVQ1MBgD
         4CuqCj1TFujM7Q7InxruBPKyYjdfAsGXhhgC7zjZba+guJGsNNngQOou5W0Zsninfpcw
         sS3w==
X-Forwarded-Encrypted: i=1; AJvYcCU43dyXqx36VBlDWbISe1Y+2cu8TfNCxAlbuCQuYrgXKViTeEhcU4KMuvnXBCOmKLZYICSJRVi5NEgq58pKlGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJJR17uu+4Q67OvyqBLUK3xrY+wn7K5aar1miufv3LGAw69JI7
	sxxOpgtq7kTFtdBEmMMcIJmgtXwHBKJS3nBomHZOo+gQsZOcRzJ2B8bj
X-Gm-Gg: ATEYQzxGq3JIO2GpQq+4z/3A/OwgfdZSB8zgHG+rdzOsXfgrqFn3oMgRZUr7ehMr60T
	SBs9Ma/D9o/4F3qAz3rUSyL6Dy7bfLG1un/HaVXpSG8q78Cx6kxhBKTHMLl8niHgiI8RiEc5D4X
	meZ42xtmFhChTgOZkzwJxF37lb5SSjIvl4GxHRf6vt9DaM6xyaBLvCSOhQgvttm/ofqClzm4oXK
	KpmOIRaw2O/Nv/V+rHq2EH09SHiWUxFDFLK0+rrHRuGXHqBNyMKw0mluWyr5Wa0W3EnWyOV2ju8
	nj0GTVwdXFExaEvT+CUSIEY9YIAl1yQFTP/bjriUrLyIDkSKATTpZId7oy0bN6EPYAMIB7lIXed
	wS7aZ9DwAK/Ro304q9bc0rmV8tQ7B8QKNUAhm1GB7fjEj+eqaeGxrnh/nODpczJAnoZYS1IkrmQ
	ER1WJ37bSlcogVuyCccF7J7w2uk4g=
X-Received: by 2002:a17:903:2312:b0:2a9:cb10:42b with SMTP id d9443c01a7336-2ae2e3f7cc2mr8443145ad.44.1772153582912;
        Thu, 26 Feb 2026 16:53:02 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22fesm51253065ad.2.2026.02.26.16.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:53:02 -0800 (PST)
Date: Fri, 27 Feb 2026 00:52:54 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jay Vosburgh <jv@jvosburgh.net>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Mahesh Bandewar <maheshb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Liang Li <liali@redhat.com>
Subject: Re: [PATCHv3 net 2/3] bonding: restructure ad_churn_machine
Message-ID: <aaDq5vTsk8SW4bIA@fedora>
References: <20260226125331.28147-1-liuhangbin@gmail.com>
 <20260226125331.28147-3-liuhangbin@gmail.com>
 <941081.1772152606@famine>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <941081.1772152606@famine>

On Thu, Feb 26, 2026 at 04:36:46PM -0800, Jay Vosburgh wrote:
> Hangbin Liu <liuhangbin@gmail.com> wrote:
> 
> >The current ad_churn_machine implementation only transitions the
> >actor/partner churn state to churned or none after the churn timer expires.
> >However, IEEE 802.1AX-2014 specifies that a port should enter the none
> >state immediately once the actor’s port state enters synchronization.
> >
> >Another issue is that if the churn timer expires while the churn machine is
> >not in the monitor state (e.g. already in churn), the state may remain
> >stuck indefinitely with no further transitions. This becomes visible in
> >multi-aggregator scenarios. For example:
> >
> >Ports 1 and 2 are in aggregator 1 (active)
> >Ports 3 and 4 are in aggregator 2 (backup)
> >
> >Ports 1 and 2 should be in none
> >Ports 3 and 4 should be in churned
> >
> >If a failover occurs due to port 2 link down/up, aggregator 2 becomes active.
> >Under the current implementation, the resulting states may look like:
> >
> >agg 1 (backup): port 1 -> none, port 2 -> churned
> >agg 2 (active): ports 3,4 keep in churned.
> >
> >The root cause is that ad_churn_machine() only clears the
> >AD_PORT_CHURNED flag and starts a timer. When a churned port becomes active,
> >its RX state becomes AD_RX_CURRENT, preventing the churn flag from being set
> >again, leaving no way to retrigger the timer. Fixing this solely in
> >ad_rx_machine() is insufficient.
> >
> >This patch rewrites ad_churn_machine according to IEEE 802.1AX-2014
> >(Figures 6-23 and 6-24), ensuring correct churn detection, state transitions,
> >and timer behavior. With new implementation, there is no need to set
> >AD_PORT_CHURNED in ad_rx_machine().
> >
> >Fixes: 14c9551a32eb ("bonding: Implement port churn-machine (AD standard 43.4.17).")
> >Reported-by: Liang Li <liali@redhat.com>
> >Tested-by: Liang Li <liali@redhat.com>
> >Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> 
> 	I missed this last time it was posted, but reading it now I
> think the functional change looks good, but I question the usefulness of
> including the 25 line ASCII art version of the state diagram.
> 
> 	The standard is publicly available, so a comment saying that the
> state machine logic conforms to IEEE 802.1AX-2014 figures 6-23 and 6-24
> should be sufficient.  Anyone seriously checking the code against the
> standard will need to read the relevant text, so they'll be looking it
> up anyway.

I added it here to help new readers and reviewers understand the logic
quickly. If you think there’s no need to include it in the code, maybe
we can move it to the commit description?

Thanks
Hangbin
