Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E92837F010;
	Tue, 17 Mar 2026 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770752; cv=none; b=e1rPTjFDKVarlgDgwn+jrRQuV+6g7F30olDXE358I7qnirJHUhcvrob2YzSzuqk3elm0oZzgdoRa9Sm1f0cNZ9cxgtIaW9IyhcK5a+DtL7tjdyh7zY24cj6IumIoR+PE72p2ESl36SKEvN475pkTCYc8Ri7XVxQN3Pbx8BpWTiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770752; c=relaxed/simple;
	bh=3ArJN589C89+JkAi1EfZ0uwUa9vVaRWK9gMK5KH7weI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SwVDIRuAInnMtztz/+UzD4/UT7NnWJ+7mHJi0gjqA6roUaNGDcwmtUXJQ1M9eiSmxYsX3JJhRCjWCOLVKUnQSO8pXEPZtIabAjIw2V+Gm0pRRFLyHgDoq0OcrvvOBh3aDPEGuNxIf8tW/59a3ELGhUt3KOZPONqEiDhJ++MtWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNi38qqY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNi38qqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EB6C4CEF7;
	Tue, 17 Mar 2026 18:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773770751;
	bh=3ArJN589C89+JkAi1EfZ0uwUa9vVaRWK9gMK5KH7weI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JNi38qqY1n7aU8r2YZPiI30P7HsOIwgBFbFJnQntYU0jHzL7C41/QCmF2xv2J4tyY
	 fXJnGPhF2UlE9+UvWA8mO49gFvzqJnQ1Dnii5tHPja5F7ssVSPajSaJNSl8dyrRgmy
	 O+7UPAqR4A87UcQJNaOvF+HskLc/ldskJoLRtjcTIh6K/7Lknrv/GU+1z3cs9x5Vuq
	 klngnq+tT37ojEtch8d0lYxIrKinHFeDSG9zKFxnw/6wiooezO7L8DP8L1xIeLD77n
	 w5NW3SOEMa32RG1WHwzgxgf/6/P7i+WN5DFXHN7lc1CYKERECGMC3XdgxqS4Z8XVUz
	 o7ReVzjo3TYzQ==
Date: Tue, 17 Mar 2026 11:05:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, willemb@google.com, petrm@nvidia.com, dw@davidwei.uk,
 mst@redhat.com
Subject: Re: [PATCH net-next v3 6/6] selftests: drv-net: gro: add a test for
 GRO depth
Message-ID: <20260317110550.3f79c4e5@kernel.org>
In-Reply-To: <20260316224505.279672-7-kuba@kernel.org>
References: <20260316224505.279672-1-kuba@kernel.org>
	<20260316224505.279672-7-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Mar 2026 15:45:05 -0700 Jakub Kicinski wrote:
> +                status = "PASS" if received == num_flows else "FAIL"
> +                ksft_pr(f"flows={num_flows} attempt={attempt + 1} "
> +                        f"received={received} wire={wire} "
> +                        f"coalesced={coalesced}{qstat_str} [{status}]")

I'll have to repost this, [FAIL] is confusing NIPA.
