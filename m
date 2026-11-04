Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831727;
	b=2h0jleMrR3+ToSPrdn9VHc5RYNNvcAPULPAziFI+WZ9YXae6kgWrvk4/Ycdb47Z/LX2T
	 qmUA+B5HUC23Yg4IfNQ87u4m5DtCIP787a9+xTSucz5zUPiTOBoPoYsim5bl8d7BHNrhB
	 GUTdSxweld4V7wSmwxMgw6y/CTQPSWH4BJypug52LtaLrxqFhsRbGdD3yI9HMQOrqyU9j
	 FUGKbTLqIe+JNnjh48IIHxZke8/YPFels9PveqpF8g8ce2x+MzgVz2Nx6+8/0hbvQBtj5
	 ME+9umi3odF0hzFghViQGqwOi5eplR6Oqrd7KlNwy5ce/GZCwR4yPb74r+k5QrDKpOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
	b=aZ7AyvTBhleYeMPk+E3AwoWnwZKIr8ZBW/5CPuiLDhQjFS2iysBdZSI92zO8mjnJbZof
	 xRBcTtPnCTptACxZ3WVd/fKieXhjdqau+Ldta9Y8kAPANMeDMrk9jUWRiQ6AmuG+3NNtE
	 lYMPqq9T1hFvzJcF538lQR/S3jABPYsfzvwaGxrzFjN60+cbtYfpm1x5WD55A2DY+OS+X
	 Gclb3+NcvzQX5FnOpPI1oqq9sdIRY9aeSCZqbApKN80zckzl/0CccvPf+SpMyKKXPnLrJ
	 cqoDYlP5522a3Cn7zbdTtz7xhat71lfDqoi6/t59oBgj2Z/MBrdShSKZ2r3/D0HUGQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bkv6DNeA;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6AC606AB11
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 22:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6AC606AB11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bkv6DNeA
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so948067b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 14:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831726; x=1794436526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
        b=bkv6DNeAcOgKuFWjKi3KzwgdFOsKa9d64GSG02M3Ag6tvdIenCkXOWzxg6ofMEnede
         Z38zuEIQfaSRP+2xT1ils/BDnvMCsitxF6Rz48MQFC45RrOzSTGu5gvsA+MDhfwzvPKT
         ql3vClM4ioWl/gjSOhpRa1Vmx1b56MjuY9qCfUzAsX2dCyIDrTrxD55ZHgF55xwkM3sO
         WSRxUy7osOc5G6Pwmyu+dnP1ZkRJZ7gZ+Slgfa/1UGi2rwkEfmpq3d2jAGTu+xIJnc8u
         OvndJzC51+kpYGsRgwWM+ujTTaNtsa0FYpRVfqHHzeXB27xAFq5FMJxoXz7EOOCNhn93
         PEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831726; x=1794436526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
        b=BHbiiuOpa/uSy1lnzCnaM3rOe8yrQ/1y7ucUltzJnf7aGHyxyCDpnLgK4Kb4GRAn1E
         maaJh6DjE45Cm1qFi+co3dtOLVrUTkll9jmK5A33zVFqY2cQqexTfph76SbnMLq6x5ph
         69Vwgp+P6MYQa6ZY1QtnoO7iW6w0S9rjUqNbYu368ox0cqQhBYK6ArSBbtoE/0WH75FR
         H9L2RkFBWeIX4Gct0Ew+tHlj+0VBFjSSfTnuvHMFb5VStbN3hKIhvZCmMK+7u/1XdKHE
         e8Nj1AHgld2jml98oKxJ8z0d1/WZEoLPtWP1cvlZqmAPzC5wU7aFIkNP8un4WpaseCG0
         hayQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPq+hWJJelpUufZGcSEFZp8mnp2BB89vzVcpG7fMbH6IWUYmarFlbvm+bRTsdDOkjT/H2k1jIbi8kd6jvCui4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LcQsh5r+izJ0sX8quzuEV7kd6leKsx+LbqDR3q4OmcQlaxq11
	8wXubSnelJPPGsSxu0UV4hmH/sHhE9gjdDSfqT9lutmguwEKrzR3NDMFuAAzkML95w==
X-Gm-Gg: AYBFou22oeOhMa23OOi8Md47DXAHKJ0Ad8nBuYKdcP1irWhIvsOJ+uDEw6ZcW7I5ZZi
	IKDLpRdWnmLvGsxc6OWnEjQjSjCSHfz8gYFhxrvnBRNKDngiM4CtJSbPhxdWwmq7D8HobaxWCxJ
	4t/KKWNSmeWnBma0dn77UZVT/od9yt4aXXvTb4/j42um6YXmICdn5bNEc0cFO6V6eWQJlA40A+L
	5a311AjnbjWsnTfzmsv67skMYVSoVeJXTMcvRf7l4GxZus0XNIj05HcRsIJ7CCN8Euik/rRPEgO
	QULktyK+XiMDefBRyVbBS+eWkGc0T5sBFI7Y9C/rsV00KDZoru/DAnbFE5hKoFDbUWwfGzEgYaL
	/aDLDNlOTCWQi+t4Qtg5x2akf2mUAkvPHdWpLugXSsofXQrVDpSjM/qjQY5c6X8QBABdu/Cwakp
	3su1RPJ4W1CGKDmKIkmeDKGQcEXRKGzecdrSGrNS7l6jLKJuXMFGDZKqM+RkNTlCDlcYzdnvOBB
	BuBcph7FPHNNxUTN7DqXn05+88Vrgr+ZKSg+otT0qAp1DkirFATbvHy2fo9Nce4CC7Ih/lfI6aO
	B3nPxFrE/Dlm+QgmLl8T7IAN8VECytUAXnC6jkqVeG/6NTDrpNViYrUb9gYb9R4Xz4+nU9Wavz0
	6t1y6VJyRMg==
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr15308534b3a.15.1793831725909;
        Wed, 04 Nov 2026 14:35:25 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569495sm1376244b3a.37.2026.11.04.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:35:25 -0800 (PST)
Date: Wed, 4 Nov 2026 22:35:20 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files with
 O_RDONLY
Message-ID: <auuzKNZsPD10XM4q@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-10-dmatlack@google.com>
 <2vxz5wyck08d.fsf@kernel.org>
 <auuJ4msatqzoOrjN@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auuJ4msatqzoOrjN@google.com>

On 2026-11-04 02:45 PM, Pasha Tatashin wrote:
> On 11-04 17:52, Pratyush Yadav wrote:
> > On Tue, Nov 03 2026, David Matlack wrote:
> > [...]
> > 
> > Can't you put all your binaries in a separate session, retrieve it as
> > the very first thing, and then finish the session? Then you can execute
> > those and retrieve all the other sessions.
> 
> This is a good workaround. I am not opposed to this patch for 
> completeness of functionality, but if we decide to keep it, perhaps it 
> should simply be squashed into an earlier patch. The current diffstat
> looks bad, as it mostly deletes code that was introduced earlier in this 
> series.
> 
> In any case, given Pratyush's suggestion, we could also drop it.
> 
> > 
> > Why do we need to support this in the kernel?

That would work for binaries, and I agree that use case alone doesn't
justify this. But I see O_RDONLY as part of the retrieve interface, not
a feature for one use case. The retrieve argument is modeled on
openat(), and openat() lets you open an existing file read-only.

open(O_TMPFILE) only requires write access because it creates an empty
file, and an empty read-only file is useless. A retrieved file isn't
empty, it has the preserved contents, so O_RDONLY makes as much sense as
it does for any other existing file. Without it, every retrieved file is
writable, even when userspace only needs to read it.

Preserve already works the same way: a file can be preserved through a
read-only fd, as long as the caller has permission to write to it.

If we keep it, I'll squash it into patch 7 in v4, so retrieve supports
O_RDONLY from the start. The commit message will lead with the openat()
reasoning and keep binaries as just an example.
