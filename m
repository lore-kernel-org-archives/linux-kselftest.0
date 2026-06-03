Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BD52652AF;
	Wed,  3 Jun 2026 06:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469530; cv=none; b=BHUtbl0FBwy3QqJOubEzs19/PL0sEq2Hn3+7uWPPGAZn2B/et+ZqaXB26cAuOOeRcNVyTHMNVMlnts2urH/QoZ4oI5ZsvAaEpgoEft6Iuny68bSZTA/cOzfp65UkOjuTXOY6bI03nUOxXDu/9LiP04q/eMV5z4ekRSlQwS5hUC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469530; c=relaxed/simple;
	bh=tGGYAS/IexlJYpq2Sqxx65gZbCGurBzM7D2SxQTTdA0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sxQHUmEv6SX3dhBO6FxRVI9hnMe6PVfYTl3n49czVw4uG3WuZfglMrSTI0gCPLkoW4VHtgomdqG49GYi7jf/IjpQvofIamoUnarVGnPxsZ3V3JU+qxeEw7xnzPwLyXs53tUMQHfNsPOVshYLFdw09aMcCwt5F8lMmfMcOSjLWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5OZ0l4i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5OZ0l4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F3C1F00893;
	Wed,  3 Jun 2026 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780469529;
	bh=Xz6Wac4dFBhlZu9nlXxNnHAnl4msktquKY/eR4n6NfM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=J5OZ0l4ipDVsuhKD3zeAA3+kRDn3mJrhMzJ8bMuR/1HJU7Wvw8qy+Hr1TgSzT63Pj
	 hjdKNCqH1cgOXPvOiyWxQ+I33Z3qdEJiLFBnKvC48d6K2k083loJKmGhvgPX01XQpw
	 ECyf0L1tqscWRK3PfRZEYJqnebKN6cTT9P+YjaIbLGYZt6qp6hC2MFdh+VT7A396A8
	 +4kWhrv9hBq8Y6BZI3xYqit9B+uclK6AyOe1YMJpbRooF71wSo1ASk84/keYiTVPvx
	 DEqrX4IWvBMcZB+79jPqrAci9MAdQWc6r9/xoMtqFzoGNtPCZ9SjU4hIK9PrI9G9X9
	 Rh+uAzD4eHEMQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 02/13] liveupdate: avoid mixing cleanup guards with
 goto in luo_session_retrieve_fd
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260603032905.344462-3-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-3-pasha.tatashin@soleen.com>
Date: Wed, 03 Jun 2026 09:52:02 +0300
Message-Id: <178046952227.468621.16091000479096712016.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 03 Jun 2026 03:28:53 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> Refactoring luo_session_retrieve_fd() to avoid mixing automated
> cleanup-style guards with goto-based resource release, which is not
> recommended under the Linux kernel coding style.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

