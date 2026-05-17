Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F23C37A5;
	Sun, 17 May 2026 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038713; cv=none; b=aA+L0+jazeyj8GEHOGvPaSp5M4PlDrg0s3zFihuqgOkD30VtI/CDZfrO2QXINzA+fugI/vKQZQQQh53e989RJaLN34rgW0P7fWJok0BbhoV1c+mi8rc9zc7R/a1UnfskPA+9oR0iGDgHYh/GWrDLyU2daKiqrVfDY73CjGMRH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038713; c=relaxed/simple;
	bh=dhS9wVv40cgOex3fqEGWAJwNPN0dvGp8u4KcgCsmWV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jdn5lAnKYoBUZiKFNOZ4vpVv+oYypn+VYDME2QpoihVyaX1yjZ5AvE9PsUpLBc62cnrzhE1V/KHzb+hwSRDZEgHxo5O12h/Rx5aSMqBo/hOifbZOpjNEMgZM5mPcawXsNmj/B5RHYc8ieCjWeeidkRemofjnLpIRQ5U/e0DP/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKvjCb+w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKvjCb+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D36AC2BCB0;
	Sun, 17 May 2026 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779038713;
	bh=dhS9wVv40cgOex3fqEGWAJwNPN0dvGp8u4KcgCsmWV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKvjCb+wKRGA9xiiCNbRlqsxXuUdAB4R1A/U0fGy180AVGpyQhHWCIZyle1QqYBL9
	 X1S8o+7dJztCIkngZZmyOti6FuvshZ5IxQ5HzImT3wBfj05+ljzNuC3yN8at6VCwTJ
	 KVm7QVCGtFvJIHtTdl1t4/qX00JkcdCM3PlpfyfRHJZs+Jw7TjKCGj4yi9aGQlGGZ5
	 OUwk7sXt8f271KeRvmGmzDszytUKK7MgQSQ9U1SCWplSyTYyaU12+Eno9c7ytzXxSf
	 1S4Rb+H9f1eagWaXhLxyfdMBzjCWILZifNyk7j+3D93YalZOE1sEFndj7Rb+9NjWGr
	 gS1NDt/r92Wcw==
Date: Sun, 17 May 2026 20:25:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 03/10] liveupdate: Extract luo_session_deserialize_one
 helper
Message-ID: <agn58YPpCkkKFfWA@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-4-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-4-pasha.tatashin@soleen.com>

On Thu, May 14, 2026 at 10:26:21PM +0000, Pasha Tatashin wrote:
> Extract the logic for deserializing single entries for sessions into
> separate helper functions. In preparation to a linked-block
> serialization for sessions.

It would be nice to mention that this is a pure code movement without
indented changes.
 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_session.c | 62 +++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 26 deletions(-)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
