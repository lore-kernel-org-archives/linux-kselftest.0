Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D361A4EF140;
	Mon, 28 Sep 2026 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612597; cv=none; b=m8iE3bptAJicNB5FAyEJAiYGibQF3MexzSlbd+onShAYX5RyoKi+lL35zi9hHxOYIjKIo5/Tf6ZpIGSo6vCmLMyQ09bCOHADOhGF4Uq4W2MIZXCjf2EBwLDnVeAoX7HLiNPR6k8jdZzAwIattOBbJxq2LaaMZX6WisTVCHMsmko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612597; c=relaxed/simple;
	bh=dNDAcGHNy09VRA5c5vXMv5G1dwyTJJ5okykDl+SczM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbAFtd+w1E8xW7yToOznlj0ZCji7mDfhm+HQuBQAnExWTROJNeTeVOb728OlcmPlhPfECd731zl4yxGfbpYywO5UowvL/IrSeuyY8yNBPtCJlWiXJlezfhkeA4e0VG8A2k7W2qSJwzrlOY+bcHA/xm8Iuqf4EMSMSWWs8qUh1Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdKe3Puz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdKe3Puz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C8B1F0089A;
	Mon, 28 Sep 2026 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612596;
	bh=dNDAcGHNy09VRA5c5vXMv5G1dwyTJJ5okykDl+SczM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AdKe3PuzxBeIfMRzAElN7KJNlKqTeYxTv3RiLkw/Qz7zSVjL8rh3hz+brQG9Rl0bw
	 4FC4Y6iUVl8feOfDgHg3UMd8MhU6S6JawTo5suISocRvxaMFCN044OBdhh8q4QSPzm
	 +84ocNwkhgBfQ1aDLsOl181/6k8blbWN99FN7JDQx3AGzlJNTzWmITGFdRp4WIzIu4
	 jYZICQBD3DbSAThjkRuJHvNzQorEuRquCsQq8bHfEy+9Eo49vSzkuMj34fUFRYF0ow
	 SlysURxuHxAAvgD/PtsHtPh4xlw2nSGiLzbixrt35t5zyhNs9HZSuzvytQul8CXo5P
	 asQRSILi8GvMg==
Date: Mon, 28 Sep 2026 17:23:08 +0100
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
Message-ID: <arqUVCrA0rC7-c0b@gremlin>
References: <20260926010819.604346-1-thehajime@gmail.com>
 <20260926010819.604346-3-thehajime@gmail.com>
 <04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>
 <arpIi5QBG1_MuZzJ@gremlin>
 <8dfc0ec9ed660e373451c96b6fcc352c35a6a004.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dfc0ec9ed660e373451c96b6fcc352c35a6a004.camel@sipsolutions.net>

On Mon, Sep 28, 2026 at 02:32:50PM +0200, Johannes Berg wrote:
> On Mon, 2026-09-28 at 12:00 +0100, Lorenzo Stoakes (ARM) wrote:
> > > Not sure where this should be merged? I guess selftests would make most
> > > sense, but you can't actually test it out before the UML nommu changes,
> > > so that doesn't work too well right now?
> >
> > I seem to recall Hajime saying he tested this on an actual nommu
> > device/virtualised equivalent so nommu UML isn't strictly necessary (though very
> > nice to have!)
>
> Oh, I don't recall, but I guess that's plausibe.
>
> > I think I saw something fly by that implied it might be coming in 7.4 is that
> > so? :)
>
> I did end up merging just about everything that was pending for
> uml/next, so if we don't forget to send a pull request in the merge
> window, or something equally catastrophic happens, yes ;-)

Awesome, thanks! :)

>
> Sorry for the delay. The onslaught of LLMs means priority is elsewhere,
> sadly.

Yeah understood, onslaught has reached all areas of the kernel it seems...

>
> johannes

--
Cheers, Lorenzo
