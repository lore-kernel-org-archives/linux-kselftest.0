Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D73C73F7;
	Mon, 28 Sep 2026 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598783; cv=none; b=oRM4H/yj34zVBlTnCV6klXpRwRxNjokwZK9FYoEuDTPbRcOjvuJzGN1I3RvvncFSwhU0hUVWvIyKBZqZZnWjaVawuXHrgDat80WFADNFr81JOikWDAjQE/E9fyicThQ+vffvSWT3bxrWaYvJRJAgGCmT6nkjrv2bFnUWJYxcu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598783; c=relaxed/simple;
	bh=Iya9wujgQEdqUfmH+V2H4et1ziGVCRoqLQ6GAz7eQu0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxQUMmWpKHqramclACeGwqOvFLJSWW8P7ayBzXGABZZV1SOrPvY4dtXv85dc8hOTJ33V6U2peZdCsJnCFzZFHlxRnSHVMwYgK9tAsutXyaOOjuQab1u51vJxFp6rpLOl5eXGGn6kockpEF5f3OinzlgGUuZkbH8wKvJBZG1v4Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=v4gh2dMD; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="v4gh2dMD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Iya9wujgQEdqUfmH+V2H4et1ziGVCRoqLQ6GAz7eQu0=;
	t=1790598781; x=1791808381; b=v4gh2dMDUsVDk+sg2amC8alPBTQ4LlH14hjBEtXiEF85h+g
	gUHisUAIie+2SR+5isvFeY5ceq6PBTAYJn61cbPp+X/HwQWhawio/uJXeJDqt6xUyRYri9HJMa51d
	otoG7ReWnM74Hl9BVReg5ciwWXkRW64ATzMnQqTbBJOw+1BpCEOvW0IGypa4VLD23VIh95CZfBnSV
	nPk7ueYXUc2rzoUVoz/wNd+Km9T5H98UFqshUQDW1gKZZK1xz5DhlBhBrI/n37xRKZ+tOeBEX+oQf
	MQK3XJs4gKME7w+UMUlYE3JzuQS5DLcgaD8O6Qy/lVNbTC0PK/8IMFgRsf51vSdA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xBAXM-0000000DXzf-0Rx8;
	Mon, 28 Sep 2026 14:32:52 +0200
Message-ID: <8dfc0ec9ed660e373451c96b6fcc352c35a6a004.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/3] selftests: run tests on nommu architecture
From: Johannes Berg <johannes@sipsolutions.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Hajime Tazaki <thehajime@gmail.com>, linux-mm@kvack.org,
 liam@infradead.org, 	rbm@suse.com, akpm@linux-foundation.org,
 luto@amacapital.net, 	brendan.jackman@linux.dev, david@kernel.org,
 liuhangbin@gmail.com, corbet@lwn.net, 	kees@kernel.org, broonie@kernel.org,
 mhocko@suse.com, rppt@kernel.org, 	shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, wad@chromium.org, 	linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-um@lists.infradead.org,
 geert@linux-m68k.org, daniel@thingy.jp
Date: Mon, 28 Sep 2026 14:32:50 +0200
In-Reply-To: <arpIi5QBG1_MuZzJ@gremlin>
References: <20260926010819.604346-1-thehajime@gmail.com>
	 <20260926010819.604346-3-thehajime@gmail.com>
	 <04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>
	 <arpIi5QBG1_MuZzJ@gremlin>
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

On Mon, 2026-09-28 at 12:00 +0100, Lorenzo Stoakes (ARM) wrote:
> > Not sure where this should be merged? I guess selftests would make most
> > sense, but you can't actually test it out before the UML nommu changes,
> > so that doesn't work too well right now?
>=20
> I seem to recall Hajime saying he tested this on an actual nommu
> device/virtualised equivalent so nommu UML isn't strictly necessary (thou=
gh very
> nice to have!)

Oh, I don't recall, but I guess that's plausibe.

> I think I saw something fly by that implied it might be coming in 7.4 is =
that
> so? :)

I did end up merging just about everything that was pending for
uml/next, so if we don't forget to send a pull request in the merge
window, or something equally catastrophic happens, yes ;-)

Sorry for the delay. The onslaught of LLMs means priority is elsewhere,
sadly.

johannes
