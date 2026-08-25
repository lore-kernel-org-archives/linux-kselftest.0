Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF19330678;
	Tue, 25 Aug 2026 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646748; cv=none; b=ea0m3/1wOsMpJauGsH/yZijHgK94cseoqtvA4GEAcSaj57pVs8zoJxXOd9ZyBzgh9n0Y6hg6TNG2/kgZGt6Q8XsbUBkDHlsGmFAeEf2LRARnrrI6Xju0gpGRYFJocjbTW/ngkpdzdN0M3H16P3EiF5puNYrB1PLm0DuedIejxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646748; c=relaxed/simple;
	bh=exrcaZjGIjK8G2IqMQWrShw46L0apv1j1ubQCxK3v2w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iAN4/OUyzfDmmG0G4gghxvLElhwgBfd3KtIJvuFe/WwbArMsgdRpA3tEK+qqslVnkIxYA8DIZv3GFY8w3Hjdqm4ToY3FdNlGXGsga495oIPTpPxg+VIHeQghI6J44FkCP4BnZxuipSWXCf/7lnVukpnkYdnbKlYZP3yEwyDnJmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9aaTW+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9aaTW+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4C31F00A3A;
	Tue, 25 Aug 2026 08:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787646747;
	bh=6rN3S2beh9Tyeh10Y29/aJvsxHZZboK0PSMeoZLdbCY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=n9aaTW+crqmxwV/08eQy0jAa88CdQgK+W3Zkbxrgxb+aj1/fsGCQfCSeaZWOuIyYc
	 HN78t6Rr6xPMOhdfM6wtaUIgU+ReBvATRdIpSNIDQgIid9LkOQ/TUz8Hx8GmUci7zK
	 vXwcHG91TqbBD7nO9MuFiKvAO4qowqGoOYCCK50kkImBrGecuGhhhHov9370blqTMs
	 2s4+gsBp2ZVaPAObugkDLFGjqN4G3nuRDHV7GA4emTPEarfHys9+rvbMcUJn+Vkyl3
	 9tcm90eAeXMfnjo86U5tNG+Dx9dtP5ojBi3ACu2Cb7t67ACq9xGbWvuhuRvEduLTG7
	 OY6igSL+pcaoA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0DE681980058;
	Tue, 25 Aug 2026 04:32:25 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 25 Aug 2026 04:32:25 -0400
X-ME-Sender: <xms:F1ONauALEUqxCPIH41hWvVTTgW_U28we2Hop7pJOQHYrpzmE4vhSvA>
    <xme:F1ONajUi_OefaQH0GlzWxYojaeD1RrNTImWY4EZSti0oEDoxe1IxvubJFmirryZHD
    rsqRFAozgu7CX9kvJRZ1JX8Uq5b1wI3bkSiWXakQYPnrcmGUjfCgODJ>
X-ME-Proxy-Cause: dmFkZTGK0tN9/RAsM7Y8miVlqsk5cBOZGwCkW9Pa9CpE9zZXdk8hx77HhGWQTEH6LcEIn7
    SANF9G/4+lj50xRooPCKoMRHuZluaTCp3dRjP2IYMqGgCdzYX4o4eeLcH0/g9sMPPmLbzK
    /amBM4F/I/cRbSX7hkHz38/nGJP18tVmvarMTIWVFmTIrCoTfUQvHHQqiofkkBsI1WN6q3
    cqRPuvbofYn1jr2b9ouoUr6I76x9OISToPzjzpCddCCBE6NZHvHB2xr8HDDvQ4Vm6OlljJ
    Ulc7LIm0hZjZ8zTZ8css4/I1HIZEkp9euzhfIEDTL8etJZc1dQ7WHhtD/iYAy96jWiFPsv
    i6JNy1pqOU++kWpWPODwjnMxYOQ1clq78m8805jpq/s0YpNKi0bTelLjgKpwettcN5zIDG
    +9fLFoCuL1AKhJ7i7eCzdp+n2c9630T5qQKOaZtsKgYl0B4Q3/P0vZrCnhXXiQ+V99PSru
    5G2wxKHQzKUrUSo7ZnoIyZ2Nhsrjd3W7m/xuX4reuYvMCTD0Sb+9o2BkdytPdl/gNIF8lL
    yYYwqCumsnKiEOAZ+LjUEZOg6iKqhcJnzjxm8WB2u5g+4ih/23A9iIY4BSw40sF5J/hTm9
    MWzn4rCSn1ft5mea/ZbrOC4aQ6R+8DgZOSU47y5nBIHgGaauud1IHJp5WFPg
X-ME-Proxy: <xmx:GVONakCacI43ILvRTY468jC-5qierYlMvubMUrEAN4J2fiHwkpnjdg>
    <xmx:GVONahdMtxJY5mrGNnqGdjv5x9nOQO1Dl-8gShRQ6RQwGnboVzPi3g>
    <xmx:GVONammGpMsA1bh7RfCqF7F-NY3LeWPvWKaKFwg-3OysrsjhvI2uEA>
    <xmx:GVONagGVaXsqI0qyMAikS_C1pRS3HwROcaDxv-9UmNA2HcfnCZSSLw>
    <xmx:GVONam4zA46V-2wZDFOp2EWtO5V2WIlTsT9bjOeqT_F7ay28kngH2QF7>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3FD5BF8007A; Tue, 25 Aug 2026 04:32:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 10:32:02 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Christoph Hellwig" <hch@lst.de>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Eric Biggers" <ebiggers@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <0a6500bb-948c-43a5-80e6-307ffa9c9d1a@app.fastmail.com>
In-Reply-To: 
 <64c6e0191bd8ccef0074ffbb09bd0584680d710b.1787584360.git.geert@linux-m68k.org>
References: 
 <64c6e0191bd8ccef0074ffbb09bd0584680d710b.1787584360.git.geert@linux-m68k.org>
Subject: Re: [PATCH] raid/kunit: Enable RAID6 PQ and XOR benchmarks if
 KUNIT_ALL_TESTS=m
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 24 Aug 2026, at 17:14, Geert Uytterhoeven wrote:
> Enabling the (possibly long-running benchmarks) by default may cause a
> big delay in boot time in case of built-in tests.  However, they can
> still safely be enabled by default if all tests are modular, as they
> would only run when requested explicitly by the system administrator.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  lib/raid/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>
