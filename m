Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C01A6814;
	Thu,  6 Aug 2026 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043794; cv=none; b=NnXWkhtBujL5sneffz0PdzpEwRM/q5abWMl5rjjN9BZUTWMNYtdpvN9ZqGF/etrWR2i08ixr55ojZnEi2jmWffB9HSX8ZUS0U8noWm4/bdGvIV4Dq/xMhehVjSK5TJAtJ71XiqHDMN4DE52KO0XYe+BO0HuANwj0indxOnJk0kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043794; c=relaxed/simple;
	bh=zbQwSB/A9S98Iz3kJXF5JzsSnznoMvbXOeJw0BAUogQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0CCyYevTe2bCKp0irWKUgaP7AkP/tnupB12mL0DkC9PZy1i7FB8LZW9g7m40Uwrz3iaomb4n5Dtm0EucM2FgmG0CYESE2Z1UZJQO8R6K/Tdyk9ebXrK1wUnO4NjsnxadBRNOpqGBJqmAfQ2KZT3xlFRDJEB+EGxn4Mgo3MP76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zph5rF09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zph5rF09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E131F000E9;
	Thu,  6 Aug 2026 19:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786043792;
	bh=XqMUhfmX2ccfbKSaDVy4WHE9C9VEKfiJYT79AZvhRJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Zph5rF090EDz0aiXC3R8ayRMHgKh4zsvTXRo2rFaTYWgYVGuJZzBe/CscZ81FfRMo
	 RbZEH+rESnk+Db6LPCVEWC2CQEmkktsiS5gJb8kOoz/7sIxmCvtyJIGIF3657UQb2w
	 QVLln34DyYL2+xuYFUCPGk5qb21vD5O0035mNTEJMlUVXTltB2+/LvANgZBLfNvaI+
	 oHOreniRdlxQMz2lDaDtYVvj4wm7ij3ouigVRbiHCCYqANMmag59YxY4B9fzt+FT+K
	 sioVBk8bcfNAW6vrsCeWxMuDQo2inaD+d2RMmWaQHJGXbKGlZltJRV3vjCqDjwCplo
	 q4lIIJWcZukiw==
Date: Thu, 6 Aug 2026 12:16:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple
 flow steering
Message-ID: <20260806121631.13175f7e@kernel.org>
In-Reply-To: <20260803181852.491437-1-almasrymina@google.com>
References: <20260803181852.491437-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Aug 2026 18:18:25 +0000 Mina Almasry wrote:
> When configuring traffic for the devmem tests, 5-tuple flow steering may
> be required if the environment does not provide network namespaces.
> Pass the correct remote address parameter and fall back to 5-tuple flow
> steering if netns is not available.

Could you clarify what existing upstream test / scenario needs this?
