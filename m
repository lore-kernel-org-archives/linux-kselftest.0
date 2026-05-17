Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925423E358;
	Sun, 17 May 2026 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039440; cv=none; b=NwExni2lZKYxB4LH9A+6s4EXjdVajgDU05/ZR6sWoDVGRqONE3RraaQ/COiouSHTdl8DnRDXE51YwlgpFGXgHOdW7EAznAbLALMOpM8Qjm0c+64IaVBmQi+G2U0oLkv2oSGJnDGVHYH9LMAHxWjZIrYwq+ffJphLguEYKbBI2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039440; c=relaxed/simple;
	bh=heISmBIXKjYA/PcXWrm1JL8+liejO4P4u/DbNOAbEhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odnW2o7cWUo73FQfPlcH8SO3M8A214zmj5VEFUfrLPwR+hmASNYjl3oc8UnVPDfqdw37AxTYTeF+SdqnJp++oakDglHsE37CDaH0LzRzywwZjzrycbeS1dyRYC+iisUJuOestQ+ZqBBxdkNuMI6UdRykzNOYX6mSo2eCWgOUPsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4Z0tbN2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4Z0tbN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCC7C2BCB0;
	Sun, 17 May 2026 17:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779039439;
	bh=heISmBIXKjYA/PcXWrm1JL8+liejO4P4u/DbNOAbEhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4Z0tbN2A1OK22DR42hgCLTmeRx4VTbKz4jGtH+Duv3y3zMD8eOlMeywPQbDJigkk
	 44MEeSgbeqd2X9dYLqF0yonVJwYbAwZf/sUhwwJCar3JMyRiy9c8/fvAG19SCVNwrd
	 +tNl+6zcVvLhE4XlYh2Aj7AK9pOCAVHW9CO/nBPNUjIZdwjljqlVr4Q6E2EVUCHaFP
	 6H0Tl7m0pZjaz99wHUTGiWRdcsk01uHOSqHLpiNN342xAYkpxCu3O47oti0ct4ojJz
	 0Sb6x6hX07KDWMSRHD7w+1tkaloJgZQq9UHL4Zb6fWrJz0pepF+M/cgRzx9q4Av3m8
	 H8c0BE05EHC/Q==
Date: Sun, 17 May 2026 20:37:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 09/10] selftests/liveupdate: Add stress-sessions kexec
 test
Message-ID: <agn8yJVcdvPw8ZCQ@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-10-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-10-pasha.tatashin@soleen.com>

On Thu, May 14, 2026 at 10:26:27PM +0000, Pasha Tatashin wrote:
> Add a new test that creates 2000 LUO sessions before a kexec
> reboot and verifies their presence after the reboot. This ensures
> that the linked-block serialization mechanism works correctly for
> a large number of sessions.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/liveupdate/Makefile   |   1 +
>  .../liveupdate/luo_stress_sessions.c          | 102 ++++++++++++++++++
>  2 files changed, 103 insertions(+)
>  create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c

-- 
Sincerely yours,
Mike.
