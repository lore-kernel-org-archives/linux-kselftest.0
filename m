Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433936;
	b=rmmdONI9TPOcrqdbldF9NFfPBwxwH62iVuLh1cTe3egiJwljM+S0v8d/ZxhlNJrnmp+M
	 NMIBflrIbBUr7J4Ejt0awq3za+2udiLuZChdkXpus9pw750TTZBKM/pjA2gEcRh+iYAQw
	 oo1sOV9VaiW/rZgvo96EcvTt0w5oeU6k2ivNQC20PFg7EhTD8y3H1qrwwa+tICts/90wx
	 jbaA+EDNlXdqWZ35L8LXJsmA9kg0CtcpZFp+KiGxzZny3nQwodQqIexpYTeUOp52fB3lz
	 TAIqgJDfxjzkRDwotpiPFxHwbIcmXSJzb3K5ln5h2txE2oPfEnZsmpivNYtZcdfLrnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
	b=JvOMU+bf9Q0pGKuk9+q57Q48W7pPvGD9RUgLeXZ8KW/IEHJ/NiVH7YmtrKSXwyWg4An6
	 CrDfgoG8MYg5lMJ8Plb7oY9mFw63q68qAqqNY59kd/MCWRWrLN28YWRucA2D0JuExHHqZ
	 R58lip+LUusRVuDgzvhonWfy6rKHsq7Go+D2anXOfR5i4Su8S1HlfUAV3Yd6JVPdVcnI+
	 e5ZZtaoap7oTT3w+WhvotVLZtyW19AkLrB2x7ffnv313KwQ/AyMDLE7nbNY6d8Zy9ehNE
	 conpdFM/oMuAfdxwI4D6xCtvdi/yKkP5CSP3JzjxMyO5NjPTGUKQpPhdJ2KVcdBR46Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVadYj45;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FDC606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 21:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18FDC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVadYj45
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so1362009eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 13:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433935; x=1795038735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
        b=LVadYj452qYWKXqudUfJYP4vTIXJJ1dd3U7RzKuzs6NI9h1XPCVOlLH2NMyOw/fSpE
         a88EhfciP9x3tgYLLbGHfZo127HjqFmkiin6KdIsTfgtrTwkMzRTwMGranMmPEkRP4af
         1fgYgf7SIEfRGRKqH/+rnq1nmaqMdDGChDU/8bSAhmdWZvQmWYxe9hk/nKnyh+hUXQpS
         RuZz/rfJupbQipvOUhYUOt4z/uqT3MMyj4Fxlml3BRqUtntjB8kfTsiEqHI2gsRKou6J
         mzatv8neNrpup03S/lOw+mLiQnIi5+xiU0V2Sh/BMvr0RUOSPeWmUcV0x7Pv860pKpje
         f9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433935; x=1795038735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
        b=dPYfQ+lfzRrEEMCnP6LfMDn8Xq1aiY3Vn0fOM5G/7VCPxl3rvdTGoMXltxH0tLDm8f
         2HEt6iWm/jlOwFkzkvzNVo1eA4RbI68OlnwawWFRCpGEncjk/7/ni27Iy8IJqJHlAI9v
         Tupum+RSZZz4NTa0JBGB9CAWhpr9M+MWkQD9J7sApexUvYIgCyyjX846Vf8KDwEvucGG
         IXfgmhzW/1brR7NQoztP+smxEtYISwl/Dj7LsQ19s0ZBLHlr/ZH+YFuD6BigzS/KZXRZ
         hAqtNsOFscl0oPqCPnqw/ejPy+EOQsB7ib0LKcdiGmxfbAo3RbyYmKGW5JeXZLYXtU8g
         moOw==
X-Forwarded-Encrypted: i=1; AL+hErEg2t3FXKUCgLDInr2YhSefgiJzZ52jQO3do5CIJqivMY25aLaVM2o9k6rB/N0S2a+4M54X0qXFdyOXrCd/bPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r29PqEimkFq41JgWWVfblE2vdssHD9vw7mAJdk7OoXSc2GSuW
	4ZocT10D+v0OG9Y3ahQx+n+NLIZVpNRtgg1UvHpZSgVQMGIYsHTNCTYG
X-Gm-Gg: AYBFou09nHBkw9q7CLFN8oTp7Pg2AKpctl+WOB//02Z4N0WySl+xY0ftQVlNydaxrT6
	w1fXe6aNPcDiI+Fwi73mSWmj/KNwz5VLLWV+daIJJHHaA1IwaxgZNB8cr8ZnJ646/mddFvirqQr
	7Ylvu8+mZvon6goHG1j/fgv2fcLFHk6ZbT8eDk/08Tmb8E9wIy5DaabJgIfN8VFWFy/EQ8sS1aN
	HfCFZLx7S4jvs8PUgopkxfuitAZlOYiuUlQTxbFDnOQ9rpLRF8fVH0UE4MDsOlJAjuFLpI7upKG
	pwU5pcXISaRTrgCvMZxWyF57LwGU6eRhPKPv8qRnlkjrjIwgBAxRyEwBvJWl43lT9aU6xFV7TjN
	qMpsrCThV5UQU3mEvUN/gDHyorkEruszqDt/DVY3l0MXSu63Bsgd64ZHle85BvUNEuhgJ/Q3v0i
	sD22SuxW+ABDr4KG8viIl+YiACMMIGPu2tOEr4fbtnSIRMXrlMKIydwK0hgtaCk5/NT6iBVO6sB
	Qd3t+k3Wn30Vdz8UeprvcLfLfNukmmwkdpkCruq+4KI82hK8b3h4wg1AkbtDOrk7kt20eEHfiAv
	82BCjrIwVqvrY3FRicYXIac=
X-Received: by 2002:a05:693c:894c:20b0:36d:5102:9974 with SMTP id 5a478bee46e88-3768327e7ccmr4031936eec.2.1794433934007;
        Wed, 11 Nov 2026 13:52:14 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:44::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm38761082eec.16.2026.11.11.13.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:52:13 -0800 (PST)
Date: Wed, 11 Nov 2026 13:50:20 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com, 
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com, sdf@fomichev.me, 
	dimitri.daskalakis1@gmail.com, almasrymina@google.com, dtatulea@nvidia.com, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	leon@kernel.org, narcisav.kernel@gmail.com
Subject: Re: [PATCH net-next v3 4/9] net: devmem: add a per-device netmem TX
 frag size limit
Message-ID: <avTiZVzjvMLQjnJ1@devvm16445.scu0.facebook.com>
References: <20261105222058.944293-1-sdf@fomichev.me>
 <20261105222058.944293-5-sdf@fomichev.me>
 <20261110143615.05f9adbd@kernel.org>
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
In-Reply-To: <20261110143615.05f9adbd@kernel.org>

On 11/10, Jakub Kicinski wrote:
> On Thu,  5 Nov 2026 14:20:53 -0800 Stanislav Fomichev wrote:
> > Devmem TX frags are bounded only by the net_iov size, which is about
> > to grow up to 2MB, more than some devices can describe in a single TX
> > descriptor.
> 
> How is this different than normal zerocopy Tx?
> Drivers already have to deal with long frags.
> Having partially applicable limit seems like a bad idea.

Thanks for the pointers. Yes, looks like I can drop all this per-frag
enforcement. But bnxt is still broken with bigtcp, will try to hack
on something separately (queue stats/etc to make it actually run tso.py)..

CC'd Narcisa (synced offline), unless your priorities change and you get
there first (or I get carried away by something else)..
