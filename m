Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A0371053;
	Mon, 28 Sep 2026 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581506; cv=none; b=p0PdQNNw6+YCvi+2CKo9PnOBabjhT9cjfdgSLWYpYcH4cdk5tYAAQnYrt8v4+5aXssX6RDasn2BRUw9sme7gkOULvhTbKyXVHTpWVpYdjYZmKH991PJft+gjULpNnSVigw7nfSprQvTW/MLnZJVJC/w3RXlAYyefPUc7jC+6ynQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581506; c=relaxed/simple;
	bh=f9GuvQ9AZTHwGr6CKXhX5QxhIaXr7oa97M52F15fiUE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lsrETGvG78MT/IkUM2YmF+IMWvlb+nFyyxULG4pCUp8szgEDhBUu0TwUvk7IXNekrMqAVwTq6j0nA6KFYxiwcGrDxJP2/eFLCHerC1f3La31ReqaGNuXLMh+tWyOxUQyEzud/CREe6V6F2gNF6OvleXxhwUQp0xfoN5AbNJXXxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=n8iskLGJ; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="n8iskLGJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=f9GuvQ9AZTHwGr6CKXhX5QxhIaXr7oa97M52F15fiUE=;
	t=1790581504; x=1791791104; b=n8iskLGJDM2gksEDIEFKVzt0kY8+bAVsAUCYbALZ617OghQ
	viV0+C21Gta4t8dJtvqjUbgzrKPt8tIuTBltX9lD4hXtLhYViZU/LpRlTopoNeYmYLFqxpuKrPa6x
	Tsb0642euqCeG4RCgygCabu784t0iNkMk3UbxZOTgFM7kAeAagSxvonmQW3jrWLFlHWl7/8vSFUjC
	9+S9Ucd7GICB9aNaV/Sa9mAiLM23wTEXNPkNXNP3vrb0/4bVwTVXNRvRvWyH6S8Q9rtRnwfzjNLHy
	xbOPIPtJXY+9I+axWGzgf6D8tzU3hRr0pwQV7uqAukxqv8CJHOCb9blJS4SccKrA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xB62d-0000000DL9B-0Xwl;
	Mon, 28 Sep 2026 09:44:51 +0200
Message-ID: <04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/3] selftests: run tests on nommu architecture
From: Johannes Berg <johannes@sipsolutions.net>
To: Hajime Tazaki <thehajime@gmail.com>, linux-mm@kvack.org,
 liam@infradead.org, 	rbm@suse.com, akpm@linux-foundation.org,
 luto@amacapital.net, 	brendan.jackman@linux.dev, david@kernel.org,
 liuhangbin@gmail.com, corbet@lwn.net, 	kees@kernel.org, ljs@kernel.org,
 broonie@kernel.org, mhocko@suse.com, 	rppt@kernel.org, shuah@kernel.org,
 surenb@google.com, vbabka@kernel.org, 	wad@chromium.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-um@lists.infradead.org
Cc: geert@linux-m68k.org, daniel@thingy.jp
Date: Mon, 28 Sep 2026 09:44:49 +0200
In-Reply-To: <20260926010819.604346-3-thehajime@gmail.com>
References: <20260926010819.604346-1-thehajime@gmail.com>
	 <20260926010819.604346-3-thehajime@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Sat, 2026-09-26 at 10:08 +0900, Hajime Tazaki wrote:
> Architectures lacks MMU doesn't support fork(2) syscall and only

nit: Architectures lacking MMU don't support the fork(2) syscall ...

Not sure where this should be merged? I guess selftests would make most
sense, but you can't actually test it out before the UML nommu changes,
so that doesn't work too well right now?

johannes
