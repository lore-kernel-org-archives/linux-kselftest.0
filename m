Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EF0489FB9;
	Mon, 28 Sep 2026 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593229; cv=none; b=qzEdG3noKwtezwOFXr3waiuX/UdHMrkGGy3Inxm0QZGtSAGp6ER6AzwOv5rUkn3T9UhkFnlZzpgcEOwiwSkpEDbNl1ODsMhGZHrKDvUsQU31OT5bPORwAmeyhHLOpVmMYkVSEwp0/HlDzqhj+L+LBzdLYcDHee4+Iqc5GGTIExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593229; c=relaxed/simple;
	bh=W/VZm44XzSsz564iDu6yls171Wz+1fQyfbWB7NPC/qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqaVoeRG720QyDOxYFGDbTXMwuN7oBJJusMVVNWmpwihjFAUBxl2gRZD/D1WxXsZzm6zAH847LYQt8jw7vKgjibb4fQtd68pWQ4oEquCcHJFMfWfDuyj5RRsm+lJNSOh3570zvGgMMv7nGSbxwvwofw4My1dq00SIvWEQRah9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCMQw9cX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCMQw9cX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852161F000FF;
	Mon, 28 Sep 2026 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593227;
	bh=W/VZm44XzSsz564iDu6yls171Wz+1fQyfbWB7NPC/qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCMQw9cX13xqhIwBzSMliTFI1BR50NKpER6op4F/axoQCrr9l0XXf6aKT61a2MYnZ
	 5capFidkNb48gSEu2nhvuhjUmkOoDQEfunJtlKE33rLoPt/132APCimNjZZlyAnfGo
	 BgCXLAb9ZOJGA+56e3kydME3r/Rqy83Tazx1Hgk12gMgLAooFzIbdO92+wgszDwoI7
	 0wcOm97VS0aIQkcxex3zRx0W1YJhM3LnzW3wvpPufqpPdX1MU9kssrpgnzzKDjtoez
	 tU76c1ClWcl1zqN9EOl4Ujjk7ElqmJTjv6Z92YxS/B01A0Me3ruXGE38icwJuqHZhX
	 mysf0URYpxqRw==
Date: Mon, 28 Sep 2026 12:00:19 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Hajime Tazaki <thehajime@gmail.com>, linux-mm@kvack.org, 
	liam@infradead.org, rbm@suse.com, akpm@linux-foundation.org, luto@amacapital.net, 
	brendan.jackman@linux.dev, david@kernel.org, liuhangbin@gmail.com, corbet@lwn.net, 
	kees@kernel.org, broonie@kernel.org, mhocko@suse.com, rppt@kernel.org, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, wad@chromium.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, 
	geert@linux-m68k.org, daniel@thingy.jp
Subject: Re: [PATCH v3 2/3] selftests: run tests on nommu architecture
Message-ID: <arpIi5QBG1_MuZzJ@gremlin>
References: <20260926010819.604346-1-thehajime@gmail.com>
 <20260926010819.604346-3-thehajime@gmail.com>
 <04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>

On Mon, Sep 28, 2026 at 09:44:49AM +0200, Johannes Berg wrote:
> On Sat, 2026-09-26 at 10:08 +0900, Hajime Tazaki wrote:
> > Architectures lacks MMU doesn't support fork(2) syscall and only
>
> nit: Architectures lacking MMU don't support the fork(2) syscall ...
>
> Not sure where this should be merged? I guess selftests would make most
> sense, but you can't actually test it out before the UML nommu changes,
> so that doesn't work too well right now?

I seem to recall Hajime saying he tested this on an actual nommu
device/virtualised equivalent so nommu UML isn't strictly necessary (though very
nice to have!)

I think I saw something fly by that implied it might be coming in 7.4 is that
so? :)

>
> johannes

--
Cheers, Lorenzo
