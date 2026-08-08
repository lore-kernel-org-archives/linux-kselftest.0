Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463E1862;
	Sat,  8 Aug 2026 00:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786147750; cv=none; b=AyF5Em4CrGJxxjifHvfkABzqAGJzNj6lpiqVQ/+tB4dUtCMciMelnDSZB5GN96xBg4emba5A+v5jNm8t000LcFzt9tA63uRufMAt2jd4tkDFXuSlFhRQW9k2XTZfuQ81rfSMJYOA49vttgwqZ65Ag95sWCk4wvyghAzg4d/o9+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786147750; c=relaxed/simple;
	bh=WDhmCUg4yWvgXHmiU3YzsWf2xKVpXYRfFdoiy01rbqE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3LXTtNzF4IuxsoaZRHdjpGvy7xiupby61l4dbvtFS06ayy0RUqXcKShUNswDYgTddPUsklGMH22R3Wh70bEt0c/ygzaz5XzdY9ZtQeFOOT8S9KQuGB3ijRpKYmSLTRc5aKBseblIaEG58G49pxvsAKP+YF/wEs7gbFZtpLov+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdwQNeF3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdwQNeF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141C61F000E9;
	Sat,  8 Aug 2026 00:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786147749;
	bh=WDhmCUg4yWvgXHmiU3YzsWf2xKVpXYRfFdoiy01rbqE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bdwQNeF3UUfDRYoPlZYSj/LT6odCoR30/4GdAe6f4wKPN+CjGWK2kNnjd0OVvG1hq
	 1UnTVwWqCHwQuIhC2XmhgdzyC4Irfm9DCco9m/sJkw4DqLW/dgRhCCNHl/I6j1YJo6
	 MXSJSBusfamVtJkBoli+pZw8S+MOipHUqyI5BR+oVYKIriODwN4+apl/QBtF5zyuGZ
	 XlggUybvyeNRWpnnAfW85G94TDS4vsPqY/2cUqThBEPvYEk4/y36wPAgMii7fyRNXb
	 00AVSXfayfF+Tww64C6oWY1f1h+AWEZb155ILsXH7CldIwRKOXqs6GPJhIQU499kmz
	 Gned/lZrpMUSQ==
Date: Fri, 7 Aug 2026 17:09:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gustavold@gmail.com, asantostc@gmail.com, kernel-team@meta.com
Subject: Re: [PATCH net-next v2 0/2] netconsole: replace target_list_lock by
 RCU on userdata hot path
Message-ID: <20260807170908.53188cee@kernel.org>
In-Reply-To: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org>
References: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 05 Aug 2026 03:58:18 -0700 Breno Leitao wrote:
> I would like to move netconsole to use RCU on the hot path for
> a while instead of target_list_lock. My goal is to have no lock on the
> tx side at all and eventually drop CON_NBCON_ATOMIC_UNSAFE, if that is
> possible [1].

Bot says this didn't apply when it was posted.
