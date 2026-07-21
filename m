Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEBC44CADF
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 22:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672372; cv=none; b=QnsqKUgpYKeOOUFuiSDHpg9ErRNQzhAL+6gzTw/1Ew93uwAln7GQkuw4LrWc/i26EKauQLpz803ENxWHr18TiQ4p904XEJryxdMQYtijYmwnqafe1k3FHG/XQbxvDEYiFcP3LALyF8WKPp9Ibs2O5uvzspFl/dAYnJFfPF11UUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672372; c=relaxed/simple;
	bh=rjlTEXfdGtvamgGrl7WmwFapvU6eayCx3eM576nYxlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VB3PUJDALb00jyFtdQa9aZTQPcMJBbdOCpb2lUIxYMuQcbQXYo2fdS/jj8OGRAxV18+Kkv97+hTDwfJVe2UGGkvrzEZRI51Uf5kYMyRDQ7GjvK7Xp09Qi8Q92O97LJ5+Hh7N7xz9W1j0RXDYh1rAdrQLDSDjiLh4QI5lp9XfIVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwcfOAv4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwcfOAv4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacf197759so138645915ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 15:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672371; x=1785277171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lbofz4e3dpgzQEO5qCd561u75f1n6ZeFDPzk/MT4UfI=;
        b=gwcfOAv4wAmBnW8AZJCQKTRGKBD0BFgsdzA/ouH5vnv2xcIiWUUs4k+lIwDHJpZRGD
         W1zRI7FCIMiVYd0ht9K+jF87Y1Nn9cXswhsEu09A/6kEdVw9WcZtnQi2pZeS3BX7eo+Z
         P/KX1y26ZNgNzKxMJeH3kEnYDj3LAFbxCYGwu8mIDJXb0mSGVWTL2zXikSh4Qx6HlPaj
         CJs+g2wSAF9Pi/789+3biE9GLnVqDIqUufnORrktKFgt7YkhUkKiR7OVxzdPPQVnbzzT
         eAAWlT9Dk4LYz6hm5oaSYyIlwRJU6/fcl2lzeCYxWTNqvm89B/5ItqJRROkGqfo5Xc3N
         wGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672371; x=1785277171;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbofz4e3dpgzQEO5qCd561u75f1n6ZeFDPzk/MT4UfI=;
        b=nVIKhrIe6cicmyA9H7/s1cydR8MLX+EYvueP8cPC8noZKfv1nETgpeavYX6wDN2FYk
         DkItF1Z8TOV16p08YNkosNI/7hv8vrD79KVHavF+IZ6wY4mn6ofEfgmF/wkY0RiWEBGg
         QYlCTSHYAW3TFY7RhtpV0s9eiVefEaodcxPfsHchh8Mi/joupNf41dNg3e2jTAwMj60F
         yEHcSicw++MgzbTicz00esfS91qHC73bLr5sRYO0oYBhrHXGgO/kak6AtYvX9dvd1J1l
         Al37kPLn9u6uCjegKoSPX+RVu1w5ad9qw8xSlJMg1Fir6e3sZ/U4QdVFM8GPaTWn7GLo
         zm5w==
X-Forwarded-Encrypted: i=1; AHgh+RolprAYDIMj/xsIrI3bN/hsBpTaY8BagoBzD9PPrQ46LCOy3jAG4iOZ1Xt0SGFkwARyouMXn5ytHMKlS6wC46Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNIeZr9FDNdrpBJIjo/LVsjNUrWpnQUJAdE+CTY83HA9vMUR80
	Wu07ZdGkfID8we+Wypk8C7E2v3os/I+VjJO2IxsAar2AYghEJokzUmmj
X-Gm-Gg: AR+sD11cwdv8o/ubFhppHe9broe5g/PDCwf4D+eF8yc9PIS9D8OtGGAGZThxdUTXgPE
	O7tsgYMbcdpB22vSNw5a3CDJ/6bASXuq469zHbKaFYOWIg5D8d/XLBN7WEOiofNoSEXqAliUzij
	j7E/ea9xGxMPi22EVIVUWj39SOumWQPqL4t5LWLkCNmtG/43PM9gp+AiKH4fs2DAUyBBQ4z7Rvy
	YcNOrZ78qAZ6FX+hQkDGrwh3ReOZ/9zE4EssclJGCCVcmgIZDqVI35q4wU3MWx4PbucrrKIf1MU
	M+T/KBcN1Brt3cTuLhe8C6BZ+vlArWQiRIXTUK0w9JaPm2Sjws6yQ5Z7BLIOKnUUPjZkFezhzgL
	uoMpPSGXTnwkqh8TcYyoqAbmyG/wdfHT1w/v+6EReqS4FgpOgquxeK/kFWAI75J7USfOwUS+pgb
	FkK1sBVy9pYViZd3Hb64IH1p0fn7U3UFiDT5c=
X-Received: by 2002:a17:903:1b2e:b0:2cb:3f63:7c3e with SMTP id d9443c01a7336-2cf34997d46mr219668105ad.35.1784672371023;
        Tue, 21 Jul 2026 15:19:31 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efae5aesm3657535ad.15.2026.07.21.15.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:19:30 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
	netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: Re: [PATCH net-next v2 2/3] vxlan: honor per-nexthop fdb destination port
Date: Tue, 21 Jul 2026 22:19:06 +0000
Message-ID: <20260721221907.2702-2-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721151805.GB2667735@shredder>
References: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com> <20260717-b4-vxlan-fdb-port-v2-2-f4862e8fe867@gmail.com> <20260721151805.GB2667735@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Jul 21, 2026 at 06:18:05PM +0300, Ido Schimmel wrote:
> Alignment is off

Fixed for v3.  The "int hash" and "__be16 *fdb_port" continuation
lines now align under the first argument (the column just after the
opening paren) in nexthop_path_fdb_result().

> Remove the check given 'fdb_port' is never NULL?

Done for v3.  Dropped the "if (fdb_port)" guard; the only caller,
vxlan_fdb_nh_path_select(), always passes the address of an on-stack
__be16, so the store is unconditional now:

	nhi = rcu_dereference(nhp->nh_info);
	*fdb_port = nhi->fdb_port;
	return &nhi->fib_nhc;

Thanks,
Jack
