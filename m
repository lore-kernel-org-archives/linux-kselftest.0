Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7394183B9
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103363; cv=none; b=BkxoKUIxqUe7J2BgygMFsUfKJGb7nIEHjfOabNzCTfcGSiXZeMPE9s7D5YLHqh0QMdYD3m3png4VsxVEIFZwjFnNZWZranrtbv5XbUUej//0YbsL4bkMwEzMk3kwv5IJrb3TXT/5vaPbfWWT7op3hvwf4prfv2pytbjJjR7lBpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103363; c=relaxed/simple;
	bh=X7+Cv8Bb9qb8b1fbrWJhVh+rc8ueXbHScx2A3ROcmgE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTGtzrJ9ovy0cZgEIoFQj8O4NtmfW8cfd0+harAtX7lP8+HrZZ9HmFN5CTCe2h1aUsmQzRIBs9EkbhDOCKfenfG6LfZMkMR1NlnmwuyR07Tn4OA5QzS0Mesz3ZnsiZx0SPp0bRmVPA/ma91MeeQDO5mSqLGQn2wygQl26F2UbzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCWwHn4I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCWwHn4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC471F00893;
	Wed, 10 Jun 2026 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781103362;
	bh=X7+Cv8Bb9qb8b1fbrWJhVh+rc8ueXbHScx2A3ROcmgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kCWwHn4IZIjNGzQUwkmhpPnjO8exS7q54d+uvsdZpE5dj/2yw4oYZ8GIzRS+kA6Mk
	 SdObN/2hICAruf9SuwN6q0uDH5NeUB6bWWqujJahn+k5A+y4QQfhOWz14DXSUozkFK
	 dMpMgwYz4sc5oDOP9teRwTFr3aa4fFo6lhWIdzfZuveTY9E+1kKOin7qqR0aBX+Kmd
	 2Cbkdm9OERgs1SGi55+vmekjUcJw8Ewes1qJ3EyKeR14FI+IgJfGMDVCTeImpk91mm
	 gDHXhPxF6aOFDu1RFIIKWaV9Nj6wJBq7IazDRXqCY9jzPI/syRa6M9pxh4EVjth9Jc
	 P5i7JlqgmegLw==
Date: Wed, 10 Jun 2026 07:56:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Pisati <p.pisati@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests: net: fcnal-test.sh: rmmod br_netfilter at
 function exit
Message-ID: <20260610075601.1e89c1ab@kernel.org>
In-Reply-To: <20260610144618.35252-1-p.pisati@gmail.com>
References: <20260610144618.35252-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026 16:46:18 +0200 Paolo Pisati wrote:
> fcnal-test.sh loads br_netfilter to test bridge-into-VRF scenarios but
> does not remove it at function exit (the second modprobe around line 4158
> has no matching rmmod). Since tests run sequentially, any test running
> after fcnal-test.sh inherits it.

And why is that a problem? As a general rule tests shouldn't unload the
modules they loaded cause something else may have started using them.
Also you did not CC netdev@ on this.
