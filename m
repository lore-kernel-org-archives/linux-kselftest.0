Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C337CD45;
	Thu, 12 Mar 2026 03:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284890; cv=none; b=ccvOcDkaciOUorWGS294zERj6RWJHrDSrjf9xL5G6Ro/6zFhKoj+s1i6mLvFZ8qQa3w+BF11ub9HgGLZ97Fs86E1PTrzEA9lRINgG+PAHpXI/MrlBMBG29LkpOIQvVa8YnGrYAzhJHrTw8j+2LNQ6JoGCA6VlNTntJWwZ9R70rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284890; c=relaxed/simple;
	bh=6Jh5akto6GTbsD5SBDHoAtMj0y3raTEJ/OL+GEg6Nv4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxaMBdiDeN+eo0trm1lmPywWJlEiyM+oadmEdXGwqUWrAFqIwz5NuCYI2JMQWyNiZaPwTkJKtgYejV8+GmKaoN0av0l6MACwRU7qao1QTr4D83wOWTd4SlMcGLcXoCtykRwq+zySg+IW9tQvBlwJ91iEH1fAP1yuVVfWnH6tSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwzWAe3v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwzWAe3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F937C4CEF7;
	Thu, 12 Mar 2026 03:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773284889;
	bh=6Jh5akto6GTbsD5SBDHoAtMj0y3raTEJ/OL+GEg6Nv4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VwzWAe3vg4xkXf0PSS9T3X1PZT9cZEHUcCZ9181ArNBsA54kWnL+CNqMPPMsbS0qV
	 SxaosZWnMEovqygTfx019iWD+LMkZmeOpu3HKBqAkA03VOWoAq0amW7Ol7YQNk1k33
	 bmET2Kc8V9+ect7BQpYtfEBgKiAeKFrsdIwqV6U++GywUNtJ+e4iWZYQKOLd60Aygk
	 JV/cdnbU0GrRIIEBvNwkaspgWUrU7hQHuICBxkc7A88s8SrqM9TnH3q2l4RaF+/Q4z
	 E6+V5Bs9CtECkWt5cTXavSe6JueJFghdbHW5PqA10UQbVzcpqP++qCXHHGku18OJgS
	 fB315APd28Etw==
Date: Wed, 11 Mar 2026 20:08:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Aaron Conole
 <aconole@redhat.com>, Ilya Maximets <imaximet@redhat.com>, Eelco Chaudron
 <echaudro@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, dev@openvswitch.org
Subject: Re: [PATCH net v4 0/5] selftests: net: fix false failures due to
 missing features and host interference
Message-ID: <20260311200808.6287d90c@kernel.org>
In-Reply-To: <20260309152013.565216-1-aleksey.oladko@virtuozzo.com>
References: <20260309152013.565216-1-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Mar 2026 15:20:08 +0000 Aleksei Oladko wrote:
> Subject: [PATCH net v4 0/5] selftests: net: fix false failures due to missing features and host interference

Please post for net-next, "PATCH net-next v5"
