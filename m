Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634053BAD8C;
	Wed,  1 Apr 2026 23:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775087930; cv=none; b=f5y9S0iFgMF2m2yh67mzOZ/H3QxknzStGvF8AVxzfV5YONt2o/XsX1pQXHweHZDCik/M4s8VPYlevoC352iA1Ji3V2DULjSf6kxGenK+BVW7Ahdc3qybbZPsL4Qa6RSI9bMirBfkcDqQfCvcrbXrm09dfWsDFCyzG3WKLO84Fb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775087930; c=relaxed/simple;
	bh=7nbU16U0zLeYTBFzm8QkBhBZuwMLrkDQjPlA/qHkw+8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6JwVpctPzOUUnVFXxZ3/8G1tJCrz+NMRAyK3spgV0MkDb4uk7TyC6RyZgtWREhn5TjaQaAyK1Q3d3YoBhUkI/8TocN3pe9HDPVuCku1nFYpy8bmGPilWrypWb4hfM6vAGhtY6RN6+U7Vea2G0FKmfPuNmyMm0dfnIyD7ieqSzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBi4eR9A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBi4eR9A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD805C4CEF7;
	Wed,  1 Apr 2026 23:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775087930;
	bh=7nbU16U0zLeYTBFzm8QkBhBZuwMLrkDQjPlA/qHkw+8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bBi4eR9AobchAUuEOTQFoGyz11Htasa8mN38Clsu/RHSTSnioYNnmLHCZDWWwD13p
	 2UXkA+7tDrCI9mZxvvUsU26yCxfreEyU9OKW6cWzNR2JEjtCBVtJC7sEfsRJymPcvq
	 0QgynzWgEMQOis0SOk3sABlRS70oBOodaLDrr9ua0LU6GUZZzkRAP8+zWgDU3YnayY
	 49wNX5YeXOKYv5v5lleP2V7Vy/keIeJRRaHcbUxeHRQpFxBhps45FZ5XW5GYhwAQGk
	 erF1947ON59NwNCRHVW/viwoOIYkmTbf8BJ0ySliJJRrRL7SejnwNIbe/acUW+zQJI
	 usPLj4gUNp7eQ==
Date: Wed, 1 Apr 2026 16:58:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shuah@kernel.org, petrm@nvidia.com, willemb@google.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: py: color the basics in the
 output
Message-ID: <20260401165846.6aeddf20@kernel.org>
In-Reply-To: <ac2OJvW8ZfzDFtHr@mini-arch>
References: <20260401183309.378671-1-kuba@kernel.org>
	<ac2OJvW8ZfzDFtHr@mini-arch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Apr 2026 14:29:10 -0700 Stanislav Fomichev wrote:
> (not sure why you think this might be controversial)

I'd like the "libraries" to be minimal, so any increase in LoC has to
strongly justify itself. Whenever I work on something in ksft I tend
to produce a bunch of "improvements" of this sort but usually lose
confidence and don't send them out. The coloring thing has been
annoying me for a while but mostly in NIPA context (on the web).
